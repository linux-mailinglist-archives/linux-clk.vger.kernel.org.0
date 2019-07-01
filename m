Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE5E11938
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2019 14:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEBMhR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 2 May 2019 08:37:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50877 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfEBMhQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 May 2019 08:37:16 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hMAxb-0004Xp-QB; Thu, 02 May 2019 14:37:11 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hMAxa-0002mF-Gu; Thu, 02 May 2019 14:37:10 +0200
Date:   Thu, 2 May 2019 14:37:10 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20190502123710.2l6bahxslsb5usvv@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20190322215132.hz5ioo46zfl3tdab@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190322215132.hz5ioo46zfl3tdab@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Fri, Mar 22, 2019 at 10:51:32PM +0100, Uwe Kleine-K�nig wrote:
> On Wed, May 03, 2017 at 08:56:25PM +0200, Uwe Kleine-K�nig wrote:
> > Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
> > 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
> > SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
> > to 288 MHz because the initial frequency "seems too high to be ssp clock
> > source directly". However this isn't enough to ensure that the frequency
> > isn't increased later again. In fact this happens on my machine as the
> > mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
> > ssp2 which is resolved to
> > 
> > 	ref_io1.rate = 320 MHz
> > 	ssp2_sel.parent = ref_io1
> > 	ssp2_div.divider = 2
> > 
> > . The observed effect is that reading MISO reliably fails: Instead of
> > the least significant bit the second least significant bit is reported
> > twice. This is probably related to the reports
> > 
> > 	https://community.nxp.com/thread/290209
> > 	https://community.nxp.com/thread/310434
> > 	https://community.nxp.com/thread/385546
> > 
> > So additionally to initializing ref_io0 and ref_io1 to 288 MHz ensure
> > that their frequency is never set to something bigger later on. This is
> > done by adding a parameter min_frac to clk-ref and use that instead of
> > the hard coded 18 to limit the valid values for FRAC. For all ref clocks
> > but ref_io0 and ref_io1 18 is used and so there is no functional change
> > for those.
> > 
> > Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> > 
> > I'd expect this to go in as a fix as it repairs reading from an EEPROM which
> > should be a fairly common task.
> > 
> > It would be nice to get confirmation from NXP that this is a right fix and
> > that spi transfers are supposed to be reliable with ref_ioX <= 288 MHz.
> 
> I spend some time on this problem once more. I examined a machine that
> showed no issues with CLKCTRL_FRAC0.IO1FRAC >= 19, but reliably reported
> more than 32000 read errors with CLKCTRL_FRAC0.IO1FRAC == 18 when
> dumping an EEPROM that contains 32768 bytes that can show the error.
> 
> The boring to find insights are, that the error is independent of the
> other dividers in the clock tree that affect the spi clk frequency and
> hbus.
> 
> A more interesting insight is that applying coolant spray nearly
> halves the read rate (as reported by dd) but also the error rate drops
> to 0. After some time the machine reheats again and the error rate
> raises to nearly 100% as before.
> 
> I just shared that information with NXP's tech support and will keep you
> updated on their reactions.

The gist of their response is that this CPU is too old and so they don't
have much resources to spend time debugging things there any more. The
supporter suggested to upgrade to i.MX6 or i.MX7 instead ...

So we're living with the work around suggested in this thread and pray
it will continue to work for us even tough it doesn't seem to be robust
enough to fix the same problem for Stefan.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

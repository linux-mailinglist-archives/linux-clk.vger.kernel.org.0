Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326D71A9D6
	for <lists+linux-clk@lfdr.de>; Sun, 12 May 2019 03:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfELBIP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 11 May 2019 21:08:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbfELBIP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 11 May 2019 21:08:15 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 155A02146F;
        Sun, 12 May 2019 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557623294;
        bh=Z20a2po9n0851wFxAetxwi00fSX8OGtNnWeHUQ+viUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aBsu6jau4BSb6ujciX9JSmcnzYaqVmNgIBMag2Z7REg2VJnDuCv4DQOnS3zJsFqB0
         2277gl0TuPc8Ytz6Mc+yv+GopwLA+LjcmLntSAwjXYsmfDoc8jPSDPJxe18Qs4Vt32
         I+jQsjDVTl+wtLuK4YmK0+0ZFgxesyRDUgA5n78s=
Date:   Sun, 12 May 2019 09:07:42 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Leonard Crestez <leonard.crestez@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx6sll: Fix mispelling uart4_serial as serail
Message-ID: <20190512010741.GI15856@dragon>
References: <8776296d079b3b4d67d4421656238757a8ad373d.1556046082.git.leonard.crestez@nxp.com>
 <20190510032746.GF15856@dragon>
 <155750984356.14659.16650159344577092731@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155750984356.14659.16650159344577092731@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 10, 2019 at 10:37:23AM -0700, Stephen Boyd wrote:
> Quoting Shawn Guo (2019-05-09 20:27:47)
> > On Tue, Apr 23, 2019 at 07:05:08PM +0000, Leonard Crestez wrote:
> > > This looks like a copy-paste error. This string is not referenced
> > > anywhere so it's safe to rename it.
> > > 
> > > Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> > 
> > I see this keep coming, so have to ask you to fix your patch sender.
> > The base64 encoding makes it very difficult to apply patch.  I have done
> > manual applying for your patches a couple of times, and I thought that's
> > just accident.  It seems not.  Please fix and resend. 
> > 
> 
> I already applied this one. Sorry, forgot to send the email.

No problem.  Thanks for notification.

Shawn

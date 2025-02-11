Return-Path: <linux-clk+bounces-17864-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C343AA304CE
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 08:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6EBE3A48CF
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 07:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A446A1EB185;
	Tue, 11 Feb 2025 07:47:42 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701B1D5178
	for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260062; cv=none; b=mXjHawMs4jjOKhyCF2kTLbiF6gCH6f+KKYHg2VMW/1VhHbJJXho65c5x6i8371+QKovL9nCmo1AWGcManhLIGcRiwLvy7P1KZygBcpK6OnaS6os/sIGUuENQWwXCUupMiTwYiUgkP1sNugRDsHXAQGe7vZbAoskXdUnhKnDvYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260062; c=relaxed/simple;
	bh=bszsusd0ALXbiJ8cte6QhE6oJEsnWRz1Y0Gw+xAdlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsFA3+AJWyYfD9ylEEBjBJzCisZfLe0/Il0Gm9tJxHuiW9eH6gn3Df+SO8C6Tg+s/083JUiKIZDDyAfOdKEayLWcVj01niNvCfgInJbd1Xit5W8K//IPCNOT/PxPeR54RLBZlP7dvmhD1Opw9Nq8w/LXONQGnDwk/jSzr8ApOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzF-0007Hw-1Z; Tue, 11 Feb 2025 08:47:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzE-000NbY-1A;
	Tue, 11 Feb 2025 08:47:16 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzE-0094Je-0o;
	Tue, 11 Feb 2025 08:47:16 +0100
Date: Tue, 11 Feb 2025 08:47:16 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] clk: imx: clk-fracn-gppll: Support dynamic rates
Message-ID: <Z6sAhAM4mGZCDBU-@pengutronix.de>
References: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
 <20250210160012.783446-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210160012.783446-3-alexander.stein@ew.tq-group.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Alexander,

On Mon, Feb 10, 2025 at 05:00:11PM +0100, Alexander Stein wrote:
> The fracn gppll PLL so far only supports rates from a rate table passed
> during initialization. Calculating PLL settings dynamically helps audio
> applications to get their desired rates, so support for this is added
> in this patch.
> 
> The strategy to get to the PLL setting for a rate is:
> 
> - The rate table is searched for suitable rates, so for standard rates the
>   same settings are used as without this patch
> - Then try to only adjust mfn, on fractional PLLs only, which specifies
>   the fractional part of the PLL. This setting can be changed without
>   glitches on the output and is therefore preferred

I wonder if this part is worth it. There might be cases in which a
glitch free switch is required, but without being able to enforce
a glitch free switch we can't rely on it.

Also this makes the result depend on the current PLL settings, so the
result is no longer reproducible. I.e. switching from a fari away
frequency to the desired frequency might yield in different settings
than switching from a nearby frequency to the desired frequency.

Finally I think the glitch free switch doesn't work currently, because
the PLL is fully disabled and re-enabled unconditionally in
clk_fracn_gppll_set_rate().

That said, glitch free switching would be great to have sometimes.

> - As a last resort the best settings are calculated dynamically
> 
> Implementation is inspired by commit b09c68dc57c9d ("clk: imx: pll14xx:
> Support dynamic rates")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

...

> +			if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
> +				if (!dist) {
> +					/* Disable fractional part upon exact match */
> +					mfd = 1;
> +					mfn = 0;
> +				} else {
> +					mfd = 100;
> +					mfd = clamp(mfd, PLL_MFD_MIN, PLL_MFN_MAX);

With mfd = 100 this clamp looks like a no-op. Do we need this?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


Return-Path: <linux-clk+bounces-27268-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65FB4344E
	for <lists+linux-clk@lfdr.de>; Thu,  4 Sep 2025 09:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F7E586EA1
	for <lists+linux-clk@lfdr.de>; Thu,  4 Sep 2025 07:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F392BE7AB;
	Thu,  4 Sep 2025 07:34:41 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E42BE651
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971281; cv=none; b=AOLIGY7fLqri7kfIotfj3NAFuN16BRyGVQCe0WJcakkXiLspABufDvGe06vEjVfku4Q1wjkfogp74gDPp1t62gKb/N93aImXplFkRjW/00UZZ19KdYp7LKf3cD4zP5Yj9tzIp2WQ0p/NSlCcyAAgzA8oiiAOVLkQ8zJ3uk6GOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971281; c=relaxed/simple;
	bh=9Lfs7x06aYUGDh170BRagUu5k+P060o70Hk6IG+sLGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atiKBGywaj3BZchQKnD6Etw+zkCt0JR/MBafhAShpJPsGZTRTW7A22jk4p6jTp32cPiIZR4Bq92E/jEE//deBsctEVGSyJ47EQ8i89XDjH3UaNtmOzAeVKyBPTvtpY6ANRWPun1p41P/3LUY2TZeaTnjZd3Lm28czbhSA/L6fmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uu4UF-0006Gq-DD; Thu, 04 Sep 2025 09:34:27 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uu4UE-003gug-3D;
	Thu, 04 Sep 2025 09:34:27 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uu4UE-0025QG-2n;
	Thu, 04 Sep 2025 09:34:26 +0200
Date: Thu, 4 Sep 2025 09:34:26 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <aLlBAuYoHIJZLfiE@pengutronix.de>
References: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
 <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>
 <20250904-arboreal-upbeat-iguana-aebba6@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-arboreal-upbeat-iguana-aebba6@kuoka>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Thu, Sep 04, 2025 at 09:18:13AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 03, 2025 at 03:55:45PM +0200, Sascha Hauer wrote:
> > Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
> > Generator With One PLL, Four Differential Outputs, Two Inputs, and
> > Internal EEPROM.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
> >  include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
> >  2 files changed, 222 insertions(+)
> > 
> 
> I don't understand what is happening here.
> 
> Patch changed in weird and unexplained way - nothing in the changelog
> explains dropping SPDX - and does not pass even checkpatch.

I removed the SPDX by accident, will add it back of course.

Other than that, what's weird? Changelog says I now use the pinctrl
subsystem to configure pins. OK, that also changes the binding, I could
have mentioned that explicitly, sorry for that.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


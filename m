Return-Path: <linux-clk+bounces-23260-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47163AE037A
	for <lists+linux-clk@lfdr.de>; Thu, 19 Jun 2025 13:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0CF189E000
	for <lists+linux-clk@lfdr.de>; Thu, 19 Jun 2025 11:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4156227BB6;
	Thu, 19 Jun 2025 11:28:58 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A72223702
	for <linux-clk@vger.kernel.org>; Thu, 19 Jun 2025 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332538; cv=none; b=evO5iPnzw8Oq5sjKRo5oJpi/o+8+1rhEERAKzjMQlMGZR3NxGx8nMtlZ5DJxD4EQD/ou6x+PIed1ChlDlLH0yw9T+IZmcTqj5gq9Dq+aL+as1UbzAqnvVmDBV9FWN+N8tZ1LULwiCZ8g6NBBeHAt+tM6L/091A140ImB1i3lnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332538; c=relaxed/simple;
	bh=7ago14q1gQ9JAob84HS378yfaJHxlW6UjfAjq6a307c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkRqI8nfhCqTXUG5RLbZtrLy6gWxU92po0zyweVg2NHPZ138f4GDFNYerV+uqns2JZWHTxZuN5lAwJNbTI3X+vp9vnS8Qeac258RsDGSSof2o4YCuzuRYSTLybqFDYelrJkpNA4Lup8SrE8XR9u9GOFikgepOi3Is5IR5RX72GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uSDRY-0007wh-JV; Thu, 19 Jun 2025 13:28:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uSDRY-004I9Q-0d;
	Thu, 19 Jun 2025 13:28:32 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uSDRY-005PyJ-0G;
	Thu, 19 Jun 2025 13:28:32 +0200
Date: Thu, 19 Jun 2025 13:28:32 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: cdce6214: add binding for pin
 configuration
Message-ID: <aFP0YIgXndjTVyAL@pengutronix.de>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
 <20250618-clk-cdce6214-v5-3-9938b8ed0b94@pengutronix.de>
 <20250619-arboreal-jaguarundi-of-passion-a2eaa1@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-arboreal-jaguarundi-of-passion-a2eaa1@kuoka>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Thu, Jun 19, 2025 at 09:42:06AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 18, 2025 at 11:21:14AM GMT, Sascha Hauer wrote:
> > Add pin configuration binding for the TI CDCE6214. The CDCE6214 has
> > an internal EEPROM to to fully configure the chip, but this EEPROM
> > might be empty, so add support for configuring the chip through
> > the device tree.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 95 ++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> 
> 
> This should be part of previous patch. Bindings should be complete, not
> added in partial sets.

See cover letter why I did this. If everybody is fine with the pin
configuration binding then I can merge this back together, but I doubt
it and in that case I'd rather get the driver upstream without the pin
configuration at first.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


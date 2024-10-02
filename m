Return-Path: <linux-clk+bounces-12641-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88B98D0AF
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 12:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32CF284734
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46891E4120;
	Wed,  2 Oct 2024 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="e72KBXjw"
X-Original-To: linux-clk@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19A194A67;
	Wed,  2 Oct 2024 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863349; cv=none; b=TdppxeuSY+uLSOi8osMhS3+H42Vb1G8u5AisqT0RzmXlS7pFFt3qvb1IZXdELxtwF/dvXWdBtr757VJIQCpCrxyf0s4WC3zG/rrBSGNOzCm7oy80tb4FK9ijHCyIm2j0jkwgn5170WbypbyOg7elzNPk3zZ3m99KYcnrY+NmDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863349; c=relaxed/simple;
	bh=diAxOzbkDt7Ql6pEvIoL0lSFjwVt76nj7B7wQU8hIL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP68B/qNc/wfTNDL0ArCuvP6vwSTb2+cHbzuZg85k61+m1bhv5plOUZ0YXqD7EcwEm9GJgzjuiJ/qIKsU7s5SL4X14SHfwJZCOc6iT9hgtd4XwSg9nnuom6vMmEhOxqKQc3z0oIqeg7EkPNTERusmfItI9TPPXQ5lFfiTULfpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=e72KBXjw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DA5F423D0D;
	Wed,  2 Oct 2024 12:02:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOgPIL8UERTp; Wed,  2 Oct 2024 12:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727863346; bh=diAxOzbkDt7Ql6pEvIoL0lSFjwVt76nj7B7wQU8hIL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e72KBXjw1unZIPqp2BXx5mVZl28cPYllJrN30Iu37IpAJAFXtK41o4XqmiqGkK6L2
	 RckGry+l71IxBSykpvTGO4jSKz8Cbz6SqmMwHpYqb6K466M2zsU9WxrSWEUTveAizt
	 SPIgEBUzYhyHP2SjJ5yJ6nqqcKTBbK2MsXqlvDOVx+0jg1uYrIcBHKz/kjnyKsAc/y
	 ImX5OTlpp9CwmMXq4Qgiot+ihKF75R/GyjZ26CmNdDNOZ+IwjPpWKx7uThR9MN7HCm
	 RhCw7UsAmpd4eVtuPczhT+4gdMST0u11W/1qcFdD6SFR8gvavrYqJl0tzqgCgI1sx3
	 hlkE3e0V0uyFA==
Date: Wed, 2 Oct 2024 10:02:04 +0000
From: Yao Zi <ziyao@disroot.org>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Celeste Liu <CoelacanthusHex@gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: Add rockchip,rk3528-cru
Message-ID: <Zv0aHDUSsGVIWkRi@pineapple>
References: <20241001042401.31903-2-ziyao@disroot.org>
 <20241001042401.31903-5-ziyao@disroot.org>
 <20241001-name-stooge-7a939f71a08e@spud>
 <Zvxm71YvGbF1s_2w@pineapple>
 <20241002-sash-gigantic-f79da2043875@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-sash-gigantic-f79da2043875@spud>

On Wed, Oct 02, 2024 at 09:49:21AM +0100, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 09:18:03PM +0000, Yao Zi wrote:
> > On Tue, Oct 01, 2024 at 05:29:15PM +0100, Conor Dooley wrote:
> > > On Tue, Oct 01, 2024 at 04:23:57AM +0000, Yao Zi wrote:
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: xin24m
> > > > +      - const: phy_50m_out
> > > 
> > > Why is this input clock named "out"? clocks should be named after how
> > > they're used in the IP in question, not the name of the source of that
> > > clock in the SoC.
> > > Without descriptions provided in the clocks property, it is hard to
> > > understand what this second clock is for.
> > 
> > Thanks for explaination, it should something like "clk_gmac0".
> 
> So it is actually an input clock to the cru?

Yes, phy module generates it, being parent of several CRU clocks.

> I'd like to see an items list in the clocks property please,
> describing what these clocks are.
>
> Also, "clk" is redundant, since these are all clocks, so drop that
> from the name.

Okay.

Cheers,
Yao Zi


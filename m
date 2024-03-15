Return-Path: <linux-clk+bounces-4639-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C687CDAE
	for <lists+linux-clk@lfdr.de>; Fri, 15 Mar 2024 14:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861241F2155B
	for <lists+linux-clk@lfdr.de>; Fri, 15 Mar 2024 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF70250E5;
	Fri, 15 Mar 2024 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIeK3IEB"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A124B26;
	Fri, 15 Mar 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507897; cv=none; b=dLvfY4/g/0eA1kokDCOTa5JA6lDLaopr7GxinQNdJpXspSM3rpFYHlAWvFko06A2chhpaj2shQeg8dyyuM8iAnRszNgsJ1P9f/4vWGRimRoQ7u+sj0vl4dyNywITIn3UjzfD3aPOHr6yKgCYXGXr3GX8nDRYAT7DEIlKRskKPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507897; c=relaxed/simple;
	bh=DvGI8Ea9CrQMc930SjFSluQ/GjUlhlbAS/EJEnqtjTo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=jHI8wty+lNsFDujkof44fTuAXLZ6lG0JsYAjDb6a+m9FfSY+zJs6WAS5fHOALrh/pPBJJHPDlncvHcs88Fy4D5U5o93aBW3Jm6kc4DpM3cWnei88mfzC0LMMfdeLc3qA4E3Bd8ydVCV/LmatETgWBHV87O7+B//954ohH1ylxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIeK3IEB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36CBC433C7;
	Fri, 15 Mar 2024 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710507896;
	bh=DvGI8Ea9CrQMc930SjFSluQ/GjUlhlbAS/EJEnqtjTo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=hIeK3IEBIb6JAM9AZ/wvuH6aNzZGxylrAJRiLiGcHiZgEKx/uWiC6SEEmPlwCYvAD
	 AZ4C87I2Tz0Mt6ogAzjumauuMWCfhHbASjxypGuMU0JASw/XmAWsL40XfnF6EEgYFB
	 YEBwL5TE0M5q84QeAWr7NWx4Phe5gaLIjHcVab5MG4PdAGwf+DtQj9ePiKDlE1SAtr
	 WTCn286Jg1O5nmqXSf/V0bNXrLw0wtE22iPRU+buqFbD11TdhNmeFmyM2uaBMIAiNu
	 vK4okWTZPWdolle9rIQF8GEzzmSA/YLGZohUJPn9WJ86Kqc92s1oEEIsNnd1FfA3oQ
	 BfPpmKmlQVz4w==
Message-ID: <c3dbb1f483849c7ee6f61223514e5d16@kernel.org>
Date: Fri, 15 Mar 2024 13:04:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
In-Reply-To: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, stable@vger.kernel.org, "Chen-Yu
 Tsai" <wens@csie.org>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Ondrej Jirman" <megi@xff.cz>, "Purism
 Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh+dt@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Sun, 10 Mar 2024 14:21:11 +0100, Frank Oltmanns wrote:
> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
> 
> Implement that functionality in the sunxi-ng's common part making use of
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


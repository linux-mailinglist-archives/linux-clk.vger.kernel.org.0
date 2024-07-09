Return-Path: <linux-clk+bounces-9288-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4A92AD37
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 02:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C870B20B04
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 00:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6582CCA3;
	Tue,  9 Jul 2024 00:44:19 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB602A8FE;
	Tue,  9 Jul 2024 00:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720485858; cv=none; b=gBG9ZsiYpsEk4tDRrrTw6czY9jjRm3mMr2vD9BHbOwl/RKdABTM5nCR9wWh1OrjY3Aj9iacxVe3aLoi3phKutdLXlyXcdMkm8ALyoFuMkh+mb8wJQ0eQ2x6t0M9IcviJFx1FgukKdPLw6A9tchZIQVZqW5++C5qN6q7W8Vz55bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720485858; c=relaxed/simple;
	bh=mkMDPYFbxx1FptqvwTRdJB2ALENlrVB4g6QrIyguxpM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuZSgAuPHToCiy718mpN3zFnBEYMADkzzGp70HgLldifocHKwPBjxh66+sc572vw5N+iTzUcBzV3sG1XUdNWYwGWAO8GLQTCgoVCNelXkAjjJ26rt0VLSWg1aMT8fd1C+u1GuQAcomZmTIF/VBVxAiaLgyaqtuNPhJOQT7gJF3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C061007;
	Mon,  8 Jul 2024 17:44:39 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F14C53F762;
	Mon,  8 Jul 2024 17:44:11 -0700 (PDT)
Date: Tue, 9 Jul 2024 01:42:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chris
 Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 02/23] drm: sun4i: de2/de3: Merge CSC functions into
 one
Message-ID: <20240709014210.45ce6054@minigeek.lan>
In-Reply-To: <20240703105454.41254-3-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
	<20240703105454.41254-3-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Jul 2024 22:50:52 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Merging both function into one lets this one decide on it's own if CSC
> should be enabled or not.

"both functions" is not very specific or telling, and left me a bit
clueless, so can we maybe use:

"At the moment the colour space conversion is handled by two functions:
one to setup the conversion parameters, and another one to enable the
conversion. Merging both into one gives more flexibility for upcoming
extensions to support whole YUV pipelines, in the DE33."

Maybe someone knows the real killer reason why this is required, this
could then be added here.

> Currently heuristics for that is pretty simple
> - enable it for YUV formats and disable for RGB. However, DE3 can have
> whole pipeline in RGB or YUV format. YUV pipeline will be supported in
> later commits.

The actual patch looks like a valid transformation to me, so with an
amended commit message:

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
>  3 files changed, 40 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
> index 6ebd1c3aa3ab5..0dcbc0866ae82 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
>  	},
>  };
>  
> -static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
> -				       enum format_type fmt_type,
> -				       enum drm_color_encoding encoding,
> -				       enum drm_color_range range)
> +static void sun8i_csc_setup(struct regmap *map, u32 base,
> +			    enum format_type fmt_type,
> +			    enum drm_color_encoding encoding,
> +			    enum drm_color_range range)
>  {
> +	u32 base_reg, val;
>  	const u32 *table;
> -	u32 base_reg;
>  	int i;
>  
>  	table = yuv2rgb[range][encoding];
>  
>  	switch (fmt_type) {
> +	case FORMAT_TYPE_RGB:
> +		val = 0;
> +		break;
>  	case FORMAT_TYPE_YUV:
> +		val = SUN8I_CSC_CTRL_EN;
>  		base_reg = SUN8I_CSC_COEFF(base, 0);
>  		regmap_bulk_write(map, base_reg, table, 12);
>  		break;
>  	case FORMAT_TYPE_YVU:
> +		val = SUN8I_CSC_CTRL_EN;
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				base_reg = SUN8I_CSC_COEFF(base, i + 1);
> @@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
>  		}
>  		break;
>  	default:
> +		val = 0;
>  		DRM_WARN("Wrong CSC mode specified.\n");
>  		return;
>  	}
> +
> +	regmap_write(map, SUN8I_CSC_CTRL(base), val);
>  }
>  
> -static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
> -					    enum format_type fmt_type,
> -					    enum drm_color_encoding encoding,
> -					    enum drm_color_range range)
> +static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
> +				 enum format_type fmt_type,
> +				 enum drm_color_encoding encoding,
> +				 enum drm_color_range range)
>  {
> +	u32 addr, val, mask;
>  	const u32 *table;
> -	u32 addr;
>  	int i;
>  
> +	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
>  	table = yuv2rgb_de3[range][encoding];
>  
>  	switch (fmt_type) {
> +	case FORMAT_TYPE_RGB:
> +		val = 0;
> +		break;
>  	case FORMAT_TYPE_YUV:
> +		val = mask;
>  		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
>  		regmap_bulk_write(map, addr, table, 12);
>  		break;
>  	case FORMAT_TYPE_YVU:
> +		val = mask;
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
> @@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
>  		}
>  		break;
>  	default:
> +		val = 0;
>  		DRM_WARN("Wrong CSC mode specified.\n");
>  		return;
>  	}
> -}
> -
> -static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
> -{
> -	u32 val;
> -
> -	if (enable)
> -		val = SUN8I_CSC_CTRL_EN;
> -	else
> -		val = 0;
> -
> -	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
> -}
> -
> -static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
> -{
> -	u32 val, mask;
> -
> -	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
> -
> -	if (enable)
> -		val = mask;
> -	else
> -		val = 0;
>  
>  	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
>  			   mask, val);
>  }
>  
> -void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum format_type fmt_type,
> -				     enum drm_color_encoding encoding,
> -				     enum drm_color_range range)
> -{
> -	u32 base;
> -
> -	if (mixer->cfg->is_de3) {
> -		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
> -						fmt_type, encoding, range);
> -		return;
> -	}
> -
> -	base = ccsc_base[mixer->cfg->ccsc][layer];
> -
> -	sun8i_csc_set_coefficients(mixer->engine.regs, base,
> -				   fmt_type, encoding, range);
> -}
> -
> -void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> +void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
> +			enum format_type fmt_type,
> +			enum drm_color_encoding encoding,
> +			enum drm_color_range range)
>  {
>  	u32 base;
>  
>  	if (mixer->cfg->is_de3) {
> -		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
> +		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
> +				     fmt_type, encoding, range);
>  		return;
>  	}
>  
>  	base = ccsc_base[mixer->cfg->ccsc][layer];
>  
> -	sun8i_csc_enable(mixer->engine.regs, base, enable);
> +	sun8i_csc_setup(mixer->engine.regs, base,
> +			fmt_type, encoding, range);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 7322770f39f03..b7546e06e315c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -28,10 +28,9 @@ enum format_type {
>  	FORMAT_TYPE_YVU,
>  };
>  
> -void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum format_type fmt_type,
> -				     enum drm_color_encoding encoding,
> -				     enum drm_color_range range);
> -void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> +void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
> +			enum format_type fmt_type,
> +			enum drm_color_encoding encoding,
> +			enum drm_color_range range);
>  
>  #endif
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 76e2d3ec0a78c..6ee3790a2a812 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -281,14 +281,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
>  
>  	fmt_type = sun8i_vi_layer_get_format_type(fmt);
> -	if (fmt_type != FORMAT_TYPE_RGB) {
> -		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
> -						state->color_encoding,
> -						state->color_range);
> -		sun8i_csc_enable_ccsc(mixer, channel, true);
> -	} else {
> -		sun8i_csc_enable_ccsc(mixer, channel, false);
> -	}
> +	sun8i_csc_set_ccsc(mixer, channel, fmt_type,
> +			   state->color_encoding,
> +			   state->color_range);
>  
>  	if (!fmt->is_yuv)
>  		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;



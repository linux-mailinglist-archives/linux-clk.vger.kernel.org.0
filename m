Return-Path: <linux-clk+bounces-8589-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BF915B08
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 02:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A2F6B21AFA
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 00:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC178F6F;
	Tue, 25 Jun 2024 00:29:50 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FED18F48;
	Tue, 25 Jun 2024 00:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719275390; cv=none; b=GreBFfi1jf0ldoqb13xgivLcP7LThX8vantEEqXKATPQYjuiLMsBONDzbwAfYlCN1RS7y3uvB+2FV4GV3hkKb6oZrOY6y2rxTh0YBU+KwfyxfCN1rWGSneJRcgEDT7FYieUGWf1Eivm8bBMvynN4SOSuahj9pyn2O7Sj2QioQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719275390; c=relaxed/simple;
	bh=iYn5VfO5+IG4ZfSgFzubFN6QkA26VSPvolhxPxclxYY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt/8cjrwbixTavmLE9KZnwzG7cISCtmHsOKF9wyKqTiU3wb1L+9Hp986C+DiEEc2c6nshRHKypCStnzsiY6oLX4261cFZrYw/IgkNZ2js6wgINYN0WLvzR0q4HGypnPuDEhyIPeaz8PfiKfsFfOP5rMmdmZJlLMPmP72MHtZp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57DF339;
	Mon, 24 Jun 2024 17:30:12 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53A0D3F6A8;
	Mon, 24 Jun 2024 17:29:45 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:28:04 +0100
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
Subject: Re: [PATCH 14/23] drm: sun4i: de2/de3: refactor mixer
 initialisation
Message-ID: <20240625012804.27e55708@minigeek.lan>
In-Reply-To: <20240620113150.83466-15-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
	<20240620113150.83466-15-ryan@testtoast.com>
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

On Thu, 20 Jun 2024 23:29:52 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 69 ++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 7874b68786eee..533aa93d2a30e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -404,6 +404,40 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
>  	return of_ep.id;
>  }
>  
> +static void sun8i_mixer_init(struct sun8i_mixer *mixer)
> +{
> +	unsigned int base;
> +	int plane_cnt, i;
> +
> +	base = sun8i_blender_base(mixer);

Please move the initialisation up into the line with the declaration.

> +
> +	/* Enable the mixer */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> +		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> +
> +	/* Set background color to black */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> +		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> +
> +	/*
> +	 * Set fill color of bottom plane to black. Generally not needed
> +	 * except when VI plane is at bottom (zpos = 0) and enabled.
> +	 */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> +		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> +
> +	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> +	for (i = 0; i < plane_cnt; i++)
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_BLEND_MODE(base, i),
> +			     SUN8I_MIXER_BLEND_MODE_DEF);
> +
> +	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> +}
> +
>  static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  			      void *data)
>  {
> @@ -412,8 +446,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	struct sun4i_drv *drv = drm->dev_private;
>  	struct sun8i_mixer *mixer;
>  	void __iomem *regs;
> -	unsigned int base;
> -	int plane_cnt;
>  	int i, ret;
>  
>  	/*
> @@ -517,8 +549,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  
>  	list_add_tail(&mixer->engine.list, &drv->engine_list);
>  
> -	base = sun8i_blender_base(mixer);
> -
>  	/* Reset registers and disable unused sub-engines */
>  	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
> @@ -534,7 +564,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
> -	} else {
> +

That seems to add an extra line, which shouldn't be here.

Verified that the rest is indeed just a code move, from below into a
separate function. So with the two minor bits above fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
>  		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
>  			regmap_write(mixer->engine.regs, i, 0);
>  
> @@ -547,32 +578,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
>  	}
>  
> -	/* Enable the mixer */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> -		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> -
> -	/* Set background color to black */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> -		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> -
> -	/*
> -	 * Set fill color of bottom plane to black. Generally not needed
> -	 * except when VI plane is at bottom (zpos = 0) and enabled.
> -	 */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> -		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> -
> -	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> -	for (i = 0; i < plane_cnt; i++)
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_BLEND_MODE(base, i),
> -			     SUN8I_MIXER_BLEND_MODE_DEF);
> -
> -	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> -
> +	sun8i_mixer_init(mixer);
> +	
>  	return 0;
>  
>  err_disable_bus_clk:



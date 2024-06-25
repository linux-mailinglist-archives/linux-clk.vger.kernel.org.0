Return-Path: <linux-clk+bounces-8588-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01394915B05
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 02:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C074B21A7D
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 00:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00548F6F;
	Tue, 25 Jun 2024 00:29:40 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEED8F48;
	Tue, 25 Jun 2024 00:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719275380; cv=none; b=YvxZH+JpTJiNj8aoSkcQj/8SbvROL6JxAjS/yUy25fjZp/Aeus+/34DdWQfenr6/XcBsaNsTZ5xIJAnb1tXBnf+TYrBmGH4o8nNsyvk+HyGFihBzAlRFpTo7tVYJRLlc23XcMTVITqO6CzaME3NxEvo7mVnlyv+2jBYsY1B6Rxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719275380; c=relaxed/simple;
	bh=i0pWdK5nSP/fIrx/nTWRVTjJ5F1x39v92nsWYedhHuM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtffJ5maSTxH5NrTH9Y1aD8Fz3ysbGX3WB4p8zvGhzELMvFSUUjbuHE6rhY7uG78SSCkl8n+GADHT0UPV/hyHklPGcDqH+WLbDL7EZSvNbNy48c57FHg5fFD+dSwTiW7pmdtjZFeCxSlHH/AhglNGQeqiUAvzq2BEO/R7tvF6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7593A339;
	Mon, 24 Jun 2024 17:30:02 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B3C93F6A8;
	Mon, 24 Jun 2024 17:29:34 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:27:54 +0100
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
Subject: Re: [PATCH 13/23] drm: sun4i: de2/de3: add mixer version enum
Message-ID: <20240625012754.0b9c4b21@minigeek.lan>
In-Reply-To: <20240620113150.83466-14-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
	<20240620113150.83466-14-ryan@testtoast.com>
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

On Thu, 20 Jun 2024 23:29:51 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
> 
> Convert the boolean flag to an enum, and refactor the initialiser by
> moving common code to a separate function.

Thanks for splitting this up, makes review much easier.
Can confirm that is just refactoring, from bool to enum:

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c       |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 14 ++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h     | 11 ++++++++---
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 ++++----
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 ++--
>  6 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
> index e12a81fa91083..2d5a2cf7cba24 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -365,7 +365,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
>  {
>  	u32 base;
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		sun8i_de3_ccsc_setup(&mixer->engine, layer,
>  				     fmt_type, encoding, range);
>  		return;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index ef8067b2cbc8c..7874b68786eee 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -520,7 +520,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	base = sun8i_blender_base(mixer);
>  
>  	/* Reset registers and disable unused sub-engines */
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
>  			regmap_write(mixer->engine.regs, i, 0);
>  
> @@ -611,6 +611,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 3,
> @@ -619,6 +620,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 1,
> @@ -627,6 +629,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 432000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -636,6 +639,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -645,6 +649,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -653,6 +658,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
> +	.de_type = sun8i_mixer_de2,
>  	.vi_num = 2,
>  	.ui_num = 1,
>  	.scaler_mask = 0x3,
> @@ -663,6 +669,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
>  	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -672,6 +679,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x1,
>  	.scanline_yuv	= 1024,
> @@ -681,6 +689,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 4096,
> @@ -690,6 +699,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -699,7 +709,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> -	.is_de3		= true,
> +	.de_type	= sun8i_mixer_de3,
>  	.has_formatter	= 1,
>  	.mod_rate	= 600000000,
>  	.scaler_mask	= 0xf,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> index 13401643c7bfc..19052c594f8c2 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -150,6 +150,11 @@ enum {
>  	CCSC_D1_MIXER0_LAYOUT,
>  };
>  
> +enum sun8i_mixer_type {
> +	sun8i_mixer_de2,
> +	sun8i_mixer_de3,
> +};
> +
>  /**
>   * struct sun8i_mixer_cfg - mixer HW configuration
>   * @vi_num: number of VI channels
> @@ -171,7 +176,7 @@ struct sun8i_mixer_cfg {
>  	int		scaler_mask;
>  	int		ccsc;
>  	unsigned long	mod_rate;
> -	unsigned int	is_de3 : 1;
> +	unsigned int	de_type;
>  	unsigned int    has_formatter : 1;
>  	unsigned int	scanline_yuv;
>  };
> @@ -196,13 +201,13 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
>  static inline u32
>  sun8i_blender_base(struct sun8i_mixer *mixer)
>  {
> -	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
> +	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
>  }
>  
>  static inline u32
>  sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>  	else
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> index ae0806bccac7f..504ffa0971a4f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> @@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
>  {
>  	int vi_num = mixer->cfg->vi_num;
>  
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_VI_SCALER_UNIT_BASE +
>  		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
>  		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 329e8bf8cd20d..866ed04fa0a14 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -74,7 +74,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
>  
>  	ch_base = sun8i_channel_base(mixer, channel);
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
>  		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
>  		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
> @@ -553,7 +553,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  	layer->channel = index;
>  	layer->overlay = 0;
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		formats = sun8i_vi_layer_de3_formats;
>  		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
>  	} else {
> @@ -577,7 +577,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  
>  	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
>  
> -	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
> +	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		ret = drm_plane_create_alpha_property(&layer->plane);
>  		if (ret) {
>  			dev_err(drm->dev, "Couldn't add alpha property\n");
> @@ -594,7 +594,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  
>  	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
>  			      BIT(DRM_COLOR_YCBCR_BT709);
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3)
>  		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
>  
>  	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> index 2e49a6e5f1f1c..aa346c3beb303 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -835,7 +835,7 @@ static const u32 bicubic4coefftab32[480] = {
>  
>  static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_VI_SCALER_UNIT_BASE +
>  		       DE3_VI_SCALER_UNIT_SIZE * channel;
>  	else
> @@ -982,7 +982,7 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
>  		cvphase = vphase;
>  	}
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		u32 val;
>  
>  		if (format->hsub == 1 && format->vsub == 1)



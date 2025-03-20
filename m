Return-Path: <linux-clk+bounces-19616-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB2A6A1B2
	for <lists+linux-clk@lfdr.de>; Thu, 20 Mar 2025 09:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1BBF18892A1
	for <lists+linux-clk@lfdr.de>; Thu, 20 Mar 2025 08:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF329214226;
	Thu, 20 Mar 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V8i9susw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B42063E3
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460400; cv=none; b=X54FuxTofnjtzpC3mFTrdNFhO/kus4cRZFRfPHQergMoiqXP197uSUSvUF2D0/+0olYn+2eUodpf+sg6BAKCfxg2Y065hdsQhagfI/1KfuHrozLXVWiQPElzdQVtuET1IDGdEr4CZLkjsv/g1mQP/JdvfbDb1OjbsDmKrRagEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460400; c=relaxed/simple;
	bh=jx2e6DSoT90IewT4q/0d/COQs4LVEYMYiIPzr0ZRhi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BhneBX1GVnTPCEm9/xy53hmNzIwbG34ZIPJbx6v9pqtqNrEr2ntDe7Q+Mw5wpzMB3dLoJ7zqhJy/QKs2Y9Wa7AC1ydxu/1jXAUYEtuXjcy7w1PUJNeNuNzadBYCXYuC6Cod/4MlkmCQmcG6rPIwnNBgujNG5/Q3HyQQ4BpgEhsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V8i9susw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso3048135e9.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460397; x=1743065197; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3QH3qUlNH/gqSM8rGalO1GesljsIqna87D8tGVSkJw=;
        b=V8i9suswyIDMZGYzXRPSOvmAdpelFB8GcebKr1nJvQc1sV/NsH8JMC0OP4WlbY2AOD
         0Ixyh3iRh1LZwHYMEOiioTvQTeVGbC2PthEDqGb8V9PBa7fi8Ws3NieOTrHVl0p6ubqD
         vCejr6kPQD2b7eD1ogvWyQ0C0YUNS1hmm7UmUmh7COMyLYlJWi7BrEOIC5E1JmQAxdn6
         p//hpigwDGvpN+rXzXtCvdAhzwzgbmfjo3mEXjo7cIYTP/mly92RLbXue2D2leKPEZNl
         wFmfO88M8uJHCombhWI4eutoDV07l05650VRVs/aAlKDvQDiGVkn02wehkVgicQWlEEu
         sDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460397; x=1743065197;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3QH3qUlNH/gqSM8rGalO1GesljsIqna87D8tGVSkJw=;
        b=FcNJ3vvKwQt0r5+Lm4SxecP4NmOPQuG4ygdTiFGzOBWe/SXuST+9lXXOhWftWQifuF
         Kc9vRqaIY7/IwUS8f2Z/KAnv4B2KH+1tLLIll+/XeIA+JpnP+sVOIFpo9e1FVymXZ59g
         fqtw51whsg6iHJ63WpuAaNHXg09LJYMw6gy/JdwCV5hl73MGZeCDnDy1TtOuJVnqz6Yl
         IPvTpJuKI7mtlmypxKKRbcMaBMvW1vv3j7HJn+OfvCL131kE0huB80qD+mEoXnM4PaoI
         OQZMPapl+gZKc55B8IZb7Bz02haiBtqBDslLOfp6UonXSO8a9IbPHFolmBVgm4k+mLEa
         gVaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9+Jwzk6qXvHcEySTAAOnA+BlXTVRfX2mFpQp5rZSvHWEuPf3Cfh7+XxkD8GlGAXv0Xbfs3iIXp54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8RT3JlSba+DRLXhnFLwKpGjM6EgA28ZNvx4pGzAhdqK1Grj4
	X+pcu/zrekpUjamprc3SyOwF1U27sWmtJo+YdWtZV3eAPfdqkftmIajm4Pj3iU0=
X-Gm-Gg: ASbGnctSotsyaBTpfww0V/S7/nabjcduZbnZUQBkVXckEXgyP1b75u4pYYFfhTg8B7A
	vQOiGgVKqBPglxOGmyTc5iMjme9b8IiLVqD89xx/tQf/+JpfroL6Rw1ekdTTYKCtQ1aY6Q0syPA
	OGghypha7NmGOrhEr+aei8hnx36WKAi+mS4uuZ8ZT1YueGai/eYCe6wnidEmiKJw8YrDmFJ6B/8
	kA8/uH9UU7/9euT/VclddAC7NzPDY+JSe6jVB1CxkoVPWef//+eSGvydXTaRPqhf0LOIgAX91EA
	4r5JjmCn1wf+lBc83DO0dg3Uup0m+60c1Q9Ks7XPtEjP
X-Google-Smtp-Source: AGHT+IHQm6xIAgW16c9rSJQfuwSOkpxhl2OJe1D/zAy21xgweiekDmWGRfU5wzJOyEV/LHZraSbP0g==
X-Received: by 2002:a05:600c:3b20:b0:43c:fd1b:d6d6 with SMTP id 5b1f17b1804b1-43d43842e8bmr48409055e9.31.1742460396893;
        Thu, 20 Mar 2025 01:46:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e0ba:db2b:7cf4:d967])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb318afbsm23804353f8f.72.2025.03.20.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:46:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
In-Reply-To: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com> (jiebing
	chen via's message of "Wed, 19 Mar 2025 15:04:47 +0800")
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
	<20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 20 Mar 2025 09:46:36 +0100
Message-ID: <1jfrj82ioj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 19 Mar 2025 at 15:04, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> S4 tocodec support 8 lane to input, It need to enable
> bclk and mclk control bit when work
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 46 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..88f9adabb3b5d7d8881fa110f1d0d51e9ac9c60e 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29
> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -129,6 +132,10 @@ static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>  
> +static const struct snd_kcontrol_new s4_toacodec_clk_enable =
> +	SOC_DAPM_DOUBLE("Switch", TOACODEC_CTRL0,
> +			CTRL0_BCLK_ENABLE_SHIFT, CTRL0_MCLK_ENABLE_SHIFT, 1, 0);
> +

I think I remember commenting on this already.

>  static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>  			 &g12a_toacodec_mux),
> @@ -143,6 +150,19 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +/*
> + * FIXME:
> + * On this soc, tocodec need enable mclk and bclk control
> + * just enable it when dapm power widget power on.
> + */
> +
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +256,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -258,6 +282,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +313,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
>  };
>  
> +static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
> +	.component_drv	= &s4_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
> @@ -287,6 +329,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
>  		.compatible = "amlogic,sm1-toacodec",
>  		.data = &sm1_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,s4-toacodec",
> +		.data = &s4_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
Jerome


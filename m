Return-Path: <linux-clk+bounces-18020-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F2A35AD7
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 10:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E26E07A4143
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 09:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905B3253B4B;
	Fri, 14 Feb 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ftMQgzwW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75E253B49
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526712; cv=none; b=WVnJvYcvhUNb/q13W44dLEp392TXnCdeYoh4DRJ0G7p+fJ/oILX/YANY6AO8cy0U38wiGB9xJZQXgBC47AeyRs+5Wue2vU5wRab1pMRMKa0Ad3zk6rOmeJAmBPYxQVSLjDXNlTkk6JiDMT7N2b8sTpGhKqSjqPCjpHbTsJeMWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526712; c=relaxed/simple;
	bh=MiVrq3mroxMLxr9ofpPRaJBkRnaDMtDIibBciMk0+xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VnX0nX7ZQ2p05/aiiqw5T18D2cyXVNldoCyd3j+DR+zFfQiMO7HngMZOVKdS00FWQzTvjFsz4H95lxpNkSVVU1sYqeBXIM4CBpGDNAQ8GLPN5uCZCSBLsreBZOkOfCB4l3xFMaGqKr3jnQtQaUvm2mUWxUwMRZs67Zd/O/nKax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ftMQgzwW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so19234925e9.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739526707; x=1740131507; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9dgqwf+R3nWbafF3RGqzyDVVvVaWFczMtV2C/3/bQM=;
        b=ftMQgzwWOsZaasJVULZtGsb0329Sfxz4vQ8YyP0TJhZiheNSCEEXcpMkQL4+zocTbL
         O/+IAavWgGQFkT0blDaRWBf6j4Z/oCDH/3aBW4banfGFaUIIz3N9b4P9x58g/xgwEzCW
         kuYAIxOpLN+pLMFa5BzDBVu40hs4gTkfxGQhybg5t6eD2ENsEc1Dr+5ICNQRBPtrbAy6
         qTNFsE86MMnE75De/rl28kkRxr8emHBo8lD1yTHr3fRCVsqvF94B6aKKCzgGvyBbhEeG
         lAhtlpW6pEa8YH6Yp09OCDARsCVfuu0XyUITj2H690/QEY7iL7X/C9g+eg7BYcjP1E6W
         2fNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526707; x=1740131507;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9dgqwf+R3nWbafF3RGqzyDVVvVaWFczMtV2C/3/bQM=;
        b=K+6aWuzCnuzHgavSKQVra4rjp8AbE7gspZ24Rw7BVO2yCs7Ny+h2KDnhPYBjhEifk9
         pBFnInSlBe9jnKW/jt5LenMIt3zDFUPt7qNEqAWGI0KsqbwUBju3anA+5XHDUmnn915X
         M3l9kL9wvcaXxfHuEYr1VDbhFEIzHqJR5XZk88SpwppLk3gd6FiMXBF19yQrsB3tHWlt
         YTifBAB1N9BTwD2Pq8pJD0q5qxMfeXbthjD22jRzSVJC6MNbuXHnROXa2UstZO/bShPV
         H/Y/ZNnhtDgssWJ1TSP5PJiShOHuQFrvofQC8VYHdEWxRFp2ugd8lfB7h55bquH+lAmi
         pa3w==
X-Forwarded-Encrypted: i=1; AJvYcCXGol0wk9YnrliwKqbZppCtxZvcFWIsLoi7ufyMNjbe+6QSoZNbONWgnsznUt+fEjkPoFOLnen7sNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/Lo9xrL+YfgRmk1jzfCdGCHFvAjyB7ESzESAcnxJy2aoFwk+
	1XosvrUXCDiGIvw8IO0lT3JFO1FYkkRbVCi9bDeBL4K6ZJbI01qgYyu+9lvR1bA=
X-Gm-Gg: ASbGnct4VeclR8JmJSgFKPUSf1bdOckqRrLNLu9CzQbfwz4hcaz2kwp1eTkaV0cOjAi
	vrtUi3qI1W59QLsKyNspJlk12vCNiLGPW8xVTQCc3tf81zkKaxjwVIRUinQ21YRMaPiG86EYGFH
	xQAH9jYcs5lIacOSGc5i1c1xlbAPzHCB1R8GeKdvMERxJ5mVwVDoiMIGYHiTis67RW6DOT+6FRE
	2bVxxemKV3O2t7046XgoF3jFwEngBVKLcE/xqfLKuB7PPJXfWB6YUEXz2wbMRMnENtkXvUWeNZR
	aAdkagcvU4OQ8xA=
X-Google-Smtp-Source: AGHT+IH+sxpnkLZQx2UY8a+tMUtrwojgYLt+R+m3HuNuphzhfmWFPfEEp9s+PBMwuOVBfiUzYVVAPg==
X-Received: by 2002:a05:600c:1c91:b0:438:c18c:5ad8 with SMTP id 5b1f17b1804b1-439581cab45mr126116575e9.31.1739526707420;
        Fri, 14 Feb 2025 01:51:47 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395a1aa7e8sm71465665e9.26.2025.02.14.01.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:51:47 -0800 (PST)
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
Subject: Re: [PATCH v2 4/5] ASoC: meson: s4:support audio tocodec
In-Reply-To: <20250214-audio_drvier-v2-4-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:43 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-4-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:51:46 +0100
Message-ID: <1j34ggzwel.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add the audio tocodec for s4, add the 8 lane support,
> add the mclk and sclk enable event when start data enable auto switch

Again, incomplete description and mixing things together.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/axg-card.c      |  3 +-
>  sound/soc/meson/g12a-toacodec.c | 64 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index a2dfccb7990f3a53f508fc6724b21de53b4494d8..5cef069c3370257d4aaf24d7270482651babcfe1 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
>  static int axg_card_cpu_is_codec(struct device_node *np)
>  {
>  	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
> -		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
> +		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec") ||
> +		of_device_is_compatible(np, DT_PREFIX "s4-toacodec");

There is no need to extend that indefinitely, use fall-back

>  }
>  
>  static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..a93a91136e8ea00e856c3981b9c1e7e08d927a3b 100644
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
> @@ -107,6 +110,33 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>  	return 1;
>  }
>  
> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
> +			      struct snd_kcontrol *control,
> +			      int event)
> +{
> +	int ret = 0;
> +	unsigned int mask = 0, val = 0;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +

Over complicated for no reason

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);

All this could be done in one line and be actually readable if you
properly used the BIT() macro.

> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_ENABLE_SHIFT;
> +		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
> +		break;
> +	default:
> +		dev_err(component->dev, "Unexpected event %d\n", event);
> +		return -EINVAL;
> +	}

... and nothing explains what is being done and why ...

> +
> +	return ret;
> +}
> +
>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>  			    CTRL0_DAT_SEL_LSB,
>  			    g12a_toacodec_mux_texts);
> @@ -143,6 +173,14 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
> +			      &g12a_toacodec_out_enable, tocodec_clk_enable,
> +			      (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),

Drops the .autodisable without a even comment 

AFAICT, could be done like the other SoC with SOC_SINGLE_AUTODISABLE()
with properly chosen values.

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +274,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +

No. there is no reason to add that for s4 and not for sm1 which has 8
line HW support too. That clearly shows up with #define used.

If you must do that, please do it correctly without leaving the other
platforms behind.

>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -258,6 +300,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
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
> @@ -278,6 +331,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +347,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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


Return-Path: <linux-clk+bounces-9047-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58F9257C4
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 12:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDB71F22DBE
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D3414265F;
	Wed,  3 Jul 2024 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcrJ9yEO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADFD1422BD
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720001124; cv=none; b=Z2nhsKRKSelvFo01r1TLsfc/dBs2N8XjOPxKOuii+Z2wCq8FpyoqqebpPnjvVLTifS2F9z3deUYHODHp/IsW+cCXaMRiz94LqF7vG+H7y/4F4+WrrxBCD4r/pm4dxIIZaw6N9sHN4/4SOfbLl0WF+ABJCJtueMeuu6OB9T6nY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720001124; c=relaxed/simple;
	bh=jgTdbMIy3lPw9hS0B8xJBdXEhPzx9j4iinOlLX/ocq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWBYykpCdiGYzo+PsbU0mhmCaB3z3v1+mOhwF/S8fHXSZh/YLKJ9GmMPi/uh12+JebdEZMuaNg0dJvvdrg9mtAgYFxrVPzffBS58y9FjtBpaDZW84eSsqocDbVHtG50n6sITyvGm9DPonCkkRwOc+G6KUHkgMIglbf2cLO8Mu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcrJ9yEO; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso64682321fa.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001121; x=1720605921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEGEiMVW3dKZB1ERhh5sdo8NkR9UfHJ7kZbPn+Gk5rw=;
        b=IcrJ9yEONaOu6th8eiYQeNtUyAjEUfNEjykepHxJ35UauliXG971r3CudEgYO/o3Lz
         LieUtf5oK/23a5OCx9zJAzesOpXUMtsHbrR6/F5YdV9RTCML5AN8wjxPVtUdn2UoEU30
         BZEjkhTMls5ZgE5wmK4SS5JB0zIcLKLrp9KQDnzr7vhR9EsF7tC8g7Wpjw2veP0OJysI
         08bHb/ZyZACYbb9T11PenmYacDrjO3qbGH3PjxI4zy8ajRCoRvlwlRvGLnfIaGv2HbqD
         7f50SX25LRbXPdnWVTck6p3QOrhtVkGdHpVvcrRmuVKjzYqxJvvr3OH3IWomqs5LSJyo
         ZYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001121; x=1720605921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEGEiMVW3dKZB1ERhh5sdo8NkR9UfHJ7kZbPn+Gk5rw=;
        b=GE6EFA5s5GJ3apnvh/UMTvsxJxkP2AObhCiHlZIhFLV/WPX1i2x1dfQzBzdkVijjIB
         ZZB8jyTJo4o7nqscl+6u89IDcTP1OmLJYRArKRWkbfUfVrlDQVsyJNrlElgkTMuWyNRK
         Lj53r3fesI3jLDlR43Y9AxIfc7Ws2pbYt5SBWfy9m9qVf2BtcFvgtdUT9X9FzfcrNKm9
         mnXB7s5gAsLdHuxihb6WnR8AXBbRwPkbvnJWpEILqrvXXRgNn6JKDKkX37IHj7zVZS/2
         XdhdkDdh5RBjlw87PjtomoUlzSoWBJLrLCmk9CzeLPsHW/NXbQBNFNzan093dmGtUMX8
         4/1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5SwdN4UQqF7nRlZe8xENgRcTEj2fn2jxFti5zpVhAVD0wjfhHK6TRDXGEYGntkRd5nMkniE0qFAS2uEiFvHX38dAIbi9rKHIZ
X-Gm-Message-State: AOJu0YzcEtxIXi+fR3nvzNXwsvhbf3k5n0omoiWXUWU4vihPVZAcfOa6
	IXASimOyQrOZAeZ6Ak7izuerqdzXPZfOuU870i9n4xSwWRqv8ChXJ3tTlkWsdGc=
X-Google-Smtp-Source: AGHT+IGmicq1DTq3FjWhSJE0DkaC7SbXpSLotK2RdxXl2sDdvdH+z8SVw2eot3uzPTC4Zcp0M2pykw==
X-Received: by 2002:a05:6512:39c5:b0:52c:842b:c276 with SMTP id 2adb3069b0e04-52e8270914amr9349060e87.53.1720001118998;
        Wed, 03 Jul 2024 03:05:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b23fsm2092520e87.280.2024.07.03.03.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:05:18 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:05:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
Message-ID: <kxoxr5cxxedckh7q45zhhyssqx4ahdfbqw7sdsrxx2ddplummh@2s6jv62ipnhb>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>

On Tue, Jul 02, 2024 at 09:20:41PM GMT, Satya Priya Kakitapalli wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Regera PLL ops are required to control the Regera PLL from clock
> controller drivers, thus add support for the same.

the same what?

> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 32 +++++++++++++++++++++++++++++++-
>  drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index d2bef078588f..afb7ab72c90d 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/kernel.h>
> @@ -2605,3 +2605,33 @@ const struct clk_ops clk_alpha_pll_stromer_plus_ops = {
>  	.set_rate = clk_alpha_pll_stromer_plus_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_plus_ops);
> +
> +void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +			     const struct alpha_pll_config *config)
> +{
> +	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> +	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll), config->user_ctl_hi1_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
> +
> +	/* Set operation mode to STANDBY */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +}
> +EXPORT_SYMBOL_GPL(clk_regera_pll_configure);

Does it make sense to call this function from clk_zonda_pll_configure()?

> +
> +const struct clk_ops clk_alpha_pll_regera_ops = {
> +	.enable = clk_zonda_pll_enable,
> +	.disable = clk_zonda_pll_disable,
> +	.is_enabled = clk_alpha_pll_is_enabled,
> +	.recalc_rate = clk_trion_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = clk_zonda_pll_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index fb6d50263bb9..5bb0a07da53d 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -21,6 +21,7 @@ enum {
>  	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>  	CLK_ALPHA_PLL_TYPE_AGERA,
>  	CLK_ALPHA_PLL_TYPE_ZONDA,
> +	CLK_ALPHA_PLL_TYPE_REGERA = CLK_ALPHA_PLL_TYPE_ZONDA,
>  	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
>  	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
>  	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
> @@ -189,6 +190,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
>  extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>  
> +extern const struct clk_ops clk_alpha_pll_regera_ops;
> +
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> @@ -210,5 +213,7 @@ void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
>  				  const struct alpha_pll_config *config);
>  void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			       const struct alpha_pll_config *config);
> +void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +			     const struct alpha_pll_config *config);
>  
>  #endif
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry


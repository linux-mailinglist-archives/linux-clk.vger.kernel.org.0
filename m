Return-Path: <linux-clk+bounces-18310-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC3A3BD96
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 12:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E963C168BD8
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 11:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A321DF731;
	Wed, 19 Feb 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fysd5Ans"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FB1DF724
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739966359; cv=none; b=AIDbszl7sAVyWOC0lhi2iZB2HHxmgGapE2yk03KoMYLQ2cCQ5mGsFHHGwnMQDBN2RBPZxg6ZrhNeQW+qkzDaCjNDYdEcofoFLQ0GODsZuAeWOXbqUJ6oEEjvt6CAlYmZWYt/Q48DsBAOmILFD1Rw1F6RAu4RCjkFyzU8icHM3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739966359; c=relaxed/simple;
	bh=J0hF3UhRpwjKs/Yi5If5aov9xyBNwUE9OWA3Fv+Euqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+hxsblvgi8hz+6pcLoLhxlR41j8Kx5qJr5oZAZ5s6MYbq/wV0ho8pcEPh23fwar1cStkg+A3lZ9s+xlYaTK5ACMZE5DNUZQMONnq3TH5rIPJkyJ/oXCS2c/efkHgSC4CtnEetuerfxbsHSt3Crioih9NZzY8niZfoNLK4vGvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fysd5Ans; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30762598511so63689171fa.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 03:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966356; x=1740571156; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+CJq2ouQgs6Uq09Ja7eyw0fU6FYWGc/bKljMrdEqE5g=;
        b=fysd5AnsZVhSou6cBr7mDT58oBHY5Uf9Otrp+vJtJVIAjzDI9qVnqvXNNk3ZquZAn2
         OdNETd+ptp5/mJ1hIAjM/l3arZ1cM3dvP7XP92FPj9rRaZ5FfA47PiyXNKIDIwE+tGvA
         d/+vKReqQt6kC8ymMlZa9vFCKmieunSrI4r6lwr0IRH/TsvslM1ZqfDQU/UumM1OdNt8
         cnI4xzeBtH5j5ZzkpIRdWVrqGJuMnX6c8194aNNvDFGe0JdglHkkT3AgRSeKlvV2+le1
         tzM8QgEeVXj3/sbqIZe0jEIespkwoqQPeUHXt0msyHST/lhEoWcfgBvWKDvqSo76fcTE
         0EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966356; x=1740571156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CJq2ouQgs6Uq09Ja7eyw0fU6FYWGc/bKljMrdEqE5g=;
        b=DTnhOI+ZDafsqnnuuQ8yrWCiZxIhZe4j6FJqGi+VVnRHgVLtSbz5ByX6ilbfUP42Bq
         /X2cqSTXuQq5g4Md8ICciIZjl0KmA+w6vEpu13ZWNoqdcF2XwVUCBKxDu9grxq29QxlD
         M0ev0w0u5n4T3n8U/He3lBoBHSCaZxFw8kwLbEV75+LbLFJ1J+W4yHUsCOxj61JTprXk
         WGk0IN0HCZqlmKXmAu07/JlYp/5Iy0E1yC9JhbtwowmTV+fNUVsN3dpm8Jv2Qi9dF9sT
         Or/xaAqao0elkKiNO0UMGFIR17+TrKJHmpcvM556pN5vLi4al0vCODslzA9H4ynVysIb
         6dFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaTus/UF6sT6s6Ked2suGi20faeNmLpn242cOvU0L91UdFIuOLYekN+5y4AP1a0Tmb9pIH38SB4sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIqR2rPvYwE0gdNt8avFx+KBhu3szBGEb4Mgnp3LwX/e2b1F/4
	yXthsbgitMzyISRu2QbkpXQTnpdbpG5ZzkXCX2dKt6bZ9ivGHdc6LjbHxxlLfBM=
X-Gm-Gg: ASbGncux3rBs2AZ5khb4T5qScqMT5Gn+DxuQYvLKFN8XCLtnZDk/g3JsFjGMTG0Zy9x
	Bs+Uegyze2Qrg55hw4yjgRmyv3dpDOPhhfglK+4rhFB2Oq/IUycd3MONaGL6BaVczr03dVicBV1
	nEFjQiuE4tgIToBmNKhx003jr8mCDQrCFkJFWm5+2PzhACVkthlsGzttjdwiRf3dWBXiakFxNJf
	vkVH8SEVpwoDNRlU63ALSo0qnAMXMoBVUt2cZLsF6q7f7fRvMJQlSrUO6ZbtVJrTuRcIKsl+PnY
	iLdn6v3M/Psoh1jOc42GgZLTU/saQR68rkUeD6k62bpVDteft8+sTTLzrpRTUl9WNe+D7WM=
X-Google-Smtp-Source: AGHT+IG3EA5zmOZxqYnvB2TJIdKQeVBGkZe99Cqn1+AqimTJVwzVgST9xXBbyJiYmWEnq1QwRnfltw==
X-Received: by 2002:a2e:9490:0:b0:309:2ed:7331 with SMTP id 38308e7fff4ca-30927a62d05mr61534381fa.18.1739966355575;
        Wed, 19 Feb 2025 03:59:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309cec7e45asm13998091fa.105.2025.02.19.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:59:14 -0800 (PST)
Date: Wed, 19 Feb 2025 13:59:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
Message-ID: <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>

On Wed, Feb 19, 2025 at 05:11:03PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
> > On 18/02/2025 17:19, Dmitry Baryshkov wrote:
> >> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
> >>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
> >>>> During boot-up, the PLL configuration might be missed even after
> >>>> calling pll_configure() from the clock controller probe. This can
> >>>> happen because the PLL is connected to one or more rails that are
> >>>> turned off, and the current clock controller code cannot enable
> >>>> multiple rails during probe. Consequently, the PLL may be activated
> >>>> with suboptimal settings, causing functional issues.
> >>>>
> >>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
> >>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
> >>>> Therefore, add support to attach multiple power domains to videocc on
> >>>> these platforms.
> >>>>
> >>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>> ---
> >>>>    drivers/clk/qcom/videocc-sm8450.c | 4 ++++
> >>>>    drivers/clk/qcom/videocc-sm8550.c | 4 ++++
> >>>>    2 files changed, 8 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
> >>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
> >>>> --- a/drivers/clk/qcom/videocc-sm8450.c
> >>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
> >>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
> >>>>        struct regmap *regmap;
> >>>>        int ret;
> >>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
> >>>> +    if (ret)
> >>>> +        return ret;
> >>>> +
> >>>>        ret = devm_pm_runtime_enable(&pdev->dev);
> >>>>        if (ret)
> >>>>            return ret;
> >>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> >>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
> >>>> --- a/drivers/clk/qcom/videocc-sm8550.c
> >>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
> >>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
> >>>>        int ret;
> >>>>        u32 sleep_clk_offset = 0x8140;
> >>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
> >>>> +    if (ret)
> >>>> +        return ret;
> >>>> +
> >>>>        ret = devm_pm_runtime_enable(&pdev->dev);
> >>>>        if (ret)
> >>>>            return ret;
> >>>>
> >>>
> >>> What's the difference between doing the attach here or doing it in
> >>> really_probe() ?
> >>
> >> I'd second this. If the domains are to be attached before calling any
> >> other functions, move the call to the qcom_cc_map(), so that all drivers
> >> get all domains attached before configuring PLLs instead of manually
> >> calling the function.
> >>
> >>> There doesn't seem to be any difference except that we will have an
> >>> additional delay introduced.
> >>>
> >>> Are you describing a race condition ?
> >>>
> >>> I don't see _logic_ here to moving the call into the controller's higher
> >>> level probe.
> >>>
> >>> Can you describe some more ?
> >>>
> >>> ---
> >>> bod
> >>
> > 
> > Here's one way this could work
> > 
> > Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Date:   Tue Feb 18 19:46:55 2025 +0000
> > 
> >     clk: qcom: common: Add configure_plls callback prototype
> > 
> >     Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
> >     before configuring PLLs and ensure that the power-domain rail list is
> >     switched on prior to configuring PLLs.
> > 
> >     Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > 
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index 9e3380fd71819..1924130814600 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
> >         if (ret < 0 && ret != -EEXIST)
> >                 return ret;
> > 
> > +       if (desc->configure_plls)
> > +               desc->configure_plls(regmap);
> > +
> >         reset = &cc->reset;
> >         reset->rcdev.of_node = dev->of_node;
> >         reset->rcdev.ops = &qcom_reset_ops;
> > diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> > index 7ace5d7f5836a..4955085ff8669 100644
> > --- a/drivers/clk/qcom/common.h
> > +++ b/drivers/clk/qcom/common.h
> > @@ -38,6 +38,7 @@ struct qcom_cc_desc {
> >         const struct qcom_icc_hws_data *icc_hws;
> >         size_t num_icc_hws;
> >         unsigned int icc_first_node_id;
> > +       void (*configure_plls)(struct regmap *regmap);
> >  };
> > 
> > and
> > 
> > % git diff drivers/clk/qcom/camcc-x1e80100.c
> > diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> > index b73524ae64b1b..c9748d1f8a15b 100644
> > --- a/drivers/clk/qcom/camcc-x1e80100.c
> > +++ b/drivers/clk/qcom/camcc-x1e80100.c
> > @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
> >         .fast_io = true,
> >  };
> > 
> > +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
> > +{
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> > +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> > +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> > +
> > +       /* Keep clocks always enabled */
> > +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> > +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> > +}
> > +
> >  static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
> >         .config = &cam_cc_x1e80100_regmap_config,
> >         .clks = cam_cc_x1e80100_clocks,
> > @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
> >         .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
> >         .gdscs = cam_cc_x1e80100_gdscs,
> >         .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
> > +       .configure_plls = cam_cc_x1e80100_configure_plls,
> >  };
> > 
> >  static const struct of_device_id cam_cc_x1e80100_match_table[] = {
> > @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
> >                 return PTR_ERR(regmap);
> >         }
> > 
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> > -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> > -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> > -
> > -       /* Keep clocks always enabled */
> > -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> > -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> > -
> >         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
> > 
> >         pm_runtime_put(&pdev->dev);
> > 
> > Or a least it works for me.
> > 
> 
> This patch will not work in all cases, maybe in your case required power domains might be ON
> from bootloaders so it might be working.

But with his patch domains are attached before configuring the PLLs, are
they not?

> 
> > New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
> > 
> 
> No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
> with this than the current approach. 

Bryan's proposal moves us towards having a common code, so it's better.

-- 
With best wishes
Dmitry


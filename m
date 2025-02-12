Return-Path: <linux-clk+bounces-17952-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF8A33047
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 21:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30673A8B81
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 20:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87CB200119;
	Wed, 12 Feb 2025 20:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyDBdVH9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B331FBC96
	for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390428; cv=none; b=PJfh/ddQXtmsiq7txlbWxj/QUKve4DwRQlzxF+xq3R4bZr9ciUd8aQy88C7ZOQot6i2s1ev96grA45B6wDqIOCTQjBduMFPn4mweZkMapZewWCgZh2xGzz1fmjnxvs+CvwE2McZFIXbZR1Ti1taAsDZJYVhjWl4gOXSLETcbHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390428; c=relaxed/simple;
	bh=Sk3/jI2UsX7t1K7DBMsBontenZTYBCF6xe8eKBZ82QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHL2Kz0j9WbEHAgKEflWvicyKU/3qucKOPbS4EJweoJeZPQS+epg5xeEnkhWONIF0it4SoVd+lzWsJUIzfGajoRci1GiwKsnkwovRD/7tRLWfSkgzXj4FfZLLeleK2/1W2/HDPBpjdUNemGLQ0LgAw3eNte8zQ2t1Z01cWFESbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyDBdVH9; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fb0e9e6f6bso1178197b3.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 12:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390426; x=1739995226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/fTY3RzHJmo0B1XLCBasCOuHNrW5LerLaWls5wlJiRQ=;
        b=TyDBdVH9JvqtN5SzB24bhuzfz3OgOzgK5KwPhSr3Gf5JEEg8QwlwhCITBHMI0r54pL
         /8KdC9AKD4A3uSv+wKyX+5pNdeTRnVJEsHl3zCq6qjnvh29aahzbyPJ71JvwPdDzX+/S
         IAkzHMuF/z0/XDAwpys5b5ZsiT1DJQ/r0cmS3K/FG1WJhcd6JR6awkQNEPQrT3iy8aFi
         0EMzbnTHY0ROzD9EheD03FAAT93fmtNGcIwMsQTDrEHmvTUu2zHhL7z+4PS3s3JAkxcK
         JB1vLKyHjXcJassl+kg0cTG8yuscl8cZ6RtTwB+UI3fGbO3uQWmqlsV2WiBHCHSaiF9l
         HZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390426; x=1739995226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fTY3RzHJmo0B1XLCBasCOuHNrW5LerLaWls5wlJiRQ=;
        b=hqgIA+kn1sWaH93EooVEHnITcbqTEdqTzHOn42ez9IuM3q/wq/DN4HArvCBlkDuWfd
         NG/tVS9ZHbLjBW+kLfhnNt/BwxFSeae4eIlsfHWQ+QxAdcp83qlqdP6yAW/586h7qdN4
         ++zMe4Vw6iPbtIQfE4VY94OGujG2jvlOih0aN95xVa9w1N+ZP8C5IndhRI0yrzFUXjpP
         Hu/277NiQQ72AVM3fzrhDwxadHirAsI8arMhGLk6Q1q1j4uLKn0NyCDjKWuOql856u1P
         BojpeSShjp0mES0+Wdz4TNjYb7epG8QB/lrJJhmVRF4ngvprfhDFWWvfh3Bs45Z6tYqe
         erMw==
X-Forwarded-Encrypted: i=1; AJvYcCWWncAcsJeoA691BHN+j4GXYeFoyca/7mJdKv3cL9DxBQ/iIUTzwhej+EfYiNAwrpFeSALaBtIwV7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPValkMZWQqCXpGWeuNXEwsrgh16jMl+5D80QW+XE5ULHu5fe
	06lZ8i7WnPGK9bzun14C4h7HjLpihdGNcfnYKCMefCoTsRylLhdhdmIN79faloDH39GFxEoxjDV
	L4w+PhdG8qgoIZu/awsAyczli+zJyg2u39ycDHQ==
X-Gm-Gg: ASbGncvc1EADHqkAFuSMz6f8UjXF/9pJx3rrvqrN3oBDG2LSpJTazLYOuWhXYUlcvWk
	55n48XBAOZC30iIo5zz3xvdkblJwbKCFuBt2QLmZPZ2w4iIeLvajnysvHemZlN3crHjYq1fXlLe
	Mpv//hpXbfSNlbujXPJ2n4noH8uWpR
X-Google-Smtp-Source: AGHT+IHpP/gC08VN7wUxKZsuy3lhOhgymj/1ecYGtVd8W+HYEBiuQTcPZ00XpHQf5kS9j1OsDnAxBJQ5Gt36la9oIrA=
X-Received: by 2002:a05:690c:f87:b0:6f9:4306:5d0b with SMTP id
 00721157ae682-6fb32c49cf2mr8626497b3.6.1739390425591; Wed, 12 Feb 2025
 12:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-2-0b1cfb35b38e@quicinc.com>
 <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj> <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
In-Reply-To: <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Feb 2025 22:00:13 +0200
X-Gm-Features: AWEUYZn3gLjvd1HsKl-sxJNZx8W02W3If6M3qoD7FnpzYCeutPv1jLp6seThGZg
Message-ID: <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Feb 2025 at 19:15, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 2/12/2025 4:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 01:52:20PM +0530, Taniya Das wrote:
> >> On the QCM6490 boards the LPASS firmware controls the complete clock
> >> controller functionalities. But the LPASS resets are required to be
> >> controlled from the high level OS. The Audio SW driver should be able to
> >> assert/deassert the audio resets as required. Thus in clock driver add
> >> support for the resets.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
> >>  1 file changed, 19 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> index 45e7264770866f929a3f4663c477330f0bf7aa84..b6439308926371891cc5f9a5e0d4e8393641560d 100644
> >> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> @@ -1,6 +1,7 @@
> >>  // SPDX-License-Identifier: GPL-2.0-only
> >>  /*
> >>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>
> >>  #include <linux/clk-provider.h>
> >> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
> >>      [LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
> >>  };
> >>
> >> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
> >> +    .name = "lpassaudio_cc_reset",
> >> +    .reg_bits = 32,
> >> +    .reg_stride = 4,
> >> +    .val_bits = 32,
> >> +    .fast_io = true,
> >> +    .max_register = 0xc8,
> >> +};
> >> +
> >>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> >> -    .config = &lpass_audio_cc_sc7280_regmap_config,
> >> +    .config = &lpass_audio_cc_sc7280_reset_regmap_config,
> >>      .resets = lpass_audio_cc_sc7280_resets,
> >>      .num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
> >>  };
> >>
> >>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
> >> -    { .compatible = "qcom,sc7280-lpassaudiocc" },
> >> +    { .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> >> +    { .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
> >>      { }
> >>  };
> >>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
> >> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>      struct regmap *regmap;
> >>      int ret;
> >>
> >> +    desc = device_get_match_data(&pdev->dev);
> >> +
> >> +    if (desc->num_resets)
> >> +            return qcom_cc_probe_by_index(pdev, 1, desc);
> >
> > Won't this break SC7280 support by causing an early return?
> >
>
> The resets are not defined for SC7280.
> static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
>         .config = &lpass_audio_cc_sc7280_regmap_config,
>         .clks = lpass_audio_cc_sc7280_clocks,
>         .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
> };
>
> The reset get registered for SC7280 after the clocks are registered.
> qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);

Could you please make this condition more obvious and error-prone
rather than checking one particular non-obvious property?

>
> >> +
> >>      ret = lpass_audio_setup_runtime_pm(pdev);
> >>      if (ret)
> >>              return ret;
> >>
> >>      lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
> >>      lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
> >> -    desc = &lpass_audio_cc_sc7280_desc;
> >>
> >>      regmap = qcom_cc_map(pdev, desc);
> >>      if (IS_ERR(regmap)) {
> >> @@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>      regmap_write(regmap, 0x4, 0x3b);
> >>      regmap_write(regmap, 0x8, 0xff05);
> >>
> >> -    ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
> >> +    ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
> >>      if (ret) {
> >>              dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
> >>              goto exit;
> >>
> >> --
> >> 2.45.2
> >>
> >
>


-- 
With best wishes
Dmitry


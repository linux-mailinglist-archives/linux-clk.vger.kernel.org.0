Return-Path: <linux-clk+bounces-17975-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C9A34214
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2025 15:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80DA73AC033
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2025 14:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9A9241669;
	Thu, 13 Feb 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mP48NQyN"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2532523F422
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739456926; cv=none; b=EZ9vWvS4rrOXboIa5JQZLhUSPfKtNE9FZb16Vq3d0qcqdwjwTvcl0QRHMgedVDarn3evcUWX9NOwm6SGZBC8IMjFd68OWrTDLwJO3N9qHaxFDFz4SaIZ6a4sEKoNd8sgLDisTj+q0uBiwewiK1ktY7uEGb12X/EKuqQS3YxQXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739456926; c=relaxed/simple;
	bh=olY4mBN5+LgaqDjLR1wm1qyN18oxeG0QjyL+rpLXqik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NofDok2AP+mP2a6nVVYLaDmeOnbIEGwZvvOIfUdeAurjTXmSCOUk/1ZcLhH+yMo2Y9pmJl+WI655M5gyXfGL76YHnKIYJgteczy8zk/MC6wyAxkuv3uTwuAHQKdNkdjKv+GhC/5Qo0bb8F1XVLXrVx9cLegIqbfGtWG1sDojsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mP48NQyN; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f9625c0fccso8351697b3.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739456923; x=1740061723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfYpXrDl+rUlmnTpgbRJTwg81BgmauUKiaO1pjrmwJQ=;
        b=mP48NQyNb2e3n5ftJWucGRlWUywwdWC4PS+Fu1FcXOFNcpCeKdORe2JX4W8XCyAjZx
         pvV4V0klfTHQ3MyXoryQr1yrLnMOyraior907lZpnrqbhgPtPKf/ibldc7k/H/tSAq7/
         zNLTXIa0jOk64EAQJYjWRA9aap1nLAKue2MTZvPPCh3NQcS4t0EC7uuIyRoOdW88nMka
         U4YxCATNzccvqzO/faI9slOiG5bj5owUPJOnwGuZ4rn81v+noHNp4Omh1ubhQVcTWJJI
         eQGFlC+1SRsXnrwN/oUER0vM0x5LYEBUcMjC7u2DWsV//iWPf0Yguhjxywx4hsSVKx8Y
         PL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456923; x=1740061723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfYpXrDl+rUlmnTpgbRJTwg81BgmauUKiaO1pjrmwJQ=;
        b=sYcyn8b5765fS6I56wzW1STT7kwUaY4fiBACTlunjoZYVBYFZ5PFyKUHbtq7aNNA2X
         Bgjb+DTrrDdeAAJVZlVrJn186eStv5ZLDcsYeGcxiLFUAqu0QNK9y7JvpHx0QsP/mO6S
         aYFYZo4Md7AvHGoGgawqRQSgSBU0OhuoP3gQ+cSuFVcxxKBYh2Q/BHJyP56LHbzIZa8H
         9Pjk42lCrQjq45EMKyS1pkpUD2oQzryD9OP+1z1QJGhjmI+yl2o4LSoaJIy/DG9kcJZr
         m+XLMWYV1tyTKpo/blcSWw2IcwPgQdhd8vLeQDxV4fT4FZygjdtoby+Mh6T3NBeU67Im
         k6jw==
X-Forwarded-Encrypted: i=1; AJvYcCVEIsv5eHSTC4+tfTI/aU54tuQa/aM5o8MpcJWT1h1mb0y83b4AfEjy/i5AKoPaw8SswqO46rlmszg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBI8mc3K3qq5CAFmShLFh94iPjIrHSP+oFKhSvAufXKnRgCk99
	oZg7OqSdbrdY1mHWPee9pNdI2CokqD8fV4Uly90d2QtuATIFEm6JNtaX6/DA0m4ioozMnaBuBIS
	FjLOz2gryq+kjGe3Lvk3+AWTSLHoyxcw/lGrrBQ==
X-Gm-Gg: ASbGncuk2aZm5GECFWj0cNPpKNr0XRErJJSVVFQbtYtxZRLhPgH73F2TuVSR6F19reP
	UWJH8OeueYcEDE7RAsqzvrQsz+bAvoFQZgFD5hjU2Wc/d8/OcF2hRe1IcURrCbK55JY9TiC6HuA
	qvTXQe7MdbO+aEjrHNHXcf4K9v2wPL
X-Google-Smtp-Source: AGHT+IEeJa44o+XSvJZx8Jdms+oYMNreohnRoUx+hnesCryJtVqnxtGNEIN81nIsmMg4dnxmRUZEPcuZvqeWVs6CE+Y=
X-Received: by 2002:a05:690c:6488:b0:6f9:a6bd:2053 with SMTP id
 00721157ae682-6fb32d6daa3mr33461967b3.34.1739456923002; Thu, 13 Feb 2025
 06:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-2-0b1cfb35b38e@quicinc.com>
 <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj>
 <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com> <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
 <c820c697-c3ec-4ae3-9720-fb80cb3a0450@quicinc.com>
In-Reply-To: <c820c697-c3ec-4ae3-9720-fb80cb3a0450@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Feb 2025 16:28:32 +0200
X-Gm-Features: AWEUYZnOrZ0wV8U14CBBJrqDdK_JlTRGkwtYPMzrOyTphzKXgQHiPDt9IEDIQeA
Message-ID: <CAA8EJpon5+R5s0HXUmoikjtuyEf3sQUqBVYvWrxuh14h2DvjQg@mail.gmail.com>
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

On Thu, 13 Feb 2025 at 08:52, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 2/13/2025 1:30 AM, Dmitry Baryshkov wrote:
> > On Wed, 12 Feb 2025 at 19:15, Taniya Das <quic_tdas@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/12/2025 4:39 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Feb 12, 2025 at 01:52:20PM +0530, Taniya Das wrote:
> >>>> On the QCM6490 boards the LPASS firmware controls the complete clock
> >>>> controller functionalities. But the LPASS resets are required to be
> >>>> controlled from the high level OS. The Audio SW driver should be able to
> >>>> assert/deassert the audio resets as required. Thus in clock driver add
> >>>> support for the resets.
> >>>>
> >>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>> ---
> >>>>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
> >>>>  1 file changed, 19 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>>> index 45e7264770866f929a3f4663c477330f0bf7aa84..b6439308926371891cc5f9a5e0d4e8393641560d 100644
> >>>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>>> @@ -1,6 +1,7 @@
> >>>>  // SPDX-License-Identifier: GPL-2.0-only
> >>>>  /*
> >>>>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>   */
> >>>>
> >>>>  #include <linux/clk-provider.h>
> >>>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
> >>>>      [LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
> >>>>  };
> >>>>
> >>>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
> >>>> +    .name = "lpassaudio_cc_reset",
> >>>> +    .reg_bits = 32,
> >>>> +    .reg_stride = 4,
> >>>> +    .val_bits = 32,
> >>>> +    .fast_io = true,
> >>>> +    .max_register = 0xc8,
> >>>> +};
> >>>> +
> >>>>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> >>>> -    .config = &lpass_audio_cc_sc7280_regmap_config,
> >>>> +    .config = &lpass_audio_cc_sc7280_reset_regmap_config,
> >>>>      .resets = lpass_audio_cc_sc7280_resets,
> >>>>      .num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
> >>>>  };
> >>>>
> >>>>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
> >>>> -    { .compatible = "qcom,sc7280-lpassaudiocc" },
> >>>> +    { .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> >>>> +    { .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
> >>>>      { }
> >>>>  };
> >>>>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
> >>>> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>>>      struct regmap *regmap;
> >>>>      int ret;
> >>>>
> >>>> +    desc = device_get_match_data(&pdev->dev);
> >>>> +
> >>>> +    if (desc->num_resets)
> >>>> +            return qcom_cc_probe_by_index(pdev, 1, desc);
> >>>
> >>> Won't this break SC7280 support by causing an early return?
> >>>
> >>
> >> The resets are not defined for SC7280.
> >> static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
> >>         .config = &lpass_audio_cc_sc7280_regmap_config,
> >>         .clks = lpass_audio_cc_sc7280_clocks,
> >>         .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
> >> };
> >>
> >> The reset get registered for SC7280 after the clocks are registered.
> >> qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);
> >
> > Could you please make this condition more obvious and error-prone
> > rather than checking one particular non-obvious property?
> >
>
> Dmitry, we had earlier tried [1], but seems like we could not align on
> this patchset.
>
> If you are aligned, please let me know I can fall back on the approach.

You have been using of_device_is_compatible(). Krzysztof suggested
using mach data. Both approaches are fine with me (I'm sorry,
Krzysztof, this is a clock driver for a single platform, it doesn't
need to scale).

You've settled on the second one. So far so good.

But! The problem is in readability. Checking for desc->num_resets is a
_hidden_ or cryptic way of checking whether to register only a first
controller or both.

BTW: the commit message also tells nothing about the dropped power
domain and skipped PM code. Is it not required anymore? Is it handled
automatically by the firmware? But I see that audio codecs still use
that power domain.

>
> [1]:
> https://lore.kernel.org/all/20240318053555.20405-3-quic_tdas@quicinc.com/
>
> Do you have any suggestions that we could consider?
>
> >>
> >>>> +
> >>>>      ret = lpass_audio_setup_runtime_pm(pdev);
> >>>>      if (ret)
> >>>>              return ret;
> >>>>
> >>>>      lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
> >>>>      lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
> >>>> -    desc = &lpass_audio_cc_sc7280_desc;
> >>>>
> >>>>      regmap = qcom_cc_map(pdev, desc);
> >>>>      if (IS_ERR(regmap)) {
> >>>> @@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>>>      regmap_write(regmap, 0x4, 0x3b);
> >>>>      regmap_write(regmap, 0x8, 0xff05);
> >>>>
> >>>> -    ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
> >>>> +    ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
> >>>>      if (ret) {
> >>>>              dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
> >>>>              goto exit;
> >>>>
> >>>> --
> >>>> 2.45.2
> >>>>
> >>>
> >>
> >
> >
>


-- 
With best wishes
Dmitry


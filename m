Return-Path: <linux-clk+bounces-7595-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E99A8D66CB
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 18:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16C8EB26FFF
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 16:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C4715AD93;
	Fri, 31 May 2024 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyDmC47A"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82E158D85
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172833; cv=none; b=Y2r6sumYdudMd9okLu0UqIoJk/yAomCd07o6t50Rb01sAnzMHEwmWrMzZGk+G9YLp1MtEQGoMEA/TDlNB7M8ywfP0M6yC1Ei8zjOKOYiRSRE/Al+xlLhyMzPJ0QpnkaOyu8tvKPe2ax0BXM/uSEMjmhg5LAuqqRV+bDL0OCffYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172833; c=relaxed/simple;
	bh=sNKCSPrCuzjcOfTUB1GHnFmg8D6ntvI//Sawj8UioIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D52rTfpQVjwhnTtkdlJmXSQwGwS3t+TxlFhgqfF26aVmObjgyFZNTOz46gfA4cbCTXXONXfopgFTCEt/KWpnzzwLom/0hUY7uv3qYCvPw9d824Duwpgsgf8Tf2x7KxppKybipqUD1cmhuadcf60smIIe4HlMs6k7x1uqHFo/c6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyDmC47A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4202ca70270so28154115e9.3
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717172829; x=1717777629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=80T+r4pSrSCQfhMt1NbIZWPd23yS0UzoCuFxkMYRKZI=;
        b=MyDmC47AM3KbV6RBwCM8r+Q9im24fIatISA3+VJsc9enFSPaVh4lrtzGjl2xHjaZ4A
         v1/lD7KtGMfdwa6ajHjzAsKDKk+uU3fDZg6hTbIniMmbSJl6lzyupKiEjnmQ5+rOmg/1
         hrdqPPPcKYTDXHDsb2SFkp+IdBADnNV8H+A0st3I1bS5W1COLK7OqQnhD7Z2sf9xikVC
         8t7xd4zW3z1RyXimRNNC25CUJ58fdfSLm8IMWb3SxZQMX9MOS4H+LjbpHs/MNOFSjur2
         yoWKxviWWFRn+XLyCPBKRZ11O6FYNIDJrOsRgZv8XjXjzMkz/GBvjxnMjFVzhOVhhDbe
         bxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717172829; x=1717777629;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80T+r4pSrSCQfhMt1NbIZWPd23yS0UzoCuFxkMYRKZI=;
        b=CW8wilBwPac2SpXWQ+pim4++E4BuAPBZEbOkb+kCcqDjrDPJpzl+S2amTeLF3NhByf
         h82gSfv/VZCYG38I2TUm68pJn9Ow4uCR0Jle9tABHMK4YNPoLHRKiGTeOfvYlb/rHv/3
         rdhmCMVWotsoNiIFXtg1J74WRVxxqg4lIvHst1DgYML/9lJmA78PIl0RDXA6LAs2exo9
         Q5NNbrJG0sY8ReEPUXYba/2CXerkaWzdPhjWjNPBgBFrUkZEcYJZ5mnzG+gH6LLZxuNX
         r4jSaW0qIt8Z40vMAGCO/glZHMU1SivedM4x2z16VLXARRWUCvzrAlh6wIbC01+Cg09K
         P2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVkcupb997dKzCRj01use1dq5cE5aRUp9azn+vltetnUXM2fQpj6xRGeG/EZkSMGMJOCSdGAFB8jsynwJ3TkXFEm/LhuMM8Qt7+
X-Gm-Message-State: AOJu0YyeZzn09VEzfUz7Wai/v7csdzoapajiusnq9vVgGWeucLLq+inE
	u8LnyRmZp5Xr/Tz9egdPBDnrIhqZYq2QDf+TASJqjpMJNkHyY+SzSADPqBJY7JWLTvqbihsXRBo
	uZam13g==
X-Google-Smtp-Source: AGHT+IE3RbUSn+ASDIFuXARWvoQfOGRNyuhsTbT4sOiJOGwou32uSiCoz195wijt8vSMdZxcwh00EA==
X-Received: by 2002:a05:600c:1c0a:b0:420:78f:3f9b with SMTP id 5b1f17b1804b1-4212e0bfe62mr23878075e9.37.1717172829076;
        Fri, 31 May 2024 09:27:09 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a166sm59477465e9.25.2024.05.31.09.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 09:27:08 -0700 (PDT)
Message-ID: <9eb80c39-562c-49de-b4fd-61d138247b7f@linaro.org>
Date: Fri, 31 May 2024 18:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com, devicetree@vger.kernel.org
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240531102252.26061-3-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 12:22, Taniya Das wrote:
> On the QCM6490 boards the LPASS firmware controls the complete clock
> controller functionalities. But the LPASS resets are required to be
> controlled from the high level OS. The Audio SW driver should be able to
> assert/deassert the audio resets as required. Thus in clock driver add
> support for the same.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index c43d0b1af7f7..7fdfd07c111c 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/clk-provider.h>
> @@ -869,10 +870,36 @@ static struct platform_driver lpass_aon_cc_sc7280_driver = {
>  	},
>  };
>  
> +static const struct of_device_id lpass_audio_cc_qcm6490_match_table[] = {
> +	{ .compatible = "qcom,qcm6490-lpassaudiocc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_audio_cc_qcm6490_match_table);
> +
> +static int lpass_audio_cc_qcm6490_probe(struct platform_device *pdev)
> +{
> +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> +
> +	return qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
> +}
> +
> +static struct platform_driver lpass_audio_cc_qcm6490_driver = {
> +	.probe = lpass_audio_cc_qcm6490_probe,
> +	.driver = {
> +		.name = "lpass_audio_cc-qcm6490",
> +		.of_match_table = lpass_audio_cc_qcm6490_match_table,
> +	},
> +};
> +
>  static int __init lpass_audio_cc_sc7280_init(void)
>  {
>  	int ret;
>  
> +	ret = platform_driver_register(&lpass_audio_cc_qcm6490_driver);
> +	if (ret)
> +		return ret;
> +
>  	ret = platform_driver_register(&lpass_aon_cc_sc7280_driver);
Why this is a new platform driver?  There should be just one driver with
different match data.

Best regards,
Krzysztof



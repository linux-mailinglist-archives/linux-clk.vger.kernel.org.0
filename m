Return-Path: <linux-clk+bounces-2223-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1013827C17
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 01:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4F271C23032
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 00:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F82370;
	Tue,  9 Jan 2024 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZQWM+wJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE205635
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d8902da73so22590965e9.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704760489; x=1705365289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PG45xY7qdUYvxRUhu1bd0cfdjPVsmY2YVRBeEKS5RT4=;
        b=nZQWM+wJJ44gefEw18BZ10nMa6oT5ihVpY4jSdEI3SFCEvp8rABNPa0hvK1GP5zih+
         4NA0Kzc1KXxGFVQyRrBzrvPsDs/k7dQzh6qcGdasnir/ZmeqF/NYRb7HsWczwh8NVSz5
         dviBHD5UROFTsO5+MGkRy3Wf1/1De9c4V0kNe4i3UhT52i/aqAkXbeVWFG0HOQBJ88eI
         dqw0qzp0LTHx5ublLvtxnoKi7UENyWpIBBIlLpqrlcHP3tY0rEEtzVaZLATVHujTf/ot
         GHpiJYd/cd56gdmiG5aTzHONXvIRBWLIXLTrUxsD7wxl2qDvxf2AXc9DRzG12Lt6wZlh
         WUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704760489; x=1705365289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG45xY7qdUYvxRUhu1bd0cfdjPVsmY2YVRBeEKS5RT4=;
        b=IwMLb05sjSQLeuPjq1ihQ9xPomwcqFJU+8h6AUDukHn9M5Hrse63yMQCCHUTbWJXwQ
         Y8ER/DdSGiCEebcUgqeEUlySDJXyv66ffXw00kyOE/3bJC/h9kzlb6pF2NGtH7iEfxoO
         NI9TbCegn+K1kT6oIkpMs21rnaUCtow76MC/AXjtbol0n7+F6pYjuuw25tW73HrX50is
         /Xs1Xup/fWrKHXpFI1+Vz9YM+yVQmo50+77a7S3gVWS4k8MJIg6pH0dTFnETgiBz2jfg
         YJ4by3HYy4QmNWFqyaFKhYmSU45z3B1PytFttlUDmv+8D5RqY87QK18b2qaBGQtcLeAy
         fCJA==
X-Gm-Message-State: AOJu0Yx2Cd0qh2J33NCpt6pBr0Cq7I/K1JYUaABS5rzH3d4aNLYBuzbF
	6MxxiZEFHAlerTAe5um3rXqTN8cwylywRg==
X-Google-Smtp-Source: AGHT+IGDQ8FvZzuUdUo9S0hXw8aqSkdIwxxo2l3Q6O2E6tuyGiskmVwFvAIe7TkLE3tqqtpa2dK5Jw==
X-Received: by 2002:a05:600c:4e01:b0:40e:44aa:2360 with SMTP id b1-20020a05600c4e0100b0040e44aa2360mr1711162wmq.14.1704760488777;
        Mon, 08 Jan 2024 16:34:48 -0800 (PST)
Received: from [192.168.100.48] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id fm7-20020a05600c0c0700b0040e4914f28dsm3518325wmb.18.2024.01.08.16.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 16:34:47 -0800 (PST)
Message-ID: <0cbedc75-cacf-43f8-a1f9-284546ad548a@linaro.org>
Date: Tue, 9 Jan 2024 00:34:46 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] clk: qcom: gcc-sm8250: Set delay for Venus CLK
 resets
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
 <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 12:32, Konrad Dybcio wrote:
> Some Venus resets may require more time when toggling. Describe that.

May or does ?

I'd prefer a strong declaration of where this value came from and why 
its being added.

May is ambiguous.

"Downstream has a 150 us delay for this. My own testing shows this to be 
necessary in upstream"

Later commits want to add a 1000 us delay. Have all of these delays been 
tested ?

If not please describe where the values come.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8250.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index c6c5261264f1..61d01d4c379b 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -3576,8 +3576,8 @@ static const struct qcom_reset_map gcc_sm8250_resets[] = {
>   	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
>   	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
>   	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
> -	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, 2 },
> -	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, 2 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, .bit = 2, .udelay = 150 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, .bit = 2, .udelay = 150 },
>   };
>   
>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 



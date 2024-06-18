Return-Path: <linux-clk+bounces-8176-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70190D2AC
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 15:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C9902810B2
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 13:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD9015A87F;
	Tue, 18 Jun 2024 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMpNYd40"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281D13D8B8
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716972; cv=none; b=WUNTUzbYR5wp4DifTS2rEAUXmgATueebqx1nfr/oWZh3jt/kP6PPqZv9jBZR5sf/6hr5bjGlhLQM14YblEDU+JWnLKOvYR47S1Oqm/vv+c+21YsLNzpHK1s4iCpHbQltvuJiEw88TFZG83zyOVJ7TGLkys3J+F5+GBh7oaFWH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716972; c=relaxed/simple;
	bh=cLhKZRsySXdFjzY+W77koyayg8BOMHXFhQnPCjTziDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOOquF3t4PDDUjwadWwflfrA4Y4on39yuxFWM1YMzzQrt+Gk0cfrmwlJuR9OGLa7DBNI4+jhxZ0IHHjuZj3tl9OJJMlRS6LBVbaUF06ArYRoIfBVX9lAR03LyPPTeK7y3gfyn+JLFMHuFlnFMapslvoc2ZX/0wwrRDejlhHGnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMpNYd40; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec10324791so56804941fa.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718716968; x=1719321768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cz/Qic+yN1dw4dup2qyauUs0bSkbzUv7Dw6XhgDklWk=;
        b=LMpNYd40icpDs26H4WqLaHygZCzmDj6nG3cpz4uAn5WRWnMIj4+vMDcTYOoNxBXvAZ
         4chiXOeNmXy1LRhixmJDpgXYcPj26hIY6QXD0V6WLnmr61+zQL1ef2xTbSczU87T77wC
         9rsO/keJbm2qsY1fosqDYb3lkmvATaboiLJiGOSiTu5LvJQ3zmx6OR4ssudMfytegaRp
         CEu/lzMGG0vBFaoLZ61Q0OToYepux3AIntVCYOmgo3WlDc1Qw30AptaIxqGgZoBgztC9
         MhZj9MsN31WyfyzLCPgZOIdm8KoefTXKg7jbHEd3A8KyulCjbCawuCNgZrYqUCSS7QjB
         NoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718716968; x=1719321768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz/Qic+yN1dw4dup2qyauUs0bSkbzUv7Dw6XhgDklWk=;
        b=AaTL7Rxvpukd1RYMcKyPyMCJX4fLRrg9+lFiVeZ2kovC4Slg032JMTz1FqiQjKO/j1
         TV19Ev+7wmtDvvEebk67m9tPN+cDUzpsRN7lUxEbHeLA7vL9r2wQbS/EtUq4SWcJjQIK
         BeUEaVNUMC7eoU5IdAJakf4Zad3lG8UvcMv4BdGCGYaM3kGUiWMeQtO3ADZCtQkwLZBn
         JhKKfxQIhps9ilFTWn9xfvKgg/QFARNxcmwPlmk3xnv0dil7TO55gxUCC2y8WJ3v+YK/
         DKsQSQuq8yY/4iWjLc+g8UYPqOMAvo+8h2Hbng03iHHlFLOZKxgj65xuSLf70F7fje6n
         5Szw==
X-Forwarded-Encrypted: i=1; AJvYcCWi9qtA62KzoF39UKK8vgLemBA1M045dbFyaUY6c0G8IIeVXJpgBnMhdzaVP//9C/4kUYwHzGugm0nkjypHHzopEpVOAuV3AMkC
X-Gm-Message-State: AOJu0YzYusDw+9BfDT8gJ6Jemr53pm5sbvN6ED4c0IxK/fng3KeeQqv+
	jBbNJnt9pxT1iXGWGDNXQPKfTHCHLK50N+nMehykz40gjqM52KYmWDaAws8MT2U=
X-Google-Smtp-Source: AGHT+IEBxW8WorKgj1f8yFLsdKMKt561xGH+Xblx6s0H8aCgbs1KMuYQ5voW2gXosCFALRH9RdaaMQ==
X-Received: by 2002:a2e:95c6:0:b0:2e1:ebec:1ded with SMTP id 38308e7fff4ca-2ec0e5d139emr88120351fa.25.1718716967421;
        Tue, 18 Jun 2024 06:22:47 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c9ad36sm16990071fa.135.2024.06.18.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:22:47 -0700 (PDT)
Message-ID: <b72b1965-b93f-4b71-9783-f201a17c7e36@linaro.org>
Date: Tue, 18 Jun 2024 15:22:44 +0200
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
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com, devicetree@vger.kernel.org
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
 <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/10/24 12:19, Taniya Das wrote:
> 
> 
> On 6/7/2024 3:00 PM, Konrad Dybcio wrote:
>> On 31.05.2024 12:22 PM, Taniya Das wrote:
>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>> controller functionalities. But the LPASS resets are required to be
>>> controlled from the high level OS. The Audio SW driver should be able to
>>> assert/deassert the audio resets as required. Thus in clock driver add
>>> support for the same.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>
>> Please stop ignoring my comments without responding.
>>
>> https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
>>
> 
> Sorry about that, it was not intentional. I had posted the v2 and decided to split as it was delaying the other changes in the older series which had more functional fixes.
> 
> 
> Picking your comments from the old series.
> 
> ---------------------------------
>  > -    clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
>  > +    if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {
> 
> Big no-no.
> --------------------------------
> 
> Yes, I have already moved away from it and introduced a new probe to support the subset of functionality on QCM6490.
> 
> 
> ------------------------
>  > +        /* PLL settings */
>  > +        regmap_write(regmap, 0x4, 0x3b);
>  > +        regmap_write(regmap, 0x8, 0xff05);
> 
> Model these properly and use the abstracted clock (re)configuration functions.
> Add the unreachable clocks to `protected-clocks = <>` and make sure that the
> aforementioned configure calls check if the PLL was really registered.
> ---------------------------
> 
> These were made for alignment of code, but existing approach was not touched.

That's not purely cosmetic, this now falls into the compatible-specific
if-condition, which was my issue.

> 
> ---------------------
> 
>  > +    lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> 
> Ugh.. are these really not contiguous, or were the register ranges misrepresented from
> the start?
> 
>  > +    lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> 
> Provide the real size of the block in .max_register instead, unconditionally
> -----------------
> 
> This had a little history behind this approach. During the driver development the ask was to avoid duplicating same descriptors and update runtime what is possible. That is the reason to update it runtime. The max register size is 0xC8 for resets functionality usage for High level OS.

What I mean is that, the register region size is constant for a given piece of
hardware. Whether Linux can safely access it or not, doesn't matter. The
regmap_size value can just reflect the width of the region (and so should the
device tree).

Konrad


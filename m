Return-Path: <linux-clk+bounces-2987-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668883EAAF
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 04:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1DBDB22D6B
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 03:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC7D11CAE;
	Sat, 27 Jan 2024 03:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6b5sBLL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846239475
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706327303; cv=none; b=oTtvaWi048uBlCETvdf6hyXSLFnXgQwNkHtay4oux/sW1Rh7tDNhXX5QUgRaXg5RK5ooa15OiemsUPuzcs/EYnRDRJVw7DLGV8Ffb/wrYPNoflPoGGdsoGJVyL4kGXsbzxeeuxOTcM38dRXa8ZoIhtm2cFS4RLUwKSZdDSIHFkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706327303; c=relaxed/simple;
	bh=I52GhTCmPvPY6McnPJul8fpNcyDEtefKHQkoHzciHE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEupAeWI1Zc5NKGdlgpXL7tREwPyu1HJpuiFofPKlAa17SCe/FAfrFVQicn6MTsgpUEzXBvWzrRd4fIMitLQHyuZWXxBYA1ThOTXyUt80Xkkj+wCjW1Fc89Lo+so8Ybg3UwaSEYVlQfnThDqxZSF9MQnnGKB329M7Iv1h8jWUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6b5sBLL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a26f73732c5so86825166b.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 19:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706327300; x=1706932100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGOiz2BIpCS5BRwhbbDOvMFdiaSjuzcJzAunOII+sqk=;
        b=U6b5sBLLXVghd+SiFHocPoMCZYFf932/wfu8ooZAKZSaT3jQhLO4Wj+w8PXT0TbGoX
         66jQ0ojZeaEMNRLCeMP26CR4fard+99NqBPQVzGnkaVquN6OCXJlANMWXDsWRtt4Jiw4
         XuQoWzLbfGgoOYbjec6canc8jXaJ3FtfilPOoswoCj+CbZwEUIt0OFz6clhskwtcbPq9
         LDa28z9M3Jkwvm66RZ0UsARPj4eHSlIrH1UfqD9slpBMq6/MEEuEGEdFESRGw/QCXfK4
         45BtFV6+n+JzoNNAhAyk7/ynZaB3Q+9olxxVEMYj5YzPCCy7AvndvP/Qn5BfJ21Wc1on
         HlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706327300; x=1706932100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGOiz2BIpCS5BRwhbbDOvMFdiaSjuzcJzAunOII+sqk=;
        b=Z7WyVRFw/z4xmUm48Fta+w6Bt71WvIz0vtEezoldmj+KAVM70akpbiWOs5urNrplIl
         F0POa+xeAeJSdczluTBCDNRaoE68WHK5TE9ovufw+CvD3sfXuvY39VpR8dlieXE+eBYc
         ATF/qctKNjClcoJGQv5mn8ve0hJjRqjI5eIU0XtNEI4QsyWtY7ivwMUo/+TXCuBiIl7m
         och0YHFCr1rst+5sJh8pJK0znqSUKzJBycQn6FxgVBmAux9dSmAYJyEiEA15mL8io/e4
         dbHX9yYI/ty1deaTHFFpv5lUT4MSKIJfQ6+J7E6Yze1+a3dw0MfEBXns21I12tEvchwP
         1vZQ==
X-Gm-Message-State: AOJu0Yxmu7BVbVS7G3oQtCxfJryztcvNRTMCVzGJNrt6JoPfAQsv36jM
	8/qgBEfLPjIckOPouk3GruwaxzETdcr/qKBxGiWl2X57v8tBsSadVl7+TozThH/qXYgbLDL5Vkb
	l/oU=
X-Google-Smtp-Source: AGHT+IE279fNC4zsCFfWk/XuSa41cI+pdfY+0IsRQyFSl8lYOWU/VQRkp6AdeuHR5k20q+w8ySp7kA==
X-Received: by 2002:a17:906:46d8:b0:a31:953:5869 with SMTP id k24-20020a17090646d800b00a3109535869mr450482ejs.53.1706327299691;
        Fri, 26 Jan 2024 19:48:19 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id zo11-20020a170906ff4b00b00a316ecc4badsm1300651ejb.56.2024.01.26.19.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 19:48:19 -0800 (PST)
Message-ID: <e8245820-8e71-4336-b050-cd9e0f072af1@linaro.org>
Date: Sat, 27 Jan 2024 03:48:17 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: exynos: gs101: fix usi8 default mode
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-3-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127003607.501086-3-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:35, André Draszik wrote:
> While commit 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with
> I2C configuration") states that the USI8 CONFIG is 0 at reset, the boot
> loader has configured it by the time Linux runs and it has a different
> value at this stage.
> 

ah, I didn't think about this, nor checked it.

> Since we want board DTS files to explicitly select the mode, we should
> set it to none here so as to ensure things don't work by accident and
> to make it clear that board DTS actually need to set the mode based on
> the configuration.
> 
> Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C configuration")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index aaac04df5e65..bc251e565be6 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -384,6 +384,7 @@ usi8: usi@109700c0 {
>  				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
>  			clock-names = "pclk", "ipclk";
>  			samsung,sysreg = <&sysreg_peric0 0x101c>;
> +			samsung,mode = <USI_V2_NONE>;
>  			status = "disabled";
>  
>  			hsi2c_8: i2c@10970000 {


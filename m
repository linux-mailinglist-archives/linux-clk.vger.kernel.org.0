Return-Path: <linux-clk+bounces-8207-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B964890D5F7
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 16:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E69BB2EF5B
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 14:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE1313B792;
	Tue, 18 Jun 2024 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHcLB3wX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5F2139AF
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719940; cv=none; b=cKgpPAHv+MFlv9yz7SipjtP6gt14pWwgk5Y0MD2yo5IQS94orjVO9q5+NQRGf57XlphUaOa/leBHdapt2sxuLY4is2hk3buUy78cZNNVW+NDXNzp0Z5TWiPDrkv8dd/wBK5lWO1sLxVMmR5Bwjuc5R2WGqoLCkdbCOUN8oT0hAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719940; c=relaxed/simple;
	bh=0av22ofhvv+G1ykCXRTuar9N3ZcJAK8et2AWxSzeNng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxijvRy+jj/R4iJNg6/EGXGagdVz1l/64ICFmhlYi8wOBDOZvcnuREkNE+gjGOMYvueTs+SUYLuuKali4EPFYpIrfNHXTFQAnBaqCEWqXBM+RDPiYiW5CUJbFZ/KN1X9F3VjR+p9CSSo5Dme4JjTrPkUlYOjUrbpjeHTwk7JhY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHcLB3wX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c89d6b4adso4981514e87.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719936; x=1719324736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6Y4EgoXPRwJTHBawpiMcURy3sFFDfTP4JTr3Ev81mc=;
        b=zHcLB3wXjK+ILG4tqLn10gDyPTobyjq3vbYbYoJpgiFaaLLSPrjSNPkr+J70bNvIPB
         c9IDDMsYOyvHsHJP1XW99NAA+W67toVRsAQOZ4RpyUveH3Pubmya05ciSRISXpOcvFYR
         ZMffKD3/nJIg+chWgC4KCFvS2/n8z4eWoIT3LWgKxyNSoyf1qnGKQQC2gCvBdf5rW09t
         Y8irguPBPNq8aNomobzsz4en2p1fECywlfqcdcwGSqfqyesVYK0uv1ibcpc/CvIVRTeu
         EqB+wYT8DMioCoTch5Hn8LX2uxRkWu8hhztrClpnu0GMlRsekb7pUTC3+5mDmcnFYnmT
         dLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719936; x=1719324736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6Y4EgoXPRwJTHBawpiMcURy3sFFDfTP4JTr3Ev81mc=;
        b=eNbrLljALe/pbYXAyonznkDW5P1f13xQasVaJReRbqeleER/Je7BAuwLYU+E5tKqd6
         PrntQIded65VaAQhDTmnBdPKkWt67OA8zCF5Wo7rzSwLjjfgi6WIB3by9nfghdPpZgJ5
         Hpc4MB8RX63pGKD/cUQaxwjHPOnl/acZBhWgozoM80qk03zM7FHaE6yTqV5u74WJUexy
         4xx1h2NdE1Bix19N9lCmMH+glCavRPsO9wSgtC3XuUScytkX77/XtG57ob62PomlkmF5
         +gZE4LVDvUVdLvL8nDoG7Pnn+IM+zG8MwLFDWKLK6PlUrovmmLjR1UGtPOmdgf2bAemA
         n8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVHFewAan+vDgLD8vXyOXOGBX04O8tjrae8NcK/bH2KiJsqX8r5G0GkHAZoMsgFX0PVgKv64ia6WcGQaPx2VpgXo4sGOIANgcEX
X-Gm-Message-State: AOJu0Yx/3S12ubcRhADj4KSOXbis4tMOCT1oVrQn+snWIHpFQ54YTfEo
	tk6rtRvRwZhIYpQN3ipfQvgGLf8lfKNuW1pmVfG3ZxqbKInCujey6pfKX1Gh6sw=
X-Google-Smtp-Source: AGHT+IGZaIibqfCcQvl/1r3MYhEg7Ikhi/ZBC3FSzVQkmqP3CbCr8ETdFAVMl4V1LEjW+9OKcHaQjQ==
X-Received: by 2002:a05:6512:15a:b0:52c:958a:4afa with SMTP id 2adb3069b0e04-52ca6e65889mr7126633e87.23.1718719936329;
        Tue, 18 Jun 2024 07:12:16 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888658sm1508463e87.298.2024.06.18.07.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:12:15 -0700 (PDT)
Message-ID: <13fea5c0-5906-4075-b734-52649e35eb69@linaro.org>
Date: Tue, 18 Jun 2024 16:12:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] arm64: dts: qcom: starqltechn: add new features
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-23-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-23-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Add support for new features:
> - sound (headphones and mics only)
> - gpu
> - panel
> - buttons
> - MAX77705 MFD:
>     - charger
>     - fuelgauge
>     - haptic
>     - led
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Please split this up

>   .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 593 ++++++++++++++++++++-
>   1 file changed, 592 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index bad154b1e894..28a5210e22fb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -7,15 +7,40 @@
>   
>   /dts-v1/;
>   
> +#include <dt-bindings/input/linux-event-codes.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +
>   #include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "sdm845-wcd9340.dtsi"
> +
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
>   
>   / {
>   	chassis-type = "handset";
>   	model = "Samsung Galaxy S9 SM-G9600";
>   	compatible = "samsung,starqltechn", "qcom,sdm845";
>   
> +	aliases {
> +		serial0 = &uart9;
> +	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +		constant-charge-current-max-microamp = <2150000>;
> +		charge-full-design-microamp-hours = <3000000>;
> +
> +		over-voltage-threshold-microvolt = <4500000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4350000>;
> +	};
> +
>   	chosen {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -59,9 +84,199 @@ memory@a1300000 {
>   			ftrace-size = <0x40000>;
>   			pmsg-size = <0x40000>;
>   		};
> +
> +		/* The rmtfs_mem needs to be guarded due to "XPU limitations"
> +		 * it is otherwise possible for an allocation adjacent to the
> +		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
> +		 */
> +		rmtfs_lower_guard: memory@fde00000 {
> +			no-map;
> +			reg = <0 0xfde00000 0 0x1000>;
> +		};

qcom,use-guard-pages instead


> +
> +		rmtfs_mem: rmtfs-mem@fde01000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xfde01000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;

QCOM_SCM_VMID_MSS_MSA

[...]

> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
> +		 * random crashes which are most likely modem related, more testing needed.
> +		 */
> +		removed_region: removed-region@88f00000 {
> +			no-map;
> +			reg = <0 0x88f00000 0 0x1c00000>;

Please keep no-map below reg for consistency

[...]

> +
> +&gmu {
> +	status = "okay";
> +};

Drop this and remove the disablement in 845.dtsi, gmu is only probed when
GPU is

[...]

>   	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;

Do you know what these are for?

Konrad


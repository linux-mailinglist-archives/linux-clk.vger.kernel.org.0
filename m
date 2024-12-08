Return-Path: <linux-clk+bounces-15555-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDEF9E8662
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 17:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188D0162681
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 16:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00DF160783;
	Sun,  8 Dec 2024 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mmZE8whE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300715A87C
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675322; cv=none; b=AyGk/Se+PSckx086JMqFaW6znVzFdZLzR016HU/+rGHCuWMLEwfuyew5XMpuEBR43T/RfsXLMafQrdiyjFRUeyt3kQcIFkS8e4SZm8K7spgD9pK/jXlzwf9uFeA1RphOxtWgjF7NPc47viog/9atAOzoIO2aGoy+7FEqWr5DiMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675322; c=relaxed/simple;
	bh=hYB80iWRTe90z5X6pL7s2FzmYp7wlmv5c/yIhpESuE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0Hpk8IjXndXLNSjAiScOa+uQGl1Q7YZtp/GetH5jUkw8lCffTAGYgFWIC8VQrlgttgGhzaoOM0Y8TPpugqsSWdf0kyQKqeQEFVWFeuz542aZmb0/L3QPqdcH3/5sv0f4Oac9ZejXwW1/L4HfzU6aZgvo/yQsKR40C3p6cRmiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mmZE8whE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e44654ae3so582752566b.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675318; x=1734280118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJ9zDfo2f2Yv53BkEGS2AmppjL4tbY9W1UsetYnRiis=;
        b=mmZE8whE6e36rl9A3QZJCXbGQEf0HSD+csQz2dZ1ELfAP+rD+yzar3TYtKD91EBJy3
         BLQpna0bRj0TRx+odvb0A3YjcGJyBO7Iwf1nS0/euz2XipZXxLsrQUEwHVVoJYOXw6ff
         mPlY+JOoKLh1RWjbjcirRve7ctgZKmNDsr+VcBPt4cHa8XpEZsdmVTM/2ciIS/FOI2+K
         YtyB70a1R6TRMz+B8GE82bZl4IqsVMehA4hJwQfTYINW5PcPHMQpuXI/LoAkPnanV6UO
         KhzXdgssvEbb6c9XcvuPIiS2TZNAUMzX4Et4WVO7hVjyW1KVsxjkEvNi8kYwj6kLDChp
         Zx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675318; x=1734280118;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ9zDfo2f2Yv53BkEGS2AmppjL4tbY9W1UsetYnRiis=;
        b=HjWZqP5o/8IeUfX38ZsJzj8O9P1dUlCoPO7vIkI16sJzOCx2RHEIO4A73ewRY+1W89
         iX3I9IqZQlIZSrsL16EuPQh3s+p7k5oq8k+YSXEoSQN9TMSZWPiDfmQqx4yznD7/II/a
         gmteze3EOcP7Q4peUEZB7GndwbouKQl0s5BGNoMMtrL9pWDMsnay2tlHseQ5c6qrxnHr
         QOgxJS/0eHw1dmy72HhgFgRpxJIyY9hyxguRPxKJ3hfeGAWJ0KA8Jr/LmYy1V9GBQHzR
         ia1Ldj2EsPEFMl1/62S94ZXMxj7J90myFmoC90DkynQSdlUhORae26O0spTDSrGjrLXP
         o3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWnzhk3szToH+LgUGiBT0aRJP5iZ060vKg75YjfQH6ju3j0zqitqDlfwC4X2gj1NMNwhcgPs9+R0qY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEaWB3Rok3bFGprvpKYVtRThCheBImz1gyhw6lFeClUkr2yEp
	DdVx0bYnk08UG8vzctKquwpw0iPSmi3b97A0mpahLAg7b8cLPvPg9FEaf6EeziI=
X-Gm-Gg: ASbGncsaGb3JOavSWLmBNInE+F6I375G8Ik+MRnaeXaRbWloWVkWKhbdSqW99BQTaSo
	YEstGW2eSzSqLu1OSmTm2Zjd4ntLjwML9A6C/QV5mViNo8hN6T1XgKcyPf2DrdHTpOX2XjWwDwk
	br7mvI9ydZLGeWin32IWsJ/P4u6CnO+BTEccmHX5pC4/yrMtkjrm9T1/7QH6Z6VKmvwcOqw1+2U
	4NlljuI5fyvsuGhPwEY0CEok3GTxHoIHWmjCqejqcQLWHEHzJA2dcZuzhI=
X-Google-Smtp-Source: AGHT+IGcOCgbkrLR6Mpnk12j6gYHe9+3M3ljpUKN28uR+xLgWfR9U7iSuflel0onnZN7HR6QpmpyTA==
X-Received: by 2002:a17:906:2932:b0:aa6:8275:2239 with SMTP id a640c23a62f3a-aa682752399mr140584066b.57.1733675318442;
        Sun, 08 Dec 2024 08:28:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:28:37 -0800 (PST)
Message-ID: <9a6c1dfe-cf4d-41fc-a0f4-b6a111a40c94@tuxon.dev>
Date: Sun, 8 Dec 2024 18:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] ARM: dts: microchip: add sama7d65 SoC DT
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <f62e2600a8e88e4be9d87b346c41bb4781f8f667.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <f62e2600a8e88e4be9d87b346c41bb4781f8f667.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add Device Tree for sama7d65 SoC.
> 
> Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> new file mode 100644
> index 000000000000..0dcd80690210
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
> + *
> + *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries
> + *
> + *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/mfd/at91-usart.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 family SoC";
> +	compatible = "microchip,sama7d65";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
> +			clock-names = "cpu";
> +		};
> +	};
> +
> +	clocks {
> +		main_xtal: clock-mainxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		 slow_xtal: clock-slowxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		pioa: pinctrl@e0014000 {
> +			compatible = "microchip,sama7d65-pinctrl";
> +			reg = <0xe0014000 0x800>;
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		pmc: clock-controller@e0018000 {
> +			compatible = "microchip,sama7d65-pmc", "syscon";
> +			reg = <0xe0018000 0x200>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#clock-cells = <2>;
> +			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
> +			clock-names = "td_slck", "md_slck", "main_xtal";
> +		};
> +
> +		clk32k: clock-controller@e001d500 {
> +			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
> +			reg = <0xe001d500 0x4>;
> +			clocks = <&slow_xtal>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sdmmc1: mmc@e1208000 {
> +			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
> +			reg = <0xe1208000 0x400>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 76>, <&pmc PMC_TYPE_GCK 76>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
> +			assigned-clock-rates = <200000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
> +			status = "disabled";
> +		};
> +
> +		pit64b0: timer@e1800000 {
> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
> +			reg = <0xe1800000 0x100>;
> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
> +			clock-names = "pclk", "gclk";
> +		};
> +
> +		pit64b1: timer@e1804000 {
> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
> +			reg = <0xe1804000 0x100>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 67>, <&pmc PMC_TYPE_GCK 67>;
> +			clock-names = "pclk", "gclk";
> +		};
> +
> +		flx6: flexcom@e2020000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2020000 0x200>;
> +			ranges = <0x0 0xe2020000 0x800>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
> +			status = "disabled";
> +
> +			uart6: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;

Vendor specific props would be at the end, before states, according to [1].
I'll adjust it while applying.

[1]

> +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
> +				clock-names = "usart";
> +				atmel,fifo-size = <16>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		gic: interrupt-controller@e8c11000 {
> +			compatible = "arm,cortex-a7-gic";
> +			reg = <0xe8c11000 0x1000>,
> +			      <0xe8c12000 0x2000>;
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +		};
> +	};
> +};


Return-Path: <linux-clk+bounces-15558-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1B9E8677
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 17:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADF7163B2B
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C71170826;
	Sun,  8 Dec 2024 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ntUqRQ+t"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A840D158535
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675575; cv=none; b=aT8C80yCQ5mxcLUD6IwTM1YgLl6AGJ2md8xCS2qrWBQ2j3u5hZlXFghU9UauYFc4Rp9zje0AHjz3Avtxu192oFOnyU/vklArjPqPiOMVSjd6hkLItLXZVOY06cfhFKS+mU5ZVU5E+B5DqZMBdswrq1202bMJSt5HftQj4ypblfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675575; c=relaxed/simple;
	bh=mEZ/jE4y/qe+hPVFP7hFqEwQoyv2o72dhmkoFCaYAD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji7Gw5xnPCb2WabR2pz5KAEZwbi3oZReapxj12oNP1o4Viki40ekTQEGumYPRRqsou9fSIH5kUoqkGMcZszLpurlJMSEW6952iwqYiytz9ABkkyYZ+giCuIA2nzXXUQNGNOCWJX/cuxRHI1hyyyFqeq5+exxecrJYONduz8NrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ntUqRQ+t; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa66ead88b3so142308266b.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675572; x=1734280372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NqubRXx7yB7hllGexLKx/eAFws2OmJDZVjdgSdgh80=;
        b=ntUqRQ+tGgzOMAbGxnFQII1n1TAxpQ6vyAD9k10SFP7v6oaWk4jSpBqWJAyzHCpLIk
         QDSxTg4GYp7vCGcanTSnTDYr2QyLGcoLFBC7NMiodQpW3Zmjjosl9oM55FMWquUP2DhT
         f+2ljc5RGbuhCPj+lft+FFyb8GM4xSaBGqR0Xpb26CmNoT79QfcIr6ieP6XEbJy1OWoQ
         lrAU7fX8mQc/6nAOV1lJbxWrjp38qLla+zs3dSJAfF57SvFXT/1/o1usMF2hf9YFzzlP
         /N94nNx81VCjz1qWpyzgkLbPDMi9+zjP873yy/S4iF1aem9/YfoubvbNtNIswAgMN/Ge
         dNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675572; x=1734280372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NqubRXx7yB7hllGexLKx/eAFws2OmJDZVjdgSdgh80=;
        b=v1vrb4fc23w4cQKByK+yl+WvWBxPiQUv23xSUSL5LA0pfWfhecwH8zsJEx2njIzbar
         6Vom/mJRN8bpJI3qAoqiBw+ZNXLn0CjdiEVh8+7dNfGUe7b4vUzRKOwdd6nj5/hxWwVm
         ztEm5+uZ/UrT4tQ1TwAY3K6VQoaG1QD5LM7ZQ0FHK+JmfcKLv4x2RdYqYO26aeisJycA
         u1jqwzY7kzymcHzfkmS5bo5m74WunWsL45KlBdmZqxmvzv3ZDOZcrjk8mcZM3s1GyJLv
         TdEeu5Eh6HsnOqAfJtj9P4xuFBNxCGTQDwQGMA3Pzqi762/y01T5nHosEOPN3nwqsPw6
         RFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/+UGJXekybtOWGIhPTIq50Mj3U28dA9fEi816zPtvYuiBJ+WzsonxWtk8q5itWOG3gLOweGw3CKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rIUxDTWPXue18U2sWAFwaU9I81PLgFSBCWLJOAHrKfH0QrP8
	PMl749AN7cFPcpMAjlC7DrWSCyvPS4bO9xB5pN8GF/xK6gBzg/1hN29UpORaLok=
X-Gm-Gg: ASbGncvGOWVoQwKO1+L+PbE9hnYOiqAFMjiy/IsIdpJvWvhaAuqE9QBT1zCO3YBVyxH
	bnif8pPa9FzackyaA7utORmP7NO0CRr+JMFIiETi7EP8iXHkRgZgiRoDe7BpMW7U46H49wwpkOg
	bP4AU9SwLouo91tP188rNU4r5DK8eb+ewD6AgiwCC+5tb6+gNPI/+O/QLS8nSpDwDQ4H6BLayiP
	Htpj8D5MUWZylGbenm59EhTND5RIGvFGftYO4CkNarCq09m5qjtqSqBAjo=
X-Google-Smtp-Source: AGHT+IEUKJnEgo2CRNB3itUfMNJATZ2OLCvbnr9j7GstLcYIkSd9q+ba/XoJW8mC6JiCchqLDbOmSQ==
X-Received: by 2002:a17:907:9556:b0:aa6:6ece:8eb1 with SMTP id a640c23a62f3a-aa66ece9010mr420788466b.54.1733675571952;
        Sun, 08 Dec 2024 08:32:51 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67a4f8dc2sm113804466b.179.2024.12.08.08.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:32:51 -0800 (PST)
Message-ID: <81c686e4-2671-4237-a4d4-cac6cf269d9f@tuxon.dev>
Date: Sun, 8 Dec 2024 18:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: microchip: add support for
 sama7d65_curiosity board
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
 <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add device tree support for the SAMA7D65 Curiosity board.
> Update the Makefile to include the new device tree file.
> 
> uart6 is related to flexcom6, hence not sorted in alphabetical order.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |  3 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 89 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 470fe46433a9..79cd38fdc7da 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -12,6 +12,7 @@ DTC_FLAGS_at91-sama5d2_xplained := -@
>  DTC_FLAGS_at91-sama5d3_eds := -@
>  DTC_FLAGS_at91-sama5d3_xplained := -@
>  DTC_FLAGS_at91-sama5d4_xplained := -@
> +DTC_FLAGS_at91-sama7d65_curiosity := -@
>  DTC_FLAGS_at91-sama7g54_curiosity := -@
>  DTC_FLAGS_at91-sama7g5ek := -@
>  dtb-$(CONFIG_SOC_AT91RM9200) += \
> @@ -90,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
>  	at91-sama5d4_xplained.dtb \
>  	at91-sama5d4ek.dtb \
>  	at91-vinco.dtb
> +dtb-$(CONFIG_SOC_SAMA7D65) += \
> +	at91-sama7d65_curiosity.dtb
>  dtb-$(CONFIG_SOC_SAMA7G5) += \
>  	at91-sama7g54_curiosity.dtb \
>  	at91-sama7g5ek.dtb
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> new file mode 100644
> index 000000000000..3aab2c542d98
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  at91-sama7d65_curiosity.dts - Device Tree file for SAMA7D65 Curiosity board
> + *
> + *  Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries
> + *
> + *  Author: Romain Sioen <romain.sioen@microchip.com>
> + *
> + */
> +/dts-v1/;
> +#include "sama7d65-pinfunc.h"
> +#include "sama7d65.dtsi"
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/pinctrl/at91.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 Curiosity";
> +	compatible = "microchip,sama7d65-curiosity", "microchip,sama7d65",
> +		     "microchip,sama7d6", "microchip,sama7";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	aliases {
> +		serial0 = &uart6;
> +	};
> +
> +	memory@60000000 {
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;
> +	};
> +};
> +
> +&flx6 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
> +	status = "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6_default>;
> +	status = "okay";
> +};
> +
> +&main_xtal {
> +	clock-frequency = <24000000>;
> +};
> +
> +&pioA {

Compilation fails for this:

Error: ../arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts:50.1-6
Label or path pioA not found
FATAL ERROR: Syntax error parsing input tree

Thank you,
Claudiu

> +	pinctrl_sdmmc1_default: sdmmc1-default {
> +		cmd-data {
> +			pinmux = <PIN_PB22__SDMMC1_CMD>,
> +				 <PIN_PB24__SDMMC1_DAT0>,
> +				 <PIN_PB25__SDMMC1_DAT1>,
> +				 <PIN_PB26__SDMMC1_DAT2>,
> +				 <PIN_PB27__SDMMC1_DAT3>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +
> +		ck-cd-rstn-vddsel {
> +			pinmux = <PIN_PB23__SDMMC1_CK>,
> +				 <PIN_PB21__SDMMC1_RSTN>,
> +				 <PIN_PB30__SDMMC1_1V8SEL>,
> +				 <PIN_PB29__SDMMC1_CD>,
> +				 <PIN_PB28__SDMMC1_WP>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +	};
> +
> +	pinctrl_uart6_default: uart6-default {
> +		pinmux = <PIN_PD18__FLEXCOM6_IO0>,
> +			<PIN_PD19__FLEXCOM6_IO1>;
> +		bias-disable;
> +	};
> +};
> +
> +&sdmmc1 {
> +	bus-width = <4>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sdmmc1_default>;
> +	status = "okay";
> +};
> +
> +&slow_xtal {
> +	clock-frequency = <32768>;
> +};


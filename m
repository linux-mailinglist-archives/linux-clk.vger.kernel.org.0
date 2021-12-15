Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D88475E17
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 18:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245103AbhLORB5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 12:01:57 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56948
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245087AbhLORB4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 12:01:56 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 14023409F7
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639587714;
        bh=ua5qb5nFY81vgOt5kxLJBnp2szCMYKk8dwQOz31xvjs=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=J9aR0OHpFsHBcRCq6xdB/kdkiEDvly/LAeINkKHTizS9iWh9ZXJJ4bFHyrDgKiQMh
         1i/NKE2ibD/Sg7a3EUwUmlvu8Xt0xyfEMS6+2SOCniQ1fhqFEYDld5cjXKhRIPAR4P
         bzcod4wYKUjcHG6GhSWWTurFgupwuh1di1auZGMQkLHY5mkmwLMogtvJ95Mtja5S49
         fJJz73ygKIxodvU58Yus72T00IrCb8/CEI4ISy+VEaBX6EE4gzJTP1yO9tV9kC47Pn
         8W5IrJDHUMND4bZlniJGwgE9uZj+fyPra2mKNzbcSmZwlvlZeBvHwTzhobyMKNrkwC
         RGTPRRUAHSwBA==
Received: by mail-lj1-f199.google.com with SMTP id r20-20020a2eb894000000b0021a4e932846so7298230ljp.6
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 09:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ua5qb5nFY81vgOt5kxLJBnp2szCMYKk8dwQOz31xvjs=;
        b=eifxMBlT8OGpEZWxZqqki3CnFtlPIVBh/NLVtYkjXLZe3OyasY6elrlcrk5i8qUgRs
         nSDkSK56iu4lUEZO3RAR8dlwN86SpP8zQGJfCnmu3NHqqYKSci2+IA4aC/lDK2zW3ujZ
         eTI8442r0fNMFZvR+ZB6Mu1XnwqRxHTUIHdmNTqVTyHD3ZDOjBnfV5WHFRn29O28AhVk
         MJzWWcbXKHsLuuJNMXR0zxMF2i1v7JMcV9mpqiaXFrnnqaKAArKCt4kY9p0spiHj+8NV
         V1JSdcoD5r2Vk8zjd2b+jnrvW9If9WNtv3+HVVHnRTO6PhGZ4BiVJVOfrFDEzAnacKqs
         Ze0w==
X-Gm-Message-State: AOAM533mFXORVhs/iL4MaIYNnnQpcXgCA9MQ64RcBTtKlSbBr9Xyu/m8
        BZGFYQRdAm8GlUviteE3Vf6nmkjBBwbhcqLRqwTdqYSKFHHCob1nETUn1CaSbOQGX0DIuJn2/BP
        9oce6xtxPHIR198hfdwzR1rd+UgFjauu7YNWsSA==
X-Received: by 2002:a2e:720b:: with SMTP id n11mr11044364ljc.351.1639587712873;
        Wed, 15 Dec 2021 09:01:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5AIJI9fuL3e/q4W7U9kIyGnMMm0MRhi+//KOQJ0JEfCXqvXmXNhGad0JftCvq4EuFCpGLpw==
X-Received: by 2002:a2e:720b:: with SMTP id n11mr11044320ljc.351.1639587712529;
        Wed, 15 Dec 2021 09:01:52 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z24sm402607lfh.289.2021.12.15.09.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:01:52 -0800 (PST)
Message-ID: <239e30fa-7994-fcb2-5b83-27ae00ca8cbc@canonical.com>
Date:   Wed, 15 Dec 2021 18:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 7/7] arm64: dts: exynos: Add initial E850-96 board support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211215160906.17451-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/12/2021 17:09, Sam Protsenko wrote:
> E850-96 is a 96boards development board manufactured by WinLink. It
> incorporates Samsung Exynos850 SoC, and is compatible with 96boards
> mezzanine boards [1], as it follows 96boards standards.
> 
> This patch adds minimal support for E850-96 board. Next features are
> enabled in board dts file and verified with minimal BusyBox rootfs:
> 
>  * User buttons
>  * LEDs
>  * Serial console
>  * Watchdog timers
>  * RTC
>  * eMMC
> 
> [1] https://www.96boards.org/products/mezzanine/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   3 +-
>  .../boot/dts/exynos/exynos850-e850-96.dts     | 157 ++++++++++++++++++
>  2 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index b41e86df0a84..803548ccc537 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos5433-tm2.dtb	\
>  	exynos5433-tm2e.dtb	\
>  	exynos7-espresso.dtb	\
> -	exynosautov9-sadk.dtb
> +	exynosautov9-sadk.dtb	\
> +	exynos850-e850-96.dtb

Alphabetical order please, so before autov9.

> diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> new file mode 100644
> index 000000000000..fd611906d81c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * WinLink E850-96 board device tree source
> + *
> + * Copyright (C) 2018 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2021 Linaro Ltd.
> + *
> + * Device tree source file for WinLink's E850-96 board which is based on
> + * Samsung Exynos850 SoC.
> + */
> +
> +/dts-v1/;
> +
> +#include "exynos850.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +#define BOARD_ID	0x0
> +#define BOARD_REV	0x2

No need for define for single-used constant.

> +
> +/ {
> +	model = "WinLink E850-96 board";
> +	compatible = "winlink,e850-96", "samsung,exynos850";
> +	board_id = <BOARD_ID>;
> +	board_rev = <BOARD_REV>;

Unknown properties. They need dtschema.

> +
> +	chosen {
> +		stdout-path = &serial_0;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_voldown_pins &key_volup_pins>;
> +
> +		volume-down-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volume-up-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 7 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		/* HEART_BEAT_LED */
> +		user_led1: led-1 {
> +			label = "yellow:user1";

Add where applicable:
1. function, e.g. LED_FUNCTION_HEARTBEAT, LED_FUNCTION_WLAN, etc,
2. color constants.

> +			gpios = <&gpg2 2 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		/* eMMC_LED */
> +		user_led2: led-2 {
> +			label = "yellow:user2";
> +			gpios = <&gpg2 3 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "mmc0";
> +		};
> +
> +		/* SD_LED */
> +		user_led3: led-3 {
> +			label = "white:user3";
> +			gpios = <&gpg2 4 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "mmc2";
> +		};
> +
> +		/* WIFI_LED */
> +		wlan_active_led: led-4 {
> +			label = "yellow:wlan";
> +			gpios = <&gpg2 6 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "phy0tx";
> +			default-state = "off";
> +		};
> +
> +		/* BLUETOOTH_LED */
> +		bt_active_led: led-5 {
> +			label = "blue:bt";
> +			gpios = <&gpg2 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "hci0rx";
> +			default-state = "off";
> +		};
> +	};
> +};
> +
> +&oscclk {> +	clock-frequency = <26000000>;
> +};
> +
> +&rtcclk {
> +	clock-frequency = <32768>;
> +};
> +
> +&usi_uart {
> +	samsung,clkreq-on; /* needed for UART mode */
> +	status = "okay";
> +};
> +
> +&serial_0 {

Order all phandle overrides by phandle name, so:
&oscclk
&rtcclk
&serial_0
&usi_uart
...

> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>;
> +};
> +
> +&watchdog_cl0 {
> +	status = "okay";
> +};
> +
> +&watchdog_cl1 {
> +	status = "okay";
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&mmc_0 {
> +	status = "okay";
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	cap-mmc-highspeed;
> +	non-removable;
> +	broken-cd;

Is it correct to have non-removable (typical for eMMC) and broken CD?

> +	mmc-hs400-enhanced-strobe;
> +	card-detect-delay = <200>;
> +	clock-frequency = <800000000>;
> +	bus-width = <8>;
> +	samsung,dw-mshc-ciu-div = <3>;
> +	samsung,dw-mshc-sdr-timing = <0 4>;
> +	samsung,dw-mshc-ddr-timing = <2 4>;
> +	samsung,dw-mshc-hs400-timing = <0 2>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sd0_clk_pins &sd0_cmd_pins &sd0_rdqs_pins &sd0_nreset_pins
> +		     &sd0_bus1_pins &sd0_bus4_pins &sd0_bus8_pins>;
> +};
> +


Best regards,
Krzysztof

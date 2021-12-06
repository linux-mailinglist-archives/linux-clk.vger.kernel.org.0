Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA67E46912F
	for <lists+linux-clk@lfdr.de>; Mon,  6 Dec 2021 09:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238901AbhLFINL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Dec 2021 03:13:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37110
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238896AbhLFINK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 03:13:10 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B75C3F19E
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638778178;
        bh=xbKWVBOkgqsgcBD1KGhBdy+CT27h+dX2Zy6EhoI3sik=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HBGGIPsiHx+YMNnTm/HEzal02g3HSy/e2/jhCwV27K9Pfn5rEQUnG1Rs9UbqUTbSb
         lkYOBl11kH98zhX/emqnIVBBNfC2paOYQxrAGzghGwjU1aTjogawDySp+h6BLVzvvf
         ucgikUzPWTUnTv6393HiZbtgEkI3Etpn36EvjVidyMXZdnoaIz8SzrioDLFWrDtBVU
         4ttj6qHyqInM5yfcsxo+1yaGSkSHNtjMYbD10+D0zr0ncht2se+EAwYelPa/SlTgxG
         6k2XhNta/BTMB5EWOxCGVAV72adwfv1KSYWJWzL0fJVR9VBB6yHWo29NQKbnagpum6
         lzfrUT4EI4Jxw==
Received: by mail-lf1-f72.google.com with SMTP id m2-20020a056512014200b0041042b64791so3555289lfo.6
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 00:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xbKWVBOkgqsgcBD1KGhBdy+CT27h+dX2Zy6EhoI3sik=;
        b=OsYWmlMQO8dYn6JFm2ot8tzoiP1YSHQy+BqstIWj3c2juet6BjJN+lcWspBbRatKj3
         S6UnOtcrFqxRI9dUNghx19zH/+q18MI2FkVR1iy7vt1aranjkwoiov6uBnKlwOTkGbQw
         T64bcSB9GKK6CGFlOt6wBgolZcZFDZgAVad+qqn0bmrw8AXu6oRIsLtO+tNq0GUns9D1
         80jRAnJ4E3GIxKcFrm6F8GzCB6tnFS6fkKxJfr2hgDtfHef+giYLKP3zsj7euvikUzjj
         AkzzPnpeb8GAwLOM8o9lTCBQnADSNq7K2CBvv8cMfUijNlWIo4rub1pPITFN7Nzo40Gn
         gnqg==
X-Gm-Message-State: AOAM5307H59EECPtygfNpMvFmLK8rSwsUfQs8H9E9FX20iA0HJtR3f1A
        bj5mw5mMbJVFI1FNR4PiouLrefIjlaTh//aUmemlxhAByIUVinnLvtK5uaVXbmB6BL3EdwkeIxu
        D7U56OBizjlcdZTGm96qW48K2+m3Fn9IbiPnJsg==
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr34244909ljp.362.1638778177584;
        Mon, 06 Dec 2021 00:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa9/gy7ilKYal+fHw0EW216F8OxYvB0taO5KnXc7mexQqRH6+sykgdWELdhhZBTMk4J+Qttg==
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr34244885ljp.362.1638778177404;
        Mon, 06 Dec 2021 00:09:37 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l18sm1287881lfc.246.2021.12.06.00.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:09:37 -0800 (PST)
Message-ID: <f19cae1e-1d2d-33e8-8d16-63da19d025e6@canonical.com>
Date:   Mon, 6 Dec 2021 09:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: Add initial device tree
 support for Exynos7885 SoC
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211205230804.202292-1-virag.david003@gmail.com>
 <20211205230804.202292-8-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211205230804.202292-8-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/12/2021 00:08, David Virag wrote:
> Add initial Exynos7885 device tree nodes with dts for the Samsung Galaxy
> A8 (2018), a.k.a. "jackpotlte", with model number "SM-A530F".
> Currently this includes some clock support, UART support, and I2C nodes.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Remove address-cells, and size-cells from dts, since they are
>     already in the dtsi.
>   - Lower case hex in memory node
>   - Fix node names with underscore instead of hyphen
>   - Fix line breaks
>   - Fix "-key" missing from gpio keys node names
>   - Use the form without "key" in gpio key labels on all keys
>   - Suffix pin configuration node names with "-pins"
>   - Remove "fimc_is_mclk" nodes from pinctrl dtsi for now
>   - Use macros for "samsung,pin-con-pdn", and "samsung,pin-con-pdn"
>   - Add comment about Arm PMU
>   - Rename "clock-oscclk" to "osc-clock"
>   - Include exynos-syscon-restart.dtsi instead of rewriting its contents
> 
> Changes in v3:
>   - Fix typo (seperate -> separate)
> 
>  arch/arm64/boot/dts/exynos/Makefile           |   7 +-
>  .../boot/dts/exynos/exynos7885-jackpotlte.dts |  95 ++
>  .../boot/dts/exynos/exynos7885-pinctrl.dtsi   | 865 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 438 +++++++++
>  4 files changed, 1402 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885.dtsi
> 

(...)

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> new file mode 100644
> index 000000000000..e85a6b988beb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos7885 SoC device tree source
> + *
> + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
> + * Copyright (c) 2021 Dávid Virág
> + *
> + */
> +
> +#include <dt-bindings/clock/exynos7885.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "samsung,exynos7885";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_alive;
> +		pinctrl1 = &pinctrl_dispaud;
> +		pinctrl2 = &pinctrl_fsys;
> +		pinctrl3 = &pinctrl_top;
> +	};
> +
> +	/*
> +	 * We should have two separate nodes for a53 and a73, but we have
> +	 * no documentation about which interrupts belong to which one.
> +	 */

Interrupt affinity suggests it. Interrupts 82 and 83 are for Cortex A73,
so you should have something like exynos5433.dtsi, but of course with
different amount of cores in each cluster and proper compatibles.

You can test working ARM PMU with perf, e.g.
$ perf list | grep Hardware
$ perf stat -e
task-clock,cycles,instructions,branches,branch-misses,cache-misses,branch-load-misses,branch-loads

The current solution with one PMU and SW-model compatible might work
fine, but it does not look correct.

> +	arm-pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu6>,
> +				     <&cpu7>,
> +				     <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>,
> +				     <&cpu4>,
> +				     <&cpu5>;
> +	};
> +

Rest looks good.

Best regards,
Krzysztof

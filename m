Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E2C492DAD
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jan 2022 19:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348282AbiARSqq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Jan 2022 13:46:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37218
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348241AbiARSqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:46:46 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 439813FFDE
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531605;
        bh=32Jm3LsNIi8MgZskZsMja/2tuyI7FtQJGucbg9PscFM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=aVXZjKxZVWvhzcqaXzer00mZTKyo1/Osa6ZvMSbLjOI7AxxQknRxrimaN6mS7bUwh
         e7AEyLMyCNfbOEaVKCy11aGPkXA37IQDlBRgwIFc4a446aV9RDQ+1rw8gjKzZrN9o3
         DLOsYbnQis6/gqFz59LoUctadaxgd8Cl4C9iwF45h1SvpAXJ/9IlBrWVtvXoqts56e
         yfSZ+3xb9B9dX5AgeLm/RjqI0bfAS+N2oNI3xySotSJOwpoiTXd+8WTBYFrbWm2/7+
         EbTa2sBbRxKCHG9D917vB4lC2OUlYJsGJXTrHYNy+QjZY7HGpJpVUJSPwF06VJOxqE
         OS5p0GT+HhvjA==
Received: by mail-ed1-f71.google.com with SMTP id a18-20020aa7d752000000b00403d18712beso809723eds.17
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=32Jm3LsNIi8MgZskZsMja/2tuyI7FtQJGucbg9PscFM=;
        b=68gDtaY1Le/ITlsDsxSuMqEFjdWJFsrRgt60BDNCqV4u1diLFpwLIGhhumOld85fRs
         3iFDesSUmM5u8XoC6Grl4J9AsnDQWC4Ofphc5gntm5mBPI5IuyS2c8o3lai0lT/pm+WC
         /KRgsI6P7jhFBXNngnCVHDoK1D3U7LQn5Wp3jC8zPU6Cm8MGqM2EuCd0K4FM5EvTVXE+
         5U84DLJu4It8xn+xIeiaKxjxIMnU6l+0l38kqZJD3miFV+bDTzFdpSymp0l6ShM1oWjs
         tgK+ZejJLfhn42c0G/Q0sN4HEZR7wZy5HWPZEVYKjwKQvoOcXOqltY7B/SaFX6z/HFrs
         X2yA==
X-Gm-Message-State: AOAM531+4I48fbRDifYuTQtm+rq4p+O9dJGJ8uixtr3RjFIvQY1ODXAf
        Sn1STkYmRgS40AMQ0gPcoZlj0jZphG9ddtKyZdm0IlM7zKbCDeVULIsU510GAo9EZSyfzBQePH6
        wc1FWbyV656SwuLtn/W8ljL9Y9bzO/otp9IKApw==
X-Received: by 2002:a05:6402:2142:: with SMTP id bq2mr26372728edb.5.1642531604954;
        Tue, 18 Jan 2022 10:46:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNQP2i4JQE0+D1DYZNiBilWJZE60/kSXWqat/1Nl7NRn1F91gmzNzAqP8SgNb/qGa5xoUbSw==
X-Received: by 2002:a05:6402:2142:: with SMTP id bq2mr26372704edb.5.1642531604772;
        Tue, 18 Jan 2022 10:46:44 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z24sm973311ejd.3.2022.01.18.10.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:46:44 -0800 (PST)
Message-ID: <581732d1-8d86-f7c6-ebbf-795b48e5e67f@canonical.com>
Date:   Tue, 18 Jan 2022 19:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 15/16] arm64: dts: fsd: Add initial pinctrl support
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Shashank Prashar <s.prashar@samsung.com>,
        Aswani Reddy <aswani.reddy@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150112epcas5p4b63030d9bf136b4a91468b0d02e75cae@epcas5p4.samsung.com>
 <20220118144851.69537-16-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-16-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add initial pin configuration nodes for FSD SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Shashank Prashar <s.prashar@samsung.com>
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 335 +++++++++++++++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         |  22 ++
>  2 files changed, 357 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> new file mode 100644
> index 000000000000..371344e446f3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Tesla Full Self-Driving SoC device tree source
> + *
> + * Copyright (c) 2017-2021 Samsung Electronics Co., Ltd.
> + *		https://www.samsung.com
> + * Copyright (c) 2017-2021 Tesla, Inc.
> + *		https://www.tesla.com
> + */
> +
> +#include <dt-bindings/pinctrl/samsung.h>
> +
> +&pinctrl_fsys0 {
> +	gpf0: gpf0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf1: gpf1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf6: gpf6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf4: gpf4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf5: gpf5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +};
> +
> +&pinctrl_peric {
> +	gpc8: gpc8 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf2: gpf2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf3: gpf3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd0: gpd0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb0: gpb0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb1: gpb1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb4: gpb4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb5: gpb5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb6: gpb6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb7: gpb7 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd1: gpd1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd2: gpd2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd3: gpd3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg0: gpg0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg1: gpg1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg2: gpg2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg3: gpg3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg4: gpg4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg5: gpg5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg6: gpg6 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg7: gpg7 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	pwm0_out: pwm0-out {
> +		samsung,pins = "gpb6-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +	};

All pin configuration nodes with "-pins" suffix, even though current
bindings do not mandate it. Less changes in the future.


Best regards,
Krzysztof

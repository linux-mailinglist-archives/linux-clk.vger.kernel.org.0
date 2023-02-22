Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B36269F0AF
	for <lists+linux-clk@lfdr.de>; Wed, 22 Feb 2023 09:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjBVIv3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Feb 2023 03:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjBVIv1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 03:51:27 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2174637708
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:51:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l7-20020a05600c1d0700b003dc4050c94aso4871709wms.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+u4AY15L1Bht8NRLPPs6NjMtW4V8+pcy/IW9QPqGo8=;
        b=Ybq+TkOB1jGEV8vaotdiHQ011Jko/sTHP4t27Ywnngs0G84hueC7QmtO/vTnkI6sgM
         HDB0NVTUBpdzlLcmitjM23LDRAc9JX5+e+s7YncDnKowKps7w7bMITLtCxhiPJrnSaC3
         LalDPxuXFwBw7QuxkHqbjY18+AHwF4r27iNgPENv92QYFlXTiLn3CBVg/5CCZIqOIrkB
         pU/9kJnmR+3XLv4nYUukT2nyQ+YzS3Jvw79pAGZYQRd1fgzcgf8umEZkpM+Av7eZHEuA
         F/2jh1yCBCZdtUerV8lRxpn1RwehbFudbTQZ9xHKphWY0tU/09PGruVJ4jCvwc7gI4sO
         Z0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+u4AY15L1Bht8NRLPPs6NjMtW4V8+pcy/IW9QPqGo8=;
        b=OFiQTNXhIOMkumsZ+tWRn5a8qIp0Fal6u1ESFEr4JkcauHZjkItbiqo3fSrMjO6ktq
         qJayEMmzT8rSim+/igWMzZHM0ZMuhnEt9hZDiDtxBfYp0X5cNzcI4ZfbBae4v4XItLE8
         1TPqqR3rJcM7+J4+mO1NGt2qDhxdpV7z14aHFOYYuQCsa50WLUR1LfZqdYhEj4+Nwcqb
         p5KkWp3vOo8Mc1wAxMe4rgomH+Jqu0o9LT6MKqFM90fFBJTZege4DBwRCsISEsS2zHe6
         26qRIi4S/wkNMy5OedYKJ1++LKJY6wgx0CrAulUsN5wTycsRTbmoYGB5yS8TZ/49ZbmQ
         0KAw==
X-Gm-Message-State: AO0yUKXGeuyDR/0QmG/8Rj2OQ5UUHxHeB4RYNZqetOxr59EvkdB6Whdo
        xx2G3P2p0V8LgAJSCrrEwKR0vg==
X-Google-Smtp-Source: AK7set/r1WRuw3/1ACZI7CeT4xhPAB7h+YanvvcsxNo/XHfHRuhpvQrRprKVsSATLF8kTyaNYbd31w==
X-Received: by 2002:a05:600c:16d3:b0:3dc:5950:b358 with SMTP id l19-20020a05600c16d300b003dc5950b358mr12426068wmn.14.1677055883593;
        Wed, 22 Feb 2023 00:51:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c379100b003e70a7c1b73sm5489990wmr.16.2023.02.22.00.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:51:23 -0800 (PST)
Message-ID: <10b2ce9a-d838-6063-1646-90f91ce819e6@linaro.org>
Date:   Wed, 22 Feb 2023 09:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] clk: qcom: Add global clock controller driver for
 MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-3-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221174909.164029-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 18:49, Otto Pflüger wrote:
> This driver provides clocks, resets and power domains needed for various
> components of the MSM8917 SoC and the very similar QM215 SoC.
> 
> According to [1] in the downstream kernel, the GPU clock has a different
> source mapping on QM215 (gcc_gfx3d_map vs gcc_gfx3d_map_qm215).
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LF.UM.8.6.2-28000-89xx.0/include/dt-bindings/clock/msm-clocks-hwio-8952.h#L298
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-msm8917.c | 3283 ++++++++++++++++++++++++++++++++
>  3 files changed, 3292 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8917.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 70d43f0a8919..3ef58b09385a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -196,6 +196,14 @@ config MSM_GCC_8916
>  	  Say Y if you want to use devices such as UART, SPI i2c, USB,
>  	  SD/eMMC, display, graphics, camera etc.
>  
> +config MSM_GCC_8917
> +	tristate "MSM8917 Global Clock Controller"

I propose to add here:

depends on ARM64 || COMPILE_TEST

> +	select QCOM_GDSC
> +	help
> +	  Support for the global clock controller on msm8917 devices.
> +	  Say Y if you want to use devices such as UART, SPI i2c, USB,
> +	  SD/eMMC, display, graphics, camera etc.
> +

(...)
> +
> +static int gcc_msm8917_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap  = qcom_cc_map(pdev, &gcc_msm8917_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,gcc-qm215"))

Use data in of_device_id instead. This scales poorly if any new variant
is added here. Unless no new variants will be added? Ever?


Best regards,
Krzysztof


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7594EE292
	for <lists+linux-clk@lfdr.de>; Thu, 31 Mar 2022 22:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240324AbiCaUXT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 31 Mar 2022 16:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbiCaUXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 16:23:16 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E186241B5C
        for <linux-clk@vger.kernel.org>; Thu, 31 Mar 2022 13:21:27 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bh17so1618908ejb.8
        for <linux-clk@vger.kernel.org>; Thu, 31 Mar 2022 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ILnXUCualFGuYlaEUrjI+Jt4xkDksiZWcqq6tSgI9Zw=;
        b=ZW1CjLONxlLC58VYQbdnqzQGqdnzwh/8Jk3XX/BhEOsvEfvlBmszlJ6XyM5eEnPruf
         ZCS8+Ef8Fm7zTkrvkaUmsNd6yxjOHKT5fuo3aqu44qhaFhWNSf+NvGqvZSxcTwKRqAJt
         stYv5p90mRuHeOp9QCy1vKheAwT2tNH0T/7A49oA9r8ou4/MZhQRUAbba+aYebPwm3H1
         LbMszmPMllWpW6qAwEni1zTUW9XoV2j3Tq5S61bi7W5yoTRzi5A6EiMa8Gvqfjk1+TH5
         2f8UPKADYzfeRb/r8i3KIDWkZ1EIgq22lpKipKLiaRyn4LdTQtDXpiUwQjBvRvwhdYOC
         P8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ILnXUCualFGuYlaEUrjI+Jt4xkDksiZWcqq6tSgI9Zw=;
        b=FMpY24V3QVbXB+C0/Kwwyv1ukRuimqxmbhblCKpVidzaZgOOvDsK2VpcMdPv6HU5bL
         EKB6UWxB0xgH2tX/rGrUBtWvHgDOk+vn+zh5xqr19l9Rh4zyZfuNef35YcSS9gvB/FlN
         My6ywq0XEuxsFU3TCJg0A85Nd8Y724ZkEiM7ooD2eDt5Eq8tGAvtWvoA7fTYQWc3offh
         sN5Obnph7KyoVjeRaYLL9K9/H0Aak/CEk3T5J5ylODtYQTnjtVkRhjNHHpS8ozHfuamp
         YfocQgGVnrHk3hjdHl44wLUYhgYRdIe6c+NbGusbSpX1uuZmnmPm28HwUlMvHcBNNx22
         5cNA==
X-Gm-Message-State: AOAM531NYcQVOPo328B7HS26u+/AqFXmrp2DaGoAeWtpz/LM9dZ9xcTd
        ijHjhwCFwQtOJhTsRi7MSNYjpQ==
X-Google-Smtp-Source: ABdhPJwThRh2Gmkgw1Udsp9CkVtNz9RvwQbVrpKMO/HzmZ5TUdL2hXfqZOSOSrdGFCizgq6F8zT8BA==
X-Received: by 2002:a17:907:9705:b0:6e4:b769:286f with SMTP id jg5-20020a170907970500b006e4b769286fmr2781454ejc.728.1648758085933;
        Thu, 31 Mar 2022 13:21:25 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ch26-20020a0564021bda00b00418f99695f0sm202380edb.23.2022.03.31.13.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 13:21:25 -0700 (PDT)
Message-ID: <84d1e5b6-caa5-cf98-a4b2-2f1ca738b795@linaro.org>
Date:   Thu, 31 Mar 2022 22:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 4/9] dt-bindings: clock: Add bindings for SP7021 clock
 driver
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>, krzysztof.kozlowski@canonical.com
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        tglx@linutronix.de, maz@kernel.org, p.zabel@pengutronix.de,
        linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1648714851.git.qinjian@cqplus1.com>
 <c535be1e977098993850789faceea1db605df81d.1648714851.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c535be1e977098993850789faceea1db605df81d.1648714851.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/03/2022 10:29, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 clock driver bindings.
> 
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
> Move 'reg' after 'compatible'
> ---
>  .../bindings/clock/sunplus,sp7021-clkc.yaml   |  39 ++++++
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/clock/sp-sp7021.h         | 112 ++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/sp-sp7021.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml b/Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
> new file mode 100644
> index 000000000..41e73a088
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd. 2021
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sunplus,sp7021-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus SP7021 SoC Clock Controller Binding
> +
> +maintainers:
> +  - Qin Jian <qinjian@cqplus1.com>
> +
> +properties:
> +  compatible:
> +    const: sunplus,sp7021-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    clkc: clock-controller@9c000000 {
> +      compatible = "sunplus,sp7021-clkc";
> +      reg = <0x9c000000 0x280>;
> +      #clock-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26066f199..5d8b420d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2744,8 +2744,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for mon-subscribers)
>  S:	Maintained
>  W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
>  F:	Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
> +F:	Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
>  F:	Documentation/devicetree/bindings/reset/sunplus,reset.yaml
>  F:	drivers/reset/reset-sunplus.c
> +F:	include/dt-bindings/clock/sp-sp7021.h
>  F:	include/dt-bindings/reset/sp-sp7021.h
>  
>  ARM/Synaptics SoC support
> diff --git a/include/dt-bindings/clock/sp-sp7021.h b/include/dt-bindings/clock/sp-sp7021.h
> new file mode 100644
> index 000000000..45dac6de8
> --- /dev/null
> +++ b/include/dt-bindings/clock/sp-sp7021.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) Sunplus Technology Co., Ltd.
> + *       All rights reserved.
> + */
> +#ifndef _DT_BINDINGS_CLOCK_SUNPLUS_SP7021_H
> +#define _DT_BINDINGS_CLOCK_SUNPLUS_SP7021_H
> +
> +#define XTAL			27000000
> +
> +/* plls */
> +#define PLL_A			0
> +#define PLL_E			1
> +#define PLL_E_2P5		2
> +#define PLL_E_25		3
> +#define PLL_E_112P5		4
> +#define PLL_F			5
> +#define PLL_TV			6
> +#define PLL_TV_A		7
> +#define PLL_SYS			8
> +
> +/* gates: mo_clken0 ~ mo_clken9 */
> +#define CLK_SYSTEM		0x10
> +#define CLK_RTC			0x12

YAML looks ok, but here comment from Arnd also applies. These should be
regular decimal numbers incremented by one.

Best regards,
Krzysztof

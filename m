Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BB24F77B3
	for <lists+linux-clk@lfdr.de>; Thu,  7 Apr 2022 09:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241938AbiDGHjq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 Apr 2022 03:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiDGHjn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 03:39:43 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88066B4C
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 00:37:42 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id qh7so8945615ejb.11
        for <linux-clk@vger.kernel.org>; Thu, 07 Apr 2022 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yNWtSpIfre/T49Bu6Rn7xWkOXfSsUU2Q16+og1izX/M=;
        b=rbIPUQtXTcH/nbH8rFxu5Mv1mS7b/X1ycuR/uPgB5HQt3I35p/5bJBaSlnPR77KwcM
         bhpwO9P0KSHycnPGUlHMV59Xp8MlW9w1pmKqiisKOoJTJe4CdkLVwlQ53k055EsTDbm8
         xaolUtOvSxp7kKlIHxwDFoaliRw2e6S2BkCPPBawcH/vt1EwhnQuFNKBLY8J5/PHXXx3
         HDMOauJohAlJOIZC3lIkNjxKq+hJQY+42fKW62TGe85nFemJ/ul+BUIIIDEbETenk9cD
         FGkieze3jS1MWvrdp7QzTGzA7imBlceUkiVLJQwC61dN2CaLHgYQC2aHhfFcLDNq2LQ8
         VWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yNWtSpIfre/T49Bu6Rn7xWkOXfSsUU2Q16+og1izX/M=;
        b=a8Z0LMbY2AjWIKLEAkoKhbtgjDRQKTqqdRgFJPduj7lSXTYo4QfUIDrlNL62FhVji5
         wAVugqt3+xygKyy9AIBjoAl6iVUH6nkE/HgkqfIceVX6eIDmvsT/2e3cgSvV1p74B3/e
         MCR7WP4Aj+4k0YjdtlyikYJ4nw+2NyorLTOVPQxG02SiAJfNeF4RatsePCpLabeN71sB
         lZye6AKHE4Gs6kA75ZxK7arV4HEgJmpzP537AJLu9BB2baIRT+dVpNoyTSQ2IYkT6dvw
         bulgzXCT1XJNMtcm9ajUZS7EPL2vbfiAAEziDLVorKSXTWEjuhvT7iWTEo4mwNhVnY80
         8uKw==
X-Gm-Message-State: AOAM533hT7AbvSojWOkZ7V2uq4ljsF+XUBHOBQLyrYHBQ5SiwfNPGdoO
        j1hC1PQMHf0/GG6+zqdcVWvgbA==
X-Google-Smtp-Source: ABdhPJwitQr3MWQZcHqAWXdeKfDKqOLsvrFlABaFkgsr9IvueNvggIKvJsK5PQ13C2QVOPveXeP3LA==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id y23-20020a170906559700b006cef3cc14e8mr11974793ejp.426.1649317061137;
        Thu, 07 Apr 2022 00:37:41 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m14-20020a056402510e00b0041d0c0942adsm190773edd.52.2022.04.07.00.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:37:40 -0700 (PDT)
Message-ID: <bdaad2e0-6662-c6aa-974a-326dd513282f@linaro.org>
Date:   Thu, 7 Apr 2022 09:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
Content-Language: en-US
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
 <20220405184716.1578385-2-miquel.raynal@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405184716.1578385-2-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/04/2022 20:47, Miquel Raynal wrote:
> Add new binding file for this RTC.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> new file mode 100644
> index 000000000000..903f0cd361fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,rzn1-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1 SoCs Real-Time Clock DT bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

Why oneOf?

> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-rtc
> +          - const: renesas,rzn1-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: timer
> +      - const: pps
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: hclk
> +
> +  start-year: true

You don't need this, it's coming from rtc.yaml.


Best regards,
Krzysztof

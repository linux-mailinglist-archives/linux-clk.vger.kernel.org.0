Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2E4FA99C
	for <lists+linux-clk@lfdr.de>; Sat,  9 Apr 2022 18:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242624AbiDIQni (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 9 Apr 2022 12:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242712AbiDIQng (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 9 Apr 2022 12:43:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B1A388
        for <linux-clk@vger.kernel.org>; Sat,  9 Apr 2022 09:41:27 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r13so22952673ejd.5
        for <linux-clk@vger.kernel.org>; Sat, 09 Apr 2022 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CQhk5hApj0EFmEVr3Hslgk8a+qSY0Z0pKIrPYXFktCg=;
        b=wCafsTZxwiHB+GK0QWRVTBN8dKlNlx+Kf54DTtn/U9vq9F6ZMdry9l8A5NmvR/vfFe
         H1lEY/KQNN2rDYPO9U/+RFzDklQB2yVMDAUvXoj65wwG4vg9zq1m9Kqg8nRGOPZKG+Hr
         9v1SVA2szMVXKBOsIFPkMm5GNOUNhPlM3SEdD2Ov8WH1nmRDAK9V+4IVSezJvzMkZZQa
         HlND9SDXzoIzbvs40IoTLwxk4I9SWHn4f/eSzS7WwNAqPatHRIV9OYCC8wnLcxLZYMxZ
         rekD/9Pve9NNHn1n+CWeEiStsrEvqXG9kUGvr0QE1881ITLx2+BV85ESvv9ECxhqEAmP
         1dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CQhk5hApj0EFmEVr3Hslgk8a+qSY0Z0pKIrPYXFktCg=;
        b=GxTLvtULCgWuHNOh8wgR8MwnO39w4W7a1qrmWoD7JEv/Ur+lAj4iH3EQsoi2h1YltW
         6cAMtKTylqPj/qAFE1JdnNGnFc+0aMLRa6i7xn86uH6UdjcmHrPeWmP5YIx06qY02+6z
         EVgABbFlwqVOO53TVoBQKvZ6zSzuTTo22tjb9gSrmw97AyRYUVHfZpUHrFKgHbxVrqU+
         wcOYIj3IB0pC45rNkHzpXxGjaXgEZw5igGsmevHQpB9A0Jipd2Ip1x17kolC5FO8bfSv
         LbsEwH6DSVFDWYXTGikleVXxZ2QpVF23EedJctYSpLtLHYVLq945RV0MJW84/jW57r4i
         IyYw==
X-Gm-Message-State: AOAM530WJfe5myAvD4rhdytL/UIjqYLQG67EEd3M/HO2bgH3psvJNW/F
        DHLlEmQSAFbmUiEtnzs02ZOZZxQ7vqUMSSfT
X-Google-Smtp-Source: ABdhPJwOUiVW1lPWC4ZWp7ynuh79JGlAU7q/GJ2aBONCbOuM17U9l1zobDbHcZs0VHodT3LaWf5u6g==
X-Received: by 2002:a17:907:9868:b0:6e8:7ae3:7f42 with SMTP id ko8-20020a170907986800b006e87ae37f42mr1363115ejc.224.1649522486528;
        Sat, 09 Apr 2022 09:41:26 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640205c900b00418d79d4a61sm12426553edx.97.2022.04.09.09.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:41:26 -0700 (PDT)
Message-ID: <0eb126b3-b323-9614-361a-22c2762b590a@linaro.org>
Date:   Sat, 9 Apr 2022 18:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Qualcomm SC8280XP GCC
 bindings
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220408224321.627126-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408224321.627126-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/04/2022 00:43, Bjorn Andersson wrote:
> Add binding for the Qualcomm SC8280XP Global Clock controller.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-sc8280xp.yaml     | 199 +++++++
>  include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 496 ++++++++++++++++++
>  2 files changed, 695 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
> new file mode 100644
> index 000000000000..44e5f0d0a795
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sc8280xp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SC8280xp
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SC8280xp.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sc8280xp.h

include/dt-bindings/...

> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sc8280xp
> +

(...)

> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.

There is still no schema with protected-clocks, so you need a type,
unless someoone is working on adding this to schema?

Rest looks good.

Best regards,
Krzysztof

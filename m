Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4EA663C35
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jan 2023 10:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjAJJF5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Jan 2023 04:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjAJJFY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 04:05:24 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AA1186F4
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 01:05:09 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so11261290wmb.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 01:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmP5l4cApANJtfpxdC9HPRl/8romuUG6F1co7Oq044Y=;
        b=gwqtez4rxprKjG5xIakhDg1DGgN1Jb2dTjGR4WpqTM3Dch/Vq4jXFj/zL5fBY76Ov9
         BowpXv6/mevfH+hg/CahL59FgAD1YaBXrx/AcfzkA+HnMIxxicjvo1wpLh08M4bMw9uJ
         noPCH/X4AqP4RPAgMRhVh8fQCZPVGqRfRAPOQ9Ah2no/HuV1n0+i+0FwJZAXh/unIvWH
         il0jXX/UxLlx5k4JdWkWpl2gL9jWZaT5r2nIPfyB4zFLRj8HX8zxDbAV+T/qG8m/aagH
         QhYD8JXTHKbmmAmlsCfqg+vdTD2giDQIMZcLh+i1h7cpWXTq9p5Ue7AJN7bNKOf6UcLh
         gsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmP5l4cApANJtfpxdC9HPRl/8romuUG6F1co7Oq044Y=;
        b=zAZLXkHfuRH1nsG35dxoy2roSXv3+QVEwz9pFM8r7juZFqDwb9jeUTNhRTEYL/QlK2
         lBLklAcYlcqMe12oG3iJoap68M0Ntu/1LozF/7QtC/tJNr0ICFbJCq9X1maGkSpn8TsE
         iC6Twrd1dfkqXWDeDk4BSkU485KrG+dH1VthRRDRtGeyqo6L7aKAIXhuUi5LWKTwwxFJ
         rJANUx35TyeJUmHxuWo9XYdNC2SPwgAw3Dq6knSkBQjGu79gxjZG/bOp6I9h86IDop/V
         YIhC9ALlG8xzOg8dAG0venm1ueek5tL7xxQyCCX/AWeKjd16yag4CXYJ7rxxVoiylBsQ
         IF3g==
X-Gm-Message-State: AFqh2kpjf3nKaYBVF0Y6CEKli0wZvB+56GHOrvCGSbUOHecJ+1QnV0G+
        YFIcb2GqlCV7eLMU5+6diH3l8g==
X-Google-Smtp-Source: AMrXdXvywMzS1L112hvFqtXe3hMIaYD4tU9pyCY3W7l8PhyXoKWDO23qepASi7CP/eVR/Ok1i44KsA==
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id a7-20020a05600c068700b003cfe7c80494mr48563729wmn.29.1673341508279;
        Tue, 10 Jan 2023 01:05:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c6b70a4d69sm15941646wmq.42.2023.01.10.01.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:05:07 -0800 (PST)
Message-ID: <65925394-13e1-e218-2f47-8c1c1d3b90d7@linaro.org>
Date:   Tue, 10 Jan 2023 10:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add SM7150 GCC clock binding
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230109193030.42764-1-danila@jiaxyga.com>
 <20230109193030.42764-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109193030.42764-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/01/2023 20:30, Danila Tikhonov wrote:
> Add device tree bindings for global clock subsystem clock
> controller for Qualcomm Technology Inc's SM7150 SoCs.

Subject: drop second/last, redundant "binding". The "dt-bindings" prefix
is already stating that these are bindings.

> 
> Co-developed-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../bindings/clock/qcom,sm7150-gcc.yaml       |  50 +++++
>  include/dt-bindings/clock/qcom,sm7150-gcc.h   | 193 ++++++++++++++++++
>  2 files changed, 243 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm7150-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
> new file mode 100644
> index 000000000000..6ce7a1877b00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm7150-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on SM7150
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>

If you have the device and are willing to do testing/checking/reviewing,
you can add also yourself.

> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on SM7150
> +
> +  See also:: include/dt-bindings/clock/qcom,sm7150-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7150-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board XO Active-Only source
> +      - description: Sleep clock source
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +additionalProperties: false

I think you wanted unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,sm7150-gcc";
> +      reg = <0x00100000 0x001f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> \ No newline at end of file

Patch error here.


Best regards,
Krzysztof


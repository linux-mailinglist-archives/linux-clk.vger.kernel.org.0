Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828356BC772
	for <lists+linux-clk@lfdr.de>; Thu, 16 Mar 2023 08:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjCPHkk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Mar 2023 03:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjCPHkj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 03:40:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D98F8A39F
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:40:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x13so4021032edd.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678952430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVjHSwxCcgK0nlIxtPzn0yGiuSzfP6fPLQyW4o2TIgc=;
        b=lZiB7LDRuktbamKmx3zqPK/7I17B5efX2zWYp9MdqdHgJ65b7/Et6KxeZoPBXSviDC
         C9I8xrBWnap4sZo/no1Uhw7801qi10JC+M3pm+abBkCklPjZDdSBLLQRk0kqIAjOdFbO
         Fjf/3BLkN/NVGYXwXarN4ArFP6Qwv1J3HIJTye1IBFsxpzdEWY05bX60uX7rqsnLZthe
         pTIESvXGqKrSsTAiMpxy6AvAzroKRIuz7lGModJnn3QGXjUoZYAQ8TSz+1HkeD2hT/Y+
         61Ow10PA/VIS6Q+rEWrgrZvvtDf3gvmi/JYShmAKZoc4e+5K9j08Rrkm7KyUrTi0LMJB
         HeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678952430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVjHSwxCcgK0nlIxtPzn0yGiuSzfP6fPLQyW4o2TIgc=;
        b=a3/FJYJEYGVydAxFOuCkgPbhsJSf/mD6fXNivgnp7iqKPOIZ+tPqDQW0yAGgfQN3BX
         JnkOa10dhKWpwFNUjHodYneb+i7yfxUvRg1983ERF1ZsBAaUNWCnFx3jqdDKgHNsMjxB
         Mu2SD2q5zMgfiqs7Ro3u5LVrQa1n64vVBsYL95hfUE6BSmzGkX5Wusm9uzJTMRHn+G18
         fIvVd2uz0akUz56jVnn5hTLBJx2FUFV91oy1ZkRyaIonoyhf28mJ7eN2Rq+RDls57RJd
         Z1aBJfHkRlyOdtWtL44/jFbddCW80SPTY1iLcA+Ttt9VsTqdSouI0BYEn2mpvigwoqa+
         yXeQ==
X-Gm-Message-State: AO0yUKWoKWPJZbSZ7+qdV5FIFFMTgxXsDJhXX8eBFzPIR5dghjL44ol1
        6f0W+1YBC3E9MDd3DjlONQ9ksg==
X-Google-Smtp-Source: AK7set/zaOdeDV+1veyboUDW+rU/G9F7W2HSrcB9dD46e6NttghzsH6r07UgLUXfK/oluu2fn4xh1A==
X-Received: by 2002:a17:906:eea:b0:8da:69ae:6ff0 with SMTP id x10-20020a1709060eea00b008da69ae6ff0mr9971709eji.22.1678952430184;
        Thu, 16 Mar 2023 00:40:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id m18-20020a17090679d200b008e204a57e70sm3450710ejo.214.2023.03.16.00.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:40:29 -0700 (PDT)
Message-ID: <b4aa61fc-abd8-3287-83a3-beee2a06e628@linaro.org>
Date:   Thu, 16 Mar 2023 08:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/15] dt-bindings: serial: Document ma35d1 uart
 controller bindings
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230315072902.9298-1-ychuang570808@gmail.com>
 <20230315072902.9298-11-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315072902.9298-11-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/03/2023 08:28, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add documentation to describe nuvoton ma35d1 uart driver bindings.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../serial/nuvoton,ma35d1-serial.yaml         | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml b/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml
> new file mode 100644
> index 000000000000..9daa2efd4734
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/nuvoton,ma35d1-serial.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Universal Asynchronous Receiver/Transmitter (UART)
> +
> +maintainers:
> +  - Min-Jen Chen <mjchen@nuvoton.com>
> +  - Jacky Huang <ychuang3@nuvoton.com>
> +
> +allOf:
> +  - $ref: "serial.yaml"

Drop quotes. Use some recent bindings as your starting point, so we do
not have to give comments for things which were already fixed.

> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-uart
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    aliases {
> +        serial0 = &uart0;
> +    };

Drop aliases.

> +
> +    uart0:serial@40700000 {

Drop label

Best regards,
Krzysztof


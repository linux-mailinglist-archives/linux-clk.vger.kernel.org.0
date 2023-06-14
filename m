Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D34372BA7F
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 10:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbjFLI1u (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 04:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbjFLI12 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:27:28 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67771729
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:27:00 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso6139076a12.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558419; x=1689150419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXYyQ7eMPr/A1ABXv1x0uzF5it3j5W9JBR2D4cpSkhk=;
        b=eeMuiq7gj8yBTgC3mvlafvrCWL7hV0aPsEYA5H1Ca+dd7o+Wq2qxnHdyshjRAgMByG
         Hm6I2hdvOivMw9gm/jb4K1GDPgSiFvlHQv3LgRehJH6aIETCbbXyuC1gRdMzTy+rEtrZ
         GSMHLlnFz7kD2bqzQkIUNG0ol8Y2xiF1KmCCK6oi0iI/4TyM3TmnJoNe22QVTUGlNFzk
         tZt1f+okATr26vClAaEWzK223A/XYDp55KdbUgFzhh0xW592gOi8PQqBjjvxY0+RrbVX
         3ItgF+z3nE1LjkUpBoem+oBp6gBkNSpLVuzV/dMoq+E7JdQZ7JIBD0WtCSduOk/vBw2g
         ajmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558419; x=1689150419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXYyQ7eMPr/A1ABXv1x0uzF5it3j5W9JBR2D4cpSkhk=;
        b=etp7wieZbJeRNJdveGkJHuYDJRQm75K+ZGv6k0rmNtLyLNbsoJBJ95zJyv75MMYzEd
         t3oivusv2xImI16nP02EATh0crPLrUd6VyMHl6Hy61n1Sf/1VZeqJIz9LGyO4YNZMDJq
         C8cZu8vAZARQljElTaVaT7ZNmHctPzM2GyjrI5L9TOIFB0yo3jhz48sgk4weRqFCwbRo
         A6B58ZJpMAb8gY6wSGPYIy+dIIn9Z7CAMHvrGJ+UzxGbHW8LXUAo4tcHuPZJkJBZRHzX
         9SnKupczU2H32KI15pGLLfB3+WWlVVOrwbiegSjlQvxc2YVe40nuxbGvfmp/1wubds3w
         EPVg==
X-Gm-Message-State: AC+VfDw5FaaOX6oGIT04l5ulSgJzSG7Ye7hCNGG3lN4Ngfi16KDflyUp
        HdM1xF3QljR8/6tvDj1dk1VbBA==
X-Google-Smtp-Source: ACHHUZ5ygA38UVYR2nlKcgtKktN3GwGh0BWbxHEjo9p86n6HKnshYRttMLbFHad+wX3SvpODrnNamQ==
X-Received: by 2002:a17:906:4fcd:b0:967:21:5887 with SMTP id i13-20020a1709064fcd00b0096700215887mr8997927ejw.40.1686558418994;
        Mon, 12 Jun 2023 01:26:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906471400b009663115c8f8sm4864176ejq.152.2023.06.12.01.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:26:58 -0700 (PDT)
Message-ID: <f8532cdc-4d95-b8a4-6e26-81ac2c6e29a6@linaro.org>
Date:   Mon, 12 Jun 2023 10:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for SC8280XP
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
 <20230608125315.11454-3-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608125315.11454-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2023 14:53, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
> support when it is under the control of Q6DSP.
> 
> Add support for those resets and adds IDs for clients to request the reset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../bindings/clock/qcom,sc8280xp-lpasscc.yaml          | 10 ++++++++++
>  include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h      |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> index 047cae91f443..3326dcd6766c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> @@ -19,6 +19,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sc8280xp-lpassaudiocc
>        - qcom,sc8280xp-lpasscc
>  
>    reg:
> @@ -39,6 +40,15 @@ required:
>  additionalProperties: false
>  
>  examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +    lpass_audiocc: clock-controller@32a9000 {
> +        compatible = "qcom,sc8280xp-lpassaudiocc";

No need for new example - it's the same, just with different compatible.
With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


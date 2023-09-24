Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538E67AC782
	for <lists+linux-clk@lfdr.de>; Sun, 24 Sep 2023 12:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjIXKUk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 24 Sep 2023 06:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjIXKUj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Sep 2023 06:20:39 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935BEE7
        for <linux-clk@vger.kernel.org>; Sun, 24 Sep 2023 03:20:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32325534cfaso246163f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 24 Sep 2023 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695550832; x=1696155632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRdPYxD7N5192EFL8LQJaqcXQ1ivTYH8sYpTET86uAk=;
        b=Dmur8oY+/3Az+a5kPuFWCGarnh3QSxz47IqPMKuRBxNB7rkkPUg/v3WxS9a2NAP6Qv
         dJM6Lw3SVvqbRaShedUGXqALGDbXI65M1ryh9DXDyxABB4qTjvqxlOqPbi2JX584txX4
         nGbdiZPtisg1fpT9ddU9lpTFqEGzB3CgxbqsCB2K9uLbVPVmeJmFtIX4+KUNCwuEuLR7
         dvO2fLltFtNjcCISNB43PKVskoLR9sD2xORqeff+y2pZBwmv2sL7+O5tiGXW8kljTjWU
         82UHHW3tie8vSiqHB9SevXihImnEPfbpvxdH8cVu1F5y4PRYxmHsjO7qoOa9eMcRr/EN
         uaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695550832; x=1696155632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRdPYxD7N5192EFL8LQJaqcXQ1ivTYH8sYpTET86uAk=;
        b=LjfxXXHtd6MhvBBrGWNMxXreXLR7pbtIry2ZF4zmmaOwc/7MLd7z+IsPH4hOt1PZm6
         Ecbi7izBT8uYnwgRylM3QSU3zq4ZwJaxnnL4noUzYVTS4z1+91e/GGQinIRSqozTH2FU
         60Cl47iOc2q6Baz/3Ff1HyqcL2oD7jz8fMhyx6NiB3ET/9LvxJ1jMhJOCePEsT6FOaqo
         g2AgYxJtnhOwCvOPkozg9ujDjqjtjpO306tQIWpdz7jXGc5ie56uwss6bARCrTKT84dE
         EwbZf0/brO4SoSzuBjJUjQ4gvaQr2AKPdohOXVsTOQ3uDQltowtlahPFKR6K2gzoVfNA
         eFGg==
X-Gm-Message-State: AOJu0YzL3fFgaq+Dt/qa7QzEmiueTAk1lqhc+0qRI4p/xGQD8JmyL//2
        0p5RW2qC+S70MnprjoyvvPMRzA==
X-Google-Smtp-Source: AGHT+IFu0+rneWXwnLmx447DDCYpq9I+WDULyh0rK5GTi2lG1SvGjnNw8JS1kSqjNJFQLKBqC9rfxQ==
X-Received: by 2002:a05:6000:1106:b0:31f:f72c:dfa3 with SMTP id z6-20020a056000110600b0031ff72cdfa3mr3379946wrw.68.1695550831988;
        Sun, 24 Sep 2023 03:20:31 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600010c300b0031416362e23sm8970759wrx.3.2023.09.24.03.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 03:20:31 -0700 (PDT)
Message-ID: <fac95d85-0802-4819-9efe-a31e6df7a0e4@linaro.org>
Date:   Sun, 24 Sep 2023 11:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,camcc.yaml: Convert
 qcom,camcc to a single yaml file
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230923150045.1068556-1-bryan.odonoghue@linaro.org>
 <20230923150045.1068556-2-bryan.odonoghue@linaro.org>
 <2565aa33-619c-6c90-de96-29dc5ac5d961@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2565aa33-619c-6c90-de96-29dc5ac5d961@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/09/2023 17:13, Krzysztof Kozlowski wrote:
> On 23/09/2023 17:00, Bryan O'Donoghue wrote:
>> Move the various camcc yaml files into one. The Camera Clock Controller
>> is pretty similar from SoC to SoC.
>>
>> Mostly we have some SoCs which require fewer clocks than others. In some
>> cases we have SoCs which have required-opps and required-power-domains.
>>
>> It is likely we could and should extend the thin CAMCC descriptions such
>> as sdm845 an sm6350 to the more robust descriptions such as sm8250 and
>> sm8450.
>>
>> As a result of listing sm8250 and sm8450 together required-opps and
>> power-domains become required for sm8250, which is a NOP for the dtsi
>> since both declarations already exist for sm8250.
>>
>> sm8250 is also chosen as the example for the new combined camcc.yaml.
>>
>> A minor tweak to fix Bjorn's email address in the Maintainer list is
>> included.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> No, that's not the right approach. For GCC and CamCC and all other
> Qualcomm clock controllers, we split into device schemas, not merge into
> one. The one schema is just becoming unreviewable over time with
> multiple if:then clauses.
> 
> Please use approach like we have for GCC, RPMh interconnects or remote
> proc loaders - common file. What's more, here you probably don't even
> need common file because it is already there - qcom,gcc.yaml
> 
> Best regards,
> Krzysztof
> 

Ah OK, I see what you mean.

commit f8cc21d454c50157a528c900b60aa9588b4066b3
Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Tue Dec 27 15:40:56 2022 +0100

     media: dt-bindings: qcom,venus: split common properties

---
bod

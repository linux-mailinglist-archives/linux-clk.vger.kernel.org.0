Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01405155FC
	for <lists+linux-clk@lfdr.de>; Fri, 29 Apr 2022 22:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbiD2Uqt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 29 Apr 2022 16:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238964AbiD2Uqs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 16:46:48 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4C784A0D
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 13:43:24 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z99so10339802ede.5
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 13:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RFeCzEomR01P4Iurfe/8OSxLzfXWqbIy0F1CUspNK8M=;
        b=v1yZucKYkugM/zGaSOyBd81xiVlhfI2Elx6X5x8u85wIAS89Z3Clr2gymkiZKcLPmh
         NcrQOlIl+D8kjmgsHrGuaS2C0HzPrkC646HrE9VIxDrbqh25uLqg4KB9SdO/q6v13v70
         62MwlzoJtAIoSOKYClqR7QewHFJOLFs4hK5z8RtBzCXNT8n+0PQ3mnkWpfDrO7T918NQ
         FdQ/YFiOHwmgn8gbxJzzWGwHLIN+q3bQKv+ufRfqZeBnHVmBF6dhAtfXnK6O1ulkfnOF
         6HUznDTtKWpIgG0aajYEC6v3uADt9+J3RFSjCoUWyVUL5x93vnCsCUx9xYx8yoAFe6xq
         p5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RFeCzEomR01P4Iurfe/8OSxLzfXWqbIy0F1CUspNK8M=;
        b=nW5K7OyaRz4zpFP9SStEka27Rusajj+FHHkLYcypActgqLzfdh9PnpQos2BYcXLz7d
         I5qzWNh5LOu6DNjOtal9HrsS3mOYhfYg0C99JpIcekPYduUJA54A6S/5xl1AvmaVgT9V
         u3kllsFG5Ae7bSi5Qt4K9uqZU6eqfzVY147neoxI+BFvmA72zdhN0NnYZF3s7d8Xcn+u
         oXBX8i8NvP2Ik0pyazgXQMMSAC2FbHmA6rx4dAr1ro3Ji0IpoKlhGzM2IhPVn57dKBIH
         J4nfjHt/7peI3AAiCB8hIl6k1cd/jK03rS6ayznkg8IPoPfXkHQRcEHaWJQoMcr/vacG
         Sw/w==
X-Gm-Message-State: AOAM533VDmzcOKeO59FjoImdrKyo9YYaCqwXNRJECXlA57wWfvCu+2pi
        CpUgw6a82CFIwOdE1f+tGHZAvg==
X-Google-Smtp-Source: ABdhPJzntXk/PHgiGtHQ3kxR3eQvdcy0ZHkg0LXbRjyo/oh9jXVtBHhNj3yoNUGZN38QCdL/tgcB+Q==
X-Received: by 2002:aa7:d609:0:b0:425:d94b:4119 with SMTP id c9-20020aa7d609000000b00425d94b4119mr1065999edr.282.1651265002934;
        Fri, 29 Apr 2022 13:43:22 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402170500b0042617ba63d3sm3382801edu.93.2022.04.29.13.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 13:43:22 -0700 (PDT)
Message-ID: <5127b3b5-ad27-fd06-42b7-fdf96d0a10ea@linaro.org>
Date:   Fri, 29 Apr 2022 22:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: arm: msm: Convert kpss-gcc driver
 Documentation to yaml
Content-Language: en-US
To:     Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220429121739.28584-1-ansuelsmth@gmail.com>
 <20220429121739.28584-4-ansuelsmth@gmail.com>
 <1651247596.124069.2344494.nullmailer@robh.at.kernel.org>
 <626c0b64.1c69fb81.1b1e9.4fe6@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <626c0b64.1c69fb81.1b1e9.4fe6@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2022 17:57, Ansuel Smith wrote:
> On Fri, Apr 29, 2022 at 10:53:16AM -0500, Rob Herring wrote:
>> On Fri, 29 Apr 2022 14:17:39 +0200, Ansuel Smith wrote:
>>> Convert kpss-gcc driver Documentation to yaml.
>>>
>>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>>> ---
>>>  .../bindings/arm/msm/qcom,kpss-gcc.txt        | 44 -------------
>>>  .../bindings/arm/msm/qcom,kpss-gcc.yaml       | 63 +++++++++++++++++++
>>>  2 files changed, 63 insertions(+), 44 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
>>>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml: properties: '#clock-cells' is a dependency of 'clock-output-names'
> 

The patches were previously sent (even as v6) and somehow the history,
changelog and references disappeared...

> Erm how to fix this? I can't do a 1:1 conversion if the source was
> wrong and also have no bot warning.
> Or I should just push an additional patch to fix this error after the
> conversion?

Didn't we agree that original bindings were not in good shape? Yet the
questions raised with your v6 remain actually not answered, till the bot
complains.

Please do not send the bindings which do not pass dt_binding_check.

Best regards,
Krzysztof

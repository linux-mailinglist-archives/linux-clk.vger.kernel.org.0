Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF5A674D5B
	for <lists+linux-clk@lfdr.de>; Fri, 20 Jan 2023 07:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjATG1t (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Jan 2023 01:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjATG1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 01:27:48 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD8739BAA
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 22:27:45 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so359585wmq.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 22:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+Tk9C+q5ul7HvkddDemsyL3qMNqs61Qh9C/G8R7Spg=;
        b=kXM01cTPdkqoNmA1Ih8ur44KRT2KTmKp2876rTMbOzTyhgpnt6yrrLkq3Uk1tuOcjq
         yUjf4BLGRx4cmOKa0YBXtA8/EFBNxLWBpwgOspGYiSsCR3LoeLa6XLHE1nL3wBDZ3vXY
         b0t5Yl27SwyGUxbyiTQl4KMG8lDoUqH4rM4fCeg4Ltrfc7KDyAA3VHTIoTg8lYsDDK4F
         QhJolxqMqsJ8d/vpvglrDXUyWa5uPGCd7aObG29XzrUYyWmNckziagGteqbjxSTuzILk
         2HyQmFjeZjz0KfFq9E3jZKT9mj7o9w4AS+CQhzMyfRh+/NjIX3eEbwsmH4Bcv6uCKRSR
         Tilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Tk9C+q5ul7HvkddDemsyL3qMNqs61Qh9C/G8R7Spg=;
        b=uePI5wRae4/cEQ27jo6TUptvCZT7lJ1w7GV9NKpbxPa5yFuVoPZ4bFDnlf0Lvl3Hq3
         40cQT3r0s+1z2MVLGbY4b7azRpSOC9NdE/S4eFUNf8us29lMfIS8RPdYvGO2FOEJ7x+7
         h+DJOn4F93w/Z5giuIwdWf++7XmrGt8qcgVlVFp9f8mKMwk7spHO0r9n1QwNdzLBhhgo
         dxx4U+d4tBizvuhRClRtkdlW41n1lu1VqzpLQu9YVrhush3/40DhQLaBZMezP1xkGIuL
         NfEnyppjtvTguMoH1vGpuNgnrYSvoMgrXrcnHvy7TdPYQtULw1EsgytYjbOJ+vx0sgj6
         NBsg==
X-Gm-Message-State: AFqh2kpT8s6Wai0Cg8aFsnDh6NiukP1vv7LzekfIPOWTqiaXzqGCRZpK
        Q2GDsT+MgONNW3f2y3kyOwPYRw==
X-Google-Smtp-Source: AMrXdXtsDceSjwYxpV4w5uyzI6qYJM5e2w8ikYCnGdd5smpRRAv9JHkND9z6YVaWaRyQ9HmwbDwZzg==
X-Received: by 2002:a05:600c:b8a:b0:3d9:f806:2f89 with SMTP id fl10-20020a05600c0b8a00b003d9f8062f89mr12750002wmb.41.1674196063851;
        Thu, 19 Jan 2023 22:27:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c0b5000b003db0a08694bsm1262291wmr.8.2023.01.19.22.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 22:27:43 -0800 (PST)
Message-ID: <9adec806-5529-f98a-949a-630edf3e1d0a@linaro.org>
Date:   Fri, 20 Jan 2023 07:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] dt-bindings: opp: constrain required-opps
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230119130028.106817-1-krzysztof.kozlowski@linaro.org>
 <20230119130028.106817-2-krzysztof.kozlowski@linaro.org>
 <20230120043834.txkg4tockxcjqs2g@vireshk-i7>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120043834.txkg4tockxcjqs2g@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/01/2023 05:38, Viresh Kumar wrote:
> On 19-01-23, 14:00, Krzysztof Kozlowski wrote:
>> Be specific how many required-opps are allowed.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This change is independent, although logically is connected with my
>> dtschema pull:
>> https://github.com/devicetree-org/dt-schema/pull/95
>> ---
>>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml     | 1 +
>>  Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> index 47e6f36b7637..9b141a409191 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> @@ -202,6 +202,7 @@ patternProperties:
>>            for the functioning of the current device at the current OPP (where
>>            this property is present).
>>          $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        maxItems: 1
> 
> I may not under this property very well. What exactly does this line
> say ? Asking as required-properties can have an array of phandles as
> well.
> 

It says we can have maximum one item in "required-opps" in "opp" node
and you are right that we could have here more. I'll fix it.

Best regards,
Krzysztof


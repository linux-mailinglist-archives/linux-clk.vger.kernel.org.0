Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86220434FC1
	for <lists+linux-clk@lfdr.de>; Wed, 20 Oct 2021 18:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhJTQL7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 20 Oct 2021 12:11:59 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47094
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230372AbhJTQL6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 12:11:58 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0905A3FFEE
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634746183;
        bh=dEGTee63Vt3tDZyGtNIP9fQ3+XWx6xlZ5vv4wE+jbuM=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=jc5OIaytRYvPSOPO1ZoBOMH8cyYMLT87KJe0+d10gAITBS+oCQLNvOj8s9XOXJThE
         rx2xbNysHjMABIBSa7+oA+XChGA33+NjMCxG3qYXo3ShLjbGm/M6o+qqITcrKNBzk8
         IfSM1ebbaiRu6S0vF0MFAReawBmD2dIAAKuqpoo3kvtvG8F0WMiwcFAtA1nOnpBq8x
         ACjbJgx7bEr6kGHm1S7nHf8QkONgEJOo7U5u3c2Wx1QmzBa4x0AqL1BdQqsjk2ZmDk
         xxo3DGmUBWOX0EU8ZzYudC5hQDSpLektrcY+OPQSELttoEAUVck0n9yIs60+dulsbl
         MQFpLXuQ+uUlQ==
Received: by mail-lf1-f72.google.com with SMTP id bi16-20020a0565120e9000b003fd56ef5a94so3188978lfb.3
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 09:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dEGTee63Vt3tDZyGtNIP9fQ3+XWx6xlZ5vv4wE+jbuM=;
        b=2tKuly50wyz3zFn476V6q0DKlntebMZN+wdsE1if8ch9qy2M2hvayqN8ziqaVeblZL
         G1wOQUJEnv8/RGUbPDF3SlkT/y2v80TfqXasY+ibhzVrAjlRnWpp3ijUf9EU9UsWDETP
         GZhUWTepMXPdFSIIWe6L9GboZFFEdGSDaPSjwk+kvUM+tTOjCL94F1wg0JhAPY9ImD2x
         0YHbYlLCSv6Vkw1VWBvc1PJItVrYKQxqucACo4KtOom5SxaptFeWNQUiu6TPYSAO6Yb9
         EPVsUgZGotSVillocQXWfvIMleNHmti8q+TGPdFKaIDP/kd0eFSL8FC0K/0dori6PL2w
         RCIA==
X-Gm-Message-State: AOAM531d4Jafel9z5df9t0kgU5DSJ5Mvi0F9hIFbY7Ii/sUuVyBf90BJ
        hZIvvBX/vh75aJ4VuqZrh/qSABrwGOoy6UH0fpkXS/Z+lqUeruAxlu6x3wVlG+9nowpukILxZcs
        DxKxzSjRorsKo31iABaZ/3mLNa9/Qi4ou/B6qLQ==
X-Received: by 2002:a2e:a274:: with SMTP id k20mr291918ljm.479.1634746182214;
        Wed, 20 Oct 2021 09:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhSsiNPupR343NvBFDsjHtdlto8F9qOd/sYEX1p4Qfw8NGJ+G9g4C5wNtD9Rm2Vc5GFwE12w==
X-Received: by 2002:a2e:a274:: with SMTP id k20mr291883ljm.479.1634746182014;
        Wed, 20 Oct 2021 09:09:42 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m29sm223633lfo.104.2021.10.20.09.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 09:09:41 -0700 (PDT)
Subject: Re: [PATCH v3 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <YXA+GoTf6u/Y4qLX@google.com>
 <16c79986-03b2-b74b-0de8-4118e2c4419f@canonical.com>
Message-ID: <b98bd487-6c55-d058-8073-689b9396b527@canonical.com>
Date:   Wed, 20 Oct 2021 18:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16c79986-03b2-b74b-0de8-4118e2c4419f@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/10/2021 18:08, Krzysztof Kozlowski wrote:
> On 20/10/2021 18:04, Lee Jones wrote:
>> On Wed, 06 Oct 2021, Krzysztof Kozlowski wrote:
>>
>>> Hi All,
>>>
>>> Changes since v2
>>> ================
>>> 1. Add Rob's tags.
>>> 2. Remove "regulator-name" from properties (all regulator dtschema).
>>> 3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
>>> 4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).
>>>
>>> Changes since v1
>>> ================
>>> 1. Drop DTS patches - applied.
>>> 2. Fully remove bindings/regulator/samsung,s5m8767.txt .
>>> 3. Minor subject reformatting and few typos in text.
>>>
>>>
>>> Intro
>>> =====
>>> This patchset converts all devicetree bindings of Samsung S2M and S5M
>>> PMIC devices from txt to dtschema.
>>>
>>> It includes also two fixes because later conversion depends on it
>>> (contextually).
>>>
>>>
>>> Merging/dependencies
>>> ====================
>>> 1. Regulator related binding changes depend on first two commits (the
>>>    fixes), because of context.
>>> 2. The mfd bindings depend on clock and regulator bindings.
>>>
>>> The fixes and bindings changes (patches 1-10) should go via the same
>>> tree.  For example regulator or mfd tree.
>>>
>>> Another alternative is that regulator patches (1-2, 4-6) go via Mark who
>>> later gives MFD a stable branch/tag to pull. Then the clock and MFD
>>> bindings would go on top via MFD tree. Or any other setup you would like
>>> to have. :)
>>>
>>>
>>> Overview of devices
>>> ===================
>>> Essentially all Samsung S2M and S5M PMICs are very similar devices. They
>>> provide the same functionality: regulators, RTC, 2 or 3 clocks and main
>>> power management (e.g. power cut to SoC).
>>>
>>> The differences are mostly in registers layout and number of regulators.
>>>
>>> The drivers are built around one common part, mfd/sec-core.c, and share
>>> some drivers between devices:
>>> 1. MFD sec-core for all devices,
>>> 1. one clock driver for most of devices,
>>> 2. one RTC driver for all devices,
>>> 3. three regulator drivers.
>>>
>>> The regulator drivers were implementing slightly different features,
>>> therefore one regulator binding for all devices does not make much
>>> sense.  However the clock device binding can be shared.
>>>
>>> The final dtschema bindings try to implement this - share only the clock
>>> bindings.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>> Krzysztof Kozlowski (10):
>>>   regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
>>>     is disabled
>>>   regulator: dt-bindings: samsung,s5m8767: correct
>>>     s5m8767,pmic-buck-default-dvs-idx property
>>>   dt-bindings: clock: samsung,s2mps11: convert to dtschema
>>>   regulator: dt-bindings: samsung,s2m: convert to dtschema
>>>   regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
>>>   regulator: dt-bindings: samsung,s5m8767: convert to dtschema
>>>   dt-bindings: mfd: samsung,s2mps11: convert to dtschema
>>>   dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
>>>   dt-bindings: mfd: samsung,s5m8767: convert to dtschema
>>>   dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
>>
>> Looks like these are ready to be pushed.
>>
>> However, I am not in receipt of patches 1-2.
>>
>> Am I okay to merge 3-10 right now?
> 
> No. This is v3, but we need v4. Please:
> 1. Merge tag from Mark:
> https://lore.kernel.org/lkml/YWCT+YL%2F9qHbF9f0@sirena.org.uk/
> 
> 2. Then apply patches 7-10 (MFD bindings).

... patches 7-10 from that v4 of course. They start here:
https://lore.kernel.org/lkml/20211008113931.134847-4-krzysztof.kozlowski@canonical.com/

Best regards,
Krzysztof

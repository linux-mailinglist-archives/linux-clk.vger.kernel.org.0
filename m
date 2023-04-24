Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7516E1D73
	for <lists+linux-clk@lfdr.de>; Fri, 14 Apr 2023 09:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjDNHrB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Apr 2023 03:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjDNHq6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 03:46:58 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E45B1984
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 00:46:57 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id dm2so43616755ejc.8
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681458415; x=1684050415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt+A98jlqtbpeel2naOzylBvCk3G6/Q++nwH3epknTU=;
        b=gfgztzkwvm4gf2aIWjlZL3RjZrGc0EZbhfb1YHOpNB6u39HnCow+CWMOaNCQj4TGd0
         BTuA5kO/54Nu9izUwi6RyrymuJS0Ulvplwl/7s+cbRW3E+SCyuxEkIoIOw+Xabo7hDPB
         o31RWBIw3tMXtjlbuW51hsEkS6eW+aSOOcF0xuUA1HpAmaxXvR6UGkgl1+sR0q2uIUnZ
         lkslhm+GNb6ZoIrlae0uYFI2+SL2COzOKo4aw7LzzTdPvXPSTppDOz6QbhmkZ2MtBRpP
         Y4XONL446Ax/S2IH7glLnIimLeeiPa+RKmfqp1nsSD6GjhkfTNucg3tQEtg7Koj4HygL
         3BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681458415; x=1684050415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt+A98jlqtbpeel2naOzylBvCk3G6/Q++nwH3epknTU=;
        b=FFmxDveZDUu0LgdtxgfOFmpw/prBQbj19U31ne/mCgdIGDd/PLE3DQxv2Z/dVIWMYp
         Ej9hfWlTsnmtQmKraTE0dL5xwFIxfu7N8f/E1Xfkxl9g0mV2H7xEAZMEQilYIGFKCr9Y
         rDS3Sjf1TWMSab66oWpS2UDMTolSKNuLufBCBtiLanfkZ8DfdPtA9wJPQoEqSMxcz8eU
         ahj2vkls+Vup/O1f2qgJt3hMCAmDB63U4zLnYtwbcHYUW/wu2qte1NsseR8u8v/AYX9E
         rFLabbD+SONqe4cEcyMItEiizN01U92YgJS4P4j7uvuuC6+yIxZYqJP8t11Qaa6K+axK
         T0HQ==
X-Gm-Message-State: AAQBX9c9WU3rQsFN8AmMg8XW0LjFJm8Wor37eAcDRgIE/1u/hw8xDRFk
        HNvXCkNBLSex1oXZtg3g8brpyQ==
X-Google-Smtp-Source: AKy350bLBmexUEFzr5LRWNNM6G7YHG2r1iyM3NyfBneNEodYOJT8tqYAQv0G0zNqUi4S+WfZ7YXsOw==
X-Received: by 2002:a17:906:e2c7:b0:94e:e049:6d2a with SMTP id gr7-20020a170906e2c700b0094ee0496d2amr1504414ejb.66.1681458415547;
        Fri, 14 Apr 2023 00:46:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906314200b0094bb4c75695sm2023228eje.194.2023.04.14.00.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 00:46:55 -0700 (PDT)
Message-ID: <4b9a0f13-d03a-8496-a400-8621b8d7c98a@linaro.org>
Date:   Fri, 14 Apr 2023 09:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 12/12] MAINTAINERS: Add entry for NUVOTON MA35
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        arnd@arndb.de, schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
References: <20230412053824.106-1-ychuang570808@gmail.com>
 <20230412053824.106-13-ychuang570808@gmail.com>
 <241f6cb1-193f-d372-0eda-157946b15780@linaro.org>
 <91861072-dc2d-46d3-dc0d-26d17a3693c7@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <91861072-dc2d-46d3-dc0d-26d17a3693c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/04/2023 03:22, Jacky Huang wrote:
> Dear Krzysztof,
> 
> 
> On 2023/4/14 上午 01:01, Krzysztof Kozlowski wrote:
>> On 12/04/2023 07:38, Jacky Huang wrote:
>>> From: Jacky Huang <ychuang3@nuvoton.com>
>>>
>>> Add entry for Nuvoton ma35d1 maintainer and files.
>>> In addition, update board binding paths of NUVOTON NPCM.
>>
>>>   ARM/NUVOTON NPCM ARCHITECTURE
>>>   M:	Avi Fishman <avifishman70@gmail.com>
>>>   M:	Tomer Maimon <tmaimon77@gmail.com>
>>> @@ -2512,7 +2522,8 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>>>   S:	Supported
>>>   F:	Documentation/devicetree/bindings/*/*/*npcm*
>>>   F:	Documentation/devicetree/bindings/*/*npcm*
>>> -F:	Documentation/devicetree/bindings/arm/npcm/*
>> It is not a bisectable change.
>>
>> Best regards,
>> Krzysztof
>>
> 
> F:    Documentation/devicetree/bindings/*/*/*npcm*
> F:    Documentation/devicetree/bindings/*/*npcm*
> F:    Documentation/devicetree/bindings/arm/nuvoton/*npcm*    <-- remove 
> this
> F:    Documentation/devicetree/bindings/soc/nuvoton/*npcm* <-- remove this
> 
> Yes, the two statements at the bottom seem redundant. I will remove them.

I did not comment about "redundant". I used the word "bisectable". git
help bisect.

Best regards,
Krzysztof


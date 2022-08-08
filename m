Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1BB58C32F
	for <lists+linux-clk@lfdr.de>; Mon,  8 Aug 2022 08:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbiHHGQn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Aug 2022 02:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiHHGQm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Aug 2022 02:16:42 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EAF63C0
        for <linux-clk@vger.kernel.org>; Sun,  7 Aug 2022 23:16:41 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id j3so1583393ljo.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Aug 2022 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=fciYAWSZMoQdWO6XEfsJh4SM4ZwutMpTVspkx/ExHXE=;
        b=bk4Hper+0UryWZ+lPbB2cSDixGFoOcgSbcXAFwqlIywgvpLQ98GuypeYJ3VBpj2xfy
         j7nEM0054ptCZ+KFUBB3GtBXRPKadXLk9wfpboDt1ZqwxcSUqKEdjK4zjGIiP8tZZZjE
         U1uhlDjUnqiYX7ei/0WFkfaSTDzlmz6mFjnTUFZsUJLn0x4eCwuH9iogaQTgBL5hqpIn
         lSQZZSch7OFAXDKMoobdNkGJqFgFiUAhE1VVW0amRv09HDQOHzDEcNCG1izdtY76rjJk
         Ieet4gIcOBL9cEhVL2uMzMl9YEjpA5O4JLAJkqc42qV12FrdGle2xXQquZHu4Y8CevGi
         Qv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fciYAWSZMoQdWO6XEfsJh4SM4ZwutMpTVspkx/ExHXE=;
        b=tJWo4AnQX4Eg6a9oKGm4NyVMx93h3/Ir0Q9Z3byqLuSbg+E8RX3DXSJOMVbmE5wT3G
         SvaW+RK67f0Y9YiOX2GdfXo8HypMV80Rwd7I0vi6UnH/N5lkQ0qxfCpnSpGMw/3wb19D
         G6muz0NWSnfKp//drNV1fOWuOYFv6iM2UJb7AkciBLQonYBbbdx/y7ZTAkms2gciyeIj
         +9EugUZjFb58k2rYfphVCSsL0VxEQigpEgosUOIlWlcX+kr/qZBGCThuaW5ihFaui3eS
         EEmvbESqomz0WnlMsmN3fVefLgMOCxcGoycajTO5sw8LnaS9XjJv8CLYjXHACy0pn5x2
         1OKw==
X-Gm-Message-State: ACgBeo0nWJNFulbhGCWtTBXr/fWLi2zuuJFxmEoOataAGuwQ1FAZ/yNQ
        XxabcZT0uu0ixYr2oHOnvoknKw==
X-Google-Smtp-Source: AA6agR5vMHc+EuCiaOqe/h+2rKNhnqSu9yo7e+ImS+1K4uYlMyJij6BbOz3rr/MMTTXBK9Isto4CpQ==
X-Received: by 2002:a2e:beaa:0:b0:25e:34d0:4d57 with SMTP id a42-20020a2ebeaa000000b0025e34d04d57mr5361387ljr.329.1659939399654;
        Sun, 07 Aug 2022 23:16:39 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b0048a891e4d88sm1310468lfr.193.2022.08.07.23.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 23:16:39 -0700 (PDT)
Message-ID: <e78f108d-ab29-1d92-d96e-07393aaf2a65@linaro.org>
Date:   Mon, 8 Aug 2022 09:16:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-5-yu.tu@amlogic.com>
 <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
 <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 11:33, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your reply.
> 
> On 2022/8/5 17:15, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 05/08/2022 10:57, Yu Tu wrote:
>>> Add peripheral clock controller compatible and dt-bindings header for
>>> the of the S4 SoC.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
>>>   include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
>>>   2 files changed, 223 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..2471276afda9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>
>> Filename should be based on compatible, so amlogic,s4-periphs-clkc.yaml
> I will correct as you suggest in the next version.
>>
>>> @@ -0,0 +1,92 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings
>>
>> s/Device Tree Bindings//
> what's mean?

It's a expression (simplified not accurate) from many Linux tools, e.g.
sed, vim etc
s/SEARCH/REPLACE/
so just drop that piece I wrote above.

Best regards,
Krzysztof

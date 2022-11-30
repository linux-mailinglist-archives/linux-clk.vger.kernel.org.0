Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655D163DCA4
	for <lists+linux-clk@lfdr.de>; Wed, 30 Nov 2022 19:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiK3SGA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 30 Nov 2022 13:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiK3SFn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 13:05:43 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA3A74CC4;
        Wed, 30 Nov 2022 10:05:40 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 0914324E023;
        Thu,  1 Dec 2022 02:05:39 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 02:05:38 +0800
Received: from [192.168.0.42] (183.27.96.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 02:05:37 +0800
Message-ID: <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
Date:   Thu, 1 Dec 2022 02:05:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        <linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
 <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
 <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
 <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
From:   Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.96.20]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Nov 2022 16:19:06 +0100, Krzysztof Kozlowski wrote:
> On 30/11/2022 16:12, Hal Feng wrote:
>> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>>> On 30/11/2022 10:47, Hal Feng wrote:
>>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>
>>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>>
>>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>>
>>>>>> Binding headers are coming with the file bringing bindings for the
>>>>>> device, so you need to squash patches.
>>>>>
>>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>>> following files in one commit?
>>>>>
>>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>>
>>>> Hi, Krzysztof,
>>>>
>>>> Could you please give me some suggestions?
>>>
>>> You can keep aon and sys split. First add one of them with their own
>>> headers. Then add second with their own defines.
>> 
>> You mean split patch 7 and patch 8 into sys part and aon part
>> respectively? There are totally five regions (sys/aon/stg/isp/vout)
>> for clocks and resets in JH7110. If we do that, there will be 5
>> headers for JH7110 in either clock or reset directory finally. Is
>> that OK if there are too many headers for just one SoC?
> 
> 
> Sorry, I lost the track of what patches you have. The comment was -
> bindings include both the doc and headers. You want to split some, some
> merge, sorry, no clue. I did not propose splitting headers...

It's ok. The problem was that the header

include/dt-bindings/clock/starfive,jh7110-crg.h

was used in both

Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml

and

Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml.

The same for include/dt-bindings/reset/starfive,jh7110-crg.h.
So should I add these four files in one patch?

Best regards,
Hal

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5021F583B8A
	for <lists+linux-clk@lfdr.de>; Thu, 28 Jul 2022 11:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbiG1JxB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Jul 2022 05:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbiG1JxB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 05:53:01 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11EB15A2E;
        Thu, 28 Jul 2022 02:52:59 -0700 (PDT)
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 17:52:57 +0800
Message-ID: <9256c0f2-a656-996f-0ed8-d22ae2907070@amlogic.com>
Date:   Thu, 28 Jul 2022 17:52:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
 <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
 <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
 <965f83cf-4695-f89c-5ede-2f6b2524f392@amlogic.com>
 <1jr125fvz0.fsf@starbuckisacylon.baylibre.com>
From:   Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jr125fvz0.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2022/7/28 17:03, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Thu 28 Jul 2022 at 16:55, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> Hi Jerome,
>> 	Thanks for your reply and explanation.
>>
>> On 2022/7/28 16:27, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu 28 Jul 2022 at 16:06, Yu Tu <yu.tu@amlogic.com> wrote:
>>>
>>>> Hi JB，
>>>>
>>>> On 2022/7/28 15:08, Jerome Brunet wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On Thu 28 Jul 2022 at 13:41, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>
>>>>>> 1. Add clock controller driver for S4 SOC.
>>>>>>
>>>>>> Yu Tu (3):
>>>>>>      dt-bindings: clk: meson: add S4 SoC clock controller bindings
>>>>>>      arm64: dts: meson: add S4 Soc clock controller in DT
>>>>>>      clk: meson: s4: add s4 SoC clock controller driver
>>>>>>
>>>>>> V1 -> V2: Change format as discussed in the email.
>>>>>>
>>>>>> Link:https://lore.kernel.org/linux-amlogic/20220708062757.3662-1-yu.tu@amlogic.com/
>>>>>>
>>>>>>     .../bindings/clock/amlogic,gxbb-clkc.txt      |    1 +
>>>>>>     MAINTAINERS                                   |    1 +
>>>>>>     arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   11 +
>>>>>>     drivers/clk/meson/Kconfig                     |   15 +
>>>>>>     drivers/clk/meson/Makefile                    |    1 +
>>>>>>     drivers/clk/meson/s4.c                        | 4732 +++++++++++++++++
>>>>>>     drivers/clk/meson/s4.h                        |  296 ++
>>>>>>     include/dt-bindings/clock/s4-clkc.h           |  146 +
>>>>>>     8 files changed, 5203 insertions(+)
>>>>>>     create mode 100644 drivers/clk/meson/s4.c
>>>>>>     create mode 100644 drivers/clk/meson/s4.h
>>>>>>     create mode 100644 include/dt-bindings/clock/s4-clkc.h
>>>>>>
>>>>>>
>>>>>> base-commit: b293bc9286ee21824e93f0fcfed3b78fdfee01e6
>>>>> Please don't post until you have addressed *ALL* the comments from the
>>>>> previous version.
>>>> The last email asked you to adopt A1 method, but you did not reply?
>>>>
>>>>> At first glance, I can see that this is still a single driver for
>>>>> what is obviously 2 controllers with 2 register spaces. Simple comments
>>>>> like the "<< 2" in the register declaration have not been addressed either.
>>>> I understand that this should be a controller, just two address
>>>> descriptions. One is the various PLL registers and one is the clock for
>>>> the peripherals. And PLL is to provide a clock source for various
>>>> peripheral clocks. So a clock controller is reasonable. I think you got
>>>> it wrong.
>>> I don't think I do. This looks exactly like the A1.
>>> The post of that controller are still in the  archive and I am sure your
>>> colleagues can give you the history.
>>> You clearly have register regions providing clock, separated by
>>> 0x8000. Claiming that as one big region is bad design.
>>> There has been several remarks about using a big syscon on V1,
>>> unaddressed too.
>>> CCF has everything necessary in place to handle each register region
>>> separately, properly and pass clock around.
>>> You can handle it as a single controller, claiming the two regions
>>> individually but:
>>> # 1 - handling 2 different regmaps in the controller is going to be
>>>         bigger mess than you think
>>> # 2 - I am far from convinced there is any reason to do so
>>>
>> It makes sense, as you say, to separate the two controllers. But I think
>> the only thing that was forced apart was that the digital designers
>> didn't put these registers together when they were designing the chips.
>>
> 
> One controller is providing all the base PLLs
> The other is providing most (if not all) the devices clocks.
> This does not look like coincidence or mistake to me.
Thanks for your reply. Looks like I got it wrong. However, I will talk 
to the chip designer about whether it is possible to put these registers 
in the later chip so that it may be easier for our software to process.

> 
>> I'm going to separate the two controllers like you said.
>>
>>>
>>>>
>>>> Ok, if you insist on using two clock controllers,, please provide your the
>>>> reason and example code?
>>>>
>>>>> Seeing that, I have not reviewed this version further.
>>>>> I won't until all the comments from v1 are either addressed or answer
>>>>> Regards
>>>>> Jerome
>>>>> .
>>> .
> 
> .

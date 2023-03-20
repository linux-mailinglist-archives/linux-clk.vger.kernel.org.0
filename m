Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A556C0B5C
	for <lists+linux-clk@lfdr.de>; Mon, 20 Mar 2023 08:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjCTHaB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Mar 2023 03:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjCTH37 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 03:29:59 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2864783DA;
        Mon, 20 Mar 2023 00:29:57 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 8E20B24E1DF;
        Mon, 20 Mar 2023 15:29:55 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:29:55 +0800
Received: from [192.168.125.128] (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:29:54 +0800
Message-ID: <ce674ea9-41ec-2862-c39c-207f0b6c45a2@starfivetech.com>
Date:   Mon, 20 Mar 2023 15:29:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
 <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
 <45221a1c-dc01-2759-3e32-658636625529@starfivetech.com>
 <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/3/20 14:37, Krzysztof Kozlowski wrote:
> On 20/03/2023 04:54, Xingyu Wu wrote:
>> On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
>>> On 16/03/2023 04:05, Xingyu Wu wrote:
>>>> Add optional compatible and patternProperties.
>>>>
>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>> ---
>>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> index ae7f1d6916af..b61d8921ef42 100644
>>>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> @@ -15,16 +15,31 @@ description: |
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - starfive,jh7110-aon-syscon
>>>> -          - starfive,jh7110-stg-syscon
>>>> -          - starfive,jh7110-sys-syscon
>>>> -      - const: syscon
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-aon-syscon
>>>> +              - starfive,jh7110-stg-syscon
>>>> +              - starfive,jh7110-sys-syscon
>>>> +          - const: syscon
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-aon-syscon
>>>> +              - starfive,jh7110-stg-syscon
>>>> +              - starfive,jh7110-sys-syscon
>>>> +          - const: syscon
>>>> +          - const: simple-mfd
>>>>  
>>>>    reg:
>>>>      maxItems: 1
>>>>  
>>>> +patternProperties:
>>>> +  # Optional children
>>>> +  "pll-clock-controller":
>>>
>>> It's not a pattern.
>> 
>> Does it use 'properties' instead of 'patternProperties'?
> 
> Yes.
> 
>> 
>>>
>>> Anyway should be clock-controller
>> 
>> Will fix.
>> 
>>>
>>>> +    type: object
>>>> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>>>> +    description: Clock provider for PLL.
>>>> +
>>>
>>> You just added these bindings! So the initial submission was incomplete
>>> on purpose?
>>>
>>> No, add complete bindings.
>> 
>> Does you mean that it should drop the 'description', or add complete 'description',
>> or add 'compatible', 'clocks' and 'clock-cells' of complete clock-controller bindings?
> 
> It means it should be squashed with the patch which adds it.

Should I drop the 'decription' here and keep the 'decription' in patch1?

> 
>> 
>>>
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>> @@ -38,4 +53,16 @@ examples:
>>>>          reg = <0x10240000 0x1000>;
>>>>      };
>>>>  
>>>> +  - |
>>>> +    syscon@13030000 {
>>>
>>> No need for new example... Just put it in existing one.
>>>
>> 
>> Actually, the PLL clock-controller are just set in sys-syscon resgisters. The stg-syscon and
>> aon-syscon don't need it. So PLL clock-controller node only is added in sys-syscon node.
> 
> So why having other examples if they are included here? Drop them.
> 

Should I drop the old example of stg-syscon and add a new example of sys-syscon which
include clock-controller child node?

Best regards,
Xingyu Wu

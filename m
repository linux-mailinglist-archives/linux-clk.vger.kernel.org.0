Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1058B581066
	for <lists+linux-clk@lfdr.de>; Tue, 26 Jul 2022 11:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbiGZJyd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Jul 2022 05:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237991AbiGZJyb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 05:54:31 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5282CCB9;
        Tue, 26 Jul 2022 02:54:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj79.neoplus.adsl.tpnet.pl [83.9.3.79])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A4639201DF;
        Tue, 26 Jul 2022 11:54:25 +0200 (CEST)
Message-ID: <5b938039-0a73-90e5-47c1-4d976d278273@somainline.org>
Date:   Tue, 26 Jul 2022 11:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add SM6375 QCOM global clock
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220723100135.91784-1-konrad.dybcio@somainline.org>
 <20220723100135.91784-2-konrad.dybcio@somainline.org>
 <27154a09-d79b-7814-22ec-c84496596abc@linaro.org>
 <6a33d026-9f30-358e-8498-dbe315fccc5b@somainline.org>
 <cdb5ede1-20b3-223c-efd3-21edb8e715a5@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <cdb5ede1-20b3-223c-efd3-21edb8e715a5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 26.07.2022 11:52, Krzysztof Kozlowski wrote:
> On 23/07/2022 22:56, Konrad Dybcio wrote:
>>
>>
>> On 23.07.2022 19:46, Krzysztof Kozlowski wrote:
>>> On 23/07/2022 12:01, Konrad Dybcio wrote:
>>>> Add device tree bindings for global clock controller for SM6375 SoCs.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>>> ---
>>>> Changes since v2:
>>>> - reference qcom,gcc.yaml
>>>>
>>>>  .../bindings/clock/qcom,sm6375-gcc.yaml       |  48 ++++
>>>>  include/dt-bindings/clock/qcom,sm6375-gcc.h   | 234 ++++++++++++++++++
>>>>  2 files changed, 282 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>>>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>>> new file mode 100644
>>>> index 000000000000..fb1c36888d18
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>>> @@ -0,0 +1,48 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Global Clock & Reset Controller Binding for SM6375
>>>> +
>>>> +maintainers:
>>>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>>>> +
>>>> +description: |
>>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>>> +  power domains on SM6375
>>>> +
>>>> +  See also:
>>>> +  - dt-bindings/clock/qcom,sm6375-gcc.h
>>>> +
>>>> +allOf:
>>>> +  - $ref: qcom,gcc.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,sm6375-gcc
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Board XO source
>>>> +      - description: Board XO Active-Only source
>>>> +      - description: Sleep clock source
>>>
>>> What happened to clock-names?
>>>
>>>> +
>>>
>>> I would assume these are required for the clock controller... and they
>>> were before, so what happened?
>> I dropped them in v2, as with switching the .c driver to use the
>> index matching, they are no longer used.
> 
> OK, but what about clocks as required? Why aren't these now required?
Ohhhh right, I had a false impression that they were set in qcom,gcc.yaml.
Will fix it.

Konrad
> 
> 
> Best regards,
> Krzysztof

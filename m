Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3272657BEAD
	for <lists+linux-clk@lfdr.de>; Wed, 20 Jul 2022 21:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235957AbiGTTgh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 20 Jul 2022 15:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235714AbiGTTgg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jul 2022 15:36:36 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338676110C;
        Wed, 20 Jul 2022 12:36:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj77.neoplus.adsl.tpnet.pl [83.9.3.77])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E1CC22004C;
        Wed, 20 Jul 2022 21:36:30 +0200 (CEST)
Message-ID: <887b005d-750d-39f2-73b7-851aa0e461f4@somainline.org>
Date:   Wed, 20 Jul 2022 21:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add SM6375 QCOM global clock
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
References: <20220719115756.32231-1-konrad.dybcio@somainline.org>
 <20220719115756.32231-2-konrad.dybcio@somainline.org>
 <11cc46d8-ae01-f3d2-b9c6-c366c6e4afc9@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <11cc46d8-ae01-f3d2-b9c6-c366c6e4afc9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 20.07.2022 08:27, Krzysztof Kozlowski wrote:
> On 19/07/2022 13:57, Konrad Dybcio wrote:
>> Add device tree bindings for global clock controller for SM6375 SoCs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>> Changes since v1:
>> - dropped clock-names (switched to .index)
>>
>>  .../bindings/clock/qcom,sm6375-gcc.yaml       |  65 +++++
>>  include/dt-bindings/clock/qcom,sm6375-gcc.h   | 234 ++++++++++++++++++
>>  2 files changed, 299 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>> new file mode 100644
>> index 000000000000..2e43cd75d3d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller Binding for SM6375
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |
>> +  Qualcomm global clock control module which supports the clocks, resets and
>> +  power domains on SM6375
>> +
>> +  See also:
>> +  - dt-bindings/clock/qcom,sm6375-gcc.h
>> +
> 
> Why you are not referencing qcom,gcc.yaml?
Hm.. Out of all the SoCs we support, only apq8084 and apq/ipq8064 reference it..
Should I add that?

Konrad


> 
>> +properties:
>> +  compatible:
>> +    const: qcom,sm6375-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board XO Active-Only source
>> +      - description: Sleep clock source
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +    clock-controller@1400000 {
>> +      compatible = "qcom,sm6375-gcc";
>> +      reg = <0x01400000 0x1f0000>;
>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +               <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +               <&sleep_clk>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,sm6375-gcc.h b/include/dt-bindings/clock/qcom,sm6375-gcc.h
>> new file mode 100644
>> index 000000000000..1e9801e1cedf
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,sm6375-gcc.h
>> @@ -0,0 +1,234 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Hm, Qualcomm gave permission to relicense bindings to dual-license,
> although I am not sure how this works with files where copyrights were
> transferred to Linux Foundation...
> 
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2022, Konrad Dybcio <konrad.dybcio@somainline.org>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM6375_H
>> +#define _DT_BINDINGS_CLK_QCOM_GCC_SM6375_H
>> +
> 
> 
> Best regards,
> Krzysztof

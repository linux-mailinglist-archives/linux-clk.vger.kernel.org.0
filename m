Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04044CA6A8
	for <lists+linux-clk@lfdr.de>; Wed,  2 Mar 2022 14:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242562AbiCBNyu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Mar 2022 08:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbiCBNxt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 08:53:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADFEC6266
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 05:51:25 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 78D9F3F610
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646229074;
        bh=sqmPaXdxxxGctLDB8wPzIBqrPvGA/5GcLbU1pcYO7kw=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=QiAm4lzV4j9cdRvKt+YSMYOJnoM0eqXiJ8fZPYydz0ZDKmm7CdahTOT8rPaBwcpi5
         l9+x0E6arH63yGtazl7uYt5TaO2I0aaaMZQDFOQ8M8J3a90earVJ4M2UMDW0KkSOPJ
         YkoXESM0CziWr+JmZ5atj/KXYqOGep4jJohdX98b4QkJNkNPXkOrUJ64xF/C9mncUx
         HXvNkrrxn67Na7U1w3oIzOUxjKhciiSS0D/bi89pXxVmw1SoHC8JQV7qMRFVpjeB6E
         egb/e8esAvxMHewEpldbarVk8jZweDsYOxmwwhJNE+nKXdIER/9AyqcFhXeOaHo4V1
         eiCIBwLfzednA==
Received: by mail-ed1-f72.google.com with SMTP id r9-20020a05640251c900b00412d54ea618so1024298edd.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 05:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sqmPaXdxxxGctLDB8wPzIBqrPvGA/5GcLbU1pcYO7kw=;
        b=5klR1U14Q7MQGDRW4SowHJ5yJeTpeZGVs61jxhxlnkvgo4DEu6bP/+bz4W9jUbmvGe
         WO5ZUoEIoQdBsovlVE6koue4L6FO6SICqxQpYzSqDwxtGfqO90wiVvuUjMJtB3uxpEMw
         D5teUI4wSOi0Ef1lytQJ4Epca7bmobdjbTxuweFWxRYgYm6oEgGgpjaVwTBAJlA11fBB
         nJ630YJmoJucqGT3WigfigDCmlnzHH1P9NmN5gF8LBvRNNebFiDljxaqjOxh4KaQ7SsU
         0KT95A5Z840rjerwoPW4x2IjZYQE3V72nwSF/g1bNmawxCtSo9WRhwb+Y5E+Be+wLT7d
         VU4g==
X-Gm-Message-State: AOAM533P/k1BMcGZM0TVDZhduWlV2pTPpIczoLFhSUcD7N5im4atfgJH
        Tw/WITpP5xxugijjdfOpLrYMNahCQsWwvMbQ1raz1bIEDxiPR7vx/bObmX1puJGceJbmbETDNBP
        oxLO7IvlaJmmw2rdb/PAY10HNGQ9nAfY2rwEyrA==
X-Received: by 2002:aa7:cc02:0:b0:411:487e:36fe with SMTP id q2-20020aa7cc02000000b00411487e36femr29496883edt.338.1646229073281;
        Wed, 02 Mar 2022 05:51:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX4GrcpOZdSJtCi/COSwNz1OLfF4qe+Oy6hmPfNQADJxnPOKAqrg9txmB1CGt/uFrFMkDGjQ==
X-Received: by 2002:aa7:cc02:0:b0:411:487e:36fe with SMTP id q2-20020aa7cc02000000b00411487e36femr29496856edt.338.1646229073047;
        Wed, 02 Mar 2022 05:51:13 -0800 (PST)
Received: from [192.168.0.136] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id u4-20020aa7db84000000b004136c2c357csm8402272edt.70.2022.03.02.05.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 05:51:12 -0800 (PST)
Message-ID: <2b1f7c07-3cc9-9637-4621-3c5e0e09a65e@canonical.com>
Date:   Wed, 2 Mar 2022 14:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220226200911.230030-1-marijn.suijten@somainline.org>
 <20220226200911.230030-3-marijn.suijten@somainline.org>
 <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
 <62ebb074-b8de-0dc3-2bbc-e43dca9d2ced@linaro.org>
 <05310308-b0ff-56a0-83ac-855b1b795936@canonical.com>
 <20220302125417.iu52rvdxrmo25wwt@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220302125417.iu52rvdxrmo25wwt@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/03/2022 13:54, Marijn Suijten wrote:
> On 2022-02-28 10:23:19, Krzysztof Kozlowski wrote:
>> On 27/02/2022 22:43, Dmitry Baryshkov wrote:
>>> On 27/02/2022 13:03, Krzysztof Kozlowski wrote:
>>>> On 26/02/2022 21:09, Marijn Suijten wrote:
>>>>> From: Martin Botka <martin.botka@somainline.org>
>>>>>
>>>>> Add device tree bindings for display clock controller for
>>>>> Qualcomm Technology Inc's SM6125 SoC.
>>>>>
>>>>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>>>> ---
>>>>>   .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>>>>>   .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>>>>>   2 files changed, 128 insertions(+)
>>>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3465042d0d9f
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>>> @@ -0,0 +1,87 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Display Clock Controller Binding for SM6125
>>>>> +
>>>>> +maintainers:
>>>>> +  - Martin Botka <martin.botka@somainline.org>
>>>>> +
>>>>> +description: |
>>>>> +  Qualcomm display clock control module which supports the clocks and
>>>>> +  power domains on SM6125.
>>>>> +
>>>>> +  See also:
>>>>> +    dt-bindings/clock/qcom,dispcc-sm6125.h
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - qcom,sm6125-dispcc
>>>>> +
>>>>> +  clocks:
>>>>> +    items:
>>>>> +      - description: Board XO source
>>>>> +      - description: Byte clock from DSI PHY0
>>>>> +      - description: Pixel clock from DSI PHY0
>>>>> +      - description: Pixel clock from DSI PHY1
>>>>> +      - description: Link clock from DP PHY
>>>>> +      - description: VCO DIV clock from DP PHY
>>>>> +      - description: AHB config clock from GCC
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: bi_tcxo
>>>>> +      - const: dsi0_phy_pll_out_byteclk
>>>>> +      - const: dsi0_phy_pll_out_dsiclk
>>>>> +      - const: dsi1_phy_pll_out_dsiclk
>>>>> +      - const: dp_phy_pll_link_clk
>>>>> +      - const: dp_phy_pll_vco_div_clk
>>>>> +      - const: cfg_ahb_clk
>>>>> +
>>>>> +  '#clock-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  '#power-domain-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - '#clock-cells'
>>>>> +  - '#power-domain-cells'
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>>>>> +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>>>>> +    clock-controller@5f00000 {
>>>>> +      compatible = "qcom,sm6125-dispcc";
>>>>> +      reg = <0x5f00000 0x20000>;
>>>>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>>>> +               <&dsi0_phy 0>,
>>>>> +               <&dsi0_phy 1>,
>>>>> +               <0>,
>>>>
>>>> This does not look like a valid phandle. This clock is required, isn't it?
> 
> I remember it being used like this before, though upon closer inspection
> only qcom,gcc-msm8998.yaml uses it as example.
> 
> The clock should be optional, in that case it is perhaps desired to omit
> it from clock-names instead, or pretend there's a `dsi1_phy 1`?

I propose to omit it.

> 
>>>
>>> Not, it's not required for general dispcc support.
>>> dispcc uses DSI and DP PHY clocks to provide respective pixel/byte/etc 
>>> clocks. However if support for DP is not enabled, the dispcc can work 
>>> w/o DP phy clock. Thus we typically add 0 phandles as placeholders for 
> 
> Is there any semantic difference between omitting the clock from DT (in
> clocks= /and/ clock-names=) or setting it to a 0 phandle?

Yes, there is. The DT validation does not check the meaning behind
values, so there is no difference between valid phandle/ID and 0. While
not having a clock at all is spotted by validation.

> 
>>> DSI/DP clock sources and populate them as support for respective 
>>> interfaces gets implemented.
>>>
>>
>> Then the clock is optional, isn't it? While not modeling it as optional?
> 
> It looks like this should be modelled using minItems: then, and
> "optional" text/comment? Other clocks are optional as well, we don't
> have DSI 1 in downstream SM6125 DT sources and haven't added the DP PLL
> in our to-be-upstreamed mainline tree yet.

Are they really optional? Or maybe they should not even be provided?


Best regards,
Krzysztof

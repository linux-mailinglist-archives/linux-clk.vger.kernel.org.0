Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EFB67C104
	for <lists+linux-clk@lfdr.de>; Thu, 26 Jan 2023 00:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjAYXlS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Jan 2023 18:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235899AbjAYXlQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 18:41:16 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C741E9FC
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 15:40:56 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id fi26so414706edb.7
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwbh4PMMgQkzK1kN5wBumD27P6cUdwxiPyBgeqdBGE8=;
        b=fa0DKCBR1y8U9WBPRxnY2UCvnuvn1v8AiF6ILlWIsxizB5wrwtwS0CIj2zUbtWnAok
         9L1zV52StAkqEa+NA34RXbIVwu3Vczf0gvqveuHsuYawckRwgreTanuoIDrlj+oAPc9p
         p1ClcQUjXzefJakq/gI0g7M/AquA3ojsLjIToGgBoBlOZkWWQBQ1hyezlFIhSkUc5g7Z
         fIsysE3cg3CmnS64yDTtL9fZ/Z6VtzEslN86/4sZcgYp5Vfk+uGgIO8rSJGLntGH3tbd
         wx+RSDEsSu96+llKN8qYgYSCQOhrxiYT2cWOslznqaaZuSz4t9tPdg3OL5kDjWsbOeTn
         UMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwbh4PMMgQkzK1kN5wBumD27P6cUdwxiPyBgeqdBGE8=;
        b=3ej4AVFgmPd0K3oFfLLaKmObTvcLI5OAINUH1GIYYNGHWVSJ/oiaUT3E9UMfSYa9ke
         ItSy9ZERzefpQCFtZtM153LXqL6PrvQEJcZGnF4td71Ctr6lz2RLnCZy3dy0vAETBQav
         IDwB6pA7KEf4pO0CMVSna+UGhanhu5tY5hx66/0zPXGYhtljGD83bdVvcpdiZ4h1uOTg
         NqexmWKP3537o4TjUd0KlxGhqqA8rT0ThnTJ/snBqNCpr7Htl1ZLztFGKxGKfRwtlzes
         7LgnZfsvcB47L5Zk0PDjWLSA8KfxRoTPR4OtZYirgTvrqiRy7DtsU6BmJnTnrkvABkC8
         o2dQ==
X-Gm-Message-State: AFqh2kpP3n6MPTqeI8Uds2a/ELrZ0Nyf3okp1O0YBq1RytgTkiHC6uar
        Yavx7MYWX7ghqR0/uhRbXmi/hg==
X-Google-Smtp-Source: AMrXdXuYWSskUkqSo1Tvp5slx5lvO2ecBO+FafsWhHmYSfLfJmMEzAb40/zHEQvkBIp8Ofmlx80UMQ==
X-Received: by 2002:a05:6402:3709:b0:488:6003:24b6 with SMTP id ek9-20020a056402370900b00488600324b6mr37104852edb.40.1674690054987;
        Wed, 25 Jan 2023 15:40:54 -0800 (PST)
Received: from [192.168.1.101] (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id g12-20020a056402180c00b00499703df898sm2934824edy.69.2023.01.25.15.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:40:54 -0800 (PST)
Message-ID: <41efc16a-8b6d-e6c1-efe1-4e0b4ce43533@linaro.org>
Date:   Thu, 26 Jan 2023 00:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V1 7/8] arm64: dts: qcom: Add ipq9574 SoC and AL02 board
 support
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230124141541.8290-1-quic_devipriy@quicinc.com>
 <20230124141541.8290-8-quic_devipriy@quicinc.com>
 <adb66162-6ff3-184e-fe92-109bdef8ed1c@linaro.org>
 <9cce23e9-bb1e-b49e-b771-f61ac6d12933@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <9cce23e9-bb1e-b49e-b771-f61ac6d12933@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 25.01.2023 12:12, Devi Priya wrote:
> 
> 
> On 1/24/2023 8:44 PM, Krzysztof Kozlowski wrote:
>> On 24/01/2023 15:15, devi priya wrote:
>>> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>>>
>>> Add initial device tree support for Qualcomm IPQ9574 SoC
>>> and AL02 board
>>>
>>> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
>>> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
>>> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile            |   1 +
>>>   arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts |  78 +++++
>>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi        | 285 +++++++++++++++++++
>>>   3 files changed, 364 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
>>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 3e79496292e7..872c62028a0b 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += ipq6018-cp01-c1.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk01.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk10-c1.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk10-c2.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)    += ipq9574-al02-c7.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += msm8916-alcatel-idol347.dtb
>>
>> This does not match current tree, so I could not apply it for tests. I
>> think you based it on a bit older version.
>>
> The patch series is based on Linux 6.2-rc1 and not the qcom/for-next branch.
Linux 6.2-rc1 is very old already and Bjorn has already picked
tens of patches atop it, so yours will not apply unless you
base it on qcom/for-next (or just linux-next for that matter).

Konrad
>> Best regards,
>> Krzysztof
>>
> Best Regards,
> Devi Priya

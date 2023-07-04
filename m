Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B23747349
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jul 2023 15:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjGDNu0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 4 Jul 2023 09:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjGDNuZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 09:50:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D75E3
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 06:50:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so7046817e87.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688478622; x=1691070622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DsZYUEHTqBU3AGKVXdDyeX9gb+lep1XYSsRWjvSZ/I=;
        b=WKNuf3B5GGVejJYAW9LuXXw4+PS33E2LeapZGIUL6ADxTRm91x8bmjoKpA5mlZ/X8G
         7MR9wRGTLSrVuf/Fi7gXmHazP0tYZxSi47S5Mnc79Qd2bJEU4PV3an8129x/i9tN2qPm
         xwnTagR+NSsvrThZpYnCBo8V3Litsui7nf7hPw67DsxGA7YnbaZTdT3eR3D6AuKib2dJ
         ++f4fKb7Oc//QAvyuv2JJVrlZCTP4vCtTyv8qS/eouEntZBHpKdFVklyGE6vbxGXNijm
         IrCkUwJuHuiI/FbeBXIh3gusYJqXYK3GOC1E1L5mCqvvqSKmOjPo8/1D6Q/EJMiekREY
         oW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478622; x=1691070622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DsZYUEHTqBU3AGKVXdDyeX9gb+lep1XYSsRWjvSZ/I=;
        b=IQ2oKQ1ZgfZzhYoKZk9DTKbYlXS0V7P0LyKH1OmVa8tOjkNaewn62O6MPSd1X8gvf2
         4ZjnOZWmnfZo3nwuTjozZ2Enl68plBHVvMqTubHx2dLbWvcPwIHh/lnaV1oTZu0lp26M
         X81jDzbbG4NlqA7m/PRx6d58R5xyoZddWgvzrKbJZGfjPCR6OVjm2+v5sxwRuU95xTyx
         u0vtU8QVmrA9/boVNxbbpSc1GudQLXbALTHMS9hI7VwjFx9cRMS4noV/slT9SUeG/me8
         3hZMlxsn7H6uKK73zfKqyAfTKFrCBlm+BQV17f3V6txycEfNpMyd2c2IgqkjUFojRkMb
         C8TQ==
X-Gm-Message-State: AC+VfDxPt3WARe+kMfmzzVqBmnVMlv1CPEDNN8xq/pf63yv0SQ7u/bS1
        LbSwhvfJyDD0Jw26lempO0D6kQ==
X-Google-Smtp-Source: ACHHUZ40dzDwz/sUzcpkcaTq5m/CZjEKlgEj3OYPpc+HneTDxI2+nl4kPhWRf9VGETUxPCD/Rj4GPQ==
X-Received: by 2002:ac2:4e0c:0:b0:4f4:7a5:e800 with SMTP id e12-20020ac24e0c000000b004f407a5e800mr6424265lfr.10.1688478622464;
        Tue, 04 Jul 2023 06:50:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id f14-20020ac2532e000000b004fb77cb4b8esm4291607lfh.14.2023.07.04.06.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 06:50:22 -0700 (PDT)
Message-ID: <3a305852-b44f-0b4b-e8dc-fbb0749ddb18@linaro.org>
Date:   Tue, 4 Jul 2023 15:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 4/8] ARM: dts: qcom: msm8960-cdp: constraint cpufreq
 regulators
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
 <20230702175045.122041-5-dmitry.baryshkov@linaro.org>
 <971262d5-98b3-c48e-89fd-ce107275008a@linaro.org>
 <CAA8EJpqvk02LeuS=-pPLUi=0OsBQ0npqioEtYkiNfPm+0EpF8Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqvk02LeuS=-pPLUi=0OsBQ0npqioEtYkiNfPm+0EpF8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4.07.2023 15:34, Dmitry Baryshkov wrote:
> On Tue, 4 Jul 2023 at 16:03, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 2.07.2023 19:50, Dmitry Baryshkov wrote:
>>> Add additional constraints to the CPUfreq-related regulators, it is
>>> better be safe than sorry there.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I'm squinting quite hard at
>>
>> https://github.com/LineageOS/sony-kernel-msm8960/blob/jb-dev/arch/arm/mach-msm/acpuclock-8960.c
>>
>> but I can't figure out where these min values came from
> 
> These should be the minimum values for vdd_min and vdd_dig in
> l2_freq_tbl_8960_kraitv2 (v1 is unsupported in mainline).
> See below,
> 
>>
>> Konrad
>>>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
>>> index 414881d34c60..cba0d1e460a1 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
>>> @@ -131,7 +131,7 @@ pm8921_s2: s2 {
>>>               };
>>>
>>>               pm8921_s3: s3 {
>>> -                     regulator-min-microvolt = <500000>;
>>> +                     regulator-min-microvolt = <950000>;
> 
> And this is obviously a c&p from 8064. This should be 1050000.
Okay, please remember to fix all other boards from this patchset too.

Konrad
> 
>>>                       regulator-max-microvolt = <1150000>;
>>>                       qcom,switch-mode-frequency = <4800000>;
>>>                       bias-pull-down;
>>> @@ -287,7 +287,7 @@ pm8921_l23: l23 {
>>>               };
>>>
>>>               pm8921_l24: l24 {
>>> -                     regulator-min-microvolt = <750000>;
>>> +                     regulator-min-microvolt = <1050000>;
>>>                       regulator-max-microvolt = <1150000>;
>>>                       bias-pull-down;
>>>               };
> 
> 
> 

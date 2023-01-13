Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F0C66997B
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jan 2023 15:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241610AbjAMOGV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 Jan 2023 09:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241767AbjAMOFs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:05:48 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E080848C1
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:02:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu8so33237916lfb.4
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jS0Sn7Q/DWgyMi4++YnIgoji3iR4wjoLHIyUoWyhzT0=;
        b=cqF0GZSk30p8zV9N8ZW7JtXcNOmUzwQi+LXaxJrfaO5iTORvyLlP0AkaLFgfFxq8rX
         7z8XPPOBRIui73oasWhOsC3xVP9I1hO/muq9V5jay//3icUvvAhhWi6Qt6Zv/sIAHK4g
         doEkhXgfhIDHrD6DLD4sweZkLM6vBa8vzS7baTfQAJNdx2LLAwvQx6Prht9fHMSvAMPa
         ac99Mt/S8f/xMd/qG0jy1BwGCgp9L0Ym5L+rymg0zow83wTKhVkSkwBqfBqyzcYHlV+V
         q6wvaBkjgjC/ViTOwpTkHPYHFJBQNi4Q03f6n2q59z5XVja5IE71chw3zBS6RHa0DWCp
         rRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jS0Sn7Q/DWgyMi4++YnIgoji3iR4wjoLHIyUoWyhzT0=;
        b=dCHExLSACRPpbQo2BVZCSBCJ+TUzBg3YZORJDZuCg0DMtWZx2zIeDc3Xp/pkqt0CKu
         JTzravSmOP4/RQ/i0I1N7u1DiCeRZnW4mHzw0tAqDuuxPUPBtNDaO/aePwdokbSS1Xry
         nxAwNmtGJhBA7ZxnoUjzrosSyQM7fvB1q5YXRk7e6oiGTuHLsZ3hoPONXFHGgmSqtiQc
         ag53MVcUbHUObyttPQ2mxjZM/Cv612rVReei/dVYMDlpc6Gch1T92QYaWHISBA5pdKLL
         542rWopnXbfMFGriHglYtz5gYi70zisEv1MBm2mD7uG0JMEXmotgVYn+HDnbiMrFPLHS
         aGiw==
X-Gm-Message-State: AFqh2kpFnmTeyR81vvQ6tzt7qPrxwmIRuYAc8kFkEK23P0hqViLEZ7n/
        o16jY9dJj+8Ok0ERtQmJclJbLQ==
X-Google-Smtp-Source: AMrXdXteV9D28Pi8GIuO5SPL/s56rnW763SXWhMrKRnNX/ceg6NZp9UibDBYSX42UJ59U9l8skTFyw==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr23027702lfb.41.1673618568724;
        Fri, 13 Jan 2023 06:02:48 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id n1-20020a05651203e100b004d0ce8a0fc8sm311390lfq.202.2023.01.13.06.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:02:47 -0800 (PST)
Message-ID: <9d1a12ef-3001-977d-20a2-1fb31f277ff6@linaro.org>
Date:   Fri, 13 Jan 2023 15:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/13] clk: qcom: cpu-8996: fix PLL clock ops
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
 <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
 <66296817-669f-b3f9-146e-48d5808e124e@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <66296817-669f-b3f9-146e-48d5808e124e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 12:35, Dmitry Baryshkov wrote:
> On 12/01/2023 18:10, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>>> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
>>> better.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I *think* SUPPORTS_DYNAMIC_UPDATE should also be kicked from
>> non-alt PLLs.. Otherwise we might have been kicking ourselves
>> in the face all along, changing the frequency of a running
>> PLL that doesn't support it if we were using the main PLL
>> and not the altPLL/ACD..
>>
>> Downstream sets it only for clk_ops_alpha_pll_hwfsm which is
>> used on alt PLLs only
>>
>> This change seems sound, as Huayra supports dynamic update
>> even without setting any flags.
> 
> I don't know where Huayra came from. Downstream uses plain hwfsm pll. Huayra uses different alpha register settings.
Right, that too.. somewhat of a miracle things worked at all..

Konrad

P.S please revisit that SUPPORTS_DYNAMIC_UPDATE flag for main PLLs
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index 1c00eb629b61..b53cddc4bca3 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
>>>           .name = "pwrcl_pll",
>>>           .parent_data = pll_parent,
>>>           .num_parents = ARRAY_SIZE(pll_parent),
>>> -        .ops = &clk_alpha_pll_huayra_ops,
>>> +        .ops = &clk_alpha_pll_hwfsm_ops,
>>>       },
>>>   };
>>>   @@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
>>>           .name = "perfcl_pll",
>>>           .parent_data = pll_parent,
>>>           .num_parents = ARRAY_SIZE(pll_parent),
>>> -        .ops = &clk_alpha_pll_huayra_ops,
>>> +        .ops = &clk_alpha_pll_hwfsm_ops,
>>>       },
>>>   };
>>>   
> 

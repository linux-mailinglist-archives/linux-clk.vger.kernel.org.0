Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F209E476000
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 18:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245267AbhLOR5a (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 12:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245258AbhLOR53 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 12:57:29 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A27C06173E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 09:57:29 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id m12so34530372ljj.6
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xqTgrfsM1Vl0EOy6LcbfVMGCUhLcoIpzVU6zweaZnhw=;
        b=QU3FCUjTver8CpcxKcyd8sacnworCFUizlIDrr1u0CyCKO6Ikf/qlTt/kCpXx8dLq9
         ocqpWQBVQQG5ZT2wTkrj+bdpeEARv13nNWGg35tCmZz548xUbqP1dekQizZ+benudmHy
         mmQ7vrmNo7qLGqEJlqUldXNA4+Ru1V+sP87zvv5h7pQxiKLKz+nZRqwlP/XkqFWIgOPi
         dHV6bQnVJFlGiTgsOhB5KGgOEdAUvTFnV2HoJzE6xVnPzDtTcepyKkKiWhlawEpuqy0I
         IPYQfLgb1hu8ZtcO20Tnvw8hDCpvriUwEh0K75WPkbSAhTb5cTsbwHmZuE908de3YLc8
         hMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xqTgrfsM1Vl0EOy6LcbfVMGCUhLcoIpzVU6zweaZnhw=;
        b=GuRHikqsWHatzyrZF4R0Dcd07fsAc/Ad7nO3+M0Q+I13gvEn1qFtp5+RSKwh3+7Tt1
         DVL/lFPCPzpILJGmGDMeb2sha8KWyKzrmFluKLT/jJTvOPnoeItfVNCaWbjUt9SLZ793
         t2EIToelPWLfbQU96irjLex496CeeuoQRvBES3RVBWHgtLXeXMXv/ekWySRicPXLGAZF
         /9fPDDecU/QF0vSeRHtHWpMksZWbu1zPWq+uTWNuPOPE69Gq3dzwBkJv8uVyRI+303Rl
         XytVPHssxdK+v6EroGJut04CCdVTje+0kT53MFBdWrEL1ASomj3tWsbqr6Z+T7eU7nKU
         2CVw==
X-Gm-Message-State: AOAM533yll0+hRxtOyfK8Rs8dYCLFQvp9V/QEDyT3KG5JRtaJzC/jFIh
        K53qD6cI6/zJDuNY8A6HGc+eaQ==
X-Google-Smtp-Source: ABdhPJxJ9W8SuT5c9X1oQeZdRpslbhWzloJcUYAo6odwzLJKoWAbzBrYWKGdYEogfEDxDKKzGtu7lA==
X-Received: by 2002:a2e:3912:: with SMTP id g18mr11292596lja.96.1639591047539;
        Wed, 15 Dec 2021 09:57:27 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id o10sm572000ljp.49.2021.12.15.09.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:57:27 -0800 (PST)
Message-ID: <44171455-3aa3-cbda-0f0e-0038b95bb240@linaro.org>
Date:   Wed, 15 Dec 2021 20:57:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 07/15] clk: qcom: camcc-sdm845: get rid of the test
 clock
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-8-dmitry.baryshkov@linaro.org>
 <20211215092350.hripuu2ud6fs5hhl@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215092350.hripuu2ud6fs5hhl@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/12/2021 12:23, Marijn Suijten wrote:
> On 2021-12-15 03:54:15, Dmitry Baryshkov wrote:
>> The test clock isn't in the bindings and apparently it's not used by
>> anyone upstream.  Remove it.
>>
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 
> As with the other SoC patches in this series, you should move:
> 
>      [PATCH v2 09/15] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
> 
> Before this patch (07/15).  Otherwise num_parents for all the clocks
> using parent_map/names_0 will have to temporarily be changed from 6 down
> to 5 to make this bisectable.

Oops, missed this.

> 
> - Marijn
> 
>> ---
>>   drivers/clk/qcom/camcc-sdm845.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
>> index 1b2cefef7431..545c288a7f98 100644
>> --- a/drivers/clk/qcom/camcc-sdm845.c
>> +++ b/drivers/clk/qcom/camcc-sdm845.c
>> @@ -23,7 +23,6 @@ enum {
>>   	P_CAM_CC_PLL1_OUT_EVEN,
>>   	P_CAM_CC_PLL2_OUT_EVEN,
>>   	P_CAM_CC_PLL3_OUT_EVEN,
>> -	P_CORE_BI_PLL_TEST_SE,
>>   };
>>   
>>   static const struct parent_map cam_cc_parent_map_0[] = {
>> @@ -32,7 +31,6 @@ static const struct parent_map cam_cc_parent_map_0[] = {
>>   	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
>>   	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
>>   	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
>> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>   };
>>   
>>   static const char * const cam_cc_parent_names_0[] = {
>> @@ -41,7 +39,6 @@ static const char * const cam_cc_parent_names_0[] = {
>>   	"cam_cc_pll1_out_even",
>>   	"cam_cc_pll3_out_even",
>>   	"cam_cc_pll0_out_even",
>> -	"core_bi_pll_test_se",
>>   };
>>   
>>   static struct clk_alpha_pll cam_cc_pll0 = {
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry

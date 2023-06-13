Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF7C72DD44
	for <lists+linux-clk@lfdr.de>; Tue, 13 Jun 2023 11:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241478AbjFMJGw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Jun 2023 05:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241090AbjFMJGt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 05:06:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC9D1B4
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 02:06:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f5f728c4aaso6152810e87.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686647205; x=1689239205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k24Lafsnyyipy4bbdfe0wwTh9zApI1J6ii/T/AgJk2Q=;
        b=yTGx/fLt7Qp+oiLbviwb5H1L4TejgbG24LlseJOOnCI2aStf8k0cLLLpVtodVKwS0T
         9FQLyrjzjaVZYZk5LI2d89M23GMQKO7LVe3zUYzTOCpkhkYHsHKAJHTAYREU0vFUljE6
         h4YVyAhT6S+q50CEbnhQ9M5n5Rsx2zK7PjOJlcp5ZdgkHhwDBu0M8/C3pctIHKJRo3Dl
         ql/8HnWA+ShqpJdHXS7BbXFPjBYvSXsmaLphcMLCOKaDz8kcbtgQZj5OCSM9OgB7RvoO
         PB6MA5ztb82/vtjXFwYiUR8VSs0UTz5NbV+G9VE0iTqPkDUldQS4qwA2Iygv5w0DIh2H
         jMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686647205; x=1689239205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k24Lafsnyyipy4bbdfe0wwTh9zApI1J6ii/T/AgJk2Q=;
        b=Vq8+DdcGn5tT5O3Bnq1zj0xcEK461pd42LPOhwfILPVAe8SAuAMYIaytqFhu/+L6n0
         0fttdgciwzTzlHZmqgSIzswsfOeRgkxy8N/1XIVrghN41vqiOxsJitF2RFblgm5Qk7jA
         KDmtRPOolPVUTMkFbkZYhAIPYgUFrFG8nsaa28nxgqZXHzqKE7z+JNxSjOi+YalEu07t
         x9mGAygHZucXn5g0h8rEzspg1/SwCzXkPXhVnlk2b6u75X47L4tjMFd7WR5r7Pu7yk1V
         LsPtF1cOm6svPZA1QKkjlipklG604MJwLOtlIOdXUl7FMvRpEi5gbcx910HNw3aaRt65
         6vsg==
X-Gm-Message-State: AC+VfDzT9w3dInCmAyxICs7j8kzbOflnEqgYMVtUqPVy8x+YwRi3/I23
        SE88M67I+2fm1iSoyydLu84aAw==
X-Google-Smtp-Source: ACHHUZ4kGtn5iyYh44KfD7k/afWcN7Di/N0xVMwtASdAptlWTKfnyJmL3XYi3+US9VxHmcWPg9rrFA==
X-Received: by 2002:a2e:81ca:0:b0:295:d7a8:559b with SMTP id s10-20020a2e81ca000000b00295d7a8559bmr3237895ljg.10.1686647205174;
        Tue, 13 Jun 2023 02:06:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id r10-20020a2e94ca000000b002b0488ef239sm2067426ljh.93.2023.06.13.02.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:06:44 -0700 (PDT)
Message-ID: <d90b350f-0068-4ce1-014d-0c35f26abe54@linaro.org>
Date:   Tue, 13 Jun 2023 11:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 20/23] interconnect: qcom: icc-rpm: Fix bucket number
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
 <20230526-topic-smd_icc-v3-20-5fb7d39b874f@linaro.org>
 <ZIeGrCj2bk2nVvIc@gerhold.net>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZIeGrCj2bk2nVvIc@gerhold.net>
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



On 12.06.2023 22:57, Stephan Gerhold wrote:
> On Mon, Jun 12, 2023 at 08:24:37PM +0200, Konrad Dybcio wrote:
>> SMD RPM only provides two buckets, one each for the active-only and
>> active-sleep RPM contexts. Use the correct constant to allocate and
>> operate on them.
>>
>> This will make the qcom,icc.h header no longer work with this driver,
>> mostly because.. it was never meant to! The commit that introduced
>> bucket support to SMD RPM was trying to shove a square into a round
>> hole and it did not work out very well. That said, there are no
>> active users of SMD RPM ICC + qcom,icc.h, so that doesn't hurt.
>>
>> Fixes: dcbce7b0a79c ("interconnect: qcom: icc-rpm: Support multiple buckets")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/interconnect/qcom/icc-rpm.c | 14 +++++++-------
>>  drivers/interconnect/qcom/icc-rpm.h |  4 ++--
>>  2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
>> index 5ffcf5ca8914..54a9999fe55d 100644
>> --- a/drivers/interconnect/qcom/icc-rpm.c
>> +++ b/drivers/interconnect/qcom/icc-rpm.c
>> @@ -249,7 +249,7 @@ static void qcom_icc_pre_bw_aggregate(struct icc_node *node)
>>  	size_t i;
>>  
>>  	qn = node->data;
>> -	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
>> +	for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
>>  		qn->sum_avg[i] = 0;
>>  		qn->max_peak[i] = 0;
>>  	}
>> @@ -275,7 +275,7 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
>>  	if (!tag)
>>  		tag = QCOM_ICC_TAG_ALWAYS;
> 
> We should replace this with the RPM variant. Also, can you check which
> header/file still includes qcom,icc.h? Don't think we should have it
> included at all for RPM so that referencing the wrong things cannot
> happen.
Nice catch

Konrad
> 
> Thanks,
> Stephan

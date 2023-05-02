Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8E76F42F9
	for <lists+linux-clk@lfdr.de>; Tue,  2 May 2023 13:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjEBLpU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 May 2023 07:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjEBLpQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 07:45:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056D49CD
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 04:45:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f00d3f98deso27709528e87.0
        for <linux-clk@vger.kernel.org>; Tue, 02 May 2023 04:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683027911; x=1685619911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FRjfSN35tRtIq4p4C8AfXqn7Ck/gG36dsPtnyL8blo=;
        b=V8FcD8sUSeekU1nQxQRR8zEKWiCmAF0Uymx3jEXFyEWIpj+hZZPF46aHZKH6MFrxef
         x3BXPepGShTYe1wZ+Q7+5n3NZJcWTiW9yFm/rF1y6nHjw/huqULsRV0gy7hc5bgkODSy
         e6UOMxly8hyAZLTWlKJ0TaalhezFjMKB3ls9NZHKBohGSXCdkaGmmM+AlIEZjZZ5evOD
         UoIA2VFAbHONs/nGdriQlELb68/t2/fUrpEY0BMtTJcNjcMXTJSf4pkDHgN8mzLDw/F7
         Q+JmUBlyDBz+wYMNdrK2MgPHOoVmHPOtv7HYF7JlwXKUWNr8dcOWg5vKpjsiJk6yjhBU
         YE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683027911; x=1685619911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FRjfSN35tRtIq4p4C8AfXqn7Ck/gG36dsPtnyL8blo=;
        b=B+J8UqIERxmOxJ/Qks00IyqbkHQPS6O9gXcEfPRrCwRknVN/ET1UHrsqeQmE3lJO3a
         bpqkJ7Xc9QFxb1qWLNhB8BhQv4n+GcnwvR3JChMfVNOFDsMbzTVCEfaGPXUnfBFPYIMl
         lllQN2yc7LLRcsbeg3lrlGsb+hKFG2T3QXP4Agq8q5X6jgngTAFKVVTUyNULXa76VUH+
         7EK86OyGRmpxIHd5OvCmtjyhmcyytluiBOPJHaxNV9FmfPWYZqt13dwW/cK7PhAuobyn
         aguzoSD5uYfEAmx9XLuTVbbNynijFDmNRrPyfL7drOjAE25PW8CfWucimEu+fXVj+Q8P
         6BPA==
X-Gm-Message-State: AC+VfDwF46u7ohGJCIirjHp3pO1ZyaVci5piOYAP3nYOZX1zo3XbrgJ7
        2NZmpxjg5X+x53/J5jsnB9mlsfGnHMtWwvD9mZc=
X-Google-Smtp-Source: ACHHUZ4mDNxluAzv7Lk9v2nM3w6w9YBDTNHrA7OohjP8jxwNCKv3SeA3Qx2GuEyRwqYhK7+1ih3oRw==
X-Received: by 2002:a2e:9b56:0:b0:2aa:e7cd:69f8 with SMTP id o22-20020a2e9b56000000b002aae7cd69f8mr5671553ljj.9.1683027910807;
        Tue, 02 May 2023 04:45:10 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id u7-20020a2e2e07000000b002a8c8fa34bfsm5275545lju.50.2023.05.02.04.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:45:10 -0700 (PDT)
Message-ID: <7b9518f3-a9c8-ac5a-4d7a-bb368f0b785d@linaro.org>
Date:   Tue, 2 May 2023 13:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 07/10] clk: qcom: gcc-mdm9615: use parent_hws/_data
 instead of parent_names
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-8-dmitry.baryshkov@linaro.org>
 <619d5715-5a3f-5500-96e6-129c751d837e@linaro.org>
 <CAA8EJpqLjgkap9Onx5Ch47Zhka-Q4Zsk7WnWPYhx-WXPccqBmg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqLjgkap9Onx5Ch47Zhka-Q4Zsk7WnWPYhx-WXPccqBmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2.05.2023 13:23, Dmitry Baryshkov wrote:
> On Tue, 2 May 2023 at 14:15, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 1.05.2023 22:33, Dmitry Baryshkov wrote:
>>> Convert the clock driver to specify parent data rather than parent
>>> names, to actually bind using 'clock-names' specified in the DTS rather
>>> than global clock names. Use parent_hws where possible to refer parent
>>> clocks directly, skipping the lookup.
>>>
>>> Note, the system names for xo clocks were changed from "cxo" to
>>> "cxo_board" to follow the example of other platforms. This switches the
>>> clocks to use DT-provided "cxo_board" clock instead of manually
>>> registered "cxo" clock and allows us to drop the cxo clock.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  drivers/clk/qcom/gcc-mdm9615.c | 201 +++++++++++++++++++--------------
>>>  1 file changed, 119 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
>>> index 2f921891008d..c1742113b0eb 100644
>>> --- a/drivers/clk/qcom/gcc-mdm9615.c
>>> +++ b/drivers/clk/qcom/gcc-mdm9615.c
>>> @@ -37,6 +37,20 @@ static struct clk_fixed_factor cxo = {
>>>       },
>>>  };
>>>
>>> +enum {
>>> +     P_CXO,
>>> +     P_PLL8,
>>> +     P_PLL14,
>>> +};
>>> +
>>> +static const struct parent_map gcc_cxo_map[] = {
>>> +     { P_CXO, 0 },
>>> +};
>>> +
>>> +static const struct clk_parent_data gcc_cxo[] = {
>>> +     { .fw_name = "cxo", .name = "cxo_board" },
>> .index?
> 
> I don't think we can use index when we have to remain compatible with
> older  DT files.
Is there anything blocking us from using .index = .., .name = ..?

Konrad
> 
>>
>> Konrad
>>> +};
>>> +
>>>  static struct clk_pll pll0 = {
>>>       .l_reg = 0x30c4,
>>>       .m_reg = 0x30c8,
>>> @@ -47,8 +61,8 @@ static struct clk_pll pll0 = {
>>>       .status_bit = 16,
>>>       .clkr.hw.init = &(struct clk_init_data){
>>>               .name = "pll0",
>>> -             .parent_names = (const char *[]){ "cxo" },
>>> -             .num_parents = 1,
>>> +             .parent_data = gcc_cxo,
>>> +             .num_parents = ARRAY_SIZE(gcc_cxo),
>>>               .ops = &clk_pll_ops,
>>>       },
>>>  };
>>> @@ -58,7 +72,9 @@ static struct clk_regmap pll0_vote = {
>>>       .enable_mask = BIT(0),
>>>       .hw.init = &(struct clk_init_data){
>>>               .name = "pll0_vote",
>>> -             .parent_names = (const char *[]){ "pll0" },
>>> +             .parent_hws = (const struct clk_hw*[]) {
>>> +                     &pll0.clkr.hw,
>>> +             },
>>>               .num_parents = 1,
>>>               .ops = &clk_pll_vote_ops,
>>>       },
>>> @@ -69,7 +85,9 @@ static struct clk_regmap pll4_vote = {
>>>       .enable_mask = BIT(4),
>>>       .hw.init = &(struct clk_init_data){
>>>               .name = "pll4_vote",
>>> -             .parent_names = (const char *[]){ "pll4" },
>>> +             .parent_data = &(const struct clk_parent_data) {
>>> +                     .fw_name = "pll4", .name = "pll4",
>>> +             },
>>>               .num_parents = 1,
>>>               .ops = &clk_pll_vote_ops,
>>>       },
>>> @@ -85,8 +103,8 @@ static struct clk_pll pll8 = {
>>>       .status_bit = 16,
>>>       .clkr.hw.init = &(struct clk_init_data){
>>>               .name = "pll8",
>>> -             .parent_names = (const char *[]){ "cxo" },
>>> -             .num_parents = 1,
>>> +             .parent_data = gcc_cxo,
>>> +             .num_parents = ARRAY_SIZE(gcc_cxo),
>>>               .ops = &clk_pll_ops,
>>>       },
>>>  };
>>> @@ -96,7 +114,9 @@ static struct clk_regmap pll8_vote = {
>>>       .enable_mask = BIT(8),
>>>       .hw.init = &(struct clk_init_data){
>>>               .name = "pll8_vote",
>>> -             .parent_names = (const char *[]){ "pll8" },
>>> +             .parent_hws = (const struct clk_hw*[]) {
>>> +                     &pll8.clkr.hw,
>>> +             },
>>>               .num_parents = 1,
>>>               .ops = &clk_pll_vote_ops,
>>>       },
>>> @@ -112,8 +132,8 @@ static struct clk_pll pll14 = {
>>>       .status_bit = 16,
>>>       .clkr.hw.init = &(struct clk_init_data){
>>>               .name = "pll14",
>>> -             .parent_names = (const char *[]){ "cxo" },
>>> -             .num_parents = 1,
>>> +             .parent_data = gcc_cxo,
>>> +             .num_parents = ARRAY_SIZE(gcc_cxo),
>>>               .ops = &clk_pll_ops,
>>>       },
>>>  };
>>> @@ -123,26 +143,22 @@ static struct clk_regmap pll14_vote = {
>>>       .enable_mask = BIT(11),
>>>       .hw.init = &(struct clk_init_data){
>>>               .name = "pll14_vote",
>>> -             .parent_names = (const char *[]){ "pll14" },
>>> +             .parent_hws = (const struct clk_hw*[]) {
>>> +                     &pll14.clkr.hw,
>>> +             },
>>>               .num_parents = 1,
>>>               .ops = &clk_pll_vote_ops,
>>>       },
>>>  };
>>>
>>> -enum {
>>> -     P_CXO,
>>> -     P_PLL8,
>>> -     P_PLL14,
>>> -};
>>> -
>>>  static const struct parent_map gcc_cxo_pll8_map[] = {
>>>       { P_CXO, 0 },
>>>       { P_PLL8, 3 }
>>>  };
>>>
>>> -static const char * const gcc_cxo_pll8[] = {
>>> -     "cxo",
>>> -     "pll8_vote",
>>> +static const struct clk_parent_data gcc_cxo_pll8[] = {
>>> +     { .fw_name = "cxo", .name = "cxo_board" },
>>> +     { .hw = &pll8_vote.hw },
>>>  };
>>>
>>>  static const struct parent_map gcc_cxo_pll14_map[] = {
>>> @@ -150,17 +166,9 @@ static const struct parent_map gcc_cxo_pll14_map[] = {
>>>       { P_PLL14, 4 }
>>>  };
>>>
>>> -static const char * const gcc_cxo_pll14[] = {
>>> -     "cxo",
>>> -     "pll14_vote",
>>> -};
>>> -
>>> -static const struct parent_map gcc_cxo_map[] = {
>>> -     { P_CXO, 0 },
>>> -};
>>> -
>>> -static const char * const gcc_cxo[] = {
>>> -     "cxo",
>>> +static const struct clk_parent_data gcc_cxo_pll14[] = {
>>> +     { .fw_name = "cxo", .name = "cxo_board" },
>>> +     { .hw = &pll14_vote.hw },
>>>  };
>>>
>>>  static struct freq_tbl clk_tbl_gsbi_uart[] = {
>>> @@ -206,7 +214,7 @@ static struct clk_rcg gsbi1_uart_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi1_uart_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -222,8 +230,8 @@ static struct clk_branch gsbi1_uart_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi1_uart_clk",
>>> -                     .parent_names = (const char *[]){
>>> -                             "gsbi1_uart_src",
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi1_uart_src.clkr.hw,
>>>                       },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>> @@ -257,7 +265,7 @@ static struct clk_rcg gsbi2_uart_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi2_uart_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -273,8 +281,8 @@ static struct clk_branch gsbi2_uart_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi2_uart_clk",
>>> -                     .parent_names = (const char *[]){
>>> -                             "gsbi2_uart_src",
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi2_uart_src.clkr.hw,
>>>                       },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>> @@ -308,7 +316,7 @@ static struct clk_rcg gsbi3_uart_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi3_uart_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -324,8 +332,8 @@ static struct clk_branch gsbi3_uart_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi3_uart_clk",
>>> -                     .parent_names = (const char *[]){
>>> -                             "gsbi3_uart_src",
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi3_uart_src.clkr.hw,
>>>                       },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>> @@ -359,7 +367,7 @@ static struct clk_rcg gsbi4_uart_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi4_uart_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -375,8 +383,8 @@ static struct clk_branch gsbi4_uart_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi4_uart_clk",
>>> -                     .parent_names = (const char *[]){
>>> -                             "gsbi4_uart_src",
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi4_uart_src.clkr.hw,
>>>                       },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>> @@ -410,7 +418,7 @@ static struct clk_rcg gsbi5_uart_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi5_uart_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -426,8 +434,8 @@ static struct clk_branch gsbi5_uart_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi5_uart_clk",
>>> -                     .parent_names = (const char *[]){
>>> -                             "gsbi5_uart_src",
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi5_uart_src.clkr.hw,
>>>                       },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>> @@ -473,7 +481,7 @@ static struct clk_rcg gsbi1_qup_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi1_qup_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -489,7 +497,9 @@ static struct clk_branch gsbi1_qup_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi1_qup_clk",
>>> -                     .parent_names = (const char *[]){ "gsbi1_qup_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi1_qup_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -522,7 +532,7 @@ static struct clk_rcg gsbi2_qup_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi2_qup_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -538,7 +548,9 @@ static struct clk_branch gsbi2_qup_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi2_qup_clk",
>>> -                     .parent_names = (const char *[]){ "gsbi2_qup_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi2_qup_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -571,7 +583,7 @@ static struct clk_rcg gsbi3_qup_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi3_qup_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -587,7 +599,9 @@ static struct clk_branch gsbi3_qup_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi3_qup_clk",
>>> -                     .parent_names = (const char *[]){ "gsbi3_qup_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi3_qup_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -620,7 +634,7 @@ static struct clk_rcg gsbi4_qup_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi4_qup_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -636,7 +650,9 @@ static struct clk_branch gsbi4_qup_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi4_qup_clk",
>>> -                     .parent_names = (const char *[]){ "gsbi4_qup_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi4_qup_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -669,7 +685,7 @@ static struct clk_rcg gsbi5_qup_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi5_qup_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -685,7 +701,9 @@ static struct clk_branch gsbi5_qup_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gsbi5_qup_clk",
>>> -                     .parent_names = (const char *[]){ "gsbi5_qup_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gsbi5_qup_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -724,7 +742,7 @@ static struct clk_rcg gp0_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp0_src",
>>> -                     .parent_names = gcc_cxo,
>>> +                     .parent_data = gcc_cxo,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_PARENT_GATE,
>>> @@ -740,7 +758,9 @@ static struct clk_branch gp0_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp0_clk",
>>> -                     .parent_names = (const char *[]){ "gp0_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gp0_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -773,7 +793,7 @@ static struct clk_rcg gp1_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp1_src",
>>> -                     .parent_names = gcc_cxo,
>>> +                     .parent_data = gcc_cxo,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -789,7 +809,9 @@ static struct clk_branch gp1_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp1_clk",
>>> -                     .parent_names = (const char *[]){ "gp1_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gp1_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -822,7 +844,7 @@ static struct clk_rcg gp2_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp2_src",
>>> -                     .parent_names = gcc_cxo,
>>> +                     .parent_data = gcc_cxo,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -838,7 +860,9 @@ static struct clk_branch gp2_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "gp2_clk",
>>> -                     .parent_names = (const char *[]){ "gp2_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &gp2_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -874,7 +898,7 @@ static struct clk_rcg prng_src = {
>>>       .clkr = {
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "prng_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>               },
>>> @@ -890,7 +914,9 @@ static struct clk_branch prng_clk = {
>>>               .enable_mask = BIT(10),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "prng_clk",
>>> -                     .parent_names = (const char *[]){ "prng_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &prng_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>               },
>>> @@ -936,7 +962,7 @@ static struct clk_rcg sdc1_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "sdc1_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>               },
>>> @@ -951,7 +977,9 @@ static struct clk_branch sdc1_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "sdc1_clk",
>>> -                     .parent_names = (const char *[]){ "sdc1_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &sdc1_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -984,7 +1012,7 @@ static struct clk_rcg sdc2_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "sdc2_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>               },
>>> @@ -999,7 +1027,9 @@ static struct clk_branch sdc2_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "sdc2_clk",
>>> -                     .parent_names = (const char *[]){ "sdc2_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &sdc2_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -1037,7 +1067,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hs1_xcvr_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -1053,7 +1083,9 @@ static struct clk_branch usb_hs1_xcvr_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hs1_xcvr_clk",
>>> -                     .parent_names = (const char *[]){ "usb_hs1_xcvr_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &usb_hs1_xcvr_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -1086,7 +1118,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hsic_xcvr_fs_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -1102,8 +1134,9 @@ static struct clk_branch usb_hsic_xcvr_fs_clk = {
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hsic_xcvr_fs_clk",
>>> -                     .parent_names =
>>> -                             (const char *[]){ "usb_hsic_xcvr_fs_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &usb_hsic_xcvr_fs_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .ops = &clk_branch_ops,
>>>                       .flags = CLK_SET_RATE_PARENT,
>>> @@ -1141,7 +1174,7 @@ static struct clk_rcg usb_hs1_system_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hs1_system_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -1156,8 +1189,9 @@ static struct clk_branch usb_hs1_system_clk = {
>>>               .enable_reg = 0x36a4,
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>> -                     .parent_names =
>>> -                             (const char *[]){ "usb_hs1_system_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &usb_hs1_system_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .name = "usb_hs1_system_clk",
>>>                       .ops = &clk_branch_ops,
>>> @@ -1196,7 +1230,7 @@ static struct clk_rcg usb_hsic_system_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hsic_system_src",
>>> -                     .parent_names = gcc_cxo_pll8,
>>> +                     .parent_data = gcc_cxo_pll8,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll8),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -1211,8 +1245,9 @@ static struct clk_branch usb_hsic_system_clk = {
>>>               .enable_reg = 0x2b58,
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>> -                     .parent_names =
>>> -                             (const char *[]){ "usb_hsic_system_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &usb_hsic_system_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .name = "usb_hsic_system_clk",
>>>                       .ops = &clk_branch_ops,
>>> @@ -1251,7 +1286,7 @@ static struct clk_rcg usb_hsic_hsic_src = {
>>>               .enable_mask = BIT(11),
>>>               .hw.init = &(struct clk_init_data){
>>>                       .name = "usb_hsic_hsic_src",
>>> -                     .parent_names = gcc_cxo_pll14,
>>> +                     .parent_data = gcc_cxo_pll14,
>>>                       .num_parents = ARRAY_SIZE(gcc_cxo_pll14),
>>>                       .ops = &clk_rcg_ops,
>>>                       .flags = CLK_SET_RATE_GATE,
>>> @@ -1265,7 +1300,9 @@ static struct clk_branch usb_hsic_hsic_clk = {
>>>               .enable_reg = 0x2b50,
>>>               .enable_mask = BIT(9),
>>>               .hw.init = &(struct clk_init_data){
>>> -                     .parent_names = (const char *[]){ "usb_hsic_hsic_src" },
>>> +                     .parent_hws = (const struct clk_hw*[]) {
>>> +                             &usb_hsic_hsic_src.clkr.hw,
>>> +                     },
>>>                       .num_parents = 1,
>>>                       .name = "usb_hsic_hsic_clk",
>>>                       .ops = &clk_branch_ops,
>>> @@ -1281,8 +1318,8 @@ static struct clk_branch usb_hsic_hsio_cal_clk = {
>>>               .enable_reg = 0x2b48,
>>>               .enable_mask = BIT(0),
>>>               .hw.init = &(struct clk_init_data){
>>> -                     .parent_names = (const char *[]){ "cxo" },
>>> -                     .num_parents = 1,
>>> +                     .parent_data = gcc_cxo,
>>> +                     .num_parents = ARRAY_SIZE(gcc_cxo),
>>>                       .name = "usb_hsic_hsio_cal_clk",
>>>                       .ops = &clk_branch_ops,
>>>               },
> 
> 
> 

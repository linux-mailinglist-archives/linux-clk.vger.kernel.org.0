Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCAC4761AD
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 20:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238966AbhLOTZ6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 14:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238949AbhLOTZ5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 14:25:57 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E01C06173E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:25:56 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id c32so45184048lfv.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PkSCpd6mjnK3TJMFaxbedMEZh5uJTvJgA+UAwNjvz3c=;
        b=bAWaDdXmcM8o6u+wp85/8E6OGhXUswIg3plSdSzg18a3/+lEAiipyzf7V1EHloIahd
         AxxT4j2OfbQE++X1up3Pa6RgdF2uclJtQo+mYzRXkz5le9FIm/TnHowHMFVAqkysfB5G
         yiuO2nYuv8cTV6ToeAbvYH+oPk9hWPJ+7AWClZ6bOxPwRG7Xs6DEOsQt/PrIdLGrHscC
         MvW52sJMm3IKkFU6pMRhm3IGq8hrz6PBa6rNNhJvT90i2OvqEdgpgcRBp262MaRBteGO
         qzP4I6HK/gdLkfMDEKKqq3niNSaKWAEHn5DX4VqoJZsybeufhp703weE/g5CgMVQVIA9
         BcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PkSCpd6mjnK3TJMFaxbedMEZh5uJTvJgA+UAwNjvz3c=;
        b=3vuQw8Yf2DuFTGpHwQfOi3pc64U3pMI8bJYFfRhAlpn/nyIW5EFKeQtY4Hf77CZ4Jd
         lOTngLsBv/1rJYJzFKPfFB/yjOVmbq7raBF9XdespNkQ00Mj1B/zvE8FlYz0FhH1y2+C
         WkMEJsdTzSbrZJbym2hiGm7BgH5RN37Dw/xQUP8TJJD6cI8As9N/PV0+6CiA1I3207Sm
         9nzLB/JZf1KtPMNXJ+/qeIQgm/G3Xy6oYQUpGUhzyL6b07PGh0/sx66Bmuo9W27XA7e6
         OhEX5zUGtY3k9ZG7sNUCnkX7O4RfAGYxOW1stulMFEsmvdkAyi/opLem8/Q36ijCtOTf
         EU0w==
X-Gm-Message-State: AOAM53076fbUq9YBIqfAnJAnHMMpFBYXq5jp1cKXiQ2g4TkEnx/s6S3b
        VM0ogiCl8s/usAHBS5AhXqMntg==
X-Google-Smtp-Source: ABdhPJxDBkyWDcR5UXgd2PPq9/g3Lc/ijo2HrNX8KqpbD/K+QR1L8IHsxmzdxeTy2WKpHaZ0KvTXLQ==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr10996567lfg.181.1639596354030;
        Wed, 15 Dec 2021 11:25:54 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u2sm458153lfi.108.2021.12.15.11.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 11:25:53 -0800 (PST)
Message-ID: <538b6859-af48-65bb-3fd3-6d4d520e779f@linaro.org>
Date:   Wed, 15 Dec 2021 22:25:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 15/15] clk: qcom: gcc-msm8996: use parent_hws/_data
 instead of parent_names
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-16-dmitry.baryshkov@linaro.org>
 <20211215101310.bxh2j62qtqczn3tj@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215101310.bxh2j62qtqczn3tj@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/12/2021 13:13, Marijn Suijten wrote:
> On 2021-12-15 03:54:23, Dmitry Baryshkov wrote:
>> Convert the clock driver to specify parent data rather than parent
>> names, to actually bind using 'clock-names' specified in the DTS rather
>> than global clock names. Use parent_hws where possible to refer parent
>> clocks directly, skipping the lookup.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-msm8996.c | 678 ++++++++++++++++++++++-----------
>>   1 file changed, 463 insertions(+), 215 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
>> index 8531f2f3665f..204c1f4c68c4 100644
>> --- a/drivers/clk/qcom/gcc-msm8996.c
>> +++ b/drivers/clk/qcom/gcc-msm8996.c
>> @@ -38,7 +38,9 @@ static struct clk_fixed_factor xo = {
>>   	.div = 1,
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "xo",
>> -		.parent_names = (const char *[]){ "xo_board" },
>> +		.parent_data = &(const struct clk_parent_data){
>> +			.fw_name = "cxo", .name = "xo_board",
>> +		},
>>   		.num_parents = 1,
>>   		.ops = &clk_fixed_factor_ops,
>>   	},
>> @@ -52,7 +54,9 @@ static struct clk_alpha_pll gpll0_early = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gpll0_early",
>> -			.parent_names = (const char *[]){ "xo" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&xo.hw,
> 
> I'd still recommend to replace this with:
> 
> 			.fw_name = "cxo", .name = "xo_board",
> 
> Matching what Bjorn did in [1].  That should make it easier to hopefully
> drop "xo" at some point as part of [2] leaving just the removal of
> .name="xo" fallbacks for "cxo2" below.
> 
> We can't drop it though before fixing clk-cpu-8996.c, mmcc-msm8996.c,
> hdmi_phy_8996.c, and providing this clock in all DT nodes.  Hence it is
> perhaps not a good idea to delay an eventual v3 of [2] to make that
> happen, and instead do it separately.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20210825204517.1278130-1-bjorn.andersson@linaro.org/
> [2]: https://lore.kernel.org/linux-arm-msm/20210911131922.387964-1-marijn.suijten@somainline.org/

Ack. I'll do it in a separate patch though, to ease review.

> 
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_alpha_pll_ops,
>>   		},
>> @@ -64,7 +68,9 @@ static struct clk_fixed_factor gpll0_early_div = {
>>   	.div = 2,
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "gpll0_early_div",
>> -		.parent_names = (const char *[]){ "gpll0_early" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&gpll0_early.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.ops = &clk_fixed_factor_ops,
>>   	},
>> @@ -75,7 +81,9 @@ static struct clk_alpha_pll_postdiv gpll0 = {
>>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gpll0",
>> -		.parent_names = (const char *[]){ "gpll0_early" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&gpll0_early.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.ops = &clk_alpha_pll_postdiv_ops,
>>   	},
>> @@ -88,7 +96,9 @@ static struct clk_branch gcc_mmss_gpll0_div_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mmss_gpll0_div_clk",
>> -			.parent_names = (const char *[]){ "gpll0" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gpll0.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -103,7 +113,9 @@ static struct clk_branch gcc_mss_gpll0_div_clk = {
>>   		.enable_mask = BIT(2),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mss_gpll0_div_clk",
>> -			.parent_names = (const char *[]){ "gpll0" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gpll0.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops
>> @@ -119,7 +131,9 @@ static struct clk_alpha_pll gpll4_early = {
>>   		.enable_mask = BIT(4),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gpll4_early",
>> -			.parent_names = (const char *[]){ "xo" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&xo.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_alpha_pll_ops,
>>   		},
>> @@ -131,7 +145,9 @@ static struct clk_alpha_pll_postdiv gpll4 = {
>>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gpll4",
>> -		.parent_names = (const char *[]){ "gpll4_early" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&gpll4_early.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.ops = &clk_alpha_pll_postdiv_ops,
>>   	},
>> @@ -141,8 +157,8 @@ static const struct parent_map gcc_sleep_clk_map[] = {
>>   	{ P_SLEEP_CLK, 5 }
>>   };
>>   
>> -static const char * const gcc_sleep_clk[] = {
>> -	"sleep_clk"
>> +static const struct clk_parent_data gcc_sleep_clk[] = {
>> +	{ .fw_name = "sleep_clk", .name = "sleep_clk" }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_map[] = {
>> @@ -150,9 +166,9 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
>>   	{ P_GPLL0, 1 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0[] = {
>> -	"xo",
>> -	"gpll0"
>> +static const struct clk_parent_data gcc_xo_gpll0[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw }
>>   };
>>   
>>   static const struct parent_map gcc_xo_sleep_clk_map[] = {
>> @@ -160,9 +176,9 @@ static const struct parent_map gcc_xo_sleep_clk_map[] = {
>>   	{ P_SLEEP_CLK, 5 }
>>   };
>>   
>> -static const char * const gcc_xo_sleep_clk[] = {
>> -	"xo",
>> -	"sleep_clk"
>> +static const struct clk_parent_data gcc_xo_sleep_clk[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .fw_name = "sleep_clk", .name = "sleep_clk" }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
>> @@ -171,10 +187,10 @@ static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
>>   	{ P_GPLL0_EARLY_DIV, 6 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
>> -	"xo",
>> -	"gpll0",
>> -	"gpll0_early_div"
>> +static const struct clk_parent_data gcc_xo_gpll0_gpll0_early_div[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll0_early_div.hw }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>> @@ -183,10 +199,10 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>>   	{ P_GPLL4, 5 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0_gpll4[] = {
>> -	"xo",
>> -	"gpll0",
>> -	"gpll4"
>> +static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll4.clkr.hw }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
>> @@ -195,10 +211,10 @@ static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
>>   	{ P_AUD_REF_CLK, 2 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
>> -	"xo",
>> -	"gpll0",
>> -	"aud_ref_clk"
>> +static const struct clk_parent_data gcc_xo_gpll0_aud_ref_clk[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
>> @@ -208,11 +224,11 @@ static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
>>   	{ P_GPLL0_EARLY_DIV, 6 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
>> -	"xo",
>> -	"gpll0",
>> -	"sleep_clk",
>> -	"gpll0_early_div"
>> +static const struct clk_parent_data gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>> +	{ .hw = &gpll0_early_div.hw }
>>   };
>>   
>>   static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
>> @@ -222,11 +238,11 @@ static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
>>   	{ P_GPLL0_EARLY_DIV, 6 }
>>   };
>>   
>> -static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
>> -	"xo",
>> -	"gpll0",
>> -	"gpll4",
>> -	"gpll0_early_div"
>> +static const struct clk_parent_data gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
>> +	{ .hw = &xo.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll4.clkr.hw },
>> +	{ .hw = &gpll0_early_div.hw }
>>   };
>>   
>>   static const struct freq_tbl ftbl_system_noc_clk_src[] = {
>> @@ -246,7 +262,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>>   	.freq_tbl = ftbl_system_noc_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "system_noc_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -266,7 +282,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>>   	.freq_tbl = ftbl_config_noc_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "config_noc_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -288,7 +304,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>>   	.freq_tbl = ftbl_periph_noc_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "periph_noc_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -309,7 +325,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
>>   	.freq_tbl = ftbl_usb30_master_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb30_master_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -327,7 +343,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
>>   	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb30_mock_utmi_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -345,7 +361,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
>>   	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb3_phy_aux_clk_src",
>> -		.parent_names = gcc_xo_sleep_clk,
>> +		.parent_data = gcc_xo_sleep_clk,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -364,7 +380,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
>>   	.freq_tbl = ftbl_usb20_master_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb20_master_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -377,7 +393,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
>>   	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "usb20_mock_utmi_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -403,7 +419,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>>   	.freq_tbl = ftbl_sdcc1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc1_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>> @@ -423,7 +439,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
>>   	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc1_ice_core_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -448,7 +464,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>>   	.freq_tbl = ftbl_sdcc2_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc2_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll4,
>> +		.parent_data = gcc_xo_gpll0_gpll4,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>> @@ -462,7 +478,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
>>   	.freq_tbl = ftbl_sdcc2_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc3_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll4,
>> +		.parent_data = gcc_xo_gpll0_gpll4,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>> @@ -486,7 +502,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
>>   	.freq_tbl = ftbl_sdcc4_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "sdcc4_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_floor_ops,
>>   	},
>> @@ -511,7 +527,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup1_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -530,7 +546,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup1_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -563,7 +579,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart1_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -577,7 +593,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup2_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -590,7 +606,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup2_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -604,7 +620,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart2_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -618,7 +634,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup3_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -631,7 +647,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup3_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -645,7 +661,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart3_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -659,7 +675,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup4_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -672,7 +688,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup4_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -686,7 +702,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart4_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -700,7 +716,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup5_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -713,7 +729,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup5_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -727,7 +743,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart5_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -741,7 +757,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup6_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -754,7 +770,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_qup6_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -768,7 +784,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp1_uart6_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -782,7 +798,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup1_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -795,7 +811,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup1_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -809,7 +825,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart1_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -823,7 +839,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup2_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -836,7 +852,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup2_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -850,7 +866,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart2_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -864,7 +880,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup3_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -877,7 +893,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup3_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -891,7 +907,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart3_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -905,7 +921,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup4_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -918,7 +934,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup4_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -932,7 +948,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart4_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -946,7 +962,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup5_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -959,7 +975,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup5_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -973,7 +989,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart5_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -987,7 +1003,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup6_spi_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1000,7 +1016,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_qup6_i2c_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1014,7 +1030,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
>>   	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "blsp2_uart6_apps_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1032,7 +1048,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>>   	.freq_tbl = ftbl_pdm2_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "pdm2_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1051,7 +1067,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
>>   	.freq_tbl = ftbl_tsif_ref_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "tsif_ref_clk_src",
>> -		.parent_names = gcc_xo_gpll0_aud_ref_clk,
>> +		.parent_data = gcc_xo_gpll0_aud_ref_clk,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_aud_ref_clk),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1063,7 +1079,7 @@ static struct clk_rcg2 gcc_sleep_clk_src = {
>>   	.parent_map = gcc_sleep_clk_map,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gcc_sleep_clk_src",
>> -		.parent_names = gcc_sleep_clk,
>> +		.parent_data = gcc_sleep_clk,
>>   		.num_parents = ARRAY_SIZE(gcc_sleep_clk),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1076,7 +1092,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
>>   	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "hmss_rbcpr_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1088,7 +1104,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
>>   	.parent_map = gcc_xo_gpll0_map,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "hmss_gpll0_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1109,7 +1125,7 @@ static struct clk_rcg2 gp1_clk_src = {
>>   	.freq_tbl = ftbl_gp1_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp1_clk_src",
>> -		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1123,7 +1139,7 @@ static struct clk_rcg2 gp2_clk_src = {
>>   	.freq_tbl = ftbl_gp1_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp2_clk_src",
>> -		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1137,7 +1153,7 @@ static struct clk_rcg2 gp3_clk_src = {
>>   	.freq_tbl = ftbl_gp1_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "gp3_clk_src",
>> -		.parent_names = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_sleep_clk_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_sleep_clk_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1156,7 +1172,7 @@ static struct clk_rcg2 pcie_aux_clk_src = {
>>   	.freq_tbl = ftbl_pcie_aux_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "pcie_aux_clk_src",
>> -		.parent_names = gcc_xo_sleep_clk,
>> +		.parent_data = gcc_xo_sleep_clk,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_sleep_clk),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1177,7 +1193,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
>>   	.freq_tbl = ftbl_ufs_axi_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ufs_axi_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1197,7 +1213,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
>>   	.freq_tbl = ftbl_ufs_ice_core_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "ufs_ice_core_clk_src",
>> -		.parent_names = gcc_xo_gpll0,
>> +		.parent_data = gcc_xo_gpll0,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1218,7 +1234,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
>>   	.freq_tbl = ftbl_qspi_ser_clk_src,
>>   	.clkr.hw.init = &(struct clk_init_data){
>>   		.name = "qspi_ser_clk_src",
>> -		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
>> +		.parent_data = gcc_xo_gpll0_gpll4_gpll0_early_div,
>>   		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
>>   		.ops = &clk_rcg2_ops,
>>   	},
>> @@ -1231,7 +1247,9 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sys_noc_usb3_axi_clk",
>> -			.parent_names = (const char *[]){ "usb30_master_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb30_master_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1246,7 +1264,9 @@ static struct clk_branch gcc_sys_noc_ufs_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sys_noc_ufs_axi_clk",
>> -			.parent_names = (const char *[]){ "ufs_axi_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_axi_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1261,7 +1281,9 @@ static struct clk_branch gcc_periph_noc_usb20_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_periph_noc_usb20_ahb_clk",
>> -			.parent_names = (const char *[]){ "usb20_master_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb20_master_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1276,7 +1298,9 @@ static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mmss_noc_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>   			.ops = &clk_branch2_ops,
>> @@ -1304,7 +1328,9 @@ static struct clk_branch gcc_usb30_master_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb30_master_clk",
>> -			.parent_names = (const char *[]){ "usb30_master_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb30_master_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1319,7 +1345,9 @@ static struct clk_branch gcc_usb30_sleep_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb30_sleep_clk",
>> -			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gcc_sleep_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1334,7 +1362,9 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb30_mock_utmi_clk",
>> -			.parent_names = (const char *[]){ "usb30_mock_utmi_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb30_mock_utmi_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1349,7 +1379,9 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb3_phy_aux_clk",
>> -			.parent_names = (const char *[]){ "usb3_phy_aux_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb3_phy_aux_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1365,7 +1397,9 @@ static struct clk_branch gcc_usb3_phy_pipe_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb3_phy_pipe_clk",
>> -			.parent_names = (const char *[]){ "usb3_phy_pipe_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "usb3_phy_pipe_clk_src", .name = "usb3_phy_pipe_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1380,7 +1414,9 @@ static struct clk_branch gcc_usb20_master_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb20_master_clk",
>> -			.parent_names = (const char *[]){ "usb20_master_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb20_master_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1395,7 +1431,9 @@ static struct clk_branch gcc_usb20_sleep_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb20_sleep_clk",
>> -			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gcc_sleep_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1410,7 +1448,9 @@ static struct clk_branch gcc_usb20_mock_utmi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb20_mock_utmi_clk",
>> -			.parent_names = (const char *[]){ "usb20_mock_utmi_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb20_mock_utmi_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1425,7 +1465,9 @@ static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
> 
> Use .hw here?  periph_noc_clk_src is defined in this file.  Same for all
> other uses of "periph_noc_clk_src" below.
> 
> - Marijn
> 
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1440,7 +1482,9 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc1_apps_clk",
>> -			.parent_names = (const char *[]){ "sdcc1_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&sdcc1_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1455,7 +1499,9 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc1_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1470,7 +1516,9 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc1_ice_core_clk",
>> -			.parent_names = (const char *[]){ "sdcc1_ice_core_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&sdcc1_ice_core_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1485,7 +1533,9 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc2_apps_clk",
>> -			.parent_names = (const char *[]){ "sdcc2_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&sdcc2_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1500,7 +1550,9 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc2_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1515,7 +1567,9 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc3_apps_clk",
>> -			.parent_names = (const char *[]){ "sdcc3_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&sdcc3_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1530,7 +1584,9 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc3_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1545,7 +1601,9 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc4_apps_clk",
>> -			.parent_names = (const char *[]){ "sdcc4_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&sdcc4_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1560,7 +1618,9 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_sdcc4_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1576,7 +1636,9 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
>>   		.enable_mask = BIT(17),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1592,7 +1654,9 @@ static struct clk_branch gcc_blsp1_sleep_clk = {
>>   		.enable_mask = BIT(16),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_sleep_clk",
>> -			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gcc_sleep_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1607,7 +1671,9 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup1_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup1_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1622,7 +1688,9 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup1_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup1_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1637,7 +1705,9 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart1_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart1_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart1_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1652,7 +1722,9 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup2_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup2_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1667,7 +1739,9 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup2_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup2_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1682,7 +1756,9 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart2_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart2_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart2_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1697,7 +1773,9 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup3_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup3_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1712,7 +1790,9 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup3_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup3_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1727,7 +1807,9 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart3_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart3_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart3_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1742,7 +1824,9 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup4_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup4_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1757,7 +1841,9 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup4_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup4_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1772,7 +1858,9 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart4_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart4_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart4_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1787,7 +1875,9 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup5_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup5_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1802,7 +1892,9 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup5_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup5_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1817,7 +1909,9 @@ static struct clk_branch gcc_blsp1_uart5_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart5_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart5_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart5_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1832,7 +1926,9 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup6_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup6_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1847,7 +1943,9 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_qup6_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_qup6_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1862,7 +1960,9 @@ static struct clk_branch gcc_blsp1_uart6_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp1_uart6_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp1_uart6_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp1_uart6_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1878,7 +1978,9 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
>>   		.enable_mask = BIT(15),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1894,7 +1996,9 @@ static struct clk_branch gcc_blsp2_sleep_clk = {
>>   		.enable_mask = BIT(14),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_sleep_clk",
>> -			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gcc_sleep_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1909,7 +2013,9 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup1_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup1_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup1_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1924,7 +2030,9 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup1_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup1_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup1_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1939,7 +2047,9 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart1_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart1_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart1_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1954,7 +2064,9 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup2_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup2_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup2_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1969,7 +2081,9 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup2_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup2_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup2_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1984,7 +2098,9 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart2_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart2_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart2_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -1999,7 +2115,9 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup3_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup3_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup3_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2014,7 +2132,9 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup3_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup3_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup3_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2029,7 +2149,9 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart3_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart3_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart3_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2044,7 +2166,9 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup4_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup4_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup4_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2059,7 +2183,9 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup4_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup4_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup4_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2074,7 +2200,9 @@ static struct clk_branch gcc_blsp2_uart4_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart4_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart4_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart4_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2089,7 +2217,9 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup5_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup5_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup5_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2104,7 +2234,9 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup5_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup5_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup5_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2119,7 +2251,9 @@ static struct clk_branch gcc_blsp2_uart5_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart5_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart5_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart5_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2134,7 +2268,9 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup6_spi_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup6_spi_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup6_spi_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2149,7 +2285,9 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_qup6_i2c_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_qup6_i2c_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_qup6_i2c_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2164,7 +2302,9 @@ static struct clk_branch gcc_blsp2_uart6_apps_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_blsp2_uart6_apps_clk",
>> -			.parent_names = (const char *[]){ "blsp2_uart6_apps_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&blsp2_uart6_apps_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2179,7 +2319,9 @@ static struct clk_branch gcc_pdm_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pdm_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2194,7 +2336,9 @@ static struct clk_branch gcc_pdm2_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pdm2_clk",
>> -			.parent_names = (const char *[]){ "pdm2_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&pdm2_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2210,7 +2354,9 @@ static struct clk_branch gcc_prng_ahb_clk = {
>>   		.enable_mask = BIT(13),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_prng_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2225,7 +2371,9 @@ static struct clk_branch gcc_tsif_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_tsif_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2240,7 +2388,9 @@ static struct clk_branch gcc_tsif_ref_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_tsif_ref_clk",
>> -			.parent_names = (const char *[]){ "tsif_ref_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&tsif_ref_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2255,7 +2405,9 @@ static struct clk_branch gcc_tsif_inactivity_timers_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_tsif_inactivity_timers_clk",
>> -			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gcc_sleep_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2271,7 +2423,9 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
>>   		.enable_mask = BIT(10),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_boot_rom_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2299,7 +2453,9 @@ static struct clk_branch gcc_hmss_rbcpr_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_hmss_rbcpr_clk",
>> -			.parent_names = (const char *[]){ "hmss_rbcpr_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&hmss_rbcpr_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2314,7 +2470,9 @@ static struct clk_branch gcc_gp1_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_gp1_clk",
>> -			.parent_names = (const char *[]){ "gp1_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gp1_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2329,7 +2487,9 @@ static struct clk_branch gcc_gp2_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_gp2_clk",
>> -			.parent_names = (const char *[]){ "gp2_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gp2_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2344,7 +2504,9 @@ static struct clk_branch gcc_gp3_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_gp3_clk",
>> -			.parent_names = (const char *[]){ "gp3_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gp3_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2359,7 +2521,9 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_0_slv_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2374,7 +2538,9 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_0_mstr_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2389,7 +2555,9 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_0_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2404,7 +2572,9 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_0_aux_clk",
>> -			.parent_names = (const char *[]){ "pcie_aux_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&pcie_aux_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2420,7 +2590,9 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_0_pipe_clk",
>> -			.parent_names = (const char *[]){ "pcie_0_pipe_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "pcie_0_pipe_clk_src", .name = "pcie_0_pipe_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2435,7 +2607,9 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_1_slv_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2450,7 +2624,9 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_1_mstr_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2465,7 +2641,9 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_1_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2480,7 +2658,9 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_1_aux_clk",
>> -			.parent_names = (const char *[]){ "pcie_aux_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&pcie_aux_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2496,7 +2676,9 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_1_pipe_clk",
>> -			.parent_names = (const char *[]){ "pcie_1_pipe_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "pcie_1_pipe_clk_src", .name = "pcie_1_pipe_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2511,7 +2693,9 @@ static struct clk_branch gcc_pcie_2_slv_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_2_slv_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2526,7 +2710,9 @@ static struct clk_branch gcc_pcie_2_mstr_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_2_mstr_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2541,7 +2727,9 @@ static struct clk_branch gcc_pcie_2_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_2_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2556,7 +2744,9 @@ static struct clk_branch gcc_pcie_2_aux_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_2_aux_clk",
>> -			.parent_names = (const char *[]){ "pcie_aux_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&pcie_aux_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2572,7 +2762,9 @@ static struct clk_branch gcc_pcie_2_pipe_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_2_pipe_clk",
>> -			.parent_names = (const char *[]){ "pcie_2_pipe_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "pcie_2_pipe_clk_src", .name = "pcie_2_pipe_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2587,7 +2779,9 @@ static struct clk_branch gcc_pcie_phy_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_phy_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2602,7 +2796,9 @@ static struct clk_branch gcc_pcie_phy_aux_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_pcie_phy_aux_clk",
>> -			.parent_names = (const char *[]){ "pcie_aux_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&pcie_aux_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2617,7 +2813,9 @@ static struct clk_branch gcc_ufs_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_axi_clk",
>> -			.parent_names = (const char *[]){ "ufs_axi_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_axi_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2632,7 +2830,9 @@ static struct clk_branch gcc_ufs_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2645,7 +2845,9 @@ static struct clk_fixed_factor ufs_tx_cfg_clk_src = {
>>   	.div = 16,
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "ufs_tx_cfg_clk_src",
>> -		.parent_names = (const char *[]){ "ufs_axi_clk_src" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&ufs_axi_clk_src.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.flags = CLK_SET_RATE_PARENT,
>>   		.ops = &clk_fixed_factor_ops,
>> @@ -2659,7 +2861,9 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_tx_cfg_clk",
>> -			.parent_names = (const char *[]){ "ufs_tx_cfg_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_tx_cfg_clk_src.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2672,7 +2876,9 @@ static struct clk_fixed_factor ufs_rx_cfg_clk_src = {
>>   	.div = 16,
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "ufs_rx_cfg_clk_src",
>> -		.parent_names = (const char *[]){ "ufs_axi_clk_src" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&ufs_axi_clk_src.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.flags = CLK_SET_RATE_PARENT,
>>   		.ops = &clk_fixed_factor_ops,
>> @@ -2712,7 +2918,9 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_rx_cfg_clk",
>> -			.parent_names = (const char *[]){ "ufs_rx_cfg_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_rx_cfg_clk_src.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2728,7 +2936,9 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_tx_symbol_0_clk",
>> -			.parent_names = (const char *[]){ "ufs_tx_symbol_0_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "ufs_tx_symbol_0_clk_src", .name = "ufs_tx_symbol_0_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2744,7 +2954,9 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_rx_symbol_0_clk",
>> -			.parent_names = (const char *[]){ "ufs_rx_symbol_0_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "ufs_rx_symbol_0_clk_src", .name = "ufs_rx_symbol_0_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2760,7 +2972,9 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_rx_symbol_1_clk",
>> -			.parent_names = (const char *[]){ "ufs_rx_symbol_1_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "ufs_rx_symbol_1_clk_src", .name = "ufs_rx_symbol_1_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2773,7 +2987,9 @@ static struct clk_fixed_factor ufs_ice_core_postdiv_clk_src = {
>>   	.div = 2,
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "ufs_ice_core_postdiv_clk_src",
>> -		.parent_names = (const char *[]){ "ufs_ice_core_clk_src" },
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&ufs_ice_core_clk_src.clkr.hw,
>> +		},
>>   		.num_parents = 1,
>>   		.flags = CLK_SET_RATE_PARENT,
>>   		.ops = &clk_fixed_factor_ops,
>> @@ -2787,7 +3003,9 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_unipro_core_clk",
>> -			.parent_names = (const char *[]){ "ufs_ice_core_postdiv_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_ice_core_postdiv_clk_src.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2802,7 +3020,9 @@ static struct clk_branch gcc_ufs_ice_core_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_ufs_ice_core_clk",
>> -			.parent_names = (const char *[]){ "ufs_ice_core_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_ice_core_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2841,7 +3061,9 @@ static struct clk_branch gcc_aggre0_snoc_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_aggre0_snoc_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>   			.ops = &clk_branch2_ops,
>> @@ -2856,7 +3078,9 @@ static struct clk_branch gcc_aggre0_cnoc_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_aggre0_cnoc_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>   			.ops = &clk_branch2_ops,
>> @@ -2871,7 +3095,9 @@ static struct clk_branch gcc_smmu_aggre0_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_smmu_aggre0_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>   			.ops = &clk_branch2_ops,
>> @@ -2886,7 +3112,9 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_smmu_aggre0_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>   			.ops = &clk_branch2_ops,
>> @@ -2901,7 +3129,9 @@ static struct clk_branch gcc_aggre2_ufs_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_aggre2_ufs_axi_clk",
>> -			.parent_names = (const char *[]){ "ufs_axi_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&ufs_axi_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2916,7 +3146,9 @@ static struct clk_branch gcc_aggre2_usb3_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_aggre2_usb3_axi_clk",
>> -			.parent_names = (const char *[]){ "usb30_master_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&usb30_master_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2931,7 +3163,9 @@ static struct clk_branch gcc_dcc_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_dcc_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> @@ -2945,7 +3179,9 @@ static struct clk_branch gcc_aggre0_noc_mpu_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_aggre0_noc_mpu_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> @@ -2959,7 +3195,9 @@ static struct clk_branch gcc_qspi_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_qspi_ahb_clk",
>> -			.parent_names = (const char *[]){ "periph_noc_clk_src" },
>> +			.parent_data = &(const struct clk_parent_data){
>> +				.fw_name = "periph_noc_clk_src", .name = "periph_noc_clk_src",
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -2974,7 +3212,9 @@ static struct clk_branch gcc_qspi_ser_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_qspi_ser_clk",
>> -			.parent_names = (const char *[]){ "qspi_ser_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&qspi_ser_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.flags = CLK_SET_RATE_PARENT,
>>   			.ops = &clk_branch2_ops,
>> @@ -3108,7 +3348,9 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mss_cfg_ahb_clk",
>> -			.parent_names = (const char *[]){ "config_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&config_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> @@ -3122,7 +3364,9 @@ static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mss_mnoc_bimc_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> @@ -3136,7 +3380,9 @@ static struct clk_branch gcc_mss_snoc_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mss_snoc_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> @@ -3150,7 +3396,9 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
>>   		.enable_mask = BIT(0),
>>   		.hw.init = &(struct clk_init_data){
>>   			.name = "gcc_mss_q6_bimc_axi_clk",
>> -			.parent_names = (const char *[]){ "system_noc_clk_src" },
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&system_noc_clk_src.clkr.hw,
>> +			},
>>   			.num_parents = 1,
>>   			.ops = &clk_branch2_ops,
>>   		},
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry

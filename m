Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F2A35387D
	for <lists+linux-clk@lfdr.de>; Sun,  4 Apr 2021 16:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhDDOvS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 4 Apr 2021 10:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDOvR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Apr 2021 10:51:17 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387C6C0613E6
        for <linux-clk@vger.kernel.org>; Sun,  4 Apr 2021 07:51:13 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso9192876ott.13
        for <linux-clk@vger.kernel.org>; Sun, 04 Apr 2021 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1C3PFZ+3cX+aq8xnpwLoBTpy4RS+Z4HorZTGwOatRKU=;
        b=gGDiQVWNln2PZttCtpKDSt66ZARGcPZxACO8KrYAu/11JiitSgGqyxP880/ieu1ITB
         9rjZtHltbThaNTRI7HWfzWkSlX6xZuVodyd9gzJGzdFJ/M7Auq4z3j+IFaJLfHxeSjVe
         VUdzWph2i366m9ozljR9JPg/kRInT0aAb3XbJgB7cFlLkLKe3BSXJoajSQGRHFzHZnXy
         CYxbGjWYpNhKfmKeyLJ+ZpVmGkWBShRqcO5yjemvOhvMmrqqmwf0a1nswyFOJYU9I3Rg
         f2cqcSTJ/cXwIz6I+Ifkgphgy3iRadKr9pGvMD/HeLUoE+dmeLd7UDDFIpunrikUHRC1
         2KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1C3PFZ+3cX+aq8xnpwLoBTpy4RS+Z4HorZTGwOatRKU=;
        b=G5mTUlaNE/I5whtczmX9pjTxCdZ2kj7ae7jiHtwKIe7A+2PbFAGt0LxhCsi1nhkOFL
         Wv0CHGBTbpUWPrxhQu6mLKceAR8gbwIuFKEtQr+dlcyukrBd/SUkutS2ENDtTMhv6HJl
         yYLkh2RwmGIdiv4pTLLp+5zRGrO6xMOYoCoe37SdCXaeq1CsQprB2Qncy7TvaIukpCn2
         oWDU2iH1nQzxjn8BRyvlibQ/PQbtYetpr2qqutSdXh/1HSECbzfBtSCOwo/zGAKQt3OR
         HciK9+d4chif4ddpv+spAvAJCpRk79jZmTiGvESejA/6UQaLPGToO6o/XIFFlZbw71MR
         U+rw==
X-Gm-Message-State: AOAM531Avrv0d0O026R0OBfUpfWarQVcDf4rWcBKEH8gtEWa34YdR0Gx
        x+CyiH4vYMahqu2hb4SobVi3Qg==
X-Google-Smtp-Source: ABdhPJw7hiQHPBJ2nAXGNdO6mNzk/kozbnv2/hZPKvcuX0i8w0RY1pL253PVvhROOug2P0QF8fvs+Q==
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr18603764otq.107.1617547872018;
        Sun, 04 Apr 2021 07:51:12 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 101sm3320349otj.44.2021.04.04.07.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:51:11 -0700 (PDT)
Date:   Sun, 4 Apr 2021 09:51:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 2/4] clk: qcom: convert SDM845 Global Clock Controller
 to parent_data
Message-ID: <20210404145109.GW904837@yoga>
References: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
 <20210402233944.273275-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402233944.273275-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 02 Apr 18:39 CDT 2021, Dmitry Baryshkov wrote:

> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/gcc-sdm845.c | 559 +++++++++++++++++-----------------
>  1 file changed, 285 insertions(+), 274 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 90f7febaf528..74800ed3c34a 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -35,6 +35,65 @@ enum {
>  	P_SLEEP_CLK,
>  };
>  
> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +	.clkr = {
> +		.enable_reg = 0x52000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "bi_tcxo", .name = "bi_tcxo",

I suppose that we always have bi_tcxo defined in DT, so we should be
able to drop the .name?

That said, I would prefer that to be done in a separate patch, so that
any regressions due to this could be easily bisected.

Regards,
Bjorn

> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_fabia_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll4 = {
> +	.offset = 0x76000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +	.clkr = {
> +		.enable_reg = 0x52000,
> +		.enable_mask = BIT(4),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll4",
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "bi_tcxo", .name = "bi_tcxo",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_fabia_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_fabia_even[] = {
> +	{ 0x0, 1 },
> +	{ 0x1, 2 },
> +	{ 0x3, 4 },
> +	{ 0x7, 8 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 8,
> +	.post_div_table = post_div_table_fabia_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll0_out_even",
> +		.parent_data = &(const struct clk_parent_data){
> +			.hw = &gpll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_fabia_ops,
> +	},
> +};
> +
>  static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> @@ -42,11 +101,11 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_0[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"gpll0_out_even",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_0[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -57,12 +116,12 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_1[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"core_pi_sleep_clk",
> -	"gpll0_out_even",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_1[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
> @@ -71,10 +130,10 @@ static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_2[] = {
> -	"bi_tcxo",
> -	"core_pi_sleep_clk",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_2[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
> @@ -83,10 +142,10 @@ static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_3[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_3[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
> @@ -94,9 +153,9 @@ static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_4[] = {
> -	"bi_tcxo",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_4[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
> @@ -107,31 +166,31 @@ static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_6[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"aud_ref_clk",
> -	"gpll0_out_even",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_6[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
> -static const char * const gcc_parent_names_7_ao[] = {
> -	"bi_tcxo_ao",
> -	"gpll0",
> -	"gpll0_out_even",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_7_ao[] = {
> +	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
> -static const char * const gcc_parent_names_8[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_8[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
> -static const char * const gcc_parent_names_8_ao[] = {
> -	"bi_tcxo_ao",
> -	"gpll0",
> -	"core_bi_pll_test_se",
> +static const struct clk_parent_data gcc_parent_data_8_ao[] = {
> +	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_10[] = {
> @@ -142,66 +201,14 @@ static const struct parent_map gcc_parent_map_10[] = {
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> -static const char * const gcc_parent_names_10[] = {
> -	"bi_tcxo",
> -	"gpll0",
> -	"gpll4",
> -	"gpll0_out_even",
> -	"core_bi_pll_test_se",
> -};
> -
> -static struct clk_alpha_pll gpll0 = {
> -	.offset = 0x0,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> -	.clkr = {
> -		.enable_reg = 0x52000,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll0",
> -			.parent_names = (const char *[]){ "bi_tcxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_fixed_fabia_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll4 = {
> -	.offset = 0x76000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> -	.clkr = {
> -		.enable_reg = 0x52000,
> -		.enable_mask = BIT(4),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll4",
> -			.parent_names = (const char *[]){ "bi_tcxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_fixed_fabia_ops,
> -		},
> -	},
> -};
> -
> -static const struct clk_div_table post_div_table_fabia_even[] = {
> -	{ 0x0, 1 },
> -	{ 0x1, 2 },
> -	{ 0x3, 4 },
> -	{ 0x7, 8 },
> -	{ }
> +static const struct clk_parent_data gcc_parent_data_10[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll4.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
> -static struct clk_alpha_pll_postdiv gpll0_out_even = {
> -	.offset = 0x0,
> -	.post_div_shift = 8,
> -	.post_div_table = post_div_table_fabia_even,
> -	.num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
> -	.width = 4,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll0_out_even",
> -		.parent_names = (const char *[]){ "gpll0" },
> -		.num_parents = 1,
> -		.ops = &clk_alpha_pll_postdiv_fabia_ops,
> -	},
> -};
>  
>  static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
> @@ -216,7 +223,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_cpuss_ahb_clk_src",
> -		.parent_names = gcc_parent_names_7_ao,
> +		.parent_data = gcc_parent_data_7_ao,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -235,7 +242,7 @@ static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_cpuss_rbcpr_clk_src",
> -		.parent_names = gcc_parent_names_8_ao,
> +		.parent_data = gcc_parent_data_8_ao,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -258,7 +265,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>  	.freq_tbl = ftbl_gcc_gp1_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp1_clk_src",
> -		.parent_names = gcc_parent_names_1,
> +		.parent_data = gcc_parent_data_1,
>  		.num_parents = 5,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -272,7 +279,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>  	.freq_tbl = ftbl_gcc_gp1_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp2_clk_src",
> -		.parent_names = gcc_parent_names_1,
> +		.parent_data = gcc_parent_data_1,
>  		.num_parents = 5,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -286,7 +293,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>  	.freq_tbl = ftbl_gcc_gp1_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp3_clk_src",
> -		.parent_names = gcc_parent_names_1,
> +		.parent_data = gcc_parent_data_1,
>  		.num_parents = 5,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -306,7 +313,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_0_aux_clk_src",
> -		.parent_names = gcc_parent_names_2,
> +		.parent_data = gcc_parent_data_2,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -320,7 +327,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_1_aux_clk_src",
> -		.parent_names = gcc_parent_names_2,
> +		.parent_data = gcc_parent_data_2,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -340,7 +347,7 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
>  	.freq_tbl = ftbl_gcc_pcie_phy_refgen_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_phy_refgen_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -362,7 +369,7 @@ static struct clk_rcg2 gcc_qspi_core_clk_src = {
>  	.freq_tbl = ftbl_gcc_qspi_core_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_qspi_core_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
> @@ -383,7 +390,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
>  	.freq_tbl = ftbl_gcc_pdm2_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pdm2_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -410,7 +417,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s0_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -426,7 +433,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s1_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -442,7 +449,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s2_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -458,7 +465,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s3_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -474,7 +481,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s4_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -490,7 +497,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s5_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -506,7 +513,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s6_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -522,7 +529,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s7_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -538,7 +545,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s0_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -554,7 +561,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s1_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -570,7 +577,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s2_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -586,7 +593,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s3_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -602,7 +609,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s4_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -618,7 +625,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s5_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -634,7 +641,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s6_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -650,7 +657,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
>  
>  static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s7_clk_src",
> -	.parent_names = gcc_parent_names_0,
> +	.parent_data = gcc_parent_data_0,
>  	.num_parents = 4,
>  	.ops = &clk_rcg2_shared_ops,
>  };
> @@ -683,7 +690,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sdcc2_apps_clk_src",
> -		.parent_names = gcc_parent_names_10,
> +		.parent_data = gcc_parent_data_10,
>  		.num_parents = 5,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
> @@ -707,7 +714,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  	.freq_tbl = ftbl_gcc_sdcc4_apps_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sdcc4_apps_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
> @@ -726,7 +733,7 @@ static struct clk_rcg2 gcc_tsif_ref_clk_src = {
>  	.freq_tbl = ftbl_gcc_tsif_ref_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_tsif_ref_clk_src",
> -		.parent_names = gcc_parent_names_6,
> +		.parent_data = gcc_parent_data_6,
>  		.num_parents = 5,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -749,7 +756,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_card_axi_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_axi_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -771,7 +778,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_card_ice_core_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_ice_core_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -785,7 +792,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_phy_aux_clk_src",
> -		.parent_names = gcc_parent_names_4,
> +		.parent_data = gcc_parent_data_4,
>  		.num_parents = 2,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -806,7 +813,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_card_unipro_core_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_unipro_core_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -829,7 +836,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_axi_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -843,7 +850,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_card_ice_core_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_ice_core_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -857,7 +864,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_phy_aux_clk_src",
> -		.parent_names = gcc_parent_names_4,
> +		.parent_data = gcc_parent_data_4,
>  		.num_parents = 2,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -871,7 +878,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
>  	.freq_tbl = ftbl_gcc_ufs_card_unipro_core_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_unipro_core_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -894,7 +901,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
>  	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_prim_master_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -916,7 +923,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
>  	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_prim_mock_utmi_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -930,7 +937,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
>  	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_sec_master_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -944,7 +951,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
>  	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_sec_mock_utmi_clk_src",
> -		.parent_names = gcc_parent_names_0,
> +		.parent_data = gcc_parent_data_0,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -958,7 +965,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb3_prim_phy_aux_clk_src",
> -		.parent_names = gcc_parent_names_2,
> +		.parent_data = gcc_parent_data_2,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -972,7 +979,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb3_sec_phy_aux_clk_src",
> -		.parent_names = gcc_parent_names_2,
> +		.parent_data = gcc_parent_data_2,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
> @@ -986,7 +993,7 @@ static struct clk_rcg2 gcc_vs_ctrl_clk_src = {
>  	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_vs_ctrl_clk_src",
> -		.parent_names = gcc_parent_names_3,
> +		.parent_data = gcc_parent_data_3,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -1007,7 +1014,7 @@ static struct clk_rcg2 gcc_vsensor_clk_src = {
>  	.freq_tbl = ftbl_gcc_vsensor_clk_src,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_vsensor_clk_src",
> -		.parent_names = gcc_parent_names_8,
> +		.parent_data = gcc_parent_data_8,
>  		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -1036,8 +1043,8 @@ static struct clk_branch gcc_aggre_ufs_card_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_aggre_ufs_card_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_card_axi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_card_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1056,8 +1063,8 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_aggre_ufs_phy_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_phy_axi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1074,8 +1081,8 @@ static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_aggre_usb3_prim_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_prim_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1092,8 +1099,8 @@ static struct clk_branch gcc_aggre_usb3_sec_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_aggre_usb3_sec_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_sec_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1110,8 +1117,8 @@ static struct clk_branch gcc_apc_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_apc_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1227,8 +1234,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_prim_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1245,8 +1252,8 @@ static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_cfg_noc_usb3_sec_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_sec_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1263,8 +1270,8 @@ static struct clk_branch gcc_cpuss_ahb_clk = {
>  		.enable_mask = BIT(21),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_cpuss_ahb_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_cpuss_ahb_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> @@ -1281,8 +1288,8 @@ static struct clk_branch gcc_cpuss_rbcpr_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_cpuss_rbcpr_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_cpuss_rbcpr_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_cpuss_rbcpr_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1340,8 +1347,8 @@ static struct clk_branch gcc_disp_gpll0_clk_src = {
>  		.enable_mask = BIT(18),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_disp_gpll0_clk_src",
> -			.parent_names = (const char *[]){
> -				"gpll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gpll0.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_aon_ops,
> @@ -1356,8 +1363,8 @@ static struct clk_branch gcc_disp_gpll0_div_clk_src = {
>  		.enable_mask = BIT(19),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_disp_gpll0_div_clk_src",
> -			.parent_names = (const char *[]){
> -				"gpll0_out_even",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gpll0_out_even.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_ops,
> @@ -1387,8 +1394,8 @@ static struct clk_branch gcc_gp1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp1_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_gp1_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_gp1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1405,8 +1412,8 @@ static struct clk_branch gcc_gp2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp2_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_gp2_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_gp2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1423,8 +1430,8 @@ static struct clk_branch gcc_gp3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp3_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_gp3_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_gp3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1456,8 +1463,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
>  		.enable_mask = BIT(15),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gpu_gpll0_clk_src",
> -			.parent_names = (const char *[]){
> -				"gpll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gpll0.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_ops,
> @@ -1472,8 +1479,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>  		.enable_mask = BIT(16),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gpu_gpll0_div_clk_src",
> -			.parent_names = (const char *[]){
> -				"gpll0_out_even",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gpll0_out_even.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_ops,
> @@ -1528,8 +1535,8 @@ static struct clk_branch gcc_gpu_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gpu_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1627,8 +1634,8 @@ static struct clk_branch gcc_mss_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_mss_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1645,8 +1652,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
>  		.enable_mask = BIT(3),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_0_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_pcie_0_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1703,7 +1710,9 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
>  		.enable_mask = BIT(4),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_0_pipe_clk",
> -			.parent_names = (const char *[]){ "pcie_0_pipe_clk" },
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk",
> +			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
> @@ -1747,8 +1756,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
>  		.enable_mask = BIT(29),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_1_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_pcie_1_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_pcie_1_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1805,7 +1814,9 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
>  		.enable_mask = BIT(30),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_1_pipe_clk",
> -			.parent_names = (const char *[]){ "pcie_1_pipe_clk" },
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "pcie_1_pipe_clk", .name = "pcie_1_pipe_clk",
> +			},
>  			.num_parents = 1,
>  			.ops = &clk_branch2_ops,
>  		},
> @@ -1848,8 +1859,8 @@ static struct clk_branch gcc_pcie_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_phy_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_pcie_0_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1866,8 +1877,8 @@ static struct clk_branch gcc_pcie_phy_refgen_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pcie_phy_refgen_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_pcie_phy_refgen_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_pcie_phy_refgen_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1884,8 +1895,8 @@ static struct clk_branch gcc_pdm2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pdm2_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_pdm2_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_pdm2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2003,8 +2014,8 @@ static struct clk_branch gcc_qspi_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qspi_core_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qspi_core_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qspi_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2021,8 +2032,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
>  		.enable_mask = BIT(10),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s0_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s0_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2039,8 +2050,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s1_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s1_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2057,8 +2068,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
>  		.enable_mask = BIT(12),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s2_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s2_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2075,8 +2086,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
>  		.enable_mask = BIT(13),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s3_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s3_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2093,8 +2104,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
>  		.enable_mask = BIT(14),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s4_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s4_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2111,8 +2122,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
>  		.enable_mask = BIT(15),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s5_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s5_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2129,8 +2140,8 @@ static struct clk_branch gcc_qupv3_wrap0_s6_clk = {
>  		.enable_mask = BIT(16),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s6_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s6_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2147,8 +2158,8 @@ static struct clk_branch gcc_qupv3_wrap0_s7_clk = {
>  		.enable_mask = BIT(17),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s7_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap0_s7_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2165,8 +2176,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
>  		.enable_mask = BIT(22),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s0_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s0_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2183,8 +2194,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
>  		.enable_mask = BIT(23),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s1_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s1_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2201,8 +2212,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
>  		.enable_mask = BIT(24),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s2_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s2_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2219,8 +2230,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
>  		.enable_mask = BIT(25),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s3_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s3_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2237,8 +2248,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
>  		.enable_mask = BIT(26),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s4_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s4_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2255,8 +2266,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
>  		.enable_mask = BIT(27),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s5_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s5_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2273,8 +2284,8 @@ static struct clk_branch gcc_qupv3_wrap1_s6_clk = {
>  		.enable_mask = BIT(28),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s6_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s6_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2291,8 +2302,8 @@ static struct clk_branch gcc_qupv3_wrap1_s7_clk = {
>  		.enable_mask = BIT(29),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s7_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_qupv3_wrap1_s7_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_qupv3_wrap1_s7_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2378,8 +2389,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sdcc2_apps_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_sdcc2_apps_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2409,8 +2420,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sdcc4_apps_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_sdcc4_apps_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_sdcc4_apps_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2427,8 +2438,8 @@ static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sys_noc_cpuss_ahb_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_cpuss_ahb_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> @@ -2471,8 +2482,8 @@ static struct clk_branch gcc_tsif_ref_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_tsif_ref_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_tsif_ref_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_tsif_ref_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2506,8 +2517,8 @@ static struct clk_branch gcc_ufs_card_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_card_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_card_axi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_card_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2539,8 +2550,8 @@ static struct clk_branch gcc_ufs_card_ice_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_card_ice_core_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_card_ice_core_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_card_ice_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2559,8 +2570,8 @@ static struct clk_branch gcc_ufs_card_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_card_phy_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_card_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_card_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2615,8 +2626,8 @@ static struct clk_branch gcc_ufs_card_unipro_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_card_unipro_core_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_card_unipro_core_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_card_unipro_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2663,8 +2674,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_axi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_phy_axi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2683,8 +2694,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_ice_core_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_phy_ice_core_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2703,8 +2714,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_phy_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_phy_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2759,8 +2770,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_unipro_core_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_ufs_phy_unipro_core_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2777,8 +2788,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_prim_master_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_prim_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2795,8 +2806,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_prim_mock_utmi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_prim_mock_utmi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2826,8 +2837,8 @@ static struct clk_branch gcc_usb30_sec_master_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_sec_master_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_sec_master_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2844,8 +2855,8 @@ static struct clk_branch gcc_usb30_sec_mock_utmi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_sec_mock_utmi_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb30_sec_mock_utmi_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2888,8 +2899,8 @@ static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb3_prim_phy_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb3_prim_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2906,8 +2917,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb3_prim_phy_com_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb3_prim_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2949,8 +2960,8 @@ static struct clk_branch gcc_usb3_sec_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb3_sec_phy_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb3_sec_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2967,8 +2978,8 @@ static struct clk_branch gcc_usb3_sec_phy_com_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb3_sec_phy_com_aux_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_usb3_sec_phy_aux_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3012,8 +3023,8 @@ static struct clk_branch gcc_vdda_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_vdda_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3030,8 +3041,8 @@ static struct clk_branch gcc_vddcx_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_vddcx_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3048,8 +3059,8 @@ static struct clk_branch gcc_vddmx_vs_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_vddmx_vs_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vsensor_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vsensor_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3124,8 +3135,8 @@ static struct clk_branch gcc_vs_ctrl_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_vs_ctrl_clk",
> -			.parent_names = (const char *[]){
> -				"gcc_vs_ctrl_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &gcc_vs_ctrl_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> -- 
> 2.30.2
> 

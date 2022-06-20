Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549AE551848
	for <lists+linux-clk@lfdr.de>; Mon, 20 Jun 2022 14:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242100AbiFTMJT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Jun 2022 08:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbiFTMIp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 08:08:45 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C5CE3A;
        Mon, 20 Jun 2022 05:08:32 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 060FC20068;
        Mon, 20 Jun 2022 14:08:27 +0200 (CEST)
Message-ID: <648cefb1-0576-0376-37b3-4247ae017d65@somainline.org>
Date:   Mon, 20 Jun 2022 14:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/7] clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
 <20220619212549.1240891-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220619212549.1240891-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19.06.2022 23:25, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8916.c | 108 ++++++++++++++++-----------------
>  1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 17e4a5a2a9fd..40c27ba6286f 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -371,7 +371,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pcnoc_bfdcd_clk_src",
>  		.parent_names = gcc_xo_gpll0_bimc,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -383,7 +383,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "system_noc_bfdcd_clk_src",
>  		.parent_names = gcc_xo_gpll0_bimc,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -403,7 +403,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_ahb_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -424,7 +424,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "apss_ahb_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -443,7 +443,7 @@ static struct clk_rcg2 csi0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -456,7 +456,7 @@ static struct clk_rcg2 csi1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -484,7 +484,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gfx3d_clk_src",
>  		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2a),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -511,7 +511,7 @@ static struct clk_rcg2 vfe0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vfe0_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll2,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -530,7 +530,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -559,7 +559,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -572,7 +572,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -586,7 +586,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -599,7 +599,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -613,7 +613,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -626,7 +626,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -640,7 +640,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -653,7 +653,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -667,7 +667,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -680,7 +680,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -694,7 +694,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -727,7 +727,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart1_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -741,7 +741,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart2_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -760,7 +760,7 @@ static struct clk_rcg2 cci_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cci_clk_src",
>  		.parent_names = gcc_xo_gpll0a,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -780,7 +780,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp0_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -794,7 +794,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp1_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -814,7 +814,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg0_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -835,7 +835,7 @@ static struct clk_rcg2 mclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk0_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -849,7 +849,7 @@ static struct clk_rcg2 mclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk1_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -868,7 +868,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0phytimer_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -881,7 +881,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1phytimer_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -901,7 +901,7 @@ static struct clk_rcg2 cpp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cpp_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll2,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -922,7 +922,7 @@ static struct clk_rcg2 crypto_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "crypto_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -941,7 +941,7 @@ static struct clk_rcg2 gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp1_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -955,7 +955,7 @@ static struct clk_rcg2 gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp2_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -969,7 +969,7 @@ static struct clk_rcg2 gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp3_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -981,7 +981,7 @@ static struct clk_rcg2 byte0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte0_clk_src",
>  		.parent_names = gcc_xo_gpll0a_dsibyte,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
>  		.ops = &clk_byte2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -1000,7 +1000,7 @@ static struct clk_rcg2 esc0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc0_clk_src",
>  		.parent_names = gcc_xo_dsibyte,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1025,7 +1025,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mdp_clk_src",
>  		.parent_names = gcc_xo_gpll0_dsiphy,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1038,7 +1038,7 @@ static struct clk_rcg2 pclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk0_clk_src",
>  		.parent_names = gcc_xo_gpll0a_dsiphy,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
>  		.ops = &clk_pixel_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -1057,7 +1057,7 @@ static struct clk_rcg2 vsync_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vsync_clk_src",
>  		.parent_names = gcc_xo_gpll0a,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1075,7 +1075,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pdm2_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1100,7 +1100,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc1_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -1125,7 +1125,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc2_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -1145,7 +1145,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "apss_tcu_clk_src",
>  		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1168,7 +1168,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "bimc_gpu_clk_src",
>  		.parent_names = gcc_xo_gpll0_bimc,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>  		.flags = CLK_GET_RATE_NOCACHE,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -1187,7 +1187,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb_hs_system_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1213,7 +1213,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ultaudio_ahbfabric_clk_src",
>  		.parent_names = gcc_xo_gpll0_gpll1_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1292,7 +1292,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ultaudio_lpaif_pri_i2s_clk_src",
>  		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1323,7 +1323,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ultaudio_lpaif_sec_i2s_clk_src",
>  		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1354,7 +1354,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ultaudio_lpaif_aux_i2s_clk_src",
>  		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1389,7 +1389,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ultaudio_xo_clk_src",
>  		.parent_names = gcc_xo_sleep,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1445,7 +1445,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "codec_digcodec_clk_src",
>  		.parent_names = gcc_xo_gpll1_emclk_sleep,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1515,7 +1515,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vcodec0_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -2771,7 +2771,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "bimc_ddr_clk_src",
>  		.parent_names = gcc_xo_gpll0_bimc,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
>  		.ops = &clk_rcg2_ops,
>  		.flags = CLK_GET_RATE_NOCACHE,
>  	},

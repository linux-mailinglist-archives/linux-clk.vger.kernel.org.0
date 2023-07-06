Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A59749EC7
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jul 2023 16:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjGFOQ3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 6 Jul 2023 10:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjGFOQ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 10:16:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A67171D
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 07:16:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so1047439e87.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688652983; x=1691244983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOmBdv1lisamBbLJHrniasmRKbwrJaoeYKdJ/js6zGw=;
        b=qoJ+BiuLAEr+THrq00w1nuQRO/6hl0kYTaOSz6E+F67Xkza2gLZgCX+TZ1JXwfSge9
         NjI7L3LvkAyeX1WxMT2sLLbicVlfI7UeqvTRawAYZygM4WBzsC5ZcJ9b4H+G5HcGLuUq
         2kuVLkFvpssUXvqsxo/qDLbrNWt3fEGw3JLxfzKCfVcpYf6SHPCp1WMNfbCj48CTGp7Q
         cs0OaZ5+iYO4ARu5cdvFjp0hqJHCnQjsjck4gVQXgDgAzO0KtvJhTVlskA34tXdaB2q6
         mgpi5elvmvZv6dxlsp45OPuQ0L4MKhsVlwDWOc92kS0JZJ8n89beQFwhf8v/X6ydAsx5
         r5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688652983; x=1691244983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOmBdv1lisamBbLJHrniasmRKbwrJaoeYKdJ/js6zGw=;
        b=ZVVyvNTJ4xtca1CTMvCysFPZ8v92XWEiUWt1aWsNvV4VD8qLLLKsozMBp0RxF5eCh1
         OvS7WfnJjVtgD4xlD1jjVwnBk3+xmSr5sY642LYqwNzCAxvnnwFDguD6lPNdOcQROQdB
         2z29o1MwL6mOPagk+gaUOFfwaNKnvZxXB6+k6QdOi7n3GjqSpn6yocTy9Hw7xhAtVNt4
         KEvbdjYAieW6WR5m2x1OS0nJ3qqydO2rO+I96I2wpH0Xr7Aro2rZqIsKihQl2+pfbXnT
         ZWb4TBLhEqXxUhTaQKLmqaSx0yk76zh/OjUletcc5dtZV5F4Bp1m+KU77CKOSm9yktqJ
         h6Iw==
X-Gm-Message-State: ABy/qLYQbcAXYHN2rZBOFQx1gAu3aQExFcYXPgYFUSrXREUUiA6evUq7
        6l1MOALSm2GdJlisXwEs3Kg/Rg==
X-Google-Smtp-Source: APBJJlFEVg1DpCWI/hHXDk/E1hXYnplyNAfaA59N7XB/XOaPbW8JTMvQVSDX2RK/vy4stv/I+nhuLw==
X-Received: by 2002:a19:7b0d:0:b0:4f8:64f5:f591 with SMTP id w13-20020a197b0d000000b004f864f5f591mr1665324lfc.12.1688652982626;
        Thu, 06 Jul 2023 07:16:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020ac243d2000000b004fba785d549sm269775lfl.263.2023.07.06.07.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 07:16:22 -0700 (PDT)
Message-ID: <fa24eaa0-c363-0694-76be-c14eba6999a1@linaro.org>
Date:   Thu, 6 Jul 2023 17:16:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V3 6/6] clk: qcom: gcc-qdu1000: Update the RCGs ops
Content-Language: en-GB
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230706105045.633076-1-quic_imrashai@quicinc.com>
 <20230706105045.633076-7-quic_imrashai@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706105045.633076-7-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2023 13:50, Imran Shaik wrote:
> Update the SDCC clock RCG ops to floor_ops to avoid overclocking issues

Split, please.

> and remaining RCGs to shared_ops to park them at safe clock(XO) during
> disable.

Why are you doing this, is there any issue? Previously we had only a 
several clocks implemented this way, which were really shared with other 
subsystems (this is the where name _shared_ops comes from).

> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes since v2:
>   - None
> Changes since v1:
>   - Newly added
> 
>   drivers/clk/qcom/gcc-qdu1000.c | 62 +++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
> index 718c34dca6e8..de35cdc93732 100644
> --- a/drivers/clk/qcom/gcc-qdu1000.c
> +++ b/drivers/clk/qcom/gcc-qdu1000.c
> @@ -475,7 +475,7 @@ static struct clk_rcg2 gcc_aggre_noc_ecpri_dma_clk_src = {
>   		.name = "gcc_aggre_noc_ecpri_dma_clk_src",
>   		.parent_data = gcc_parent_data_4,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -495,7 +495,7 @@ static struct clk_rcg2 gcc_aggre_noc_ecpri_gsi_clk_src = {
>   		.name = "gcc_aggre_noc_ecpri_gsi_clk_src",
>   		.parent_data = gcc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -514,7 +514,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>   		.name = "gcc_gp1_clk_src",
>   		.parent_data = gcc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -528,7 +528,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>   		.name = "gcc_gp2_clk_src",
>   		.parent_data = gcc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -542,7 +542,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>   		.name = "gcc_gp3_clk_src",
>   		.parent_data = gcc_parent_data_1,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -561,7 +561,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
>   		.name = "gcc_pcie_0_aux_clk_src",
>   		.parent_data = gcc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -581,7 +581,7 @@ static struct clk_rcg2 gcc_pcie_0_phy_rchng_clk_src = {
>   		.name = "gcc_pcie_0_phy_rchng_clk_src",
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -600,7 +600,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
>   		.name = "gcc_pdm2_clk_src",
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -622,7 +622,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s0_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
> @@ -638,7 +638,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s1_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
> @@ -654,7 +654,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s2_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
> @@ -670,7 +670,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s3_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
> @@ -686,7 +686,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s4_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
> @@ -707,7 +707,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s5_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
> @@ -723,7 +723,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s6_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
> @@ -739,7 +739,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
>   	.name = "gcc_qupv3_wrap0_s7_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
> @@ -755,7 +755,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s0_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
> @@ -771,7 +771,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s1_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
> @@ -787,7 +787,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s2_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
> @@ -803,7 +803,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s3_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
> @@ -819,7 +819,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s4_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
> @@ -835,7 +835,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s5_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
> @@ -851,7 +851,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s6_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
> @@ -867,7 +867,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
>   	.name = "gcc_qupv3_wrap1_s7_clk_src",
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -	.ops = &clk_rcg2_ops,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
> @@ -903,7 +903,7 @@ static struct clk_rcg2 gcc_sdcc5_apps_clk_src = {
>   		.name = "gcc_sdcc5_apps_clk_src",
>   		.parent_data = gcc_parent_data_8,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
>   
> @@ -922,7 +922,7 @@ static struct clk_rcg2 gcc_sdcc5_ice_core_clk_src = {
>   		.name = "gcc_sdcc5_ice_core_clk_src",
>   		.parent_data = gcc_parent_data_2,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
>   
> @@ -936,7 +936,7 @@ static struct clk_rcg2 gcc_sm_bus_xo_clk_src = {
>   		.name = "gcc_sm_bus_xo_clk_src",
>   		.parent_data = gcc_parent_data_2,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -955,7 +955,7 @@ static struct clk_rcg2 gcc_tsc_clk_src = {
>   		.name = "gcc_tsc_clk_src",
>   		.parent_data = gcc_parent_data_9,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -975,7 +975,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
>   		.name = "gcc_usb30_prim_master_clk_src",
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -989,7 +989,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
>   		.name = "gcc_usb30_prim_mock_utmi_clk_src",
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -1003,7 +1003,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>   		.name = "gcc_usb3_prim_phy_aux_clk_src",
>   		.parent_data = gcc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   

-- 
With best wishes
Dmitry


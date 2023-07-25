Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874AE760C1B
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jul 2023 09:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbjGYHky (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jul 2023 03:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbjGYHkm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 03:40:42 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE67F3A8F
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:39:11 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so51133905e9.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270749; x=1690875549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8UQFLBCaasG8A55VnOOgztoAfNPrHKcEGLSk6FLvxs=;
        b=JWVj1LM3YPTfXn7UBImfHwDLK13AoXYJrC2R3TJ9aXPuC8mhS3NtTBXB2qnqfX4TcZ
         AqeFzv83YIB+8okYPCmTdhSEHLQffiOtVWi37ApM/Ttjcfos4rnJJi8tbt784/O4NI9D
         H6fhW4TAClwuy1NIF7VQNp1ho31KuKBJZjhn3EbP+k2gSmBrrcT7AgI8vmkowYt+lqEP
         owP/gQuk21j8V8c3qfnGmQYy9LLgJ4wew4OBIbFcEvgdoLEuNLkoDMvZSQlswd5bzZ4U
         ITgFjtvHIOhlj92CxpQmRuhec62UC2OfJrbyIliuw+mbGB38fbTiDVH89TSzYq1Vix8j
         a5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270749; x=1690875549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8UQFLBCaasG8A55VnOOgztoAfNPrHKcEGLSk6FLvxs=;
        b=M2Il9ZJwbsyVSOdv2uDazSo/m6BJ/WWbD3Jdluo1pt9SbHy1KAwfubeNRGfh9ScafJ
         2MjlaT7hHLFa8PvWzFjGPQdHNezGXlueEzX8EMV60x9OE4KM7Rk7Q9OinkLpqjf9ZG31
         DONliNRaeFNb+HX/lxs8tLR7YFec+EW3kYtZoqMETe4LmB0kU5XEnjIYOOI5LwJwgT4q
         fLXA6XY59aQD63ZVCzBgY/Y6gI+yJUHs8kooN5dwcwBxc6IfK+0SU/fOm4QDoSKI/qhb
         uc3fE7JeLBg2ZqjX3d5pnUaY5rcEbevMT17JP3KQ2jFAay9JglK47TY+dOhP6vHOfQaU
         gWZA==
X-Gm-Message-State: ABy/qLZg4cQtTqK7su03DScUONcMOW4G+z6otI+TX2rMicAemWC9ZFFH
        wKlNdDVYr04rDid84CG1P/OHMQ==
X-Google-Smtp-Source: APBJJlH/14Pha0XHA8IGhMCFwljBc6NXEHbItnzb4KlqltW0ukTZIn9wF3COQo7AeZEllJcA65PeLg==
X-Received: by 2002:a1c:770f:0:b0:3fc:d5:dc14 with SMTP id t15-20020a1c770f000000b003fc00d5dc14mr10053398wmi.5.1690270748740;
        Tue, 25 Jul 2023 00:39:08 -0700 (PDT)
Received: from linaro.org ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id k21-20020a7bc415000000b003fbdf8292a7sm12432609wmi.46.2023.07.25.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:39:08 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:39:06 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] clk: imx: imx8ulp: update SPLL2 type
Message-ID: <ZL98GkzrCUStU2BW@linaro.org>
References: <20230625123340.4067536-1-peng.fan@oss.nxp.com>
 <20230625123340.4067536-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230625123340.4067536-2-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-06-25 20:33:40, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The SPLL2 on iMX8ULP is different with other frac PLLs, it can
> support VCO from 650Mhz to 1Ghz. Following the changes to pllv4,
> use the new type IMX_PLLV4_IMX8ULP_1GHZ.
> 
> Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8ulp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
> index e308c88cb801..1b04e2fc78ad 100644
> --- a/drivers/clk/imx/clk-imx8ulp.c
> +++ b/drivers/clk/imx/clk-imx8ulp.c
> @@ -167,7 +167,7 @@ static int imx8ulp_clk_cgc1_init(struct platform_device *pdev)
>  	clks[IMX8ULP_CLK_SPLL2_PRE_SEL]	= imx_clk_hw_mux_flags("spll2_pre_sel", base + 0x510, 0, 1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
>  	clks[IMX8ULP_CLK_SPLL3_PRE_SEL]	= imx_clk_hw_mux_flags("spll3_pre_sel", base + 0x610, 0, 1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
>  
> -	clks[IMX8ULP_CLK_SPLL2] = imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll2", "spll2_pre_sel", base + 0x500);
> +	clks[IMX8ULP_CLK_SPLL2] = imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP_1GHZ, "spll2", "spll2_pre_sel", base + 0x500);
>  	clks[IMX8ULP_CLK_SPLL3] = imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll3", "spll3_pre_sel", base + 0x600);
>  	clks[IMX8ULP_CLK_SPLL3_VCODIV] = imx_clk_hw_divider("spll3_vcodiv", "spll3", base + 0x604, 0, 6);
>  
> -- 
> 2.37.1
> 

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF632632CA2
	for <lists+linux-clk@lfdr.de>; Mon, 21 Nov 2022 20:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbiKUTHJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Nov 2022 14:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiKUTG7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 14:06:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58240C1F51
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:06:56 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r186-20020a1c44c3000000b003d0283bf132so77180wma.4
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16W8GxpNqn2oLY/XD2hKb9e+ibEknRVsNnjPB4boMM0=;
        b=ITNMFihy7ePpBU9OXN1yAYfn+1bgfGStYJENascfd6KbyoYAz1nx0PjF6AZMgm77xY
         ShQrUlb9E161XXwKYRON7vXmabuoI1b36dAfnMLIMiVhV1ty8i6dHzE4egiznXtCLXeU
         T87kHUlJMQp9K9yKfq/QXNssiwfXjs3UrSF41PT7gLB6YJJSHQW9srL3dCdRd8cZc8Cb
         eB3FoL3qWYloyN4fQaHRkL3yerfQMBjPUk4AnInhYzfZt+ofD9XbCxbYZGZ9DkwwMFOk
         A8rV2PUlA3pvwmP4vyQwUETSufS/2eObmMJRkA6ZtE1OPnmcC51OFeF1c624AJRyONe+
         iM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16W8GxpNqn2oLY/XD2hKb9e+ibEknRVsNnjPB4boMM0=;
        b=22okD3vRx65L4cIza5fEi1CKMk67gELFjgrKHaoJ4udP0q9GJgM7TXD7RTrKBvo9PB
         I3/IVEDYvoOEVPNlzZKXJPxcZ+orR+sBZD5RzejeNSxTrGZYdnn6iuxW8WYhJYrjLrPp
         k4lnkmejPhqCDkPTWao8SjXIlzdC8QIAadMMtWQITiOISWV42D2GncNJOX4FfanDebml
         5VIX67jDrw2wHjq0mtZ89Y35actEVUG28QUnmZLu3a4UngPK2Nr8rLky1cmOGLV1urX7
         lnedoKNeS/BMOch+DbHS6RJEV6x4SLe3WAhvmgkAL6DQsjyZEVXaUA/pdq8SyMc1kIYi
         AszA==
X-Gm-Message-State: ANoB5pklIBDunpwfzOJ1rdEOkQfVPS4JQH31Bl8EPZp1Ap2OwUIEEgJG
        +noG3FDNXQFI4eaIlf3jJ5GyZw==
X-Google-Smtp-Source: AA0mqf4NMgYLCHSn0bSbSxLU5Kqt2cLU8Ig1giijIz72K45hZiIsb780kbCjUCgZNR7L9JbMETu3Fg==
X-Received: by 2002:a05:600c:a3a2:b0:3cf:7267:5b40 with SMTP id hn34-20020a05600ca3a200b003cf72675b40mr13963711wmb.164.1669057614773;
        Mon, 21 Nov 2022 11:06:54 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b00236488f62d6sm12002098wru.79.2022.11.21.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 11:06:54 -0800 (PST)
Date:   Mon, 21 Nov 2022 21:06:52 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        michael@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: rename imx_obtain_fixed_clk_hw() to
 imx_get_clk_hw_by_name()
Message-ID: <Y3vMTC3WmcQoogEw@linaro.org>
References: <20221113180839.1625832-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113180839.1625832-1-dario.binacchi@amarulasolutions.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-13 19:08:39, Dario Binacchi wrote:
> The imx_obtain_fixed_clk_hw name was wrong and misleading. Renaming it
> to imx_get_clk_hw_by_name clarifies the purpose of the function, and
> will allow it to be used not only for fixed rate clocks but also in
> wider contexts.
> 
> No functional changes intended.
> 
> The replacements were made with the following command:
> 
> grep -rl 'imx_obtain_fixed_clk_hw' ./ | \
>      xargs sed -i 's/imx_obtain_fixed_clk_hw/imx_get_clk_hw_by_name/g'
> 
> Tested on a BSH SystemMaster (SMM) S2 board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Yeah, why not. I'm OK with it.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> 
> ---
> 
>  drivers/clk/imx/clk-imx6sll.c   |  8 ++++----
>  drivers/clk/imx/clk-imx6sx.c    | 12 ++++++------
>  drivers/clk/imx/clk-imx6ul.c    |  8 ++++----
>  drivers/clk/imx/clk-imx7d.c     |  4 ++--
>  drivers/clk/imx/clk-imx7ulp.c   | 10 +++++-----
>  drivers/clk/imx/clk-imx8mm.c    | 12 ++++++------
>  drivers/clk/imx/clk-imx8mn.c    | 12 ++++++------
>  drivers/clk/imx/clk-imx8mp.c    | 12 ++++++------
>  drivers/clk/imx/clk-imx8mq.c    | 14 +++++++-------
>  drivers/clk/imx/clk-imx93.c     |  6 +++---
>  drivers/clk/imx/clk-imxrt1050.c |  2 +-
>  drivers/clk/imx/clk.c           |  5 ++---
>  drivers/clk/imx/clk.h           |  3 +--
>  13 files changed, 53 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
> index 31d777f30039..1c9351649eab 100644
> --- a/drivers/clk/imx/clk-imx6sll.c
> +++ b/drivers/clk/imx/clk-imx6sll.c
> @@ -91,12 +91,12 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
>  
>  	hws[IMX6SLL_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
>  
> -	hws[IMX6SLL_CLK_CKIL] = imx_obtain_fixed_clk_hw(ccm_node, "ckil");
> -	hws[IMX6SLL_CLK_OSC] = imx_obtain_fixed_clk_hw(ccm_node, "osc");
> +	hws[IMX6SLL_CLK_CKIL] = imx_get_clk_hw_by_name(ccm_node, "ckil");
> +	hws[IMX6SLL_CLK_OSC] = imx_get_clk_hw_by_name(ccm_node, "osc");
>  
>  	/* ipp_di clock is external input */
> -	hws[IMX6SLL_CLK_IPP_DI0] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di0");
> -	hws[IMX6SLL_CLK_IPP_DI1] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di1");
> +	hws[IMX6SLL_CLK_IPP_DI0] = imx_get_clk_hw_by_name(ccm_node, "ipp_di0");
> +	hws[IMX6SLL_CLK_IPP_DI1] = imx_get_clk_hw_by_name(ccm_node, "ipp_di1");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx6sll-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 598f3cf4eba4..b378531240e6 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -132,16 +132,16 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  
>  	hws[IMX6SX_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
>  
> -	hws[IMX6SX_CLK_CKIL] = imx_obtain_fixed_clk_hw(ccm_node, "ckil");
> -	hws[IMX6SX_CLK_OSC] = imx_obtain_fixed_clk_hw(ccm_node, "osc");
> +	hws[IMX6SX_CLK_CKIL] = imx_get_clk_hw_by_name(ccm_node, "ckil");
> +	hws[IMX6SX_CLK_OSC] = imx_get_clk_hw_by_name(ccm_node, "osc");
>  
>  	/* ipp_di clock is external input */
> -	hws[IMX6SX_CLK_IPP_DI0] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di0");
> -	hws[IMX6SX_CLK_IPP_DI1] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di1");
> +	hws[IMX6SX_CLK_IPP_DI0] = imx_get_clk_hw_by_name(ccm_node, "ipp_di0");
> +	hws[IMX6SX_CLK_IPP_DI1] = imx_get_clk_hw_by_name(ccm_node, "ipp_di1");
>  
>  	/* Clock source from external clock via CLK1/2 PAD */
> -	hws[IMX6SX_CLK_ANACLK1] = imx_obtain_fixed_clk_hw(ccm_node, "anaclk1");
> -	hws[IMX6SX_CLK_ANACLK2] = imx_obtain_fixed_clk_hw(ccm_node, "anaclk2");
> +	hws[IMX6SX_CLK_ANACLK1] = imx_get_clk_hw_by_name(ccm_node, "anaclk1");
> +	hws[IMX6SX_CLK_ANACLK2] = imx_get_clk_hw_by_name(ccm_node, "anaclk2");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx6sx-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index 520b100bff4b..67a7a77ca540 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -126,12 +126,12 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
>  
>  	hws[IMX6UL_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
>  
> -	hws[IMX6UL_CLK_CKIL] = imx_obtain_fixed_clk_hw(ccm_node, "ckil");
> -	hws[IMX6UL_CLK_OSC] = imx_obtain_fixed_clk_hw(ccm_node, "osc");
> +	hws[IMX6UL_CLK_CKIL] = imx_get_clk_hw_by_name(ccm_node, "ckil");
> +	hws[IMX6UL_CLK_OSC] = imx_get_clk_hw_by_name(ccm_node, "osc");
>  
>  	/* ipp_di clock is external input */
> -	hws[IMX6UL_CLK_IPP_DI0] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di0");
> -	hws[IMX6UL_CLK_IPP_DI1] = imx_obtain_fixed_clk_hw(ccm_node, "ipp_di1");
> +	hws[IMX6UL_CLK_IPP_DI0] = imx_get_clk_hw_by_name(ccm_node, "ipp_di0");
> +	hws[IMX6UL_CLK_IPP_DI1] = imx_get_clk_hw_by_name(ccm_node, "ipp_di1");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx6ul-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index cbf8131c63f7..d681b6c4b29a 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -391,8 +391,8 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
>  	hws = clk_hw_data->hws;
>  
>  	hws[IMX7D_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX7D_OSC_24M_CLK] = imx_obtain_fixed_clk_hw(ccm_node, "osc");
> -	hws[IMX7D_CKIL] = imx_obtain_fixed_clk_hw(ccm_node, "ckil");
> +	hws[IMX7D_OSC_24M_CLK] = imx_get_clk_hw_by_name(ccm_node, "osc");
> +	hws[IMX7D_CKIL] = imx_get_clk_hw_by_name(ccm_node, "ckil");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx7d-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
> index b6e45e77ee39..208a0ab80d5e 100644
> --- a/drivers/clk/imx/clk-imx7ulp.c
> +++ b/drivers/clk/imx/clk-imx7ulp.c
> @@ -59,11 +59,11 @@ static void __init imx7ulp_clk_scg1_init(struct device_node *np)
>  
>  	hws[IMX7ULP_CLK_DUMMY]		= imx_clk_hw_fixed("dummy", 0);
>  
> -	hws[IMX7ULP_CLK_ROSC]		= imx_obtain_fixed_clk_hw(np, "rosc");
> -	hws[IMX7ULP_CLK_SOSC]		= imx_obtain_fixed_clk_hw(np, "sosc");
> -	hws[IMX7ULP_CLK_SIRC]		= imx_obtain_fixed_clk_hw(np, "sirc");
> -	hws[IMX7ULP_CLK_FIRC]		= imx_obtain_fixed_clk_hw(np, "firc");
> -	hws[IMX7ULP_CLK_UPLL]		= imx_obtain_fixed_clk_hw(np, "upll");
> +	hws[IMX7ULP_CLK_ROSC]		= imx_get_clk_hw_by_name(np, "rosc");
> +	hws[IMX7ULP_CLK_SOSC]		= imx_get_clk_hw_by_name(np, "sosc");
> +	hws[IMX7ULP_CLK_SIRC]		= imx_get_clk_hw_by_name(np, "sirc");
> +	hws[IMX7ULP_CLK_FIRC]		= imx_get_clk_hw_by_name(np, "firc");
> +	hws[IMX7ULP_CLK_UPLL]		= imx_get_clk_hw_by_name(np, "upll");
>  
>  	/* SCG1 */
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index b6d275855b36..cb44e8148e53 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -312,12 +312,12 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>  	hws = clk_hw_data->hws;
>  
>  	hws[IMX8MM_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MM_CLK_24M] = imx_obtain_fixed_clk_hw(np, "osc_24m");
> -	hws[IMX8MM_CLK_32K] = imx_obtain_fixed_clk_hw(np, "osc_32k");
> -	hws[IMX8MM_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
> -	hws[IMX8MM_CLK_EXT2] = imx_obtain_fixed_clk_hw(np, "clk_ext2");
> -	hws[IMX8MM_CLK_EXT3] = imx_obtain_fixed_clk_hw(np, "clk_ext3");
> -	hws[IMX8MM_CLK_EXT4] = imx_obtain_fixed_clk_hw(np, "clk_ext4");
> +	hws[IMX8MM_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> +	hws[IMX8MM_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MM_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
> +	hws[IMX8MM_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
> +	hws[IMX8MM_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
> +	hws[IMX8MM_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index d37c45b676ab..c765d1219cbf 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -332,12 +332,12 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws = clk_hw_data->hws;
>  
>  	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MN_CLK_24M] = imx_obtain_fixed_clk_hw(np, "osc_24m");
> -	hws[IMX8MN_CLK_32K] = imx_obtain_fixed_clk_hw(np, "osc_32k");
> -	hws[IMX8MN_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
> -	hws[IMX8MN_CLK_EXT2] = imx_obtain_fixed_clk_hw(np, "clk_ext2");
> -	hws[IMX8MN_CLK_EXT3] = imx_obtain_fixed_clk_hw(np, "clk_ext3");
> -	hws[IMX8MN_CLK_EXT4] = imx_obtain_fixed_clk_hw(np, "clk_ext4");
> +	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> +	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MN_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
> +	hws[IMX8MN_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
> +	hws[IMX8MN_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
> +	hws[IMX8MN_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 652ae58c2735..b6d03cf5b1ce 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -436,12 +436,12 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws = clk_hw_data->hws;
>  
>  	hws[IMX8MP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MP_CLK_24M] = imx_obtain_fixed_clk_hw(np, "osc_24m");
> -	hws[IMX8MP_CLK_32K] = imx_obtain_fixed_clk_hw(np, "osc_32k");
> -	hws[IMX8MP_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
> -	hws[IMX8MP_CLK_EXT2] = imx_obtain_fixed_clk_hw(np, "clk_ext2");
> -	hws[IMX8MP_CLK_EXT3] = imx_obtain_fixed_clk_hw(np, "clk_ext3");
> -	hws[IMX8MP_CLK_EXT4] = imx_obtain_fixed_clk_hw(np, "clk_ext4");
> +	hws[IMX8MP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> +	hws[IMX8MP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MP_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
> +	hws[IMX8MP_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
> +	hws[IMX8MP_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
> +	hws[IMX8MP_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
>  
>  	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
>  	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 882dcad4817d..2bcaec19a999 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -297,13 +297,13 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws = clk_hw_data->hws;
>  
>  	hws[IMX8MQ_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MQ_CLK_32K] = imx_obtain_fixed_clk_hw(np, "ckil");
> -	hws[IMX8MQ_CLK_25M] = imx_obtain_fixed_clk_hw(np, "osc_25m");
> -	hws[IMX8MQ_CLK_27M] = imx_obtain_fixed_clk_hw(np, "osc_27m");
> -	hws[IMX8MQ_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
> -	hws[IMX8MQ_CLK_EXT2] = imx_obtain_fixed_clk_hw(np, "clk_ext2");
> -	hws[IMX8MQ_CLK_EXT3] = imx_obtain_fixed_clk_hw(np, "clk_ext3");
> -	hws[IMX8MQ_CLK_EXT4] = imx_obtain_fixed_clk_hw(np, "clk_ext4");
> +	hws[IMX8MQ_CLK_32K] = imx_get_clk_hw_by_name(np, "ckil");
> +	hws[IMX8MQ_CLK_25M] = imx_get_clk_hw_by_name(np, "osc_25m");
> +	hws[IMX8MQ_CLK_27M] = imx_get_clk_hw_by_name(np, "osc_27m");
> +	hws[IMX8MQ_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
> +	hws[IMX8MQ_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
> +	hws[IMX8MQ_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
> +	hws[IMX8MQ_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-anatop");
>  	base = of_iomap(np, 0);
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 99cff1fd108b..e6f05709d8c2 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -270,9 +270,9 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  	clks = clk_hw_data->hws;
>  
>  	clks[IMX93_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	clks[IMX93_CLK_24M] = imx_obtain_fixed_clk_hw(np, "osc_24m");
> -	clks[IMX93_CLK_32K] = imx_obtain_fixed_clk_hw(np, "osc_32k");
> -	clks[IMX93_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
> +	clks[IMX93_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> +	clks[IMX93_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	clks[IMX93_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
>  
>  	clks[IMX93_CLK_SYS_PLL_PFD0] = imx_clk_hw_fixed("sys_pll_pfd0", 1000000000);
>  	clks[IMX93_CLK_SYS_PLL_PFD0_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd0_div2",
> diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
> index 9539d35588ee..d7c978b63ed5 100644
> --- a/drivers/clk/imx/clk-imxrt1050.c
> +++ b/drivers/clk/imx/clk-imxrt1050.c
> @@ -50,7 +50,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
>  	clk_hw_data->num = IMXRT1050_CLK_END;
>  	hws = clk_hw_data->hws;
>  
> -	hws[IMXRT1050_CLK_OSC] = imx_obtain_fixed_clk_hw(np, "osc");
> +	hws[IMXRT1050_CLK_OSC] = imx_get_clk_hw_by_name(np, "osc");
>  
>  	anp = of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
>  	pll_base = of_iomap(anp, 0);
> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index 5582f18dd632..b636cc099d96 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -110,8 +110,7 @@ struct clk_hw *imx_obtain_fixed_clock_hw(
>  	return __clk_get_hw(clk);
>  }
>  
> -struct clk_hw * imx_obtain_fixed_clk_hw(struct device_node *np,
> -					const char *name)
> +struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
>  {
>  	struct clk *clk;
>  
> @@ -121,7 +120,7 @@ struct clk_hw * imx_obtain_fixed_clk_hw(struct device_node *np,
>  
>  	return __clk_get_hw(clk);
>  }
> -EXPORT_SYMBOL_GPL(imx_obtain_fixed_clk_hw);
> +EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
>  
>  /*
>   * This fixups the register CCM_CSCMR1 write value.
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index dd49f90110e8..689b3ad927c0 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -288,8 +288,7 @@ struct clk * imx_obtain_fixed_clock(
>  struct clk_hw *imx_obtain_fixed_clock_hw(
>  			const char *name, unsigned long rate);
>  
> -struct clk_hw *imx_obtain_fixed_clk_hw(struct device_node *np,
> -				       const char *name);
> +struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name);
>  
>  struct clk_hw *imx_clk_hw_gate_exclusive(const char *name, const char *parent,
>  	 void __iomem *reg, u8 shift, u32 exclusive_mask);
> -- 
> 2.32.0
> 

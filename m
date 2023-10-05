Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E13B7BA853
	for <lists+linux-clk@lfdr.de>; Thu,  5 Oct 2023 19:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjJERow (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 Oct 2023 13:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjJERoN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 13:44:13 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77072D6D
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 10:43:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c6193d6bb4so17685ad.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527816; x=1697132616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60HdR/gjr+ClSlC+M7zPKhkatv0oHCCn87pO3lsKx5I=;
        b=2kMeOCROZSDaKRqT/YRB/99dYfBtETGNk42W0nOQfNqBu7zym29q01v5TGveFeK2sG
         tsxKoWG4eYvIceAqXqSNlH28eEM+tk43ICp/KxTVYNEUiYCDW0Oj18yGMrmhqa3OHs/0
         LS1NMUnyOcT77hKOGgV9KVsCOOw66A/RUagsTe4JLoSi4SLt3IOEeYdG40/KLRjIZV2j
         99Po5JbNtLjJH2HEgou9qpJMbAqUz5wtb82XrnEFoY8mQxIsgz6pTJkp23PplnYQgziV
         3f4c6i+EftLKmID0DtaBeNi7fF/CcW6RkPszTaFyIiZqYbQMRPsY6B6X/kMsIF1ou7JK
         2PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527816; x=1697132616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60HdR/gjr+ClSlC+M7zPKhkatv0oHCCn87pO3lsKx5I=;
        b=iN6y+eZwFGDACyhOAGiZblQOH9bmDvEys3pufM+D8ephzuQwxXspBBbXK4vIgTGtpQ
         h8z2BEnuAvRMDFytZqbgbepMpFFjMGvGTNgv4Xg+QEPPlra/WTvf7beapGLjXkxTJ4MG
         I/yaCoilXByDfQFwx3gquaqMrGttMWSi5Ht/sN2o+BhohidZ85RcGk/1GbwBet0jN2su
         123hnNJCyiQmpou6NjUfWPw5XTTlTDRUDkZTjYhCjiJ+ppJTs2AiNyBiGX1+pGnG4Arw
         y0aCqyX0SVtR1fPvzb/JXsOjCJ5RtCLxYDQKquj26QRbtaC0D75iDmr8pBrG4SlM6GW6
         /xng==
X-Gm-Message-State: AOJu0Yx3Jtl7/F8NDpagXC4sCkS2En+9EWzDB76sni3AfDOlSSaqHVUB
        mXNuXI5uMOD3xGWf/3BQQUZF1g==
X-Google-Smtp-Source: AGHT+IHkEphjNPyY0Ba9advfXP+UTZ/LmV0S52IPUtK95qHYj4uqa58dO6ukXUIyOrQzBy4kgUBmhg==
X-Received: by 2002:a17:902:c794:b0:1c3:3649:1f6a with SMTP id w20-20020a170902c79400b001c336491f6amr164574pla.7.1696527815616;
        Thu, 05 Oct 2023 10:43:35 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id e8-20020a62ee08000000b00690fe1c928csm1702957pfi.147.2023.10.05.10.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:43:34 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:43:31 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 14/21] clk: samsung: clk-gs101: add CMU_APM support
Message-ID: <ZR71w7r4kubJ_Ow4@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-15-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-15-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
> This patch adds all the registers for the APM clock controller unit.
> 
> We register all the muxes and dividers, but only a few of the
> gates currently for PMU and GPIO.
> 
> One clock is marked CLK_IS_CRITICAL because the system
> hangs is this clock is disabled.

nit: hangs if this clock...

Regards,
Will

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-gs101.c | 300 ++++++++++++++++++++++++++++++++
>  1 file changed, 300 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 4c58fcc899be..b98b42f54949 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -19,6 +19,7 @@
>  
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define TOP_NR_CLK                     (CLK_GOUT_CMU_BOOST + 1)
> +#define APM_NR_CLK                     (CLK_APM_PLL_DIV16_APM + 1)
>  
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
> @@ -1556,3 +1557,302 @@ static void __init gs101_cmu_top_init(struct device_node *np)
>  /* Register CMU_TOP early, as it's a dependency for other early domains */
>  CLK_OF_DECLARE(gs101_cmu_top, "google,gs101-cmu-top",
>  	       gs101_cmu_top_init);
> +
> +/* ---- CMU_APM ------------------------------------------------------------- */
> +/* Register Offset definitions for CMU_APM (0x17400000) */
> +#define APM_CMU_APM_CONTROLLER_OPTION							0x0800
> +#define CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0						0x0810
> +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNC							0x1000
> +#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC						0x1004
> +#define CLK_CON_DIV_DIV_CLK_APM_BOOST							0x1800
> +#define CLK_CON_DIV_DIV_CLK_APM_USI0_UART						0x1804
> +#define CLK_CON_DIV_DIV_CLK_APM_USI0_USI						0x1808
> +#define CLK_CON_DIV_DIV_CLK_APM_USI1_UART						0x180c
> +#define CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK				0x2000
> +#define CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1						0x2004
> +#define CLK_CON_GAT_CLK_CMU_BOOST_OPTION1						0x2008
> +#define CLK_CON_GAT_CLK_CORE_BOOST_OPTION1						0x200c
> +#define CLK_CON_GAT_GATE_CLKCMU_APM_FUNC						0x2010
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK			0x2014
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK		0x2018
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK			0x201c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK				0x2020
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK				0x2024
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK			0x2028
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK			0x202c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK			0x2030
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK			0x2034
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK			0x2038
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK			0x203c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK				0x2040
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK				0x2044
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK			0x2048
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK				0x204c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK				0x2050
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK			0x2054
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK			0x2058
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK			0x205c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK			0x2060
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK			0x2064
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK		0x2068
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK			0x206c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK			0x2070
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK			0x2074
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK			0x207c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK			0x2080
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK			0x2084
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK			0x2088
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK			0x208c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK			0x2090
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK			0x2094
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK			0x2098
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK		0x209c
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK		0x20a0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK		0x20a4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK				0x20a8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK			0x20ac
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK				0x20b0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK				0x20b4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK			0x20b8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK			0x20bc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK	0x20c0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2			0x20c4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK				0x20cc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK				0x20d0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK				0x20d4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK			0x20d8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK			0x20dc
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK				0x20e0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK				0x20e4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK			0x20e8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK			0x20ec
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK				0x20f0
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK				0x20f4
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK				0x20f8
> +#define CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK				0x20fc
> +#define PCH_CON_LHM_AXI_G_SWD_PCH			0x3000
> +#define PCH_CON_LHM_AXI_P_AOCAPM_PCH			0x3004
> +#define PCH_CON_LHM_AXI_P_APM_PCH			0x3008
> +#define PCH_CON_LHS_AXI_D_APM_PCH			0x300c
> +#define PCH_CON_LHS_AXI_G_DBGCORE_PCH			0x3010
> +#define PCH_CON_LHS_AXI_G_SCAN2DRAM_PCH			0x3014
> +#define QCH_CON_APBIF_GPIO_ALIVE_QCH			0x3018
> +#define QCH_CON_APBIF_GPIO_FAR_ALIVE_QCH		0x301c
> +#define QCH_CON_APBIF_PMU_ALIVE_QCH			0x3020
> +#define QCH_CON_APBIF_RTC_QCH				0x3024
> +#define QCH_CON_APBIF_TRTC_QCH				0x3028
> +#define QCH_CON_APM_CMU_APM_QCH				0x302c
> +#define QCH_CON_APM_USI0_UART_QCH			0x3030
> +#define QCH_CON_APM_USI0_USI_QCH			0x3034
> +#define QCH_CON_APM_USI1_UART_QCH			0x3038
> +#define QCH_CON_D_TZPC_APM_QCH				0x303c
> +#define QCH_CON_GPC_APM_QCH				0x3040
> +#define QCH_CON_GREBEINTEGRATION_QCH_DBG		0x3044
> +#define QCH_CON_GREBEINTEGRATION_QCH_GREBE		0x3048
> +#define QCH_CON_INTMEM_QCH				0x304c
> +#define QCH_CON_LHM_AXI_G_SWD_QCH			0x3050
> +#define QCH_CON_LHM_AXI_P_AOCAPM_QCH			0x3054
> +#define QCH_CON_LHM_AXI_P_APM_QCH			0x3058
> +#define QCH_CON_LHS_AXI_D_APM_QCH			0x305c
> +#define QCH_CON_LHS_AXI_G_DBGCORE_QCH			0x3060
> +#define QCH_CON_LHS_AXI_G_SCAN2DRAM_QCH			0x3064
> +#define QCH_CON_MAILBOX_APM_AOC_QCH			0x3068
> +#define QCH_CON_MAILBOX_APM_AP_QCH			0x306c
> +#define QCH_CON_MAILBOX_APM_GSA_QCH			0x3070
> +#define QCH_CON_MAILBOX_APM_SWD_QCH			0x3078
> +#define QCH_CON_MAILBOX_APM_TPU_QCH			0x307c
> +#define QCH_CON_MAILBOX_AP_AOC_QCH			0x3080
> +#define QCH_CON_MAILBOX_AP_DBGCORE_QCH			0x3084
> +#define QCH_CON_PMU_INTR_GEN_QCH			0x3088
> +#define QCH_CON_ROM_CRC32_HOST_QCH			0x308c
> +#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE		0x3090
> +#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE_DBG	0x3094
> +#define QCH_CON_SPEEDY_APM_QCH				0x3098
> +#define QCH_CON_SPEEDY_SUB_APM_QCH			0x309c
> +#define QCH_CON_SSMT_D_APM_QCH				0x30a0
> +#define QCH_CON_SSMT_G_DBGCORE_QCH			0x30a4
> +#define QCH_CON_SS_DBGCORE_QCH_DBG			0x30a8
> +#define QCH_CON_SS_DBGCORE_QCH_GREBE			0x30ac
> +#define QCH_CON_SYSMMU_D_APM_QCH			0x30b0
> +#define QCH_CON_SYSREG_APM_QCH				0x30b8
> +#define QCH_CON_UASC_APM_QCH				0x30bc
> +#define QCH_CON_UASC_DBGCORE_QCH			0x30c0
> +#define QCH_CON_UASC_G_SWD_QCH				0x30c4
> +#define QCH_CON_UASC_P_AOCAPM_QCH			0x30c8
> +#define QCH_CON_UASC_P_APM_QCH				0x30cc
> +#define QCH_CON_WDT_APM_QCH				0x30d0
> +#define QUEUE_CTRL_REG_BLK_APM_CMU_APM			0x3c00
> +
> +static const unsigned long apm_clk_regs[] __initconst = {
> +	APM_CMU_APM_CONTROLLER_OPTION,
> +	CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0,
> +	CLK_CON_MUX_MUX_CLKCMU_APM_FUNC,
> +	CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC,
> +	CLK_CON_DIV_DIV_CLK_APM_BOOST,
> +	CLK_CON_DIV_DIV_CLK_APM_USI0_UART,
> +	CLK_CON_DIV_DIV_CLK_APM_USI0_USI,
> +	CLK_CON_DIV_DIV_CLK_APM_USI1_UART,
> +	CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1,
> +	CLK_CON_GAT_CLK_CMU_BOOST_OPTION1,
> +	CLK_CON_GAT_CLK_CORE_BOOST_OPTION1,
> +	CLK_CON_GAT_GATE_CLKCMU_APM_FUNC,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK,
> +};
> +
> +PNAME(mout_apm_func_p)	= { "oscclk_apm", "mout_apm_funcsrc", "pad_clk_apm", "oscclk_apm" };
> +PNAME(mout_apm_funcsrc_p) = { "pll_alv_div2_apm", "pll_alv_div4_apm", "pll_alv_div16_apm" };
> +
> +static const struct samsung_fixed_rate_clock apm_fixed_clks[] __initconst = {
> +	FRATE(CLK_APM_PLL_DIV2_APM, "clk_apm_pll_div2_apm", NULL, 0, 393216000),
> +	FRATE(CLK_APM_PLL_DIV4_APM, "clk_apm_pll_div4_apm", NULL, 0, 196608000),
> +	FRATE(CLK_APM_PLL_DIV16_APM, "clk_apm_pll_div16_apm", NULL, 0, 49152000),
> +};
> +
> +static const struct samsung_mux_clock apm_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_APM_FUNC, "mout_apm_func", mout_apm_func_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_APM_FUNC, 4, 1),
> +	MUX(CLK_MOUT_APM_FUNCSRC, "mout_apm_funcsrc", mout_apm_funcsrc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC, 3, 1),
> +};
> +
> +static const struct samsung_div_clock apm_div_clks[] __initconst = {
> +	DIV(CLK_DOUT_APM_BOOST, "dout_apm_boost", "gout_apm_func",
> +	    CLK_CON_DIV_DIV_CLK_APM_BOOST, 0, 1),
> +	DIV(CLK_DOUT_APM_USI0_UART, "dout_apm_usi0_uart", "gout_apm_func",
> +	    CLK_CON_DIV_DIV_CLK_APM_USI0_UART, 0, 7),
> +	DIV(CLK_DOUT_APM_USI0_USI, "dout_apm_usi0_usi", "gout_apm_func",
> +	    CLK_CON_DIV_DIV_CLK_APM_USI0_USI, 0, 7),
> +	DIV(CLK_DOUT_APM_USI1_UART, "dout_apm_usi1_uart", "gout_apm_func",
> +	    CLK_CON_DIV_DIV_CLK_APM_USI1_UART, 0, 7),
> +};
> +
> +static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_APM_FUNC, "gout_apm_func", "mout_apm_func",
> +	     CLK_CON_GAT_GATE_CLKCMU_APM_FUNC, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
> +	     "gout_apm_gpio_alive_ipclkport_pclk", "gout_apm_func",
> +	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +	GATE(CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
> +	     "gout_apm_gpio_far_alive_ipclkport_pclk", "gout_apm_func",
> +	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +	GATE(CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +	     "gout_apm_pmu_alive_ipclkport_pclk", "gout_apm_func",
> +	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
> +	     21, CLK_IS_CRITICAL, 0),
> +
> +	GATE(CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +	     "gout_apm_sysreg_apm_ipclkport_pclk", "gout_apm_func",
> +	     CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info apm_cmu_info __initconst = {
> +	.mux_clks		= apm_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
> +	.div_clks		= apm_div_clks,
> +	.nr_div_clks		= ARRAY_SIZE(apm_div_clks),
> +	.gate_clks		= apm_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(apm_gate_clks),
> +	.fixed_clks		= apm_fixed_clks,
> +	.nr_fixed_clks		= ARRAY_SIZE(apm_fixed_clks),
> +	.nr_clk_ids		= APM_NR_CLK,
> +	.clk_regs		= apm_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
> +};
> +
> +/* ---- platform_driver ----------------------------------------------------- */
> +
> +static int __init gs101_cmu_probe(struct platform_device *pdev)
> +{
> +	const struct samsung_cmu_info *info;
> +	struct device *dev = &pdev->dev;
> +
> +	info = of_device_get_match_data(dev);
> +	exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id gs101_cmu_of_match[] = {
> +	{
> +		.compatible = "google,gs101-cmu-apm",
> +		.data = &apm_cmu_info,
> +	},
> +};
> +
> +static struct platform_driver gs101_cmu_driver __refdata = {
> +	.driver	= {
> +		.name = "gs101-cmu",
> +		.of_match_table = gs101_cmu_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = gs101_cmu_probe,
> +};
> +
> +static int __init gs101_cmu_init(void)
> +{
> +	return platform_driver_register(&gs101_cmu_driver);
> +}
> +core_initcall(gs101_cmu_init);
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619D1479121
	for <lists+linux-clk@lfdr.de>; Fri, 17 Dec 2021 17:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbhLQQP7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Dec 2021 11:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbhLQQP4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 11:15:56 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD734C061401
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:55 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id p8so4157467ljo.5
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hbVunj4DiulOq72QGN7i8jgBynbdYLJAfBOBvJBQ35Q=;
        b=H1MZhGpjstB+rzzDzsZ2KveQtYR5ZqwtjjTv8AS1hZ+72PwQf2I6tT4QBp4hQ25mJW
         eW4esGPaqbFomtsHUprp4MddWgNJutpqBjudJXzcmoQeWGvOVw5UzOzMSwnAM9t+meY4
         6mCi/bEY//i1JgumFE5pejuy9SDdDqmMCFbOGnEQL33v2+BJVVqPRDwWkIuSGwk3aynq
         FcvGU7ekISZSTERf3ccWWG8IgrO2pkqqEN1qqhGul6a7Dq/z/xlp+4WDi/M0gYoQJq5s
         UwpMa3xR9hD9AWUu7wKEzGRFN79wMN+NTeY2uNeTRuYcVmhvQEC5skguaz2ih6HoVvSS
         Vwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbVunj4DiulOq72QGN7i8jgBynbdYLJAfBOBvJBQ35Q=;
        b=fb3tOuRlN9oaK0QWbQ1Sp7qpNcIEDodvjnd2pWy6+aIiRL9BeRz7FtYcRM2Sv75TEh
         9Qsow4Nni/NEjxtoQqhzldyZR1dfLA6LG31uBhVnSz4fb0wmBpruF8Yu8BQGMOq8qwfL
         MhdkMv6+KlzzGP4fuUwGcJasZUdwkxyLsrFM/lNZgb6sYX1fLcO1c1/7ZeUbB2wK+3S0
         OoRYyX2rDJ8YPar3QY35Ce8Yid+AfLAk8/Mo8d/9ip7wG18jbiJEhM+ChOa2QFc8fDeF
         9NH+U7CqV1c0lm8dzUtCqqC8Y5NPWpx4P2Gm67PVDxVx2MCYJzUX6FoDNL8Foi9r4sC4
         qQ0A==
X-Gm-Message-State: AOAM532BuMT+Gyho5zCxCA7Etzlo9CwQDFxeN3mWGr/NW5w1mqtZk9TV
        tgDLHmfUWV4kqHll7a9PJ7LwLA==
X-Google-Smtp-Source: ABdhPJwdsp4C+V+qaI5f6pfgtX4o7+noH34MrZahp923g2BZtVAVdiQWDRr464PahZmJI8kLhrWUQQ==
X-Received: by 2002:a2e:a7c6:: with SMTP id x6mr3411560ljp.328.1639757753939;
        Fri, 17 Dec 2021 08:15:53 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 15sm1732114ljs.68.2021.12.17.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:53 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 2/7] clk: samsung: exynos850: Add missing sysreg clocks
Date:   Fri, 17 Dec 2021 18:15:44 +0200
Message-Id: <20211217161549.24836-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217161549.24836-1-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

System Register is used to configure system behavior, like USI protocol,
etc. SYSREG clocks should be provided to corresponding syscon nodes, to
make it possible to modify SYSREG registers.

While at it, add also missing PMU and GPIO clocks, which looks necessary
and might be needed for corresponding Exynos850 features soon.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - (none)

Changes in v3:
  - (none)

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Chanwoo Choi

 drivers/clk/samsung/clk-exynos850.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 568ac97c8120..4799771d09bc 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -426,11 +426,14 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_DIV_DIV_CLK_APM_I3C			0x1808
 #define CLK_CON_GAT_CLKCMU_CMGP_BUS			0x2000
 #define CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS		0x2014
+#define CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK	0x2018
+#define CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK	0x2020
 #define CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK		0x2024
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
+#define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
 static const unsigned long apm_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_APM_BUS_USER,
@@ -445,11 +448,14 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_APM_I3C,
 	CLK_CON_GAT_CLKCMU_CMGP_BUS,
 	CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS,
+	CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK,
+	CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK,
 	CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK,
 	CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK,
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK,
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -512,6 +518,14 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
 	GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
+	GATE(CLK_GOUT_GPIO_ALIVE_PCLK, "gout_gpio_alive_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, 21, CLK_IGNORE_UNUSED,
+	     0),
+	GATE(CLK_GOUT_PMU_ALIVE_PCLK, "gout_pmu_alive_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
@@ -541,6 +555,7 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0	0x200c
 #define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1	0x2010
 #define CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK		0x2018
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK	0x2040
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK	0x2044
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK	0x2048
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK	0x204c
@@ -556,6 +571,7 @@ static const unsigned long cmgp_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0,
 	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1,
 	CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK,
+	CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK,
@@ -610,6 +626,9 @@ static const struct samsung_gate_clock cmgp_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMGP_USI1_PCLK, "gout_cmgp_usi1_pclk",
 	     "gout_clkcmu_cmgp_bus",
 	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_CMGP_PCLK, "gout_sysreg_cmgp_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info cmgp_cmu_info __initconst = {
@@ -910,10 +929,12 @@ CLK_OF_DECLARE(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
 #define CLK_CON_DIV_DIV_CLK_CORE_BUSP		0x1800
 #define CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK	0x2038
 #define CLK_CON_GAT_GOUT_CORE_GIC_CLK		0x2040
+#define CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK	0x2044
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK	0x20e8
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN	0x20ec
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK	0x2128
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK	0x212c
+#define CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK	0x2130
 
 static const unsigned long core_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_CORE_BUS_USER,
@@ -924,10 +945,12 @@ static const unsigned long core_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_CORE_BUSP,
 	CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK,
 	CLK_CON_GAT_GOUT_CORE_GIC_CLK,
+	CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK,
+	CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_CORE */
@@ -972,6 +995,12 @@ static const struct samsung_gate_clock core_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_SSS_PCLK, "gout_sss_pclk", "dout_core_busp",
 	     CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
+	GATE(CLK_GOUT_GPIO_CORE_PCLK, "gout_gpio_core_pclk", "dout_core_busp",
+	     CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_SYSREG_CORE_PCLK, "gout_sysreg_core_pclk",
+	     "dout_core_busp",
+	     CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info core_cmu_info __initconst = {
-- 
2.30.2


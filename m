Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D0D478213
	for <lists+linux-clk@lfdr.de>; Fri, 17 Dec 2021 02:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhLQBaO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Dec 2021 20:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbhLQBaM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:30:12 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6607C06173E
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:11 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b40so1395749lfv.10
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98PAWc8ZdI2xzC4LGhMSScultFDMf1VAkK4DgSJyrwM=;
        b=BuOpZZNA9gcaAihHRp+Cc5mu89v+LqENVDYIeOcaZQVBQ9y2DSni1V8sN6xXUWWk8M
         kHIYjvQSIjGDKVUlZTfNyvS8UsKuUC216HhZBSs/5d8y9x4B79xcTxkR9R+d2UGO4wCD
         19UmKrZ0UiHNzXo95GMJZrUniTR1pfDjI42Ndsb7eCGmxtr2AXccG3eEv9TSznqCEDFI
         01+mG77i/wEB1T4CMMRWomax/hIJe+yDIIjCsA0peoZLRioDChV8I1rvyuSy9AAyCMj9
         oceAGzTTfYC1E0L53WcQfG1eeHyy9fCmmMGAWVK4XDrXHmkMmxEHKBE14BzPU5moacyS
         nRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98PAWc8ZdI2xzC4LGhMSScultFDMf1VAkK4DgSJyrwM=;
        b=ZVEBFu7+OYl+oSssP/9GDN3Fm8SMg6AnOSAboTEKCSAkXXPMO3mPjTrzW36wEXw3qE
         /b7uUb4cZ3EMzRjsgShbpTYtcijISKBLKyDDP7fS6IU6fN3m7S0Q+dpXzv52dqwcDwrA
         qlT7hnucIFyCwpGGHo6f3fpcb1Yk5ME6EvYDF+KuL7bevlf7uzhNh+za2c4P5sxxHDNY
         KgWQygTafSGkjKz93OygsLICpyfYTyLNN7o0kpm427UU3/860O1RyEITiYpkMAkfN3O7
         yTEyo+HdNbz5AcF8IUYO5NZG9MNu75iYvwV6pWSIB1l7g/NgEhfyS7YUOR/HOeh6tlnG
         PhHA==
X-Gm-Message-State: AOAM533G4H19aZT3XSMUjC36u5VKdKdVLl/fnaGoDcEP1UwtK326f1tQ
        v3UMCPZFlQdX1mFql07no6yK1A==
X-Google-Smtp-Source: ABdhPJwj/airpLTMzGUwmS280aFNcFOcq+uNf5nTr9YyY1scbBl0uFgdVLgrVw4jdHJ/wU2RMMSB/A==
X-Received: by 2002:a05:6512:1151:: with SMTP id m17mr835116lfg.154.1639704609955;
        Thu, 16 Dec 2021 17:30:09 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bp15sm1134512lfb.176.2021.12.16.17.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:09 -0800 (PST)
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
Subject: [PATCH v2 2/7] clk: samsung: exynos850: Add missing sysreg clocks
Date:   Fri, 17 Dec 2021 03:30:00 +0200
Message-Id: <20211217013005.16646-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217013005.16646-1-semen.protsenko@linaro.org>
References: <20211217013005.16646-1-semen.protsenko@linaro.org>
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


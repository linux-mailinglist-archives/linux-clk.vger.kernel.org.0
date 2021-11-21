Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A296D458725
	for <lists+linux-clk@lfdr.de>; Mon, 22 Nov 2021 00:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbhKUXbG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 21 Nov 2021 18:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbhKUXbC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Nov 2021 18:31:02 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C050AC0613E0
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 15:27:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k37so72321869lfv.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 15:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6aqpdUn2ADmAje4X3NYNku5B4XO9mUxiC98/Xj1uCXg=;
        b=vpJc6TLBfNnEFinKdNtG8MKQSF+JD1sNhlYhlunu3mk0YFsKMbPc/rPmDVXqQrHU2C
         lD2wx3/ZKq9UdyxV5vVPbBCm/C/KIphlIUA2loHUAgLTeQrIxQHt9cGZVigM/D3grRFO
         wUps0JEOEzGpQdUEWCDryN9TQWzKkvrwFzYjEdXolKEAnR96frGJz/kgp/lmeC/+RFwK
         dALpG1m65xJX7zhVghz/DeLHUKZiLoAab4RLlDnUmAWLS+OYK3rrTLCxRepv9hIfajPI
         uF1xZ3aj3XWejROFYTr0/BN1A/ZImsn7d8c7Q94T0njqfB9YYbAq/af+kOKxaU8IRd63
         K2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6aqpdUn2ADmAje4X3NYNku5B4XO9mUxiC98/Xj1uCXg=;
        b=e/3O8bQTlaagCTyCrO45nzLXFmm3IYcKCESXWqguNbWeH93cjgxmkrx4F2WYhTSuSl
         2jKr/aQ7U2LDd1kqAy3tl/bzu9L+I/3cLpxOb7uwG490w2hHc86+p2HW3qEoCjwhn5SH
         wWh0gg3Y7Ms8DF8YaRblTnVJBXBXCFen2KauKeXBKrlsyGbNIydtbFmsB+40L7KkDlhY
         tCJZQeQ8lQuMYJh+6yIidjciVwMEHpd5RR1ko8TgyaMUhWi326y6cjoqI1ZyACyaWITf
         ehPGZ6DqOuTI7PxPSguQ8Nn1LOFrJ3Dhk+T5pet1LAGeMOh/77KTYbnTOaBVz/DnhuCu
         VO+g==
X-Gm-Message-State: AOAM533ka/htfWuOibqMEfz387+e7EGcj5Q0QFn359EQD+KfdpKu4i9v
        Xda3Ewy5KzVXXbSOBKZvtQKYKw==
X-Google-Smtp-Source: ABdhPJz+S1jtyGQkCNs22HZj8wJZpFPp/LS44MVhNbn0orvX/Q2jDmdyb1HX35k+HJwKcz9RG2JgpQ==
X-Received: by 2002:a05:6512:128f:: with SMTP id u15mr52325994lfs.92.1637537273121;
        Sun, 21 Nov 2021 15:27:53 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id x6sm777498lfu.79.2021.11.21.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 15:27:52 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 6/6] clk: samsung: exynos850: Keep some crucial clocks running
Date:   Mon, 22 Nov 2021 01:27:41 +0200
Message-Id: <20211121232741.6967-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121232741.6967-1-semen.protsenko@linaro.org>
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clocks shouldn't be automatically disabled in clk_disable_unused(),
otherwise kernel hangs. Mark those clocks with:
  - CLK_IS_CRITICAL flag, when there won't be any consumers for that
    clock, but system can't function when it's gated
  - CLK_IGNORE_UNUSED flag, when consumer driver will be probably added
    later

That makes it possible to run the kernel without passing the
"clk_ignore_unused" param.

Next clocks were modified:
  - "gout_dpu_cmu_dpu_pclk":	CLK_IGNORE_UNUSED

    Will be enabled later in DSIM driver (Display Serial Interface
    Master).

  - "gout_gpio_peri_pclk":	CLK_IGNORE_UNUSED
    "gout_gpio_cmgp_pclk":	CLK_IGNORE_UNUSED
    "gout_gpio_hsi_pclk":	CLK_IGNORE_UNUSED

    Should be probably enabled in corresponding GPIO driver later, or
    made CLK_IS_CRITICAL. "gout_gpio_peri_clk" is actually used by LEDs
    on Exynos850-based dev board, so kernel hangs if this clock is not
    running. Other clocks were marked as "ignore unused" to prevent
    similar issues for other use cases or boards that might be added
    later.

  - "gout_cci_aclk":		CLK_IS_CRITICAL

    CCI (Cache Coherent Interconnect): obviously is critical.

  - "gout_gic_clk":		CLK_IS_CRITICAL

    GIC (Generic Interrupt Controller): obviously is critical.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 1d257bca8b37..c885ffb1aa24 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -596,9 +596,10 @@ static const struct samsung_gate_clock cmgp_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMGP_ADC_S1_PCLK, "gout_adc_s1_pclk",
 	     "gout_clkcmu_cmgp_bus",
 	     CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
 	GATE(CLK_GOUT_CMGP_GPIO_PCLK, "gout_gpio_cmgp_pclk",
 	     "gout_clkcmu_cmgp_bus",
-	     CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_CMGP_USI0_IPCLK, "gout_cmgp_usi0_ipclk", "dout_cmgp_usi0",
 	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK, 21, 0, 0),
 	GATE(CLK_GOUT_CMGP_USI0_PCLK, "gout_cmgp_usi0_pclk",
@@ -685,8 +686,9 @@ static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
 	     CLK_CON_GAT_HSI_USB20DRD_TOP_I_REF_CLK_50, 21, 0, 0),
 	GATE(CLK_GOUT_USB_PHY_REF_CLK, "gout_usb_phy_ref", "oscclk",
 	     CLK_CON_GAT_HSI_USB20DRD_TOP_I_PHY_REFCLK_26, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
 	GATE(CLK_GOUT_GPIO_HSI_PCLK, "gout_gpio_hsi_pclk", "mout_hsi_bus_user",
-	     CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_MMC_CARD_ACLK, "gout_mmc_card_aclk", "mout_hsi_bus_user",
 	     CLK_CON_GAT_GOUT_HSI_MMC_CARD_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
@@ -869,9 +871,10 @@ static const struct samsung_gate_clock peri_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_PERI_WDT_0_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_WDT1_PCLK, "gout_wdt1_pclk", "mout_peri_bus_user",
 	     CLK_CON_GAT_GOUT_PERI_WDT_1_PCLK, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
 	GATE(CLK_GOUT_GPIO_PERI_PCLK, "gout_gpio_peri_pclk",
 	     "mout_peri_bus_user",
-	     CLK_CON_GAT_GOUT_PERI_GPIO_PERI_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_PERI_GPIO_PERI_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 };
 
 static const struct samsung_cmu_info peri_cmu_info __initconst = {
@@ -954,10 +957,12 @@ static const struct samsung_div_clock core_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock core_gate_clks[] __initconst = {
+	/* CCI (interconnect) clock must be always running */
 	GATE(CLK_GOUT_CCI_ACLK, "gout_cci_aclk", "mout_core_cci_user",
-	     CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK, 21, CLK_IS_CRITICAL, 0),
+	/* GIC (interrupt controller) clock must be always running */
 	GATE(CLK_GOUT_GIC_CLK, "gout_gic_clk", "mout_core_gic",
-	     CLK_CON_GAT_GOUT_CORE_GIC_CLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_CORE_GIC_CLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_MMC_EMBD_ACLK, "gout_mmc_embd_aclk", "dout_core_busp",
 	     CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_MMC_EMBD_SDCLKIN, "gout_mmc_embd_sdclkin",
@@ -1023,8 +1028,10 @@ static const struct samsung_div_clock dpu_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock dpu_gate_clks[] __initconst = {
+	/* TODO: Should be enabled in DSIM driver */
 	GATE(CLK_GOUT_DPU_CMU_DPU_PCLK, "gout_dpu_cmu_dpu_pclk",
-	     "dout_dpu_busp", CLK_CON_GAT_CLK_DPU_CMU_DPU_PCLK, 21, 0, 0),
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_CLK_DPU_CMU_DPU_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_DPU_DECON0_ACLK, "gout_dpu_decon0_aclk", "mout_dpu_user",
 	     CLK_CON_GAT_GOUT_DPU_ACLK_DECON0, 21, 0, 0),
 	GATE(CLK_GOUT_DPU_DMA_ACLK, "gout_dpu_dma_aclk", "mout_dpu_user",
-- 
2.30.2


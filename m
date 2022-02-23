Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AEE4C0DB9
	for <lists+linux-clk@lfdr.de>; Wed, 23 Feb 2022 08:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238892AbiBWH5A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 02:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238911AbiBWH4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 02:56:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4B471CBB
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:56:22 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVJ-0006yZ-3p; Wed, 23 Feb 2022 08:56:05 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVH-00FNhT-R9; Wed, 23 Feb 2022 08:56:03 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/8] clk: imx: pll14xx: Use register defines consistently
Date:   Wed, 23 Feb 2022 08:55:54 +0100
Message-Id: <20220223075601.3652543-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223075601.3652543-1-s.hauer@pengutronix.de>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver has defines for the registers, but they are mostly unused.
Use the defines consistently throughout the driver. While at it rename
DIV_CTL to DIV_CTL0 because that's the name in the reference manual.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 49 ++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 2b5ed86b9dbbb..cae64d750672e 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -15,7 +15,8 @@
 #include "clk.h"
 
 #define GNRL_CTL	0x0
-#define DIV_CTL		0x4
+#define DIV_CTL0	0x4
+#define DIV_CTL1	0x8
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -122,7 +123,7 @@ static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
 	u32 mdiv, pdiv, sdiv, pll_div;
 	u64 fvco = parent_rate;
 
-	pll_div = readl_relaxed(pll->base + 4);
+	pll_div = readl_relaxed(pll->base + DIV_CTL0);
 	mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
 	pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
 	sdiv = (pll_div & SDIV_MASK) >> SDIV_SHIFT;
@@ -141,8 +142,8 @@ static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
 	short int kdiv;
 	u64 fvco = parent_rate;
 
-	pll_div_ctl0 = readl_relaxed(pll->base + 4);
-	pll_div_ctl1 = readl_relaxed(pll->base + 8);
+	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
 	mdiv = (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
 	pdiv = (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
 	sdiv = (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
@@ -172,7 +173,7 @@ static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
 {
 	u32 val;
 
-	return readl_poll_timeout(pll->base, val, val & LOCK_STATUS, 0,
+	return readl_poll_timeout(pll->base + GNRL_CTL, val, val & LOCK_STATUS, 0,
 			LOCK_TIMEOUT_US);
 }
 
@@ -191,32 +192,32 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	tmp = readl_relaxed(pll->base + 4);
+	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
 		tmp |= rate->sdiv << SDIV_SHIFT;
-		writel_relaxed(tmp, pll->base + 4);
+		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
 		return 0;
 	}
 
 	/* Bypass clock and set lock to pll output lock */
-	tmp = readl_relaxed(pll->base);
+	tmp = readl_relaxed(pll->base + GNRL_CTL);
 	tmp |= LOCK_SEL_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	/* Enable RST */
 	tmp &= ~RST_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	/* Enable BYPASS */
 	tmp |= BYPASS_MASK;
-	writel(tmp, pll->base);
+	writel(tmp, pll->base + GNRL_CTL);
 
 	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
 		(rate->sdiv << SDIV_SHIFT);
-	writel_relaxed(div_val, pll->base + 0x4);
+	writel_relaxed(div_val, pll->base + DIV_CTL0);
 
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
@@ -228,7 +229,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Disable RST */
 	tmp |= RST_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	/* Wait Lock */
 	ret = clk_pll14xx_wait_lock(pll);
@@ -237,7 +238,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Bypass */
 	tmp &= ~BYPASS_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	return 0;
 }
@@ -257,32 +258,32 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	tmp = readl_relaxed(pll->base + 4);
+	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
 		tmp |= rate->sdiv << SDIV_SHIFT;
-		writel_relaxed(tmp, pll->base + 4);
+		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
 		tmp = rate->kdiv << KDIV_SHIFT;
-		writel_relaxed(tmp, pll->base + 8);
+		writel_relaxed(tmp, pll->base + DIV_CTL1);
 
 		return 0;
 	}
 
 	/* Enable RST */
-	tmp = readl_relaxed(pll->base);
+	tmp = readl_relaxed(pll->base + GNRL_CTL);
 	tmp &= ~RST_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	/* Enable BYPASS */
 	tmp |= BYPASS_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
 		(rate->sdiv << SDIV_SHIFT);
-	writel_relaxed(div_val, pll->base + 0x4);
-	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + 0x8);
+	writel_relaxed(div_val, pll->base + DIV_CTL0);
+	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + DIV_CTL1);
 
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
@@ -294,7 +295,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Disable RST */
 	tmp |= RST_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	/* Wait Lock*/
 	ret = clk_pll14xx_wait_lock(pll);
@@ -303,7 +304,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Bypass */
 	tmp &= ~BYPASS_MASK;
-	writel_relaxed(tmp, pll->base);
+	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
 	return 0;
 }
-- 
2.30.2


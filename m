Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0642FE3BA
	for <lists+linux-clk@lfdr.de>; Thu, 21 Jan 2021 08:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbhAUHSs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Jan 2021 02:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbhAUHST (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:18:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66C6C061793
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:02 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UL-BW; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00598e-A8; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 10/15] soc: xilinx: vcu: make the PLL configurable
Date:   Thu, 21 Jan 2021 08:16:54 +0100
Message-Id: <20210121071659.1226489-11-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121071659.1226489-1-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Do not configure the PLL when probing the driver, but register the clock
in the clock framework and do the configuration based on the respective
callbacks.

This is necessary to allow the consumers, i.e., encoder and decoder
drivers, of the xlnx_vcu clock provider to set the clock rate and
actually enable the clocks without relying on some pre-configuration.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3: none

v2:
- Remove duplicate xvcu_register_pll call
---
 drivers/soc/xilinx/xlnx_vcu.c | 140 +++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 9e410d7ffd08..7585b26ab51a 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -260,9 +260,18 @@ static void xvcu_write_field_reg(void __iomem *iomem, int offset,
 	xvcu_write(iomem, offset, val);
 }
 
-static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
+#define to_vcu_pll(_hw) container_of(_hw, struct vcu_pll, hw)
+
+struct vcu_pll {
+	struct clk_hw hw;
+	void __iomem *reg_base;
+	unsigned long fvco_min;
+	unsigned long fvco_max;
+};
+
+static int xvcu_pll_wait_for_lock(struct vcu_pll *pll)
 {
-	void __iomem *base = xvcu->vcu_slcr_ba;
+	void __iomem *base = pll->reg_base;
 	unsigned long timeout;
 	u32 lock_status;
 
@@ -311,9 +320,9 @@ static const struct xvcu_pll_cfg *xvcu_find_cfg(int div)
 	return cfg;
 }
 
-static int xvcu_pll_set_div(struct xvcu_device *xvcu, int div)
+static int xvcu_pll_set_div(struct vcu_pll *pll, int div)
 {
-	void __iomem *base = xvcu->vcu_slcr_ba;
+	void __iomem *base = pll->reg_base;
 	const struct xvcu_pll_cfg *cfg = NULL;
 	u32 vcu_pll_ctrl;
 	u32 cfg_val;
@@ -338,24 +347,49 @@ static int xvcu_pll_set_div(struct xvcu_device *xvcu, int div)
 	return 0;
 }
 
-static int xvcu_pll_set_rate(struct xvcu_device *xvcu,
+static long xvcu_pll_round_rate(struct clk_hw *hw,
+				unsigned long rate, unsigned long *parent_rate)
+{
+	struct vcu_pll *pll = to_vcu_pll(hw);
+	unsigned int feedback_div;
+
+	rate = clamp_t(unsigned long, rate, pll->fvco_min, pll->fvco_max);
+
+	feedback_div = DIV_ROUND_CLOSEST_ULL(rate, *parent_rate);
+	feedback_div = clamp_t(unsigned int, feedback_div, 25, 125);
+
+	return *parent_rate * feedback_div;
+}
+
+static unsigned long xvcu_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct vcu_pll *pll = to_vcu_pll(hw);
+	void __iomem *base = pll->reg_base;
+	unsigned int div;
+	u32 vcu_pll_ctrl;
+
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	div = (vcu_pll_ctrl >> VCU_PLL_CTRL_FBDIV_SHIFT) & VCU_PLL_CTRL_FBDIV_MASK;
+
+	return div * parent_rate;
+}
+
+static int xvcu_pll_set_rate(struct clk_hw *hw,
 			     unsigned long rate, unsigned long parent_rate)
 {
-	return xvcu_pll_set_div(xvcu, rate / parent_rate);
+	struct vcu_pll *pll = to_vcu_pll(hw);
+
+	return xvcu_pll_set_div(pll, rate / parent_rate);
 }
 
-static int xvcu_pll_enable(struct xvcu_device *xvcu)
+static int xvcu_pll_enable(struct clk_hw *hw)
 {
-	void __iomem *base = xvcu->vcu_slcr_ba;
+	struct vcu_pll *pll = to_vcu_pll(hw);
+	void __iomem *base = pll->reg_base;
 	u32 vcu_pll_ctrl;
 	int ret;
 
-	ret = clk_prepare_enable(xvcu->pll_ref);
-	if (ret) {
-		dev_err(xvcu->dev, "failed to enable pll_ref clock source\n");
-		return ret;
-	}
-
 	xvcu_write_field_reg(base, VCU_PLL_CTRL,
 			     1, VCU_PLL_CTRL_BYPASS_MASK,
 			     VCU_PLL_CTRL_BYPASS_SHIFT);
@@ -375,9 +409,9 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 	vcu_pll_ctrl |= (0 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
-	ret = xvcu_pll_wait_for_lock(xvcu);
+	ret = xvcu_pll_wait_for_lock(pll);
 	if (ret) {
-		dev_err(xvcu->dev, "PLL is not locked\n");
+		pr_err("VCU PLL is not locked\n");
 		goto err;
 	}
 
@@ -385,15 +419,14 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 			     0, VCU_PLL_CTRL_BYPASS_MASK,
 			     VCU_PLL_CTRL_BYPASS_SHIFT);
 
-	return ret;
 err:
-	clk_disable_unprepare(xvcu->pll_ref);
 	return ret;
 }
 
-static void xvcu_pll_disable(struct xvcu_device *xvcu)
+static void xvcu_pll_disable(struct clk_hw *hw)
 {
-	void __iomem *base = xvcu->vcu_slcr_ba;
+	struct vcu_pll *pll = to_vcu_pll(hw);
+	void __iomem *base = pll->reg_base;
 	u32 vcu_pll_ctrl;
 
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
@@ -404,8 +437,49 @@ static void xvcu_pll_disable(struct xvcu_device *xvcu)
 	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
 	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
+}
+
+static const struct clk_ops vcu_pll_ops = {
+	.enable = xvcu_pll_enable,
+	.disable = xvcu_pll_disable,
+	.round_rate = xvcu_pll_round_rate,
+	.recalc_rate = xvcu_pll_recalc_rate,
+	.set_rate = xvcu_pll_set_rate,
+};
 
-	clk_disable_unprepare(xvcu->pll_ref);
+static struct clk_hw *xvcu_register_pll(struct device *dev,
+					void __iomem *reg_base,
+					const char *name, const char *parent,
+					unsigned long flags)
+{
+	struct vcu_pll *pll;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	init.name = name;
+	init.parent_names = &parent;
+	init.ops = &vcu_pll_ops;
+	init.num_parents = 1;
+	init.flags = flags;
+
+	pll = devm_kmalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	pll->hw.init = &init;
+	pll->reg_base = reg_base;
+	pll->fvco_min = FVCO_MIN;
+	pll->fvco_max = FVCO_MAX;
+
+	hw = &pll->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	clk_hw_set_rate_range(hw, pll->fvco_min, pll->fvco_max);
+
+	return hw;
 }
 
 /**
@@ -430,9 +504,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	u32 pll_clk;
 	u32 mod;
 	int i;
-	int ret;
 	const struct xvcu_pll_cfg *found = NULL;
-	struct clk_hw *hw;
 
 	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK, &inte);
 	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK_DEC, &deci);
@@ -490,17 +562,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
 
-	ret = xvcu_pll_set_rate(xvcu, fvco, refclk);
-	if (ret)
-		return ret;
-
-	hw = clk_hw_register_fixed_rate(xvcu->dev, "vcu_pll",
-					__clk_get_name(xvcu->pll_ref),
-					0, fvco);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	xvcu->pll = hw;
-
 	return 0;
 }
 
@@ -523,7 +584,7 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 		return ret;
 	}
 
-	return xvcu_pll_enable(xvcu);
+	return 0;
 }
 
 static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
@@ -630,6 +691,13 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 
 	xvcu->clk_data = data;
 
+	hw = xvcu_register_pll(dev, reg_base,
+			       "vcu_pll", __clk_get_name(xvcu->pll_ref),
+			       CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	xvcu->pll = hw;
+
 	hw = xvcu_register_pll_post(dev, "vcu_pll_post", xvcu->pll, reg_base);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
@@ -811,8 +879,6 @@ static int xvcu_remove(struct platform_device *pdev)
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
-	clk_hw_unregister_fixed_rate(xvcu->pll);
-	xvcu_pll_disable(xvcu);
 	clk_disable_unprepare(xvcu->aclk);
 
 	return 0;
-- 
2.20.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254B72DFD38
	for <lists+linux-clk@lfdr.de>; Mon, 21 Dec 2020 16:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgLUPH0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Dec 2020 10:07:26 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56787 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgLUPH0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:26 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMll-0007Vo-1O; Mon, 21 Dec 2020 16:06:41 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbC-Pm; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 05/15] soc: xilinx: vcu: add helpers for configuring PLL
Date:   Mon, 21 Dec 2020 16:06:24 +0100
Message-Id: <20201221150634.755673-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221150634.755673-1-m.tretter@pengutronix.de>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The xvcu_set_vcu_pll_info function sets the rate of the PLL and enables
it, which makes it difficult to cleanly convert the driver to the common
clock framework.

Split the function and add separate functions for setting the rate,
enabling the clock and disabling the clock.

Also move the enable of the reference clock from probe to the helper
that enables the PLL.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 171 +++++++++++++++++++++-------------
 1 file changed, 104 insertions(+), 67 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 0fd8356a3776..ff66551a5966 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -272,6 +272,105 @@ static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
 	return -ETIMEDOUT;
 }
 
+static const struct xvcu_pll_cfg *xvcu_find_cfg(int div)
+{
+	const struct xvcu_pll_cfg *cfg = NULL;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xvcu_pll_cfg) - 1; i++)
+		if (xvcu_pll_cfg[i].fbdiv == div)
+			cfg = &xvcu_pll_cfg[i];
+
+	return cfg;
+}
+
+static int xvcu_pll_set_div(struct xvcu_device *xvcu, int div)
+{
+	void __iomem *base = xvcu->vcu_slcr_ba;
+	const struct xvcu_pll_cfg *cfg = NULL;
+	u32 vcu_pll_ctrl;
+	u32 cfg_val;
+
+	cfg = xvcu_find_cfg(div);
+	if (!cfg)
+		return -EINVAL;
+
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
+	vcu_pll_ctrl |= (cfg->fbdiv & VCU_PLL_CTRL_FBDIV_MASK) <<
+			 VCU_PLL_CTRL_FBDIV_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
+
+	cfg_val = (cfg->res << VCU_PLL_CFG_RES_SHIFT) |
+		   (cfg->cp << VCU_PLL_CFG_CP_SHIFT) |
+		   (cfg->lfhf << VCU_PLL_CFG_LFHF_SHIFT) |
+		   (cfg->lock_cnt << VCU_PLL_CFG_LOCK_CNT_SHIFT) |
+		   (cfg->lock_dly << VCU_PLL_CFG_LOCK_DLY_SHIFT);
+	xvcu_write(base, VCU_PLL_CFG, cfg_val);
+
+	return 0;
+}
+
+static int xvcu_pll_set_rate(struct xvcu_device *xvcu,
+			     unsigned long rate, unsigned long parent_rate)
+{
+	return xvcu_pll_set_div(xvcu, rate / parent_rate);
+}
+
+static int xvcu_pll_enable(struct xvcu_device *xvcu)
+{
+	void __iomem *base = xvcu->vcu_slcr_ba;
+	u32 vcu_pll_ctrl;
+	int ret;
+
+	ret = clk_prepare_enable(xvcu->pll_ref);
+	if (ret) {
+		dev_err(xvcu->dev, "failed to enable pll_ref clock source\n");
+		return ret;
+	}
+
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
+			  VCU_PLL_CTRL_POR_IN_SHIFT);
+	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_POR_IN_MASK) <<
+			 VCU_PLL_CTRL_POR_IN_SHIFT;
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK <<
+			  VCU_PLL_CTRL_PWR_POR_SHIFT);
+	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_PWR_POR_MASK) <<
+			 VCU_PLL_CTRL_PWR_POR_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
+
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     1, VCU_PLL_CTRL_BYPASS_MASK,
+			     VCU_PLL_CTRL_BYPASS_SHIFT);
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     1, VCU_PLL_CTRL_RESET_MASK,
+			     VCU_PLL_CTRL_RESET_SHIFT);
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     0, VCU_PLL_CTRL_RESET_MASK,
+			     VCU_PLL_CTRL_RESET_SHIFT);
+
+	ret = xvcu_pll_wait_for_lock(xvcu);
+	if (ret) {
+		dev_err(xvcu->dev, "PLL is not locked\n");
+		goto err;
+	}
+
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     0, VCU_PLL_CTRL_BYPASS_MASK,
+			     VCU_PLL_CTRL_BYPASS_SHIFT);
+
+	return ret;
+err:
+	clk_disable_unprepare(xvcu->pll_ref);
+	return ret;
+}
+
+static void xvcu_pll_disable(struct xvcu_device *xvcu)
+{
+	clk_disable_unprepare(xvcu->pll_ref);
+}
+
 /**
  * xvcu_set_vcu_pll_info - Set the VCU PLL info
  * @xvcu:	Pointer to the xvcu_device structure
@@ -292,8 +391,8 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	u32 refclk, coreclk, mcuclk, inte, deci;
 	u32 divisor_mcu, divisor_core, fvco;
 	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
-	u32 cfg_val, mod, ctrl;
-	int ret, i;
+	u32 mod, ctrl;
+	int i;
 	const struct xvcu_pll_cfg *found = NULL;
 
 	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK, &inte);
@@ -312,19 +411,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	dev_dbg(xvcu->dev, "Core clock from logicoreIP is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Mcu clock from logicoreIP is %uHz\n", mcuclk);
 
-	clk_disable_unprepare(xvcu->pll_ref);
-	ret = clk_set_rate(xvcu->pll_ref, refclk);
-	if (ret)
-		dev_warn(xvcu->dev, "failed to set logicoreIP refclk rate\n");
-
-	ret = clk_prepare_enable(xvcu->pll_ref);
-	if (ret) {
-		dev_err(xvcu->dev, "failed to enable pll_ref clock source\n");
-		return ret;
-	}
-
-	refclk = clk_get_rate(xvcu->pll_ref);
-
 	/*
 	 * The divide-by-2 should be always enabled (==1)
 	 * to meet the timing in the design.
@@ -378,19 +464,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
 
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
-	vcu_pll_ctrl |= (found->fbdiv & VCU_PLL_CTRL_FBDIV_MASK) <<
-			 VCU_PLL_CTRL_FBDIV_SHIFT;
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
-			  VCU_PLL_CTRL_POR_IN_SHIFT);
-	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_POR_IN_MASK) <<
-			 VCU_PLL_CTRL_POR_IN_SHIFT;
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK <<
-			  VCU_PLL_CTRL_PWR_POR_SHIFT);
-	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_PWR_POR_MASK) <<
-			 VCU_PLL_CTRL_PWR_POR_SHIFT;
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_PLL_CTRL, vcu_pll_ctrl);
-
 	/* Set divisor for the core and mcu clock */
 	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL);
 	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
@@ -422,15 +495,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
 	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL, ctrl);
 
-	/* Set RES, CP, LFHF, LOCK_CNT and LOCK_DLY cfg values */
-	cfg_val = (found->res << VCU_PLL_CFG_RES_SHIFT) |
-		   (found->cp << VCU_PLL_CFG_CP_SHIFT) |
-		   (found->lfhf << VCU_PLL_CFG_LFHF_SHIFT) |
-		   (found->lock_cnt << VCU_PLL_CFG_LOCK_CNT_SHIFT) |
-		   (found->lock_dly << VCU_PLL_CFG_LOCK_DLY_SHIFT);
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_PLL_CFG, cfg_val);
-
-	return 0;
+	return xvcu_pll_set_rate(xvcu, fvco, refclk);
 }
 
 /**
@@ -452,27 +517,7 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 		return ret;
 	}
 
-	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
-	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
-	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
-			     0, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
-
-	ret = xvcu_pll_wait_for_lock(xvcu);
-	if (ret) {
-		dev_err(xvcu->dev, "PLL is not locked\n");
-		return ret;
-	}
-
-	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
-			     0, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
-
-	return ret;
+	return xvcu_pll_enable(xvcu);
 }
 
 /**
@@ -555,12 +600,6 @@ static int xvcu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(xvcu->pll_ref);
-	if (ret) {
-		dev_err(&pdev->dev, "pll_ref clock enable failed\n");
-		goto error_aclk;
-	}
-
 	/*
 	 * Do the Gasket isolation and put the VCU out of reset
 	 * Bit 0 : Gasket isolation
@@ -580,8 +619,6 @@ static int xvcu_probe(struct platform_device *pdev)
 	return 0;
 
 error_pll_ref:
-	clk_disable_unprepare(xvcu->pll_ref);
-error_aclk:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
 }
@@ -605,7 +642,7 @@ static int xvcu_remove(struct platform_device *pdev)
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
-	clk_disable_unprepare(xvcu->pll_ref);
+	xvcu_pll_disable(xvcu);
 	clk_disable_unprepare(xvcu->aclk);
 
 	return 0;
-- 
2.20.1


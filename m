Return-Path: <linux-clk+bounces-4801-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C888880E89
	for <lists+linux-clk@lfdr.de>; Wed, 20 Mar 2024 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD7C1C20C2B
	for <lists+linux-clk@lfdr.de>; Wed, 20 Mar 2024 09:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EDA39FFF;
	Wed, 20 Mar 2024 09:27:36 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1A38F9A;
	Wed, 20 Mar 2024 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710926856; cv=none; b=ZiCu8kxe0yIpFMP5q8jaU3m+AUHcfn7NZ1kgSpFSCOoUXX3XIuuft64ShboKFT1zkiDiGowODFtFHhoY8LXIqJg3T5JIdeV3LnH3a4nvgxeUM2m450ypczAQpQrDd3UWfnTkzwHtQatJ5QVS/ZTYzD+iPPy8qTtNDYYvtozowbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710926856; c=relaxed/simple;
	bh=gCY8+IzzEml3KRG7LF4Ty/7TwwwJmNOd33gPf4Oc57c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UW1Up5XdEUTP0NC4pkW7rR4Hi14A/a9EESHgA+E7/kMNqFzR6MGCHV34ZsAdALvsB0YWcc61JBPTo13kidOT1Hz8iK3ekK+RcvUeL5EIe9hSBd89p9M7SVAHHJ47LWAxNGuuMvsp7IH8cJUXNdtPqGqGjPLcpZ8rUQh1WADiKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B833E1A00BB;
	Wed, 20 Mar 2024 10:27:26 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 54E091A0091;
	Wed, 20 Mar 2024 10:27:26 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 96184183AC99;
	Wed, 20 Mar 2024 17:27:24 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	shengjiu.wang@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: imx: imx8mp: Add pm_runtime support for power saving
Date: Wed, 20 Mar 2024 17:10:51 +0800
Message-Id: <1710925851-5643-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Add pm_runtime support for power saving. In pm runtime suspend
state the registers will be reseted, so add registers save
in pm runtime suspend and restore them in pm runtime resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
changes in v2:
- move pm_runtime_enable before the clk register

 drivers/clk/imx/clk-imx8mp-audiomix.c | 150 +++++++++++++++++++++++---
 1 file changed, 137 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 55ed211a5e0b..6042280d6404 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -7,10 +7,12 @@
 
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <dt-bindings/clock/imx8mp-clock.h>
 
@@ -18,6 +20,7 @@
 
 #define CLKEN0			0x000
 #define CLKEN1			0x004
+#define EARC			0x200
 #define SAI1_MCLK_SEL		0x300
 #define SAI2_MCLK_SEL		0x304
 #define SAI3_MCLK_SEL		0x308
@@ -26,6 +29,12 @@
 #define SAI7_MCLK_SEL		0x314
 #define PDM_SEL			0x318
 #define SAI_PLL_GNRL_CTL	0x400
+#define SAI_PLL_FDIVL_CTL0	0x404
+#define SAI_PLL_FDIVL_CTL1	0x408
+#define SAI_PLL_SSCG_CTL	0x40C
+#define SAI_PLL_MNIT_CTL	0x410
+#define IPG_LP_CTRL		0x504
+#define REGS_NUM		16
 
 #define SAIn_MCLK1_PARENT(n)						\
 static const struct clk_parent_data					\
@@ -182,13 +191,65 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
 	CLK_SAIn(7)
 };
 
+struct clk_imx8mp_audiomix_regs {
+	u32 regs_num;
+	u32 regs_off[];
+};
+
+static const struct clk_imx8mp_audiomix_regs audiomix_regs = {
+	.regs_num = REGS_NUM,
+	.regs_off = {
+		CLKEN0,
+		CLKEN1,
+		EARC,
+		SAI1_MCLK_SEL,
+		SAI2_MCLK_SEL,
+		SAI3_MCLK_SEL,
+		SAI5_MCLK_SEL,
+		SAI6_MCLK_SEL,
+		SAI7_MCLK_SEL,
+		PDM_SEL,
+		SAI_PLL_GNRL_CTL,
+		SAI_PLL_FDIVL_CTL0,
+		SAI_PLL_FDIVL_CTL1,
+		SAI_PLL_SSCG_CTL,
+		SAI_PLL_MNIT_CTL,
+		IPG_LP_CTRL
+	},
+};
+
+struct clk_imx8mp_audiomix_drvdata {
+	void __iomem *base;
+	u32 regs_save[REGS_NUM];
+};
+
+static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
+{
+	struct clk_imx8mp_audiomix_drvdata *drvdata = dev_get_drvdata(dev);
+	void __iomem *base = drvdata->base;
+	int i;
+
+	if (save) {
+		for (i = 0; i < audiomix_regs.regs_num; i++)
+			drvdata->regs_save[i] = readl(base + audiomix_regs.regs_off[i]);
+	} else {
+		for (i = 0; i < audiomix_regs.regs_num; i++)
+			writel(drvdata->regs_save[i], base + audiomix_regs.regs_off[i]);
+	}
+}
+
 static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 {
+	struct clk_imx8mp_audiomix_drvdata *drvdata;
 	struct clk_hw_onecell_data *priv;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct clk_hw *hw;
-	int i;
+	int i, ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
 
 	priv = devm_kzalloc(dev,
 			    struct_size(priv, hws, IMX8MP_CLK_AUDIOMIX_END),
@@ -202,6 +263,18 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	drvdata->base = base;
+	dev_set_drvdata(dev, drvdata);
+
+	/*
+	 * pm_runtime_enable needs to be called before clk register.
+	 * That is to make core->rpm_enabled to be true for clock
+	 * usage.
+	 */
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	for (i = 0; i < ARRAY_SIZE(sels); i++) {
 		if (sels[i].num_parents == 1) {
 			hw = devm_clk_hw_register_gate_parent_data(dev,
@@ -216,8 +289,10 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 				0, NULL, NULL);
 		}
 
-		if (IS_ERR(hw))
-			return PTR_ERR(hw);
+		if (IS_ERR(hw)) {
+			ret = PTR_ERR(hw);
+			goto err_clk_register;
+		}
 
 		priv->hws[sels[i].clkid] = hw;
 	}
@@ -232,8 +307,10 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 
 	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
 				    base + 0x400, &imx_1443x_pll);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_clk_register;
+	}
 	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL] = hw;
 
 	hw = devm_clk_hw_register_mux_parent_data_table(dev,
@@ -241,26 +318,71 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 		ARRAY_SIZE(clk_imx8mp_audiomix_pll_bypass_sels),
 		CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 		base + SAI_PLL_GNRL_CTL, 16, 1, 0, NULL, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_clk_register;
+	}
+
 	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
 
 	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
 				       0, base + SAI_PLL_GNRL_CTL, 13,
 				       0, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_clk_register;
+	}
 	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
 
 	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
 					       "sai_pll_out", 0, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_clk_register;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					  priv);
+	if (ret)
+		goto err_clk_register;
+
+	pm_runtime_put_sync(dev);
+	return 0;
+
+err_clk_register:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int clk_imx8mp_audiomix_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
 
-	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					   priv);
+	return 0;
 }
 
+static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
+{
+	clk_imx8mp_audiomix_save_restore(dev, true);
+
+	return 0;
+}
+
+static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
+{
+	clk_imx8mp_audiomix_save_restore(dev, false);
+
+	return 0;
+}
+
+static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
+	SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
+			   clk_imx8mp_audiomix_runtime_resume, NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+};
+
 static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
 	{ .compatible = "fsl,imx8mp-audio-blk-ctrl" },
 	{ /* sentinel */ }
@@ -269,9 +391,11 @@ MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
 
 static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.probe	= clk_imx8mp_audiomix_probe,
+	.remove = clk_imx8mp_audiomix_remove,
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
+		.pm = &clk_imx8mp_audiomix_pm_ops,
 	},
 };
 
-- 
2.34.1



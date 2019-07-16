Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2306AB9A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2019 17:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387886AbfGPPXX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jul 2019 11:23:23 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44602 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387878AbfGPPXX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 11:23:23 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5337E1A000D;
        Tue, 16 Jul 2019 17:23:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7CE4A1A004C;
        Tue, 16 Jul 2019 17:23:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 062CA40327;
        Tue, 16 Jul 2019 23:23:08 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 11/11] clk: imx: lpcg: add suspend/resume support
Date:   Tue, 16 Jul 2019 23:01:05 +0800
Message-Id: <1563289265-10977-12-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

LPCG clock state may be lost when it's power domain is completely
off during system suspend/resume and we need save and restore the
state properly.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c |  1 +
 drivers/clk/imx/clk-lpcg-scu.c     | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-scu.h          |  1 +
 3 files changed, 35 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 0043639..fa5edaa 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -312,6 +312,7 @@ static struct platform_driver imx8qxp_lpcg_clk_driver = {
 	.driver = {
 		.name = "imx8qxp-lpcg-clk",
 		.of_match_table = imx8qxp_lpcg_match,
+		.pm = &imx_clk_lpcg_scu_pm_ops,
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8qxp_lpcg_clk_probe,
diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index 3c092a0..4df0818 100644
--- a/drivers/clk/imx/clk-lpcg-scu.c
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -33,6 +33,9 @@ struct clk_lpcg_scu {
 	void __iomem *reg;
 	u8 bit_idx;
 	bool hw_gate;
+
+	/* for state save&restore */
+	u32 state;
 };
 
 #define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
@@ -112,5 +115,35 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
 		hw = ERR_PTR(ret);
 	}
 
+	if (dev)
+		dev_set_drvdata(dev, clk);
+
 	return hw;
 }
+
+int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)
+{
+	struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
+
+	clk->state = readl_relaxed(clk->reg);
+	dev_dbg(dev, "save lpcg state 0x%x\n", clk->state);
+
+	return 0;
+}
+
+int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
+{
+	struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
+
+	/* FIXME: double write in case a failure */
+	writel(clk->state, clk->reg);
+	writel(clk->state, clk->reg);
+	dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
+
+	return 0;
+}
+
+const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_lpcg_scu_suspend,
+				      imx_clk_lpcg_scu_resume)
+};
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 84efda3..6d4b6e2 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -12,6 +12,7 @@
 
 extern u32 clock_cells;
 extern struct list_head imx_scu_clks[];
+extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
 
 int imx_clk_scu_init(struct device_node *np);
 struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
-- 
2.7.4


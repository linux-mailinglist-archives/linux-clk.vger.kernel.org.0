Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF26AB91
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2019 17:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387748AbfGPPXP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jul 2019 11:23:15 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44274 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730754AbfGPPXP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 11:23:15 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 869EF1A00C0;
        Tue, 16 Jul 2019 17:23:12 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 785681A004C;
        Tue, 16 Jul 2019 17:23:07 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 54DAA402E3;
        Tue, 16 Jul 2019 23:23:01 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 03/11] clk: imx: scu: add two cells binding support
Date:   Tue, 16 Jul 2019 23:00:57 +0800
Message-Id: <1563289265-10977-4-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch implements the new two cells binding for SCU clocks.
The usage is as follows:
clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>

Due to each SCU clock is associated with a power domain, without power
on the domain, the SCU clock can't work. So we create platform devices
for each domain clock respectively and manually attach the required domain
before register the clock devices, then we can register clocks in the
clock platform driver accordingly.

Note because we do not have power domain info in device tree and the SCU
resource ID is the same for power domain and clock, so we use resource ID
to find power domains.

Later, we will also use this clock platform driver to support suspend/resume
and runtime pm.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp.c |   9 ++-
 drivers/clk/imx/clk-scu.c     | 138 +++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.h     |  21 ++++++-
 3 files changed, 161 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 5e2903e..1ad3f2a 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -24,7 +24,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	struct clk_hw **clks;
 	int ret, i;
 
-	ret = imx_clk_scu_init();
+	ret = imx_clk_scu_init(ccm_node);
 	if (ret)
 		return ret;
 
@@ -134,7 +134,12 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 				i, PTR_ERR(clks[i]));
 	}
 
-	return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+	if (clock_cells == 2)
+		ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
+	else
+		ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+
+	return ret;
 }
 
 static const struct of_device_id imx8qxp_match[] = {
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index fbef740..48bfb08 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -8,6 +8,9 @@
 #include <linux/arm-smccc.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -16,6 +19,21 @@
 #define IMX_SIP_SET_CPUFREQ		0x00
 
 static struct imx_sc_ipc *ccm_ipc_handle;
+struct device_node *pd_np;
+u32 clock_cells;
+
+struct imx_scu_clk_node {
+	const char *name;
+	u32 rsrc;
+	u8 clk_type;
+	const char * const *parents;
+	int num_parents;
+
+	struct clk_hw *hw;
+	struct list_head node;
+};
+
+struct list_head imx_scu_clks[IMX_SC_R_LAST];
 
 /*
  * struct clk_scu - Description of one SCU clock
@@ -128,9 +146,29 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
 	return container_of(hw, struct clk_scu, hw);
 }
 
-int imx_clk_scu_init(void)
+int imx_clk_scu_init(struct device_node *np)
 {
-	return imx_scu_get_handle(&ccm_ipc_handle);
+	struct platform_device *pd_dev;
+	int ret, i;
+
+	ret = imx_scu_get_handle(&ccm_ipc_handle);
+	if (ret)
+		return ret;
+
+	if (of_property_read_u32(np, "#clock-cells", &clock_cells))
+		return -EINVAL;
+
+	if (clock_cells == 2) {
+		for (i = 0; i < IMX_SC_R_LAST; i++)
+			INIT_LIST_HEAD(&imx_scu_clks[i]);
+
+		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
+		pd_dev = of_find_device_by_node(pd_np);
+		if (!pd_dev || !device_is_bound(&pd_dev->dev))
+			return -EPROBE_DEFER;
+	}
+
+	return 0;
 }
 
 /*
@@ -387,3 +425,99 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 
 	return hw;
 }
+
+struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
+				      void *data)
+{
+	unsigned int rsrc = clkspec->args[0];
+	unsigned int idx = clkspec->args[1];
+	struct list_head *scu_clks = data;
+	struct imx_scu_clk_node *clk;
+
+	list_for_each_entry(clk, &scu_clks[rsrc], node) {
+		if (clk->clk_type == idx)
+			return clk->hw;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+static int imx_clk_scu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_scu_clk_node *clk = dev_get_platdata(dev);
+	struct clk_hw *hw;
+
+	hw = __imx_clk_scu(clk->name, clk->parents, clk->num_parents,
+			   clk->rsrc, clk->clk_type);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk->hw = hw;
+	list_add_tail(&clk->node, &imx_scu_clks[clk->rsrc]);
+
+	dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
+		clk->clk_type);
+
+	return 0;
+}
+
+static struct platform_driver imx_clk_scu_driver = {
+	.driver = {
+		.name = "imx-scu-clk",
+		.suppress_bind_attrs = true,
+	},
+	.probe = imx_clk_scu_probe,
+};
+builtin_platform_driver(imx_clk_scu_driver);
+
+static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
+{
+	struct of_phandle_args genpdspec = {
+		.np = pd_np,
+		.args_count = 1,
+		.args[0] = rsrc_id,
+	};
+
+	return of_genpd_add_device(&genpdspec, dev);
+}
+
+struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
+				     const char * const *parents,
+				     int num_parents, u32 rsrc_id, u8 clk_type)
+{
+	struct imx_scu_clk_node clk = {
+		.name = name,
+		.rsrc = rsrc_id,
+		.clk_type = clk_type,
+		.parents = parents,
+		.num_parents = num_parents,
+	};
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	if (!pdev) {
+		pr_err("%s: failed to allocate scu clk dev rsrc %d type %d\n",
+		       name, rsrc_id, clk_type);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ret = platform_device_add_data(pdev, &clk, sizeof(clk));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	pdev->driver_override = "imx-scu-clk";
+
+	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
+	if (ret)
+		pr_warn("%s: failed to attached the power domain %d\n",
+			name, ret);
+
+	platform_device_add(pdev);
+
+	/* For API backwards compatiblilty, simply return NULL for success */
+	return NULL;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 2bcfaf0..819dc32 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -8,8 +8,17 @@
 #define __IMX_CLK_SCU_H
 
 #include <linux/firmware/imx/sci.h>
+#include <linux/of.h>
 
-int imx_clk_scu_init(void);
+extern u32 clock_cells;
+extern struct list_head imx_scu_clks[];
+
+int imx_clk_scu_init(struct device_node *np);
+struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
+				      void *data);
+struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
+				     const char * const *parents,
+				     int num_parents, u32 rsrc_id, u8 clk_type);
 
 struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 			     int num_parents, u32 rsrc_id, u8 clk_type);
@@ -17,13 +26,19 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type)
 {
-	return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
+	if (clock_cells == 2)
+		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
+	else
+		return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
 					  int num_parents, u32 rsrc_id, u8 clk_type)
 {
-	return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
+	if (clock_cells == 2)
+		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
+	else
+		return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
 }
 
 struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-- 
2.7.4


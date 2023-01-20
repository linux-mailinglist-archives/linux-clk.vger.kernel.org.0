Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84A4674971
	for <lists+linux-clk@lfdr.de>; Fri, 20 Jan 2023 03:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjATCo4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Thu, 19 Jan 2023 21:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjATCox (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 21:44:53 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4140A5004;
        Thu, 19 Jan 2023 18:44:50 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 0600324E1E4;
        Fri, 20 Jan 2023 10:44:49 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:49 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 10:44:48 +0800
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>
CC:     Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v1 03/11] clk: starfive: Add StarFive JH7110 System-Top-Group clock driver
Date:   Fri, 20 Jan 2023 10:44:37 +0800
Message-ID: <20230120024445.244345-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add driver for the StarFive JH7110 System-Top-Group clock controller.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  11 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh7110-stg.c    | 180 ++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 2aa664f2cdee..a462b6e53543 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -42,3 +42,14 @@ config CLK_STARFIVE_JH7110_AON
 	help
 	  Say yes here to support the always-on clock controller on the
 	  StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JH7110_STG
+	tristate "StarFive JH7110 System-Top-Group clock support"
+	depends on CLK_STARFIVE_JH7110_SYS
+	select AUXILIARY_BUS
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JH7110
+	default CLK_STARFIVE_JH7110_SYS
+	help
+	  Say yes here to support the System-Top-Group clock controller
+	  on the StarFive JH7110 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index f3df7d957b1e..b81e97ee2659 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+= clk-starfive-jh7100-audio.o
 
 obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)	+= clk-starfive-jh7110-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
+obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
new file mode 100644
index 000000000000..c2740f44e796
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH7110 System-Top-Group Clock Driver
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/starfive,jh7110-crg.h>
+
+#include "clk-starfive-jh71x0.h"
+
+/* external clocks */
+#define JH7110_STGCLK_OSC			(JH7110_STGCLK_END + 0)
+#define JH7110_STGCLK_HIFI4_CORE		(JH7110_STGCLK_END + 1)
+#define JH7110_STGCLK_STG_AXIAHB		(JH7110_STGCLK_END + 2)
+#define JH7110_STGCLK_USB_125M			(JH7110_STGCLK_END + 3)
+#define JH7110_STGCLK_CPU_BUS			(JH7110_STGCLK_END + 4)
+#define JH7110_STGCLK_HIFI4_AXI			(JH7110_STGCLK_END + 5)
+#define JH7110_STGCLK_NOCSTG_BUS		(JH7110_STGCLK_END + 6)
+#define JH7110_STGCLK_APB_BUS			(JH7110_STGCLK_END + 7)
+
+static const struct jh71x0_clk_data jh7110_stgclk_data[] = {
+	/* hifi4 */
+	JH71X0_GATE(JH7110_STGCLK_HIFI4_CLK_CORE, "hifi4_clk_core", 0,
+		    JH7110_STGCLK_HIFI4_CORE),
+	/* usb */
+	JH71X0_GATE(JH7110_STGCLK_USB0_APB, "usb0_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_USB0_UTMI_APB, "usb0_utmi_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_USB0_AXI, "usb0_axi", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GDIV(JH7110_STGCLK_USB0_LPM, "usb0_lpm", 0, 2, JH7110_STGCLK_OSC),
+	JH71X0_GDIV(JH7110_STGCLK_USB0_STB, "usb0_stb", 0, 4, JH7110_STGCLK_OSC),
+	JH71X0_GATE(JH7110_STGCLK_USB0_APP_125, "usb0_app_125", 0, JH7110_STGCLK_USB_125M),
+	JH71X0__DIV(JH7110_STGCLK_USB0_REFCLK, "usb0_refclk", 2, JH7110_STGCLK_OSC),
+	/* pci-e */
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_AXI_MST0, "pcie0_axi_mst0", 0,
+		    JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_APB, "pcie0_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_TL, "pcie0_tl", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_AXI_MST0, "pcie1_axi_mst0", 0,
+		    JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_APB, "pcie1_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_TL, "pcie1_tl", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK, "pcie01_slv_dec_mainclk",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	/* security */
+	JH71X0_GATE(JH7110_STGCLK_SEC_HCLK, "sec_hclk", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_SEC_MISCAHB, "sec_miscahb", 0, JH7110_STGCLK_STG_AXIAHB),
+	/* stg mtrx */
+	JH71X0_GATE(JH7110_STGCLK_GRP0_MAIN, "mtrx_grp0_main",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP0_BUS, "mtrx_grp0_bus",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP0_STG, "mtrx_grp0_stg",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_MAIN, "mtrx_grp1_main",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_BUS, "mtrx_grp1_bus",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_STG, "mtrx_grp1_stg",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_HIFI, "mtrx_grp1_hifi",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_HIFI4_AXI),
+	/* e24_rvpi */
+	JH71X0_GDIV(JH7110_STGCLK_E2_RTC, "e2_rtc", 0, 24, JH7110_STGCLK_OSC),
+	JH71X0_GATE(JH7110_STGCLK_E2_CORE, "e2_core",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_E2_DBG, "e2_dbg", 0, JH7110_STGCLK_STG_AXIAHB),
+	/* dw_sgdma1p */
+	JH71X0_GATE(JH7110_STGCLK_DMA1P_AXI, "dma1p_axi", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
+};
+
+static struct clk_hw *jh7110_stgclk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jh71x0_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < JH7110_STGCLK_END)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jh7110_stgcrg_probe(struct platform_device *pdev)
+{
+	struct jh71x0_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, JH7110_STGCLK_END),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->dev = &pdev->dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	dev_set_drvdata(priv->dev, priv->base);
+
+	for (idx = 0; idx < JH7110_STGCLK_END; idx++) {
+		u32 max = jh7110_stgclk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = jh7110_stgclk_data[idx].name,
+			.ops = starfive_jh71x0_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
+			.flags = jh7110_stgclk_data[idx].flags,
+		};
+		struct jh71x0_clk *clk = &priv->reg[idx];
+		unsigned int i;
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = jh7110_stgclk_data[idx].parents[i];
+
+			if (pidx < JH7110_STGCLK_END)
+				parents[i].hw = &priv->reg[pidx].hw;
+			else if (pidx == JH7110_STGCLK_OSC)
+				parents[i].fw_name = "osc";
+			else if (pidx == JH7110_STGCLK_HIFI4_CORE)
+				parents[i].fw_name = "hifi4_core";
+			else if (pidx == JH7110_STGCLK_STG_AXIAHB)
+				parents[i].fw_name = "stg_axiahb";
+			else if (pidx == JH7110_STGCLK_USB_125M)
+				parents[i].fw_name = "usb_125m";
+			else if (pidx == JH7110_STGCLK_CPU_BUS)
+				parents[i].fw_name = "cpu_bus";
+			else if (pidx == JH7110_STGCLK_HIFI4_AXI)
+				parents[i].fw_name = "hifi4_axi";
+			else if (pidx == JH7110_STGCLK_NOCSTG_BUS)
+				parents[i].fw_name = "nocstg_bus";
+			else if (pidx == JH7110_STGCLK_APB_BUS)
+				parents[i].fw_name = "apb_bus";
+		}
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max_div = max & JH71X0_CLK_DIV_MASK;
+
+		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
+	if (ret)
+		return ret;
+
+	return jh7110_reset_controller_register(priv, "reset-stg", 2);
+}
+
+static const struct of_device_id jh7110_stgcrg_match[] = {
+	{ .compatible = "starfive,jh7110-stgcrg" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_stgcrg_match);
+
+static struct platform_driver jh7110_stgcrg_driver = {
+	.probe = jh7110_stgcrg_probe,
+	.driver = {
+		.name = "clk-starfive-jh7110-stg",
+		.of_match_table = jh7110_stgcrg_match,
+	},
+};
+module_platform_driver(jh7110_stgcrg_driver);
+
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 System-Top-Group clock driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97DB15FED3
	for <lists+linux-clk@lfdr.de>; Sat, 15 Feb 2020 15:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgBOORA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 15 Feb 2020 09:17:00 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60576 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgBOORA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Feb 2020 09:17:00 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01FEGteH097047;
        Sat, 15 Feb 2020 08:16:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581776215;
        bh=aiNADbOqpFOMzKnqhqzWB0l4JMsEuoMhtl9wafu7Hug=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wtuoAqeS+MG1DKgdQQWpzeSNtb4xSbTxC7Lmg+ry4iCXnPSF4dfjc+zdEovqSXwC1
         c1UUpLsUMQZ8cQAze3uK38IWKPdEQJiu+R22wwz3thf9jjGYWSDYFCZd/1wDUc+t7N
         Y7Lo4CPg1OZNIJfBI1ZlSzUksmbthi0Y156vr6PI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01FEGtl6077676
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 15 Feb 2020 08:16:55 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 15
 Feb 2020 08:16:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 15 Feb 2020 08:16:55 -0600
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01FEGjP7004147;
        Sat, 15 Feb 2020 08:16:52 -0600
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH v3 2/2] clk: keystone: Add new driver to handle syscon based clocks
Date:   Sat, 15 Feb 2020 19:47:24 +0530
Message-ID: <20200215141724.32291-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200215141724.32291-1-vigneshr@ti.com>
References: <20200215141724.32291-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On TI's AM654/J721e SoCs, certain clocks can be gatemld/ungated by setting a
single bit in SoC's System Control Module registers. Sometime more than
one clock control can be in the same register.
Add a driver to support such clocks using syscon framework.
Driver currently supports controlling EHRPWM's TimeBase clock(TBCLK) for
AM654 SoC.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/clk/keystone/Kconfig      |   8 ++
 drivers/clk/keystone/Makefile     |   1 +
 drivers/clk/keystone/syscon-clk.c | 172 ++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/clk/keystone/syscon-clk.c

diff --git a/drivers/clk/keystone/Kconfig b/drivers/clk/keystone/Kconfig
index 38aeefb1e808..6ba809c59bb2 100644
--- a/drivers/clk/keystone/Kconfig
+++ b/drivers/clk/keystone/Kconfig
@@ -26,3 +26,11 @@ config TI_SCI_CLK_PROBE_FROM_FW
 	  This is mostly only useful for debugging purposes, and will
 	  increase the boot time of the device. If you want the clocks probed
 	  from firmware, say Y. Otherwise, say N.
+
+config TI_SYSCON_CLK
+	tristate "Syscon based clock driver for K2/K3 SoCs"
+	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
+	default (ARCH_KEYSTONE || ARCH_K3)
+	help
+	  This adds clock driver support for syscon based gate
+	  clocks on TI's K2 and K3 SoCs.
diff --git a/drivers/clk/keystone/Makefile b/drivers/clk/keystone/Makefile
index d044de6f965c..0e426e648f7c 100644
--- a/drivers/clk/keystone/Makefile
+++ b/drivers/clk/keystone/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+= pll.o gate.o
 obj-$(CONFIG_TI_SCI_CLK)		+= sci-clk.o
+obj-$(CONFIG_TI_SYSCON_CLK)		+= syscon-clk.o
diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
new file mode 100644
index 000000000000..8d7dbea3bd30
--- /dev/null
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct ti_syscon_gate_clk_priv {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	u32 reg;
+	u32 idx;
+};
+
+struct ti_syscon_gate_clk_data {
+	char *name;
+	u32 offset;
+	u32 bit_idx;
+};
+
+static struct
+ti_syscon_gate_clk_priv *to_ti_syscon_gate_clk_priv(struct clk_hw *hw)
+{
+	return container_of(hw, struct ti_syscon_gate_clk_priv, hw);
+}
+
+static int ti_syscon_gate_clk_enable(struct clk_hw *hw)
+{
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	return regmap_write_bits(priv->regmap, priv->reg, priv->idx,
+				 priv->idx);
+}
+
+static void ti_syscon_gate_clk_disable(struct clk_hw *hw)
+{
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	regmap_write_bits(priv->regmap, priv->reg, priv->idx, 0);
+}
+
+static int ti_syscon_gate_clk_is_enabled(struct clk_hw *hw)
+{
+	unsigned int val;
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	regmap_read(priv->regmap, priv->reg, &val);
+
+	return !!(val & priv->idx);
+}
+
+static const struct clk_ops ti_syscon_gate_clk_ops = {
+	.enable		= ti_syscon_gate_clk_enable,
+	.disable	= ti_syscon_gate_clk_disable,
+	.is_enabled	= ti_syscon_gate_clk_is_enabled,
+};
+
+static struct clk_hw
+*ti_syscon_gate_clk_register(struct device *dev, struct regmap *regmap,
+			     const struct ti_syscon_gate_clk_data *data)
+{
+	struct ti_syscon_gate_clk_priv *priv;
+	struct clk_init_data init;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = data->name;
+	init.ops = &ti_syscon_gate_clk_ops;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+	init.flags = 0;
+
+	priv->regmap = regmap;
+	priv->reg = data->offset;
+	priv->idx = BIT(data->bit_idx);
+	priv->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &priv->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &priv->hw;
+}
+
+static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
+{
+	const struct ti_syscon_gate_clk_data *data, *p;
+	struct clk_hw_onecell_data *hw_data;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	int num_clks, i;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(regmap)) {
+		if (PTR_ERR(regmap) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_err(dev, "failed to find parent regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	num_clks = 0;
+	for (p = data; p->name; p++)
+		num_clks++;
+
+	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, num_clks),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+
+	hw_data->num = num_clks;
+
+	for (i = 0; i < num_clks; i++) {
+		hw_data->hws[i] = ti_syscon_gate_clk_register(dev, regmap,
+							      &data[i]);
+		if (IS_ERR(hw_data->hws[i]))
+			dev_warn(dev, "failed to register %s\n",
+				 data[i].name);
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   hw_data);
+}
+
+#define TI_SYSCON_CLK_GATE(_name, _offset, _bit_idx)	\
+	{						\
+		.name = _name,				\
+		.offset = (_offset),			\
+		.bit_idx = (_bit_idx),			\
+	}
+
+static const struct ti_syscon_gate_clk_data am654_clk_data[] = {
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk0", 0x0, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk1", 0x4, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk2", 0x8, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk3", 0xc, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk4", 0x10, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk5", 0x14, 0),
+	{ /* Sentinel */ },
+};
+
+static const struct of_device_id ti_syscon_gate_clk_ids[] = {
+	{
+		.compatible = "ti,am654-ehrpwm-tbclk",
+		.data = &am654_clk_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ti_syscon_gate_clk_ids);
+
+static struct platform_driver ti_syscon_gate_clk_driver = {
+	.probe = ti_syscon_gate_clk_probe,
+	.driver = {
+		.name = "ti-syscon-gate-clk",
+		.of_match_table = ti_syscon_gate_clk_ids,
+	},
+};
+module_platform_driver(ti_syscon_gate_clk_driver);
+
+MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
+MODULE_DESCRIPTION("Syscon backed gate-clock driver");
+MODULE_LICENSE("GPL");
-- 
2.25.0


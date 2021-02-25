Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018A73256FE
	for <lists+linux-clk@lfdr.de>; Thu, 25 Feb 2021 20:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhBYTpG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Feb 2021 14:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbhBYTms (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 14:42:48 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F75C0617A9;
        Thu, 25 Feb 2021 11:42:07 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n4so4413941wmq.3;
        Thu, 25 Feb 2021 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gJ0Lzbv+Mu8W9V+RhUx0xWFk1y7fwYBu5wT4CF95MH8=;
        b=ngspetlcVSk2aHc7+5xjjZfhOdGokWuXwD/981UshKqHq6Znr7NmaCoGuC8Ad9zh14
         gQKnKgb5nC5JwD2qDDIxclVdY2qCU8uSaVJTthx4IEpgSIeuPZHovxAqW4puYTqxAyeN
         eWU7ZR+6tlC6hpO2W2O6t+JWjvZHLwXg8Whmq1wCfUSaQPmHo8qWCrvLySIaX/+BNsN2
         ahmSww8trcMlUy6W/bjrk+qMfh1RfWgaiqkje3ulwc37qgGTIfMLeVVpiObDD6Pe4z7Z
         5KeX6hyMnsNfnt68rjaruWnDhPaaDuiDlMUrqxX2U9jGBPgF35uk88emybYIO3AhnQTd
         UPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJ0Lzbv+Mu8W9V+RhUx0xWFk1y7fwYBu5wT4CF95MH8=;
        b=cyNTqem6us5TF7u1LR4Z3LkynM8LqKzbBn0IOTlkqe2HYUFd6tvkH7MAD6epx/m9wz
         H+A0ARYg5aQqfrd8qy17B1q6K58cHNbQ2cY6w+Yd9S/R2TgJzEc2BrHRKT/jH+dfqBPg
         pPjJ3lIfCymSHPxbKPDuJPfpl5r369jwz/n1/qmPgZA0PM+2IHXJruFa/1o0eO8d7ESu
         gkXKk37wl+fIeDIE50czcbD/x18ZG+nbp34SOTyOVUnMAvxatPttTCpZUz3aqhxgBb0k
         Wtp8JroiSXmkl3xeKj4UnDaETtxRZhx1E0zQ2EV9pXJ6uD5JL1QBcV1d4fPmohEe9Ryc
         gaeg==
X-Gm-Message-State: AOAM533oBt82vvKZeZMj0raIJN4rJwPRYmcjrdE2alGfKKKN5W+A1U75
        bsc6U3jFydFMxtlrBWZDV4Q=
X-Google-Smtp-Source: ABdhPJyYTEMjjDucWSF6C4O1Ifi6mojSpMVx4EjwYF54bXSna6mZoXli9CMLZ343xYvjVoHz1fXX1g==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr4523032wmc.35.1614282126412;
        Thu, 25 Feb 2021 11:42:06 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a198sm890603wmd.11.2021.02.25.11.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:42:06 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] clk: bcm: Add BCM63268 timer clock and reset driver
Date:   Thu, 25 Feb 2021 20:42:01 +0100
Message-Id: <20210225194201.17001-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225194201.17001-1-noltari@gmail.com>
References: <20210225194201.17001-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add driver for BCM63268 timer clock and reset controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/clk/bcm/Kconfig              |   9 ++
 drivers/clk/bcm/Makefile             |   1 +
 drivers/clk/bcm/clk-bcm63268-timer.c | 232 +++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-bcm63268-timer.c

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index ec738f74a026..952c3b6ff71a 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -37,6 +37,15 @@ config CLK_BCM_63XX_GATE
 	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
 	  based on the MIPS architecture
 
+config CLK_BCM63268_TIMER
+	bool "Broadcom BCM63268 timer clock and reset support"
+	depends on BMIPS_GENERIC || COMPILE_TEST
+	default BMIPS_GENERIC
+	select RESET_CONTROLLER
+	help
+	  Enable timer clock and reset support for Broadcom BCM63268 DSL SoCs
+	  based on the MIPS architecture.
+
 config CLK_BCM_KONA
 	bool "Broadcom Kona CCU clock support"
 	depends on ARCH_BCM_MOBILE || COMPILE_TEST
diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
index edb66b44cb27..d0b6f4b1fb08 100644
--- a/drivers/clk/bcm/Makefile
+++ b/drivers/clk/bcm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CLK_BCM_63XX)	+= clk-bcm63xx.o
 obj-$(CONFIG_CLK_BCM_63XX_GATE)	+= clk-bcm63xx-gate.o
+obj-$(CONFIG_CLK_BCM63268_TIMER) += clk-bcm63268-timer.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona-setup.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-bcm281xx.o
diff --git a/drivers/clk/bcm/clk-bcm63268-timer.c b/drivers/clk/bcm/clk-bcm63268-timer.c
new file mode 100644
index 000000000000..5609c4ddb50c
--- /dev/null
+++ b/drivers/clk/bcm/clk-bcm63268-timer.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * BCM63268 Timer Clock and Reset Controller Driver
+ *
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/clock/bcm63268-clock.h>
+
+#define BCM63268_TIMER_RESET_SLEEP_MIN_US	10000
+#define BCM63268_TIMER_RESET_SLEEP_MAX_US	20000
+
+struct bcm63268_tclkrst_hw {
+	void __iomem *regs;
+	spinlock_t lock;
+
+	struct reset_controller_dev rcdev;
+	struct clk_hw_onecell_data data;
+};
+
+struct bcm63268_tclk_table_entry {
+	const char * const name;
+	u8 bit;
+	unsigned long flags;
+};
+
+static const struct bcm63268_tclk_table_entry bcm63268_timer_clocks[] = {
+	{
+		.name = "ephy1",
+		.bit = BCM63268_TCLK_EPHY1,
+	}, {
+		.name = "ephy2",
+		.bit = BCM63268_TCLK_EPHY2,
+	}, {
+		.name = "ephy3",
+		.bit = BCM63268_TCLK_EPHY3,
+	}, {
+		.name = "gphy1",
+		.bit = BCM63268_TCLK_GPHY1,
+	}, {
+		.name = "dsl",
+		.bit = BCM63268_TCLK_DSL,
+	}, {
+		.name = "wakeon_ephy",
+		.bit = BCM63268_TCLK_WAKEON_EPHY,
+	}, {
+		.name = "wakeon_dsl",
+		.bit = BCM63268_TCLK_WAKEON_DSL,
+	}, {
+		.name = "fap1_pll",
+		.bit = BCM63268_TCLK_FAP1,
+	}, {
+		.name = "fap2_pll",
+		.bit = BCM63268_TCLK_FAP2,
+	}, {
+		.name = "uto_50",
+		.bit = BCM63268_TCLK_UTO_50,
+	}, {
+		.name = "uto_extin",
+		.bit = BCM63268_TCLK_UTO_EXTIN,
+	}, {
+		.name = "usb_ref",
+		.bit = BCM63268_TCLK_USB_REF,
+	}, {
+		/* sentinel */
+	}
+};
+
+static inline struct bcm63268_tclkrst_hw *
+to_bcm63268_timer_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct bcm63268_tclkrst_hw, rcdev);
+}
+
+static int bcm63268_timer_reset_update(struct reset_controller_dev *rcdev,
+				unsigned long id, bool assert)
+{
+	struct bcm63268_tclkrst_hw *reset = to_bcm63268_timer_reset(rcdev);
+	unsigned long flags;
+	uint32_t val;
+
+	spin_lock_irqsave(&reset->lock, flags);
+	val = __raw_readl(reset->regs);
+	if (assert)
+		val &= ~BIT(id);
+	else
+		val |= BIT(id);
+	__raw_writel(val, reset->regs);
+	spin_unlock_irqrestore(&reset->lock, flags);
+
+	return 0;
+}
+
+static int bcm63268_timer_reset_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return bcm63268_timer_reset_update(rcdev, id, true);
+}
+
+static int bcm63268_timer_reset_deassert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	return bcm63268_timer_reset_update(rcdev, id, false);
+}
+
+static int bcm63268_timer_reset_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	bcm63268_timer_reset_update(rcdev, id, true);
+	usleep_range(BCM63268_TIMER_RESET_SLEEP_MIN_US,
+		     BCM63268_TIMER_RESET_SLEEP_MAX_US);
+
+	bcm63268_timer_reset_update(rcdev, id, false);
+	/*
+	 * Ensure component is taken out reset state by sleeping also after
+	 * deasserting the reset. Otherwise, the component may not be ready
+	 * for operation.
+	 */
+	usleep_range(BCM63268_TIMER_RESET_SLEEP_MIN_US,
+		     BCM63268_TIMER_RESET_SLEEP_MAX_US);
+
+	return 0;
+}
+
+static int bcm63268_timer_reset_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct bcm63268_tclkrst_hw *reset = to_bcm63268_timer_reset(rcdev);
+
+	return !(__raw_readl(reset->regs) & BIT(id));
+}
+
+static struct reset_control_ops bcm63268_timer_reset_ops = {
+	.assert = bcm63268_timer_reset_assert,
+	.deassert = bcm63268_timer_reset_deassert,
+	.reset = bcm63268_timer_reset_reset,
+	.status = bcm63268_timer_reset_status,
+};
+
+static int bcm63268_tclk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct bcm63268_tclk_table_entry *entry, *table;
+	struct bcm63268_tclkrst_hw *hw;
+	u8 maxbit = 0;
+	int i, ret;
+
+	table = of_device_get_match_data(dev);
+	if (!table)
+		return -EINVAL;
+
+	for (entry = table; entry->name; entry++)
+		maxbit = max_t(u8, maxbit, entry->bit);
+	maxbit++;
+
+	hw = devm_kzalloc(&pdev->dev, struct_size(hw, data.hws, maxbit),
+			  GFP_KERNEL);
+	if (!hw)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, hw);
+
+	spin_lock_init(&hw->lock);
+
+	hw->data.num = maxbit;
+	for (i = 0; i < maxbit; i++)
+		hw->data.hws[i] = ERR_PTR(-ENODEV);
+
+	hw->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hw->regs))
+		return PTR_ERR(hw->regs);
+
+	for (entry = table; entry->name; entry++) {
+		struct clk_hw *clk;
+
+		clk = clk_hw_register_gate(dev, entry->name, NULL,
+					   entry->flags, hw->regs, entry->bit,
+					   CLK_GATE_BIG_ENDIAN, &hw->lock);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto out_err;
+		}
+
+		hw->data.hws[entry->bit] = clk;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     &hw->data);
+	if (!ret)
+		return 0;
+
+	hw->rcdev.of_node = dev->of_node;
+	hw->rcdev.ops = &bcm63268_timer_reset_ops;
+
+	ret = devm_reset_controller_register(dev, &hw->rcdev);
+	if (ret)
+		dev_err(dev, "Failed to register reset controller\n");
+
+out_err:
+	for (i = 0; i < hw->data.num; i++) {
+		if (!IS_ERR(hw->data.hws[i]))
+			clk_hw_unregister_gate(hw->data.hws[i]);
+	}
+
+	return ret;
+}
+
+static const struct of_device_id bcm63268_tclk_dt_ids[] = {
+	{
+		.compatible = "brcm,bcm63268-timer-clocks",
+		.data = &bcm63268_timer_clocks,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver bcm63268_tclk = {
+	.probe = bcm63268_tclk_probe,
+	.driver = {
+		.name = "bcm63268-timer-clock",
+		.of_match_table = bcm63268_tclk_dt_ids,
+	},
+};
+builtin_platform_driver(bcm63268_tclk);
-- 
2.20.1


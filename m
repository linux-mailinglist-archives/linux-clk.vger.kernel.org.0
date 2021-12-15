Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BD7475448
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 09:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbhLOI3L (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 03:29:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:25139 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240812AbhLOI3K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 03:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639556950; x=1671092950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XMhpays0gpaeGVu0iauXje0kEJ0fuQoq7sHf8y+SHgI=;
  b=AA4BRAJg15LPhfkl8COo8mpeffeEOBznLsfw0+jMQAnJe4RurVL0e6kk
   5VOuOE3hYq1MPMW/OjJFvWL5ZIcI7xqwmuu1sZe8lw4JMDDP9V1eM9YM1
   0zEjw0nW1YIzhVyZ02uY0Q9X+ZnJAahQPzO5AoOQ4VNwxAohNp643j3iy
   y4gdChlKKa6LijagpViJYu9ktrNjWP6k2wh5DB6XMZsi8/jWRjtNfMYFT
   8qBOLjpxRkALeb3mAnAx8YKhWuZ6bzdY90Jp4QfMX0Re+udIf4AUlZ0zN
   y9Nj+MmPYoka9NNixvviULCLyO4KR8iGld0P8wCp6hh0WELCxjY1Nmxkv
   Q==;
IronPort-SDR: qrylXvjCjtbHOOzY71aj7YzRmCYI7WLUjAFCwXE3t6Q6MgYEaRHOuprvP/5HgDCdzpmXm7VBch
 KBTb/Nz+BpmIKdwTO66zTHvh86x+jdUXuHpzRfbsHGJbnSAu8kq+gk5F0pzadT0T+soNoUf70+
 iJFLz2dk+1qm/PUbSReDsn1Q3FeJ2NBqnR+4Nz4EKGZtfBYTsJYrfWwmJhMZrSs/kmZvkAuyU7
 WywRbKcZfBvP3E3B+ozsFDTp5VdmQW7iYVYo9Qnr0yShwhdLc/BZMEnJUxbcHkjhIVaOkJ2RZl
 ud74SmZMRwSwvk9V/+E3aHXu
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="139828038"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Dec 2021 01:29:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Dec 2021 01:29:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Dec 2021 01:29:07 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>,
        Padmarao Bengari <padmarao.begari@microchip.com>
Subject: [PATCH v7 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
Date:   Wed, 15 Dec 2021 08:30:02 +0000
Message-ID: <20211215083002.1353-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215083002.1353-1-conor.dooley@microchip.com>
References: <20211215083002.1353-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add support for clock configuration on Microchip PolarFire SoC

Co-developed-by: Padmarao Bengari <padmarao.begari@microchip.com>
Signed-off-by: Padmarao Bengari <padmarao.begari@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   2 +-
 drivers/clk/microchip/Kconfig    |   7 +
 drivers/clk/microchip/Makefile   |   6 +-
 drivers/clk/microchip/clk-mpfs.c | 447 +++++++++++++++++++++++++++++++
 5 files changed, 460 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1b992a554ff8..fe6c757e44fb 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -409,6 +409,7 @@ source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mstar/Kconfig"
+source "drivers/clk/microchip/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d8565ef01b34..d4e43d0431a3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -90,7 +90,7 @@ obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
 obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
 obj-y					+= mediatek/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
-obj-$(CONFIG_MACH_PIC32)		+= microchip/
+obj-y					+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
 endif
diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
new file mode 100644
index 000000000000..f5edc7b3c07c
--- /dev/null
+++ b/drivers/clk/microchip/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MCHP_CLK_MPFS
+	bool "Clk driver for PolarFire SoC"
+	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
+	help
+	  Supports Clock Configuration for PolarFire SoC
diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
index f34b247e870f..0dce0b12eac4 100644
--- a/drivers/clk/microchip/Makefile
+++ b/drivers/clk/microchip/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
-obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
+
+obj-$(CONFIG_COMMON_CLK_PIC32)	+= clk-core.o
+obj-$(CONFIG_PIC32MZDA)		+= clk-pic32mzda.o
+obj-$(CONFIG_MCHP_CLK_MPFS)	+= clk-mpfs.o
diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
new file mode 100644
index 000000000000..37277beb6a7b
--- /dev/null
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Daire McNamara,<daire.mcnamara@microchip.com>
+ * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ */
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <dt-bindings/clock/microchip,mpfs-clock.h>
+
+/* address offset of control registers */
+#define REG_CLOCK_CONFIG_CR	0x08u
+#define REG_SUBBLK_CLOCK_CR	0x84u
+#define REG_SUBBLK_RESET_CR	0x88u
+
+struct mpfs_clock_data {
+	void __iomem *base;
+	struct clk_hw_onecell_data hw_data;
+};
+
+struct mpfs_cfg_clock {
+	const char *name;
+	const struct clk_div_table *table;
+	struct clk_hw *parent;
+	unsigned long flags;
+	unsigned int id;
+	u8 shift;
+	u8 width;
+};
+
+struct mpfs_cfg_hw_clock {
+	struct mpfs_cfg_clock cfg;
+	void __iomem *sys_base;
+	/* lock is used to prevent multiple writes */
+	spinlock_t *lock;
+	struct clk_hw hw;
+	struct clk_init_data init;
+};
+
+#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
+
+struct mpfs_periph_clock {
+	const char *name;
+	struct clk_hw *parent;
+	unsigned long flags;
+	unsigned int id;
+	u8 shift;
+};
+
+struct mpfs_periph_hw_clock {
+	struct mpfs_periph_clock periph;
+	void __iomem *sys_base;
+	/* lock is used to prevent multiple writes */
+	spinlock_t *lock;
+	struct clk_hw hw;
+};
+
+#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
+
+/*
+ * mpfs_clk_lock prevents anything else from writing to the
+ * mpfs clk block while a software locked register is being written.
+ */
+static DEFINE_SPINLOCK(mpfs_clk_lock);
+
+static const struct clk_div_table mpfs_div_cpu_axi_table[] = {
+	{ 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 8 },
+	{ 0, 0 }
+};
+
+static const struct clk_div_table mpfs_div_ahb_table[] = {
+	{ 1, 2 }, { 2, 4}, { 3, 8 },
+	{ 0, 0 }
+};
+
+static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
+	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
+	void __iomem *base_addr = cfg_hw->sys_base;
+	u32 val;
+
+	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->shift;
+	val &= clk_div_mask(cfg->width);
+
+	return prate / (1u << val);
+}
+
+static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
+{
+	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
+	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
+
+	return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, cfg->flags);
+}
+
+static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
+{
+	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
+	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
+	void __iomem *base_addr = cfg_hw->sys_base;
+	unsigned long flags = 0;
+	u32 val;
+	int divider_setting;
+
+	divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, cfg_hw->cfg.flags);
+
+	if (divider_setting < 0)
+		return divider_setting;
+
+	spin_lock_irqsave(cfg_hw->lock, flags);
+
+	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
+	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
+	val |= divider_setting << cfg->shift;
+	writel_relaxed(val, base_addr + REG_CLOCK_CONFIG_CR);
+
+	spin_unlock_irqrestore(cfg_hw->lock, flags);
+
+	return 0;
+}
+
+static const struct clk_ops mpfs_clk_cfg_ops = {
+	.recalc_rate = mpfs_cfg_clk_recalc_rate,
+	.round_rate = mpfs_cfg_clk_round_rate,
+	.set_rate = mpfs_cfg_clk_set_rate,
+};
+
+#define CLK_CFG(_id, _name, _shift, _width, _table, _flags) {				\
+		.cfg.id = _id,								\
+		.cfg.name = _name,							\
+		.cfg.shift = _shift,							\
+		.cfg.width = _width,							\
+		.cfg.table = _table,							\
+	}
+
+static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
+	CLK_CFG(CLK_CPU, "clk_cpu", 0, 2, mpfs_div_cpu_axi_table, 0),
+	CLK_CFG(CLK_AXI, "clk_axi", 2, 2, mpfs_div_cpu_axi_table, 0),
+	CLK_CFG(CLK_AHB, "clk_ahb", 4, 2, mpfs_div_ahb_table, 0),
+};
+
+static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
+{
+	devm_clk_hw_unregister(dev, hw);
+}
+
+static struct clk_hw *mpfs_clk_register_cfg(struct device *dev,
+					    struct mpfs_cfg_hw_clock *cfg_hw,
+					    void __iomem *sys_base)
+{
+	struct clk_hw *hw;
+	int err;
+
+	cfg_hw->sys_base = sys_base;
+	cfg_hw->lock = &mpfs_clk_lock;
+
+	hw = &cfg_hw->hw;
+	err = devm_clk_hw_register(dev, hw);
+	if (err)
+		return ERR_PTR(err);
+
+	return hw;
+}
+
+static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
+				  unsigned int num_clks, struct mpfs_clock_data *data)
+{
+	struct clk_hw *hw;
+	struct clk *clk_parent;
+	void __iomem *sys_base = data->base;
+	unsigned int i, id;
+
+	for (i = 0; i < num_clks; i++) {
+		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
+
+		clk_parent = devm_clk_get(dev, NULL);
+		if (IS_ERR(clk_parent))
+			return -EPROBE_DEFER;
+
+		cfg_hw->cfg.parent = __clk_get_hw(clk_parent);
+		cfg_hw->hw.init = CLK_HW_INIT_HW(cfg_hw->cfg.name, cfg_hw->cfg.parent,
+						 &mpfs_clk_cfg_ops, cfg_hw->cfg.flags);
+		hw = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "failed to register clock %s\n", cfg_hw->cfg.name);
+			goto err_clk;
+		}
+
+		id = cfg_hws[i].cfg.id;
+		data->hw_data.hws[id] = hw;
+	}
+
+	return 0;
+
+err_clk:
+	while (i--)
+		mpfs_clk_unregister_cfg(dev, data->hw_data.hws[cfg_hws[i].cfg.id]);
+
+	return PTR_ERR(hw);
+}
+
+static int mpfs_periph_clk_enable(struct clk_hw *hw)
+{
+	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
+	struct mpfs_periph_clock *periph = &periph_hw->periph;
+	void __iomem *base_addr = periph_hw->sys_base;
+	u32 reg, val;
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(periph_hw->lock, flags);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
+	val = reg & ~(1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	val = reg | (1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
+
+	spin_unlock_irqrestore(periph_hw->lock, flags);
+
+	return 0;
+}
+
+static void mpfs_periph_clk_disable(struct clk_hw *hw)
+{
+	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
+	struct mpfs_periph_clock *periph = &periph_hw->periph;
+	void __iomem *base_addr = periph_hw->sys_base;
+	u32 reg, val;
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(periph_hw->lock, flags);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
+	val = reg | (1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	val = reg & ~(1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
+
+	spin_unlock_irqrestore(periph_hw->lock, flags);
+}
+
+static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
+{
+	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
+	struct mpfs_periph_clock *periph = &periph_hw->periph;
+	void __iomem *base_addr = periph_hw->sys_base;
+	u32 reg;
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
+	if ((reg & (1u << periph->shift)) == 0u) {
+		reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+		if (reg & (1u << periph->shift))
+			return 1;
+	}
+
+	return 0;
+}
+
+static unsigned long mpfs_periph_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	return prate;
+}
+
+static const struct clk_ops mpfs_periph_clk_ops = {
+	.enable = mpfs_periph_clk_enable,
+	.disable = mpfs_periph_clk_disable,
+	.is_enabled = mpfs_periph_clk_is_enabled,
+	.recalc_rate = mpfs_periph_clk_recalc_rate,
+};
+
+#define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {				\
+		.periph.id = _id,							\
+		.periph.name = _name,							\
+		.periph.shift = _shift,							\
+		.periph.flags = _flags,							\
+		.periph.parent = _parent,						\
+}
+
+#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
+
+static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
+	CLK_PERIPH(CLK_ENVM, "clk_periph_envm", PARENT_CLK(AHB), 0, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
+	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
+	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
+	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(AHB), 4, 0),
+	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
+	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
+	CLK_PERIPH(CLK_MMUART3, "clk_periph_mmuart3", PARENT_CLK(AHB), 8, 0),
+	CLK_PERIPH(CLK_MMUART4, "clk_periph_mmuart4", PARENT_CLK(AHB), 9, 0),
+	CLK_PERIPH(CLK_SPI0, "clk_periph_spi0", PARENT_CLK(AHB), 10, 0),
+	CLK_PERIPH(CLK_SPI1, "clk_periph_spi1", PARENT_CLK(AHB), 11, 0),
+	CLK_PERIPH(CLK_I2C0, "clk_periph_i2c0", PARENT_CLK(AHB), 12, 0),
+	CLK_PERIPH(CLK_I2C1, "clk_periph_i2c1", PARENT_CLK(AHB), 13, 0),
+	CLK_PERIPH(CLK_CAN0, "clk_periph_can0", PARENT_CLK(AHB), 14, 0),
+	CLK_PERIPH(CLK_CAN1, "clk_periph_can1", PARENT_CLK(AHB), 15, 0),
+	CLK_PERIPH(CLK_USB, "clk_periph_usb", PARENT_CLK(AHB), 16, 0),
+	CLK_PERIPH(CLK_RTC, "clk_periph_rtc", PARENT_CLK(AHB), 18, 0),
+	CLK_PERIPH(CLK_QSPI, "clk_periph_qspi", PARENT_CLK(AHB), 19, 0),
+	CLK_PERIPH(CLK_GPIO0, "clk_periph_gpio0", PARENT_CLK(AHB), 20, 0),
+	CLK_PERIPH(CLK_GPIO1, "clk_periph_gpio1", PARENT_CLK(AHB), 21, 0),
+	CLK_PERIPH(CLK_GPIO2, "clk_periph_gpio2", PARENT_CLK(AHB), 22, 0),
+	CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", PARENT_CLK(AHB), 23, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, 0),
+	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
+};
+
+static void mpfs_clk_unregister_periph(struct device *dev, struct clk_hw *hw)
+{
+	devm_clk_hw_unregister(dev, hw);
+}
+
+static struct clk_hw *mpfs_clk_register_periph(struct device *dev,
+					       struct mpfs_periph_hw_clock *periph_hw,
+					       void __iomem *sys_base)
+{
+	struct clk_hw *hw;
+	int err;
+
+	periph_hw->sys_base = sys_base;
+	periph_hw->lock = &mpfs_clk_lock;
+	hw = &periph_hw->hw;
+	err = devm_clk_hw_register(dev, hw);
+	if (err)
+		return ERR_PTR(err);
+
+	return hw;
+}
+
+static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
+				     int num_clks, struct mpfs_clock_data *data)
+{
+	struct clk_hw *hw;
+	void __iomem *sys_base = data->base;
+	unsigned int i, id;
+
+	for (i = 0; i < num_clks; i++) {
+		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
+
+		periph_hw->hw.init = CLK_HW_INIT_HW(periph_hw->periph.name,
+						    periph_hw->periph.parent,
+						    &mpfs_periph_clk_ops,
+						    periph_hw->periph.flags);
+		hw = mpfs_clk_register_periph(dev, periph_hw, sys_base);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "failed to register clock %s\n", periph_hw->periph.name);
+			goto err_clk;
+		}
+
+		id = periph_hws[i].periph.id;
+		data->hw_data.hws[id] = hw;
+	}
+
+	return 0;
+
+err_clk:
+	while (i--)
+		mpfs_clk_unregister_periph(dev, data->hw_data.hws[periph_hws[i].periph.id]);
+
+	return PTR_ERR(hw);
+}
+
+static int mpfs_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_clock_data *clk_data;
+	struct resource *res;
+	unsigned int num_clks;
+	int ret;
+
+	//CLK_RESERVED is not part of cfg_clks nor periph_clks, so add 1
+	num_clks = ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_clks) + 1;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hw_data.hws, num_clks), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	clk_data->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(clk_data->base))
+		return PTR_ERR(clk_data->base);
+
+	clk_data->hw_data.num = num_clks;
+
+	ret = mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpfs_cfg_clks), clk_data);
+	if (ret)
+		goto err_clk;
+
+	ret = mpfs_clk_register_periphs(dev, mpfs_periph_clks, ARRAY_SIZE(mpfs_periph_clks),
+					clk_data);
+	if (ret)
+		goto err_clk;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clk_data->hw_data);
+	if (ret)
+		goto err_clk;
+
+	dev_info(dev, "registered MPFS core clocks\n");
+	return ret;
+
+err_clk:
+	dev_err(dev, "failed to register MPFS core clocks\n");
+	return ret;
+}
+
+static const struct of_device_id mpfs_clk_of_match_table[] = {
+	{ .compatible = "microchip,mpfs-clkcfg", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
+
+static struct platform_driver mpfs_clk_driver = {
+	.probe = mpfs_clk_probe,
+	.driver	= {
+		.name = "microchip-mpfs-clkcfg",
+		.of_match_table = mpfs_clk_of_match_table,
+	},
+};
+
+static int __init clk_mpfs_init(void)
+{
+	return platform_driver_register(&mpfs_clk_driver);
+}
+core_initcall(clk_mpfs_init);
+
+static void __exit clk_mpfs_exit(void)
+{
+	platform_driver_unregister(&mpfs_clk_driver);
+}
+module_exit(clk_mpfs_exit);
+
+MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:clk-mpfs");
-- 
2.33.1


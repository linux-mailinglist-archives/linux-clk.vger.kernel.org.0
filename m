Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C4836D749
	for <lists+linux-clk@lfdr.de>; Wed, 28 Apr 2021 14:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbhD1M2W (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Apr 2021 08:28:22 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:5854 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbhD1M2W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Apr 2021 08:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1619612857; x=1651148857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3/kUEZLFrtJTlt4+sEtnmMMIRRxSmYDcZ0MnWaY3T1M=;
  b=g/0D0hgrjMF/Zp0vNe//8acfashbi8Zh67JHsVwSY8D1q/T8XmOoNted
   Y7m8qazoPgvlu+MowpRLDRE+HDT29HWN49W+clHo/hb1sUheUYw8RXFn6
   h9ORWbIGDtJr9+klIY1pPij2trTYJxGRcRg/E6AQRU34X+b095Ou055Lc
   r81Z8iZeh6y+GTXw7kA10qhMIbmf+ShM4Wlg5wAAvbecrPGanfJULQKdJ
   ryX8X9tN2beLcZQ7unSMp9Y5VO86fWQPUdUAwCZCgPCcdjOdIr0FLsQty
   Dsysj2hRokv59qupvi+4hCkzL4c4YUaollNEuOZ9l4avoqf49M90NIdMP
   Q==;
IronPort-SDR: 7oPAelhJiDHLUN07dcHnv80OEuELeBcrqLAx0pM/MEA5kpxyOanyfDR4UTzaVXiq0cOJugbSjl
 ter29OS5OWrarQ4D1qrtV3Wg03/EYVLzrEkPcdza/wU6T9fGKfxfmWwVLEj1B0ETMOMH8gWKIe
 E18vlqpqrU8HXNq2m2OeiWIeedirzMbrcCadDn/BM2Cl/6sXN8mVUezWYyq8lHjAqLcCvpSQNY
 /KZANILuRSUVHic1lc+y3gghP8/VRNdt5MrGClGThc1RnpjZ+swiT0UFxyTrhKvSlZ9hMUGj1p
 GAo=
X-IronPort-AV: E=Sophos;i="5.82,258,1613458800"; 
   d="scan'208";a="115190408"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Apr 2021 05:27:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 05:27:21 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 28 Apr 2021 05:27:19 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v4 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
Date:   Wed, 28 Apr 2021 13:27:11 +0100
Message-ID: <20210428122711.2136467-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
References: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add support for clock configuration on Microchip PolarFire SoC

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   2 +-
 drivers/clk/microchip/Kconfig    |   7 +
 drivers/clk/microchip/Makefile   |   6 +-
 drivers/clk/microchip/clk-mpfs.c | 444 +++++++++++++++++++++++++++++++
 5 files changed, 457 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1d1891b9cad2..487218ad3348 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -388,6 +388,7 @@ source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mstar/Kconfig"
+source "drivers/clk/microchip/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/renesas/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9b582b3fca34..5c821c3b2fc6 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -89,7 +89,7 @@ obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
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
index 000000000000..541f88181877
--- /dev/null
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Daire McNamara,<daire.mcnamara@microchip.com>
+ * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ */
+#include <linux/clk-provider.h>
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
+	unsigned int id;
+	const char *name;
+	u8 shift;
+	u8 width;
+	const struct clk_div_table *table;
+	unsigned long flags;
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
+	unsigned int id;
+	const char *name;
+	u8 shift;
+	unsigned long flags;
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
+static struct clk_parent_data mpfs_cfg_parent[] = {
+	{ .fw_name = "msspllclk", .name = "msspllclk" },
+};
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
+	unsigned long rate;
+	u32 val;
+
+	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->shift;
+	val &= clk_div_mask(cfg->width);
+	rate = prate / (1u << val);
+
+	return rate;
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
+	if (cfg_hw->lock)
+		spin_lock_irqsave(cfg_hw->lock, flags);
+	else
+		__acquire(cfg_hw->lock);
+
+	val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
+	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
+	val |= divider_setting << cfg->shift;
+	writel_relaxed(val, base_addr + REG_CLOCK_CONFIG_CR);
+
+	if (cfg_hw->lock)
+		spin_unlock_irqrestore(cfg_hw->lock, flags);
+	else
+		__release(cfg_hw->lock);
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
+#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags) {	\
+		.cfg.id = _id,								\
+		.cfg.name = _name,							\
+		.cfg.shift = _shift,							\
+		.cfg.width = _width,							\
+		.cfg.table = _table,							\
+		.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent, &mpfs_clk_cfg_ops,	\
+						    _flags),				\
+	}
+
+static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
+	CLK_CFG(CLK_CPU, "clk_cpu", mpfs_cfg_parent, 0, 2, mpfs_div_cpu_axi_table, 0),
+	CLK_CFG(CLK_AXI, "clk_axi", mpfs_cfg_parent, 2, 2, mpfs_div_cpu_axi_table, 0),
+	CLK_CFG(CLK_AHB, "clk_ahb", mpfs_cfg_parent, 4, 2, mpfs_div_ahb_table, 0),
+};
+
+static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
+{
+	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
+
+	devm_clk_hw_unregister(dev, hw);
+	kfree(cfg_hw);
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
+				  int num_clks, struct mpfs_clock_data *data)
+{
+	struct clk_hw *hw;
+	void __iomem *sys_base = data->base;
+	unsigned int i, id;
+
+	for (i = 0; i < num_clks; i++) {
+		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
+
+		hw = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "%s: failed to register clock %s\n", __func__,
+				cfg_hw->cfg.name);
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
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
+	val = reg & ~(1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	val = reg | (1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
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
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
+	val = reg | (1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
+
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	val = reg & ~(1u << periph->shift);
+	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
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
+		.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,	\
+					  _flags),					\
+	}
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
+	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, 0),
+	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, 0),
+	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, 0),
+	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, 0),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, 0),
+	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
+};
+
+static void mpfs_clk_unregister_periph(struct device *dev, struct clk_hw *hw)
+{
+	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
+
+	devm_clk_hw_unregister(dev, hw);
+	kfree(periph_hw);
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
+
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
+		hw = mpfs_clk_register_periph(dev, periph_hw, sys_base);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "%s: failed to register clock %s\n", __func__,
+				periph_hw->periph.name);
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
+	int num_clks;
+	int ret;
+
+	num_clks = ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_clks);
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
2.25.1


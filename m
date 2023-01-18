Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37CA46727F5
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jan 2023 20:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjARTPs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Jan 2023 14:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjARTPq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 14:15:46 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F31D53B05;
        Wed, 18 Jan 2023 11:15:41 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1BF4385343;
        Wed, 18 Jan 2023 20:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674069339;
        bh=qGw97+LyY1D4M9px/HE7lTajMDXJCzQ+TIT9yza7auE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MvqWR5wytGzAkp+6JD0l/oZx5ceIKKvitArNf9GOUkHChf1GC9Nmhzb7V826ActyU
         JAyU1xaH/5RzyDcR6fKKEMElUVe9HEQq89FFrdAURU+TBgBPicAIsaaGPAj1W1pIoQ
         3g4llj6Ug5pqqonoR1RGsOW5tG7M3wG7K9pyEj5Og0JKoe463tdXBX/151/tSm8PDX
         wWJ3J+XCaD/RbhQgAzRiPDBmWOApPXBx2hHFNrfdAQxA+jLD0Fd6Ul3s3BCYwuTt91
         JeJTzugMThKfELuxBExIyF6fy1bvO2LHNuj1BdChQRRj9/Aw9YlAH7sxHvI+4cRkz5
         WqHtrmzDQMZww==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/2] clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators
Date:   Wed, 18 Jan 2023 20:15:21 +0100
Message-Id: <20230118191521.15544-2-marex@denx.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118191521.15544-1-marex@denx.de>
References: <20230118191521.15544-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add driver for the Skyworks Si521xx PCIe clock generators. Supported models
are Si52144/Si52146/Si52147, tested model is Si52144. It should be possible
to add Si5213x series as well.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
To: linux-clk@vger.kernel.org
---
V2: - Include bitfield.h to pull in FIELD_PREP macro
V3: No change
---
 drivers/clk/Kconfig       |   9 +
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-si521xx.c | 395 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+)
 create mode 100644 drivers/clk/clk-si521xx.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d79905f3e1744..b853fc60d118d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -368,6 +368,15 @@ config COMMON_CLK_RS9_PCIE
 	  This driver supports the Renesas 9-series PCIe clock generator
 	  models 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ.
 
+config COMMON_CLK_SI521XX
+	tristate "Clock driver for SkyWorks Si521xx PCIe clock generators"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the SkyWorks Si521xx PCIe clock generator
+	  models Si52144/Si52146/Si52147.
+
 config COMMON_CLK_VC5
 	tristate "Clock driver for IDT VersaClock 5,6 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a256..5e2c225f040c4 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
+obj-$(CONFIG_COMMON_CLK_SI521XX)	+= clk-si521xx.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_VC7)		+= clk-versaclock7.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
new file mode 100644
index 0000000000000..de952a6999479
--- /dev/null
+++ b/drivers/clk/clk-si521xx.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Skyworks Si521xx PCIe clock generator driver
+ *
+ * The following series can be supported:
+ *   - Si52144 - 4x DIFF
+ *   - Si52146 - 6x DIFF
+ *   - Si52147 - 9x DIFF
+ * Currently tested:
+ *   - Si52144
+ *
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitrev.h>
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+/* OE1 and OE2 register */
+#define SI521XX_REG_OE(n)			(((n) & 0x1) + 1)
+#define SI521XX_REG_ID				0x3
+#define SI521XX_REG_ID_PROG			GENMASK(7, 4)
+#define SI521XX_REG_ID_VENDOR			GENMASK(3, 0)
+#define SI521XX_REG_BC				0x4
+#define SI521XX_REG_DA				0x5
+#define SI521XX_REG_DA_AMP_SEL			BIT(7)
+#define SI521XX_REG_DA_AMP_MASK			GENMASK(6, 4)
+#define SI521XX_REG_DA_AMP_MIN			300000
+#define SI521XX_REG_DA_AMP_DEFAULT		800000
+#define SI521XX_REG_DA_AMP_MAX			1000000
+#define SI521XX_REG_DA_AMP_STEP			100000
+#define SI521XX_REG_DA_AMP(UV)			\
+	FIELD_PREP(SI521XX_REG_DA_AMP_MASK,	\
+		   ((UV) - SI521XX_REG_DA_AMP_MIN) / SI521XX_REG_DA_AMP_STEP)
+#define SI521XX_REG_DA_UNKNOWN			BIT(3)	/* Always set */
+
+/* Count of populated OE bits in control register ref, 1 and 2 */
+#define SI521XX_OE_MAP(cr1, cr2)	(((cr2) << 8) | (cr1))
+#define SI521XX_OE_MAP_GET_OE(oe, map)	(((map) >> (((oe) - 1) * 8)) & 0xff)
+
+#define SI521XX_DIFF_MULT	4
+#define SI521XX_DIFF_DIV	1
+
+/* Supported Skyworks Si521xx models. */
+enum si521xx_model {
+	SI52144 = 0x44,
+	SI52146 = 0x46,
+	SI52147 = 0x47,
+};
+
+struct si521xx;
+
+struct si_clk {
+	struct clk_hw		hw;
+	struct si521xx		*si;
+	u8			reg;
+	u8			bit;
+};
+
+struct si521xx {
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+	struct si_clk		clk_dif[9];
+	u16			chip_info;
+	u8			pll_amplitude;
+};
+
+/*
+ * Si521xx i2c regmap
+ */
+static const struct regmap_range si521xx_readable_ranges[] = {
+	regmap_reg_range(SI521XX_REG_OE(0), SI521XX_REG_DA),
+};
+
+static const struct regmap_access_table si521xx_readable_table = {
+	.yes_ranges = si521xx_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(si521xx_readable_ranges),
+};
+
+static const struct regmap_range si521xx_writeable_ranges[] = {
+	regmap_reg_range(SI521XX_REG_OE(0), SI521XX_REG_OE(1)),
+	regmap_reg_range(SI521XX_REG_BC, SI521XX_REG_DA),
+};
+
+static const struct regmap_access_table si521xx_writeable_table = {
+	.yes_ranges = si521xx_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(si521xx_writeable_ranges),
+};
+
+static int si521xx_regmap_i2c_write(void *context, unsigned int reg,
+				    unsigned int val)
+{
+	struct i2c_client *i2c = context;
+	const u8 data[3] = { reg, 1, val };
+	const int count = ARRAY_SIZE(data);
+	int ret;
+
+	ret = i2c_master_send(i2c, data, count);
+	if (ret == count)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static int si521xx_regmap_i2c_read(void *context, unsigned int reg,
+				   unsigned int *val)
+{
+	struct i2c_client *i2c = context;
+	struct i2c_msg xfer[2];
+	u8 txdata = reg;
+	u8 rxdata[2];
+	int ret;
+
+	xfer[0].addr = i2c->addr;
+	xfer[0].flags = 0;
+	xfer[0].len = 1;
+	xfer[0].buf = (void *)&txdata;
+
+	xfer[1].addr = i2c->addr;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].len = 2;
+	xfer[1].buf = (void *)rxdata;
+
+	ret = i2c_transfer(i2c->adapter, xfer, 2);
+	if (ret < 0)
+		return ret;
+	if (ret != 2)
+		return -EIO;
+
+	/*
+	 * Byte 0 is transfer length, which is always 1 due
+	 * to BCP register programming to 1 in si521xx_probe(),
+	 * ignore it and use data from Byte 1.
+	 */
+	*val = rxdata[1];
+	return 0;
+}
+
+static const struct regmap_config si521xx_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+	.max_register = SI521XX_REG_DA,
+	.rd_table = &si521xx_readable_table,
+	.wr_table = &si521xx_writeable_table,
+	.reg_write = si521xx_regmap_i2c_write,
+	.reg_read = si521xx_regmap_i2c_read,
+};
+
+static unsigned long si521xx_diff_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * SI521XX_DIFF_MULT;
+	do_div(rate, SI521XX_DIFF_DIV);
+	return (unsigned long)rate;
+}
+
+static long si521xx_diff_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	unsigned long best_parent;
+
+	best_parent = (rate / SI521XX_DIFF_MULT) * SI521XX_DIFF_DIV;
+	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+
+	return (*prate / SI521XX_DIFF_DIV) * SI521XX_DIFF_MULT;
+}
+
+static int si521xx_diff_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * si521xx_diff_round_rate returns values that ensure this call is a
+	 * nop.
+	 */
+
+	return 0;
+}
+
+#define to_si521xx_clk(_hw) container_of(_hw, struct si_clk, hw)
+
+static int si521xx_diff_prepare(struct clk_hw *hw)
+{
+	struct si_clk *si_clk = to_si521xx_clk(hw);
+	struct si521xx *si = si_clk->si;
+
+	regmap_set_bits(si->regmap, SI521XX_REG_OE(si_clk->reg), si_clk->bit);
+
+	return 0;
+}
+
+static void si521xx_diff_unprepare(struct clk_hw *hw)
+{
+	struct si_clk *si_clk = to_si521xx_clk(hw);
+	struct si521xx *si = si_clk->si;
+
+	regmap_clear_bits(si->regmap, SI521XX_REG_OE(si_clk->reg), si_clk->bit);
+}
+
+const struct clk_ops si521xx_diff_clk_ops = {
+	.round_rate	= si521xx_diff_round_rate,
+	.set_rate	= si521xx_diff_set_rate,
+	.recalc_rate	= si521xx_diff_recalc_rate,
+	.prepare	= si521xx_diff_prepare,
+	.unprepare	= si521xx_diff_unprepare,
+};
+
+static int si521xx_get_common_config(struct si521xx *si)
+{
+	struct i2c_client *client = si->client;
+	struct device_node *np = client->dev.of_node;
+	unsigned int amp;
+	int ret;
+
+	/* Set defaults */
+	si->pll_amplitude = SI521XX_REG_DA_AMP(SI521XX_REG_DA_AMP_DEFAULT);
+
+	/* Output clock amplitude */
+	ret = of_property_read_u32(np, "skyworks,out-amplitude-microvolt",
+				   &amp);
+	if (!ret) {
+		if (amp < SI521XX_REG_DA_AMP_MIN || amp > SI521XX_REG_DA_AMP_MAX ||
+		    amp % SI521XX_REG_DA_AMP_STEP) {
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid skyworks,out-amplitude-microvolt value\n");
+		}
+		si->pll_amplitude = SI521XX_REG_DA_AMP(amp);
+	}
+
+	return 0;
+}
+
+static void si521xx_update_config(struct si521xx *si)
+{
+	/* If amplitude is non-default, update it. */
+	if (si->pll_amplitude == SI521XX_REG_DA_AMP(SI521XX_REG_DA_AMP_DEFAULT))
+		return;
+
+	regmap_update_bits(si->regmap, SI521XX_REG_DA,
+			   SI521XX_REG_DA_AMP_MASK, si->pll_amplitude);
+}
+
+static void si521xx_diff_idx_to_reg_bit(const u16 chip_info, const int idx,
+					struct si_clk *clk)
+{
+	unsigned long mask;
+	int oe, b, ctr = 0;
+
+	for (oe = 1; oe <= 2; oe++) {
+		mask = bitrev8(SI521XX_OE_MAP_GET_OE(oe, chip_info));
+		for_each_set_bit(b, &mask, 8) {
+			if (ctr++ != idx)
+				continue;
+			clk->reg = SI521XX_REG_OE(oe);
+			clk->bit = 7 - b;
+			return;
+		}
+	}
+}
+
+static struct clk_hw *
+si521xx_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct si521xx *si = data;
+	unsigned int idx = clkspec->args[0];
+
+	return &si->clk_dif[idx].hw;
+}
+
+static int si521xx_probe(struct i2c_client *client)
+{
+	const u16 chip_info = (u16)(uintptr_t)device_get_match_data(&client->dev);
+	const struct clk_parent_data clk_parent_data = { .index = 0 };
+	struct si521xx *si;
+	unsigned char name[6] = "DIFF0";
+	struct clk_init_data init = {};
+	int i, ret;
+
+	if (!chip_info)
+		return -EINVAL;
+
+	si = devm_kzalloc(&client->dev, sizeof(*si), GFP_KERNEL);
+	if (!si)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, si);
+	si->client = client;
+
+	/* Fetch common configuration from DT (if specified) */
+	ret = si521xx_get_common_config(si);
+	if (ret)
+		return ret;
+
+	si->regmap = devm_regmap_init(&client->dev, NULL, client,
+				      &si521xx_regmap_config);
+	if (IS_ERR(si->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(si->regmap),
+				     "Failed to allocate register map\n");
+
+	/* Always read back 1 Byte via I2C */
+	ret = regmap_write(si->regmap, SI521XX_REG_BC, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Register clock */
+	for (i = 0; i < hweight16(chip_info); i++) {
+		memset(&init, 0, sizeof(init));
+		snprintf(name, 6, "DIFF%d", i);
+		init.name = name;
+		init.ops = &si521xx_diff_clk_ops;
+		init.parent_data = &clk_parent_data;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+
+		si->clk_dif[i].hw.init = &init;
+		si->clk_dif[i].si = si;
+
+		si521xx_diff_idx_to_reg_bit(chip_info, i, &si->clk_dif[i]);
+
+		ret = devm_clk_hw_register(&client->dev, &si->clk_dif[i].hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&client->dev, si521xx_of_clk_get, si);
+	if (!ret)
+		si521xx_update_config(si);
+
+	return ret;
+}
+
+static int __maybe_unused si521xx_suspend(struct device *dev)
+{
+	struct si521xx *si = dev_get_drvdata(dev);
+
+	regcache_cache_only(si->regmap, true);
+	regcache_mark_dirty(si->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused si521xx_resume(struct device *dev)
+{
+	struct si521xx *si = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(si->regmap, false);
+	ret = regcache_sync(si->regmap);
+	if (ret)
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	return ret;
+}
+
+static const struct i2c_device_id si521xx_id[] = {
+	{ "si52144", .driver_data = SI521XX_OE_MAP(0x5, 0xc0) },
+	{ "si52146", .driver_data = SI521XX_OE_MAP(0x15, 0xe0) },
+	{ "si52147", .driver_data = SI521XX_OE_MAP(0x17, 0xf8) },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, si521xx_id);
+
+static const struct of_device_id clk_si521xx_of_match[] = {
+	{ .compatible = "skyworks,si52144", .data = (void *)SI521XX_OE_MAP(0x5, 0xc0) },
+	{ .compatible = "skyworks,si52146", .data = (void *)SI521XX_OE_MAP(0x15, 0xe0) },
+	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x15, 0xf8) },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
+
+static SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
+
+static struct i2c_driver si521xx_driver = {
+	.driver = {
+		.name = "clk-si521xx",
+		.pm	= &si521xx_pm_ops,
+		.of_match_table = clk_si521xx_of_match,
+	},
+	.probe_new	= si521xx_probe,
+	.id_table	= si521xx_id,
+};
+module_i2c_driver(si521xx_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("Skyworks Si521xx PCIe clock generator driver");
+MODULE_LICENSE("GPL");
-- 
2.39.0


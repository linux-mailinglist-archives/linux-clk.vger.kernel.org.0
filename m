Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82B51379AE
	for <lists+linux-clk@lfdr.de>; Fri, 10 Jan 2020 23:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgAJWao (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 10 Jan 2020 17:30:44 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40321 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbgAJWan (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jan 2020 17:30:43 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F1A4360003;
        Fri, 10 Jan 2020 22:30:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Karl=20Rudb=C3=A6k=20Olsen?= <karl@micro-technic.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] clk: at91: add sama5d3 pmc driver
Date:   Fri, 10 Jan 2020 23:30:33 +0100
Message-Id: <20200110223033.1261791-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a driver for the PMC clocks of the sama5d3.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes in v2:
 - fixed the output range for the paripheral clocks
 - added a comment why the PMC driver can't be a platform driver

 drivers/clk/at91/Makefile  |   1 +
 drivers/clk/at91/sama5d3.c | 240 +++++++++++++++++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 drivers/clk/at91/sama5d3.c

diff --git a/drivers/clk/at91/Makefile b/drivers/clk/at91/Makefile
index 3732241352ce..e3be7f40f79e 100644
--- a/drivers/clk/at91/Makefile
+++ b/drivers/clk/at91/Makefile
@@ -17,5 +17,6 @@ obj-$(CONFIG_HAVE_AT91_I2S_MUX_CLK)	+= clk-i2s-mux.o
 obj-$(CONFIG_HAVE_AT91_SAM9X60_PLL)	+= clk-sam9x60-pll.o
 obj-$(CONFIG_SOC_AT91SAM9) += at91sam9260.o at91sam9rl.o at91sam9x5.o
 obj-$(CONFIG_SOC_SAM9X60) += sam9x60.o
+obj-$(CONFIG_SOC_SAMA5D3) += sama5d3.o
 obj-$(CONFIG_SOC_SAMA5D4) += sama5d4.o
 obj-$(CONFIG_SOC_SAMA5D2) += sama5d2.o
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
new file mode 100644
index 000000000000..88506f909c08
--- /dev/null
+++ b/drivers/clk/at91/sama5d3.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/at91.h>
+
+#include "pmc.h"
+
+static const struct clk_master_characteristics mck_characteristics = {
+	.output = { .min = 0, .max = 166000000 },
+	.divisors = { 1, 2, 4, 3 },
+};
+
+static u8 plla_out[] = { 0 };
+
+static u16 plla_icpll[] = { 0 };
+
+static const struct clk_range plla_outputs[] = {
+	{ .min = 400000000, .max = 1000000000 },
+};
+
+static const struct clk_pll_characteristics plla_characteristics = {
+	.input = { .min = 8000000, .max = 50000000 },
+	.num_output = ARRAY_SIZE(plla_outputs),
+	.output = plla_outputs,
+	.icpll = plla_icpll,
+	.out = plla_out,
+};
+
+static const struct clk_pcr_layout sama5d3_pcr_layout = {
+	.offset = 0x10c,
+	.cmd = BIT(12),
+	.pid_mask = GENMASK(6, 0),
+	.div_mask = GENMASK(17, 16),
+};
+
+static const struct {
+	char *n;
+	char *p;
+	u8 id;
+} sama5d3_systemck[] = {
+	{ .n = "ddrck", .p = "masterck", .id = 2 },
+	{ .n = "lcdck", .p = "masterck", .id = 3 },
+	{ .n = "smdck", .p = "smdclk",   .id = 4 },
+	{ .n = "uhpck", .p = "usbck",    .id = 6 },
+	{ .n = "udpck", .p = "usbck",    .id = 7 },
+	{ .n = "pck0",  .p = "prog0",    .id = 8 },
+	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "pck2",  .p = "prog2",    .id = 10 },
+};
+
+static const struct {
+	char *n;
+	u8 id;
+	struct clk_range r;
+} sama5d3_periphck[] = {
+	{ .n = "dbgu_clk", .id = 2, },
+	{ .n = "hsmc_clk", .id = 5, },
+	{ .n = "pioA_clk", .id = 6, },
+	{ .n = "pioB_clk", .id = 7, },
+	{ .n = "pioC_clk", .id = 8, },
+	{ .n = "pioD_clk", .id = 9, },
+	{ .n = "pioE_clk", .id = 10, },
+	{ .n = "usart0_clk", .id = 12, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "usart1_clk", .id = 13, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "usart2_clk", .id = 14, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "usart3_clk", .id = 15, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "uart0_clk", .id = 16, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "uart1_clk", .id = 17, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "twi0_clk", .id = 18, .r = { .min = 0, .max = 41500000 }, },
+	{ .n = "twi1_clk", .id = 19, .r = { .min = 0, .max = 41500000 }, },
+	{ .n = "twi2_clk", .id = 20, .r = { .min = 0, .max = 41500000 }, },
+	{ .n = "mci0_clk", .id = 21, },
+	{ .n = "mci1_clk", .id = 22, },
+	{ .n = "mci2_clk", .id = 23, },
+	{ .n = "spi0_clk", .id = 24, .r = { .min = 0, .max = 166000000 }, },
+	{ .n = "spi1_clk", .id = 25, .r = { .min = 0, .max = 166000000 }, },
+	{ .n = "tcb0_clk", .id = 26, .r = { .min = 0, .max = 166000000 }, },
+	{ .n = "tcb1_clk", .id = 27, .r = { .min = 0, .max = 166000000 }, },
+	{ .n = "pwm_clk", .id = 28, },
+	{ .n = "adc_clk", .id = 29, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "dma0_clk", .id = 30, },
+	{ .n = "dma1_clk", .id = 31, },
+	{ .n = "uhphs_clk", .id = 32, },
+	{ .n = "udphs_clk", .id = 33, },
+	{ .n = "macb0_clk", .id = 34, },
+	{ .n = "macb1_clk", .id = 35, },
+	{ .n = "lcdc_clk", .id = 36, },
+	{ .n = "isi_clk", .id = 37, },
+	{ .n = "ssc0_clk", .id = 38, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "ssc1_clk", .id = 39, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "can0_clk", .id = 40, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "can1_clk", .id = 41, .r = { .min = 0, .max = 83000000 }, },
+	{ .n = "sha_clk", .id = 42, },
+	{ .n = "aes_clk", .id = 43, },
+	{ .n = "tdes_clk", .id = 44, },
+	{ .n = "trng_clk", .id = 45, },
+	{ .n = "fuse_clk", .id = 48, },
+	{ .n = "mpddr_clk", .id = 49, },
+};
+
+static void __init sama5d3_pmc_setup(struct device_node *np)
+{
+	const char *slck_name, *mainxtal_name;
+	struct pmc_data *sama5d3_pmc;
+	const char *parent_names[5];
+	struct regmap *regmap;
+	struct clk_hw *hw;
+	int i;
+	bool bypass;
+
+	i = of_property_match_string(np, "clock-names", "slow_clk");
+	if (i < 0)
+		return;
+
+	slck_name = of_clk_get_parent_name(np, i);
+
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
+		return;
+	mainxtal_name = of_clk_get_parent_name(np, i);
+
+	regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(regmap))
+		return;
+
+	sama5d3_pmc = pmc_data_allocate(PMC_MAIN + 1,
+					nck(sama5d3_systemck),
+					nck(sama5d3_periphck), 0);
+	if (!sama5d3_pmc)
+		return;
+
+	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+					   50000000);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	bypass = of_property_read_bool(np, "atmel,osc-bypass");
+
+	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name,
+					bypass);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	parent_names[0] = "main_rc_osc";
+	parent_names[1] = "main_osc";
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, 2);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
+				   &sama5d3_pll_layout, &plla_characteristics);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck");
+	if (IS_ERR(hw))
+		goto err_free;
+
+	sama5d3_pmc->chws[PMC_UTMI] = hw;
+
+	parent_names[0] = slck_name;
+	parent_names[1] = "mainck";
+	parent_names[2] = "plladivck";
+	parent_names[3] = "utmick";
+	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
+				      &at91sam9x5_master_layout,
+				      &mck_characteristics);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	sama5d3_pmc->chws[PMC_MCK] = hw;
+
+	parent_names[0] = "plladivck";
+	parent_names[1] = "utmick";
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	parent_names[0] = slck_name;
+	parent_names[1] = "mainck";
+	parent_names[2] = "plladivck";
+	parent_names[3] = "utmick";
+	parent_names[4] = "masterck";
+	for (i = 0; i < 3; i++) {
+		char name[6];
+
+		snprintf(name, sizeof(name), "prog%d", i);
+
+		hw = at91_clk_register_programmable(regmap, name,
+						    parent_names, 5, i,
+						    &at91sam9x5_programmable_layout);
+		if (IS_ERR(hw))
+			goto err_free;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sama5d3_systemck); i++) {
+		hw = at91_clk_register_system(regmap, sama5d3_systemck[i].n,
+					      sama5d3_systemck[i].p,
+					      sama5d3_systemck[i].id);
+		if (IS_ERR(hw))
+			goto err_free;
+
+		sama5d3_pmc->shws[sama5d3_systemck[i].id] = hw;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sama5d3_periphck); i++) {
+		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
+							 &sama5d3_pcr_layout,
+							 sama5d3_periphck[i].n,
+							 "masterck",
+							 sama5d3_periphck[i].id,
+							 &sama5d3_periphck[i].r);
+		if (IS_ERR(hw))
+			goto err_free;
+
+		sama5d3_pmc->phws[sama5d3_periphck[i].id] = hw;
+	}
+
+	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d3_pmc);
+
+	return;
+
+err_free:
+	pmc_data_free(sama5d3_pmc);
+}
+/*
+ * The TCB is used as the clocksource so its clock is needed early. This means
+ * this can't be a platform driver.
+ */
+CLK_OF_DECLARE_DRIVER(sama5d3_pmc, "atmel,sama5d3-pmc", sama5d3_pmc_setup);
-- 
2.24.1


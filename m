Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9F6EE048
	for <lists+linux-clk@lfdr.de>; Tue, 25 Apr 2023 12:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbjDYK0N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Apr 2023 06:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbjDYKZ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2023 06:25:28 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A3D12C8B;
        Tue, 25 Apr 2023 03:24:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so4685430b3a.1;
        Tue, 25 Apr 2023 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682418293; x=1685010293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rGLY6sAnGc+a4RN03de+0T0lT0aOEc2Bt9X03lZKx4=;
        b=IeoBL+X8hLu0JNBrzCtyBDiLseNB6nZDYVtWwvWo9jtJ2Ifv4FtFBtALdNGFdtTV4M
         oxzJwyeZTP3Qb0adSUApXdQIhDJ3fQXuaT4wVmExxFvvvOy+TeLwcozaT5kCAokW0vgD
         Ei5LpV6t1ao6Q73UTlqnlutmI6V8x5KjGBq9uG9XXCWsC3R9FOOQFbWkFrgUJrPgvL5M
         IpeJ0yZ/z7MrSsMfHNoamodWum3Xqueqg2d/ivHzrNhTCVlvWJknmVyF5jafT9T028rA
         yVu54uf08KjyZUef08jXNFB46kHaYH9OI9+dxJMlONpeLuLAkfTOCU3ppG5tMaBRu9jA
         oERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682418293; x=1685010293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rGLY6sAnGc+a4RN03de+0T0lT0aOEc2Bt9X03lZKx4=;
        b=QOzxtKgyuU3DMP2T1Z+LVJb0dRQnPJbRazLIJB85bOV1DI4D0vTnkox3mcp95PQpas
         ZwUOvBQmdHAM44dIrOoTbYLbg+lAvJWsfqr1xFKqrE0SzVJYBMfW53B9YxIBMKcmc+07
         0cc5YTr8UmOXNrDa4E7TD5UTUvYKaBxDZIdlyUqPxD84esRD5nxmHJFfQNUm6nx61KgP
         HnETFDsIFhaESbBDMAJb6ahipkqzWrYXuuBHRfp49+6NyPCiCNKrduggbv/akiYZ9PwB
         faL3r00p6yF8QN16CVvwCf1GEhnetagqluQAtQ6+WXWK0XhdzZh1LTfHnNkuVJlLSWMg
         JYWg==
X-Gm-Message-State: AAQBX9dI0DwP3k7i/aFCx3cNKtTeE05ipV9QcP7nH1yPYQ7kUua5tucS
        LBwUZJwUSnSArUHLDaQeLaM=
X-Google-Smtp-Source: AKy350bHNKULUGifSU9yih2f4BAwoZk43siHwrEMgL7CTxeaxqAHfKks5tIpYUWvhHt43cCkuExUsg==
X-Received: by 2002:a05:6a20:3d1d:b0:db:b7:fe3f with SMTP id y29-20020a056a203d1d00b000db00b7fe3fmr22547484pzi.10.1682418292597;
        Tue, 25 Apr 2023 03:24:52 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 30-20020a63125e000000b0051b70c8d446sm7644715pgs.73.2023.04.25.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 03:24:52 -0700 (PDT)
From:   Jacky Huang <ychuang570808@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
        will@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, arnd@arndb.de, schung@nuvoton.com,
        mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v8 08/11] clk: nuvoton: Add clock driver for ma35d1 clock controller
Date:   Tue, 25 Apr 2023 10:24:15 +0000
Message-Id: <20230425102418.185783-9-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230425102418.185783-1-ychuang570808@gmail.com>
References: <20230425102418.185783-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jacky Huang <ychuang3@nuvoton.com>

The clock controller generates clocks for the whole chip, including
system clocks and all peripheral clocks. This driver support ma35d1
clock gating, divider, and individual PLL configuration.

There are 6 PLLs in ma35d1 SoC:
  - CA-PLL for the two Cortex-A35 CPU clock
  - SYS-PLL for system bus, which comes from the companion MCU
    and cannot be programmed by clock controller.
  - DDR-PLL for DDR
  - EPLL for GMAC and GFX, Display, and VDEC IPs.
  - VPLL for video output pixel clock
  - APLL for SDHC, I2S audio, and other IPs.
CA-PLL has only one operation mode.
DDR-PLL, EPLL, VPLL, and APLL are advanced PLLs which have 3
operation modes: integer mode, fraction mode, and spread specturm mode.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 drivers/clk/Makefile                     |   1 +
 drivers/clk/nuvoton/Kconfig              |  19 +
 drivers/clk/nuvoton/Makefile             |   4 +
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 140 ++++
 drivers/clk/nuvoton/clk-ma35d1-pll.c     | 364 +++++++++
 drivers/clk/nuvoton/clk-ma35d1.c         | 947 +++++++++++++++++++++++
 6 files changed, 1475 insertions(+)
 create mode 100644 drivers/clk/nuvoton/Kconfig
 create mode 100644 drivers/clk/nuvoton/Makefile
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1-pll.c
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..401f2d800e7f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -103,6 +103,7 @@ endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
+obj-y					+= nuvoton/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
new file mode 100644
index 000000000000..9bb811d20b1c
--- /dev/null
+++ b/drivers/clk/nuvoton/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+# common clock support for Nuvoton SoC family.
+
+config COMMON_CLK_NUVOTON
+	bool "Nuvoton clock controller common support"
+	depends on ARCH_NUVOTON || COMPILE_TEST
+	default y
+	help
+	  Say y here to enable common clock controller for Nuvoton platforms.
+
+if COMMON_CLK_NUVOTON
+
+config CLK_MA35D1
+	bool "Nuvoton MA35D1 clock controller support"
+	default y
+	help
+	  Build the clock controller driver for MA35D1 SoC.
+
+endif
diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
new file mode 100644
index 000000000000..d2c092541b8d
--- /dev/null
+++ b/drivers/clk/nuvoton/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1.o
+obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1-divider.o
+obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1-pll.o
diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
new file mode 100644
index 000000000000..0d4d8186a85c
--- /dev/null
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Chi-Fang Li <cfli0@nuvoton.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+struct ma35d1_adc_clk_div {
+	struct clk_hw hw;
+	void __iomem *reg;
+	u8 shift;
+	u8 width;
+	u32 mask;
+	const struct clk_div_table *table;
+	/* protects concurrent access to clock divider registers */
+	spinlock_t *lock;
+};
+
+struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
+				     struct clk_hw *parent_hw, spinlock_t *lock,
+				     unsigned long flags, void __iomem *reg,
+				     u8 shift, u8 width, u32 mask_bit);
+
+static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
+{
+	return container_of(_hw, struct ma35d1_adc_clk_div, hw);
+}
+
+static inline unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	unsigned int val;
+	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+
+	val = readl_relaxed(dclk->reg) >> dclk->shift;
+	val &= clk_div_mask(dclk->width);
+	val += 1;
+	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
+				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
+}
+
+static inline long ma35d1_clkdiv_round_rate(struct clk_hw *hw,
+					    unsigned long rate,
+					    unsigned long *prate)
+{
+	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+
+	return divider_round_rate(hw, rate, prate, dclk->table,
+				  dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+}
+
+static inline int ma35d1_clkdiv_set_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long parent_rate)
+{
+	int value;
+	unsigned long flags = 0;
+	u32 data;
+	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+
+	value = divider_get_val(rate, parent_rate, dclk->table,
+				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+
+	spin_lock_irqsave(dclk->lock, flags);
+
+	data = readl_relaxed(dclk->reg);
+	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
+	data |= (value - 1) << dclk->shift;
+	data |= dclk->mask;
+	writel_relaxed(data, dclk->reg);
+
+	spin_unlock_irqrestore(dclk->lock, flags);
+	return 0;
+}
+
+static const struct clk_ops ma35d1_adc_clkdiv_ops = {
+	.recalc_rate = ma35d1_clkdiv_recalc_rate,
+	.round_rate = ma35d1_clkdiv_round_rate,
+	.set_rate = ma35d1_clkdiv_set_rate,
+};
+
+struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
+				     struct clk_hw *parent_hw, spinlock_t *lock,
+				     unsigned long flags, void __iomem *reg,
+				     u8 shift, u8 width, u32 mask_bit)
+{
+	struct ma35d1_adc_clk_div *div;
+	struct clk_init_data init;
+	struct clk_div_table *table;
+	struct clk_parent_data pdata = { .index = 0 };
+	u32 max_div, min_div;
+	struct clk_hw *hw;
+	int ret;
+	int i;
+
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	max_div = clk_div_mask(width) + 1;
+	min_div = 1;
+
+	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
+	if (!table)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < max_div; i++) {
+		table[i].val = min_div + i;
+		table[i].div = 2 * table[i].val;
+	}
+	table[max_div].val = 0;
+	table[max_div].div = 0;
+
+	memset(&init, 0, sizeof(init));
+	init.name = name;
+	init.ops = &ma35d1_adc_clkdiv_ops;
+	init.flags |= flags;
+	pdata.hw = parent_hw;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+
+	div->reg = reg;
+	div->shift = shift;
+	div->width = width;
+	div->mask = mask_bit ? BIT(mask_bit) : 0;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	hw = &div->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw;
+}
+EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
new file mode 100644
index 000000000000..8ffefe285603
--- /dev/null
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Chi-Fang Li <cfli0@nuvoton.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+/* PLL frequency limits */
+#define PLL_FREF_MAX_FREQ	200000000UL
+#define PLL_FREF_MIN_FREQ	1000000UL
+#define PLL_FREF_M_MAX_FREQ	40000000UL
+#define PLL_FREF_M_MIN_FREQ	10000000UL
+#define PLL_FCLK_MAX_FREQ	2400000000UL
+#define PLL_FCLK_MIN_FREQ	600000000UL
+#define PLL_FCLKO_MAX_FREQ	2400000000UL
+#define PLL_FCLKO_MIN_FREQ	85700000UL
+#define PLL_SS_RATE		0x77
+#define PLL_SLOPE		0x58CFA
+
+#define REG_PLL_CTL0_OFFSET	0x0
+#define REG_PLL_CTL1_OFFSET	0x4
+#define REG_PLL_CTL2_OFFSET	0x8
+
+/* bit fields for REG_CLK_PLL0CTL0, which is SMIC PLL design */
+#define SPLL0_CTL0_FBDIV	GENMASK(7, 0)
+#define SPLL0_CTL0_INDIV	GENMASK(11, 8)
+#define SPLL0_CTL0_OUTDIV	GENMASK(13, 12)
+#define SPLL0_CTL0_PD		BIT(16)
+#define SPLL0_CTL0_BP		BIT(17)
+
+/* bit fields for REG_CLK_PLLxCTL0 ~ REG_CLK_PLLxCTL2, where x = 2 ~ 5 */
+#define PLL_CTL0_FBDIV		GENMASK(10, 0)
+#define PLL_CTL0_INDIV		GENMASK(17, 12)
+#define PLL_CTL0_MODE		GENMASK(19, 18)
+#define PLL_CTL0_SSRATE		GENMASK(30, 20)
+#define PLL_CTL1_PD		BIT(0)
+#define PLL_CTL1_BP		BIT(1)
+#define PLL_CTL1_OUTDIV		GENMASK(6, 4)
+#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL2_SLOPE		GENMASK(23, 0)
+
+#define INDIV_MIN		1
+#define INDIV_MAX		63
+#define FBDIV_MIN		16
+#define FBDIV_MAX		2047
+#define FBDIV_FRAC_MIN		1600
+#define FBDIV_FRAC_MAX		204700
+#define OUTDIV_MIN		1
+#define OUTDIV_MAX		7
+
+#define PLL_MODE_INT            0
+#define PLL_MODE_FRAC           1
+#define PLL_MODE_SS             2
+
+struct ma35d1_clk_pll {
+	struct clk_hw hw;
+	u32 id;
+	u8 mode;
+	void __iomem *ctl0_base;
+	void __iomem *ctl1_base;
+	void __iomem *ctl2_base;
+};
+
+struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
+				  struct clk_hw *parent_hw, void __iomem *base);
+
+static inline struct ma35d1_clk_pll *to_ma35d1_clk_pll(struct clk_hw *_hw)
+{
+	return container_of(_hw, struct ma35d1_clk_pll, hw);
+}
+
+static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
+					       unsigned long parent_rate)
+{
+	u32 m, n, p, outdiv;
+	u64 pll_freq;
+	const u32 clk_div_table[] = { 1, 2, 4, 8 };
+
+	if (pll0_ctl0 & SPLL0_CTL0_BP)
+		return parent_rate;
+
+	n = FIELD_GET(SPLL0_CTL0_FBDIV, pll0_ctl0);
+	m = FIELD_GET(SPLL0_CTL0_INDIV, pll0_ctl0);
+	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
+	outdiv = clk_div_table[p];
+	pll_freq = (u64)parent_rate * n;
+	do_div(pll_freq, m * outdiv);
+	return pll_freq;
+}
+
+static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl,
+					  unsigned long parent_rate)
+{
+	u32 m, n, p;
+	u64 pll_freq, x;
+
+	if (reg_ctl[1] & PLL_CTL1_BP)
+		return parent_rate;
+
+	n = FIELD_GET(PLL_CTL0_FBDIV, reg_ctl[0]);
+	m = FIELD_GET(PLL_CTL0_INDIV, reg_ctl[0]);
+	p = FIELD_GET(PLL_CTL1_OUTDIV, reg_ctl[1]);
+
+	if (mode == PLL_MODE_INT) {
+		pll_freq = (u64)parent_rate * n;
+		do_div(pll_freq, m * p);
+	} else {
+		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
+		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
+		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
+		pll_freq = ((u64)parent_rate * n) / 100 / m / p;
+	}
+	return pll_freq;
+}
+
+static int ma35d1_pll_find_closest(struct ma35d1_clk_pll *pll, unsigned long rate,
+				   unsigned long parent_rate, u32 *reg_ctl,
+				   unsigned long *freq)
+{
+	int p, m, n;
+	int fbdiv_min, fbdiv_max;
+	unsigned long diff = 0xffffffff;
+
+	*freq = 0;
+	if (rate < PLL_FCLKO_MIN_FREQ || rate > PLL_FCLKO_MAX_FREQ)
+		return -EINVAL;
+
+	if (pll->mode == PLL_MODE_INT) {
+		fbdiv_min = FBDIV_MIN;
+		fbdiv_max = FBDIV_MAX;
+	} else {
+		fbdiv_min = FBDIV_FRAC_MIN;
+		fbdiv_max = FBDIV_FRAC_MAX;
+	}
+
+	for (m = INDIV_MIN; m <= INDIV_MAX; m++) {
+		for (n = fbdiv_min; n <= fbdiv_max; n++) {
+			for (p = OUTDIV_MIN; p <= OUTDIV_MAX; p++) {
+				unsigned long tmp, fout;
+				u64 fclk;
+
+				tmp = parent_rate / m;
+				if (tmp < PLL_FREF_M_MIN_FREQ ||
+				    tmp > PLL_FREF_M_MAX_FREQ)
+					continue; /* constrain */
+
+				fclk = (u64)parent_rate * n / m;
+				/* for 2 decimal places */
+				if (pll->mode != PLL_MODE_INT)
+					fclk /= 100;
+
+				if (fclk < PLL_FCLK_MIN_FREQ ||
+				    fclk > PLL_FCLK_MAX_FREQ)
+					continue; /* constrain */
+
+				fout = (unsigned long)(fclk / p);
+				if (fout < PLL_FCLKO_MIN_FREQ ||
+				    fout > PLL_FCLKO_MAX_FREQ)
+					continue; /* constrain */
+
+				if (abs(rate - fout) < diff) {
+					reg_ctl[0] = FIELD_PREP(PLL_CTL0_INDIV, m) |
+						     FIELD_PREP(PLL_CTL0_FBDIV, n);
+					reg_ctl[1] = FIELD_PREP(PLL_CTL1_OUTDIV, p);
+					*freq = fout;
+					diff = abs(rate - fout);
+					if (diff == 0)
+						break;
+				}
+			}
+		}
+	}
+	if (*freq == 0)
+		return -EINVAL; /* cannot find even one valid setting */
+	return 0;
+}
+
+static int ma35d1_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 reg_ctl[3] = { 0 };
+	unsigned long pll_freq;
+	int ret;
+
+	if (parent_rate < PLL_FREF_MIN_FREQ ||
+	    parent_rate > PLL_FREF_MAX_FREQ)
+		return -EINVAL;
+
+	ret = ma35d1_pll_find_closest(pll, rate, parent_rate, reg_ctl, &pll_freq);
+	if (ret != 0)
+		return ret;
+
+	switch (pll->mode) {
+	case PLL_MODE_INT:
+		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_INT);
+		break;
+	case PLL_MODE_FRAC:
+		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_FRAC);
+		break;
+	case PLL_MODE_SS:
+		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_SS) |
+			      FIELD_PREP(PLL_CTL0_SSRATE, PLL_SS_RATE);
+		reg_ctl[2] = FIELD_PREP(PLL_CTL2_SLOPE, PLL_SLOPE);
+		break;
+	}
+	reg_ctl[1] |= PLL_CTL1_PD;
+
+	writel_relaxed(reg_ctl[0], pll->ctl0_base);
+	writel_relaxed(reg_ctl[1], pll->ctl1_base);
+	writel_relaxed(reg_ctl[2], pll->ctl2_base);
+	return 0;
+}
+
+static unsigned long ma35d1_clk_pll_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 reg_ctl[3];
+	unsigned long pll_freq;
+
+	if (parent_rate < PLL_FREF_MIN_FREQ || parent_rate > PLL_FREF_MAX_FREQ)
+		return 0;
+
+	switch (pll->id) {
+	case CAPLL:
+		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
+		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], parent_rate);
+		return pll_freq;
+	case DDRPLL:
+	case APLL:
+	case EPLL:
+	case VPLL:
+		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
+		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
+		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, parent_rate);
+		return pll_freq;
+	}
+	return 0;
+}
+
+static long ma35d1_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long *parent_rate)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 reg_ctl[3] = { 0 };
+	unsigned long pll_freq;
+	long ret;
+
+	if (*parent_rate < PLL_FREF_MIN_FREQ || *parent_rate > PLL_FREF_MAX_FREQ)
+		return -EINVAL;
+
+	ret = ma35d1_pll_find_closest(pll, rate, *parent_rate, reg_ctl, &pll_freq);
+	if (ret != 0)
+		return ret;
+
+	switch (pll->id) {
+	case CAPLL:
+		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
+		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], *parent_rate);
+		return pll_freq;
+	case DDRPLL:
+	case APLL:
+	case EPLL:
+	case VPLL:
+		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
+		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
+		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, *parent_rate);
+		return pll_freq;
+	}
+	return 0;
+}
+
+static int ma35d1_clk_pll_is_prepared(struct clk_hw *hw)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 val = readl_relaxed(pll->ctl1_base);
+
+	return val & PLL_CTL1_PD ? 0 : 1;
+}
+
+static int ma35d1_clk_pll_prepare(struct clk_hw *hw)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 val;
+
+	val = readl_relaxed(pll->ctl1_base);
+	val &= ~PLL_CTL1_PD;
+	writel_relaxed(val, pll->ctl1_base);
+	return 0;
+}
+
+static void ma35d1_clk_pll_unprepare(struct clk_hw *hw)
+{
+	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
+	u32 val;
+
+	val = readl_relaxed(pll->ctl1_base);
+	val |= PLL_CTL1_PD;
+	writel_relaxed(val, pll->ctl1_base);
+}
+
+static const struct clk_ops ma35d1_clk_pll_ops = {
+	.is_prepared = ma35d1_clk_pll_is_prepared,
+	.prepare = ma35d1_clk_pll_prepare,
+	.unprepare = ma35d1_clk_pll_unprepare,
+	.set_rate = ma35d1_clk_pll_set_rate,
+	.recalc_rate = ma35d1_clk_pll_recalc_rate,
+	.round_rate = ma35d1_clk_pll_round_rate,
+};
+
+static const struct clk_ops ma35d1_clk_fixed_pll_ops = {
+	.recalc_rate = ma35d1_clk_pll_recalc_rate,
+	.round_rate = ma35d1_clk_pll_round_rate,
+};
+
+struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
+				  struct clk_hw *parent_hw, void __iomem *base)
+{
+	struct ma35d1_clk_pll *pll;
+	struct clk_parent_data pdata = { .index = 0 };
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	pll->id = id;
+	pll->mode = u8mode;
+	pll->ctl0_base = base + REG_PLL_CTL0_OFFSET;
+	pll->ctl1_base = base + REG_PLL_CTL1_OFFSET;
+	pll->ctl2_base = base + REG_PLL_CTL2_OFFSET;
+
+	memset(&init, 0, sizeof(init));
+	init.name = name;
+	init.flags = 0;
+	pdata.hw = parent_hw;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+
+	if (id == CAPLL || id == DDRPLL)
+		init.ops = &ma35d1_clk_fixed_pll_ops;
+	else
+		init.ops = &ma35d1_clk_pll_ops;
+
+	pll->hw.init = &init;
+	hw = &pll->hw;
+
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw;
+}
+EXPORT_SYMBOL_GPL(ma35d1_reg_clk_pll);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
new file mode 100644
index 000000000000..038a7ac564a3
--- /dev/null
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -0,0 +1,947 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Chi-Fang Li <cfli0@nuvoton.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+static DEFINE_SPINLOCK(ma35d1_lock);
+
+#define PLL_MAX_NUM		5
+
+/* Clock Control Registers Offset */
+#define REG_CLK_PWRCTL		0x00
+#define REG_CLK_SYSCLK0		0x04
+#define REG_CLK_SYSCLK1		0x08
+#define REG_CLK_APBCLK0		0x0C
+#define REG_CLK_APBCLK1		0x10
+#define REG_CLK_APBCLK2		0x14
+#define REG_CLK_CLKSEL0		0x18
+#define REG_CLK_CLKSEL1		0x1C
+#define REG_CLK_CLKSEL2		0x20
+#define REG_CLK_CLKSEL3		0x24
+#define REG_CLK_CLKSEL4		0x28
+#define REG_CLK_CLKDIV0		0x2C
+#define REG_CLK_CLKDIV1		0x30
+#define REG_CLK_CLKDIV2		0x34
+#define REG_CLK_CLKDIV3		0x38
+#define REG_CLK_CLKDIV4		0x3C
+#define REG_CLK_CLKOCTL		0x40
+#define REG_CLK_STATUS		0x50
+#define REG_CLK_PLL0CTL0	0x60
+#define REG_CLK_PLL2CTL0	0x80
+#define REG_CLK_PLL2CTL1	0x84
+#define REG_CLK_PLL2CTL2	0x88
+#define REG_CLK_PLL3CTL0	0x90
+#define REG_CLK_PLL3CTL1	0x94
+#define REG_CLK_PLL3CTL2	0x98
+#define REG_CLK_PLL4CTL0	0xA0
+#define REG_CLK_PLL4CTL1	0xA4
+#define REG_CLK_PLL4CTL2	0xA8
+#define REG_CLK_PLL5CTL0	0xB0
+#define REG_CLK_PLL5CTL1	0xB4
+#define REG_CLK_PLL5CTL2	0xB8
+#define REG_CLK_CLKDCTL		0xC0
+#define REG_CLK_CLKDSTS		0xC4
+#define REG_CLK_CDUPB		0xC8
+#define REG_CLK_CDLOWB		0xCC
+#define REG_CLK_CKFLTRCTL	0xD0
+#define REG_CLK_TESTCLK		0xF0
+#define REG_CLK_PLLCTL		0x40
+
+#define PLL_MODE_INT            0
+#define PLL_MODE_FRAC           1
+#define PLL_MODE_SS             2
+
+struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode,
+				  const char *name, struct clk_hw *parent_hw,
+				  void __iomem *base);
+struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
+				     struct clk_hw *hw, spinlock_t *lock,
+				     unsigned long flags, void __iomem *reg,
+				     u8 shift, u8 width, u32 mask_bit);
+
+static const struct clk_parent_data ca35clk_sel_clks[] = {
+	{ .index = 0 },  /* HXT */
+	{ .index = 1 },  /* CAPLL */
+	{ .index = 2 }   /* DDRPLL */
+};
+
+static const char *const sysclk0_sel_clks[] = {
+	"epll_div2", "syspll"
+};
+
+static const char *const sysclk1_sel_clks[] = {
+	"hxt", "syspll"
+};
+
+static const char *const axiclk_sel_clks[] = {
+	"capll_div2", "capll_div4"
+};
+
+static const char *const ccap_sel_clks[] = {
+	"hxt", "vpll", "apll", "syspll"
+};
+
+static const char *const sdh_sel_clks[] = {
+	"syspll", "apll", "dummy", "dummy"
+};
+
+static const char *const dcu_sel_clks[] = {
+	"epll_div2", "syspll"
+};
+
+static const char *const gfx_sel_clks[] = {
+	"epll", "syspll"
+};
+
+static const char *const dbg_sel_clks[] = {
+	"hirc", "syspll"
+};
+
+static const char *const timer0_sel_clks[] = {
+	"hxt", "lxt", "pclk0", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer1_sel_clks[] = {
+	"hxt", "lxt", "pclk0", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer2_sel_clks[] = {
+	"hxt", "lxt", "pclk1", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer3_sel_clks[] = {
+	"hxt", "lxt", "pclk1", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer4_sel_clks[] = {
+	"hxt", "lxt", "pclk2", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer5_sel_clks[] = {
+	"hxt", "lxt", "pclk2", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer6_sel_clks[] = {
+	"hxt", "lxt", "pclk0", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer7_sel_clks[] = {
+	"hxt", "lxt", "pclk0", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer8_sel_clks[] = {
+	"hxt", "lxt", "pclk1", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer9_sel_clks[] = {
+	"hxt", "lxt", "pclk1", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer10_sel_clks[] = {
+	"hxt", "lxt", "pclk2", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const timer11_sel_clks[] = {
+	"hxt", "lxt", "pclk2", "dummy", "dummy", "lirc", "dummy", "hirc"
+};
+
+static const char *const uart_sel_clks[] = {
+	"hxt", "sysclk1_div2", "dummy", "dummy"
+};
+
+static const char *const wdt0_sel_clks[] = {
+	"dummy", "lxt", "pclk3_div4096", "lirc"
+};
+
+static const char *const wdt1_sel_clks[] = {
+	"dummy", "lxt", "pclk3_div4096", "lirc"
+};
+
+static const char *const wdt2_sel_clks[] = {
+	"dummy", "lxt", "pclk4_div4096", "lirc"
+};
+
+static const char *const wwdt0_sel_clks[] = {
+	"dummy", "dummy", "pclk3_div4096", "lirc"
+};
+
+static const char *const wwdt1_sel_clks[] = {
+	"dummy", "dummy", "pclk3_div4096", "lirc"
+};
+
+static const char *const wwdt2_sel_clks[] = {
+	"dummy", "dummy", "pclk4_div4096", "lirc"
+};
+
+static const char *const spi0_sel_clks[] = {
+	"pclk1", "apll", "dummy", "dummy"
+};
+
+static const char *const spi1_sel_clks[] = {
+	"pclk2", "apll", "dummy", "dummy"
+};
+
+static const char *const spi2_sel_clks[] = {
+	"pclk1", "apll", "dummy", "dummy"
+};
+
+static const char *const spi3_sel_clks[] = {
+	"pclk2", "apll", "dummy", "dummy"
+};
+
+static const char *const qspi0_sel_clks[] = {
+	"pclk0", "apll", "dummy", "dummy"
+};
+
+static const char *const qspi1_sel_clks[] = {
+	"pclk0", "apll", "dummy", "dummy"
+};
+
+static const char *const i2s0_sel_clks[] = {
+	"apll", "sysclk1_div2", "dummy", "dummy"
+};
+
+static const char *const i2s1_sel_clks[] = {
+	"apll", "sysclk1_div2", "dummy", "dummy"
+};
+
+static const char *const can_sel_clks[] = {
+	"apll", "vpll"
+};
+
+static const char *const cko_sel_clks[] = {
+	"hxt", "lxt", "hirc", "lirc", "capll_div4", "syspll",
+	"ddrpll", "epll_div2", "apll", "vpll", "dummy", "dummy",
+	"dummy", "dummy", "dummy", "dummy"
+};
+
+static const char *const smc_sel_clks[] = {
+	"hxt", "pclk4"
+};
+
+static const char *const kpi_sel_clks[] = {
+	"hxt", "lxt"
+};
+
+static const struct clk_div_table ip_div_table[] = {
+	{0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
+	{5, 12}, {6, 14}, {7, 16}, {0, 0},
+};
+
+static const struct clk_div_table eadc_div_table[] = {
+	{0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
+	{5, 12}, {6, 14}, {7, 16}, {8, 18},
+	{9, 20}, {10, 22}, {11, 24}, {12, 26},
+	{13, 28}, {14, 30}, {15, 32}, {0, 0},
+};
+
+static inline struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+{
+	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+}
+
+static inline struct clk_hw *ma35d1_clk_mux_parent(struct device *dev,
+						   const char *name,
+						   void __iomem *reg,
+						   u8 shift, u8 width,
+						   const struct clk_parent_data *pdata,
+						   int num_pdata)
+{
+	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
+					       CLK_SET_RATE_NO_REPARENT, reg, shift,
+					       width, 0, &ma35d1_lock);
+}
+
+static inline struct clk_hw *ma35d1_clk_mux(struct device *dev,
+					    const char *name,
+					    void __iomem *reg,
+					    u8 shift, u8 width,
+					    const char *const *parents,
+					    int num_parents)
+{
+	return devm_clk_hw_register_mux(dev, name, parents, num_parents,
+					CLK_SET_RATE_NO_REPARENT, reg, shift,
+					width, 0, &ma35d1_lock);
+}
+
+static inline struct clk_hw *ma35d1_clk_divider(struct device *dev,
+						const char *name,
+						const char *parent,
+						void __iomem *reg, u8 shift,
+						u8 width)
+{
+	return devm_clk_hw_register_divider(dev, name, parent, CLK_SET_RATE_PARENT,
+					    reg, shift, width, 0, &ma35d1_lock);
+}
+
+static inline struct clk_hw *ma35d1_clk_divider_pow2(struct device *dev,
+						     const char *name,
+						     const char *parent,
+						     void __iomem *reg,
+						     u8 shift, u8 width)
+{
+	return devm_clk_hw_register_divider(dev, name, parent,
+					    CLK_DIVIDER_POWER_OF_TWO, reg, shift,
+					    width, 0, &ma35d1_lock);
+}
+
+static inline struct clk_hw *ma35d1_clk_divider_table(struct device *dev,
+						      const char *name,
+						      const char *parent,
+						      void __iomem *reg,
+						      u8 shift, u8 width,
+						      const struct clk_div_table *table)
+{
+	return devm_clk_hw_register_divider_table(dev, name, parent, 0,
+						  reg, shift, width, 0,
+						  table, &ma35d1_lock);
+}
+
+static inline struct clk_hw *ma35d1_clk_fixed_factor(struct device *dev,
+						     const char *name,
+						     const char *parent,
+						     unsigned int mult,
+						     unsigned int div)
+{
+	return devm_clk_hw_register_fixed_factor(dev, name, parent,
+					    CLK_SET_RATE_PARENT, mult, div);
+}
+
+static inline struct clk_hw *ma35d1_clk_gate(struct device *dev,
+					     const char *name,
+					     const char *parent,
+					     void __iomem *reg, u8 shift)
+{
+	return devm_clk_hw_register_gate(dev, name, parent, CLK_SET_RATE_PARENT,
+				    reg, shift, 0, &ma35d1_lock);
+}
+
+static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
+{
+	const char *of_str;
+	int i;
+
+	for (i = 0; i < PLL_MAX_NUM; i++) {
+		if (of_property_read_string_index(clk_node, "nuvoton,pll-mode", i, &of_str))
+			return -EINVAL;
+		if (!strcmp(of_str, "integer"))
+			pllmode[i] = PLL_MODE_INT;
+		else if (!strcmp(of_str, "fractional"))
+			pllmode[i] = PLL_MODE_FRAC;
+		else if (!strcmp(of_str, "spread-spectrum"))
+			pllmode[i] = PLL_MODE_SS;
+		else
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int ma35d1_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *clk_node = pdev->dev.of_node;
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	void __iomem *clk_base;
+	static struct clk_hw **hws;
+	static struct clk_hw_onecell_data *ma35d1_hw_data;
+	u32 pllmode[PLL_MAX_NUM];
+	int ret;
+
+	ma35d1_hw_data = devm_kzalloc(dev, struct_size(ma35d1_hw_data,
+				      hws, CLK_MAX_IDX), GFP_KERNEL);
+	if (WARN_ON(!ma35d1_hw_data))
+		return -ENOMEM;
+
+	ma35d1_hw_data->num = CLK_MAX_IDX;
+	hws = ma35d1_hw_data->hws;
+
+	clk_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(clk_base))
+		return PTR_ERR(clk_base);
+
+	ret = ma35d1_get_pll_setting(clk_node, pllmode);
+	if (ret < 0) {
+		dev_err(dev, "Invalid PLL setting!\n");
+		return -EINVAL;
+	}
+
+	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
+	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
+					clk_base + REG_CLK_PWRCTL, 0);
+	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
+					clk_base + REG_CLK_PWRCTL, 1);
+	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
+					 clk_base + REG_CLK_PWRCTL, 2);
+	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
+					 clk_base + REG_CLK_PWRCTL, 3);
+
+	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
+					hws[HXT], clk_base + REG_CLK_PLL0CTL0);
+	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
+					hws[HXT], clk_base + REG_CLK_PLL2CTL0);
+	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
+				       hws[HXT], clk_base + REG_CLK_PLL3CTL0);
+	hws[EPLL] = ma35d1_reg_clk_pll(dev, EPLL, pllmode[3], "epll",
+				       hws[HXT], clk_base + REG_CLK_PLL4CTL0);
+	hws[VPLL] = ma35d1_reg_clk_pll(dev, VPLL, pllmode[4], "vpll",
+				       hws[HXT], clk_base + REG_CLK_PLL5CTL0);
+
+	hws[EPLL_DIV2] = ma35d1_clk_fixed_factor(dev, "epll_div2", "epll", 1, 2);
+	hws[EPLL_DIV4] = ma35d1_clk_fixed_factor(dev, "epll_div4", "epll", 1, 4);
+	hws[EPLL_DIV8] = ma35d1_clk_fixed_factor(dev, "epll_div8", "epll", 1, 8);
+
+	hws[CA35CLK_MUX] = ma35d1_clk_mux_parent(dev, "ca35clk_mux",
+						 clk_base + REG_CLK_CLKSEL0, 0, 2,
+						 ca35clk_sel_clks,
+						 ARRAY_SIZE(ca35clk_sel_clks));
+	hws[AXICLK_DIV2] = ma35d1_clk_fixed_factor(dev, "capll_div2", "ca35clk_mux", 1, 2);
+	hws[AXICLK_DIV4] = ma35d1_clk_fixed_factor(dev, "capll_div4", "ca35clk_mux", 1, 4);
+
+	hws[AXICLK_MUX] = ma35d1_clk_mux(dev, "axiclk_mux", clk_base + REG_CLK_CLKDIV0,
+					 26, 1, axiclk_sel_clks,
+					 ARRAY_SIZE(axiclk_sel_clks));
+	hws[SYSCLK0_MUX] = ma35d1_clk_mux(dev, "sysclk0_mux", clk_base + REG_CLK_CLKSEL0,
+					  2, 1, sysclk0_sel_clks,
+					  ARRAY_SIZE(sysclk0_sel_clks));
+	hws[SYSCLK1_MUX] = ma35d1_clk_mux(dev, "sysclk1_mux", clk_base + REG_CLK_CLKSEL0,
+					  4, 1, sysclk1_sel_clks,
+					  ARRAY_SIZE(sysclk1_sel_clks));
+	hws[SYSCLK1_DIV2] = ma35d1_clk_fixed_factor(dev, "sysclk1_div2", "sysclk1_mux", 1, 2);
+
+	/* HCLK0~3 & PCLK0~4 */
+	hws[HCLK0] = ma35d1_clk_fixed_factor(dev, "hclk0", "sysclk1_mux", 1, 1);
+	hws[HCLK1] = ma35d1_clk_fixed_factor(dev, "hclk1", "sysclk1_mux", 1, 1);
+	hws[HCLK2] = ma35d1_clk_fixed_factor(dev, "hclk2", "sysclk1_mux", 1, 1);
+	hws[PCLK0] = ma35d1_clk_fixed_factor(dev, "pclk0", "sysclk1_mux", 1, 1);
+	hws[PCLK1] = ma35d1_clk_fixed_factor(dev, "pclk1", "sysclk1_mux", 1, 1);
+	hws[PCLK2] = ma35d1_clk_fixed_factor(dev, "pclk2", "sysclk1_mux", 1, 1);
+
+	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
+	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
+	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
+
+	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
+	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+
+	/* DDR */
+	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",
+					 clk_base + REG_CLK_SYSCLK0, 4);
+	hws[DDR6_GATE] = ma35d1_clk_gate(dev, "ddr6_gate", "ddrpll",
+					 clk_base + REG_CLK_SYSCLK0, 5);
+
+	hws[CAN0_MUX] = ma35d1_clk_mux(dev, "can0_mux", clk_base + REG_CLK_CLKSEL4,
+				       16, 1, can_sel_clks, ARRAY_SIZE(can_sel_clks));
+	hws[CAN0_DIV] = ma35d1_clk_divider_table(dev, "can0_div", "can0_mux",
+						 clk_base + REG_CLK_CLKDIV0,
+						 0, 3, ip_div_table);
+	hws[CAN0_GATE] = ma35d1_clk_gate(dev, "can0_gate", "can0_div",
+					 clk_base + REG_CLK_SYSCLK0, 8);
+	hws[CAN1_MUX] = ma35d1_clk_mux(dev, "can1_mux", clk_base + REG_CLK_CLKSEL4,
+				       17, 1, can_sel_clks, ARRAY_SIZE(can_sel_clks));
+	hws[CAN1_DIV] = ma35d1_clk_divider_table(dev, "can1_div", "can1_mux",
+						 clk_base + REG_CLK_CLKDIV0,
+						 4, 3, ip_div_table);
+	hws[CAN1_GATE] = ma35d1_clk_gate(dev, "can1_gate", "can1_div",
+					 clk_base + REG_CLK_SYSCLK0, 9);
+	hws[CAN2_MUX] = ma35d1_clk_mux(dev, "can2_mux", clk_base + REG_CLK_CLKSEL4,
+				       18, 1, can_sel_clks, ARRAY_SIZE(can_sel_clks));
+	hws[CAN2_DIV] = ma35d1_clk_divider_table(dev, "can2_div", "can2_mux",
+						 clk_base + REG_CLK_CLKDIV0,
+						 8, 3, ip_div_table);
+	hws[CAN2_GATE] = ma35d1_clk_gate(dev, "can2_gate", "can2_div",
+					 clk_base + REG_CLK_SYSCLK0, 10);
+	hws[CAN3_MUX] = ma35d1_clk_mux(dev, "can3_mux", clk_base + REG_CLK_CLKSEL4,
+				       19, 1, can_sel_clks, ARRAY_SIZE(can_sel_clks));
+	hws[CAN3_DIV] = ma35d1_clk_divider_table(dev, "can3_div", "can3_mux",
+						 clk_base + REG_CLK_CLKDIV0,
+						 12, 3, ip_div_table);
+	hws[CAN3_GATE] = ma35d1_clk_gate(dev, "can3_gate", "can3_div",
+					 clk_base + REG_CLK_SYSCLK0, 11);
+
+	hws[SDH0_MUX] = ma35d1_clk_mux(dev, "sdh0_mux", clk_base + REG_CLK_CLKSEL0,
+				       16, 2, sdh_sel_clks, ARRAY_SIZE(sdh_sel_clks));
+	hws[SDH0_GATE] = ma35d1_clk_gate(dev, "sdh0_gate", "sdh0_mux",
+					 clk_base + REG_CLK_SYSCLK0, 16);
+	hws[SDH1_MUX] = ma35d1_clk_mux(dev, "sdh1_mux", clk_base + REG_CLK_CLKSEL0,
+				       18, 2, sdh_sel_clks, ARRAY_SIZE(sdh_sel_clks));
+	hws[SDH1_GATE] = ma35d1_clk_gate(dev, "sdh1_gate", "sdh1_mux",
+					 clk_base + REG_CLK_SYSCLK0, 17);
+
+	hws[NAND_GATE] = ma35d1_clk_gate(dev, "nand_gate", "hclk1",
+					 clk_base + REG_CLK_SYSCLK0, 18);
+
+	hws[USBD_GATE] = ma35d1_clk_gate(dev, "usbd_gate", "usbphy0",
+					 clk_base + REG_CLK_SYSCLK0, 19);
+	hws[USBH_GATE] = ma35d1_clk_gate(dev, "usbh_gate", "usbphy0",
+					 clk_base + REG_CLK_SYSCLK0, 20);
+	hws[HUSBH0_GATE] = ma35d1_clk_gate(dev, "husbh0_gate", "usbphy0",
+					   clk_base + REG_CLK_SYSCLK0, 21);
+	hws[HUSBH1_GATE] = ma35d1_clk_gate(dev, "husbh1_gate", "usbphy0",
+					   clk_base + REG_CLK_SYSCLK0, 22);
+
+	hws[GFX_MUX] = ma35d1_clk_mux(dev, "gfx_mux", clk_base + REG_CLK_CLKSEL0,
+				      26, 1, gfx_sel_clks, ARRAY_SIZE(gfx_sel_clks));
+	hws[GFX_GATE] = ma35d1_clk_gate(dev, "gfx_gate", "gfx_mux",
+					clk_base + REG_CLK_SYSCLK0, 24);
+	hws[VC8K_GATE] = ma35d1_clk_gate(dev, "vc8k_gate", "sysclk0_mux",
+					 clk_base + REG_CLK_SYSCLK0, 25);
+	hws[DCU_MUX] = ma35d1_clk_mux(dev, "dcu_mux", clk_base + REG_CLK_CLKSEL0,
+				      24, 1, dcu_sel_clks, ARRAY_SIZE(dcu_sel_clks));
+	hws[DCU_GATE] = ma35d1_clk_gate(dev, "dcu_gate", "dcu_mux",
+					clk_base + REG_CLK_SYSCLK0, 26);
+	hws[DCUP_DIV] = ma35d1_clk_divider_table(dev, "dcup_div", "vpll",
+						 clk_base + REG_CLK_CLKDIV0,
+						 16, 3, ip_div_table);
+
+	hws[EMAC0_GATE] = ma35d1_clk_gate(dev, "emac0_gate", "epll_div2",
+					  clk_base + REG_CLK_SYSCLK0, 27);
+	hws[EMAC1_GATE] = ma35d1_clk_gate(dev, "emac1_gate", "epll_div2",
+					  clk_base + REG_CLK_SYSCLK0, 28);
+
+	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0,
+					12, 1, ccap_sel_clks, ARRAY_SIZE(ccap_sel_clks));
+	hws[CCAP0_DIV] = ma35d1_clk_divider(dev, "ccap0_div", "ccap0_mux",
+					    clk_base + REG_CLK_CLKDIV1, 8, 4);
+	hws[CCAP0_GATE] = ma35d1_clk_gate(dev, "ccap0_gate", "ccap0_div",
+					  clk_base + REG_CLK_SYSCLK0, 29);
+	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0,
+					14, 1, ccap_sel_clks, ARRAY_SIZE(ccap_sel_clks));
+	hws[CCAP1_DIV] = ma35d1_clk_divider(dev, "ccap1_div", "ccap1_mux",
+					    clk_base + REG_CLK_CLKDIV1,
+					    12, 4);
+	hws[CCAP1_GATE] = ma35d1_clk_gate(dev, "ccap1_gate", "ccap1_div",
+					  clk_base + REG_CLK_SYSCLK0, 30);
+
+	hws[PDMA0_GATE] = ma35d1_clk_gate(dev, "pdma0_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 0);
+	hws[PDMA1_GATE] = ma35d1_clk_gate(dev, "pdma1_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 1);
+	hws[PDMA2_GATE] = ma35d1_clk_gate(dev, "pdma2_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 2);
+	hws[PDMA3_GATE] = ma35d1_clk_gate(dev, "pdma3_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 3);
+
+	hws[WH0_GATE] = ma35d1_clk_gate(dev, "wh0_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 4);
+	hws[WH1_GATE] = ma35d1_clk_gate(dev, "wh1_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 5);
+
+	hws[HWS_GATE] = ma35d1_clk_gate(dev, "hws_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 6);
+
+	hws[EBI_GATE] = ma35d1_clk_gate(dev, "ebi_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 7);
+
+	hws[SRAM0_GATE] = ma35d1_clk_gate(dev, "sram0_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 8);
+	hws[SRAM1_GATE] = ma35d1_clk_gate(dev, "sram1_gate", "hclk0",
+					  clk_base + REG_CLK_SYSCLK1, 9);
+
+	hws[ROM_GATE] = ma35d1_clk_gate(dev, "rom_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 10);
+
+	hws[TRA_GATE] = ma35d1_clk_gate(dev, "tra_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 11);
+
+	hws[DBG_MUX] = ma35d1_clk_mux(dev, "dbg_mux", clk_base + REG_CLK_CLKSEL0,
+				      27, 1, dbg_sel_clks, ARRAY_SIZE(dbg_sel_clks));
+	hws[DBG_GATE] = ma35d1_clk_gate(dev, "dbg_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 12);
+
+	hws[CKO_MUX] = ma35d1_clk_mux(dev, "cko_mux", clk_base + REG_CLK_CLKSEL4,
+				      24, 4, cko_sel_clks, ARRAY_SIZE(cko_sel_clks));
+	hws[CKO_DIV] = ma35d1_clk_divider_pow2(dev, "cko_div", "cko_mux",
+					       clk_base + REG_CLK_CLKOCTL, 0, 4);
+	hws[CKO_GATE] = ma35d1_clk_gate(dev, "cko_gate", "cko_div",
+					clk_base + REG_CLK_SYSCLK1, 13);
+
+	hws[GTMR_GATE] = ma35d1_clk_gate(dev, "gtmr_gate", "hirc",
+					 clk_base + REG_CLK_SYSCLK1, 14);
+
+	hws[GPA_GATE] = ma35d1_clk_gate(dev, "gpa_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 16);
+	hws[GPB_GATE] = ma35d1_clk_gate(dev, "gpb_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 17);
+	hws[GPC_GATE] = ma35d1_clk_gate(dev, "gpc_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 18);
+	hws[GPD_GATE] = ma35d1_clk_gate(dev, "gpd_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 19);
+	hws[GPE_GATE] = ma35d1_clk_gate(dev, "gpe_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 20);
+	hws[GPF_GATE] = ma35d1_clk_gate(dev, "gpf_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 21);
+	hws[GPG_GATE] = ma35d1_clk_gate(dev, "gpg_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 22);
+	hws[GPH_GATE] = ma35d1_clk_gate(dev, "gph_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 23);
+	hws[GPI_GATE] = ma35d1_clk_gate(dev, "gpi_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 24);
+	hws[GPJ_GATE] = ma35d1_clk_gate(dev, "gpj_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 25);
+	hws[GPK_GATE] = ma35d1_clk_gate(dev, "gpk_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 26);
+	hws[GPL_GATE] = ma35d1_clk_gate(dev, "gpl_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 27);
+	hws[GPM_GATE] = ma35d1_clk_gate(dev, "gpm_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 28);
+	hws[GPN_GATE] = ma35d1_clk_gate(dev, "gpn_gate", "hclk0",
+					clk_base + REG_CLK_SYSCLK1, 29);
+
+	hws[TMR0_MUX] = ma35d1_clk_mux(dev, "tmr0_mux", clk_base + REG_CLK_CLKSEL1,
+				       0, 3, timer0_sel_clks,
+				       ARRAY_SIZE(timer0_sel_clks));
+	hws[TMR0_GATE] = ma35d1_clk_gate(dev, "tmr0_gate", "tmr0_mux",
+					 clk_base + REG_CLK_APBCLK0, 0);
+	hws[TMR1_MUX] = ma35d1_clk_mux(dev, "tmr1_mux", clk_base + REG_CLK_CLKSEL1,
+				       4, 3, timer1_sel_clks,
+				       ARRAY_SIZE(timer1_sel_clks));
+	hws[TMR1_GATE] = ma35d1_clk_gate(dev, "tmr1_gate", "tmr1_mux",
+					 clk_base + REG_CLK_APBCLK0, 1);
+	hws[TMR2_MUX] = ma35d1_clk_mux(dev, "tmr2_mux", clk_base + REG_CLK_CLKSEL1,
+				       8, 3, timer2_sel_clks,
+				       ARRAY_SIZE(timer2_sel_clks));
+	hws[TMR2_GATE] = ma35d1_clk_gate(dev, "tmr2_gate", "tmr2_mux",
+					 clk_base + REG_CLK_APBCLK0, 2);
+	hws[TMR3_MUX] = ma35d1_clk_mux(dev, "tmr3_mux", clk_base + REG_CLK_CLKSEL1,
+				       12, 3, timer3_sel_clks,
+				       ARRAY_SIZE(timer3_sel_clks));
+	hws[TMR3_GATE] = ma35d1_clk_gate(dev, "tmr3_gate", "tmr3_mux",
+					 clk_base + REG_CLK_APBCLK0, 3);
+	hws[TMR4_MUX] = ma35d1_clk_mux(dev, "tmr4_mux", clk_base + REG_CLK_CLKSEL1,
+				       16, 3, timer4_sel_clks,
+				       ARRAY_SIZE(timer4_sel_clks));
+	hws[TMR4_GATE] = ma35d1_clk_gate(dev, "tmr4_gate", "tmr4_mux",
+					 clk_base + REG_CLK_APBCLK0, 4);
+	hws[TMR5_MUX] = ma35d1_clk_mux(dev, "tmr5_mux", clk_base + REG_CLK_CLKSEL1,
+				       20, 3, timer5_sel_clks,
+				       ARRAY_SIZE(timer5_sel_clks));
+	hws[TMR5_GATE] = ma35d1_clk_gate(dev, "tmr5_gate", "tmr5_mux",
+					 clk_base + REG_CLK_APBCLK0, 5);
+	hws[TMR6_MUX] = ma35d1_clk_mux(dev, "tmr6_mux", clk_base + REG_CLK_CLKSEL1,
+				       24, 3, timer6_sel_clks,
+				       ARRAY_SIZE(timer6_sel_clks));
+	hws[TMR6_GATE] = ma35d1_clk_gate(dev, "tmr6_gate", "tmr6_mux",
+					 clk_base + REG_CLK_APBCLK0, 6);
+	hws[TMR7_MUX] = ma35d1_clk_mux(dev, "tmr7_mux", clk_base + REG_CLK_CLKSEL1,
+				       28, 3, timer7_sel_clks,
+				       ARRAY_SIZE(timer7_sel_clks));
+	hws[TMR7_GATE] = ma35d1_clk_gate(dev, "tmr7_gate", "tmr7_mux",
+					 clk_base + REG_CLK_APBCLK0, 7);
+	hws[TMR8_MUX] = ma35d1_clk_mux(dev, "tmr8_mux", clk_base + REG_CLK_CLKSEL2,
+				       0, 3, timer8_sel_clks,
+				       ARRAY_SIZE(timer8_sel_clks));
+	hws[TMR8_GATE] = ma35d1_clk_gate(dev, "tmr8_gate", "tmr8_mux",
+					 clk_base + REG_CLK_APBCLK0, 8);
+	hws[TMR9_MUX] = ma35d1_clk_mux(dev, "tmr9_mux", clk_base + REG_CLK_CLKSEL2,
+				       4, 3, timer9_sel_clks,
+				       ARRAY_SIZE(timer9_sel_clks));
+	hws[TMR9_GATE] = ma35d1_clk_gate(dev, "tmr9_gate", "tmr9_mux",
+					 clk_base + REG_CLK_APBCLK0, 9);
+	hws[TMR10_MUX] = ma35d1_clk_mux(dev, "tmr10_mux", clk_base + REG_CLK_CLKSEL2,
+					8, 3, timer10_sel_clks,
+					ARRAY_SIZE(timer10_sel_clks));
+	hws[TMR10_GATE] = ma35d1_clk_gate(dev, "tmr10_gate", "tmr10_mux",
+					  clk_base + REG_CLK_APBCLK0, 10);
+	hws[TMR11_MUX] = ma35d1_clk_mux(dev, "tmr11_mux", clk_base + REG_CLK_CLKSEL2,
+					12, 3, timer11_sel_clks,
+					ARRAY_SIZE(timer11_sel_clks));
+	hws[TMR11_GATE] = ma35d1_clk_gate(dev, "tmr11_gate", "tmr11_mux",
+					  clk_base + REG_CLK_APBCLK0, 11);
+
+	hws[UART0_MUX] = ma35d1_clk_mux(dev, "uart0_mux", clk_base + REG_CLK_CLKSEL2,
+					16, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART0_DIV] = ma35d1_clk_divider(dev, "uart0_div", "uart0_mux",
+					    clk_base + REG_CLK_CLKDIV1,
+					    16, 4);
+	hws[UART0_GATE] = ma35d1_clk_gate(dev, "uart0_gate", "uart0_div",
+					  clk_base + REG_CLK_APBCLK0, 12);
+	hws[UART1_MUX] = ma35d1_clk_mux(dev, "uart1_mux", clk_base + REG_CLK_CLKSEL2,
+					18, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART1_DIV] = ma35d1_clk_divider(dev, "uart1_div", "uart1_mux",
+					    clk_base + REG_CLK_CLKDIV1,
+					    20, 4);
+	hws[UART1_GATE] = ma35d1_clk_gate(dev, "uart1_gate", "uart1_div",
+					  clk_base + REG_CLK_APBCLK0, 13);
+	hws[UART2_MUX] = ma35d1_clk_mux(dev, "uart2_mux", clk_base + REG_CLK_CLKSEL2,
+					20, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART2_DIV] = ma35d1_clk_divider(dev, "uart2_div", "uart2_mux",
+					    clk_base + REG_CLK_CLKDIV1,
+					    24, 4);
+	hws[UART2_GATE] = ma35d1_clk_gate(dev, "uart2_gate", "uart2_div",
+					  clk_base + REG_CLK_APBCLK0, 14);
+	hws[UART3_MUX] = ma35d1_clk_mux(dev, "uart3_mux", clk_base + REG_CLK_CLKSEL2,
+					22, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART3_DIV] = ma35d1_clk_divider(dev, "uart3_div", "uart3_mux",
+					    clk_base + REG_CLK_CLKDIV1,
+					    28, 4);
+	hws[UART3_GATE] = ma35d1_clk_gate(dev, "uart3_gate", "uart3_div",
+					  clk_base + REG_CLK_APBCLK0, 15);
+	hws[UART4_MUX] = ma35d1_clk_mux(dev, "uart4_mux", clk_base + REG_CLK_CLKSEL2,
+					24, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART4_DIV] = ma35d1_clk_divider(dev, "uart4_div", "uart4_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    0, 4);
+	hws[UART4_GATE] = ma35d1_clk_gate(dev, "uart4_gate", "uart4_div",
+					  clk_base + REG_CLK_APBCLK0, 16);
+	hws[UART5_MUX] = ma35d1_clk_mux(dev, "uart5_mux", clk_base + REG_CLK_CLKSEL2,
+					26, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART5_DIV] = ma35d1_clk_divider(dev, "uart5_div", "uart5_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    4, 4);
+	hws[UART5_GATE] = ma35d1_clk_gate(dev, "uart5_gate", "uart5_div",
+					  clk_base + REG_CLK_APBCLK0, 17);
+	hws[UART6_MUX] = ma35d1_clk_mux(dev, "uart6_mux", clk_base + REG_CLK_CLKSEL2,
+					28, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART6_DIV] = ma35d1_clk_divider(dev, "uart6_div", "uart6_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    8, 4);
+	hws[UART6_GATE] = ma35d1_clk_gate(dev, "uart6_gate", "uart6_div",
+					  clk_base + REG_CLK_APBCLK0, 18);
+	hws[UART7_MUX] = ma35d1_clk_mux(dev, "uart7_mux", clk_base + REG_CLK_CLKSEL2,
+					30, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART7_DIV] = ma35d1_clk_divider(dev, "uart7_div", "uart7_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    12, 4);
+	hws[UART7_GATE] = ma35d1_clk_gate(dev, "uart7_gate", "uart7_div",
+					  clk_base + REG_CLK_APBCLK0, 19);
+	hws[UART8_MUX] = ma35d1_clk_mux(dev, "uart8_mux", clk_base + REG_CLK_CLKSEL3,
+					0, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART8_DIV] = ma35d1_clk_divider(dev, "uart8_div", "uart8_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    16, 4);
+	hws[UART8_GATE] = ma35d1_clk_gate(dev, "uart8_gate", "uart8_div",
+					  clk_base + REG_CLK_APBCLK0, 20);
+	hws[UART9_MUX] = ma35d1_clk_mux(dev, "uart9_mux", clk_base + REG_CLK_CLKSEL3,
+					2, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART9_DIV] = ma35d1_clk_divider(dev, "uart9_div", "uart9_mux",
+					    clk_base + REG_CLK_CLKDIV2,
+					    20, 4);
+	hws[UART9_GATE] = ma35d1_clk_gate(dev, "uart9_gate", "uart9_div",
+					  clk_base + REG_CLK_APBCLK0, 21);
+	hws[UART10_MUX] = ma35d1_clk_mux(dev, "uart10_mux", clk_base + REG_CLK_CLKSEL3,
+					 4, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART10_DIV] = ma35d1_clk_divider(dev, "uart10_div", "uart10_mux",
+					     clk_base + REG_CLK_CLKDIV2,
+					     24, 4);
+	hws[UART10_GATE] = ma35d1_clk_gate(dev, "uart10_gate", "uart10_div",
+					   clk_base + REG_CLK_APBCLK0, 22);
+	hws[UART11_MUX] = ma35d1_clk_mux(dev, "uart11_mux", clk_base + REG_CLK_CLKSEL3,
+					 6, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART11_DIV] = ma35d1_clk_divider(dev, "uart11_div", "uart11_mux",
+					     clk_base + REG_CLK_CLKDIV2,
+					     28, 4);
+	hws[UART11_GATE] = ma35d1_clk_gate(dev, "uart11_gate", "uart11_div",
+					   clk_base + REG_CLK_APBCLK0, 23);
+	hws[UART12_MUX] = ma35d1_clk_mux(dev, "uart12_mux", clk_base + REG_CLK_CLKSEL3,
+					 8, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART12_DIV] = ma35d1_clk_divider(dev, "uart12_div", "uart12_mux",
+					     clk_base + REG_CLK_CLKDIV3,
+					     0, 4);
+	hws[UART12_GATE] = ma35d1_clk_gate(dev, "uart12_gate", "uart12_div",
+					   clk_base + REG_CLK_APBCLK0, 24);
+	hws[UART13_MUX] = ma35d1_clk_mux(dev, "uart13_mux", clk_base + REG_CLK_CLKSEL3,
+					 10, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART13_DIV] = ma35d1_clk_divider(dev, "uart13_div", "uart13_mux",
+					     clk_base + REG_CLK_CLKDIV3,
+					     4, 4);
+	hws[UART13_GATE] = ma35d1_clk_gate(dev, "uart13_gate", "uart13_div",
+					   clk_base + REG_CLK_APBCLK0, 25);
+	hws[UART14_MUX] = ma35d1_clk_mux(dev, "uart14_mux", clk_base + REG_CLK_CLKSEL3,
+					 12, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART14_DIV] = ma35d1_clk_divider(dev, "uart14_div", "uart14_mux",
+					     clk_base + REG_CLK_CLKDIV3,
+					     8, 4);
+	hws[UART14_GATE] = ma35d1_clk_gate(dev, "uart14_gate", "uart14_div",
+					   clk_base + REG_CLK_APBCLK0, 26);
+	hws[UART15_MUX] = ma35d1_clk_mux(dev, "uart15_mux", clk_base + REG_CLK_CLKSEL3,
+					 14, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART15_DIV] = ma35d1_clk_divider(dev, "uart15_div", "uart15_mux",
+					     clk_base + REG_CLK_CLKDIV3,
+					     12, 4);
+	hws[UART15_GATE] = ma35d1_clk_gate(dev, "uart15_gate", "uart15_div",
+					   clk_base + REG_CLK_APBCLK0, 27);
+	hws[UART16_MUX] = ma35d1_clk_mux(dev, "uart16_mux", clk_base + REG_CLK_CLKSEL3,
+					 16, 2, uart_sel_clks, ARRAY_SIZE(uart_sel_clks));
+	hws[UART16_DIV] = ma35d1_clk_divider(dev, "uart16_div", "uart16_mux",
+					     clk_base + REG_CLK_CLKDIV3,
+					     16, 4);
+	hws[UART16_GATE] = ma35d1_clk_gate(dev, "uart16_gate", "uart16_div",
+					   clk_base + REG_CLK_APBCLK0, 28);
+
+	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt",
+					clk_base + REG_CLK_APBCLK0, 29);
+	hws[DDR_GATE] = ma35d1_clk_gate(dev, "ddr_gate", "ddrpll",
+					clk_base + REG_CLK_APBCLK0, 30);
+
+	hws[KPI_MUX] = ma35d1_clk_mux(dev, "kpi_mux", clk_base + REG_CLK_CLKSEL4,
+				      30, 1, kpi_sel_clks, ARRAY_SIZE(kpi_sel_clks));
+	hws[KPI_DIV] = ma35d1_clk_divider(dev, "kpi_div", "kpi_mux",
+					  clk_base + REG_CLK_CLKDIV4,
+					  24, 8);
+	hws[KPI_GATE] = ma35d1_clk_gate(dev, "kpi_gate", "kpi_div",
+					clk_base + REG_CLK_APBCLK0, 31);
+
+	hws[I2C0_GATE] = ma35d1_clk_gate(dev, "i2c0_gate", "pclk0",
+					 clk_base + REG_CLK_APBCLK1, 0);
+	hws[I2C1_GATE] = ma35d1_clk_gate(dev, "i2c1_gate", "pclk1",
+					 clk_base + REG_CLK_APBCLK1, 1);
+	hws[I2C2_GATE] = ma35d1_clk_gate(dev, "i2c2_gate", "pclk2",
+					 clk_base + REG_CLK_APBCLK1, 2);
+	hws[I2C3_GATE] = ma35d1_clk_gate(dev, "i2c3_gate", "pclk0",
+					 clk_base + REG_CLK_APBCLK1, 3);
+	hws[I2C4_GATE] = ma35d1_clk_gate(dev, "i2c4_gate", "pclk1",
+					 clk_base + REG_CLK_APBCLK1, 4);
+	hws[I2C5_GATE] = ma35d1_clk_gate(dev, "i2c5_gate", "pclk2",
+					 clk_base + REG_CLK_APBCLK1, 5);
+
+	hws[QSPI0_MUX] = ma35d1_clk_mux(dev, "qspi0_mux", clk_base + REG_CLK_CLKSEL4,
+					8, 2, qspi0_sel_clks, ARRAY_SIZE(qspi0_sel_clks));
+	hws[QSPI0_GATE] = ma35d1_clk_gate(dev, "qspi0_gate", "qspi0_mux",
+					  clk_base + REG_CLK_APBCLK1, 6);
+	hws[QSPI1_MUX] = ma35d1_clk_mux(dev, "qspi1_mux", clk_base + REG_CLK_CLKSEL4,
+					10, 2, qspi1_sel_clks, ARRAY_SIZE(qspi1_sel_clks));
+	hws[QSPI1_GATE] = ma35d1_clk_gate(dev, "qspi1_gate", "qspi1_mux",
+					  clk_base + REG_CLK_APBCLK1, 7);
+
+	hws[SMC0_MUX] = ma35d1_clk_mux(dev, "smc0_mux", clk_base + REG_CLK_CLKSEL4,
+					28, 1, smc_sel_clks, ARRAY_SIZE(smc_sel_clks));
+	hws[SMC0_DIV] = ma35d1_clk_divider(dev, "smc0_div", "smc0_mux",
+					   clk_base + REG_CLK_CLKDIV1,
+					   0, 4);
+	hws[SMC0_GATE] = ma35d1_clk_gate(dev, "smc0_gate", "smc0_div",
+					 clk_base + REG_CLK_APBCLK1, 12);
+	hws[SMC1_MUX] = ma35d1_clk_mux(dev, "smc1_mux", clk_base + REG_CLK_CLKSEL4,
+					 29, 1, smc_sel_clks, ARRAY_SIZE(smc_sel_clks));
+	hws[SMC1_DIV] = ma35d1_clk_divider(dev, "smc1_div", "smc1_mux",
+					   clk_base + REG_CLK_CLKDIV1,
+					   4, 4);
+	hws[SMC1_GATE] = ma35d1_clk_gate(dev, "smc1_gate", "smc1_div",
+					 clk_base + REG_CLK_APBCLK1, 13);
+
+	hws[WDT0_MUX] = ma35d1_clk_mux(dev, "wdt0_mux", clk_base + REG_CLK_CLKSEL3,
+				       20, 2, wdt0_sel_clks, ARRAY_SIZE(wdt0_sel_clks));
+	hws[WDT0_GATE] = ma35d1_clk_gate(dev, "wdt0_gate", "wdt0_mux",
+					 clk_base + REG_CLK_APBCLK1, 16);
+	hws[WDT1_MUX] = ma35d1_clk_mux(dev, "wdt1_mux", clk_base + REG_CLK_CLKSEL3,
+				       24, 2, wdt1_sel_clks, ARRAY_SIZE(wdt1_sel_clks));
+	hws[WDT1_GATE] = ma35d1_clk_gate(dev, "wdt1_gate", "wdt1_mux",
+					 clk_base + REG_CLK_APBCLK1, 17);
+	hws[WDT2_MUX] = ma35d1_clk_mux(dev, "wdt2_mux", clk_base + REG_CLK_CLKSEL3,
+				       28, 2, wdt2_sel_clks, ARRAY_SIZE(wdt2_sel_clks));
+	hws[WDT2_GATE] = ma35d1_clk_gate(dev, "wdt2_gate", "wdt2_mux",
+				       clk_base + REG_CLK_APBCLK1, 18);
+
+	hws[WWDT0_MUX] = ma35d1_clk_mux(dev, "wwdt0_mux", clk_base + REG_CLK_CLKSEL3,
+					22, 2, wwdt0_sel_clks, ARRAY_SIZE(wwdt0_sel_clks));
+	hws[WWDT1_MUX] = ma35d1_clk_mux(dev, "wwdt1_mux", clk_base + REG_CLK_CLKSEL3,
+					26, 2, wwdt1_sel_clks, ARRAY_SIZE(wwdt1_sel_clks));
+	hws[WWDT2_MUX] = ma35d1_clk_mux(dev, "wwdt2_mux", clk_base + REG_CLK_CLKSEL3,
+					30, 2, wwdt2_sel_clks, ARRAY_SIZE(wwdt2_sel_clks));
+
+	hws[EPWM0_GATE] = ma35d1_clk_gate(dev, "epwm0_gate", "pclk1",
+					  clk_base + REG_CLK_APBCLK1, 24);
+	hws[EPWM1_GATE] = ma35d1_clk_gate(dev, "epwm1_gate", "pclk2",
+					  clk_base + REG_CLK_APBCLK1, 25);
+	hws[EPWM2_GATE] = ma35d1_clk_gate(dev, "epwm2_gate", "pclk1",
+					  clk_base + REG_CLK_APBCLK1, 26);
+
+	hws[I2S0_MUX] = ma35d1_clk_mux(dev, "i2s0_mux", clk_base + REG_CLK_CLKSEL4,
+				       12, 2, i2s0_sel_clks, ARRAY_SIZE(i2s0_sel_clks));
+	hws[I2S0_GATE] = ma35d1_clk_gate(dev, "i2s0_gate", "i2s0_mux",
+					 clk_base + REG_CLK_APBCLK2, 0);
+	hws[I2S1_MUX] = ma35d1_clk_mux(dev, "i2s1_mux", clk_base + REG_CLK_CLKSEL4,
+				       14, 2, i2s1_sel_clks, ARRAY_SIZE(i2s1_sel_clks));
+	hws[I2S1_GATE] = ma35d1_clk_gate(dev, "i2s1_gate", "i2s1_mux",
+					 clk_base + REG_CLK_APBCLK2, 1);
+
+	hws[SSMCC_GATE] = ma35d1_clk_gate(dev, "ssmcc_gate", "pclk3",
+					  clk_base + REG_CLK_APBCLK2, 2);
+	hws[SSPCC_GATE] = ma35d1_clk_gate(dev, "sspcc_gate", "pclk3",
+					  clk_base + REG_CLK_APBCLK2, 3);
+
+	hws[SPI0_MUX] = ma35d1_clk_mux(dev, "spi0_mux", clk_base + REG_CLK_CLKSEL4,
+				       0, 2, spi0_sel_clks, ARRAY_SIZE(spi0_sel_clks));
+	hws[SPI0_GATE] = ma35d1_clk_gate(dev, "spi0_gate", "spi0_mux",
+					 clk_base + REG_CLK_APBCLK2, 4);
+	hws[SPI1_MUX] = ma35d1_clk_mux(dev, "spi1_mux", clk_base + REG_CLK_CLKSEL4,
+				       2, 2, spi1_sel_clks, ARRAY_SIZE(spi1_sel_clks));
+	hws[SPI1_GATE] = ma35d1_clk_gate(dev, "spi1_gate", "spi1_mux",
+					 clk_base + REG_CLK_APBCLK2, 5);
+	hws[SPI2_MUX] = ma35d1_clk_mux(dev, "spi2_mux", clk_base + REG_CLK_CLKSEL4,
+				       4, 2, spi2_sel_clks, ARRAY_SIZE(spi2_sel_clks));
+	hws[SPI2_GATE] = ma35d1_clk_gate(dev, "spi2_gate", "spi2_mux",
+					 clk_base + REG_CLK_APBCLK2, 6);
+	hws[SPI3_MUX] = ma35d1_clk_mux(dev, "spi3_mux", clk_base + REG_CLK_CLKSEL4,
+				       6, 2, spi3_sel_clks, ARRAY_SIZE(spi3_sel_clks));
+	hws[SPI3_GATE] = ma35d1_clk_gate(dev, "spi3_gate", "spi3_mux",
+					 clk_base + REG_CLK_APBCLK2, 7);
+
+	hws[ECAP0_GATE] = ma35d1_clk_gate(dev, "ecap0_gate", "pclk1",
+					  clk_base + REG_CLK_APBCLK2, 8);
+	hws[ECAP1_GATE] = ma35d1_clk_gate(dev, "ecap1_gate", "pclk2",
+					  clk_base + REG_CLK_APBCLK2, 9);
+	hws[ECAP2_GATE] = ma35d1_clk_gate(dev, "ecap2_gate", "pclk1",
+					  clk_base + REG_CLK_APBCLK2, 10);
+
+	hws[QEI0_GATE] = ma35d1_clk_gate(dev, "qei0_gate", "pclk1",
+					 clk_base + REG_CLK_APBCLK2, 12);
+	hws[QEI1_GATE] = ma35d1_clk_gate(dev, "qei1_gate", "pclk2",
+					 clk_base + REG_CLK_APBCLK2, 13);
+	hws[QEI2_GATE] = ma35d1_clk_gate(dev, "qei2_gate", "pclk1",
+					 clk_base + REG_CLK_APBCLK2, 14);
+
+	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
+					     &ma35d1_lock, 0,
+					     clk_base + REG_CLK_CLKDIV4,
+					     4, 17, 0x1ffff);
+	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
+					clk_base + REG_CLK_APBCLK2, 24);
+
+	hws[EADC_DIV] = ma35d1_clk_divider_table(dev, "eadc_div", "pclk2",
+						 clk_base + REG_CLK_CLKDIV4,
+						 0, 4, eadc_div_table);
+	hws[EADC_GATE] = ma35d1_clk_gate(dev, "eadc_gate", "eadc_div",
+					 clk_base + REG_CLK_APBCLK2, 25);
+
+	return devm_of_clk_add_hw_provider(dev,
+					   of_clk_hw_onecell_get,
+					   ma35d1_hw_data);
+}
+
+static const struct of_device_id ma35d1_clk_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_clk_of_match);
+
+static struct platform_driver ma35d1_clk_driver = {
+	.probe = ma35d1_clocks_probe,
+	.driver = {
+		.name = "ma35d1-clk",
+		.of_match_table = ma35d1_clk_of_match,
+	},
+};
+
+static int __init ma35d1_clocks_init(void)
+{
+	return platform_driver_register(&ma35d1_clk_driver);
+}
+
+postcore_initcall(ma35d1_clocks_init);
+
+MODULE_AUTHOR("Chi-Fang Li <cfli0@nuvoton.com>");
+MODULE_DESCRIPTION("NUVOTON MA35D1 Clock Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


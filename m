Return-Path: <linux-clk+bounces-5910-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC38A41A8
	for <lists+linux-clk@lfdr.de>; Sun, 14 Apr 2024 12:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8ED28191F
	for <lists+linux-clk@lfdr.de>; Sun, 14 Apr 2024 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA225634;
	Sun, 14 Apr 2024 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEf9ZCE4"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDFF22F08;
	Sun, 14 Apr 2024 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713089051; cv=none; b=KvtdrrB/TjrWCpB654XotwAh5GtfNfDxxl50JMtV3JbzP5kvuElOFr5q9iVMTA0AgiAR7w07dLl7RMWj6CQ/gtQ8mctDTs0Xvn/ZUh57bvKpkV2lj0A/OpxBTOXuy2Jz/rPlRT+ayyo6i+sym16JPbj1F4TXrtAzFvboPoSxIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713089051; c=relaxed/simple;
	bh=FiuIwLssO/eE85OtRjZ443h5aqsKfiZvenrmi1qjgpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddHJURAZ6JmUNd+RJRyWMW0j0oG6vjn12tO69TAfdADiXOFLEnUD6guMLVIKMxZf56iH1Wo7FBrQECmKlVzzqP3QM6mm90UrKJWnyI0GEY+HtQ4BkD3VAN4FbdZXkUJS+/NE2Qxbk9suJvfJWN9pN2uXIWzuIW+R8oM+0j6k8Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEf9ZCE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1806C32783;
	Sun, 14 Apr 2024 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713089050;
	bh=FiuIwLssO/eE85OtRjZ443h5aqsKfiZvenrmi1qjgpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qEf9ZCE4DeQyrosOCuDWpq3ojRPYtynpr9xpt4OP78YDZ7jktpJZdg6OAyN0O2sB8
	 +Ovg9pea+daznAu1KBIjL8xT/48OISryTHuGUPghm5EJOkZkFQgKbh1MtFUUGpLrzW
	 DOCK+pDo/2lu6/jN/SMR+WM380KeXB0GLy3JiY3OBd9NJK5cs+4CVqW15GDsSqsjB7
	 C/GzIxxhLCphDNDhpo/VduT1SI4iaxshZqbbOB5P729MHrbvV8iCVjEPhLAdWQ45H+
	 ya4/tyTRCnIM93PJoukB/zbP3x41shuzERBLg2U8yqNPuNnpuy5CTrLBXjBBjVJhOH
	 ladHwUmh6b79Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B48C04FFF;
	Sun, 14 Apr 2024 10:04:10 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Sun, 14 Apr 2024 13:03:49 +0300
Subject: [PATCH v2 2/4] clk: ep93xx: add DT support for Cirrus EP93xx
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-ep93xx-clk-v2-2-9c5629dec2dd@maquefel.me>
References: <20240408-ep93xx-clk-v2-0-9c5629dec2dd@maquefel.me>
In-Reply-To: <20240408-ep93xx-clk-v2-0-9c5629dec2dd@maquefel.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713089049; l=26662;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=X3ptUFRP/zZ/LzO35bdq9oUS5/qdjYfglcxworXjWWQ=;
 b=s4g/AGcwvvkSw850XU1JYXsNwiE5mtmB+Frm0fUOznGEy2eBCFksEJhlf5cZD8IrPatl/n1XO0xO
 QQfTjKqXCXKAtePYoF57Na0d/W3MCJi1uT3XVbZf4bt5nWPhsmr3
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: nikita.shubin@maquefel.me

From: Nikita Shubin <nikita.shubin@maquefel.me>

Rewrite EP93xx clock driver located in arch/arm/mach-ep93xx/clock.c
trying to do everything the device tree way:

- provide clock acces via of
- drop clk_hw_register_clkdev
- drop init code and use module_auxiliary_driver

Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/clk/Kconfig      |   8 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ep93xx.c | 834 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 843 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 50af5fc7f570..0f0351251285 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -218,6 +218,14 @@ config COMMON_CLK_EN7523
 	  This driver provides the fixed clocks and gates present on Airoha
 	  ARM silicon.
 
+config COMMON_CLK_EP93XX
+	bool "Clock driver for Cirrus Logic ep93xx SoC"
+	depends on ARCH_EP93XX || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  This driver supports the SoC clocks on the Cirrus Logic ep93xx.
+
 config COMMON_CLK_FSL_FLEXSPI
 	tristate "Clock driver for FlexSPI on Layerscape SoCs"
 	depends on ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 14fa8d4ecc1f..bfb8827deda7 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
+obj-$(CONFIG_COMMON_CLK_EP93XX)		+= clk-ep93xx.o
 obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
new file mode 100644
index 000000000000..a0430a5ae4da
--- /dev/null
+++ b/drivers/clk/clk-ep93xx.c
@@ -0,0 +1,834 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Clock control for Cirrus EP93xx chips.
+ * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
+ *
+ * Based on a rewrite of arch/arm/mach-ep93xx/clock.c:
+ * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
+ */
+#define pr_fmt(fmt) "ep93xx " KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk-provider.h>
+#include <linux/math.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#include <linux/soc/cirrus/ep93xx.h>
+#include <dt-bindings/clock/cirrus,ep9301-syscon.h>
+
+#include <asm/div64.h>
+
+#define EP93XX_EXT_CLK_RATE		14745600
+#define EP93XX_EXT_RTC_RATE		32768
+
+#define EP93XX_SYSCON_POWER_STATE	0x00
+#define EP93XX_SYSCON_PWRCNT		0x04
+#define EP93XX_SYSCON_PWRCNT_UARTBAUD	BIT(29)
+#define EP93XX_SYSCON_PWRCNT_USH_EN	28
+#define EP93XX_SYSCON_PWRCNT_DMA_M2M1	27
+#define EP93XX_SYSCON_PWRCNT_DMA_M2M0	26
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P8	25
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P9	24
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P6	23
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P7	22
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P4	21
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P5	20
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P2	19
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P3	18
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P0	17
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P1	16
+#define EP93XX_SYSCON_CLKSET1		0x20
+#define EP93XX_SYSCON_CLKSET1_NBYP1	BIT(23)
+#define EP93XX_SYSCON_CLKSET2		0x24
+#define EP93XX_SYSCON_CLKSET2_NBYP2	BIT(19)
+#define EP93XX_SYSCON_CLKSET2_PLL2_EN	BIT(18)
+#define EP93XX_SYSCON_DEVCFG		0x80
+#define EP93XX_SYSCON_DEVCFG_U3EN	24
+#define EP93XX_SYSCON_DEVCFG_U2EN	20
+#define EP93XX_SYSCON_DEVCFG_U1EN	18
+#define EP93XX_SYSCON_VIDCLKDIV		0x84
+#define EP93XX_SYSCON_CLKDIV_ENABLE	15
+#define EP93XX_SYSCON_CLKDIV_ESEL	BIT(14)
+#define EP93XX_SYSCON_CLKDIV_PSEL	BIT(13)
+#define EP93XX_SYSCON_CLKDIV_MASK	GENMASK(14, 13)
+#define EP93XX_SYSCON_CLKDIV_PDIV_SHIFT	8
+#define EP93XX_SYSCON_I2SCLKDIV		0x8c
+#define EP93XX_SYSCON_I2SCLKDIV_SENA	31
+#define EP93XX_SYSCON_I2SCLKDIV_ORIDE	BIT(29)
+#define EP93XX_SYSCON_I2SCLKDIV_SPOL	BIT(19)
+#define EP93XX_SYSCON_KEYTCHCLKDIV	0x90
+#define EP93XX_SYSCON_KEYTCHCLKDIV_TSEN	31
+#define EP93XX_SYSCON_KEYTCHCLKDIV_ADIV	16
+#define EP93XX_SYSCON_KEYTCHCLKDIV_KEN	15
+#define EP93XX_SYSCON_KEYTCHCLKDIV_KDIV	0
+#define EP93XX_SYSCON_CHIPID		0x94
+#define EP93XX_SYSCON_CHIPID_ID		0x9213
+
+static const char adc_divisors[] = { 16, 4 };
+static const char sclk_divisors[] = { 2, 4 };
+static const char lrclk_divisors[] = { 32, 64, 128 };
+
+struct ep93xx_clk {
+	struct clk_hw hw;
+	u16 idx;
+	u16 reg;
+	u32 mask;
+	u8 bit_idx;
+	u8 shift;
+	u8 width;
+	u8 num_div;
+	const char *div;
+};
+
+struct ep93xx_clk_priv {
+	spinlock_t lock;
+	struct ep93xx_regmap_adev *aux_dev;
+	struct device *dev;
+	void __iomem *base;
+	struct regmap *map;
+	struct clk_hw *fixed[21];
+	struct ep93xx_clk reg[];
+};
+
+static struct ep93xx_clk *ep93xx_clk_from(struct clk_hw *hw)
+{
+	return container_of(hw, struct ep93xx_clk, hw);
+}
+
+static struct ep93xx_clk_priv *ep93xx_priv_from(struct ep93xx_clk *clk)
+{
+	return container_of(clk, struct ep93xx_clk_priv, reg[clk->idx]);
+}
+
+static void ep93xx_clk_write(struct ep93xx_clk_priv *priv, unsigned int reg, unsigned int val)
+{
+	struct ep93xx_regmap_adev *aux = priv->aux_dev;
+
+	aux->write(aux->map, aux->lock, reg, val);
+}
+
+static int ep93xx_clk_is_enabled(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+
+	return !!(val & BIT(clk->bit_idx));
+}
+
+static int ep93xx_clk_enable(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val |= BIT(clk->bit_idx);
+
+	ep93xx_clk_write(priv, clk->reg, val);
+
+	return 0;
+}
+
+static void ep93xx_clk_disable(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~BIT(clk->bit_idx);
+
+	ep93xx_clk_write(priv, clk->reg, val);
+}
+
+static const struct clk_ops clk_ep93xx_gate_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+};
+
+static int ep93xx_clk_register_gate(struct ep93xx_clk *clk,
+				    const char *name,
+				    struct clk_parent_data *parent_data,
+				    unsigned long flags,
+				    unsigned int reg,
+				    u8 bit_idx)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &clk_ep93xx_gate_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	clk->reg = reg;
+	clk->bit_idx = bit_idx;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+static u8 ep93xx_mux_get_parent(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+
+	val &= EP93XX_SYSCON_CLKDIV_MASK;
+
+	switch (val) {
+	case EP93XX_SYSCON_CLKDIV_ESEL:
+		return 1; /* PLL1 */
+	case EP93XX_SYSCON_CLKDIV_MASK:
+		return 2; /* PLL2 */
+	default:
+		return 0; /* XTALI */
+	};
+}
+
+static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	if (index >= 3)
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&priv->lock);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~(EP93XX_SYSCON_CLKDIV_MASK);
+	val |= index > 0 ? EP93XX_SYSCON_CLKDIV_ESEL : 0;
+	val |= index > 1 ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
+
+	ep93xx_clk_write(priv, clk->reg, val);
+
+	return 0;
+}
+
+static bool is_best(unsigned long rate, unsigned long now,
+		     unsigned long best)
+{
+	return abs_diff(rate, now) < abs_diff(rate, best);
+}
+
+static int ep93xx_mux_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
+{
+	unsigned long best_rate = 0, actual_rate, mclk_rate;
+	unsigned long rate = req->rate;
+	struct clk_hw *parent_best = NULL;
+	unsigned long parent_rate_best;
+	unsigned long parent_rate;
+	int div, pdiv;
+	unsigned int i;
+
+	/*
+	 * Try the two pll's and the external clock,
+	 * because the valid predividers are 2, 2.5 and 3, we multiply
+	 * all the clocks by 2 to avoid floating point math.
+	 *
+	 * This is based on the algorithm in the ep93xx raster guide:
+	 * http://be-a-maverick.com/en/pubs/appNote/AN269REV1.pdf
+	 *
+	 */
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
+
+		parent_rate = clk_hw_get_rate(parent);
+		mclk_rate = parent_rate * 2;
+
+		/* Try each predivider value */
+		for (pdiv = 4; pdiv <= 6; pdiv++) {
+			div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
+			if (!in_range(div, 1, 127))
+				continue;
+
+			actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
+			if (is_best(rate, actual_rate, best_rate)) {
+				best_rate = actual_rate;
+				parent_rate_best = parent_rate;
+				parent_best = parent;
+			}
+		}
+	}
+
+	if (!parent_best)
+		return -EINVAL;
+
+	req->best_parent_rate = parent_rate_best;
+	req->best_parent_hw = parent_best;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static unsigned long ep93xx_ddiv_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned int pdiv, div;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	pdiv = (val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & GENMASK(1, 0);
+	div = val & GENMASK(6, 0);
+	if (!div)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(parent_rate * 2, (pdiv + 3) * div);
+}
+
+static int ep93xx_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	int pdiv, div, npdiv, ndiv;
+	unsigned long actual_rate, mclk_rate, rate_err = ULONG_MAX;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	mclk_rate = parent_rate * 2;
+
+	for (pdiv = 4; pdiv <= 6; pdiv++) {
+		div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
+		if (!in_range(div, 1, 127))
+			continue;
+
+		actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
+		if (abs(actual_rate - rate) < rate_err) {
+			npdiv = pdiv - 3;
+			ndiv = div;
+			rate_err = abs(actual_rate - rate);
+		}
+	}
+
+	if (rate_err == ULONG_MAX)
+		return -EINVAL;
+
+	/*
+	 * Clear old dividers.
+	 * Bit 7 is reserved bit in all ClkDiv registers.
+	 */
+	val &= ~(GENMASK(9, 0) & ~BIT(7));
+
+	/* Set the new pdiv and div bits for the new clock rate */
+	val |= (npdiv << EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | ndiv;
+
+	ep93xx_clk_write(priv, clk->reg, val);
+
+	return 0;
+}
+
+static const struct clk_ops clk_ddiv_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+	.get_parent = ep93xx_mux_get_parent,
+	.set_parent = ep93xx_mux_set_parent_lock,
+	.determine_rate = ep93xx_mux_determine_rate,
+	.recalc_rate = ep93xx_ddiv_recalc_rate,
+	.set_rate = ep93xx_ddiv_set_rate,
+};
+
+static int clk_hw_register_ddiv(struct ep93xx_clk *clk,
+				const char *name,
+				struct clk_parent_data *parent_data,
+				u8 num_parents,
+				unsigned int reg,
+				u8 bit_idx)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &clk_ddiv_ops;
+	init.flags = 0;
+	init.parent_data = parent_data;
+	init.num_parents = num_parents;
+
+	clk->reg = reg;
+	clk->bit_idx = bit_idx;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+static unsigned long ep93xx_div_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+	u8 index;
+
+	regmap_read(priv->map, clk->reg, &val);
+	index = (val & clk->mask) >> clk->shift;
+	if (index > clk->num_div)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
+}
+
+static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	unsigned long best = 0, now;
+	unsigned int i;
+
+	for (i = 0; i < clk->num_div; i++) {
+		if ((rate * clk->div[i]) == *parent_rate)
+			return rate;
+
+		now = DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
+		if (!best || is_best(rate, now, best))
+			best = now;
+	}
+
+	return best;
+}
+
+static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned int i;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~clk->mask;
+	for (i = 0; i < clk->num_div; i++)
+		if (rate == DIV_ROUND_CLOSEST(parent_rate, clk->div[i]))
+			break;
+
+	if (i == clk->num_div)
+		return -EINVAL;
+
+	val |= i << clk->shift;
+
+	ep93xx_clk_write(priv, clk->reg, val);
+
+	return 0;
+}
+
+static const struct clk_ops ep93xx_div_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+	.recalc_rate = ep93xx_div_recalc_rate,
+	.round_rate = ep93xx_div_round_rate,
+	.set_rate = ep93xx_div_set_rate,
+};
+
+static int clk_hw_register_div(struct ep93xx_clk *clk,
+			       const char *name,
+			       struct clk_parent_data *parent_data,
+			       unsigned int reg,
+			       u8 enable_bit,
+			       u8 shift,
+			       u8 width,
+			       const char *clk_divisors,
+			       u8 num_div)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &ep93xx_div_ops;
+	init.flags = 0;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	clk->reg = reg;
+	clk->bit_idx = enable_bit;
+	clk->mask = GENMASK(shift + width - 1, shift);
+	clk->shift = shift;
+	clk->div = clk_divisors;
+	clk->num_div = num_div;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+struct ep93xx_gate {
+	unsigned int idx;
+	unsigned int bit;
+	const char *name;
+};
+
+static const struct ep93xx_gate ep93xx_uarts[] = {
+	{ EP93XX_CLK_UART1, EP93XX_SYSCON_DEVCFG_U1EN, "uart1" },
+	{ EP93XX_CLK_UART2, EP93XX_SYSCON_DEVCFG_U2EN, "uart2" },
+	{ EP93XX_CLK_UART3, EP93XX_SYSCON_DEVCFG_U3EN, "uart3" },
+};
+
+static int ep93xx_uart_clock_init(struct ep93xx_clk_priv *priv)
+{
+	struct clk_parent_data parent_data = { };
+	unsigned int i, idx, ret, clk_uart_div;
+	struct ep93xx_clk *clk;
+	u32 val;
+
+	regmap_read(priv->map, EP93XX_SYSCON_PWRCNT, &val);
+	if (val & EP93XX_SYSCON_PWRCNT_UARTBAUD)
+		clk_uart_div = 1;
+	else
+		clk_uart_div = 2;
+
+	priv->fixed[EP93XX_CLK_UART] =
+		clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1, clk_uart_div);
+	parent_data.hw = priv->fixed[EP93XX_CLK_UART];
+
+	/* parenting uart gate clocks to uart clock */
+	for (i = 0; i < ARRAY_SIZE(ep93xx_uarts); i++) {
+		idx = ep93xx_uarts[i].idx - EP93XX_CLK_UART1;
+		clk = &priv->reg[idx];
+		clk->idx = idx;
+		ret = ep93xx_clk_register_gate(clk,
+					ep93xx_uarts[i].name,
+					&parent_data, CLK_SET_RATE_PARENT,
+					EP93XX_SYSCON_DEVCFG,
+					ep93xx_uarts[i].bit);
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+					     "failed to register uart[%d] clock\n", i);
+	}
+
+	return 0;
+}
+
+static const struct ep93xx_gate ep93xx_dmas[] = {
+	{ EP93XX_CLK_M2M0, EP93XX_SYSCON_PWRCNT_DMA_M2M0, "m2m0" },
+	{ EP93XX_CLK_M2M1, EP93XX_SYSCON_PWRCNT_DMA_M2M1, "m2m1" },
+	{ EP93XX_CLK_M2P0, EP93XX_SYSCON_PWRCNT_DMA_M2P0, "m2p0" },
+	{ EP93XX_CLK_M2P1, EP93XX_SYSCON_PWRCNT_DMA_M2P1, "m2p1" },
+	{ EP93XX_CLK_M2P2, EP93XX_SYSCON_PWRCNT_DMA_M2P2, "m2p2" },
+	{ EP93XX_CLK_M2P3, EP93XX_SYSCON_PWRCNT_DMA_M2P3, "m2p3" },
+	{ EP93XX_CLK_M2P4, EP93XX_SYSCON_PWRCNT_DMA_M2P4, "m2p4" },
+	{ EP93XX_CLK_M2P5, EP93XX_SYSCON_PWRCNT_DMA_M2P5, "m2p5" },
+	{ EP93XX_CLK_M2P6, EP93XX_SYSCON_PWRCNT_DMA_M2P6, "m2p6" },
+	{ EP93XX_CLK_M2P7, EP93XX_SYSCON_PWRCNT_DMA_M2P7, "m2p7" },
+	{ EP93XX_CLK_M2P8, EP93XX_SYSCON_PWRCNT_DMA_M2P8, "m2p8" },
+	{ EP93XX_CLK_M2P9, EP93XX_SYSCON_PWRCNT_DMA_M2P9, "m2p9" },
+};
+
+static int ep93xx_dma_clock_init(struct ep93xx_clk_priv *priv)
+{
+	struct clk_parent_data parent_data = { };
+	unsigned int i, idx;
+
+	parent_data.hw = priv->fixed[EP93XX_CLK_HCLK];
+	for (i = 0; i < ARRAY_SIZE(ep93xx_dmas); i++) {
+		idx = ep93xx_dmas[i].idx;
+		priv->fixed[idx] = devm_clk_hw_register_gate_parent_data(priv->dev,
+					ep93xx_dmas[i].name,
+					&parent_data, 0,
+					priv->base + EP93XX_SYSCON_PWRCNT,
+					ep93xx_dmas[i].bit,
+					0,
+					&priv->lock);
+		if (IS_ERR(priv->fixed[idx]))
+			return PTR_ERR(priv->fixed[idx]);
+	}
+
+	return 0;
+}
+
+static struct clk_hw *of_clk_ep93xx_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct ep93xx_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < EP93XX_CLK_UART1)
+		return priv->fixed[idx];
+
+	if (idx <= EP93XX_CLK_I2S_LRCLK)
+		return &priv->reg[idx - EP93XX_CLK_UART1].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+/*
+ * PLL rate = 14.7456 MHz * (X1FBD + 1) * (X2FBD + 1) / (X2IPD + 1) / 2^PS
+ */
+static unsigned long calc_pll_rate(u64 rate, u32 config_word)
+{
+	rate *= ((config_word >> 11) & GENMASK(4, 0)) + 1;	/* X1FBD */
+	rate *= ((config_word >> 5) & GENMASK(5, 0)) + 1;	/* X2FBD */
+	do_div(rate, (config_word & GENMASK(4, 0)) + 1);	/* X2IPD */
+	rate >>= (config_word >> 16) & GENMASK(1, 0);		/* PS */
+
+	return rate;
+}
+
+static int ep93xx_plls_init(struct ep93xx_clk_priv *priv)
+{
+	const char fclk_divisors[] = { 1, 2, 4, 8, 16, 1, 1, 1 };
+	const char hclk_divisors[] = { 1, 2, 4, 5, 6, 8, 16, 32 };
+	const char pclk_divisors[] = { 1, 2, 4, 8 };
+	unsigned int clk_f_div, clk_h_div, clk_p_div;
+	unsigned long clk_pll1_rate, clk_pll2_rate;
+	struct device *dev = priv->dev;
+	struct clk_hw *hw, *pll1;
+	u32 value;
+
+	/* Determine the bootloader configured pll1 rate */
+	regmap_read(priv->map, EP93XX_SYSCON_CLKSET1, &value);
+
+	if (value & EP93XX_SYSCON_CLKSET1_NBYP1)
+		clk_pll1_rate = calc_pll_rate(EP93XX_EXT_CLK_RATE, value);
+	else
+		clk_pll1_rate = EP93XX_EXT_CLK_RATE;
+
+	pll1 = devm_clk_hw_register_fixed_rate(dev, "pll1", "xtali", 0, clk_pll1_rate);
+	if (IS_ERR(pll1))
+		return PTR_ERR(pll1);
+
+	priv->fixed[EP93XX_CLK_PLL1] = pll1;
+
+	/* Initialize the pll1 derived clocks */
+	clk_f_div = fclk_divisors[(value >> 25) & GENMASK(2, 0)];
+	clk_h_div = hclk_divisors[(value >> 20) & GENMASK(2, 0)];
+	clk_p_div = pclk_divisors[(value >> 18) & GENMASK(1, 0)];
+
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "fclk", pll1, 0, 1, clk_f_div);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_FCLK] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "hclk", pll1, 0, 1, clk_h_div);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_HCLK] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "pclk", hw, 0, 1, clk_p_div);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_PCLK] = hw;
+
+	/* Determine the bootloader configured pll2 rate */
+	regmap_read(priv->map, EP93XX_SYSCON_CLKSET2, &value);
+	if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
+		clk_pll2_rate = EP93XX_EXT_CLK_RATE;
+	else if (value & EP93XX_SYSCON_CLKSET2_PLL2_EN)
+		clk_pll2_rate = calc_pll_rate(EP93XX_EXT_CLK_RATE, value);
+	else
+		clk_pll2_rate = 0;
+
+	hw = devm_clk_hw_register_fixed_rate(dev, "pll2", "xtali", 0, clk_pll2_rate);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_PLL2] = hw;
+
+	return 0;
+}
+
+static int ep93xx_clk_probe(struct auxiliary_device *adev,
+			       const struct auxiliary_device_id *id)
+{
+	struct ep93xx_regmap_adev *rdev = to_ep93xx_regmap_adev(adev);
+	struct clk_parent_data xtali = { .index = 0 };
+	struct clk_parent_data ddiv_pdata[3] = { };
+	unsigned int clk_spi_div, clk_usb_div;
+	struct clk_parent_data pdata = {};
+	struct device *dev = &adev->dev;
+	struct ep93xx_clk_priv *priv;
+	struct ep93xx_clk *clk;
+	struct clk_hw *hw;
+	unsigned int idx;
+	int ret;
+	u32 value;
+
+	priv = devm_kzalloc(dev, struct_size(priv, reg, 10), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+	priv->dev = dev;
+	priv->aux_dev = rdev;
+	priv->map = rdev->map;
+	priv->base = rdev->base;
+
+	ret = ep93xx_plls_init(priv);
+	if (ret)
+		return ret;
+
+	regmap_read(priv->map, EP93XX_SYSCON_CLKSET2, &value);
+	clk_usb_div = (value >> 28 & GENMASK(3, 0)) + 1;
+	hw = devm_clk_hw_register_fixed_factor(dev, "usb_clk", "pll2", 0, 1, clk_usb_div);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_USB] = hw;
+
+	ret = ep93xx_uart_clock_init(priv);
+	if (ret)
+		return ret;
+
+	ret = ep93xx_dma_clock_init(priv);
+	if (ret)
+		return ret;
+
+	clk_spi_div = id->driver_data;
+	hw = devm_clk_hw_register_fixed_factor(dev, "ep93xx-spi.0", "xtali",
+					       0, 1, clk_spi_div);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_SPI] = hw;
+
+	/* PWM clock */
+	hw = devm_clk_hw_register_fixed_factor(dev, "pwm_clk", "xtali", 0, 1, 1);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_PWM] = hw;
+
+	/* USB clock */
+	hw = devm_clk_hw_register_gate(priv->dev, "ohci-platform", "usb_clk",
+				       0, priv->base + EP93XX_SYSCON_PWRCNT,
+				       EP93XX_SYSCON_PWRCNT_USH_EN, 0,
+				       &priv->lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	priv->fixed[EP93XX_CLK_USB] = hw;
+
+	ddiv_pdata[0].index = 0; /* XTALI external clock */
+	ddiv_pdata[1].hw = priv->fixed[EP93XX_CLK_PLL1];
+	ddiv_pdata[2].hw = priv->fixed[EP93XX_CLK_PLL2];
+
+	/* touchscreen/ADC clock */
+	idx = EP93XX_CLK_ADC - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	ret = clk_hw_register_div(clk, "ep93xx-adc", &xtali,
+				EP93XX_SYSCON_KEYTCHCLKDIV,
+				EP93XX_SYSCON_KEYTCHCLKDIV_TSEN,
+				EP93XX_SYSCON_KEYTCHCLKDIV_ADIV,
+				1,
+				adc_divisors,
+				ARRAY_SIZE(adc_divisors));
+
+
+	/* keypad clock */
+	idx = EP93XX_CLK_KEYPAD - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	ret = clk_hw_register_div(clk, "ep93xx-keypad", &xtali,
+				EP93XX_SYSCON_KEYTCHCLKDIV,
+				EP93XX_SYSCON_KEYTCHCLKDIV_KEN,
+				EP93XX_SYSCON_KEYTCHCLKDIV_KDIV,
+				1,
+				adc_divisors,
+				ARRAY_SIZE(adc_divisors));
+
+	/*
+	 * On reset PDIV and VDIV is set to zero, while PDIV zero
+	 * means clock disable, VDIV shouldn't be zero.
+	 * So we set both video and i2s dividers to minimum.
+	 * ENA - Enable CLK divider.
+	 * PDIV - 00 - Disable clock
+	 * VDIV - at least 2
+	 */
+
+	/* Check and enable video clk registers */
+	regmap_read(priv->map, EP93XX_SYSCON_VIDCLKDIV, &value);
+	value |= BIT(EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | 2;
+	ep93xx_clk_write(priv, EP93XX_SYSCON_VIDCLKDIV, value);
+
+	/* Check and enable i2s clk registers */
+	regmap_read(priv->map, EP93XX_SYSCON_I2SCLKDIV, &value);
+	value |= BIT(EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | 2;
+
+	/*
+	 * Override the SAI_MSTR_CLK_CFG from the I2S block and use the
+	 * I2SClkDiv Register settings. LRCLK transitions on the falling SCLK
+	 * edge.
+	 */
+	value |= EP93XX_SYSCON_I2SCLKDIV_ORIDE | EP93XX_SYSCON_I2SCLKDIV_SPOL;
+	ep93xx_clk_write(priv, EP93XX_SYSCON_I2SCLKDIV, value);
+
+	/* video clk */
+	idx = EP93XX_CLK_VIDEO - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	ret = clk_hw_register_ddiv(clk, "ep93xx-fb",
+				ddiv_pdata, ARRAY_SIZE(ddiv_pdata),
+				EP93XX_SYSCON_VIDCLKDIV,
+				EP93XX_SYSCON_CLKDIV_ENABLE);
+
+	/* i2s clk */
+	idx = EP93XX_CLK_I2S_MCLK - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	ret = clk_hw_register_ddiv(clk, "mclk",
+				ddiv_pdata, ARRAY_SIZE(ddiv_pdata),
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_CLKDIV_ENABLE);
+
+	/* i2s sclk */
+	idx = EP93XX_CLK_I2S_SCLK - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	pdata.hw = &priv->reg[EP93XX_CLK_I2S_MCLK - EP93XX_CLK_UART1].hw;
+	ret = clk_hw_register_div(clk, "sclk", &pdata,
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_I2SCLKDIV_SENA,
+				16, /* EP93XX_I2SCLKDIV_SDIV_SHIFT */
+				1,  /* EP93XX_I2SCLKDIV_SDIV_WIDTH */
+				sclk_divisors,
+				ARRAY_SIZE(sclk_divisors));
+
+	/* i2s lrclk */
+	idx = EP93XX_CLK_I2S_LRCLK - EP93XX_CLK_UART1;
+	clk = &priv->reg[idx];
+	clk->idx = idx;
+	pdata.hw = &priv->reg[EP93XX_CLK_I2S_SCLK - EP93XX_CLK_UART1].hw;
+	ret = clk_hw_register_div(clk, "lrclk", &pdata,
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_I2SCLKDIV_SENA,
+				17, /* EP93XX_I2SCLKDIV_LRDIV32_SHIFT */
+				2,  /* EP93XX_I2SCLKDIV_LRDIV32_WIDTH */
+				lrclk_divisors,
+				ARRAY_SIZE(lrclk_divisors));
+
+	/* IrDa clk uses same pattern but no init code presents in original clock driver */
+	return devm_of_clk_add_hw_provider(priv->dev, of_clk_ep93xx_get, priv);
+}
+
+static const struct auxiliary_device_id ep93xx_clk_ids[] = {
+	{ .name = "soc_ep93xx.clk-ep93xx", .driver_data = 2, },
+	{ .name = "soc_ep93xx.clk-ep93xx.e2", .driver_data = 1, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ep93xx_clk_ids);
+
+static struct auxiliary_driver ep93xx_clk_driver = {
+	.probe		= ep93xx_clk_probe,
+	.id_table	= ep93xx_clk_ids,
+};
+module_auxiliary_driver(ep93xx_clk_driver);

-- 
2.41.0




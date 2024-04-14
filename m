Return-Path: <linux-clk+bounces-5743-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A884E8A064A
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 04:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBABD1C22A56
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 02:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD1513B59B;
	Thu, 11 Apr 2024 02:58:32 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6F713B580;
	Thu, 11 Apr 2024 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804312; cv=none; b=Ea7K29Pv3tVHQyQIfMH58aIPuHEXpyNNTzyVGCbTUoXDNuKujfXuKTWSqwkvQs5PuNpQrV6mALh2f9zF5ImOgPd2rJsJ/kHD/wUICs3lMRNu2L9QtWj48gB0A1XKY7gafgLJEioLtSwYFTE3NiK6CB39Z4eCg9ytWqRPvQMIKU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804312; c=relaxed/simple;
	bh=2g87W4kIKwp/OdRMtp15zNJDkjxiReK2VQk1E5fU+Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxvB12AB3d1K6eTfz++dtMyduB0h5J2sHSr4OOAplqUk9IT8z7bWxQuedCXcqI0GUS4iMbZgt+PjElyyTRJRx950HGcG7/TQl0x1dQuNRfg9ZJ2v32pMf0/bTgr/bS4FEAksCO/aoe80OhFt7DNigaTLkX4gQTZrmJ8Gtp/kTPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxSPDUURdm2ZwlAA--.5072S3;
	Thu, 11 Apr 2024 10:58:28 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLBPLURdmz8l3AA--.34105S4;
	Thu, 11 Apr 2024 10:58:26 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 2/6] clk: clk-loongson2: Refactor driver for adding new platforms
Date: Thu, 11 Apr 2024 10:58:07 +0800
Message-ID: <fb020d1ca19e6f4cdcc95c87b2748869ca76b8ec.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLBPLURdmz8l3AA--.34105S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJFWrKF13Cw4kCry5trW7KFX_yoW8WFWkXo
	W3uFsxJr4xJw18Way0vw15tF47XF43AwnrAF1xArs8C3WS9rZ8G34xJF13CF97XF95KFnx
	uFyrtayrJr4xJrW7l-sFpf9Il3svdjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYA7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8_gA5UUUUU==

The driver only supported loongson-2K1000 at first, but the clock
structure of loongson-2K0500 and loongson-2K2000 are actually similar,
and I tried to refactor the whole driver to adjust to the addition of
the new platform.

Briefly, I have divided all clocks into three categories according to
their properties and their parent clocks: Independent PLLs, clocks based
on frequency scales, and clock dividers.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 459 ++++++++++++++++--------------------
 1 file changed, 199 insertions(+), 260 deletions(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index bacdcbb287ac..ff2ade6a471a 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -6,6 +6,7 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -13,317 +14,254 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <dt-bindings/clock/loongson,ls2k-clk.h>
 
-#define LOONGSON2_PLL_MULT_SHIFT		32
-#define LOONGSON2_PLL_MULT_WIDTH		10
-#define LOONGSON2_PLL_DIV_SHIFT			26
-#define LOONGSON2_PLL_DIV_WIDTH			6
-#define LOONGSON2_APB_FREQSCALE_SHIFT		20
-#define LOONGSON2_APB_FREQSCALE_WIDTH		3
-#define LOONGSON2_USB_FREQSCALE_SHIFT		16
-#define LOONGSON2_USB_FREQSCALE_WIDTH		3
-#define LOONGSON2_SATA_FREQSCALE_SHIFT		12
-#define LOONGSON2_SATA_FREQSCALE_WIDTH		3
-#define LOONGSON2_BOOT_FREQSCALE_SHIFT		8
-#define LOONGSON2_BOOT_FREQSCALE_WIDTH		3
-
-static void __iomem *loongson2_pll_base;
-
 static const struct clk_parent_data pdata[] = {
-	{ .fw_name = "ref_100m",},
+	{ .fw_name = "ref_100m", },
 };
 
-static struct clk_hw *loongson2_clk_register(struct device *dev,
-					  const char *name,
-					  const char *parent_name,
-					  const struct clk_ops *ops,
-					  unsigned long flags)
-{
-	int ret;
-	struct clk_hw *hw;
-	struct clk_init_data init = { };
-
-	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
-	if (!hw)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = ops;
-	init.flags = flags;
-	init.num_parents = 1;
-
-	if (!parent_name)
-		init.parent_data = pdata;
-	else
-		init.parent_names = &parent_name;
-
-	hw->init = &init;
-
-	ret = devm_clk_hw_register(dev, hw);
-	if (ret)
-		hw = ERR_PTR(ret);
-
-	return hw;
-}
-
-static unsigned long loongson2_calc_pll_rate(int offset, unsigned long rate)
-{
-	u64 val;
-	u32 mult, div;
-
-	val = readq(loongson2_pll_base + offset);
-
-	mult = (val >> LOONGSON2_PLL_MULT_SHIFT) &
-			clk_div_mask(LOONGSON2_PLL_MULT_WIDTH);
-	div = (val >> LOONGSON2_PLL_DIV_SHIFT) &
-			clk_div_mask(LOONGSON2_PLL_DIV_WIDTH);
-
-	return div_u64((u64)rate * mult, div);
-}
-
-static unsigned long loongson2_node_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	return loongson2_calc_pll_rate(0x0, parent_rate);
-}
-
-static const struct clk_ops loongson2_node_clk_ops = {
-	.recalc_rate = loongson2_node_recalc_rate,
+enum loongson2_clk_type {
+	CLK_TYPE_PLL,
+	CLK_TYPE_SCALE,
+	CLK_TYPE_DIVIDER,
+	CLK_TYPE_NONE,
 };
 
-static unsigned long loongson2_ddr_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	return loongson2_calc_pll_rate(0x10, parent_rate);
-}
+struct loongson2_clk_provider {
+	void __iomem *base;
+	struct device *dev;
+	struct clk_hw_onecell_data clk_data;
+	spinlock_t clk_lock;	/* protect access to DIV registers */
+};
 
-static const struct clk_ops loongson2_ddr_clk_ops = {
-	.recalc_rate = loongson2_ddr_recalc_rate,
+struct loongson2_clk_data {
+	struct clk_hw hw;
+	void __iomem *reg;
+	u8 div_shift;
+	u8 div_width;
+	u8 mult_shift;
+	u8 mult_width;
 };
 
-static unsigned long loongson2_dc_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	return loongson2_calc_pll_rate(0x20, parent_rate);
-}
+struct loongson2_clk_board_info {
+	u8 id;
+	enum loongson2_clk_type type;
+	const char *name;
+	const char *parent_name;
+	u8 reg_offset;
+	u8 div_shift;
+	u8 div_width;
+	u8 mult_shift;
+	u8 mult_width;
+};
 
-static const struct clk_ops loongson2_dc_clk_ops = {
-	.recalc_rate = loongson2_dc_recalc_rate,
+#define CLK_DIV(_id, _name, _pname, _offset, _dshift, _dwidth)	\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_DIVIDER,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.div_shift	= _dshift,			\
+		.div_width	= _dwidth,			\
+	}
+
+#define CLK_PLL(_id, _name, _offset, _mshift, _mwidth,		\
+		_dshift, _dwidth)				\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_PLL,			\
+		.name		= _name,			\
+		.parent_name	= NULL,				\
+		.reg_offset	= _offset,			\
+		.mult_shift	= _mshift,			\
+		.mult_width	= _mwidth,			\
+		.div_shift	= _dshift,			\
+		.div_width	= _dwidth,			\
+	}
+
+#define CLK_SCALE(_id, _name, _pname, _offset,			\
+		  _dshift, _dwidth)				\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_SCALE,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.div_shift	= _dshift,			\
+		.div_width	= _dwidth,			\
+	}
+
+static const struct loongson2_clk_board_info ls2k1000_clks[] = {
+	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    32, 10, 26, 6),
+	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x10, 32, 10, 26, 6),
+	CLK_PLL(LOONGSON2_DC_PLL,     "pll_dc",   0x20, 32, 10, 26, 6),
+	CLK_PLL(LOONGSON2_PIX0_PLL,   "pll_pix0", 0x30, 32, 10, 26, 6),
+	CLK_PLL(LOONGSON2_PIX1_PLL,   "pll_pix1", 0x40, 32, 10, 26, 6),
+	CLK_DIV(LOONGSON2_NODE_CLK,   "clk_node", "pll_node", 0x8,  0,  6),
+	CLK_DIV(LOONGSON2_DDR_CLK,    "clk_ddr",  "pll_ddr",  0x18, 0,  6),
+	CLK_DIV(LOONGSON2_GPU_CLK,    "clk_gpu",  "pll_ddr",  0x18, 22, 6),
+	/*
+	 * The hda clk divisor in the upper 32bits and the clk-prodiver
+	 * layer code doesn't support 64bit io operation thus a conversion
+	 * is required that subtract shift by 32 and add 4byte to the hda
+	 * address
+	 */
+	CLK_DIV(LOONGSON2_HDA_CLK,    "clk_hda",  "pll_ddr",  0x22, 12, 7),
+	CLK_DIV(LOONGSON2_DC_CLK,     "clk_dc",   "pll_dc",   0x28, 0,  6),
+	CLK_DIV(LOONGSON2_GMAC_CLK,   "clk_gmac", "pll_dc",   0x28, 22, 6),
+	CLK_DIV(LOONGSON2_PIX0_CLK,   "clk_pix0", "pll_pix0", 0x38, 0,  6),
+	CLK_DIV(LOONGSON2_PIX1_CLK,   "clk_pix1", "pll_pix1", 0x38, 0,  6),
+	CLK_SCALE(LOONGSON2_BOOT_CLK, "clk_boot", NULL,       0x50, 8,  3),
+	CLK_SCALE(LOONGSON2_SATA_CLK, "clk_sata", "clk_gmac", 0x50, 12, 3),
+	CLK_SCALE(LOONGSON2_USB_CLK,  "clk_usb",  "clk_gmac", 0x50, 16, 3),
+	CLK_SCALE(LOONGSON2_APB_CLK,  "clk_apb",  "clk_gmac", 0x50, 20, 3),
+	{ /* Sentinel */ },
 };
 
-static unsigned long loongson2_pix0_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
+static inline struct loongson2_clk_data *to_loongson2_clk(struct clk_hw *hw)
 {
-	return loongson2_calc_pll_rate(0x30, parent_rate);
+	return container_of(hw, struct loongson2_clk_data, hw);
 }
 
-static const struct clk_ops loongson2_pix0_clk_ops = {
-	.recalc_rate = loongson2_pix0_recalc_rate,
-};
-
-static unsigned long loongson2_pix1_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
+static inline unsigned long loongson2_rate_part(u64 val, u8 shift, u8 width)
 {
-	return loongson2_calc_pll_rate(0x40, parent_rate);
+	return (val & GENMASK(shift + width - 1, shift)) >> shift;
 }
 
-static const struct clk_ops loongson2_pix1_clk_ops = {
-	.recalc_rate = loongson2_pix1_recalc_rate,
-};
-
-static unsigned long loongson2_calc_rate(unsigned long rate,
-					 int shift, int width)
+static unsigned long loongson2_pll_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
 {
-	u64 val;
-	u32 mult;
-
-	val = readq(loongson2_pll_base + 0x50);
+	u64 val, mult, div;
+	struct loongson2_clk_data *clk = to_loongson2_clk(hw);
 
-	mult = (val >> shift) & clk_div_mask(width);
+	val  = readq(clk->reg);
+	mult = loongson2_rate_part(val, clk->mult_shift, clk->mult_width);
+	div  = loongson2_rate_part(val, clk->div_shift,  clk->div_width);
 
-	return div_u64((u64)rate * (mult + 1), 8);
-}
-
-static unsigned long loongson2_boot_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	return loongson2_calc_rate(parent_rate,
-				   LOONGSON2_BOOT_FREQSCALE_SHIFT,
-				   LOONGSON2_BOOT_FREQSCALE_WIDTH);
+	return div_u64((u64)parent_rate * mult, div);
 }
 
-static const struct clk_ops loongson2_boot_clk_ops = {
-	.recalc_rate = loongson2_boot_recalc_rate,
+static const struct clk_ops loongson2_pll_recalc_ops = {
+	.recalc_rate = loongson2_pll_recalc_rate,
 };
 
-static unsigned long loongson2_apb_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
+static unsigned long loongson2_freqscale_recalc_rate(struct clk_hw *hw,
+						     unsigned long parent_rate)
 {
-	return loongson2_calc_rate(parent_rate,
-				   LOONGSON2_APB_FREQSCALE_SHIFT,
-				   LOONGSON2_APB_FREQSCALE_WIDTH);
-}
+	u64 val, mult;
+	struct loongson2_clk_data *clk = to_loongson2_clk(hw);
 
-static const struct clk_ops loongson2_apb_clk_ops = {
-	.recalc_rate = loongson2_apb_recalc_rate,
-};
+	val  = readq(clk->reg);
+	mult = loongson2_rate_part(val, clk->div_shift, clk->div_width) + 1;
 
-static unsigned long loongson2_usb_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	return loongson2_calc_rate(parent_rate,
-				   LOONGSON2_USB_FREQSCALE_SHIFT,
-				   LOONGSON2_USB_FREQSCALE_WIDTH);
+	return div_u64((u64)parent_rate * mult, 8);
 }
 
-static const struct clk_ops loongson2_usb_clk_ops = {
-	.recalc_rate = loongson2_usb_recalc_rate,
+static const struct clk_ops loongson2_freqscale_recalc_ops = {
+	.recalc_rate = loongson2_freqscale_recalc_rate,
 };
 
-static unsigned long loongson2_sata_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
+static struct clk_hw *loongson2_clk_register(struct loongson2_clk_provider *clp,
+					     const struct loongson2_clk_board_info *cld,
+					     const struct clk_ops *ops)
 {
-	return loongson2_calc_rate(parent_rate,
-				   LOONGSON2_SATA_FREQSCALE_SHIFT,
-				   LOONGSON2_SATA_FREQSCALE_WIDTH);
-}
+	int ret;
+	struct clk_hw *hw;
+	struct loongson2_clk_data *clk;
+	struct clk_init_data init = { };
 
-static const struct clk_ops loongson2_sata_clk_ops = {
-	.recalc_rate = loongson2_sata_recalc_rate,
-};
+	clk = devm_kzalloc(clp->dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
 
-static inline int loongson2_check_clk_hws(struct clk_hw *clks[], unsigned int count)
-{
-	unsigned int i;
+	init.name  = cld->name;
+	init.ops   = ops;
+	init.flags = 0;
+	init.num_parents = 1;
 
-	for (i = 0; i < count; i++)
-		if (IS_ERR(clks[i])) {
-			pr_err("Loongson2 clk %u: register failed with %ld\n",
-				i, PTR_ERR(clks[i]));
-			return PTR_ERR(clks[i]);
-		}
+	if (!cld->parent_name)
+		init.parent_data = pdata;
+	else
+		init.parent_names = &cld->parent_name;
+
+	clk->reg	= clp->base + cld->reg_offset;
+	clk->div_shift	= cld->div_shift;
+	clk->div_width	= cld->div_width;
+	clk->mult_shift	= cld->mult_shift;
+	clk->mult_width	= cld->mult_width;
+	clk->hw.init	= &init;
 
-	return 0;
+	hw = &clk->hw;
+	ret = devm_clk_hw_register(clp->dev, hw);
+	if (ret)
+		clk = ERR_PTR(ret);
+
+	return hw;
 }
 
 static int loongson2_clk_probe(struct platform_device *pdev)
 {
-	int ret;
-	struct clk_hw **hws;
-	struct clk_hw_onecell_data *clk_hw_data;
-	spinlock_t loongson2_clk_lock;
+	int i, clks_num = 0;
+	struct clk_hw *hw;
 	struct device *dev = &pdev->dev;
+	struct loongson2_clk_provider *clp;
+	const struct loongson2_clk_board_info *p, *data;
 
-	loongson2_pll_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(loongson2_pll_base))
-		return PTR_ERR(loongson2_pll_base);
-
-	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, LOONGSON2_CLK_END),
-					GFP_KERNEL);
-	if (WARN_ON(!clk_hw_data))
-		return -ENOMEM;
-
-	clk_hw_data->num = LOONGSON2_CLK_END;
-	hws = clk_hw_data->hws;
-
-	hws[LOONGSON2_NODE_PLL] = loongson2_clk_register(dev, "node_pll",
-						NULL,
-						&loongson2_node_clk_ops, 0);
-
-	hws[LOONGSON2_DDR_PLL] = loongson2_clk_register(dev, "ddr_pll",
-						NULL,
-						&loongson2_ddr_clk_ops, 0);
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
 
-	hws[LOONGSON2_DC_PLL] = loongson2_clk_register(dev, "dc_pll",
-						NULL,
-						&loongson2_dc_clk_ops, 0);
+	for (p = data; p->name; p++)
+		clks_num++;
 
-	hws[LOONGSON2_PIX0_PLL] = loongson2_clk_register(dev, "pix0_pll",
-						NULL,
-						&loongson2_pix0_clk_ops, 0);
-
-	hws[LOONGSON2_PIX1_PLL] = loongson2_clk_register(dev, "pix1_pll",
-						NULL,
-						&loongson2_pix1_clk_ops, 0);
+	clp = devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_num),
+			   GFP_KERNEL);
+	if (!clp)
+		return -ENOMEM;
 
-	hws[LOONGSON2_BOOT_CLK] = loongson2_clk_register(dev, "boot",
-						NULL,
-						&loongson2_boot_clk_ops, 0);
+	clp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clp->base))
+		return PTR_ERR(clp->base);
+
+	spin_lock_init(&clp->clk_lock);
+	clp->clk_data.num = clks_num + 1;
+	clp->dev = dev;
+
+	for (i = 0; i < clks_num; i++) {
+		p = &data[i];
+		switch (p->type) {
+		case CLK_TYPE_PLL:
+			hw = loongson2_clk_register(clp, p,
+						    &loongson2_pll_recalc_ops);
+			break;
+		case CLK_TYPE_SCALE:
+			hw = loongson2_clk_register(clp, p,
+						    &loongson2_freqscale_recalc_ops);
+			break;
+		case CLK_TYPE_DIVIDER:
+			hw = devm_clk_hw_register_divider(dev, p->name,
+							  p->parent_name, 0,
+							  clp->base + p->reg_offset,
+							  p->div_shift, p->div_width,
+							  CLK_DIVIDER_ONE_BASED,
+							  &clp->clk_lock);
+			break;
+		default:
+			return dev_err_probe(dev, -EINVAL, "Invalid clk type\n");
+		}
 
-	hws[LOONGSON2_NODE_CLK] = devm_clk_hw_register_divider(dev, "node",
-						"node_pll", 0,
-						loongson2_pll_base + 0x8, 0,
-						6, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "Register clk: %s, type: %u failed!\n",
+					     p->name, p->type);
 
-	/*
-	 * The hda clk divisor in the upper 32bits and the clk-prodiver
-	 * layer code doesn't support 64bit io operation thus a conversion
-	 * is required that subtract shift by 32 and add 4byte to the hda
-	 * address
-	 */
-	hws[LOONGSON2_HDA_CLK] = devm_clk_hw_register_divider(dev, "hda",
-						"ddr_pll", 0,
-						loongson2_pll_base + 0x22, 12,
-						7, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_GPU_CLK] = devm_clk_hw_register_divider(dev, "gpu",
-						"ddr_pll", 0,
-						loongson2_pll_base + 0x18, 22,
-						6, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_DDR_CLK] = devm_clk_hw_register_divider(dev, "ddr",
-						"ddr_pll", 0,
-						loongson2_pll_base + 0x18, 0,
-						6, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_GMAC_CLK] = devm_clk_hw_register_divider(dev, "gmac",
-						"dc_pll", 0,
-						loongson2_pll_base + 0x28, 22,
-						6, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_DC_CLK] = devm_clk_hw_register_divider(dev, "dc",
-						"dc_pll", 0,
-						loongson2_pll_base + 0x28, 0,
-						6, CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_APB_CLK] = loongson2_clk_register(dev, "apb",
-						"gmac",
-						&loongson2_apb_clk_ops, 0);
-
-	hws[LOONGSON2_USB_CLK] = loongson2_clk_register(dev, "usb",
-						"gmac",
-						&loongson2_usb_clk_ops, 0);
-
-	hws[LOONGSON2_SATA_CLK] = loongson2_clk_register(dev, "sata",
-						"gmac",
-						&loongson2_sata_clk_ops, 0);
-
-	hws[LOONGSON2_PIX0_CLK] = clk_hw_register_divider(NULL, "pix0",
-						"pix0_pll", 0,
-						loongson2_pll_base + 0x38, 0, 6,
-						CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	hws[LOONGSON2_PIX1_CLK] = clk_hw_register_divider(NULL, "pix1",
-						"pix1_pll", 0,
-						loongson2_pll_base + 0x48, 0, 6,
-						CLK_DIVIDER_ONE_BASED,
-						&loongson2_clk_lock);
-
-	ret = loongson2_check_clk_hws(hws, LOONGSON2_CLK_END);
-	if (ret)
-		return ret;
+		clp->clk_data.hws[p->id] = hw;
+	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clp->clk_data);
 }
 
 static const struct of_device_id loongson2_clk_match_table[] = {
-	{ .compatible = "loongson,ls2k-clk" },
+	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, loongson2_clk_match_table);
@@ -338,4 +276,5 @@ static struct platform_driver loongson2_clk_driver = {
 module_platform_driver(loongson2_clk_driver);
 
 MODULE_DESCRIPTION("Loongson2 clock driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
 MODULE_LICENSE("GPL");
-- 
2.43.0



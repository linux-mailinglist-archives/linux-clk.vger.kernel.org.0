Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C1C18EBD6
	for <lists+linux-clk@lfdr.de>; Sun, 22 Mar 2020 20:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgCVTIU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 22 Mar 2020 15:08:20 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:59664 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgCVTIU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Mar 2020 15:08:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07465821|-1;CH=green;DM=||false|;DS=CONTINUE|ham_regular_dialog|0.105996-0.000220954-0.893783;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03309;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.H3Z9uBl_1584904084;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.H3Z9uBl_1584904084)
          by smtp.aliyun-inc.com(10.147.41.199);
          Mon, 23 Mar 2020 03:08:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v7 2/6] clk: Ingenic: Adjust cgu code to make it compatible with X1830.
Date:   Mon, 23 Mar 2020 03:07:34 +0800
Message-Id: <1584904058-53155-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584904058-53155-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1584904058-53155-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL of X1830 Soc from Ingenic has been greatly changed,
the bypass control is placed in another register, so now two
registers may needed to control the PLL. To this end, a new
"bypass_reg" was introduced. In addition, when calculating
rate, the PLL of X1830 introduced an extra 2x multiplier,
so a new "rate_multiplier" was introduced. And adjust the
code in jz47xx-cgu.c and x1000-cgu.c, make it to be
compatible with the new cgu code.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2->v3:
    Adjust order from [1/5] in v2 to [2/5] in v3.
    
    v3->v4:
    Merge [3/5] in v3 into this patch.
    
    v4->v5:
    Rebase on top of kernel 5.6-rc1.
    
    v5->v6:
    Revert "pll_reg" to "reg" to minimize patch as Paul Cercueil's suggest.
    
    v6->v7:
    Update commit message.

 drivers/clk/ingenic/cgu.c         | 16 +++++++++++++---
 drivers/clk/ingenic/cgu.h         |  4 ++++
 drivers/clk/ingenic/jz4725b-cgu.c |  4 ++++
 drivers/clk/ingenic/jz4740-cgu.c  |  4 ++++
 drivers/clk/ingenic/jz4770-cgu.c  |  8 +++++++-
 drivers/clk/ingenic/jz4780-cgu.c  |  4 ++++
 drivers/clk/ingenic/x1000-cgu.c   |  6 ++++++
 7 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index ab1302a..d7981b6 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -90,6 +90,9 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	n += pll_info->n_offset;
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
+
+	ctl = readl(cgu->base + pll_info->bypass_reg);
+
 	bypass = !pll_info->no_bypass_bit &&
 		 !!(ctl & BIT(pll_info->bypass_bit));
 
@@ -103,7 +106,8 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	BUG_ON(od == pll_info->od_max);
 	od++;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
+		n * od);
 }
 
 static unsigned long
@@ -136,7 +140,8 @@ ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
 	if (pod)
 		*pod = od;
 
-	return div_u64((u64)parent_rate * m, n * od);
+	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
+		n * od);
 }
 
 static inline const struct ingenic_cgu_clk_info *to_clk_info(
@@ -209,9 +214,14 @@ static int ingenic_pll_enable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->reg);
+	ctl = readl(cgu->base + pll_info->bypass_reg);
 
 	ctl &= ~BIT(pll_info->bypass_bit);
+
+	writel(ctl, cgu->base + pll_info->bypass_reg);
+
+	ctl = readl(cgu->base + pll_info->reg);
+
 	ctl |= BIT(pll_info->enable_bit);
 
 	writel(ctl, cgu->base + pll_info->reg);
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 0dc8004..2c75ef4 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -17,6 +17,7 @@
 /**
  * struct ingenic_cgu_pll_info - information about a PLL
  * @reg: the offset of the PLL's control register within the CGU
+ * @rate_multiplier: the multiplier needed by pll rate calculation
  * @m_shift: the number of bits to shift the multiplier value by (ie. the
  *           index of the lowest bit of the multiplier value in the PLL's
  *           control register)
@@ -37,6 +38,7 @@
  * @od_encoding: a pointer to an array mapping post-VCO divider values to
  *               their encoded values in the PLL control register, or -1 for
  *               unsupported values
+ * @bypass_reg: the offset of the bypass control register within the CGU
  * @bypass_bit: the index of the bypass bit in the PLL control register
  * @enable_bit: the index of the enable bit in the PLL control register
  * @stable_bit: the index of the stable bit in the PLL control register
@@ -44,10 +46,12 @@
  */
 struct ingenic_cgu_pll_info {
 	unsigned reg;
+	unsigned rate_multiplier;
 	const s8 *od_encoding;
 	u8 m_shift, m_bits, m_offset;
 	u8 n_shift, n_bits, n_offset;
 	u8 od_shift, od_bits, od_max;
+	unsigned bypass_reg;
 	u8 bypass_bit;
 	u8 enable_bit;
 	u8 stable_bit;
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index a3b4635..8c38e72 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -9,7 +9,9 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/jz4725b-cgu.h>
+
 #include "cgu.h"
 #include "pm.h"
 
@@ -54,6 +56,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR,
+			.rate_multiplier = 1,
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
@@ -65,6 +68,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 			.od_max = 4,
 			.od_encoding = pll_od_encoding,
 			.stable_bit = 10,
+			.bypass_reg = CGU_REG_CPPCR,
 			.bypass_bit = 9,
 			.enable_bit = 8,
 		},
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 4f0e92c..c0ac919 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -10,7 +10,9 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/jz4740-cgu.h>
+
 #include "cgu.h"
 #include "pm.h"
 
@@ -69,6 +71,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR,
+			.rate_multiplier = 1,
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
@@ -80,6 +83,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 			.od_max = 4,
 			.od_encoding = pll_od_encoding,
 			.stable_bit = 10,
+			.bypass_reg = CGU_REG_CPPCR,
 			.bypass_bit = 9,
 			.enable_bit = 8,
 		},
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 956dd65..d97ca80 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -9,7 +9,9 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/jz4770-cgu.h>
+
 #include "cgu.h"
 #include "pm.h"
 
@@ -102,6 +104,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
 			.reg = CGU_REG_CPPCR0,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -112,6 +115,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 			.od_bits = 2,
 			.od_max = 8,
 			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR0,
 			.bypass_bit = 9,
 			.enable_bit = 8,
 			.stable_bit = 10,
@@ -124,6 +128,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
 			.reg = CGU_REG_CPPCR1,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -134,9 +139,10 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 			.od_bits = 2,
 			.od_max = 8,
 			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_CPPCR1,
+			.no_bypass_bit = true,
 			.enable_bit = 7,
 			.stable_bit = 6,
-			.no_bypass_bit = true,
 		},
 	},
 
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index ea905ff..b97ae29 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -10,7 +10,9 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/jz4780-cgu.h>
+
 #include "cgu.h"
 #include "pm.h"
 
@@ -221,6 +223,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 #define DEF_PLL(name) { \
 	.reg = CGU_REG_ ## name, \
+	.rate_multiplier = 1, \
 	.m_shift = 19, \
 	.m_bits = 13, \
 	.m_offset = 1, \
@@ -232,6 +235,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	.od_max = 16, \
 	.od_encoding = pll_od_encoding, \
 	.stable_bit = 6, \
+	.bypass_reg = CGU_REG_ ## name, \
 	.bypass_bit = 1, \
 	.enable_bit = 0, \
 }
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index b22d87b..c33934d 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -7,7 +7,9 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+
 #include <dt-bindings/clock/x1000-cgu.h>
+
 #include "cgu.h"
 #include "pm.h"
 
@@ -58,6 +60,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_APLL,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -68,6 +71,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 			.od_bits = 2,
 			.od_max = 8,
 			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_APLL,
 			.bypass_bit = 9,
 			.enable_bit = 8,
 			.stable_bit = 10,
@@ -79,6 +83,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_MPLL,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -89,6 +94,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 			.od_bits = 2,
 			.od_max = 8,
 			.od_encoding = pll_od_encoding,
+			.bypass_reg = CGU_REG_MPLL,
 			.bypass_bit = 6,
 			.enable_bit = 7,
 			.stable_bit = 0,
-- 
2.7.4


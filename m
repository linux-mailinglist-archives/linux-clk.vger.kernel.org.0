Return-Path: <linux-clk+bounces-4567-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F94A87BBB9
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 12:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 931B91C21326
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 11:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6246EB4B;
	Thu, 14 Mar 2024 11:10:50 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE06BB2F
	for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710414650; cv=none; b=fszA3yp8fu5GeRRpcCePeOo61tqs8kJjcUEVV6nT+P2JqJg49j2wsUrilUMoNwzeIgrBvyGx+a69fx5peXAKYUjAOkqFz7wW5K/VVqaRXK617CLCyPeCwfrodsQ0+I4ZL2z0+cTubYWR1ewfFLjZznFpd1ZXbf9IWmDe26iKMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710414650; c=relaxed/simple;
	bh=kNJD2vfdVNOWGd8yX3s8kD7ohIaKfeALYGkpdHnoD1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SwGvNFknMCF1rjGdsbq9AUijjNO2rGP4oP7XpWiTfNPt2BTQy2IaLO+1VxzdbimNmr22wIydSpMkRg2qJUFH+ik1tttm9wxlpyi0hnkn0Ie8y+AYuPJ+PM9GeGmN7zugHm30tbi9QoGn91+0vwKBAx0gFjR413sfEzqxY37lJUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TwPgF0yK3z4x71d
	for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 12:05:29 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id yb5G2B00R0SSLxL01b5GhH; Thu, 14 Mar 2024 12:05:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rkitO-003gBz-Tu;
	Thu, 14 Mar 2024 12:05:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rkitg-00F90v-Fj;
	Thu, 14 Mar 2024 12:05:16 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] clk: starfive: jh7100: Use provided clocks instead of hardcoded names
Date: Thu, 14 Mar 2024 12:05:13 +0100
Message-Id: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Starfive JH7100 clock driver does not use the DT "clocks" property
to find its external input clocks, but instead relies on the names of
the actual external clock providers.  This is fragile, and caused
breakage when sanitizing clock names in DT.

Fix this by obtaining the external input clocks through the DT "clocks"
property, and using their clk_hw objects or corresponding name.

Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
After this is applied, the workaround in commit 7921e231f85a349d
("riscv: dts: starfive: jh7100: fix root clock names") can be reverted.
---
 drivers/clk/starfive/clk-starfive-jh7100.c | 47 +++++++++++++++-------
 drivers/clk/starfive/clk-starfive-jh71x0.h |  1 +
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
index 0342db24c27e10df..08e6f03f2cfc36c1 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100.c
+++ b/drivers/clk/starfive/clk-starfive-jh7100.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -18,10 +19,18 @@
 #include "clk-starfive-jh71x0.h"
 
 /* external clocks */
-#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
-#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + 1)
-#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + 2)
-#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + 3)
+enum {
+	EXT_CLK_OSC_SYS,
+	EXT_CLK_OSC_AUD,
+	EXT_CLK_GMAC_RMII_REF,
+	EXT_CLK_GMAC_GR_MII_RX,
+	EXT_NUM_CLKS
+};
+
+#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + EXT_CLK_OSC_SYS)
+#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + EXT_CLK_OSC_AUD)
+#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + EXT_CLK_GMAC_RMII_REF)
+#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + EXT_CLK_GMAC_GR_MII_RX)
 
 static const struct jh71x0_clk_data jh7100_clk_data[] __initconst = {
 	JH71X0__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 0, 4,
@@ -284,8 +293,12 @@ static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data
 
 static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 {
+	static const char *jh7100_ext_clk[EXT_NUM_CLKS] =
+		{ "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk" };
 	struct jh71x0_clk_priv *priv;
+	const char *osc_sys;
 	unsigned int idx;
+	struct clk *clk;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, JH7100_CLK_PLL0_OUT), GFP_KERNEL);
@@ -298,13 +311,23 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	for (idx = 0; idx < EXT_NUM_CLKS; idx++) {
+		clk = devm_clk_get(&pdev->dev, jh7100_ext_clk[idx]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		priv->ext[idx] = __clk_get_hw(clk);
+	}
+
+	osc_sys = clk_hw_get_name(priv->ext[EXT_CLK_OSC_SYS]);
+
 	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
-							 "osc_sys", 0, 40, 1);
+							 osc_sys, 0, 40, 1);
 	if (IS_ERR(priv->pll[0]))
 		return PTR_ERR(priv->pll[0]);
 
 	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
-							 "osc_sys", 0, 64, 1);
+							 osc_sys, 0, 64, 1);
 	if (IS_ERR(priv->pll[1]))
 		return PTR_ERR(priv->pll[1]);
 
@@ -331,16 +354,10 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 
 			if (pidx < JH7100_CLK_PLL0_OUT)
 				parents[i].hw = &priv->reg[pidx].hw;
-			else if (pidx < JH7100_CLK_END)
+			else if (pidx < JH7100_CLK_OSC_SYS)
 				parents[i].hw = priv->pll[pidx - JH7100_CLK_PLL0_OUT];
-			else if (pidx == JH7100_CLK_OSC_SYS)
-				parents[i].fw_name = "osc_sys";
-			else if (pidx == JH7100_CLK_OSC_AUD)
-				parents[i].fw_name = "osc_aud";
-			else if (pidx == JH7100_CLK_GMAC_RMII_REF)
-				parents[i].fw_name = "gmac_rmii_ref";
-			else if (pidx == JH7100_CLK_GMAC_GR_MII_RX)
-				parents[i].fw_name = "gmac_gr_mii_rxclk";
+			else if (pidx <= JH7100_CLK_GMAC_GR_MII_RX)
+				parents[i].hw = priv->ext[pidx - JH7100_CLK_OSC_SYS];
 		}
 
 		clk->hw.init = &init;
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 23e052fc15495c41..4f46939179cd7418 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -115,6 +115,7 @@ struct jh71x0_clk_priv {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_hw *pll[3];
+	struct clk_hw *ext[4];
 	struct jh71x0_clk reg[];
 };
 
-- 
2.34.1



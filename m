Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEAB3ABC6A
	for <lists+linux-clk@lfdr.de>; Thu, 17 Jun 2021 21:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhFQTLi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Jun 2021 15:11:38 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37034 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233083AbhFQTLf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 15:11:35 -0400
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id C51E94C009D;
        Thu, 17 Jun 2021 19:09:21 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 9/9] clk: cs2000-cp: convert driver to regmap
Date:   Thu, 17 Jun 2021 21:09:12 +0200
Message-Id: <20210617190912.262809-10-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617190912.262809-1-daniel@zonque.org>
References: <20210617190912.262809-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Regmap gives us caching, debugging infrastructure and other things for
free and does away with open-coded bit-fiddling implementations.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/Kconfig         |   1 +
 drivers/clk/clk-cs2000-cp.c | 124 ++++++++++++++++++++----------------
 2 files changed, 69 insertions(+), 56 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a588d56502d4..646283411a03 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -185,6 +185,7 @@ config COMMON_CLK_CDCE925
 config COMMON_CLK_CS2000_CP
 	tristate "Clock driver for CS2000 Fractional-N Clock Synthesizer & Clock Multiplier"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the CS2000 clock multiplier.
 
diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index a630fb75bd4c..352918d392ca 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/of_device.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 
 #define CH_MAX 4
 #define RATIO_REG_SIZE 4
@@ -74,11 +75,36 @@
 #define REF_CLK	1
 #define CLK_MAX 2
 
+static bool cs2000_readable_reg(struct device *dev, unsigned int reg)
+{
+	return reg > 0;
+}
+
+static bool cs2000_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg != DEVICE_ID;
+}
+
+static bool cs2000_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == DEVICE_CTRL;
+}
+
+static const struct regmap_config cs2000_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= FUNC_CFG2,
+	.readable_reg	= cs2000_readable_reg,
+	.writeable_reg	= cs2000_writeable_reg,
+	.volatile_reg	= cs2000_volatile_reg,
+};
+
 struct cs2000_priv {
 	struct clk_hw hw;
 	struct i2c_client *client;
 	struct clk *clk_in;
 	struct clk *ref_clk;
+	struct regmap *regmap;
 
 	bool lf_ratio;
 	bool clk_skip;
@@ -100,41 +126,22 @@ static const struct i2c_device_id cs2000_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cs2000_id);
 
-#define cs2000_read(priv, addr) \
-	i2c_smbus_read_byte_data(priv_to_client(priv), addr)
-#define cs2000_write(priv, addr, val) \
-	i2c_smbus_write_byte_data(priv_to_client(priv), addr, val)
-
-static int cs2000_bset(struct cs2000_priv *priv, u8 addr, u8 mask, u8 val)
-{
-	s32 data;
-
-	data = cs2000_read(priv, addr);
-	if (data < 0)
-		return data;
-
-	data &= ~mask;
-	data |= (val & mask);
-
-	return cs2000_write(priv, addr, data);
-}
-
 static int cs2000_enable_dev_config(struct cs2000_priv *priv, bool enable)
 {
 	int ret;
 
-	ret = cs2000_bset(priv, DEVICE_CFG1, ENDEV1,
-			  enable ? ENDEV1 : 0);
+	ret = regmap_update_bits(priv->regmap, DEVICE_CFG1, ENDEV1,
+				 enable ? ENDEV1 : 0);
 	if (ret < 0)
 		return ret;
 
-	ret = cs2000_bset(priv, GLOBAL_CFG,  ENDEV2,
-			  enable ? ENDEV2 : 0);
+	ret = regmap_update_bits(priv->regmap, GLOBAL_CFG,  ENDEV2,
+				 enable ? ENDEV2 : 0);
 	if (ret < 0)
 		return ret;
 
-	ret = cs2000_bset(priv, FUNC_CFG1, CLKSKIPEN,
-			  (enable && priv->clk_skip) ? CLKSKIPEN : 0);
+	ret = regmap_update_bits(priv->regmap, FUNC_CFG1, CLKSKIPEN,
+				 (enable && priv->clk_skip) ? CLKSKIPEN : 0);
 	if (ret < 0)
 		return ret;
 
@@ -155,21 +162,21 @@ static int cs2000_ref_clk_bound_rate(struct cs2000_priv *priv,
 	else
 		return -EINVAL;
 
-	return cs2000_bset(priv, FUNC_CFG1,
-			   REFCLKDIV_MASK,
-			   REFCLKDIV(val));
+	return regmap_update_bits(priv->regmap, FUNC_CFG1,
+				  REFCLKDIV_MASK,
+				  REFCLKDIV(val));
 }
 
 static int cs2000_wait_pll_lock(struct cs2000_priv *priv)
 {
 	struct device *dev = priv_to_dev(priv);
-	s32 val;
-	unsigned int i;
+	unsigned int i, val;
+	int ret;
 
 	for (i = 0; i < 256; i++) {
-		val = cs2000_read(priv, DEVICE_CTRL);
-		if (val < 0)
-			return val;
+		ret = regmap_read(priv->regmap, DEVICE_CTRL, &val);
+		if (ret < 0)
+			return ret;
 		if (!(val & PLL_UNLOCK))
 			return 0;
 		udelay(1);
@@ -183,10 +190,10 @@ static int cs2000_wait_pll_lock(struct cs2000_priv *priv)
 static int cs2000_clk_out_enable(struct cs2000_priv *priv, bool enable)
 {
 	/* enable both AUX_OUT, CLK_OUT */
-	return cs2000_bset(priv, DEVICE_CTRL,
-			   (AUXOUTDIS | CLKOUTDIS),
-			   enable ? 0 :
-			   (AUXOUTDIS | CLKOUTDIS));
+	return regmap_update_bits(priv->regmap, DEVICE_CTRL,
+				  (AUXOUTDIS | CLKOUTDIS),
+				  enable ? 0 :
+				  (AUXOUTDIS | CLKOUTDIS));
 }
 
 static u32 cs2000_rate_to_ratio(u32 rate_in, u32 rate_out, bool lf_ratio)
@@ -234,7 +241,7 @@ static int cs2000_ratio_set(struct cs2000_priv *priv,
 
 	val = cs2000_rate_to_ratio(rate_in, rate_out, priv->lf_ratio);
 	for (i = 0; i < RATIO_REG_SIZE; i++) {
-		ret = cs2000_write(priv,
+		ret = regmap_write(priv->regmap,
 				   Ratio_Add(ch, i),
 				   Ratio_Val(val, i));
 		if (ret < 0)
@@ -246,14 +253,14 @@ static int cs2000_ratio_set(struct cs2000_priv *priv,
 
 static u32 cs2000_ratio_get(struct cs2000_priv *priv, int ch)
 {
-	s32 tmp;
+	unsigned int tmp, i;
 	u32 val;
-	unsigned int i;
+	int ret;
 
 	val = 0;
 	for (i = 0; i < RATIO_REG_SIZE; i++) {
-		tmp = cs2000_read(priv, Ratio_Add(ch, i));
-		if (tmp < 0)
+		ret = regmap_read(priv->regmap, Ratio_Add(ch, i), &tmp);
+		if (ret < 0)
 			return 0;
 
 		val |= Val_Ratio(tmp, i);
@@ -270,16 +277,16 @@ static int cs2000_ratio_select(struct cs2000_priv *priv, int ch)
 	if (CH_SIZE_ERR(ch))
 		return -EINVAL;
 
-	ret = cs2000_bset(priv, DEVICE_CFG1, RSEL_MASK, RSEL(ch));
+	ret = regmap_update_bits(priv->regmap, DEVICE_CFG1, RSEL_MASK, RSEL(ch));
 	if (ret < 0)
 		return ret;
 
 	/* Always use dynamic mode when CLK_IN is present */
 	fracnsrc = priv->clk_in ? FRACNSRC_DYNAMIC : FRACNSRC_STATIC;
 
-	ret = cs2000_bset(priv, DEVICE_CFG2,
-			  AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK,
-			  LOCKCLK(ch) | fracnsrc);
+	ret = regmap_update_bits(priv->regmap, DEVICE_CFG2,
+				 AUTORMOD | LOCKCLK_MASK | FRACNSRC_MASK,
+				 LOCKCLK(ch) | fracnsrc);
 	if (ret < 0)
 		return ret;
 
@@ -327,8 +334,8 @@ static int cs2000_select_ratio_mode(struct cs2000_priv *priv,
 	 */
 	priv->lf_ratio = priv->clk_in && ((rate / parent_rate) > 4096);
 
-	return cs2000_bset(priv, FUNC_CFG2, LFRATIO_MASK,
-			   priv->lf_ratio ? LFRATIO_20_12 : LFRATIO_12_20);
+	return regmap_update_bits(priv->regmap, FUNC_CFG2, LFRATIO_MASK,
+				  priv->lf_ratio ? LFRATIO_20_12 : LFRATIO_12_20);
 }
 
 static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
@@ -337,7 +344,7 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 {
 	int ret;
 
-	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, FREEZE);
+	ret = regmap_update_bits(priv->regmap, GLOBAL_CFG, FREEZE, FREEZE);
 	if (ret < 0)
 		return ret;
 
@@ -353,7 +360,7 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 	if (ret < 0)
 		return ret;
 
-	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, 0);
+	ret = regmap_update_bits(priv->regmap, GLOBAL_CFG, FREEZE, 0);
 	if (ret < 0)
 		return ret;
 
@@ -467,8 +474,8 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	of_property_read_string(np, "clock-output-names", &name);
 
 	of_property_read_u32(np, "cirrus,aux-output-source", &aux_out);
-	ret = cs2000_bset(priv, DEVICE_CFG1,
-			  AUXOUTSRC_MASK, AUXOUTSRC(aux_out));
+	ret = regmap_update_bits(priv->regmap, DEVICE_CFG1,
+				 AUXOUTSRC_MASK, AUXOUTSRC(aux_out));
 	if (ret < 0)
 		return ret;
 
@@ -520,12 +527,13 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 static int cs2000_version_print(struct cs2000_priv *priv)
 {
 	struct device *dev = priv_to_dev(priv);
-	s32 val;
 	const char *revision;
+	unsigned int val;
+	int ret;
 
-	val = cs2000_read(priv, DEVICE_ID);
-	if (val < 0)
-		return val;
+	ret = regmap_read(priv->regmap, DEVICE_ID, &val);
+	if (ret < 0)
+		return ret;
 
 	/* CS2000 should be 0x0 */
 	if (val >> 3)
@@ -574,6 +582,10 @@ static int cs2000_probe(struct i2c_client *client,
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
+	priv->regmap = devm_regmap_init_i2c(client, &cs2000_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
 	ret = cs2000_clk_get(priv);
 	if (ret < 0)
 		return ret;
-- 
2.31.1


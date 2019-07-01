Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD2154FE2
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2019 15:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfFYNK6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jun 2019 09:10:58 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:36806 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726702AbfFYNK6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 09:10:58 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5PD97Tw003431;
        Tue, 25 Jun 2019 08:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=rUnKptlLAwEKysLFyNdT5JW8famHRRCQMMn8LqjDxdE=;
 b=aVYiZKLabZU+NMf1zNbrP4IZtx0GBB4qqoulCALgM4RzsK7uIjFoNRVPZYN3RaEVC0Io
 0YJ8oJkmctGCAmUyLsxIOqPRTWJQWH6gqSPQMg7IU4xlBmrARcqf2gaW4yhPQ3P2cuGs
 leUCPEtKMX0YIK98t3k1sVB5VyGkmZaDPd/RgU7GCMGqniL3wbJwXeGQgoFk8XOXkaZv
 y9lhzsPflzCuNcOEHjbQTdF1eEDiZSeD+9iLX2H/se+VtGOuM/SNgkYPmh1KNuGbr33b
 +BHrlArShAfjS5CWqutXonjBwu6qKvDN/lBM3cgJPoBerV3nQtfWHTAD2mqmSlMwiwgq zA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t9grnvnsf-1;
        Tue, 25 Jun 2019 08:10:54 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id 574A560D975E;
        Tue, 25 Jun 2019 08:10:54 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 14:10:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 25 Jun 2019 14:10:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AB8EE2A1;
        Tue, 25 Jun 2019 14:10:53 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-clk@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v3 RESEND] clk: lochnagar: Use new parent_data approach to register clock parents
Date:   Tue, 25 Jun 2019 14:10:53 +0100
Message-ID: <20190625131053.25407-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250103
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch over to the more modern style of registering parents and simplify
the code in the process.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/clk/clk-lochnagar.c | 205 +++++++++++++++++++-------------------------
 1 file changed, 86 insertions(+), 119 deletions(-)

diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
index a2f31e58ee483..fa8c91758b1d7 100644
--- a/drivers/clk/clk-lochnagar.c
+++ b/drivers/clk/clk-lochnagar.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <linux/mfd/lochnagar.h>
 #include <linux/mfd/lochnagar1_regs.h>
 #include <linux/mfd/lochnagar2_regs.h>
 
@@ -40,48 +39,46 @@ struct lochnagar_clk {
 struct lochnagar_clk_priv {
 	struct device *dev;
 	struct regmap *regmap;
-	enum lochnagar_type type;
-
-	const char **parents;
-	unsigned int nparents;
 
 	struct lochnagar_clk lclks[LOCHNAGAR_NUM_CLOCKS];
 };
 
-static const char * const lochnagar1_clk_parents[] = {
-	"ln-none",
-	"ln-spdif-mclk",
-	"ln-psia1-mclk",
-	"ln-psia2-mclk",
-	"ln-cdc-clkout",
-	"ln-dsp-clkout",
-	"ln-pmic-32k",
-	"ln-gf-mclk1",
-	"ln-gf-mclk3",
-	"ln-gf-mclk2",
-	"ln-gf-mclk4",
+#define LN_PARENT(NAME) { .name = NAME, .fw_name = NAME }
+
+static const struct clk_parent_data lochnagar1_clk_parents[] = {
+	LN_PARENT("ln-none"),
+	LN_PARENT("ln-spdif-mclk"),
+	LN_PARENT("ln-psia1-mclk"),
+	LN_PARENT("ln-psia2-mclk"),
+	LN_PARENT("ln-cdc-clkout"),
+	LN_PARENT("ln-dsp-clkout"),
+	LN_PARENT("ln-pmic-32k"),
+	LN_PARENT("ln-gf-mclk1"),
+	LN_PARENT("ln-gf-mclk3"),
+	LN_PARENT("ln-gf-mclk2"),
+	LN_PARENT("ln-gf-mclk4"),
 };
 
-static const char * const lochnagar2_clk_parents[] = {
-	"ln-none",
-	"ln-cdc-clkout",
-	"ln-dsp-clkout",
-	"ln-pmic-32k",
-	"ln-spdif-mclk",
-	"ln-clk-12m",
-	"ln-clk-11m",
-	"ln-clk-24m",
-	"ln-clk-22m",
-	"ln-clk-8m",
-	"ln-usb-clk-24m",
-	"ln-gf-mclk1",
-	"ln-gf-mclk3",
-	"ln-gf-mclk2",
-	"ln-psia1-mclk",
-	"ln-psia2-mclk",
-	"ln-spdif-clkout",
-	"ln-adat-mclk",
-	"ln-usb-clk-12m",
+static const struct clk_parent_data lochnagar2_clk_parents[] = {
+	LN_PARENT("ln-none"),
+	LN_PARENT("ln-cdc-clkout"),
+	LN_PARENT("ln-dsp-clkout"),
+	LN_PARENT("ln-pmic-32k"),
+	LN_PARENT("ln-spdif-mclk"),
+	LN_PARENT("ln-clk-12m"),
+	LN_PARENT("ln-clk-11m"),
+	LN_PARENT("ln-clk-24m"),
+	LN_PARENT("ln-clk-22m"),
+	LN_PARENT("ln-clk-8m"),
+	LN_PARENT("ln-usb-clk-24m"),
+	LN_PARENT("ln-gf-mclk1"),
+	LN_PARENT("ln-gf-mclk3"),
+	LN_PARENT("ln-gf-mclk2"),
+	LN_PARENT("ln-psia1-mclk"),
+	LN_PARENT("ln-psia2-mclk"),
+	LN_PARENT("ln-spdif-clkout"),
+	LN_PARENT("ln-adat-mclk"),
+	LN_PARENT("ln-usb-clk-12m"),
 };
 
 #define LN1_CLK(ID, NAME, REG) \
@@ -122,6 +119,24 @@ static const struct lochnagar_clk lochnagar2_clks[LOCHNAGAR_NUM_CLOCKS] = {
 	LN2_CLK(SOUNDCARD_MCLK, "ln-soundcard-mclk"),
 };
 
+struct lochnagar_config {
+	const struct clk_parent_data *parents;
+	int nparents;
+	const struct lochnagar_clk *clks;
+};
+
+static const struct lochnagar_config lochnagar1_conf = {
+	.parents = lochnagar1_clk_parents,
+	.nparents = ARRAY_SIZE(lochnagar1_clk_parents),
+	.clks = lochnagar1_clks,
+};
+
+static const struct lochnagar_config lochnagar2_conf = {
+	.parents = lochnagar2_clk_parents,
+	.nparents = ARRAY_SIZE(lochnagar2_clk_parents),
+	.clks = lochnagar2_clks,
+};
+
 static inline struct lochnagar_clk *lochnagar_hw_to_lclk(struct clk_hw *hw)
 {
 	return container_of(hw, struct lochnagar_clk, hw);
@@ -183,7 +198,7 @@ static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
 	if (ret < 0) {
 		dev_dbg(priv->dev, "Failed to read parent of %s: %d\n",
 			lclk->name, ret);
-		return priv->nparents;
+		return hw->init->num_parents;
 	}
 
 	val &= lclk->src_mask;
@@ -198,46 +213,6 @@ static const struct clk_ops lochnagar_clk_ops = {
 	.get_parent = lochnagar_clk_get_parent,
 };
 
-static int lochnagar_init_parents(struct lochnagar_clk_priv *priv)
-{
-	struct device_node *np = priv->dev->of_node;
-	int i, j;
-
-	switch (priv->type) {
-	case LOCHNAGAR1:
-		memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_clks));
-
-		priv->nparents = ARRAY_SIZE(lochnagar1_clk_parents);
-		priv->parents = devm_kmemdup(priv->dev, lochnagar1_clk_parents,
-					     sizeof(lochnagar1_clk_parents),
-					     GFP_KERNEL);
-		break;
-	case LOCHNAGAR2:
-		memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_clks));
-
-		priv->nparents = ARRAY_SIZE(lochnagar2_clk_parents);
-		priv->parents = devm_kmemdup(priv->dev, lochnagar2_clk_parents,
-					     sizeof(lochnagar2_clk_parents),
-					     GFP_KERNEL);
-		break;
-	default:
-		dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->type);
-		return -EINVAL;
-	}
-
-	if (!priv->parents)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->nparents; i++) {
-		j = of_property_match_string(np, "clock-names",
-					     priv->parents[i]);
-		if (j >= 0)
-			priv->parents[i] = of_clk_get_parent_name(np, j);
-	}
-
-	return 0;
-}
-
 static struct clk_hw *
 lochnagar_of_clk_hw_get(struct of_phandle_args *clkspec, void *data)
 {
@@ -252,16 +227,42 @@ lochnagar_of_clk_hw_get(struct of_phandle_args *clkspec, void *data)
 	return &priv->lclks[idx].hw;
 }
 
-static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
+static const struct of_device_id lochnagar_of_match[] = {
+	{ .compatible = "cirrus,lochnagar1-clk", .data = &lochnagar1_conf },
+	{ .compatible = "cirrus,lochnagar2-clk", .data = &lochnagar2_conf },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lochnagar_of_match);
+
+static int lochnagar_clk_probe(struct platform_device *pdev)
 {
 	struct clk_init_data clk_init = {
 		.ops = &lochnagar_clk_ops,
-		.parent_names = priv->parents,
-		.num_parents = priv->nparents,
 	};
+	struct device *dev = &pdev->dev;
+	struct lochnagar_clk_priv *priv;
+	const struct of_device_id *of_id;
 	struct lochnagar_clk *lclk;
+	struct lochnagar_config *conf;
 	int ret, i;
 
+	of_id = of_match_device(lochnagar_of_match, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	conf = (struct lochnagar_config *)of_id->data;
+
+	memcpy(priv->lclks, conf->clks, sizeof(priv->lclks));
+
+	clk_init.parent_data = conf->parents;
+	clk_init.num_parents = conf->nparents;
+
 	for (i = 0; i < ARRAY_SIZE(priv->lclks); i++) {
 		lclk = &priv->lclks[i];
 
@@ -273,55 +274,21 @@ static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
 		lclk->priv = priv;
 		lclk->hw.init = &clk_init;
 
-		ret = devm_clk_hw_register(priv->dev, &lclk->hw);
+		ret = devm_clk_hw_register(dev, &lclk->hw);
 		if (ret) {
-			dev_err(priv->dev, "Failed to register %s: %d\n",
+			dev_err(dev, "Failed to register %s: %d\n",
 				lclk->name, ret);
 			return ret;
 		}
 	}
 
-	ret = devm_of_clk_add_hw_provider(priv->dev, lochnagar_of_clk_hw_get,
-					  priv);
+	ret = devm_of_clk_add_hw_provider(dev, lochnagar_of_clk_hw_get, priv);
 	if (ret < 0)
-		dev_err(priv->dev, "Failed to register provider: %d\n", ret);
+		dev_err(dev, "Failed to register provider: %d\n", ret);
 
 	return ret;
 }
 
-static const struct of_device_id lochnagar_of_match[] = {
-	{ .compatible = "cirrus,lochnagar1-clk", .data = (void *)LOCHNAGAR1 },
-	{ .compatible = "cirrus,lochnagar2-clk", .data = (void *)LOCHNAGAR2 },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lochnagar_of_match);
-
-static int lochnagar_clk_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct lochnagar_clk_priv *priv;
-	const struct of_device_id *of_id;
-	int ret;
-
-	of_id = of_match_device(lochnagar_of_match, dev);
-	if (!of_id)
-		return -EINVAL;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->dev = dev;
-	priv->regmap = dev_get_regmap(dev->parent, NULL);
-	priv->type = (enum lochnagar_type)of_id->data;
-
-	ret = lochnagar_init_parents(priv);
-	if (ret)
-		return ret;
-
-	return lochnagar_init_clks(priv);
-}
-
 static struct platform_driver lochnagar_clk_driver = {
 	.driver = {
 		.name = "lochnagar-clk",
-- 
2.11.0


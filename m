Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8B353091B
	for <lists+linux-clk@lfdr.de>; Mon, 23 May 2022 08:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbiEWGBP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 May 2022 02:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbiEWGBL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 02:01:11 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E966268;
        Sun, 22 May 2022 23:01:07 -0700 (PDT)
X-UUID: a04852d424eb48338186470ab51b221e-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:5fbd7ae7-bb63-447a-b91d-5955857cfdf8,OB:10,L
        OB:30,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
        ACTION:release,TS:90
X-CID-INFO: VERSION:1.1.5,REQID:5fbd7ae7-bb63-447a-b91d-5955857cfdf8,OB:10,LOB
        :30,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
        ACTION:quarantine,TS:90
X-CID-META: VersionHash:2a19b09,CLOUDID:0c773e7a-5ef6-470b-96c9-bdb8ced32786,C
        OID:4bfce04ef61e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:0,BEC:nil
X-UUID: a04852d424eb48338186470ab51b221e-20220523
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 742368181; Mon, 23 May 2022 14:00:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 23 May 2022 14:00:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 14:00:57 +0800
From:   Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <p.zabel@pengutronix.de>,
        <angelogioacchino.delregno@collabora.com>,
        <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
        <wenst@chromium.org>, <runyang.chen@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH v8 03/19] clk: mediatek: reset: Refine and reorder functions in reset.c
Date:   Mon, 23 May 2022 14:00:40 +0800
Message-ID: <20220523060056.24396-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To make drivers more readable, we modify the indentation of the drivers
and reorder the location of functions.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/clk/mediatek/reset.c | 68 +++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 5191becb45dd..5cbbcc22a4fc 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -12,56 +12,59 @@
 
 #include "reset.h"
 
-static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static int mtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4);
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+	return regmap_update_bits(data->regmap,
+				  data->regofs + ((id / 32) << 2),
+				  BIT(id % 32), ~0);
 }
 
-static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
-	unsigned int reg = data->regofs + ((id / 32) << 4) + 0x4;
 
-	return regmap_write(data->regmap, reg, BIT(id % 32));
+	return regmap_update_bits(data->regmap,
+				  data->regofs + ((id / 32) << 2),
+				  BIT(id % 32), 0);
 }
 
-static int mtk_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int mtk_reset(struct reset_controller_dev *rcdev, unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	int ret;
+
+	ret = mtk_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(data->regmap, data->regofs + ((id / 32) << 2),
-			BIT(id % 32), ~0);
+	return mtk_reset_deassert(rcdev, id);
 }
 
-static int mtk_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
+static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
+				    unsigned long id)
 {
 	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 
-	return regmap_update_bits(data->regmap, data->regofs + ((id / 32) << 2),
-			BIT(id % 32), 0);
+	return regmap_write(data->regmap,
+			    data->regofs + ((id / 32) << 4),
+			    BIT(id % 32));
 }
 
-static int mtk_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int mtk_reset_deassert_set_clr(struct reset_controller_dev *rcdev,
+				      unsigned long id)
 {
-	int ret;
-
-	ret = mtk_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
+	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
 
-	return mtk_reset_deassert(rcdev, id);
+	return regmap_write(data->regmap,
+			    data->regofs + ((id / 32) << 4) + 0x4,
+			    BIT(id % 32));
 }
 
 static int mtk_reset_set_clr(struct reset_controller_dev *rcdev,
-	unsigned long id)
+			     unsigned long id)
 {
 	int ret;
 
@@ -84,8 +87,9 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 };
 
 static void mtk_register_reset_controller_common(struct device_node *np,
-			unsigned int num_regs, int regofs,
-			const struct reset_control_ops *reset_ops)
+						 unsigned int num_regs,
+						 int regofs,
+						 const struct reset_control_ops *reset_ops)
 {
 	struct mtk_reset *data;
 	int ret;
@@ -117,17 +121,17 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 }
 
 void mtk_register_reset_controller(struct device_node *np,
-	unsigned int num_regs, int regofs)
+				   unsigned int num_regs, int regofs)
 {
 	mtk_register_reset_controller_common(np, num_regs, regofs,
-		&mtk_reset_ops);
+					     &mtk_reset_ops);
 }
 
 void mtk_register_reset_controller_set_clr(struct device_node *np,
-	unsigned int num_regs, int regofs)
+					   unsigned int num_regs, int regofs)
 {
 	mtk_register_reset_controller_common(np, num_regs, regofs,
-		&mtk_reset_ops_set_clr);
+					     &mtk_reset_ops_set_clr);
 }
 
 MODULE_LICENSE("GPL");
-- 
2.18.0


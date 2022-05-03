Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D18051812F
	for <lists+linux-clk@lfdr.de>; Tue,  3 May 2022 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbiECJmj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 May 2022 05:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiECJmi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 05:42:38 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567073204F;
        Tue,  3 May 2022 02:39:06 -0700 (PDT)
X-UUID: b99c9427145142f4a2692491e29ccd9e-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:d72d29ad-f162-4943-b0cb-c23157fe675f,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:-20
X-CID-META: VersionHash:faefae9,CLOUDID:1af44fc7-85ee-4ac1-ac05-bd3f1e72e732,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b99c9427145142f4a2692491e29ccd9e-20220503
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1410338127; Tue, 03 May 2022 17:38:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 3 May 2022 17:38:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 May 2022 17:38:58 +0800
From:   Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <p.zabel@pengutronix.de>,
        <angelogioacchino.delregno@collabora.com>,
        <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
        <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH v6 01/16] clk: mediatek: reset: Add reset.h
Date:   Tue, 3 May 2022 17:38:41 +0800
Message-ID: <20220503093856.22250-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a new file "reset.h" to place some definitions for clock reset.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h |  8 ++------
 drivers/clk/mediatek/reset.c   |  9 +--------
 drivers/clk/mediatek/reset.h   | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf6565aa7319..a6d0f24c62fa 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -13,6 +13,8 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "reset.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -190,12 +192,6 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data);
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
-void mtk_register_reset_controller(struct device_node *np,
-			unsigned int num_regs, int regofs);
-
-void mtk_register_reset_controller_set_clr(struct device_node *np,
-	unsigned int num_regs, int regofs);
-
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index bcec4b89f449..9f3cb22aea1b 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -8,16 +8,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
-#include "clk-mtk.h"
-
-struct mtk_reset {
-	struct regmap *regmap;
-	int regofs;
-	struct reset_controller_dev rcdev;
-};
+#include "reset.h"
 
 static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
 	unsigned long id)
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
new file mode 100644
index 000000000000..764a8affe206
--- /dev/null
+++ b/drivers/clk/mediatek/reset.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __DRV_CLK_MTK_RESET_H
+#define __DRV_CLK_MTK_RESET_H
+
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+struct mtk_reset {
+	struct regmap *regmap;
+	int regofs;
+	struct reset_controller_dev rcdev;
+};
+
+void mtk_register_reset_controller(struct device_node *np,
+				   unsigned int num_regs, int regofs);
+
+void mtk_register_reset_controller_set_clr(struct device_node *np,
+					   unsigned int num_regs, int regofs);
+
+#endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.18.0


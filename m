Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFD8530934
	for <lists+linux-clk@lfdr.de>; Mon, 23 May 2022 08:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbiEWGBh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 May 2022 02:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiEWGBO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 02:01:14 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA650C3A;
        Sun, 22 May 2022 23:01:09 -0700 (PDT)
X-UUID: 52e779a7691c467b9bffbf1626e3d83b-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:53a471f5-18df-4600-99cb-820d91c75676,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:147b2ee3-edbf-4bd4-8a34-dfc5f7bb086d,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:0,BEC:nil
X-UUID: 52e779a7691c467b9bffbf1626e3d83b-20220523
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <rex-bc.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 722739593; Mon, 23 May 2022 14:00:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 May 2022 14:00:57 +0800
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
Subject: [PATCH v8 01/19] clk: mediatek: reset: Add reset.h
Date:   Mon, 23 May 2022 14:00:38 +0800
Message-ID: <20220523060056.24396-2-rex-bc.chen@mediatek.com>
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

Add a new file "reset.h" to place some definitions for clock reset.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h |  8 ++------
 drivers/clk/mediatek/reset.c   |  9 +--------
 drivers/clk/mediatek/reset.h   | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index adb1304d35d4..6ed0c745cae2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -13,6 +13,8 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "reset.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -187,12 +189,6 @@ void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
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


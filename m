Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041484E9759
	for <lists+linux-clk@lfdr.de>; Mon, 28 Mar 2022 15:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242865AbiC1NHk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Mar 2022 09:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242840AbiC1NHh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Mar 2022 09:07:37 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1AD5DA25;
        Mon, 28 Mar 2022 06:05:48 -0700 (PDT)
X-UUID: 4b588d0fc6dc470d9519094883afdadd-20220328
X-UUID: 4b588d0fc6dc470d9519094883afdadd-20220328
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1005806579; Mon, 28 Mar 2022 21:05:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Mar 2022 21:05:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 21:05:42 +0800
From:   Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 06/15] clk: mediatek: Add MT8186 imp i2c wrapper clock support
Date:   Mon, 28 Mar 2022 21:05:12 +0800
Message-ID: <20220328130521.24385-7-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
References: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
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

Add MT8186 imp i2c wrapper clock controllers which provide clock gate
control in i2c IP blocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile                 |  2 +-
 .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 54ef957389ef..3510e8a0ecac 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -72,7 +72,7 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
-				   clk-mt8186-apmixedsys.o
+				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
new file mode 100644
index 000000000000..47f2e480a05e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt8186-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C0,
+		"imp_iic_wrap_ap_clock_i2c0", "infra_ao_i2c_ap", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C1,
+		"imp_iic_wrap_ap_clock_i2c1", "infra_ao_i2c_ap", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C2,
+		"imp_iic_wrap_ap_clock_i2c2", "infra_ao_i2c_ap", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C3,
+		"imp_iic_wrap_ap_clock_i2c3", "infra_ao_i2c_ap", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C4,
+		"imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c_ap", 4),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5,
+		"imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c_ap", 5),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C6,
+		"imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c_ap", 6),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C7,
+		"imp_iic_wrap_ap_clock_i2c7", "infra_ao_i2c_ap", 7),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C8,
+		"imp_iic_wrap_ap_clock_i2c8", "infra_ao_i2c_ap", 8),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C9,
+		"imp_iic_wrap_ap_clock_i2c9", "infra_ao_i2c_ap", 9),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_desc = {
+	.clks = imp_iic_wrap_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_imp_iic_wrap[] = {
+	{
+		.compatible = "mediatek,mt8186-imp_iic_wrap",
+		.data = &imp_iic_wrap_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8186_imp_iic_wrap,
+	},
+};
+builtin_platform_driver(clk_mt8186_imp_iic_wrap_drv);
-- 
2.18.0


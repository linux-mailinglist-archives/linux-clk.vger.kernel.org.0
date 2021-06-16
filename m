Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8833A8DA4
	for <lists+linux-clk@lfdr.de>; Wed, 16 Jun 2021 02:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhFPAlD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Jun 2021 20:41:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54650 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231851AbhFPAlC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jun 2021 20:41:02 -0400
X-UUID: 3f8c7f7913084b4783112d042b9210c9-20210616
X-UUID: 3f8c7f7913084b4783112d042b9210c9-20210616
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2066894926; Wed, 16 Jun 2021 08:38:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 08:38:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 08:38:54 +0800
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
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v10 10/19] clk: mediatek: Add MT8192 imgsys clock support
Date:   Wed, 16 Jun 2021 08:36:34 +0800
Message-ID: <20210616003643.28648-11-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MT8192 imgsys and imgsys2 clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 +++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-img.c | 70 +++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index a39a4c201c9e..38011dccfe47 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -520,6 +520,12 @@ config COMMON_CLK_MT8192_CAMSYS
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
+config COMMON_CLK_MT8192_IMGSYS
+	bool "Clock driver for MediaTek MT8192 imgsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 94bf7a03fd88..91392cb333fd 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -70,5 +70,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
new file mode 100644
index 000000000000..7ce3abe42577
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img_clks[] = {
+	GATE_IMG(CLK_IMG_LARB9, "img_larb9", "img1_sel", 0),
+	GATE_IMG(CLK_IMG_LARB10, "img_larb10", "img1_sel", 1),
+	GATE_IMG(CLK_IMG_DIP, "img_dip", "img1_sel", 2),
+	GATE_IMG(CLK_IMG_GALS, "img_gals", "img1_sel", 12),
+};
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG(CLK_IMG2_LARB11, "img2_larb11", "img1_sel", 0),
+	GATE_IMG(CLK_IMG2_LARB12, "img2_larb12", "img1_sel", 1),
+	GATE_IMG(CLK_IMG2_MFB, "img2_mfb", "img1_sel", 6),
+	GATE_IMG(CLK_IMG2_WPE, "img2_wpe", "img1_sel", 7),
+	GATE_IMG(CLK_IMG2_MSS, "img2_mss", "img1_sel", 8),
+	GATE_IMG(CLK_IMG2_GALS, "img2_gals", "img1_sel", 12),
+};
+
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
+};
+
+static const struct mtk_clk_desc img2_desc = {
+	.clks = img2_clks,
+	.num_clks = ARRAY_SIZE(img2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_img[] = {
+	{
+		.compatible = "mediatek,mt8192-imgsys",
+		.data = &img_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imgsys2",
+		.data = &img2_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_img_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-img",
+		.of_match_table = of_match_clk_mt8192_img,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img_drv);
-- 
2.18.0


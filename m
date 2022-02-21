Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE84BD350
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 03:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245573AbiBUB7k (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Feb 2022 20:59:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245585AbiBUB7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 20:59:35 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F4517EA;
        Sun, 20 Feb 2022 17:59:12 -0800 (PST)
X-UUID: b5bd97ddd8ac4b308aa935504c48c64f-20220221
X-UUID: b5bd97ddd8ac4b308aa935504c48c64f-20220221
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1429644591; Mon, 21 Feb 2022 09:59:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 21 Feb 2022 09:59:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 09:59:06 +0800
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
Subject: [PATCH v2 05/15] clk: mediatek: Add MT8186 apmixedsys clock support
Date:   Mon, 21 Feb 2022 09:52:48 +0800
Message-ID: <20220221015258.913-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
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

Add MT8186 apmixedsys clock controller which provides Plls
generated from SoC.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile                |   3 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 133 +++++++++++++++++++
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-apmixedsys.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 657d43e33d3c..54ef957389ef 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -71,7 +71,8 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
-obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
+				   clk-mt8186-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
new file mode 100644
index 000000000000..f07d464f908b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+#include <dt-bindings/clock/mt8186-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#define MT8186_PLL_FMAX		(3800UL * MHZ)
+#define MT8186_PLL_FMIN		(1500UL * MHZ)
+#define MT8186_INTEGER_BITS	(8)
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+	    _rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,		\
+	    _tuner_reg, _tuner_en_reg, _tuner_en_bit,			\
+	    _pcw_reg) {							\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8186_PLL_FMAX,				\
+		.fmin = MT8186_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8186_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = 0,						\
+		.pcw_chg_reg = 0,					\
+		.en_reg = 0,						\
+		.pll_en_bit = 0,					\
+	}
+
+static const struct mtk_pll_data plls[] = {
+	/*
+	 * armpll_ll/armpll_bl/ccipll are main clock source of AP MCU,
+	 * should not be closed in Linux world.
+	 */
+	PLL(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0204, 0x0210, 0,
+	    PLL_AO, 0, 22, 0x0208, 24, 0, 0, 0, 0x0208),
+	PLL(CLK_APMIXED_ARMPLL_BL, "armpll_bl", 0x0214, 0x0220, 0,
+	    PLL_AO, 0, 22, 0x0218, 24, 0, 0, 0, 0x0218),
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0224, 0x0230, 0,
+	    PLL_AO, 0, 22, 0x0228, 24, 0, 0, 0, 0x0228),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0244, 0x0250, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0248, 24, 0, 0, 0, 0x0248),
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0324, 0x0330, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0328, 24, 0, 0, 0, 0x0328),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x038C, 0x0398, 0,
+	    0, 0, 22, 0x0390, 24, 0, 0, 0, 0x0390),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0254, 0x0260, 0,
+	    0, 0, 22, 0x0258, 24, 0, 0, 0, 0x0258),
+	PLL(CLK_APMIXED_NNAPLL, "nnapll", 0x035C, 0x0368, 0,
+	    0, 0, 22, 0x0360, 24, 0, 0, 0, 0x0360),
+	PLL(CLK_APMIXED_NNA2PLL, "nna2pll", 0x036C, 0x0378, 0,
+	    0, 0, 22, 0x0370, 24, 0, 0, 0, 0x0370),
+	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x0304, 0x0310, 0,
+	    0, 0, 22, 0x0308, 24, 0, 0, 0, 0x0308),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0314, 0x0320, 0,
+	    0, 0, 22, 0x0318, 24, 0, 0, 0, 0x0318),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0264, 0x0270, 0,
+	    0, 0, 22, 0x0268, 24, 0, 0, 0, 0x0268),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0334, 0x0344, 0,
+	    0, 0, 32, 0x0338, 24, 0x0040, 0x000C, 0, 0x033C),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x0348, 0x0358, 0,
+	    0, 0, 32, 0x034C, 24, 0x0044, 0x000C, 5, 0x0350),
+};
+
+static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
+	{ .compatible = "mediatek,mt8186-apmixedsys", },
+	{}
+};
+
+static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (r)
+		goto free_apmixed_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+free_apmixed_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8186_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8186_apmixed_drv = {
+	.probe = clk_mt8186_apmixed_probe,
+	.remove = clk_mt8186_apmixed_remove,
+	.driver = {
+		.name = "clk-mt8186-apmixed",
+		.of_match_table = of_match_clk_mt8186_apmixed,
+	},
+};
+builtin_platform_driver(clk_mt8186_apmixed_drv);
-- 
2.18.0


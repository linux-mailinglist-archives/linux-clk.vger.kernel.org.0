Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C368632214
	for <lists+linux-clk@lfdr.de>; Mon, 21 Nov 2022 13:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiKUMbD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Nov 2022 07:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiKUMad (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 07:30:33 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7724B9485;
        Mon, 21 Nov 2022 04:30:07 -0800 (PST)
X-UUID: eb55e8d58d604b13b7cc33d3d373cdae-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gTtUIHM+yMWM9LPe/UtrJXEKtn+YXpU7xOJr9fdwsS8=;
        b=MblAdXpzEz+o3DevoKQ+/DR1DmvOFEobhNJD7UvvjeCuqyWiOM/w4qzYljRjD6k1HB1nHnsfeGEKUkgN3Vz8YZn8W0EY5R7650rczg0Wac3b1hGcM/cCnk6+GoDTN+BI+8cFRLWAs/zzctrAjOtbcfNhYxPlIrdqc8muMl/wr+8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:9e568147-be29-40a4-bf18-4aac92b5a840,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:dc1f622f-2938-482e-aafd-98d66723b8a9,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eb55e8d58d604b13b7cc33d3d373cdae-20221121
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <johnson.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 534156600; Mon, 21 Nov 2022 20:30:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 20:29:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 21 Nov 2022 20:29:59 +0800
From:   Johnson Wang <johnson.wang@mediatek.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [PATCH v5 4/4] clk: mediatek: Change PLL register API for MT8186
Date:   Mon, 21 Nov 2022 20:29:57 +0800
Message-ID: <20221121122957.21611-5-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221121122957.21611-1-johnson.wang@mediatek.com>
References: <20221121122957.21611-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use mtk_clk_register_pllfhs() to enhance frequency hopping and
spread spectrum clocking control for MT8186.

Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig                 |  1 +
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 66 +++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 38f667eadda3..22e8e79475ee 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -560,6 +560,7 @@ config COMMON_CLK_MT8186
 	bool "Clock driver for MediaTek MT8186"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8186 clocks.
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index e692a2a67ce1..1d673c6278a9 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -9,6 +9,7 @@
 
 #include "clk-mtk.h"
 #include "clk-pll.h"
+#include "clk-pllfh.h"
 
 #define MT8186_PLL_FMAX		(3800UL * MHZ)
 #define MT8186_PLL_FMIN		(1500UL * MHZ)
@@ -76,6 +77,59 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 0x034C, 24, 0x0044, 0x000C, 5, 0x0350),
 };
 
+enum fh_pll_id {
+	FH_ARMPLL_LL,
+	FH_ARMPLL_BL,
+	FH_CCIPLL,
+	FH_MAINPLL,
+	FH_MMPLL,
+	FH_TVDPLL,
+	FH_RESERVE6,
+	FH_ADSPPLL,
+	FH_MFGPLL,
+	FH_NNAPLL,
+	FH_NNA2PLL,
+	FH_MSDCPLL,
+	FH_RESERVE12,
+	FH_NR_FH,
+};
+
+#define FH(_pllid, _fhid, _offset) {					\
+		.data = {						\
+			.pll_id = _pllid,				\
+			.fh_id = _fhid,					\
+			.fhx_offset = _offset,				\
+			.dds_mask = GENMASK(21, 0),			\
+			.slope0_value = 0x6003c97,			\
+			.slope1_value = 0x6003c97,			\
+			.sfstrx_en = BIT(2),				\
+			.frddsx_en = BIT(1),				\
+			.fhctlx_en = BIT(0),				\
+			.tgl_org = BIT(31),				\
+			.dvfs_tri = BIT(31),				\
+			.pcwchg = BIT(31),				\
+			.dt_val = 0x0,					\
+			.df_val = 0x9,					\
+			.updnlmt_shft = 16,				\
+			.msk_frddsx_dys = GENMASK(23, 20),		\
+			.msk_frddsx_dts = GENMASK(19, 16),		\
+		},							\
+	}
+
+static struct mtk_pllfh_data pllfhs[] = {
+	FH(CLK_APMIXED_ARMPLL_LL, FH_ARMPLL_LL, 0x003C),
+	FH(CLK_APMIXED_ARMPLL_BL, FH_ARMPLL_BL, 0x0050),
+	FH(CLK_APMIXED_CCIPLL, FH_CCIPLL, 0x0064),
+	FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x0078),
+	FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0x008C),
+	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x00A0),
+	FH(CLK_APMIXED_ADSPPLL, FH_ADSPPLL, 0x00C8),
+	FH(CLK_APMIXED_MFGPLL, FH_MFGPLL, 0x00DC),
+	FH(CLK_APMIXED_NNAPLL, FH_NNAPLL, 0x00F0),
+	FH(CLK_APMIXED_NNA2PLL, FH_NNA2PLL, 0x0104),
+	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x0118),
+};
+
 static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
 	{ .compatible = "mediatek,mt8186-apmixedsys", },
 	{}
@@ -85,13 +139,17 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	const u8 *fhctl_node = "mediatek,mt8186-fhctl";
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
+
+	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
 
@@ -104,7 +162,8 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 	return r;
 
 unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 free_apmixed_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -116,7 +175,8 @@ static int clk_mt8186_apmixed_remove(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 	mtk_free_clk_data(clk_data);
 
 	return 0;
-- 
2.18.0


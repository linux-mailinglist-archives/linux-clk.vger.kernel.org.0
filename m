Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE6467C64B
	for <lists+linux-clk@lfdr.de>; Thu, 26 Jan 2023 09:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbjAZIxp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 26 Jan 2023 03:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236503AbjAZIxo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 03:53:44 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C251B6C106;
        Thu, 26 Jan 2023 00:53:30 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A56366602E72;
        Thu, 26 Jan 2023 08:53:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674723209;
        bh=hsRKdUlhnDLJbGIwsqwoaTUXgSw/PcP7XnAaJTpL7Eg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CuYI151MO1smp+eUtdrdF+nRp1BgPGBInO/mTfF/DmSHItqMT2y4aE0rL1D3sYfJG
         C6duC1UFYYOAhc1/NISGJvU5Z1fLLINOQUihZZ3jbHNW8dxibqbYtwpR5xdhRn1yLY
         M9BCZeimmD3bRG/EvTlYsRSfNNg17TMWRonSjUMtvsyYczvuSRllfjNh3mup7yUKcz
         k8mJseD8CMZIPD1lwwNHvVH3dkRoJxC/rmDmUKZu3P8E7aL46vTAAvzHKGBt6iFUBq
         Ifr7kDX/daaXVuPK6rZbQPkIzZHlskS0NKlzslOd9N1qI8sFycOPRWlWNgt7ccVZPy
         Up6xXLxn2XTlQ==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com,
        wenst@chromium.org, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
        jose.exposito89@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v2 3/6] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
Date:   Thu, 26 Jan 2023 09:53:18 +0100
Message-Id: <20230126085321.87267-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
References: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add FHCTL parameters and register PLLs through FHCTL to add support
for frequency hopping and SSC. FHCTL will be enabled only on PLLs
specified in devicetree.

This commit brings functional changes only upon addition of
devicetree configuration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 63 +++++++++++++++++++-
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 59761c72d3bc..03fa30527868 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -7,8 +7,10 @@
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include "clk-fhctl.h"
 #include "clk-mtk.h"
 #include "clk-pll.h"
+#include "clk-pllfh.h"
 
 #define REG_REF2USB		0x8
 #define REG_AP_PLL_CON7		0x1c
@@ -58,6 +60,56 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", 0x2b4, 0x2c4, 0, 0, 31, 0x2b4, 4, 0x2bc, 0x2b8, 0),
 };
 
+enum fh_pll_id {
+	FH_CA53PLL_LL,
+	FH_CA53PLL_BL,
+	FH_MAINPLL,
+	FH_MPLL,
+	FH_MSDCPLL,
+	FH_MMPLL,
+	FH_VENCPLL,
+	FH_TVDPLL,
+	FH_VCODECPLL,
+	FH_NR_FH,
+};
+
+#define _FH(_pllid, _fhid, _slope, _offset) {				\
+		.data = {						\
+			.pll_id = _pllid,				\
+			.fh_id = _fhid,					\
+			.fh_ver = FHCTL_PLLFH_V1,			\
+			.fhx_offset = _offset,				\
+			.dds_mask = GENMASK(21, 0),			\
+			.slope0_value = _slope,				\
+			.slope1_value = _slope,				\
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
+#define FH(_pllid, _fhid, _offset)	_FH(_pllid, _fhid, 0x6003c97, _offset)
+#define FH_M(_pllid, _fhid, _offset)	_FH(_pllid, _fhid, 0x6000140, _offset)
+
+static struct mtk_pllfh_data pllfhs[] = {
+	FH(CLK_APMIXED_ARMCA53PLL, FH_CA53PLL_BL, 0x38),
+	FH(CLK_APMIXED_MAINPLL, FH_MAINPLL, 0x60),
+	FH_M(CLK_APMIXED_MPLL, FH_MPLL, 0x74),
+	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x88),
+	FH(CLK_APMIXED_MMPLL, FH_MMPLL, 0x9c),
+	FH(CLK_APMIXED_VENCPLL, FH_VENCPLL, 0xb0),
+	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0xc4),
+	FH(CLK_APMIXED_VCODECPLL, FH_VCODECPLL, 0xd8),
+};
+
 static void clk_mt6795_apmixed_setup_md1(void __iomem *base)
 {
 	void __iomem *reg = base + REG_AP_PLL_CON7;
@@ -85,6 +137,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	const u8 *fhctl_node = "mediatek,mt6795-fhctl";
 	void __iomem *base;
 	struct clk_hw *hw;
 	int ret;
@@ -97,7 +150,9 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
+	ret = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+				      pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (ret)
 		goto free_clk_data;
 
@@ -124,7 +179,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 unregister_ref2usb:
 	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
 unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return ret;
@@ -137,7 +193,8 @@ static int clk_mt6795_apmixed_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(node);
 	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
+				  ARRAY_SIZE(pllfhs), clk_data);
 	mtk_free_clk_data(clk_data);
 
 	return 0;
-- 
2.39.0


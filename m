Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9656C69DFAC
	for <lists+linux-clk@lfdr.de>; Tue, 21 Feb 2023 12:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjBUL6m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Feb 2023 06:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbjBUL6W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 06:58:22 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5078D1714;
        Tue, 21 Feb 2023 03:57:48 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F276A66021D8;
        Tue, 21 Feb 2023 11:56:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676980591;
        bh=hWZRDGal3GNmdFtLS5t4q03/QmGR1D89Es46OeyDZNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FPLBzLKZsu5eOsh71IrnMbFEM1apZRIDua9LJF1zo/quzTmH+GniniteupIZXOhNP
         Qry9z9By+DesgSgpFG1gfw4oVOeWMsTp1zTh03yWtffJ0B8dmL/kkhlNfD7j1g5dCG
         8rGOHZ5+yyxn+mRYf09RLfWSNqN+291YiHXiS8DzAAeA5ulmByv1BhiWREaoppSrNW
         XhrIgibVikyjcIzuFFRp0Y5wdTGtrTSGiimw2YWoUDSe92k+HQNPsIePQSmIuq6Kro
         4RDK8iNkMwSEqBzI3oM6/2aXYQtNCEWpFs/88Bm1dXfM23w6FvaFEbKHPs2e7lIdG2
         w4q3DWQ19evpQ==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v4 27/54] clk: mediatek: mt7622: Convert to platform driver and simple probe
Date:   Tue, 21 Feb 2023 12:55:22 +0100
Message-Id: <20230221115549.360132-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
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

Convert the MT7622 topckgen and pericfg clock drivers to platform
drivers and use the simple probe mechanism. This also allows to
build these clocks as modules.

Thanks to the conversion, more error handling was added to the clocks
registration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt7622.c | 125 ++++++++----------------------
 1 file changed, 31 insertions(+), 94 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index fb813f8d3a7d..7a002b73fcaa 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -490,107 +490,44 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs),
-				 clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt7622_clk_lock, clk_data);
-
-	mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				  base, &mt7622_clk_lock, clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static int mtk_pericfg_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, peri_muxes,
-				    ARRAY_SIZE(peri_muxes), base,
-				    &mt7622_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return 0;
-}
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt7622_clk_lock,
+};
+
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.composite_clks = peri_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_muxes),
+	.rst_desc = &clk_rst_desc,
+	.clk_lock = &mt7622_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt7622[] = {
-	{
-		.compatible = "mediatek,mt7622-topckgen",
-		.data = mtk_topckgen_init,
-	}, {
-		.compatible = "mediatek,mt7622-pericfg",
-		.data = mtk_pericfg_init,
-	}, {
-		/* sentinel */
-	}
-};
-
-static int clk_mt7622_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+	{ .compatible = "mediatek,mt7622-topckgen", .data = &topck_desc },
+	{ .compatible = "mediatek,mt7622-pericfg", .data = &peri_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt7622_drv = {
-	.probe = clk_mt7622_probe,
 	.driver = {
 		.name = "clk-mt7622",
 		.of_match_table = of_match_clk_mt7622,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
+module_platform_driver(clk_mt7622_drv)
 
-static int clk_mt7622_init(void)
-{
-	return platform_driver_register(&clk_mt7622_drv);
-}
-
-arch_initcall(clk_mt7622_init);
+MODULE_DESCRIPTION("MediaTek MT7622 clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1


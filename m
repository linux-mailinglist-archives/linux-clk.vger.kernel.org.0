Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FD26750DF
	for <lists+linux-clk@lfdr.de>; Fri, 20 Jan 2023 10:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjATJXG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Jan 2023 04:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjATJWU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 04:22:20 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FCA9D2AE;
        Fri, 20 Jan 2023 01:21:41 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E63B26602E0F;
        Fri, 20 Jan 2023 09:21:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674206486;
        bh=SXiLONoRIH0CB+iFY3cC1DgibyfjwwOez/ev+oSe93E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ski2YIcf8Q0tsid4gXDiwYPqetdtqgVsxdU7SMttmHBFSiDQMEzkIcx/yMv9gaV96
         tVYkThNmgYviwNjgjtdB8k0oOrSDFfhsRYUGU7+6WJrmRooihg4Os3mbXYGcjZh2eP
         NKgJ217D2AeJCIguGDeJso77MLfUODyF6fTN9SZLG/MOHTb+jk89h53qfpfkJChSnp
         UAFVmLY9BV+Lue/AE1kzOFCGRUCapH2ziTre1xRudigB29CCOXCrL+5WLQ4scQXblh
         FRMjQrn5/lJP2Q1wXyWj4aq9EWc/JysrkUsfxKsAY1NRioIHJtNjRoM+qM5+RWzAnh
         9qeVbHrQHLG7g==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v4 16/23] clk: mediatek: mt8186: Join top_adj_div and top_muxes
Date:   Fri, 20 Jan 2023 10:20:46 +0100
Message-Id: <20230120092053.182923-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
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

Like done for MT8192, join the two to register them in one shot, as
there's no point in doing that separately from one another.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index 3ce2818dcbdd..c1107b2b614c 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -669,9 +669,6 @@ static struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x0320, 19, 1),
 	MUX(CLK_TOP_APLL_TDMOUT_MCK_SEL, "apll_tdmout_mck_sel", apll_mck_parents,
 		0x0320, 20, 1),
-};
-
-static const struct mtk_composite top_adj_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
 			0x0320, 0, 0x0328, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
@@ -749,27 +746,19 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_muxes;
 
-	r = mtk_clk_register_composites(&pdev->dev, top_adj_divs,
-					ARRAY_SIZE(top_adj_divs), base,
-					&mt8186_clk_lock, clk_data);
-	if (r)
-		goto unregister_composite_muxes;
-
 	r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
 					    clk_data->hws[CLK_TOP_MFG]->clk);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
-unregister_composite_divs:
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
 unregister_composite_muxes:
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 unregister_muxes:
@@ -789,7 +778,6 @@ static int clk_mt8186_topck_remove(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
 	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-- 
2.39.0


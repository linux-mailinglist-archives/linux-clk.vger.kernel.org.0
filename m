Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E3B6964EE
	for <lists+linux-clk@lfdr.de>; Tue, 14 Feb 2023 14:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbjBNNmH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Feb 2023 08:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjBNNl4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 08:41:56 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B40279AD;
        Tue, 14 Feb 2023 05:41:51 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 05B276602171;
        Tue, 14 Feb 2023 13:41:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676382110;
        bh=q5zJyagO6AeWtRSKKswL/pqMWZmTofXZr4jnHJ4C2l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hN+TbEmvfLJKusbQWZhOfDye2jF5qf5Kvpn65iPpa3fMFXKfRogKZIau1FRL/XC7q
         VhHC0v5D/+kEQx2bDw0vBdtwtfRqv4H08CJ6NxBV6d/FewzpqiNKy/zWkRY/gKquTI
         d4/XvoVxrG8kQk1YxuPNGgfPufAg2xM+RdLSnzzvcws1LccNfZ6I43yAQ2l+ASaqLT
         Xq8WwVjaEhpmBS0s3OQ7q1BnP7L9azDzxNe/bkHxa9x0QHxqGzS+f0MpmTMPbYRbg9
         4DR1bZ9RLG7k3oxf4BWHEqHjxtD1rrhCw4cavs049o6oMzhdWCPEmz0aoVzADoxx8z
         CGphTw1AnFlUg==
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v2 06/47] clk: mediatek: mt2712: Compress clock arrays entries to 90 columns
Date:   Tue, 14 Feb 2023 14:40:46 +0100
Message-Id: <20230214134127.59273-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
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

Compress the clock arrays entries to allow a maximum of 90 columns:
this greatly increases readability and also generously reduces the
amount of lines.
While at it, also fix some indentation here and there.

This is a cosmetic change. No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2712.c | 681 +++++++++++-------------------
 1 file changed, 246 insertions(+), 435 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index db20c46e088b..ce28ee47f5cf 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -37,184 +37,95 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-	FACTOR(CLK_TOP_SYS_26M, "sys_26m", "clk26m", 1,
-		1),
-	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "sys_26m", 1,
-		2),
-	FACTOR(CLK_TOP_ARMCA35PLL, "armca35pll_ck", "armca35pll", 1,
-		1),
-	FACTOR(CLK_TOP_ARMCA35PLL_600M, "armca35pll_600m", "armca35pll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_ARMCA35PLL_400M, "armca35pll_400m", "armca35pll_ck", 1,
-		3),
-	FACTOR(CLK_TOP_ARMCA72PLL, "armca72pll_ck", "armca72pll", 1,
-		1),
-	FACTOR(CLK_TOP_SYSPLL, "syspll_ck", "mainpll", 1,
-		1),
-	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll_d2", 1,
-		2),
-	FACTOR(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "syspll_d2", 1,
-		4),
-	FACTOR(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "syspll_d2", 1,
-		8),
-	FACTOR(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "syspll_d2", 1,
-		16),
-	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "syspll_ck", 1,
-		3),
-	FACTOR(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "syspll_d3", 1,
-		2),
-	FACTOR(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "syspll_d3", 1,
-		4),
-	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "syspll_ck", 1,
-		5),
-	FACTOR(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "syspll_d5", 1,
-		2),
-	FACTOR(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "syspll_d5", 1,
-		4),
-	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "syspll_ck", 1,
-		7),
-	FACTOR(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "syspll_d7", 1,
-		2),
-	FACTOR(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "syspll_d7", 1,
-		4),
-	FACTOR(CLK_TOP_UNIVPLL, "univpll_ck", "univpll", 1,
-		1),
-	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll_ck", 1,
-		7),
-	FACTOR(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univpll_ck", 1,
-		26),
-	FACTOR(CLK_TOP_UNIVPLL_D52, "univpll_d52", "univpll_ck", 1,
-		52),
-	FACTOR(CLK_TOP_UNIVPLL_D104, "univpll_d104", "univpll_ck", 1,
-		104),
-	FACTOR(CLK_TOP_UNIVPLL_D208, "univpll_d208", "univpll_ck", 1,
-		208),
-	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univpll_d2", 1,
-		2),
-	FACTOR(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univpll_d2", 1,
-		4),
-	FACTOR(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univpll_d2", 1,
-		8),
-	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll_ck", 1,
-		3),
-	FACTOR(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univpll_d3", 1,
-		2),
-	FACTOR(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univpll_d3", 1,
-		4),
-	FACTOR(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univpll_d3", 1,
-		8),
-	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll_ck", 1,
-		5),
-	FACTOR(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univpll_d5", 1,
-		2),
-	FACTOR(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univpll_d5", 1,
-		4),
-	FACTOR(CLK_TOP_UNIVPLL3_D8, "univpll3_d8", "univpll_d5", 1,
-		8),
-	FACTOR(CLK_TOP_F_MP0_PLL1, "f_mp0_pll1_ck", "univpll_d2", 1,
-		1),
-	FACTOR(CLK_TOP_F_MP0_PLL2, "f_mp0_pll2_ck", "univpll1_d2", 1,
-		1),
-	FACTOR(CLK_TOP_F_BIG_PLL1, "f_big_pll1_ck", "univpll_d2", 1,
-		1),
-	FACTOR(CLK_TOP_F_BIG_PLL2, "f_big_pll2_ck", "univpll1_d2", 1,
-		1),
-	FACTOR(CLK_TOP_F_BUS_PLL1, "f_bus_pll1_ck", "univpll_d2", 1,
-		1),
-	FACTOR(CLK_TOP_F_BUS_PLL2, "f_bus_pll2_ck", "univpll1_d2", 1,
-		1),
-	FACTOR(CLK_TOP_APLL1, "apll1_ck", "apll1", 1,
-		1),
-	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1_ck", 1,
-		2),
-	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1_ck", 1,
-		4),
-	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1_ck", 1,
-		8),
-	FACTOR(CLK_TOP_APLL1_D16, "apll1_d16", "apll1_ck", 1,
-		16),
-	FACTOR(CLK_TOP_APLL2, "apll2_ck", "apll2", 1,
-		1),
-	FACTOR(CLK_TOP_APLL2_D2, "apll2_d2", "apll2_ck", 1,
-		2),
-	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2_ck", 1,
-		4),
-	FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "apll2_ck", 1,
-		8),
-	FACTOR(CLK_TOP_APLL2_D16, "apll2_d16", "apll2_ck", 1,
-		16),
-	FACTOR(CLK_TOP_LVDSPLL, "lvdspll_ck", "lvdspll", 1,
-		1),
-	FACTOR(CLK_TOP_LVDSPLL_D2, "lvdspll_d2", "lvdspll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_LVDSPLL_D4, "lvdspll_d4", "lvdspll_ck", 1,
-		4),
-	FACTOR(CLK_TOP_LVDSPLL_D8, "lvdspll_d8", "lvdspll_ck", 1,
-		8),
-	FACTOR(CLK_TOP_LVDSPLL2, "lvdspll2_ck", "lvdspll2", 1,
-		1),
-	FACTOR(CLK_TOP_LVDSPLL2_D2, "lvdspll2_d2", "lvdspll2_ck", 1,
-		2),
-	FACTOR(CLK_TOP_LVDSPLL2_D4, "lvdspll2_d4", "lvdspll2_ck", 1,
-		4),
-	FACTOR(CLK_TOP_LVDSPLL2_D8, "lvdspll2_d8", "lvdspll2_ck", 1,
-		8),
-	FACTOR(CLK_TOP_ETHERPLL_125M, "etherpll_125m", "etherpll", 1,
-		1),
-	FACTOR(CLK_TOP_ETHERPLL_50M, "etherpll_50m", "etherpll", 1,
-		1),
-	FACTOR(CLK_TOP_CVBS, "cvbs", "cvbspll", 1,
-		1),
-	FACTOR(CLK_TOP_CVBS_D2, "cvbs_d2", "cvbs", 1,
-		2),
-	FACTOR(CLK_TOP_MMPLL, "mmpll_ck", "mmpll", 1,
-		1),
-	FACTOR(CLK_TOP_MMPLL_D2, "mmpll_d2", "mmpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_VENCPLL, "vencpll_ck", "vencpll", 1,
-		1),
-	FACTOR(CLK_TOP_VENCPLL_D2, "vencpll_d2", "vencpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_VCODECPLL, "vcodecpll_ck", "vcodecpll", 1,
-		1),
-	FACTOR(CLK_TOP_VCODECPLL_D2, "vcodecpll_d2", "vcodecpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1,
-		1),
-	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1,
-		4),
-	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1,
-		8),
-	FACTOR(CLK_TOP_TVDPLL_429M, "tvdpll_429m", "tvdpll", 1,
-		1),
-	FACTOR(CLK_TOP_TVDPLL_429M_D2, "tvdpll_429m_d2", "tvdpll_429m", 1,
-		2),
-	FACTOR(CLK_TOP_TVDPLL_429M_D4, "tvdpll_429m_d4", "tvdpll_429m", 1,
-		4),
-	FACTOR(CLK_TOP_MSDCPLL, "msdcpll_ck", "msdcpll", 1,
-		1),
-	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll_ck", 1,
-		2),
-	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll_ck", 1,
-		4),
-	FACTOR(CLK_TOP_MSDCPLL2, "msdcpll2_ck", "msdcpll2", 1,
-		1),
-	FACTOR(CLK_TOP_MSDCPLL2_D2, "msdcpll2_d2", "msdcpll2_ck", 1,
-		2),
-	FACTOR(CLK_TOP_MSDCPLL2_D4, "msdcpll2_d4", "msdcpll2_ck", 1,
-		4),
-	FACTOR(CLK_TOP_D2A_ULCLK_6P5M, "d2a_ulclk_6p5m", "clk26m", 1,
-		4),
-	FACTOR(CLK_TOP_APLL1_D3, "apll1_d3", "apll1_ck", 1,
-		3),
-	FACTOR(CLK_TOP_APLL2_D3, "apll2_d3", "apll2_ck", 1,
-		3),
+	FACTOR(CLK_TOP_SYS_26M, "sys_26m", "clk26m", 1, 1),
+	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "sys_26m", 1, 2),
+	FACTOR(CLK_TOP_ARMCA35PLL, "armca35pll_ck", "armca35pll", 1, 1),
+	FACTOR(CLK_TOP_ARMCA35PLL_600M, "armca35pll_600m", "armca35pll_ck", 1, 2),
+	FACTOR(CLK_TOP_ARMCA35PLL_400M, "armca35pll_400m", "armca35pll_ck", 1, 3),
+	FACTOR(CLK_TOP_ARMCA72PLL, "armca72pll_ck", "armca72pll", 1, 1),
+	FACTOR(CLK_TOP_SYSPLL, "syspll_ck", "mainpll", 1, 1),
+	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll_d2", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL1_D4, "syspll1_d4", "syspll_d2", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL1_D8, "syspll1_d8", "syspll_d2", 1, 8),
+	FACTOR(CLK_TOP_SYSPLL1_D16, "syspll1_d16", "syspll_d2", 1, 16),
+	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "syspll_ck", 1, 3),
+	FACTOR(CLK_TOP_SYSPLL2_D2, "syspll2_d2", "syspll_d3", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL2_D4, "syspll2_d4", "syspll_d3", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "syspll_ck", 1, 5),
+	FACTOR(CLK_TOP_SYSPLL3_D2, "syspll3_d2", "syspll_d5", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL3_D4, "syspll3_d4", "syspll_d5", 1, 4),
+	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "syspll_ck", 1, 7),
+	FACTOR(CLK_TOP_SYSPLL4_D2, "syspll4_d2", "syspll_d7", 1, 2),
+	FACTOR(CLK_TOP_SYSPLL4_D4, "syspll4_d4", "syspll_d7", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL, "univpll_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll_ck", 1, 7),
+	FACTOR(CLK_TOP_UNIVPLL_D26, "univpll_d26", "univpll_ck", 1, 26),
+	FACTOR(CLK_TOP_UNIVPLL_D52, "univpll_d52", "univpll_ck", 1, 52),
+	FACTOR(CLK_TOP_UNIVPLL_D104, "univpll_d104", "univpll_ck", 1, 104),
+	FACTOR(CLK_TOP_UNIVPLL_D208, "univpll_d208", "univpll_ck", 1, 208),
+	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll_ck", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D2, "univpll1_d2", "univpll_d2", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL1_D4, "univpll1_d4", "univpll_d2", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL1_D8, "univpll1_d8", "univpll_d2", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll_ck", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL2_D2, "univpll2_d2", "univpll_d3", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL2_D4, "univpll2_d4", "univpll_d3", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL2_D8, "univpll2_d8", "univpll_d3", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll_ck", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL3_D2, "univpll3_d2", "univpll_d5", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL3_D4, "univpll3_d4", "univpll_d5", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL3_D8, "univpll3_d8", "univpll_d5", 1, 8),
+	FACTOR(CLK_TOP_F_MP0_PLL1, "f_mp0_pll1_ck", "univpll_d2", 1, 1),
+	FACTOR(CLK_TOP_F_MP0_PLL2, "f_mp0_pll2_ck", "univpll1_d2", 1, 1),
+	FACTOR(CLK_TOP_F_BIG_PLL1, "f_big_pll1_ck", "univpll_d2", 1, 1),
+	FACTOR(CLK_TOP_F_BIG_PLL2, "f_big_pll2_ck", "univpll1_d2", 1, 1),
+	FACTOR(CLK_TOP_F_BUS_PLL1, "f_bus_pll1_ck", "univpll_d2", 1, 1),
+	FACTOR(CLK_TOP_F_BUS_PLL2, "f_bus_pll2_ck", "univpll1_d2", 1, 1),
+	FACTOR(CLK_TOP_APLL1, "apll1_ck", "apll1", 1, 1),
+	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1_ck", 1, 2),
+	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1_ck", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1_ck", 1, 8),
+	FACTOR(CLK_TOP_APLL1_D16, "apll1_d16", "apll1_ck", 1, 16),
+	FACTOR(CLK_TOP_APLL2, "apll2_ck", "apll2", 1, 1),
+	FACTOR(CLK_TOP_APLL2_D2, "apll2_d2", "apll2_ck", 1, 2),
+	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2_ck", 1, 4),
+	FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "apll2_ck", 1, 8),
+	FACTOR(CLK_TOP_APLL2_D16, "apll2_d16", "apll2_ck", 1, 16),
+	FACTOR(CLK_TOP_LVDSPLL, "lvdspll_ck", "lvdspll", 1, 1),
+	FACTOR(CLK_TOP_LVDSPLL_D2, "lvdspll_d2", "lvdspll_ck", 1, 2),
+	FACTOR(CLK_TOP_LVDSPLL_D4, "lvdspll_d4", "lvdspll_ck", 1, 4),
+	FACTOR(CLK_TOP_LVDSPLL_D8, "lvdspll_d8", "lvdspll_ck", 1, 8),
+	FACTOR(CLK_TOP_LVDSPLL2, "lvdspll2_ck", "lvdspll2", 1, 1),
+	FACTOR(CLK_TOP_LVDSPLL2_D2, "lvdspll2_d2", "lvdspll2_ck", 1, 2),
+	FACTOR(CLK_TOP_LVDSPLL2_D4, "lvdspll2_d4", "lvdspll2_ck", 1, 4),
+	FACTOR(CLK_TOP_LVDSPLL2_D8, "lvdspll2_d8", "lvdspll2_ck", 1, 8),
+	FACTOR(CLK_TOP_ETHERPLL_125M, "etherpll_125m", "etherpll", 1, 1),
+	FACTOR(CLK_TOP_ETHERPLL_50M, "etherpll_50m", "etherpll", 1, 1),
+	FACTOR(CLK_TOP_CVBS, "cvbs", "cvbspll", 1, 1),
+	FACTOR(CLK_TOP_CVBS_D2, "cvbs_d2", "cvbs", 1, 2),
+	FACTOR(CLK_TOP_MMPLL, "mmpll_ck", "mmpll", 1, 1),
+	FACTOR(CLK_TOP_MMPLL_D2, "mmpll_d2", "mmpll_ck", 1, 2),
+	FACTOR(CLK_TOP_VENCPLL, "vencpll_ck", "vencpll", 1, 1),
+	FACTOR(CLK_TOP_VENCPLL_D2, "vencpll_d2", "vencpll_ck", 1, 2),
+	FACTOR(CLK_TOP_VCODECPLL, "vcodecpll_ck", "vcodecpll", 1, 1),
+	FACTOR(CLK_TOP_VCODECPLL_D2, "vcodecpll_d2", "vcodecpll_ck", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_429M, "tvdpll_429m", "tvdpll", 1, 1),
+	FACTOR(CLK_TOP_TVDPLL_429M_D2, "tvdpll_429m_d2", "tvdpll_429m", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_429M_D4, "tvdpll_429m_d4", "tvdpll_429m", 1, 4),
+	FACTOR(CLK_TOP_MSDCPLL, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll_ck", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll_ck", 1, 4),
+	FACTOR(CLK_TOP_MSDCPLL2, "msdcpll2_ck", "msdcpll2", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL2_D2, "msdcpll2_d2", "msdcpll2_ck", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL2_D4, "msdcpll2_d4", "msdcpll2_ck", 1, 4),
+	FACTOR(CLK_TOP_D2A_ULCLK_6P5M, "d2a_ulclk_6p5m", "clk26m", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D3, "apll1_d3", "apll1_ck", 1, 3),
+	FACTOR(CLK_TOP_APLL2_D3, "apll2_d3", "apll2_ck", 1, 3),
 };
 
 static const char * const axi_parents[] = {
@@ -734,169 +645,118 @@ static const char * const audull_vtx_parents[] = {
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
 	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents, 0x040, 0, 3,
-		7, CLK_IS_CRITICAL),
+		       7, CLK_IS_CRITICAL),
 	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents, 0x040, 8, 1,
-		15, CLK_IS_CRITICAL),
-	MUX_GATE(CLK_TOP_MM_SEL, "mm_sel",
-		mm_parents, 0x040, 24, 3, 31),
+		       15, CLK_IS_CRITICAL),
+	MUX_GATE(CLK_TOP_MM_SEL, "mm_sel", mm_parents, 0x040, 24, 3, 31),
 	/* CLK_CFG_1 */
-	MUX_GATE(CLK_TOP_PWM_SEL, "pwm_sel",
-		pwm_parents, 0x050, 0, 2, 7),
-	MUX_GATE(CLK_TOP_VDEC_SEL, "vdec_sel",
-		vdec_parents, 0x050, 8, 4, 15),
-	MUX_GATE(CLK_TOP_VENC_SEL, "venc_sel",
-		venc_parents, 0x050, 16, 4, 23),
-	MUX_GATE(CLK_TOP_MFG_SEL, "mfg_sel",
-		mfg_parents, 0x050, 24, 4, 31),
+	MUX_GATE(CLK_TOP_PWM_SEL, "pwm_sel", pwm_parents, 0x050, 0, 2, 7),
+	MUX_GATE(CLK_TOP_VDEC_SEL, "vdec_sel", vdec_parents, 0x050, 8, 4, 15),
+	MUX_GATE(CLK_TOP_VENC_SEL, "venc_sel", venc_parents, 0x050, 16, 4, 23),
+	MUX_GATE(CLK_TOP_MFG_SEL, "mfg_sel", mfg_parents, 0x050, 24, 4, 31),
 	/* CLK_CFG_2 */
-	MUX_GATE(CLK_TOP_CAMTG_SEL, "camtg_sel",
-		camtg_parents, 0x060, 0, 4, 7),
-	MUX_GATE(CLK_TOP_UART_SEL, "uart_sel",
-		uart_parents, 0x060, 8, 1, 15),
-	MUX_GATE(CLK_TOP_SPI_SEL, "spi_sel",
-		spi_parents, 0x060, 16, 3, 23),
-	MUX_GATE(CLK_TOP_USB20_SEL, "usb20_sel",
-		usb20_parents, 0x060, 24, 2, 31),
+	MUX_GATE(CLK_TOP_CAMTG_SEL, "camtg_sel", camtg_parents, 0x060, 0, 4, 7),
+	MUX_GATE(CLK_TOP_UART_SEL, "uart_sel", uart_parents, 0x060, 8, 1, 15),
+	MUX_GATE(CLK_TOP_SPI_SEL, "spi_sel", spi_parents, 0x060, 16, 3, 23),
+	MUX_GATE(CLK_TOP_USB20_SEL, "usb20_sel", usb20_parents, 0x060, 24, 2, 31),
 	/* CLK_CFG_3 */
-	MUX_GATE(CLK_TOP_USB30_SEL, "usb30_sel",
-		usb30_parents, 0x070, 0, 2, 7),
-	MUX_GATE(CLK_TOP_MSDC50_0_HCLK_SEL, "msdc50_0_h_sel",
-		msdc50_0_h_parents, 0x070, 8, 3, 15),
-	MUX_GATE(CLK_TOP_MSDC50_0_SEL, "msdc50_0_sel",
-		msdc50_0_parents, 0x070, 16, 4, 23),
-	MUX_GATE(CLK_TOP_MSDC30_1_SEL, "msdc30_1_sel",
-		msdc30_1_parents, 0x070, 24, 3, 31),
+	MUX_GATE(CLK_TOP_USB30_SEL, "usb30_sel", usb30_parents, 0x070, 0, 2, 7),
+	MUX_GATE(CLK_TOP_MSDC50_0_HCLK_SEL, "msdc50_0_h_sel", msdc50_0_h_parents,
+		 0x070, 8, 3, 15),
+	MUX_GATE(CLK_TOP_MSDC50_0_SEL, "msdc50_0_sel", msdc50_0_parents,
+		 0x070, 16, 4, 23),
+	MUX_GATE(CLK_TOP_MSDC30_1_SEL, "msdc30_1_sel", msdc30_1_parents,
+		 0x070, 24, 3, 31),
 	/* CLK_CFG_4 */
-	MUX_GATE(CLK_TOP_MSDC30_2_SEL, "msdc30_2_sel",
-		msdc30_1_parents, 0x080, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MSDC30_3_SEL, "msdc30_3_sel",
-		msdc30_3_parents, 0x080, 8, 4, 15),
-	MUX_GATE(CLK_TOP_AUDIO_SEL, "audio_sel",
-		audio_parents, 0x080, 16, 2, 23),
-	MUX_GATE(CLK_TOP_AUD_INTBUS_SEL, "aud_intbus_sel",
-		aud_intbus_parents, 0x080, 24, 3, 31),
+	MUX_GATE(CLK_TOP_MSDC30_2_SEL, "msdc30_2_sel", msdc30_1_parents,
+		 0x080, 0, 3, 7),
+	MUX_GATE(CLK_TOP_MSDC30_3_SEL, "msdc30_3_sel", msdc30_3_parents,
+		 0x080, 8, 4, 15),
+	MUX_GATE(CLK_TOP_AUDIO_SEL, "audio_sel", audio_parents,
+		 0x080, 16, 2, 23),
+	MUX_GATE(CLK_TOP_AUD_INTBUS_SEL, "aud_intbus_sel", aud_intbus_parents,
+		 0x080, 24, 3, 31),
 	/* CLK_CFG_5 */
-	MUX_GATE(CLK_TOP_PMICSPI_SEL, "pmicspi_sel",
-		pmicspi_parents, 0x090, 0, 3, 7),
-	MUX_GATE(CLK_TOP_DPILVDS1_SEL, "dpilvds1_sel",
-		dpilvds1_parents, 0x090, 8, 3, 15),
-	MUX_GATE(CLK_TOP_ATB_SEL, "atb_sel",
-		atb_parents, 0x090, 16, 2, 23),
-	MUX_GATE(CLK_TOP_NR_SEL, "nr_sel",
-		nr_parents, 0x090, 24, 3, 31),
+	MUX_GATE(CLK_TOP_PMICSPI_SEL, "pmicspi_sel", pmicspi_parents, 0x090, 0, 3, 7),
+	MUX_GATE(CLK_TOP_DPILVDS1_SEL, "dpilvds1_sel", dpilvds1_parents,
+		 0x090, 8, 3, 15),
+	MUX_GATE(CLK_TOP_ATB_SEL, "atb_sel", atb_parents, 0x090, 16, 2, 23),
+	MUX_GATE(CLK_TOP_NR_SEL, "nr_sel", nr_parents, 0x090, 24, 3, 31),
 	/* CLK_CFG_6 */
-	MUX_GATE(CLK_TOP_NFI2X_SEL, "nfi2x_sel",
-		nfi2x_parents, 0x0a0, 0, 4, 7),
-	MUX_GATE(CLK_TOP_IRDA_SEL, "irda_sel",
-		irda_parents, 0x0a0, 8, 2, 15),
-	MUX_GATE(CLK_TOP_CCI400_SEL, "cci400_sel",
-		cci400_parents, 0x0a0, 16, 3, 23),
-	MUX_GATE(CLK_TOP_AUD_1_SEL, "aud_1_sel",
-		aud_1_parents, 0x0a0, 24, 2, 31),
+	MUX_GATE(CLK_TOP_NFI2X_SEL, "nfi2x_sel", nfi2x_parents, 0x0a0, 0, 4, 7),
+	MUX_GATE(CLK_TOP_IRDA_SEL, "irda_sel", irda_parents, 0x0a0, 8, 2, 15),
+	MUX_GATE(CLK_TOP_CCI400_SEL, "cci400_sel", cci400_parents, 0x0a0, 16, 3, 23),
+	MUX_GATE(CLK_TOP_AUD_1_SEL, "aud_1_sel", aud_1_parents, 0x0a0, 24, 2, 31),
 	/* CLK_CFG_7 */
-	MUX_GATE(CLK_TOP_AUD_2_SEL, "aud_2_sel",
-		aud_2_parents, 0x0b0, 0, 2, 7),
-	MUX_GATE(CLK_TOP_MEM_MFG_IN_AS_SEL, "mem_mfg_sel",
-		mem_mfg_parents, 0x0b0, 8, 2, 15),
-	MUX_GATE(CLK_TOP_AXI_MFG_IN_AS_SEL, "axi_mfg_sel",
-		axi_mfg_parents, 0x0b0, 16, 2, 23),
-	MUX_GATE(CLK_TOP_SCAM_SEL, "scam_sel",
-		scam_parents, 0x0b0, 24, 2, 31),
+	MUX_GATE(CLK_TOP_AUD_2_SEL, "aud_2_sel", aud_2_parents, 0x0b0, 0, 2, 7),
+	MUX_GATE(CLK_TOP_MEM_MFG_IN_AS_SEL, "mem_mfg_sel", mem_mfg_parents,
+		 0x0b0, 8, 2, 15),
+	MUX_GATE(CLK_TOP_AXI_MFG_IN_AS_SEL, "axi_mfg_sel", axi_mfg_parents,
+		 0x0b0, 16, 2, 23),
+	MUX_GATE(CLK_TOP_SCAM_SEL, "scam_sel", scam_parents, 0x0b0, 24, 2, 31),
 	/* CLK_CFG_8 */
-	MUX_GATE(CLK_TOP_NFIECC_SEL, "nfiecc_sel",
-		nfiecc_parents, 0x0c0, 0, 3, 7),
-	MUX_GATE(CLK_TOP_PE2_MAC_P0_SEL, "pe2_mac_p0_sel",
-		pe2_mac_p0_parents, 0x0c0, 8, 3, 15),
-	MUX_GATE(CLK_TOP_PE2_MAC_P1_SEL, "pe2_mac_p1_sel",
-		pe2_mac_p0_parents, 0x0c0, 16, 3, 23),
-	MUX_GATE(CLK_TOP_DPILVDS_SEL, "dpilvds_sel",
-		dpilvds_parents, 0x0c0, 24, 3, 31),
+	MUX_GATE(CLK_TOP_NFIECC_SEL, "nfiecc_sel", nfiecc_parents, 0x0c0, 0, 3, 7),
+	MUX_GATE(CLK_TOP_PE2_MAC_P0_SEL, "pe2_mac_p0_sel", pe2_mac_p0_parents,
+		 0x0c0, 8, 3, 15),
+	MUX_GATE(CLK_TOP_PE2_MAC_P1_SEL, "pe2_mac_p1_sel", pe2_mac_p0_parents,
+		 0x0c0, 16, 3, 23),
+	MUX_GATE(CLK_TOP_DPILVDS_SEL, "dpilvds_sel", dpilvds_parents, 0x0c0, 24, 3, 31),
 	/* CLK_CFG_9 */
-	MUX_GATE(CLK_TOP_MSDC50_3_HCLK_SEL, "msdc50_3_h_sel",
-		msdc50_0_h_parents, 0x0d0, 0, 3, 7),
-	MUX_GATE(CLK_TOP_HDCP_SEL, "hdcp_sel",
-		hdcp_parents, 0x0d0, 8, 2, 15),
-	MUX_GATE(CLK_TOP_HDCP_24M_SEL, "hdcp_24m_sel",
-		hdcp_24m_parents, 0x0d0, 16, 2, 23),
-	MUX_GATE_FLAGS(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x0d0, 24, 2,
-		31, CLK_IS_CRITICAL),
+	MUX_GATE(CLK_TOP_MSDC50_3_HCLK_SEL, "msdc50_3_h_sel", msdc50_0_h_parents,
+		 0x0d0, 0, 3, 7),
+	MUX_GATE(CLK_TOP_HDCP_SEL, "hdcp_sel", hdcp_parents, 0x0d0, 8, 2, 15),
+	MUX_GATE(CLK_TOP_HDCP_24M_SEL, "hdcp_24m_sel", hdcp_24m_parents,
+		 0x0d0, 16, 2, 23),
+	MUX_GATE_FLAGS(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents,
+		       0x0d0, 24, 2, 31, CLK_IS_CRITICAL),
 	/* CLK_CFG_10 */
-	MUX_GATE(CLK_TOP_SPINOR_SEL, "spinor_sel",
-		spinor_parents, 0x500, 0, 4, 7),
-	MUX_GATE(CLK_TOP_APLL_SEL, "apll_sel",
-		apll_parents, 0x500, 8, 4, 15),
-	MUX_GATE(CLK_TOP_APLL2_SEL, "apll2_sel",
-		apll_parents, 0x500, 16, 4, 23),
-	MUX_GATE(CLK_TOP_A1SYS_HP_SEL, "a1sys_hp_sel",
-		a1sys_hp_parents, 0x500, 24, 3, 31),
+	MUX_GATE(CLK_TOP_SPINOR_SEL, "spinor_sel", spinor_parents, 0x500, 0, 4, 7),
+	MUX_GATE(CLK_TOP_APLL_SEL, "apll_sel", apll_parents, 0x500, 8, 4, 15),
+	MUX_GATE(CLK_TOP_APLL2_SEL, "apll2_sel", apll_parents, 0x500, 16, 4, 23),
+	MUX_GATE(CLK_TOP_A1SYS_HP_SEL, "a1sys_hp_sel", a1sys_hp_parents,
+		 0x500, 24, 3, 31),
 	/* CLK_CFG_11 */
-	MUX_GATE(CLK_TOP_A2SYS_HP_SEL, "a2sys_hp_sel",
-		a2sys_hp_parents, 0x510, 0, 3, 7),
-	MUX_GATE(CLK_TOP_ASM_L_SEL, "asm_l_sel",
-		asm_l_parents, 0x510, 8, 2, 15),
-	MUX_GATE(CLK_TOP_ASM_M_SEL, "asm_m_sel",
-		asm_l_parents, 0x510, 16, 2, 23),
-	MUX_GATE(CLK_TOP_ASM_H_SEL, "asm_h_sel",
-		asm_l_parents, 0x510, 24, 2, 31),
+	MUX_GATE(CLK_TOP_A2SYS_HP_SEL, "a2sys_hp_sel", a2sys_hp_parents, 0x510, 0, 3, 7),
+	MUX_GATE(CLK_TOP_ASM_L_SEL, "asm_l_sel", asm_l_parents, 0x510, 8, 2, 15),
+	MUX_GATE(CLK_TOP_ASM_M_SEL, "asm_m_sel", asm_l_parents, 0x510, 16, 2, 23),
+	MUX_GATE(CLK_TOP_ASM_H_SEL, "asm_h_sel", asm_l_parents, 0x510, 24, 2, 31),
 	/* CLK_CFG_12 */
-	MUX_GATE(CLK_TOP_I2SO1_SEL, "i2so1_sel",
-		i2so1_parents, 0x520, 0, 2, 7),
-	MUX_GATE(CLK_TOP_I2SO2_SEL, "i2so2_sel",
-		i2so1_parents, 0x520, 8, 2, 15),
-	MUX_GATE(CLK_TOP_I2SO3_SEL, "i2so3_sel",
-		i2so1_parents, 0x520, 16, 2, 23),
-	MUX_GATE(CLK_TOP_TDMO0_SEL, "tdmo0_sel",
-		i2so1_parents, 0x520, 24, 2, 31),
+	MUX_GATE(CLK_TOP_I2SO1_SEL, "i2so1_sel", i2so1_parents, 0x520, 0, 2, 7),
+	MUX_GATE(CLK_TOP_I2SO2_SEL, "i2so2_sel", i2so1_parents, 0x520, 8, 2, 15),
+	MUX_GATE(CLK_TOP_I2SO3_SEL, "i2so3_sel", i2so1_parents, 0x520, 16, 2, 23),
+	MUX_GATE(CLK_TOP_TDMO0_SEL, "tdmo0_sel", i2so1_parents, 0x520, 24, 2, 31),
 	/* CLK_CFG_13 */
-	MUX_GATE(CLK_TOP_TDMO1_SEL, "tdmo1_sel",
-		i2so1_parents, 0x530, 0, 2, 7),
-	MUX_GATE(CLK_TOP_I2SI1_SEL, "i2si1_sel",
-		i2so1_parents, 0x530, 8, 2, 15),
-	MUX_GATE(CLK_TOP_I2SI2_SEL, "i2si2_sel",
-		i2so1_parents, 0x530, 16, 2, 23),
-	MUX_GATE(CLK_TOP_I2SI3_SEL, "i2si3_sel",
-		i2so1_parents, 0x530, 24, 2, 31),
+	MUX_GATE(CLK_TOP_TDMO1_SEL, "tdmo1_sel", i2so1_parents, 0x530, 0, 2, 7),
+	MUX_GATE(CLK_TOP_I2SI1_SEL, "i2si1_sel", i2so1_parents, 0x530, 8, 2, 15),
+	MUX_GATE(CLK_TOP_I2SI2_SEL, "i2si2_sel", i2so1_parents, 0x530, 16, 2, 23),
+	MUX_GATE(CLK_TOP_I2SI3_SEL, "i2si3_sel", i2so1_parents, 0x530, 24, 2, 31),
 	/* CLK_CFG_14 */
-	MUX_GATE(CLK_TOP_ETHER_125M_SEL, "ether_125m_sel",
-		ether_125m_parents, 0x540, 0, 2, 7),
-	MUX_GATE(CLK_TOP_ETHER_50M_SEL, "ether_50m_sel",
-		ether_50m_parents, 0x540, 8, 2, 15),
-	MUX_GATE(CLK_TOP_JPGDEC_SEL, "jpgdec_sel",
-		jpgdec_parents, 0x540, 16, 4, 23),
-	MUX_GATE(CLK_TOP_SPISLV_SEL, "spislv_sel",
-		spislv_parents, 0x540, 24, 3, 31),
+	MUX_GATE(CLK_TOP_ETHER_125M_SEL, "ether_125m_sel", ether_125m_parents,
+		 0x540, 0, 2, 7),
+	MUX_GATE(CLK_TOP_ETHER_50M_SEL, "ether_50m_sel", ether_50m_parents,
+		 0x540, 8, 2, 15),
+	MUX_GATE(CLK_TOP_JPGDEC_SEL, "jpgdec_sel", jpgdec_parents, 0x540, 16, 4, 23),
+	MUX_GATE(CLK_TOP_SPISLV_SEL, "spislv_sel", spislv_parents, 0x540, 24, 3, 31),
 	/* CLK_CFG_15 */
-	MUX_GATE(CLK_TOP_ETHER_50M_RMII_SEL, "ether_sel",
-		ether_parents, 0x550, 0, 2, 7),
-	MUX_GATE(CLK_TOP_CAM2TG_SEL, "cam2tg_sel",
-		camtg_parents, 0x550, 8, 4, 15),
-	MUX_GATE(CLK_TOP_DI_SEL, "di_sel",
-		di_parents, 0x550, 16, 3, 23),
-	MUX_GATE(CLK_TOP_TVD_SEL, "tvd_sel",
-		tvd_parents, 0x550, 24, 2, 31),
+	MUX_GATE(CLK_TOP_ETHER_50M_RMII_SEL, "ether_sel", ether_parents, 0x550, 0, 2, 7),
+	MUX_GATE(CLK_TOP_CAM2TG_SEL, "cam2tg_sel", camtg_parents, 0x550, 8, 4, 15),
+	MUX_GATE(CLK_TOP_DI_SEL, "di_sel", di_parents, 0x550, 16, 3, 23),
+	MUX_GATE(CLK_TOP_TVD_SEL, "tvd_sel", tvd_parents, 0x550, 24, 2, 31),
 	/* CLK_CFG_16 */
-	MUX_GATE(CLK_TOP_I2C_SEL, "i2c_sel",
-		i2c_parents, 0x560, 0, 3, 7),
-	MUX_GATE(CLK_TOP_PWM_INFRA_SEL, "pwm_infra_sel",
-		pwm_parents, 0x560, 8, 2, 15),
-	MUX_GATE(CLK_TOP_MSDC0P_AES_SEL, "msdc0p_aes_sel",
-		msdc0p_aes_parents, 0x560, 16, 2, 23),
-	MUX_GATE(CLK_TOP_CMSYS_SEL, "cmsys_sel",
-		cmsys_parents, 0x560, 24, 3, 31),
+	MUX_GATE(CLK_TOP_I2C_SEL, "i2c_sel", i2c_parents, 0x560, 0, 3, 7),
+	MUX_GATE(CLK_TOP_PWM_INFRA_SEL, "pwm_infra_sel", pwm_parents, 0x560, 8, 2, 15),
+	MUX_GATE(CLK_TOP_MSDC0P_AES_SEL, "msdc0p_aes_sel", msdc0p_aes_parents,
+		 0x560, 16, 2, 23),
+	MUX_GATE(CLK_TOP_CMSYS_SEL, "cmsys_sel", cmsys_parents, 0x560, 24, 3, 31),
 	/* CLK_CFG_17 */
-	MUX_GATE(CLK_TOP_GCPU_SEL, "gcpu_sel",
-		gcpu_parents, 0x570, 0, 3, 7),
+	MUX_GATE(CLK_TOP_GCPU_SEL, "gcpu_sel", gcpu_parents, 0x570, 0, 3, 7),
 	/* CLK_AUDDIV_4 */
-	MUX(CLK_TOP_AUD_APLL1_SEL, "aud_apll1_sel",
-		aud_apll1_parents, 0x134, 0, 1),
-	MUX(CLK_TOP_AUD_APLL2_SEL, "aud_apll2_sel",
-		aud_apll2_parents, 0x134, 1, 1),
-	MUX(CLK_TOP_DA_AUDULL_VTX_6P5M_SEL, "audull_vtx_sel",
-		audull_vtx_parents, 0x134, 31, 1),
-	MUX(CLK_TOP_APLL1_REF_SEL, "apll1_ref_sel",
-		apll1_ref_parents, 0x134, 4, 3),
-	MUX(CLK_TOP_APLL2_REF_SEL, "apll2_ref_sel",
-		apll1_ref_parents, 0x134, 7, 3),
+	MUX(CLK_TOP_AUD_APLL1_SEL, "aud_apll1_sel", aud_apll1_parents, 0x134, 0, 1),
+	MUX(CLK_TOP_AUD_APLL2_SEL, "aud_apll2_sel", aud_apll2_parents, 0x134, 1, 1),
+	MUX(CLK_TOP_DA_AUDULL_VTX_6P5M_SEL, "audull_vtx_sel", audull_vtx_parents,
+	    0x134, 31, 1),
+	MUX(CLK_TOP_APLL1_REF_SEL, "apll1_ref_sel", apll1_ref_parents, 0x134, 4, 3),
+	MUX(CLK_TOP_APLL2_REF_SEL, "apll2_ref_sel", apll1_ref_parents, 0x134, 7, 3),
 };
 
 static const char * const mcu_mp0_parents[] = {
@@ -923,13 +783,13 @@ static const char * const mcu_bus_parents[] = {
 static struct mtk_composite mcu_muxes[] = {
 	/* mp0_pll_divider_cfg */
 	MUX_GATE_FLAGS(CLK_MCU_MP0_SEL, "mcu_mp0_sel", mcu_mp0_parents, 0x7A0,
-		9, 2, -1, CLK_IS_CRITICAL),
+		       9, 2, -1, CLK_IS_CRITICAL),
 	/* mp2_pll_divider_cfg */
 	MUX_GATE_FLAGS(CLK_MCU_MP2_SEL, "mcu_mp2_sel", mcu_mp2_parents, 0x7A8,
-		9, 2, -1, CLK_IS_CRITICAL),
+		       9, 2, -1, CLK_IS_CRITICAL),
 	/* bus_pll_divider_cfg */
 	MUX_GATE_FLAGS(CLK_MCU_BUS_SEL, "mcu_bus_sel", mcu_bus_parents, 0x7C0,
-		9, 2, -1, CLK_IS_CRITICAL),
+		       9, 2, -1, CLK_IS_CRITICAL),
 };
 
 static const struct mtk_clk_divider top_adj_divs[] = {
@@ -1061,100 +921,54 @@ static const struct mtk_gate_regs peri2_cg_regs = {
 
 static const struct mtk_gate peri_clks[] = {
 	/* PERI0 */
-	GATE_PERI0(CLK_PERI_NFI, "per_nfi",
-		"axi_sel", 0),
-	GATE_PERI0(CLK_PERI_THERM, "per_therm",
-		"axi_sel", 1),
-	GATE_PERI0(CLK_PERI_PWM0, "per_pwm0",
-		"pwm_sel", 2),
-	GATE_PERI0(CLK_PERI_PWM1, "per_pwm1",
-		"pwm_sel", 3),
-	GATE_PERI0(CLK_PERI_PWM2, "per_pwm2",
-		"pwm_sel", 4),
-	GATE_PERI0(CLK_PERI_PWM3, "per_pwm3",
-		"pwm_sel", 5),
-	GATE_PERI0(CLK_PERI_PWM4, "per_pwm4",
-		"pwm_sel", 6),
-	GATE_PERI0(CLK_PERI_PWM5, "per_pwm5",
-		"pwm_sel", 7),
-	GATE_PERI0(CLK_PERI_PWM6, "per_pwm6",
-		"pwm_sel", 8),
-	GATE_PERI0(CLK_PERI_PWM7, "per_pwm7",
-		"pwm_sel", 9),
-	GATE_PERI0(CLK_PERI_PWM, "per_pwm",
-		"pwm_sel", 10),
-	GATE_PERI0(CLK_PERI_AP_DMA, "per_ap_dma",
-		"axi_sel", 13),
-	GATE_PERI0(CLK_PERI_MSDC30_0, "per_msdc30_0",
-		"msdc50_0_sel", 14),
-	GATE_PERI0(CLK_PERI_MSDC30_1, "per_msdc30_1",
-		"msdc30_1_sel", 15),
-	GATE_PERI0(CLK_PERI_MSDC30_2, "per_msdc30_2",
-		"msdc30_2_sel", 16),
-	GATE_PERI0(CLK_PERI_MSDC30_3, "per_msdc30_3",
-		"msdc30_3_sel", 17),
-	GATE_PERI0(CLK_PERI_UART0, "per_uart0",
-		"uart_sel", 20),
-	GATE_PERI0(CLK_PERI_UART1, "per_uart1",
-		"uart_sel", 21),
-	GATE_PERI0(CLK_PERI_UART2, "per_uart2",
-		"uart_sel", 22),
-	GATE_PERI0(CLK_PERI_UART3, "per_uart3",
-		"uart_sel", 23),
-	GATE_PERI0(CLK_PERI_I2C0, "per_i2c0",
-		"axi_sel", 24),
-	GATE_PERI0(CLK_PERI_I2C1, "per_i2c1",
-		"axi_sel", 25),
-	GATE_PERI0(CLK_PERI_I2C2, "per_i2c2",
-		"axi_sel", 26),
-	GATE_PERI0(CLK_PERI_I2C3, "per_i2c3",
-		"axi_sel", 27),
-	GATE_PERI0(CLK_PERI_I2C4, "per_i2c4",
-		"axi_sel", 28),
-	GATE_PERI0(CLK_PERI_AUXADC, "per_auxadc",
-		"ltepll_fs26m", 29),
-	GATE_PERI0(CLK_PERI_SPI0, "per_spi0",
-		"spi_sel", 30),
+	GATE_PERI0(CLK_PERI_NFI, "per_nfi", "axi_sel", 0),
+	GATE_PERI0(CLK_PERI_THERM, "per_therm", "axi_sel", 1),
+	GATE_PERI0(CLK_PERI_PWM0, "per_pwm0", "pwm_sel", 2),
+	GATE_PERI0(CLK_PERI_PWM1, "per_pwm1", "pwm_sel", 3),
+	GATE_PERI0(CLK_PERI_PWM2, "per_pwm2", "pwm_sel", 4),
+	GATE_PERI0(CLK_PERI_PWM3, "per_pwm3", "pwm_sel", 5),
+	GATE_PERI0(CLK_PERI_PWM4, "per_pwm4", "pwm_sel", 6),
+	GATE_PERI0(CLK_PERI_PWM5, "per_pwm5", "pwm_sel", 7),
+	GATE_PERI0(CLK_PERI_PWM6, "per_pwm6", "pwm_sel", 8),
+	GATE_PERI0(CLK_PERI_PWM7, "per_pwm7", "pwm_sel", 9),
+	GATE_PERI0(CLK_PERI_PWM, "per_pwm", "pwm_sel", 10),
+	GATE_PERI0(CLK_PERI_AP_DMA, "per_ap_dma", "axi_sel", 13),
+	GATE_PERI0(CLK_PERI_MSDC30_0, "per_msdc30_0", "msdc50_0_sel", 14),
+	GATE_PERI0(CLK_PERI_MSDC30_1, "per_msdc30_1", "msdc30_1_sel", 15),
+	GATE_PERI0(CLK_PERI_MSDC30_2, "per_msdc30_2", "msdc30_2_sel", 16),
+	GATE_PERI0(CLK_PERI_MSDC30_3, "per_msdc30_3", "msdc30_3_sel", 17),
+	GATE_PERI0(CLK_PERI_UART0, "per_uart0", "uart_sel", 20),
+	GATE_PERI0(CLK_PERI_UART1, "per_uart1", "uart_sel", 21),
+	GATE_PERI0(CLK_PERI_UART2, "per_uart2", "uart_sel", 22),
+	GATE_PERI0(CLK_PERI_UART3, "per_uart3", "uart_sel", 23),
+	GATE_PERI0(CLK_PERI_I2C0, "per_i2c0", "axi_sel", 24),
+	GATE_PERI0(CLK_PERI_I2C1, "per_i2c1", "axi_sel", 25),
+	GATE_PERI0(CLK_PERI_I2C2, "per_i2c2", "axi_sel", 26),
+	GATE_PERI0(CLK_PERI_I2C3, "per_i2c3", "axi_sel", 27),
+	GATE_PERI0(CLK_PERI_I2C4, "per_i2c4", "axi_sel", 28),
+	GATE_PERI0(CLK_PERI_AUXADC, "per_auxadc", "ltepll_fs26m", 29),
+	GATE_PERI0(CLK_PERI_SPI0, "per_spi0", "spi_sel", 30),
 	/* PERI1 */
-	GATE_PERI1(CLK_PERI_SPI, "per_spi",
-		"spinor_sel", 1),
-	GATE_PERI1(CLK_PERI_I2C5, "per_i2c5",
-		"axi_sel", 3),
-	GATE_PERI1(CLK_PERI_SPI2, "per_spi2",
-		"spi_sel", 5),
-	GATE_PERI1(CLK_PERI_SPI3, "per_spi3",
-		"spi_sel", 6),
-	GATE_PERI1(CLK_PERI_SPI5, "per_spi5",
-		"spi_sel", 8),
-	GATE_PERI1(CLK_PERI_UART4, "per_uart4",
-		"uart_sel", 9),
-	GATE_PERI1(CLK_PERI_SFLASH, "per_sflash",
-		"uart_sel", 11),
-	GATE_PERI1(CLK_PERI_GMAC, "per_gmac",
-		"uart_sel", 12),
-	GATE_PERI1(CLK_PERI_PCIE0, "per_pcie0",
-		"uart_sel", 14),
-	GATE_PERI1(CLK_PERI_PCIE1, "per_pcie1",
-		"uart_sel", 15),
-	GATE_PERI1(CLK_PERI_GMAC_PCLK, "per_gmac_pclk",
-		"uart_sel", 16),
+	GATE_PERI1(CLK_PERI_SPI, "per_spi", "spinor_sel", 1),
+	GATE_PERI1(CLK_PERI_I2C5, "per_i2c5", "axi_sel", 3),
+	GATE_PERI1(CLK_PERI_SPI2, "per_spi2", "spi_sel", 5),
+	GATE_PERI1(CLK_PERI_SPI3, "per_spi3", "spi_sel", 6),
+	GATE_PERI1(CLK_PERI_SPI5, "per_spi5", "spi_sel", 8),
+	GATE_PERI1(CLK_PERI_UART4, "per_uart4", "uart_sel", 9),
+	GATE_PERI1(CLK_PERI_SFLASH, "per_sflash", "uart_sel", 11),
+	GATE_PERI1(CLK_PERI_GMAC, "per_gmac", "uart_sel", 12),
+	GATE_PERI1(CLK_PERI_PCIE0, "per_pcie0", "uart_sel", 14),
+	GATE_PERI1(CLK_PERI_PCIE1, "per_pcie1", "uart_sel", 15),
+	GATE_PERI1(CLK_PERI_GMAC_PCLK, "per_gmac_pclk", "uart_sel", 16),
 	/* PERI2 */
-	GATE_PERI2(CLK_PERI_MSDC50_0_EN, "per_msdc50_0_en",
-		"msdc50_0_sel", 0),
-	GATE_PERI2(CLK_PERI_MSDC30_1_EN, "per_msdc30_1_en",
-		"msdc30_1_sel", 1),
-	GATE_PERI2(CLK_PERI_MSDC30_2_EN, "per_msdc30_2_en",
-		"msdc30_2_sel", 2),
-	GATE_PERI2(CLK_PERI_MSDC30_3_EN, "per_msdc30_3_en",
-		"msdc30_3_sel", 3),
-	GATE_PERI2(CLK_PERI_MSDC50_0_HCLK_EN, "per_msdc50_0_h",
-		"msdc50_0_h_sel", 4),
-	GATE_PERI2(CLK_PERI_MSDC50_3_HCLK_EN, "per_msdc50_3_h",
-		"msdc50_3_h_sel", 5),
-	GATE_PERI2(CLK_PERI_MSDC30_0_QTR_EN, "per_msdc30_0_q",
-		"axi_sel", 6),
-	GATE_PERI2(CLK_PERI_MSDC30_3_QTR_EN, "per_msdc30_3_q",
-		"mem_sel", 7),
+	GATE_PERI2(CLK_PERI_MSDC50_0_EN, "per_msdc50_0_en", "msdc50_0_sel", 0),
+	GATE_PERI2(CLK_PERI_MSDC30_1_EN, "per_msdc30_1_en", "msdc30_1_sel", 1),
+	GATE_PERI2(CLK_PERI_MSDC30_2_EN, "per_msdc30_2_en", "msdc30_2_sel", 2),
+	GATE_PERI2(CLK_PERI_MSDC30_3_EN, "per_msdc30_3_en", "msdc30_3_sel", 3),
+	GATE_PERI2(CLK_PERI_MSDC50_0_HCLK_EN, "per_msdc50_0_h", "msdc50_0_h_sel", 4),
+	GATE_PERI2(CLK_PERI_MSDC50_3_HCLK_EN, "per_msdc50_3_h", "msdc50_3_h_sel", 5),
+	GATE_PERI2(CLK_PERI_MSDC30_0_QTR_EN, "per_msdc30_0_q", "axi_sel", 6),
+	GATE_PERI2(CLK_PERI_MSDC30_3_QTR_EN, "per_msdc30_3_q", "mem_sel", 7),
 };
 
 #define MT2712_PLL_FMAX		(3000UL * MHZ)
@@ -1221,38 +1035,35 @@ static const struct mtk_pll_div_table mmpll_div_table[] = {
 
 static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0230, 0x023C, 0xf0000100,
-		HAVE_RST_BAR, 31, 0x0230, 4, 0, 0, 0, 0x0234, 0),
+	    HAVE_RST_BAR, 31, 0x0230, 4, 0, 0, 0, 0x0234, 0),
 	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0240, 0x024C, 0xfe000100,
-		HAVE_RST_BAR, 31, 0x0240, 4, 0, 0, 0, 0x0244, 0),
+	    HAVE_RST_BAR, 31, 0x0240, 4, 0, 0, 0, 0x0244, 0),
 	PLL(CLK_APMIXED_VCODECPLL, "vcodecpll", 0x0320, 0x032C, 0xc0000100,
-		0, 31, 0x0320, 4, 0, 0, 0, 0x0324, 0),
+	    0, 31, 0x0320, 4, 0, 0, 0, 0x0324, 0),
 	PLL(CLK_APMIXED_VENCPLL, "vencpll", 0x0280, 0x028C, 0x00000100,
-		0, 31, 0x0280, 4, 0, 0, 0, 0x0284, 0),
+	    0, 31, 0x0280, 4, 0, 0, 0, 0x0284, 0),
 	PLL(CLK_APMIXED_APLL1, "apll1", 0x0330, 0x0340, 0x00000100,
-		0, 31, 0x0330, 4, 0x0338, 0x0014, 0, 0x0334, 0),
+	    0, 31, 0x0330, 4, 0x0338, 0x0014, 0, 0x0334, 0),
 	PLL(CLK_APMIXED_APLL2, "apll2", 0x0350, 0x0360, 0x00000100,
-		0, 31, 0x0350, 4, 0x0358, 0x0014, 1, 0x0354, 0),
+	    0, 31, 0x0350, 4, 0x0358, 0x0014, 1, 0x0354, 0),
 	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x0370, 0x037c, 0x00000100,
-		0, 31, 0x0370, 4, 0, 0, 0, 0x0374, 0),
+	    0, 31, 0x0370, 4, 0, 0, 0, 0x0374, 0),
 	PLL(CLK_APMIXED_LVDSPLL2, "lvdspll2", 0x0390, 0x039C, 0x00000100,
-		0, 31, 0x0390, 4, 0, 0, 0, 0x0394, 0),
+	    0, 31, 0x0390, 4, 0, 0, 0, 0x0394, 0),
 	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0270, 0x027C, 0x00000100,
-		0, 31, 0x0270, 4, 0, 0, 0, 0x0274, 0),
+	    0, 31, 0x0270, 4, 0, 0, 0, 0x0274, 0),
 	PLL(CLK_APMIXED_MSDCPLL2, "msdcpll2", 0x0410, 0x041C, 0x00000100,
-		0, 31, 0x0410, 4, 0, 0, 0, 0x0414, 0),
+	    0, 31, 0x0410, 4, 0, 0, 0, 0x0414, 0),
 	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0290, 0x029C, 0xc0000100,
-		0, 31, 0x0290, 4, 0, 0, 0, 0x0294, 0),
+	    0, 31, 0x0290, 4, 0, 0, 0, 0x0294, 0),
 	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0250, 0x0260, 0x00000100,
-		0, 31, 0x0250, 4, 0, 0, 0, 0x0254, 0,
-		mmpll_div_table),
+	    0, 31, 0x0250, 4, 0, 0, 0, 0x0254, 0, mmpll_div_table),
 	PLL_B(CLK_APMIXED_ARMCA35PLL, "armca35pll", 0x0100, 0x0110, 0xf0000100,
-		HAVE_RST_BAR, 31, 0x0100, 4, 0, 0, 0, 0x0104, 0,
-		armca35pll_div_table),
+	      HAVE_RST_BAR, 31, 0x0100, 4, 0, 0, 0, 0x0104, 0, armca35pll_div_table),
 	PLL_B(CLK_APMIXED_ARMCA72PLL, "armca72pll", 0x0210, 0x0220, 0x00000100,
-		0, 31, 0x0210, 4, 0, 0, 0, 0x0214, 0,
-		armca72pll_div_table),
+	      0, 31, 0x0210, 4, 0, 0, 0, 0x0214, 0, armca72pll_div_table),
 	PLL(CLK_APMIXED_ETHERPLL, "etherpll", 0x0300, 0x030C, 0xc0000100,
-		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
+	    0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
 static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
-- 
2.39.1


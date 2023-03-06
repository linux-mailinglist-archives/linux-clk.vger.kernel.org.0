Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440246AC26C
	for <lists+linux-clk@lfdr.de>; Mon,  6 Mar 2023 15:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbjCFOI4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Mar 2023 09:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjCFOIW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:08:22 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC442DE70;
        Mon,  6 Mar 2023 06:07:21 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BA116602FED;
        Mon,  6 Mar 2023 14:06:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678111598;
        bh=V6gp3rQqGOdB6IuQNS6V9LAoXiOjBas/NVzMMD/2YpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VQDIxa69jHOdAApQMJholZqtcNEPz/03GfHEFWKrR7CDCuu6qt09VZ1kEhjOWQ9vU
         lL8SFgB3A1BaTTe1zKu98/nssrI6meWem25wdLwwIQoJT5Jw472KutMyKCdMggkBow
         AscqEy/KdTl5Rcu8poBzLZ4m631rpBQIeIpaIF2ETicqqftsyblVnADtHG8UsOVNAz
         QmeCOrJhK7rk9l0g3pgi5Y242KiRI65dzCz4yLfL/LCmwiQTH76hs/ihVYJ8wFObuZ
         ZE/ezA30POk9k3XTA+HqQct8Gvbm2F9LpHR+NwFmbKLq3BSjObnKQVlmDQo0dNQWYR
         eL08JQwjl3NBA==
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
Subject: [PATCH v6 32/54] clk: mediatek: mt7986-apmixed: Use PLL_AO flag to set critical clock
Date:   Mon,  6 Mar 2023 15:05:21 +0100
Message-Id: <20230306140543.1813621-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
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

Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 62080ee4dbe3..227ca572056e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -42,7 +42,7 @@
 		 "clkxtal")
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, 0, 32,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, PLL_AO, 32,
 	    0x0200, 4, 0, 0x0204, 0),
 	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x0, 0, 32,
 	    0x0210, 4, 0, 0x0214, 0),
@@ -77,8 +77,6 @@ static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
-- 
2.39.2


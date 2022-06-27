Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A8455C35F
	for <lists+linux-clk@lfdr.de>; Tue, 28 Jun 2022 14:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbiF0I46 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Jun 2022 04:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbiF0I4u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 04:56:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15D36376;
        Mon, 27 Jun 2022 01:56:49 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 17801660183C;
        Mon, 27 Jun 2022 09:56:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656320208;
        bh=ed21MxQBys0eLKmWDwmejvGmdOdkFhFLW6SX1N40rec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ar2+O6JoClqLVPU/TB7IJ0A053ZMv+9wuVqJs+k0CWT1BBp06KOOzdYj1fQtWX+k1
         I7euwKsmO9lAqFtgyVuU2MA75LjJnSm7Nv9NHaYYAAVsmSu04r2F5QyTalAc0gkbU1
         mhswDXrR1X251i2d9fpYbQXQhFz4NBtXr1kGxbwcP34OWfg5vU/+FFgfs2ZW9Hcxzk
         Z+BkSU7N6DYtzDovEg0XgHwNHsj7nQITgdjPPUTSa0jpRRCygkcPvfpka9bMdhj/Lk
         XRy3ZcNTw2CCjrktcA5I9d/bwbrEabjFH5fhW02T3Ug5UcG01biNZgp1E3n9UsYBfl
         X5amAnQ3/+Oww==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     robh+dt@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
        jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
        fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, chun-jie.chen@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
        sam.shih@mediatek.com, wenst@chromium.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        kernel@collabora.com
Subject: [PATCH v4 5/7] clk: mediatek: clk-apmixed: Remove unneeded __init annotation
Date:   Mon, 27 Jun 2022 10:56:30 +0200
Message-Id: <20220627085632.23797-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove an unneeded __init annotation from the declaration of function
mtk_clk_register_ref2usb_tx(): this avoids section mismatch warnings
during modpost phase when called from functions that have no such
annotation (useful when clocks are platform drivers).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index fc3d4146f482..6b0ab0a346e8 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -70,7 +70,7 @@ static const struct clk_ops mtk_ref2usb_tx_ops = {
 	.unprepare	= mtk_ref2usb_tx_unprepare,
 };
 
-struct clk_hw * __init mtk_clk_register_ref2usb_tx(const char *name,
+struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg)
 {
 	struct mtk_ref2usb_tx *tx;
-- 
2.35.1


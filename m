Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2058C57DD1F
	for <lists+linux-clk@lfdr.de>; Fri, 22 Jul 2022 11:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbiGVJGa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 Jul 2022 05:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiGVJG1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Jul 2022 05:06:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E549187206;
        Fri, 22 Jul 2022 02:06:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E79A6601AC9;
        Fri, 22 Jul 2022 10:06:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1658480783;
        bh=BT65OyDGjZHfnPJN6pPcSg+obOGNKdBaP5fa9KY0GAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XjwAA/2+XbVccM4uUql7bsYU+T7DMdMq2blGHPe10j4LC5qVHF6FtSAoZFtPpSRyZ
         9mtOS9J6hmQNre6X9JiHPaGJ4jApIyDTmFIyZq8CtpvDZfE/X4Tj9iqJa0fcF5jNk+
         0r3MnKrv219O0pJqppcENxYun73y0ETA7gR6xuC/n7UiFNtahgF2nVCH+SMg2pokMQ
         5xatJNHjPqoTxMHZ3slZ+eOZYhhM2btZYesEKD2cnYMIMHsRPdxBxlEqdZpLv/MwUn
         40hzAAlxfb4iTw6CZDAvV3Kls5KTOp6VBNHhWJbdmjr0CqmZcjI7MqzC6rmwnVg/8D
         fhxLxBz32YKYA==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, y.oudjana@protonmail.com,
        angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
        ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, ikjn@chromium.org,
        miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        kernel@collabora.com
Subject: [PATCH v6 6/8] clk: mediatek: Export required symbols to compile clk drivers as module
Date:   Fri, 22 Jul 2022 11:06:07 +0200
Message-Id: <20220722090609.52364-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
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

In order to compile the clock drivers for various MediaTek SoCs as
modules, it is necessary to export a few functions from the MediaTek
specific clocks (and reset) libraries.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 1 +
 drivers/clk/mediatek/clk-cpumux.c  | 2 ++
 drivers/clk/mediatek/clk-mtk.c     | 2 ++
 drivers/clk/mediatek/reset.c       | 1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index 6b0ab0a346e8..f126da693a7f 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 
 	return &tx->hw;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 2b5d48591738..25618eff6f2a 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
 		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 05a188c62119..41e60a7e8ff9 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 179505549a7c..290ceda84ce4 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -228,5 +228,6 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
 
 MODULE_LICENSE("GPL");
-- 
2.35.1


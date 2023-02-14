Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DEC696548
	for <lists+linux-clk@lfdr.de>; Tue, 14 Feb 2023 14:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjBNNqW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Feb 2023 08:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjBNNqF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 08:46:05 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C721028D1F;
        Tue, 14 Feb 2023 05:44:58 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DE79566021BA;
        Tue, 14 Feb 2023 13:42:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676382164;
        bh=zmw5vLFE7lmc3rzqiuCKUL/bOtfDUBYhxax4uSIesog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gdzO1U60cp779YN/QWp9dJqHfaa1qMq6Izrh37gBY303kPVNU2sHRKkIPt04+Ysx1
         n29IMFZqbAtZPiQSthdGhvdtfEek56YSGHfou/fggFeQQ2Q61hfE/zcc2aYSskKynP
         rwC1mlTmhuwVURS7XAUnI3bAFBDdfDeKFllOuOCrAvKZ3WWe7x5amZO/TVohHGrYym
         LrV7uVeifQpU7M7v5p9jLmOs2Dqx0szB4VyOhLTImPMSJ5lrjZkibCqlzl6wPbhBpF
         W2pCKRGgGfLyZZ8khMDEM/WaFRrk4QPYzMI9YODgjlnFdd0umVQVDum7Zypq5Jn3TK
         J57QkwtFq5E6g==
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
Subject: [PATCH v2 47/47] clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
Date:   Tue, 14 Feb 2023 14:41:27 +0100
Message-Id: <20230214134127.59273-48-angelogioacchino.delregno@collabora.com>
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

Add a MODULE_DEVICE_TABLE() on all clocks that can be built as modules
to allow auto-load at boot.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt2701-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-bdp.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-eth.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-g3d.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-hif.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-img.c          | 1 +
 drivers/clk/mediatek/clk-mt2701-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt2701-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt2701.c              | 1 +
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt2712-bdp.c          | 1 +
 drivers/clk/mediatek/clk-mt2712-img.c          | 1 +
 drivers/clk/mediatek/clk-mt2712-jpgdec.c       | 1 +
 drivers/clk/mediatek/clk-mt2712-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt2712-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt2712-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt2712-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt2712.c              | 1 +
 drivers/clk/mediatek/clk-mt6765-audio.c        | 1 +
 drivers/clk/mediatek/clk-mt6765-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt6765-img.c          | 1 +
 drivers/clk/mediatek/clk-mt6765-mipi0a.c       | 1 +
 drivers/clk/mediatek/clk-mt6765-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt6765-vcodec.c       | 1 +
 drivers/clk/mediatek/clk-mt6765.c              | 1 +
 drivers/clk/mediatek/clk-mt6779-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c          | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c          | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt6779-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt6779.c              | 1 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c     | 1 +
 drivers/clk/mediatek/clk-mt6795-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt6795-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt6795-pericfg.c      | 1 +
 drivers/clk/mediatek/clk-mt6795-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt6795-vdecsys.c      | 1 +
 drivers/clk/mediatek/clk-mt6795-vencsys.c      | 1 +
 drivers/clk/mediatek/clk-mt6797-img.c          | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt6797.c              | 1 +
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt7622-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt7622-eth.c          | 1 +
 drivers/clk/mediatek/clk-mt7622-hif.c          | 1 +
 drivers/clk/mediatek/clk-mt7622-infracfg.c     | 1 +
 drivers/clk/mediatek/clk-mt7622.c              | 1 +
 drivers/clk/mediatek/clk-mt7629-eth.c          | 1 +
 drivers/clk/mediatek/clk-mt7629-hif.c          | 1 +
 drivers/clk/mediatek/clk-mt7629.c              | 1 +
 drivers/clk/mediatek/clk-mt7981-apmixed.c      | 1 +
 drivers/clk/mediatek/clk-mt7981-eth.c          | 1 +
 drivers/clk/mediatek/clk-mt7981-infracfg.c     | 1 +
 drivers/clk/mediatek/clk-mt7981-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt7986-apmixed.c      | 3 ++-
 drivers/clk/mediatek/clk-mt7986-eth.c          | 1 +
 drivers/clk/mediatek/clk-mt7986-infracfg.c     | 1 +
 drivers/clk/mediatek/clk-mt7986-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8167-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt8167-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c       | 1 +
 drivers/clk/mediatek/clk-mt8167-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt8167-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8167.c              | 1 +
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8173-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c     | 1 +
 drivers/clk/mediatek/clk-mt8173-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt8173-pericfg.c      | 1 +
 drivers/clk/mediatek/clk-mt8173-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt8173-vdecsys.c      | 1 +
 drivers/clk/mediatek/clk-mt8173-vencsys.c      | 1 +
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8183-audio.c        | 1 +
 drivers/clk/mediatek/clk-mt8183-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8183-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8183-ipu0.c         | 1 +
 drivers/clk/mediatek/clk-mt8183-ipu1.c         | 1 +
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c      | 1 +
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c     | 1 +
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c       | 1 +
 drivers/clk/mediatek/clk-mt8183-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt8183-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8183-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt8183.c              | 1 +
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8186-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c | 1 +
 drivers/clk/mediatek/clk-mt8186-infra_ao.c     | 1 +
 drivers/clk/mediatek/clk-mt8186-ipe.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-mcu.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-mdp.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt8186-mm.c           | 2 ++
 drivers/clk/mediatek/clk-mt8186-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt8186-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8186-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt8186-wpe.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8192-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 1 +
 drivers/clk/mediatek/clk-mt8192-ipe.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-mdp.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt8192-msdc.c         | 1 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c     | 1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8192-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt8192.c              | 1 +
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c   | 1 +
 drivers/clk/mediatek/clk-mt8195-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8195-ccu.c          | 1 +
 drivers/clk/mediatek/clk-mt8195-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 1 +
 drivers/clk/mediatek/clk-mt8195-infra_ao.c     | 1 +
 drivers/clk/mediatek/clk-mt8195-ipe.c          | 1 +
 drivers/clk/mediatek/clk-mt8195-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt8195-peri_ao.c      | 1 +
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c     | 1 +
 drivers/clk/mediatek/clk-mt8195-topckgen.c     | 1 +
 drivers/clk/mediatek/clk-mt8195-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8195-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c         | 1 +
 drivers/clk/mediatek/clk-mt8195-vpp1.c         | 1 +
 drivers/clk/mediatek/clk-mt8195-wpe.c          | 1 +
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8365-apu.c          | 1 +
 drivers/clk/mediatek/clk-mt8365-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8365-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt8365-mm.c           | 1 +
 drivers/clk/mediatek/clk-mt8365-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8365-venc.c         | 1 +
 drivers/clk/mediatek/clk-mt8365.c              | 1 +
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c   | 1 +
 drivers/clk/mediatek/clk-mt8516-aud.c          | 1 +
 drivers/clk/mediatek/clk-mt8516.c              | 1 +
 148 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index 113ab5b0bf8d..5cd343b98685 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -124,6 +124,7 @@ static const struct of_device_id of_match_clk_mt2701_aud[] = {
 	{ .compatible = "mediatek,mt2701-audsys", .data = &audio_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_aud);
 
 static int clk_mt2701_aud_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt2701-bdp.c b/drivers/clk/mediatek/clk-mt2701-bdp.c
index e7b43329d305..4c5b70d48df9 100644
--- a/drivers/clk/mediatek/clk-mt2701-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2701-bdp.c
@@ -95,6 +95,7 @@ static const struct of_device_id of_match_clk_mt2701_bdp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_bdp);
 
 static struct platform_driver clk_mt2701_bdp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index d30567ac4ff1..9a1fb0c93964 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -49,6 +49,7 @@ static const struct of_device_id of_match_clk_mt2701_eth[] = {
 	{ .compatible = "mediatek,mt2701-ethsys", .data = &eth_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_eth);
 
 static struct platform_driver clk_mt2701_eth_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index 6f881eabdc67..c0006861a317 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -48,6 +48,7 @@ static const struct of_device_id of_match_clk_mt2701_g3d[] = {
 	{ .compatible = "mediatek,mt2701-g3dsys", .data = &g3d_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_g3d);
 
 static struct platform_driver clk_mt2701_g3d_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index b2ee73c4de4e..ff7c0b3228e4 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -46,6 +46,7 @@ static const struct of_device_id of_match_clk_mt2701_hif[] = {
 	{ .compatible = "mediatek,mt2701-hifsys", .data = &hif_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_hif);
 
 static struct platform_driver clk_mt2701_hif_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-img.c b/drivers/clk/mediatek/clk-mt2701-img.c
index 35a5fd938a6e..baa1194eb01e 100644
--- a/drivers/clk/mediatek/clk-mt2701-img.c
+++ b/drivers/clk/mediatek/clk-mt2701-img.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt2701_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_img);
 
 static struct platform_driver clk_mt2701_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index 75611d0ab865..c62c56fd2b7e 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -76,6 +76,7 @@ static const struct platform_device_id clk_mt2701_mm_id_table[] = {
 	{ .name = "clk-mt2701-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt2701_mm_id_table);
 
 static struct platform_driver clk_mt2701_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
index dca4335a52a7..b7f97bc51c16 100644
--- a/drivers/clk/mediatek/clk-mt2701-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
@@ -48,6 +48,7 @@ static const struct of_device_id of_match_clk_mt2701_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_vdec);
 
 static struct platform_driver clk_mt2701_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index d3097d9f0c7a..4a154da8a543 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -999,6 +999,7 @@ static const struct of_device_id of_match_clk_mt2701[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2701);
 
 static int clk_mt2701_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 181d748cc0d1..0aefe31744e7 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -142,6 +142,7 @@ static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
 	{ .compatible = "mediatek,mt2712-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
 	.probe = clk_mt2712_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-bdp.c b/drivers/clk/mediatek/clk-mt2712-bdp.c
index d4979f2fb1d3..f78e01819316 100644
--- a/drivers/clk/mediatek/clk-mt2712-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2712-bdp.c
@@ -65,6 +65,7 @@ static const struct of_device_id of_match_clk_mt2712_bdp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_bdp);
 
 static struct platform_driver clk_mt2712_bdp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-img.c b/drivers/clk/mediatek/clk-mt2712-img.c
index cd2d2af6bd56..fbe7084886a0 100644
--- a/drivers/clk/mediatek/clk-mt2712-img.c
+++ b/drivers/clk/mediatek/clk-mt2712-img.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt2712_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_img);
 
 static struct platform_driver clk_mt2712_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-jpgdec.c b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
index 815be759e7c9..7e8c2ebcdee0 100644
--- a/drivers/clk/mediatek/clk-mt2712-jpgdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt2712_jpgdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_jpgdec);
 
 static struct platform_driver clk_mt2712_jpgdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-mfg.c b/drivers/clk/mediatek/clk-mt2712-mfg.c
index 9f958fadca86..932ea449d299 100644
--- a/drivers/clk/mediatek/clk-mt2712-mfg.c
+++ b/drivers/clk/mediatek/clk-mt2712-mfg.c
@@ -38,6 +38,7 @@ static const struct of_device_id of_match_clk_mt2712_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_mfg);
 
 static struct platform_driver clk_mt2712_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 2649d67f2a56..204a3eae08dc 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -117,6 +117,7 @@ static const struct platform_device_id clk_mt2712_mm_id_table[] = {
 	{ .name = "clk-mt2712-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt2712_mm_id_table);
 
 static struct platform_driver clk_mt2712_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-vdec.c b/drivers/clk/mediatek/clk-mt2712-vdec.c
index 1cb150fa7ab4..2fc1f82ebf5d 100644
--- a/drivers/clk/mediatek/clk-mt2712-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-vdec.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt2712_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_vdec);
 
 static struct platform_driver clk_mt2712_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712-venc.c b/drivers/clk/mediatek/clk-mt2712-venc.c
index 4073fa6c040f..6d053a00cf95 100644
--- a/drivers/clk/mediatek/clk-mt2712-venc.c
+++ b/drivers/clk/mediatek/clk-mt2712-venc.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt2712_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_venc);
 
 static struct platform_driver clk_mt2712_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index b2cf91622ebf..74c529f6163d 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -991,6 +991,7 @@ static const struct of_device_id of_match_clk_mt2712[] = {
 	{ .compatible = "mediatek,mt2712-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt2712);
 
 static struct platform_driver clk_mt2712_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-audio.c b/drivers/clk/mediatek/clk-mt6765-audio.c
index c1fecf22f8ad..9e98d6997329 100644
--- a/drivers/clk/mediatek/clk-mt6765-audio.c
+++ b/drivers/clk/mediatek/clk-mt6765-audio.c
@@ -65,6 +65,7 @@ static const struct of_device_id of_match_clk_mt6765_audio[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_audio);
 
 static struct platform_driver clk_mt6765_audio_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-cam.c b/drivers/clk/mediatek/clk-mt6765-cam.c
index 15737c8f6b69..6f6b29d8b29a 100644
--- a/drivers/clk/mediatek/clk-mt6765-cam.c
+++ b/drivers/clk/mediatek/clk-mt6765-cam.c
@@ -46,6 +46,7 @@ static const struct of_device_id of_match_clk_mt6765_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_cam);
 
 static struct platform_driver clk_mt6765_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-img.c b/drivers/clk/mediatek/clk-mt6765-img.c
index 7e421f4d01b8..984201077a20 100644
--- a/drivers/clk/mediatek/clk-mt6765-img.c
+++ b/drivers/clk/mediatek/clk-mt6765-img.c
@@ -42,6 +42,7 @@ static const struct of_device_id of_match_clk_mt6765_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_img);
 
 static struct platform_driver clk_mt6765_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-mipi0a.c b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
index 17186a308e94..a47937f4efe5 100644
--- a/drivers/clk/mediatek/clk-mt6765-mipi0a.c
+++ b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt6765_mipi0a[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_mipi0a);
 
 static struct platform_driver clk_mt6765_mipi0a_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-mm.c b/drivers/clk/mediatek/clk-mt6765-mm.c
index af2213db17cb..2b8fc052558e 100644
--- a/drivers/clk/mediatek/clk-mt6765-mm.c
+++ b/drivers/clk/mediatek/clk-mt6765-mm.c
@@ -68,6 +68,7 @@ static const struct of_device_id of_match_clk_mt6765_mm[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_mm);
 
 static struct platform_driver clk_mt6765_mm_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765-vcodec.c b/drivers/clk/mediatek/clk-mt6765-vcodec.c
index 48014cc71d9f..36df9615b1be 100644
--- a/drivers/clk/mediatek/clk-mt6765-vcodec.c
+++ b/drivers/clk/mediatek/clk-mt6765-vcodec.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_clk_mt6765_vcodec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_vcodec);
 
 static struct platform_driver clk_mt6765_vcodec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index 61f93b6fdf8b..fa7948ef1e68 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -840,6 +840,7 @@ static const struct of_device_id of_match_clk_mt6765[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6765);
 
 static int clk_mt6765_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 6e473ae1fd90..6e3280d3a2e6 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -102,6 +102,7 @@ static const struct of_device_id of_match_clk_mt6779_aud[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_aud);
 
 static struct platform_driver clk_mt6779_aud_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index 7be3db90fa4a..b4c4c7248672 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt6779_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_cam);
 
 static struct platform_driver clk_mt6779_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 9bc51fc82dbd..b760a8af3462 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt6779_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_img);
 
 static struct platform_driver clk_mt6779_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index 92e9d1ade422..9285a792c59b 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_clk_mt6779_ipe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_ipe);
 
 static struct platform_driver clk_mt6779_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index efc793a1969a..d20f32d4f827 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt6779_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_mfg);
 
 static struct platform_driver clk_mt6779_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 219a3a7920cd..c2f700ae6c2c 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -94,6 +94,7 @@ static const struct platform_device_id clk_mt6779_mm_id_table[] = {
 	{ .name = "clk-mt6779-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt6779_mm_id_table);
 
 static struct platform_driver clk_mt6779_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index 3209a6518d5b..e062ed5aa45f 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -52,6 +52,7 @@ static const struct of_device_id of_match_clk_mt6779_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_vdec);
 
 static struct platform_driver clk_mt6779_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index c25035c0f334..0ae8ac28f838 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt6779_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_venc);
 
 static struct platform_driver clk_mt6779_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 827025d127d9..1f5ea1508f61 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1299,6 +1299,7 @@ static const struct of_device_id of_match_clk_mt6779_infra[] = {
 	{ .compatible = "mediatek,mt6779-infracfg_ao", .data = &infra_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6779);
 
 static struct platform_driver clk_mt6779_infra_drv  = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 03fa30527868..8b30109f253c 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -131,6 +131,7 @@ static const struct of_device_id of_match_clk_mt6795_apmixed[] = {
 	{ .compatible = "mediatek,mt6795-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_apmixed);
 
 static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 23d9fc057e61..086ea1438564 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -81,6 +81,7 @@ static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
 	{ .compatible = "mediatek,mt6795-infracfg" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
 static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt6795-mfg.c b/drivers/clk/mediatek/clk-mt6795-mfg.c
index ee7aab24eb24..1d658bb19e82 100644
--- a/drivers/clk/mediatek/clk-mt6795-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-mfg.c
@@ -35,6 +35,7 @@ static const struct of_device_id of_match_clk_mt6795_mfg[] = {
 	{ .compatible = "mediatek,mt6795-mfgcfg", .data = &mfg_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_mfg);
 
 static struct platform_driver clk_mt6795_mfg_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt6795-mm.c b/drivers/clk/mediatek/clk-mt6795-mm.c
index c0c61a08cd72..8acc9cad2875 100644
--- a/drivers/clk/mediatek/clk-mt6795-mm.c
+++ b/drivers/clk/mediatek/clk-mt6795-mm.c
@@ -85,6 +85,7 @@ static const struct platform_device_id clk_mt6795_mm_id_table[] = {
 	{ .name = "clk-mt6795-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt6795_mm_id_table);
 
 static struct platform_driver clk_mt6795_mm_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index 08aaa9b09c36..62cc19eee2c7 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -89,6 +89,7 @@ static const struct of_device_id of_match_clk_mt6795_pericfg[] = {
 	{ .compatible = "mediatek,mt6795-pericfg" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_pericfg);
 
 static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt6795-topckgen.c b/drivers/clk/mediatek/clk-mt6795-topckgen.c
index e80fa588e309..9c6d63a80b19 100644
--- a/drivers/clk/mediatek/clk-mt6795-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt6795-topckgen.c
@@ -539,6 +539,7 @@ static const struct of_device_id of_match_clk_mt6795_topckgen[] = {
 	{ .compatible = "mediatek,mt6795-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_topckgen);
 
 static struct platform_driver clk_mt6795_topckgen_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt6795-vdecsys.c b/drivers/clk/mediatek/clk-mt6795-vdecsys.c
index d85d04e0d016..f2968f859dca 100644
--- a/drivers/clk/mediatek/clk-mt6795-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-vdecsys.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt6795_vdecsys[] = {
 	{ .compatible = "mediatek,mt6795-vdecsys", .data = &vdec_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_vdecsys);
 
 static struct platform_driver clk_mt6795_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6795-vencsys.c b/drivers/clk/mediatek/clk-mt6795-vencsys.c
index de40a982ca96..2f8d48da1a85 100644
--- a/drivers/clk/mediatek/clk-mt6795-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-vencsys.c
@@ -35,6 +35,7 @@ static const struct of_device_id of_match_clk_mt6795_vencsys[] = {
 	{ .compatible = "mediatek,mt6795-vencsys", .data = &venc_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_vencsys);
 
 static struct platform_driver clk_mt6795_vencsys_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 22779829370f..00fc0a03e646 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt6797_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_img);
 
 static struct platform_driver clk_mt6797_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index 8722fae10de9..caacfa40a5bc 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -89,6 +89,7 @@ static const struct platform_device_id clk_mt6797_mm_id_table[] = {
 	{ .name = "clk-mt6797-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt6797_mm_id_table);
 
 static struct platform_driver clk_mt6797_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index c5a82d4a958b..447fe6fa8e15 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -50,6 +50,7 @@ static const struct of_device_id of_match_clk_mt6797_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_vdec);
 
 static struct platform_driver clk_mt6797_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index afdd288d313a..95b89ff8fd19 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_clk_mt6797_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_venc);
 
 static struct platform_driver clk_mt6797_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 4094fd75d16e..4c87c0348e5f 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -670,6 +670,7 @@ static const struct of_device_id of_match_clk_mt6797[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6797);
 
 static int clk_mt6797_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 497fada797b9..1e938801ce51 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -123,6 +123,7 @@ static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
 	{ .compatible = "mediatek,mt7622-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_apmixed);
 
 static struct platform_driver clk_mt7622_apmixed_drv = {
 	.probe = clk_mt7622_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index 4e14a4ff465a..dd1799dd8435 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -145,6 +145,7 @@ static const struct of_device_id of_match_clk_mt7622_aud[] = {
 	{ .compatible = "mediatek,mt7622-audsys", .data = &audio_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_aud);
 
 static struct platform_driver clk_mt7622_aud_drv = {
 	.probe = clk_mt7622_aud_probe,
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index 4475d0846176..f96b36737029 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -77,6 +77,7 @@ static const struct of_device_id of_match_clk_mt7622_eth[] = {
 	{ .compatible = "mediatek,mt7622-sgmiisys", .data = &sgmii_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_eth);
 
 static struct platform_driver clk_mt7622_eth_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index 19f394af1132..f440943f0d46 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -89,6 +89,7 @@ static const struct of_device_id of_match_clk_mt7622_hif[] = {
 	{ .compatible = "mediatek,mt7622-ssusbsys", .data = &ssusb_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_hif);
 
 static struct platform_driver clk_mt7622_hif_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index 09d8ac4d483a..9dc05526f287 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -55,6 +55,7 @@ static const struct of_device_id of_match_clk_mt7622_infracfg[] = {
 	{ .compatible = "mediatek,mt7622-infracfg" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_infracfg);
 
 static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 7a002b73fcaa..274895264427 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -518,6 +518,7 @@ static const struct of_device_id of_match_clk_mt7622[] = {
 	{ .compatible = "mediatek,mt7622-pericfg", .data = &peri_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7622);
 
 static struct platform_driver clk_mt7622_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt7629-eth.c b/drivers/clk/mediatek/clk-mt7629-eth.c
index 72edcb80fd18..0facf62f0fa5 100644
--- a/drivers/clk/mediatek/clk-mt7629-eth.c
+++ b/drivers/clk/mediatek/clk-mt7629-eth.c
@@ -126,6 +126,7 @@ static const struct of_device_id of_match_clk_mt7629_eth[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7629_eth);
 
 static int clk_mt7629_eth_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index 464c4131d98a..c89036bee9a7 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -84,6 +84,7 @@ static const struct of_device_id of_match_clk_mt7629_hif[] = {
 	{ .compatible = "mediatek,mt7629-ssusbsys", .data = &ssusb_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7629_hif);
 
 static struct platform_driver clk_mt7629_hif_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index f3279f002e93..0893fbbb68cc 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -660,6 +660,7 @@ static const struct of_device_id of_match_clk_mt7629[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7629);
 
 static int clk_mt7629_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 53c974c66f89..875813d8b4a9 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -66,6 +66,7 @@ static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
 	{ .compatible = "mediatek,mt7981-apmixedsys", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
 static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7981-eth.c b/drivers/clk/mediatek/clk-mt7981-eth.c
index f27fadd6bf94..b1f256b5ed4e 100644
--- a/drivers/clk/mediatek/clk-mt7981-eth.c
+++ b/drivers/clk/mediatek/clk-mt7981-eth.c
@@ -105,6 +105,7 @@ static const struct of_device_id of_match_clk_mt7981_eth[] = {
 	{ .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_eth);
 
 static struct platform_driver clk_mt7981_eth_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
index d1709323d34e..293261ef71e6 100644
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -195,6 +195,7 @@ static const struct of_device_id of_match_clk_mt7981_infracfg[] = {
 	{ .compatible = "mediatek,mt7981-infracfg", .data = &infracfg_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_infracfg);
 
 static struct platform_driver clk_mt7981_infracfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7981-topckgen.c b/drivers/clk/mediatek/clk-mt7981-topckgen.c
index e09ffc22b13a..3aba1a9b9a36 100644
--- a/drivers/clk/mediatek/clk-mt7981-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7981-topckgen.c
@@ -410,6 +410,7 @@ static const struct of_device_id of_match_clk_mt7981_topckgen[] = {
 	{ .compatible = "mediatek,mt7981-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_topckgen);
 
 static struct platform_driver clk_mt7981_topckgen_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index dc949ed1b587..6767e9c43886 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -62,8 +62,9 @@ static const struct mtk_pll_data plls[] = {
 
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
 	{ .compatible = "mediatek,mt7986-apmixedsys", },
-	{}
+	{ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
 static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
index 138ba0a47221..0681988960cc 100644
--- a/drivers/clk/mediatek/clk-mt7986-eth.c
+++ b/drivers/clk/mediatek/clk-mt7986-eth.c
@@ -86,6 +86,7 @@ static const struct of_device_id of_match_clk_mt7986_eth[] = {
 	{ .compatible = "mediatek,mt7986-sgmiisys_1", .data = &sgmii1_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_eth);
 
 static struct platform_driver clk_mt7986_eth_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 0299faad0733..b7efa70c2d6c 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -171,6 +171,7 @@ static const struct of_device_id of_match_clk_mt7986_infracfg[] = {
 	{ .compatible = "mediatek,mt7986-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_infracfg);
 
 static struct platform_driver clk_mt7986_infracfg_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index af9df453d6d7..fbca3feded8f 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -304,6 +304,7 @@ static const struct of_device_id of_match_clk_mt7986_topckgen[] = {
 	{ .compatible = "mediatek,mt7986-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_topckgen);
 
 static struct platform_driver clk_mt7986_topckgen_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index 5d8b5093ed02..fca41f50d6ba 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -132,6 +132,7 @@ static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
 	.probe = clk_mt8167_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-aud.c b/drivers/clk/mediatek/clk-mt8167-aud.c
index 63736642f383..86125635c8a6 100644
--- a/drivers/clk/mediatek/clk-mt8167-aud.c
+++ b/drivers/clk/mediatek/clk-mt8167-aud.c
@@ -52,6 +52,7 @@ static const struct of_device_id of_match_clk_mt8167_audsys[] = {
 	{ .compatible = "mediatek,mt8167-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_audsys);
 
 static struct platform_driver clk_mt8167_audsys_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-img.c b/drivers/clk/mediatek/clk-mt8167-img.c
index c2537e149aa8..315b7f64bad6 100644
--- a/drivers/clk/mediatek/clk-mt8167-img.c
+++ b/drivers/clk/mediatek/clk-mt8167-img.c
@@ -44,6 +44,7 @@ static const struct of_device_id of_match_clk_mt8167_imgsys[] = {
 	{ .compatible = "mediatek,mt8167-imgsys", .data = &img_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_imgsys);
 
 static struct platform_driver clk_mt8167_imgsys_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-mfgcfg.c b/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
index 340c608e7ddb..4851f5bf3a90 100644
--- a/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
@@ -42,6 +42,7 @@ static const struct of_device_id of_match_clk_mt8167_mfgcfg[] = {
 	{ .compatible = "mediatek,mt8167-mfgcfg", .data = &mfg_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_mfgcfg);
 
 static struct platform_driver clk_mt8167_mfgcfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-mm.c b/drivers/clk/mediatek/clk-mt8167-mm.c
index 0344f9c98d36..4e053c61315d 100644
--- a/drivers/clk/mediatek/clk-mt8167-mm.c
+++ b/drivers/clk/mediatek/clk-mt8167-mm.c
@@ -83,6 +83,7 @@ static const struct platform_device_id clk_mt8167_mm_id_table[] = {
 	{ .name = "clk-mt8167-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8167_mm_id_table);
 
 static struct platform_driver clk_mt8167_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167-vdec.c b/drivers/clk/mediatek/clk-mt8167-vdec.c
index 35b0380f22dc..76900f393d31 100644
--- a/drivers/clk/mediatek/clk-mt8167-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8167-vdec.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt8167_vdec[] = {
 	{ .compatible = "mediatek,mt8167-vdecsys", .data = &vdec_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_vdec);
 
 static struct platform_driver clk_mt8167_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index d9a837686865..b9041f79cbbd 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -883,6 +883,7 @@ static const struct of_device_id of_match_clk_mt8167[] = {
 	{ .compatible = "mediatek,mt8167-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8167);
 
 static struct platform_driver clk_mt8167_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index 0084203e67ad..8c2aa8b0f39e 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -135,6 +135,7 @@ static const struct of_device_id of_match_clk_mt8173_apmixed[] = {
 	{ .compatible = "mediatek,mt8173-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_apmixed);
 
 static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt8173-img.c b/drivers/clk/mediatek/clk-mt8173-img.c
index 7b50ffb7a8a5..6db2b9ab2bc9 100644
--- a/drivers/clk/mediatek/clk-mt8173-img.c
+++ b/drivers/clk/mediatek/clk-mt8173-img.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt8173_imgsys[] = {
 	{ .compatible = "mediatek,mt8173-imgsys", .data = &img_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_imgsys);
 
 static struct platform_driver clk_mt8173_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 729b3c408c7b..4ed5043076ec 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -74,6 +74,7 @@ static const struct of_device_id of_match_clk_mt8173_infracfg[] = {
 	{ .compatible = "mediatek,mt8173-infracfg" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_infracfg);
 
 static void clk_mt8173_infra_init_early(struct device_node *node)
 {
diff --git a/drivers/clk/mediatek/clk-mt8173-mm.c b/drivers/clk/mediatek/clk-mt8173-mm.c
index ba51c22cbe7a..18e466dbf610 100644
--- a/drivers/clk/mediatek/clk-mt8173-mm.c
+++ b/drivers/clk/mediatek/clk-mt8173-mm.c
@@ -98,6 +98,7 @@ static const struct platform_device_id clk_mt8173_mm_id_table[] = {
 	{ .name = "clk-mt8173-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8173_mm_id_table);
 
 static struct platform_driver clk_mt8173_mm_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8173-pericfg.c b/drivers/clk/mediatek/clk-mt8173-pericfg.c
index e87294b72c2c..bebda74d0f43 100644
--- a/drivers/clk/mediatek/clk-mt8173-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-pericfg.c
@@ -107,6 +107,7 @@ static const struct of_device_id of_match_clk_mt8173_pericfg[] = {
 	{ .compatible = "mediatek,mt8173-pericfg", .data = &peri_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_pericfg);
 
 static struct platform_driver clk_mt8173_pericfg_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8173-topckgen.c b/drivers/clk/mediatek/clk-mt8173-topckgen.c
index 257961528fe2..baa8fd6cb312 100644
--- a/drivers/clk/mediatek/clk-mt8173-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8173-topckgen.c
@@ -638,6 +638,7 @@ static const struct of_device_id of_match_clk_mt8173_topckgen[] = {
 	{ .compatible = "mediatek,mt8173-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_topckgen);
 
 static struct platform_driver clk_mt8173_topckgen_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8173-vdecsys.c b/drivers/clk/mediatek/clk-mt8173-vdecsys.c
index 5105b8e0969d..625ca0b09cc2 100644
--- a/drivers/clk/mediatek/clk-mt8173-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-vdecsys.c
@@ -42,6 +42,7 @@ static const struct of_device_id of_match_clk_mt8173_vdecsys[] = {
 	{ .compatible = "mediatek,mt8173-vdecsys", .data = &vdec_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_vdecsys);
 
 static struct platform_driver clk_mt8173_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8173-vencsys.c b/drivers/clk/mediatek/clk-mt8173-vencsys.c
index ff4f1cb735de..87755dd1a337 100644
--- a/drivers/clk/mediatek/clk-mt8173-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-vencsys.c
@@ -49,6 +49,7 @@ static const struct of_device_id of_match_clk_mt8173_vencsys[] = {
 	{ .compatible = "mediatek,mt8173-vencltsys", .data = &venc_lt_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_vencsys);
 
 static struct platform_driver clk_mt8173_vencsys_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
index 5addda17211f..2b261c0e2b61 100644
--- a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
@@ -182,6 +182,7 @@ static const struct of_device_id of_match_clk_mt8183_apmixed[] = {
 	{ .compatible = "mediatek,mt8183-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_apmixed);
 
 static struct platform_driver clk_mt8183_apmixed_drv = {
 	.probe = clk_mt8183_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index fe510f02dadb..9938c6466e76 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -97,6 +97,7 @@ static const struct of_device_id of_match_clk_mt8183_audio[] = {
 	{ .compatible = "mediatek,mt8183-audiosys", .data = &audio_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_audio);
 
 static struct platform_driver clk_mt8183_audio_drv = {
 	.probe = clk_mt8183_audio_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-cam.c b/drivers/clk/mediatek/clk-mt8183-cam.c
index 7ecbfc50e8fe..c0719624004f 100644
--- a/drivers/clk/mediatek/clk-mt8183-cam.c
+++ b/drivers/clk/mediatek/clk-mt8183-cam.c
@@ -47,6 +47,7 @@ static const struct of_device_id of_match_clk_mt8183_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_cam);
 
 static struct platform_driver clk_mt8183_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-img.c b/drivers/clk/mediatek/clk-mt8183-img.c
index e75d6e6205f9..55fc80615724 100644
--- a/drivers/clk/mediatek/clk-mt8183-img.c
+++ b/drivers/clk/mediatek/clk-mt8183-img.c
@@ -47,6 +47,7 @@ static const struct of_device_id of_match_clk_mt8183_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_img);
 
 static struct platform_driver clk_mt8183_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu0.c b/drivers/clk/mediatek/clk-mt8183-ipu0.c
index d1dd76e7eafd..59255eab6fe2 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu0.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu0.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt8183_ipu_core0[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_core0);
 
 static struct platform_driver clk_mt8183_ipu_core0_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu1.c b/drivers/clk/mediatek/clk-mt8183-ipu1.c
index 0b4906cca119..c4baa052c809 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu1.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu1.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt8183_ipu_core1[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_core1);
 
 static struct platform_driver clk_mt8183_ipu_core1_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
index 32a82ec965ef..74866e9c50d7 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
@@ -38,6 +38,7 @@ static const struct of_device_id of_match_clk_mt8183_ipu_adl[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_adl);
 
 static struct platform_driver clk_mt8183_ipu_adl_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
index 1e2ebc0eab8b..bd7303105357 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
@@ -107,6 +107,7 @@ static const struct of_device_id of_match_clk_mt8183_ipu_conn[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_conn);
 
 static struct platform_driver clk_mt8183_ipu_conn_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index 20cdbd74817f..816ecf1191ee 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8183_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_mfg);
 
 static struct platform_driver clk_mt8183_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
index a76e44ebf322..2f99828bff1b 100644
--- a/drivers/clk/mediatek/clk-mt8183-mm.c
+++ b/drivers/clk/mediatek/clk-mt8183-mm.c
@@ -91,6 +91,7 @@ static const struct platform_device_id clk_mt8183_mm_id_table[] = {
 	{ .name = "clk-mt8183-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8183_mm_id_table);
 
 static struct platform_driver clk_mt8183_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 0182745e2a18..513b7956cbea 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt8183_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_vdec);
 
 static struct platform_driver clk_mt8183_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183-venc.c b/drivers/clk/mediatek/clk-mt8183-venc.c
index c840e6ebe375..532f6e12a561 100644
--- a/drivers/clk/mediatek/clk-mt8183-venc.c
+++ b/drivers/clk/mediatek/clk-mt8183-venc.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt8183_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_venc);
 
 static struct platform_driver clk_mt8183_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 5ae0f1f9ca0a..2336a1b69c09 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -868,6 +868,7 @@ static const struct of_device_id of_match_clk_mt8183[] = {
 	{ .compatible = "mediatek,mt8183-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8183);
 
 static struct platform_driver clk_mt8183_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index e429d2cdc84a..da7950d51c64 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -136,6 +136,7 @@ static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
 	{ .compatible = "mediatek,mt8186-apmixedsys", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_apmixed);
 
 static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt8186-cam.c b/drivers/clk/mediatek/clk-mt8186-cam.c
index 90d91d045909..656d9e6f3ee2 100644
--- a/drivers/clk/mediatek/clk-mt8186-cam.c
+++ b/drivers/clk/mediatek/clk-mt8186-cam.c
@@ -78,6 +78,7 @@ static const struct of_device_id of_match_clk_mt8186_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_cam);
 
 static struct platform_driver clk_mt8186_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-img.c b/drivers/clk/mediatek/clk-mt8186-img.c
index 11314dba4e41..754b27f03817 100644
--- a/drivers/clk/mediatek/clk-mt8186-img.c
+++ b/drivers/clk/mediatek/clk-mt8186-img.c
@@ -56,6 +56,7 @@ static const struct of_device_id of_match_clk_mt8186_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_img);
 
 static struct platform_driver clk_mt8186_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
index f8d1ee294f09..7619c357b150 100644
--- a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
@@ -55,6 +55,7 @@ static const struct of_device_id of_match_clk_mt8186_imp_iic_wrap[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_imp_iic_wrap);
 
 static struct platform_driver clk_mt8186_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-infra_ao.c b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
index 766c8e6bcf8d..a907a5def5b8 100644
--- a/drivers/clk/mediatek/clk-mt8186-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
@@ -227,6 +227,7 @@ static const struct of_device_id of_match_clk_mt8186_infra_ao[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_infra_ao);
 
 static struct platform_driver clk_mt8186_infra_ao_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-ipe.c b/drivers/clk/mediatek/clk-mt8186-ipe.c
index 0876440839df..50e340035aa7 100644
--- a/drivers/clk/mediatek/clk-mt8186-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8186-ipe.c
@@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt8186_ipe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_ipe);
 
 static struct platform_driver clk_mt8186_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
index 895856df95df..d1640e4dc2ad 100644
--- a/drivers/clk/mediatek/clk-mt8186-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -52,6 +52,7 @@ static const struct of_device_id of_match_clk_mt8186_mcu[] = {
 	{ .compatible = "mediatek,mt8186-mcusys", .data = &mcu_desc },
 	{ /* sentinel */}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_mcu);
 
 static struct platform_driver clk_mt8186_mcu_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8186-mdp.c b/drivers/clk/mediatek/clk-mt8186-mdp.c
index 194f20f16f8c..e1d19007e375 100644
--- a/drivers/clk/mediatek/clk-mt8186-mdp.c
+++ b/drivers/clk/mediatek/clk-mt8186-mdp.c
@@ -68,6 +68,7 @@ static const struct of_device_id of_match_clk_mt8186_mdp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_mdp);
 
 static struct platform_driver clk_mt8186_mdp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-mfg.c b/drivers/clk/mediatek/clk-mt8186-mfg.c
index f16d3c44ef41..aeb098b54585 100644
--- a/drivers/clk/mediatek/clk-mt8186-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8186-mfg.c
@@ -37,6 +37,7 @@ static const struct of_device_id of_match_clk_mt8186_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_mfg);
 
 static struct platform_driver clk_mt8186_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-mm.c b/drivers/clk/mediatek/clk-mt8186-mm.c
index 9e9853a2ea91..fc3bb6d1f714 100644
--- a/drivers/clk/mediatek/clk-mt8186-mm.c
+++ b/drivers/clk/mediatek/clk-mt8186-mm.c
@@ -67,6 +67,8 @@ static const struct platform_device_id clk_mt8186_mm_id_table[] = {
 	{ .name = "clk-mt8186-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8186_mm_id_table);
+
 static struct platform_driver clk_mt8186_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
 	.remove = mtk_clk_pdev_remove,
diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index a48172d9c5ab..1a0340a20beb 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -721,6 +721,7 @@ static const struct of_device_id of_match_clk_mt8186_topck[] = {
 	{ .compatible = "mediatek,mt8186-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_topck);
 
 static struct platform_driver clk_mt8186_topck_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-vdec.c b/drivers/clk/mediatek/clk-mt8186-vdec.c
index 877ca9d8ff65..9bf3b8632870 100644
--- a/drivers/clk/mediatek/clk-mt8186-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8186-vdec.c
@@ -76,6 +76,7 @@ static const struct of_device_id of_match_clk_mt8186_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_vdec);
 
 static struct platform_driver clk_mt8186_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-venc.c b/drivers/clk/mediatek/clk-mt8186-venc.c
index a89e82285d4c..0c1bc94e84cf 100644
--- a/drivers/clk/mediatek/clk-mt8186-venc.c
+++ b/drivers/clk/mediatek/clk-mt8186-venc.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8186_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_venc);
 
 static struct platform_driver clk_mt8186_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8186-wpe.c b/drivers/clk/mediatek/clk-mt8186-wpe.c
index fba55f08129c..c4727b1cb64d 100644
--- a/drivers/clk/mediatek/clk-mt8186-wpe.c
+++ b/drivers/clk/mediatek/clk-mt8186-wpe.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8186_wpe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_wpe);
 
 static struct platform_driver clk_mt8186_wpe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index 1e6988d5289a..eafd34297b9a 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -147,6 +147,7 @@ static const struct of_device_id of_match_clk_mt8192_apmixed[] = {
 	{ .compatible = "mediatek,mt8192-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_apmixed);
 
 static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index 9b14d8514b4f..ee251492d4f1 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -107,6 +107,7 @@ static const struct of_device_id of_match_clk_mt8192_aud[] = {
 	{ .compatible = "mediatek,mt8192-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_aud);
 
 static struct platform_driver clk_mt8192_aud_drv = {
 	.probe = clk_mt8192_aud_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-cam.c b/drivers/clk/mediatek/clk-mt8192-cam.c
index 321693aff33f..7befd6ee8c79 100644
--- a/drivers/clk/mediatek/clk-mt8192-cam.c
+++ b/drivers/clk/mediatek/clk-mt8192-cam.c
@@ -95,6 +95,7 @@ static const struct of_device_id of_match_clk_mt8192_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_cam);
 
 static struct platform_driver clk_mt8192_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
index b2c148ead7f8..a7505150a9d0 100644
--- a/drivers/clk/mediatek/clk-mt8192-img.c
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -58,6 +58,7 @@ static const struct of_device_id of_match_clk_mt8192_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_img);
 
 static struct platform_driver clk_mt8192_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
index fd731eb6d62e..cd5d00a7c54b 100644
--- a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
@@ -107,6 +107,7 @@ static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_imp_iic_wrap);
 
 static struct platform_driver clk_mt8192_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-ipe.c b/drivers/clk/mediatek/clk-mt8192-ipe.c
index 3fd37977ea16..dee671ae38e6 100644
--- a/drivers/clk/mediatek/clk-mt8192-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8192-ipe.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_clk_mt8192_ipe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_ipe);
 
 static struct platform_driver clk_mt8192_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-mdp.c b/drivers/clk/mediatek/clk-mt8192-mdp.c
index 817e8bf4543b..f7b27264e378 100644
--- a/drivers/clk/mediatek/clk-mt8192-mdp.c
+++ b/drivers/clk/mediatek/clk-mt8192-mdp.c
@@ -70,6 +70,7 @@ static const struct of_device_id of_match_clk_mt8192_mdp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_mdp);
 
 static struct platform_driver clk_mt8192_mdp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
index 7f77e2d8b765..85f76a2bbac4 100644
--- a/drivers/clk/mediatek/clk-mt8192-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt8192_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_mfg);
 
 static struct platform_driver clk_mt8192_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
index 3e81018a038b..47335d517714 100644
--- a/drivers/clk/mediatek/clk-mt8192-mm.c
+++ b/drivers/clk/mediatek/clk-mt8192-mm.c
@@ -89,6 +89,7 @@ static const struct platform_device_id clk_mt8192_mm_id_table[] = {
 	{ .name = "clk-mt8192-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8192_mm_id_table);
 
 static struct platform_driver clk_mt8192_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
index cde8c88673e4..60d65f96d39a 100644
--- a/drivers/clk/mediatek/clk-mt8192-msdc.c
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -52,6 +52,7 @@ static const struct of_device_id of_match_clk_mt8192_msdc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_msdc);
 
 static struct platform_driver clk_mt8192_msdc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
index df086b95d447..6aad57797c39 100644
--- a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
+++ b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
@@ -38,6 +38,7 @@ static const struct of_device_id of_match_clk_mt8192_scp_adsp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_scp_adsp);
 
 static struct platform_driver clk_mt8192_scp_adsp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
index 2ea8b6d4d405..473afd58495c 100644
--- a/drivers/clk/mediatek/clk-mt8192-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -82,6 +82,7 @@ static const struct of_device_id of_match_clk_mt8192_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_vdec);
 
 static struct platform_driver clk_mt8192_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192-venc.c b/drivers/clk/mediatek/clk-mt8192-venc.c
index d73c12bc2ae9..57b1b16e2310 100644
--- a/drivers/clk/mediatek/clk-mt8192-venc.c
+++ b/drivers/clk/mediatek/clk-mt8192-venc.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_clk_mt8192_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_venc);
 
 static struct platform_driver clk_mt8192_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 45eccda51471..aa11291463f7 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1019,6 +1019,7 @@ static const struct of_device_id of_match_clk_mt8192[] = {
 	{ .compatible = "mediatek,mt8192-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8192);
 
 static struct platform_driver clk_mt8192_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 75cc4d7a39f9..8b9b5d820286 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -166,6 +166,7 @@ static const struct of_device_id of_match_clk_mt8195_apmixed[] = {
 	{ .compatible = "mediatek,mt8195-apmixedsys", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apmixed);
 
 static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 {
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index b167b8d31bcc..de04c087c8c3 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -101,6 +101,7 @@ static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 	{ .compatible = "mediatek,mt8195-apusys_pll", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apusys_pll);
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
 	.probe = clk_mt8195_apusys_pll_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-cam.c b/drivers/clk/mediatek/clk-mt8195-cam.c
index c515650214bd..77e608be579a 100644
--- a/drivers/clk/mediatek/clk-mt8195-cam.c
+++ b/drivers/clk/mediatek/clk-mt8195-cam.c
@@ -131,6 +131,7 @@ static const struct of_device_id of_match_clk_mt8195_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_cam);
 
 static struct platform_driver clk_mt8195_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-ccu.c b/drivers/clk/mediatek/clk-mt8195-ccu.c
index a86f848a785d..bdc2e6f3e9ce 100644
--- a/drivers/clk/mediatek/clk-mt8195-ccu.c
+++ b/drivers/clk/mediatek/clk-mt8195-ccu.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8195_ccu[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_ccu);
 
 static struct platform_driver clk_mt8195_ccu_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-img.c b/drivers/clk/mediatek/clk-mt8195-img.c
index 214baa2bc974..d853e0e63d87 100644
--- a/drivers/clk/mediatek/clk-mt8195-img.c
+++ b/drivers/clk/mediatek/clk-mt8195-img.c
@@ -85,6 +85,7 @@ static const struct of_device_id of_match_clk_mt8195_img[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_img);
 
 static struct platform_driver clk_mt8195_img_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
index 191f482186ae..1d808876f5c5 100644
--- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -55,6 +55,7 @@ static const struct of_device_id of_match_clk_mt8195_imp_iic_wrap[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_imp_iic_wrap);
 
 static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 6ad72a320d5e..f3ee4390707d 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -229,6 +229,7 @@ static const struct of_device_id of_match_clk_mt8195_infra_ao[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_infra_ao);
 
 static struct platform_driver clk_mt8195_infra_ao_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-ipe.c b/drivers/clk/mediatek/clk-mt8195-ipe.c
index b547a99b4ad9..4c47f6521275 100644
--- a/drivers/clk/mediatek/clk-mt8195-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8195-ipe.c
@@ -40,6 +40,7 @@ static const struct of_device_id of_match_clk_mt8195_ipe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_ipe);
 
 static struct platform_driver clk_mt8195_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
index 75cf643ab885..038acf0b1167 100644
--- a/drivers/clk/mediatek/clk-mt8195-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
@@ -38,6 +38,7 @@ static const struct of_device_id of_match_clk_mt8195_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_mfg);
 
 static struct platform_driver clk_mt8195_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-peri_ao.c b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
index 7d65a478182d..0de162593c01 100644
--- a/drivers/clk/mediatek/clk-mt8195-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt8195_peri_ao[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_peri_ao);
 
 static struct platform_driver clk_mt8195_peri_ao_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
index 24e09339ed7d..d0d3e3b09780 100644
--- a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
+++ b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
@@ -36,6 +36,7 @@ static const struct of_device_id of_match_clk_mt8195_scp_adsp[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_scp_adsp);
 
 static struct platform_driver clk_mt8195_scp_adsp_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index adc6bb7ce750..3c2174c3e742 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1219,6 +1219,7 @@ static const struct of_device_id of_match_clk_mt8195_topck[] = {
 	{ .compatible = "mediatek,mt8195-topckgen", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_topck);
 
 /* Register mux notifier for MFG mux */
 static int clk_mt8195_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c b/drivers/clk/mediatek/clk-mt8195-vdec.c
index f9e2bd402627..2bcbceb10326 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
@@ -93,6 +93,7 @@ static const struct of_device_id of_match_clk_mt8195_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_vdec);
 
 static struct platform_driver clk_mt8195_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
index d050d87bb3f2..0991a6968765 100644
--- a/drivers/clk/mediatek/clk-mt8195-venc.c
+++ b/drivers/clk/mediatek/clk-mt8195-venc.c
@@ -58,6 +58,7 @@ static const struct of_device_id of_match_clk_mt8195_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_venc);
 
 static struct platform_driver clk_mt8195_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
index 84805a114387..3d1ad92b663e 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -95,6 +95,7 @@ static const struct platform_device_id clk_mt8195_vpp0_id_table[] = {
 	{ .name = "clk-mt8195-vpp0", .driver_data = (kernel_ulong_t)&vpp0_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp0);
 
 static struct platform_driver clk_mt8195_vpp0_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
index 3e91dfed2996..b463f8e197c6 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
@@ -93,6 +93,7 @@ static const struct platform_device_id clk_mt8195_vpp1_id_table[] = {
 	{ .name = "clk-mt8195-vpp1", .driver_data = (kernel_ulong_t)&vpp1_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp1);
 
 static struct platform_driver clk_mt8195_vpp1_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8195-wpe.c b/drivers/clk/mediatek/clk-mt8195-wpe.c
index 52cebe297abf..289896cb2f6c 100644
--- a/drivers/clk/mediatek/clk-mt8195-wpe.c
+++ b/drivers/clk/mediatek/clk-mt8195-wpe.c
@@ -132,6 +132,7 @@ static const struct of_device_id of_match_clk_mt8195_wpe[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_wpe);
 
 static struct platform_driver clk_mt8195_wpe_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
index 55faa4e37116..9b0bc5daeac0 100644
--- a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
@@ -153,6 +153,7 @@ static const struct of_device_id of_match_clk_mt8365_apmixed[] = {
 	{ .compatible = "mediatek,mt8365-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_apmixed);
 
 static struct platform_driver clk_mt8365_apmixed_drv = {
 	.probe = clk_mt8365_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-apu.c b/drivers/clk/mediatek/clk-mt8365-apu.c
index 5a594f8eccdc..74f7fb22c87f 100644
--- a/drivers/clk/mediatek/clk-mt8365-apu.c
+++ b/drivers/clk/mediatek/clk-mt8365-apu.c
@@ -42,6 +42,7 @@ static const struct of_device_id of_match_clk_mt8365_apu[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_apu);
 
 static struct platform_driver clk_mt8365_apu_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-cam.c b/drivers/clk/mediatek/clk-mt8365-cam.c
index ed1d8dd7043c..61516e19acd1 100644
--- a/drivers/clk/mediatek/clk-mt8365-cam.c
+++ b/drivers/clk/mediatek/clk-mt8365-cam.c
@@ -44,6 +44,7 @@ static const struct of_device_id of_match_clk_mt8365_cam[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_cam);
 
 static struct platform_driver clk_mt8365_cam_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-mfg.c b/drivers/clk/mediatek/clk-mt8365-mfg.c
index b3d10b017f0d..4c836c69db4f 100644
--- a/drivers/clk/mediatek/clk-mt8365-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8365-mfg.c
@@ -50,6 +50,7 @@ static const struct of_device_id of_match_clk_mt8365_mfg[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_mfg);
 
 static struct platform_driver clk_mt8365_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 7ae33997ba86..44427120846f 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -81,6 +81,7 @@ static const struct platform_device_id clk_mt8365_mm_id_table[] = {
 	{ .name = "clk-mt8365-mm", .driver_data = (kernel_ulong_t)&mm_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(platform, clk_mt8365_mm_id_table);
 
 static struct platform_driver clk_mt8365_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-vdec.c b/drivers/clk/mediatek/clk-mt8365-vdec.c
index d5caddcc5932..b51571e9da00 100644
--- a/drivers/clk/mediatek/clk-mt8365-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8365-vdec.c
@@ -50,6 +50,7 @@ static const struct of_device_id of_match_clk_mt8365_vdec[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_vdec);
 
 static struct platform_driver clk_mt8365_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365-venc.c b/drivers/clk/mediatek/clk-mt8365-venc.c
index 08b7c0ee52e7..572344645c86 100644
--- a/drivers/clk/mediatek/clk-mt8365-venc.c
+++ b/drivers/clk/mediatek/clk-mt8365-venc.c
@@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8365_venc[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_venc);
 
 static struct platform_driver clk_mt8365_venc_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 208cdc157918..6b4e193f648d 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -791,6 +791,7 @@ static const struct of_device_id of_match_clk_mt8365[] = {
 	{ .compatible = "mediatek,mt8365-mcucfg", .data = &mcu_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8365);
 
 static struct platform_driver clk_mt8365_drv = {
 	.driver = {
diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
index 5b87c9fb81f5..edd9174d2f2f 100644
--- a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
@@ -107,6 +107,7 @@ static const struct of_device_id of_match_clk_mt8516_apmixed[] = {
 	{ .compatible = "mediatek,mt8516-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_apmixed);
 
 static struct platform_driver clk_mt8516_apmixed_drv = {
 	.probe = clk_mt8516_apmixed_probe,
diff --git a/drivers/clk/mediatek/clk-mt8516-aud.c b/drivers/clk/mediatek/clk-mt8516-aud.c
index 5f34487aad7e..48340fc7430d 100644
--- a/drivers/clk/mediatek/clk-mt8516-aud.c
+++ b/drivers/clk/mediatek/clk-mt8516-aud.c
@@ -51,6 +51,7 @@ static const struct of_device_id of_match_clk_mt8516_aud[] = {
 	{ .compatible = "mediatek,mt8516-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_aud);
 
 static struct platform_driver clk_mt8516_aud_drv = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index ad59e932d4aa..21eb052b0a53 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -665,6 +665,7 @@ static const struct of_device_id of_match_clk_mt8516[] = {
 	{ .compatible = "mediatek,mt8516-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8516);
 
 static struct platform_driver clk_mt8516_drv = {
 	.probe = mtk_clk_simple_probe,
-- 
2.39.1


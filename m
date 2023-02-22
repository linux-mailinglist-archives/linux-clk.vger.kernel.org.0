Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C049C69F1D2
	for <lists+linux-clk@lfdr.de>; Wed, 22 Feb 2023 10:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjBVJf6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Feb 2023 04:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjBVJfU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 04:35:20 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29233A869;
        Wed, 22 Feb 2023 01:33:22 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C33766021CF;
        Wed, 22 Feb 2023 09:26:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677058009;
        bh=7FZEolUr6KyAj858oufGeSrFd4pByYVT6eDczeQoNE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ml3XO7nJLiU8lrpCFQf705GC7ysGHqUcNl07v2IFrNUFS+MD2C5tFTmjcf8aqZ+K3
         q8myA0pQ9OIyUMhiktUB4HoCvCqcuWCa+NGLiur7vgTr0CLanc+98uYRjl7R0o+EA3
         KVA0Vc7W+2QZEYgrYYJmPMnAKMRN0YXHLqBxOI3XNeK62vW2Uw+gXVnwahOb6IgwY5
         PpGdi2SWi+tYPFO25pCjMRzNxKp9NPNZPG0BIDq/PqxDegLjNp4T583nD70nuqplhb
         k1FahVauwIYkF3ab4gjq/hF0hAG9BDSCRUTRW22cdi/ANTYiqjiKjE0EWK29BOLdzL
         7iR+feDHuAEmQ==
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
Subject: [PATCH v5 41/54] clk: mediatek: Allow MT7622 clocks to be built as modules
Date:   Wed, 22 Feb 2023 10:25:30 +0100
Message-Id: <20230222092543.19187-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
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

Now that all drivers are using the simple probe mechanism change the
MT7622 clock drivers to tristate in Kconfig to allow module build.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index fc073e5be4eb..d089806789ee 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
 	  This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
-	bool "Clock driver for MediaTek MT7622"
+	tristate "Clock driver for MediaTek MT7622"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -345,21 +345,21 @@ config COMMON_CLK_MT7622
 	  required for various periperals found on MediaTek.
 
 config COMMON_CLK_MT7622_ETHSYS
-	bool "Clock driver for MediaTek MT7622 ETHSYS"
+	tristate "Clock driver for MediaTek MT7622 ETHSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver add support for clocks for Ethernet and SGMII
 	  required on MediaTek MT7622 SoC.
 
 config COMMON_CLK_MT7622_HIFSYS
-	bool "Clock driver for MediaTek MT7622 HIFSYS"
+	tristate "Clock driver for MediaTek MT7622 HIFSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 HIFSYS clocks providing
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7622_AUDSYS
-	bool "Clock driver for MediaTek MT7622 AUDSYS"
+	tristate "Clock driver for MediaTek MT7622 AUDSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 AUDSYS clocks providing
-- 
2.39.2


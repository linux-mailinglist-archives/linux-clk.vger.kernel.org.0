Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17546115F01
	for <lists+linux-clk@lfdr.de>; Sat,  7 Dec 2019 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfLGWYo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 7 Dec 2019 17:24:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:36310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfLGWYn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 7 Dec 2019 17:24:43 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB182467C;
        Sat,  7 Dec 2019 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575757482;
        bh=ULTk7VEDKTLvMWIBejxxPh1hFuBO2Z+aHgJwQjllNVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o63Vj+2Jwu2dxBmlMkRB+iWdh0vzIKWJmifjPTvPuoowYWvSpzSs+zJR+aXGRmg6j
         psEWIEwmIHN0EgxviOU1i++qn/ePC8dOH8STbACymij8GFSpWCoTQ3FX99ogaXnWhn
         ZMB+VocmfyIklaEK0OHo9mEHEfZJYNTs21fOdj6U=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
Subject: [PATCH v6 03/12] drm/mediatek: Use regmap for register access
Date:   Sat,  7 Dec 2019 23:23:40 +0100
Message-Id: <20191207222349.23161-4-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

The mmsys memory space is shared between the drm and the
clk driver. Use regmap to access it.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
 5 files changed, 30 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 34a731755791..259e2f4fa5fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -27,7 +27,7 @@
  * @enabled: records whether crtc_enable succeeded
  * @planes: array of 4 drm_plane structures, one for each overlay plane
  * @pending_planes: whether any plane has pending changes to be applied
- * @config_regs: memory mapped mmsys configuration register space
+ * @config_regs: regmap mapped mmsys configuration register space
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
@@ -43,7 +43,7 @@ struct mtk_drm_crtc {
 	unsigned int			layer_nr;
 	bool				pending_planes;
 
-	void __iomem			*config_regs;
+	struct regmap			*config_regs;
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 8106a71a7404..b765181223e6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -331,61 +331,53 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
-static void mtk_ddp_sout_sel(void __iomem *config_regs,
+static void mtk_ddp_sout_sel(struct regmap *config_regs,
 			     enum mtk_ddp_comp_id cur,
 			     enum mtk_ddp_comp_id next)
 {
 	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DSI_RDMA1_TO_DPI1);
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DPI_RDMA1_TO_DSI);
+		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
+				DSI_SEL_IN_RDMA);
+		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
+				DPI_SEL_IN_BLS);
 	}
 }
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 
 	mtk_ddp_sout_sel(config_regs, cur, next);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 }
 
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 }
 
 struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
index 827be424a148..01ff8b68881f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
@@ -12,10 +12,10 @@ struct regmap;
 struct device;
 struct mtk_disp_mutex;
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 352b81a7a670..210455e9f46c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -6,6 +6,7 @@
 
 #include <linux/component.h>
 #include <linux/iommu.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -485,7 +486,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_drm_private *private;
-	struct resource *mem;
 	struct device_node *node;
 	struct component_match *match = NULL;
 	int ret;
@@ -499,14 +499,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	INIT_WORK(&private->commit.work, mtk_atomic_work);
 	private->data = of_device_get_match_data(dev);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	private->config_regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(private->config_regs)) {
-		ret = PTR_ERR(private->config_regs);
-		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
-			ret);
-		return ret;
-	}
+	private->config_regs = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(private->config_regs))
+		return PTR_ERR(private->config_regs);
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index e03fea12ff59..63a121577dcb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -39,7 +39,7 @@ struct mtk_drm_private {
 
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
-	void __iomem *config_regs;
+	struct regmap *config_regs;
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
-- 
2.24.0


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1CA17E479
	for <lists+linux-clk@lfdr.de>; Mon,  9 Mar 2020 17:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgCIQRT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Mar 2020 12:17:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgCIQRT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Mar 2020 12:17:19 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D59DA2D2;
        Mon,  9 Mar 2020 17:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583770637;
        bh=ml87TgXbfAEwecY2YM0QeCIphKoRoAmA8kLHojFY760=;
        h=From:To:Cc:Subject:Date:From;
        b=nmPfM390BLJvUmzRNb7BjZSJr2NUlRQffwKm9umL9JQa/Ub48LRnTRjw7U/mQbDkJ
         vXODXEYfzQ6tJ6+rgHzsVMmemW+HIXXfM8Z58xnvJ0pJ8EA/W7oInGe25V2ACwASOs
         sRLa9xP1FGqGPuInbW6vBQP5FcGJEa0lNt9F3WNs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-imx@nxp.com,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] clk: imx7d: Add PXP clock
Date:   Mon,  9 Mar 2020 18:17:09 +0200
Message-Id: <20200309161709.30982-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PXP has a single CCGR clock gate, gating both the IPG_CLK_ROOT and
the MAIN_AXI_CLK_ROOT. Add a single clock to cover both.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/imx/clk-imx7d.c             | 1 +
 include/dt-bindings/clock/imx7d-clock.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index fbea774ef687..4f1ead22781e 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -802,6 +802,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_PCIE_PHY_ROOT_CLK] = imx_clk_hw_gate4("pcie_phy_root_clk", "pcie_phy_post_div", base + 0x4600, 0);
 	hws[IMX7D_EPDC_PIXEL_ROOT_CLK] = imx_clk_hw_gate4("epdc_pixel_root_clk", "epdc_pixel_post_div", base + 0x44a0, 0);
 	hws[IMX7D_LCDIF_PIXEL_ROOT_CLK] = imx_clk_hw_gate4("lcdif_pixel_root_clk", "lcdif_pixel_post_div", base + 0x44b0, 0);
+	hws[IMX7D_PXP_CLK] = imx_clk_hw_gate4("pxp_clk", "main_axi_root_clk", base + 0x44c0, 0);
 	hws[IMX7D_MIPI_DSI_ROOT_CLK] = imx_clk_hw_gate4("mipi_dsi_root_clk", "mipi_dsi_post_div", base + 0x4650, 0);
 	hws[IMX7D_MIPI_CSI_ROOT_CLK] = imx_clk_hw_gate4("mipi_csi_root_clk", "mipi_csi_post_div", base + 0x4640, 0);
 	hws[IMX7D_MIPI_DPHY_ROOT_CLK] = imx_clk_hw_gate4("mipi_dphy_root_clk", "mipi_dphy_post_div", base + 0x4660, 0);
diff --git a/include/dt-bindings/clock/imx7d-clock.h b/include/dt-bindings/clock/imx7d-clock.h
index e6a670e1a3f8..1d4c0dfe0202 100644
--- a/include/dt-bindings/clock/imx7d-clock.h
+++ b/include/dt-bindings/clock/imx7d-clock.h
@@ -451,5 +451,6 @@
 #define IMX7D_SNVS_CLK			442
 #define IMX7D_CAAM_CLK			443
 #define IMX7D_KPP_ROOT_CLK		444
-#define IMX7D_CLK_END			445
+#define IMX7D_PXP_CLK			445
+#define IMX7D_CLK_END			446
 #endif /* __DT_BINDINGS_CLOCK_IMX7D_H */
-- 
Regards,

Laurent Pinchart


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E89B260FCE
	for <lists+linux-clk@lfdr.de>; Tue,  8 Sep 2020 12:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgIHK3F (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Sep 2020 06:29:05 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44848 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729527AbgIHK0i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 8 Sep 2020 06:26:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B5711A034D;
        Tue,  8 Sep 2020 12:26:09 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E96E1A0344;
        Tue,  8 Sep 2020 12:26:09 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BBBF220327;
        Tue,  8 Sep 2020 12:26:08 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fugang Duan <fugang.duan@nxp.com>, devicetree@vger.kernel.org
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 05/14] dt-bindings: reset: imx8mp: Add media blk_ctl reset IDs
Date:   Tue,  8 Sep 2020 13:24:42 +0300
Message-Id: <1599560691-3763-6-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599560691-3763-1-git-send-email-abel.vesa@nxp.com>
References: <1599560691-3763-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These will be used by the imx8mp for blk_ctl driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/dt-bindings/reset/imx8mp-reset.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/dt-bindings/reset/imx8mp-reset.h b/include/dt-bindings/reset/imx8mp-reset.h
index 6c7f17f..ba70248 100644
--- a/include/dt-bindings/reset/imx8mp-reset.h
+++ b/include/dt-bindings/reset/imx8mp-reset.h
@@ -52,4 +52,32 @@
 
 #define IMX8MP_AUDIO_BLK_CTL_RESET_NUM		2
 
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_DSI_PCLK	0
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_DSI_CLKREF	1
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_CSI_PCLK	2
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_CSI_ACLK	3
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF_PIXEL		4
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF_APB		5
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISI_PROC		6
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISI_APB		7
+#define IMX8MP_MEDIA_BLK_CTL_RESET_BUS_BLK		8
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_CSI2_PCLK	9
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_CSI2_ACLK	10
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF2_PIXEL		11
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF2_APB		12
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP1_COR		13
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP1_AXI		14
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP1_AHB		15
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP0_COR		16
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP0_AXI		17
+#define IMX8MP_MEDIA_BLK_CTL_RESET_ISP0_AHB		18
+#define IMX8MP_MEDIA_BLK_CTL_RESET_DWE_COR		19
+#define IMX8MP_MEDIA_BLK_CTL_RESET_DWE_AXI		20
+#define IMX8MP_MEDIA_BLK_CTL_RESET_DWE_AHB		21
+#define IMX8MP_MEDIA_BLK_CTL_RESET_MIPI_DSI2		22
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF_AXI		23
+#define IMX8MP_MEDIA_BLK_CTL_RESET_LCDIF2_AXI		24
+
+#define IMX8MP_MEDIA_BLK_CTL_RESET_NUM			25
+
 #endif
-- 
2.7.4


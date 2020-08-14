Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68E4244993
	for <lists+linux-clk@lfdr.de>; Fri, 14 Aug 2020 14:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgHNMJx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Aug 2020 08:09:53 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54972 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728066AbgHNMJx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Aug 2020 08:09:53 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C33D200251;
        Fri, 14 Aug 2020 14:09:51 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F1FC2002DA;
        Fri, 14 Aug 2020 14:09:51 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 918BA203B5;
        Fri, 14 Aug 2020 14:09:50 +0200 (CEST)
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
Subject: [PATCH v2 03/17] dt-bindings: clock: imx8mp: Add ids for the audio shared gate
Date:   Fri, 14 Aug 2020 15:09:12 +0300
Message-Id: <1597406966-13740-4-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597406966-13740-1-git-send-email-abel.vesa@nxp.com>
References: <1597406966-13740-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All these IDs are for one single HW gate (CCGR101) that is shared
between these root clocks.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/imx8mp-clock.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 6008f32..78ebe8e 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -322,7 +322,17 @@
 #define IMX8MP_CLK_HSIO_AXI			311
 #define IMX8MP_CLK_MEDIA_ISP			312
 
-#define IMX8MP_CLK_END				313
+#define IMX8MP_CLK_AUDIO_AHB_ROOT		313
+#define IMX8MP_CLK_AUDIO_AXI_ROOT		314
+#define IMX8MP_CLK_SAI1_ROOT			315
+#define IMX8MP_CLK_SAI2_ROOT			316
+#define IMX8MP_CLK_SAI3_ROOT			317
+#define IMX8MP_CLK_SAI5_ROOT			318
+#define IMX8MP_CLK_SAI6_ROOT			319
+#define IMX8MP_CLK_SAI7_ROOT			320
+#define IMX8MP_CLK_PDM_ROOT			321
+
+#define IMX8MP_CLK_END				322
 
 #define IMX8MP_CLK_AUDIO_BLK_CTRL_SAI1_IPG		0
 #define IMX8MP_CLK_AUDIO_BLK_CTRL_SAI1_MCLK1		1
-- 
2.7.4


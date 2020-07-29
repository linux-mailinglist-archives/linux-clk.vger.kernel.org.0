Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3258F231E3B
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jul 2020 14:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG2MI7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jul 2020 08:08:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37972 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726984AbgG2MIb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 08:08:31 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ECEA7200FBB;
        Wed, 29 Jul 2020 14:08:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E0904200FAB;
        Wed, 29 Jul 2020 14:08:29 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C1BF2032B;
        Wed, 29 Jul 2020 14:08:29 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Fugang Duan <fugang.duan@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH 16/17] arm64: dts: imx8mp: Add media_blk_ctrl node
Date:   Wed, 29 Jul 2020 15:08:02 +0300
Message-Id: <1596024483-21482-17-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596024483-21482-1-git-send-email-abel.vesa@nxp.com>
References: <1596024483-21482-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some of the features of the media_ctrl will be used by some
different drivers in a way those drivers will know best, so adding the
syscon compatible we allow those to do just that. Only the resets
and the clocks are registered bit the clk-blk-ctrl driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b985875..172c548 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -736,6 +736,23 @@
 			};
 		};
 
+		aips4: bus@32c00000 {
+			compatible = "simple-bus";
+			reg = <0x32c00000 0x400000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			media_blk_ctrl: media-blk-ctrl@32ec0000 {
+				compatible = "fsl,imx8mp-media-blk-ctrl", "syscon";
+				reg = <0x32ec0000 0x10000>;
+				power-domains = <&mediamix_pd>;
+
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+		};
+
 		aips5: bus@30c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x30c00000 0x400000>;
-- 
2.7.4


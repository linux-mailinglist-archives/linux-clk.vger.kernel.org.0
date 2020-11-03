Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423C32A4402
	for <lists+linux-clk@lfdr.de>; Tue,  3 Nov 2020 12:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgKCLTS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Nov 2020 06:19:18 -0500
Received: from inva020.nxp.com ([92.121.34.13]:38182 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728286AbgKCLTO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 3 Nov 2020 06:19:14 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 879F91A089A;
        Tue,  3 Nov 2020 12:19:12 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 78B491A04D2;
        Tue,  3 Nov 2020 12:19:12 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B53662033F;
        Tue,  3 Nov 2020 12:19:11 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 02/14] dt-bindings: reset: imx8mp: Add audio blk_ctl reset IDs
Date:   Tue,  3 Nov 2020 13:18:14 +0200
Message-Id: <1604402306-5348-3-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These will be used by the imx8mp for blk_ctl driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/dt-bindings/reset/imx8mp-reset.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/reset/imx8mp-reset.h b/include/dt-bindings/reset/imx8mp-reset.h
index 2e8c910..6c7f17f 100644
--- a/include/dt-bindings/reset/imx8mp-reset.h
+++ b/include/dt-bindings/reset/imx8mp-reset.h
@@ -47,4 +47,9 @@
 
 #define IMX8MP_RESET_NUM			38
 
+#define IMX8MP_AUDIO_BLK_CTL_EARC_RESET		0
+#define IMX8MP_AUDIO_BLK_CTL_EARC_PHY_RESET	1
+
+#define IMX8MP_AUDIO_BLK_CTL_RESET_NUM		2
+
 #endif
-- 
2.7.4


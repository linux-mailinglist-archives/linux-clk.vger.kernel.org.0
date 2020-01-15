Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACA913BB5D
	for <lists+linux-clk@lfdr.de>; Wed, 15 Jan 2020 09:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAOImv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jan 2020 03:42:51 -0500
Received: from inva020.nxp.com ([92.121.34.13]:39024 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728925AbgAOImu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jan 2020 03:42:50 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4FE61A05BB;
        Wed, 15 Jan 2020 09:42:48 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A7BD81A0028;
        Wed, 15 Jan 2020 09:42:48 +0100 (CET)
Received: from fsr-ub1864-014.ea.freescale.net (fsr-ub1864-014.ea.freescale.net [10.171.95.219])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0757220340;
        Wed, 15 Jan 2020 09:42:47 +0100 (CET)
From:   =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: imx8mn: add SNVS clock
Date:   Wed, 15 Jan 2020 10:42:23 +0200
Message-Id: <20200115084225.30464-2-horia.geanta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115084225.30464-1-horia.geanta@nxp.com>
References: <20200115084225.30464-1-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 include/dt-bindings/clock/imx8mn-clock.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 0f2b8423ce1d..43883fe65db5 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -228,6 +228,8 @@
 #define IMX8MN_SYS_PLL2_333M_CG			209
 #define IMX8MN_SYS_PLL2_500M_CG			210
 
-#define IMX8MN_CLK_END				211
+#define IMX8MN_CLK_SNVS_ROOT			211
+
+#define IMX8MN_CLK_END				212
 
 #endif
-- 
2.17.1


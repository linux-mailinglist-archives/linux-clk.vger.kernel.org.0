Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9291C192CD3
	for <lists+linux-clk@lfdr.de>; Wed, 25 Mar 2020 16:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgCYPjp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Mar 2020 11:39:45 -0400
Received: from inva020.nxp.com ([92.121.34.13]:52892 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727915AbgCYPjd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Mar 2020 11:39:33 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 04D271A04EA;
        Wed, 25 Mar 2020 16:39:32 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EB4781A00F9;
        Wed, 25 Mar 2020 16:39:31 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3928E203CE;
        Wed, 25 Mar 2020 16:39:31 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 11/13] dt-bindings: reset: imx8mp: Add ids for audiomix reset
Date:   Wed, 25 Mar 2020 17:38:49 +0200
Message-Id: <1585150731-3354-12-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585150731-3354-1-git-send-email-abel.vesa@nxp.com>
References: <1585150731-3354-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add all the reset ids for the audiomix reset.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 include/dt-bindings/reset/imx-audiomix-reset.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/reset/imx-audiomix-reset.h

diff --git a/include/dt-bindings/reset/imx-audiomix-reset.h b/include/dt-bindings/reset/imx-audiomix-reset.h
new file mode 100644
index 00000000..571cacf
--- /dev/null
+++ b/include/dt-bindings/reset/imx-audiomix-reset.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 NXP.
+ */
+
+#ifndef DT_BINDING_RESET_IMX_AUDIOMIX_H
+#define DT_BINDING_RESET_IMX_AUDIOMIX_H
+
+#define IMX_AUDIOMIX_EARC_RESET		0x0
+#define IMX_AUDIOMIX_EARC_PHY_RESET	0x1
+
+#define IMX_AUDIOMIX_RESET_NUM		2
+
+#endif
+
-- 
2.7.4


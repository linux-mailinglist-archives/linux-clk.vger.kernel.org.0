Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A50139D8D
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2020 00:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgAMXmd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 Jan 2020 18:42:33 -0500
Received: from inva021.nxp.com ([92.121.34.21]:60058 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728794AbgAMXmd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jan 2020 18:42:33 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F86C20017E;
        Tue, 14 Jan 2020 00:42:31 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D0FB200055;
        Tue, 14 Jan 2020 00:42:31 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9CBD220563;
        Tue, 14 Jan 2020 00:42:30 +0100 (CET)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: Fix imx8m_clk_hw_composite_core flags
Date:   Tue, 14 Jan 2020 01:42:26 +0200
Message-Id: <7d118c8ad52e87a7cadb438097fcdfbeeb822dd7.1578958643.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Just like other imx8m composites the "core" slice needs the
CLK_SET_RATE_NO_REPARENT and CLK_OPS_PARENT_ENABLE flags. It is not
clear why they were omitted.

In particular without the CLK_OPS_PARENT_ENABLE flag the system can hang
when attempting to disable a clock whose parent is disabled. This
current happens for arm_m4_div on imx8mm-evk, breaking boot.

Fixes: 5fcdb45497a0 ("clk: imx: composite-8m: add imx8m_clk_hw_composite_core")

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
Since this is a very recent breakage (just next-20200113) the fix should
probably be squashed.

 drivers/clk/imx/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index cd2a60c10a71..17a66a4290fb 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,11 +487,11 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 					    unsigned long flags);
 
 #define imx8m_clk_hw_composite_core(name, parent_names, reg)	\
 	imx8m_clk_hw_composite_flags(name, parent_names, \
 			ARRAY_SIZE(parent_names), reg, \
-			IMX_COMPOSITE_CORE, 0)
+			IMX_COMPOSITE_CORE, CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
 
 #define imx8m_clk_composite_flags(name, parent_names, num_parents, reg, \
 				  flags) \
 	to_clk(imx8m_clk_hw_composite_flags(name, parent_names, \
 				num_parents, reg, 0, flags))
-- 
2.17.1


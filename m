Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8852F295199
	for <lists+linux-clk@lfdr.de>; Wed, 21 Oct 2020 19:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409050AbgJURhD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 21 Oct 2020 13:37:03 -0400
Received: from inva021.nxp.com ([92.121.34.21]:41132 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503595AbgJURhB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Oct 2020 13:37:01 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 090B1200051;
        Wed, 21 Oct 2020 19:36:59 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0842200031;
        Wed, 21 Oct 2020 19:36:58 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C5852033F;
        Wed, 21 Oct 2020 19:36:58 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 3/4] clk: imx: composite-8m: Add DRAM clock registration variant
Date:   Wed, 21 Oct 2020 20:36:54 +0300
Message-Id: <1603301815-24670-4-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603301815-24670-1-git-send-email-abel.vesa@nxp.com>
References: <1603301815-24670-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The switch between parents for dram_apb and dram_alt is done in EL3,
so make all the ops read-only. That means none of the ops that write
any of the registers is used for such a clock.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-composite-8m.c | 12 +++++++++++-
 drivers/clk/imx/clk.h              |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index b8cd0f0..6734a4a 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -184,6 +184,7 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 	struct clk_mux *mux = NULL;
 	const struct clk_ops *divider_ops;
 	const struct clk_ops *mux_ops;
+	const struct clk_ops *gate_ops;
 
 	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -206,16 +207,25 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 		div->width = PCG_CORE_DIV_WIDTH;
 		divider_ops = &clk_divider_ops;
 		mux_ops = &imx8m_clk_composite_mux_ops;
+		gate_ops = &clk_gate_ops;
 	} else if (composite_flags & IMX_COMPOSITE_BUS) {
 		div->shift = PCG_PREDIV_SHIFT;
 		div->width = PCG_PREDIV_WIDTH;
 		divider_ops = &imx8m_clk_composite_divider_ops;
 		mux_ops = &imx8m_clk_composite_mux_ops;
+		gate_ops = &clk_gate_ops;
+	} else if (composite_flags & IMX_COMPOSITE_RO) {
+		div->shift = PCG_PREDIV_SHIFT;
+		div->width = PCG_PREDIV_WIDTH;
+		divider_ops = &clk_divider_ro_ops;
+		mux_ops = &clk_mux_ro_ops;
+		gate_ops = &clk_gate_ro_ops;
 	} else {
 		div->shift = PCG_PREDIV_SHIFT;
 		div->width = PCG_PREDIV_WIDTH;
 		divider_ops = &imx8m_clk_composite_divider_ops;
 		mux_ops = &clk_mux_ops;
+		gate_ops = &clk_gate_ops;
 		flags |= CLK_SET_PARENT_GATE;
 	}
 
@@ -238,7 +248,7 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 
 	hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
 			mux_hw, mux_ops, div_hw,
-			divider_ops, gate_hw, &clk_gate_ops, flags);
+			divider_ops, gate_hw, gate_ops, flags);
 	if (IS_ERR(hw))
 		goto fail;
 
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index a997049..8096585 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -580,6 +580,7 @@ struct clk_hw *imx_clk_hw_cpu(const char *name, const char *parent_name,
 
 #define IMX_COMPOSITE_CORE	BIT(0)
 #define IMX_COMPOSITE_BUS	BIT(1)
+#define IMX_COMPOSITE_RO	BIT(2)
 
 struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 					    const char * const *parent_names,
@@ -600,6 +601,12 @@ struct clk_hw *imx8m_clk_hw_composite_flags(const char *name,
 			IMX_COMPOSITE_CORE, \
 			CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
 
+#define imx8m_clk_hw_composite_dram(name, parent_names, reg) \
+	imx8m_clk_hw_composite_flags(name, parent_names, \
+		ARRAY_SIZE(parent_names), reg, IMX_COMPOSITE_RO, \
+		CLK_GET_RATE_NOCACHE | CLK_GET_PARENT_NOCACHE \
+		| CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
+
 #define imx8m_clk_composite_flags(name, parent_names, num_parents, reg, \
 				  flags) \
 	to_clk(imx8m_clk_hw_composite_flags(name, parent_names, \
-- 
2.7.4


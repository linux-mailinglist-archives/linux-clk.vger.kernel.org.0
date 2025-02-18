Return-Path: <linux-clk+bounces-18287-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB4A3ACA7
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 00:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CAFC3A80C4
	for <lists+linux-clk@lfdr.de>; Tue, 18 Feb 2025 23:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E50A1DE3D7;
	Tue, 18 Feb 2025 23:43:25 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4E61DDC22;
	Tue, 18 Feb 2025 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739922205; cv=none; b=CkZhpV1jcnQLfmZDPTKEb8T6MN3u37h2nJNdcWZ062xEJtGpnq/6Lq574G9YTLtp3JSM1DP2cXlD+GBJwnv3e4lzkOQFirWUixK4caZ0UzQUlkdggqe/KC6gVtHTA8kN6b2bi991AMHZGg5SrFp3+jFWCpxmDyWfK/miaO1zPOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739922205; c=relaxed/simple;
	bh=ebTedUnNwNYpxQLYZCXzU9hkTtsa+bXm92jLPa5vssc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X61KQx3IEhuFd7q9203J5E/hMoE3yBDC5yVcjVgz/eMl93x4z0H2xDE0TEgHP1kzAg/Zr7F3N71oNufcLQeMGk09Z11L1B4dSO6U/MAztUOEQjP/VxYkIsK1aRjy80czgSdqBmsU1seXzSgOG0L2cBKCh8cqq5pWvzgqQ44g1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Z5xBc5uWR4eWQ/fo8wV44A==
X-CSE-MsgGUID: LkXlpZDJSLyGofziZwn3Ag==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Feb 2025 08:43:16 +0900
Received: from mulinux.example.org (unknown [10.226.92.65])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 98EC340FDD99;
	Wed, 19 Feb 2025 08:43:13 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/7] clk: renesas: r9a09g057: Add entries for the DMACs
Date: Tue, 18 Feb 2025 23:42:58 +0000
Message-Id: <20250218234305.700317-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218234305.700317-1-fabrizio.castro.jz@renesas.com>
References: <20250218234305.700317-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock and reset entries for the Renesas RZ/V2H(P) DMAC IPs.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v2->v3:
* No change.
v1->v2:
* No change.
---
 drivers/clk/renesas/r9a09g057-cpg.c | 24 ++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3705e18f66ad..d63eafbca780 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -31,6 +31,8 @@ enum clk_ids {
 	CLK_PLLVDO,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV4_PLLCM33,
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
@@ -39,6 +41,8 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV16,
+	CLK_PLLDTY_RCPU,
+	CLK_PLLDTY_RCPU_DIV4,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_CRU2,
@@ -85,6 +89,9 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
+	DEF_DDIV(".pllcm33_div4_pllcm33", CLK_PLLCM33_DIV4_PLLCM33,
+		 CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
@@ -95,6 +102,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
@@ -115,6 +124,16 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_DIV4_PLLCM33, 0, 0, 0, 0,
+						BUS_MSTOP(5, BIT(9))),
+	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
+						BUS_MSTOP(3, BIT(2))),
+	DEF_MOD("dmac_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 2, 0, 2,
+						BUS_MSTOP(3, BIT(3))),
+	DEF_MOD("dmac_3_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 3, 0, 3,
+						BUS_MSTOP(10, BIT(11))),
+	DEF_MOD("dmac_4_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 4, 0, 4,
+						BUS_MSTOP(10, BIT(12))),
 	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
 						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
@@ -223,6 +242,11 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 1, 1, 2),		/* DMAC_0_ARESETN */
+	DEF_RST(3, 2, 1, 3),		/* DMAC_1_ARESETN */
+	DEF_RST(3, 3, 1, 4),		/* DMAC_2_ARESETN */
+	DEF_RST(3, 4, 1, 5),		/* DMAC_3_ARESETN */
+	DEF_RST(3, 5, 1, 6),		/* DMAC_4_ARESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index fd8eb985c75b..576a070763cb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -38,11 +38,13 @@ struct ddiv {
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 
+#define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV3_DIVCTL2	DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
 #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
 #define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
-- 
2.34.1



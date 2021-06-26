Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A995C3B4D9A
	for <lists+linux-clk@lfdr.de>; Sat, 26 Jun 2021 10:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhFZIQU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 26 Jun 2021 04:16:20 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49351 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229518AbhFZIQU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Jun 2021 04:16:20 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85587072"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2021 17:13:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20A3140037CD;
        Sat, 26 Jun 2021 17:13:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 03/10] drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
Date:   Sat, 26 Jun 2021 09:13:37 +0100
Message-Id: <20210626081344.5783-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As per RZ/G2L HW Manual(Rev.0.50) P1 is sourced from pll3_div2_4.
So fix the clock definitions for P1.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4
 * No change.
v2->v3
 * Added Geert's Rb tag
 * changed divider table to dtable_1_32
v2:
 * New patch
---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d5803fb1242e..d895c1cef1fa 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -30,8 +30,8 @@ enum clk_ids {
 	CLK_PLL2_DIV20,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV2_4,
 	CLK_PLL3_DIV4,
-	CLK_PLL3_DIV8,
 	CLK_PLL4,
 	CLK_PLL5,
 	CLK_PLL5_DIV2,
@@ -67,15 +67,15 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
 
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 	DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
-	DEF_FIXED(".pll3_div8", CLK_PLL3_DIV8, CLK_PLL3, 1, 8),
 
 	/* Core output clk */
 	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
-	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
+	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 };
 
-- 
2.17.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF52F6DD8
	for <lists+linux-clk@lfdr.de>; Thu, 14 Jan 2021 23:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbhANWMp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Jan 2021 17:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730439AbhANWMo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jan 2021 17:12:44 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8775C061798;
        Thu, 14 Jan 2021 14:11:10 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4B0AC3F1D8;
        Thu, 14 Jan 2021 23:11:09 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 06/11] clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
Date:   Thu, 14 Jan 2021 23:10:54 +0100
Message-Id: <20210114221059.483390-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All of the GPLLs in the MSM8998 Global Clock Controller are Fabia PLLs
and not generic alphas: this was producing bad effects over the entire
clock tree of MSM8998, where any GPLL child clock was declaring a false
clock rate, due to their parent also showing the same.

The issue resides in the calculation of the clock rate for the specific
Alpha PLL type, where Fabia has a different register layout; switching
the MSM8998 GPLLs to the correct Alpha Fabia PLL type fixes the rate
(calculation) reading. While at it, also make these PLLs fixed since
their rate is supposed to *never* be changed while the system runs, as
this would surely crash the entire SoC.

Now all the children of all the PLLs are also complying with their
specified clock table and system stability is improved.

Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 100 ++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index afea60a3ef43..050c91af888e 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -135,7 +135,7 @@ static struct pll_vco fabia_vco[] = {
 
 static struct clk_alpha_pll gpll0 = {
 	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.vco_table = fabia_vco,
 	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr = {
@@ -145,58 +145,58 @@ static struct clk_alpha_pll gpll0 = {
 			.name = "gpll0",
 			.parent_names = (const char *[]){ "xo" },
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
 		.parent_names = (const char *[]){ "gpll0" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll0_out_main = {
 	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_main",
 		.parent_names = (const char *[]){ "gpll0" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll0_out_odd = {
 	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_odd",
 		.parent_names = (const char *[]){ "gpll0" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll0_out_test = {
 	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_test",
 		.parent_names = (const char *[]){ "gpll0" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll gpll1 = {
 	.offset = 0x1000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.vco_table = fabia_vco,
 	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr = {
@@ -206,58 +206,58 @@ static struct clk_alpha_pll gpll1 = {
 			.name = "gpll1",
 			.parent_names = (const char *[]){ "xo" },
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll1_out_even = {
 	.offset = 0x1000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_even",
 		.parent_names = (const char *[]){ "gpll1" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll1_out_main = {
 	.offset = 0x1000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_main",
 		.parent_names = (const char *[]){ "gpll1" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll1_out_odd = {
 	.offset = 0x1000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_odd",
 		.parent_names = (const char *[]){ "gpll1" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll1_out_test = {
 	.offset = 0x1000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_test",
 		.parent_names = (const char *[]){ "gpll1" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll gpll2 = {
 	.offset = 0x2000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.vco_table = fabia_vco,
 	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr = {
@@ -267,58 +267,58 @@ static struct clk_alpha_pll gpll2 = {
 			.name = "gpll2",
 			.parent_names = (const char *[]){ "xo" },
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll2_out_even = {
 	.offset = 0x2000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_even",
 		.parent_names = (const char *[]){ "gpll2" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll2_out_main = {
 	.offset = 0x2000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_main",
 		.parent_names = (const char *[]){ "gpll2" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll2_out_odd = {
 	.offset = 0x2000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_odd",
 		.parent_names = (const char *[]){ "gpll2" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll2_out_test = {
 	.offset = 0x2000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_test",
 		.parent_names = (const char *[]){ "gpll2" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll gpll3 = {
 	.offset = 0x3000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.vco_table = fabia_vco,
 	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr = {
@@ -328,58 +328,58 @@ static struct clk_alpha_pll gpll3 = {
 			.name = "gpll3",
 			.parent_names = (const char *[]){ "xo" },
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll3_out_even = {
 	.offset = 0x3000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_even",
 		.parent_names = (const char *[]){ "gpll3" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll3_out_main = {
 	.offset = 0x3000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_main",
 		.parent_names = (const char *[]){ "gpll3" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll3_out_odd = {
 	.offset = 0x3000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_odd",
 		.parent_names = (const char *[]){ "gpll3" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll3_out_test = {
 	.offset = 0x3000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_test",
 		.parent_names = (const char *[]){ "gpll3" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll gpll4 = {
 	.offset = 0x77000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.vco_table = fabia_vco,
 	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr = {
@@ -389,52 +389,52 @@ static struct clk_alpha_pll gpll4 = {
 			.name = "gpll4",
 			.parent_names = (const char *[]){ "xo" },
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll4_out_even = {
 	.offset = 0x77000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_even",
 		.parent_names = (const char *[]){ "gpll4" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll4_out_main = {
 	.offset = 0x77000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_main",
 		.parent_names = (const char *[]){ "gpll4" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll4_out_odd = {
 	.offset = 0x77000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_odd",
 		.parent_names = (const char *[]){ "gpll4" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
 static struct clk_alpha_pll_postdiv gpll4_out_test = {
 	.offset = 0x77000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_test",
 		.parent_names = (const char *[]){ "gpll4" },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
-- 
2.29.2


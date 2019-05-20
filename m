Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABF422DE0
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2019 10:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbfETIGq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 May 2019 04:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730860AbfETIFi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 04:05:38 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E975F21019;
        Mon, 20 May 2019 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558339537;
        bh=y84Uxko3cSZ4ioV1p74onTS1ViFsGIN9LBJ8rhBd2nQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IZqqK1kl+AGI3tZgKJQVbHiIOy0NNbU/B4HOBmRl18J4Gci3r6eh79C8cB9O7qQUm
         KaCrS0g/X5srp9YBpByDEkCK60fJYTwwqC8cF9zBVevR9TZieShQ3Pa7K0iMUsjbnR
         yN0hPHGOJZ2gDlN8zMYlGKjaee1o/hxjO0rNthAI=
Received: by wens.tw (Postfix, from userid 1000)
        id 7CE226580F; Mon, 20 May 2019 16:05:32 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/25] clk: sunxi-ng: sun8i-r: Use local parent references for CLK_HW_INIT_*
Date:   Mon, 20 May 2019 16:04:05 +0800
Message-Id: <20190520080421.12575-10-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520080421.12575-1-wens@kernel.org>
References: <20190520080421.12575-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

With the new clk parenting code and CLK_HW_INIT_* macros, we can
reference parents locally via pointers to struct clk_hw or DT
clock-names.

Convert existing CLK_HW_INIT_* definitions to describe parents using
either struct clk_hw pointers or clock-names from the device tree
binding.

For the AR100, this also allows us to merge the generic AR100 and the
A83T specific one, which only differed in the global clock names for
their parent clocks. The device tree bindings used the same name
specifiers.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r.c | 65 ++++++++++++------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
index 71feb7b24e8a..a43e8de873d7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
@@ -25,10 +25,13 @@
 
 #include "ccu-sun8i-r.h"
 
-static const char * const ar100_parents[] = { "osc32k", "osc24M",
-					     "pll-periph0", "iosc" };
-static const char * const a83t_ar100_parents[] = { "osc16M-d512", "osc24M",
-						   "pll-periph0", "iosc" };
+static const struct clk_parent_data ar100_parents[] = {
+	{ .fw_name = "losc" },
+	{ .fw_name = "hosc" },
+	{ .fw_name = "pll-periph" },
+	{ .fw_name = "iosc" },
+};
+
 static const struct ccu_mux_var_prediv ar100_predivs[] = {
 	{ .index = 2, .shift = 8, .width = 5 },
 };
@@ -47,31 +50,10 @@ static struct ccu_div ar100_clk = {
 	.common		= {
 		.reg		= 0x00,
 		.features	= CCU_FEATURE_VARIABLE_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS("ar100",
-						      ar100_parents,
-						      &ccu_div_ops,
-						      0),
-	},
-};
-
-static struct ccu_div a83t_ar100_clk = {
-	.div		= _SUNXI_CCU_DIV_FLAGS(4, 2, CLK_DIVIDER_POWER_OF_TWO),
-
-	.mux		= {
-		.shift	= 16,
-		.width	= 2,
-
-		.var_predivs	= ar100_predivs,
-		.n_var_predivs	= ARRAY_SIZE(ar100_predivs),
-	},
-
-	.common		= {
-		.reg		= 0x00,
-		.features	= CCU_FEATURE_VARIABLE_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS("ar100",
-						      a83t_ar100_parents,
-						      &ccu_div_ops,
-						      0),
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("ar100",
+							   ar100_parents,
+							   &ccu_div_ops,
+							   0),
 	},
 };
 
@@ -82,10 +64,10 @@ static struct ccu_div apb0_clk = {
 
 	.common		= {
 		.reg		= 0x0c,
-		.hw.init	= CLK_HW_INIT("apb0",
-					      "ahb0",
-					      &ccu_div_ops,
-					      0),
+		.hw.init	= CLK_HW_INIT_HW("apb0",
+						 &ahb0_clk.hw,
+						 &ccu_div_ops,
+						 0),
 	},
 };
 
@@ -115,7 +97,10 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
 				  BIT(31),	/* gate */
 				  0);
 
-static const char *const a83t_r_mod0_parents[] = { "osc16M", "osc24M" };
+static const struct clk_parent_data a83t_r_mod0_parents[] = {
+	{ .fw_name = "iosc" },
+	{ .fw_name = "hosc" },
+};
 static const struct ccu_mux_fixed_prediv a83t_ir_predivs[] = {
 	{ .index = 0, .div = 16 },
 };
@@ -135,15 +120,15 @@ static struct ccu_mp a83t_ir_clk = {
 	.common		= {
 		.reg		= 0x54,
 		.features	= CCU_FEATURE_VARIABLE_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS("ir",
-						      a83t_r_mod0_parents,
-						      &ccu_mp_ops,
-						      0),
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("ir",
+							   a83t_r_mod0_parents,
+							   &ccu_mp_ops,
+							   0),
 	},
 };
 
 static struct ccu_common *sun8i_a83t_r_ccu_clks[] = {
-	&a83t_ar100_clk.common,
+	&ar100_clk.common,
 	&a83t_apb0_clk.common,
 	&apb0_pio_clk.common,
 	&apb0_ir_clk.common,
@@ -182,7 +167,7 @@ static struct ccu_common *sun50i_a64_r_ccu_clks[] = {
 
 static struct clk_hw_onecell_data sun8i_a83t_r_hw_clks = {
 	.hws	= {
-		[CLK_AR100]		= &a83t_ar100_clk.common.hw,
+		[CLK_AR100]		= &ar100_clk.common.hw,
 		[CLK_AHB0]		= &ahb0_clk.hw,
 		[CLK_APB0]		= &a83t_apb0_clk.common.hw,
 		[CLK_APB0_PIO]		= &apb0_pio_clk.common.hw,
-- 
2.20.1


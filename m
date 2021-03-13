Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9912E339B19
	for <lists+linux-clk@lfdr.de>; Sat, 13 Mar 2021 03:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhCMCV2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 Mar 2021 21:21:28 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:57317 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbhCMCUt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 21:20:49 -0500
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 347AF1F8E2;
        Sat, 13 Mar 2021 03:20:46 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] clk: qcom: gcc-msm8994: Modernize the driver
Date:   Sat, 13 Mar 2021 03:19:11 +0100
Message-Id: <20210313021919.435332-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to the newer-style parent_data and remove the hardcoded
xo clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 868 ++++++++++++---------------------
 1 file changed, 313 insertions(+), 555 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 144d2ba7a9be..69241651b171 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -28,50 +28,18 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-};
-
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data)
-	{
-		.name = "xo",
-		.parent_names = (const char *[]) { "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
-	.offset = 0x00000,
+	.offset = 0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_early",
-			.parent_names = (const char *[]) { "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -79,10 +47,9 @@ static struct clk_alpha_pll gpll0_early = {
 };
 
 static struct clk_alpha_pll_postdiv gpll0 = {
-	.offset = 0x00000,
+	.offset = 0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]) { "gpll0_early" },
 		.num_parents = 1,
@@ -96,10 +63,12 @@ static struct clk_alpha_pll gpll4_early = {
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(4),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_early",
-			.parent_names = (const char *[]) { "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -109,8 +78,7 @@ static struct clk_alpha_pll gpll4_early = {
 static struct clk_alpha_pll_postdiv gpll4 = {
 	.offset = 0x1dc0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
 		.parent_names = (const char *[]) { "gpll4_early" },
 		.num_parents = 1,
@@ -118,6 +86,28 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board", },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
+	{ .fw_name = "xo", .name = "xo_board", },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
 static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -134,10 +124,9 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_ufs_axi_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -155,10 +144,9 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb30_master_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -175,10 +163,9 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -203,10 +190,9 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -217,10 +203,9 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -232,10 +217,9 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -246,10 +230,9 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -261,10 +244,9 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -275,10 +257,9 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -290,10 +271,9 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -304,10 +284,9 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -319,10 +298,9 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -333,10 +311,9 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -348,10 +325,9 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -382,10 +358,9 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -397,10 +372,9 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -412,10 +386,9 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -427,10 +400,9 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -442,10 +414,9 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -457,10 +428,9 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -471,10 +441,9 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -486,10 +455,9 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -500,10 +468,9 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -515,10 +482,9 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -529,10 +495,9 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -544,10 +509,9 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -558,10 +522,9 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -573,10 +536,9 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -587,10 +549,9 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -602,10 +563,9 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -616,10 +576,9 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -631,10 +590,9 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -646,10 +604,9 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -661,10 +618,9 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -676,10 +632,9 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -691,10 +646,9 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -706,10 +660,9 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart5_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -721,10 +674,9 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart6_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -743,10 +695,9 @@ static struct clk_rcg2 gp1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp1_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -765,10 +716,9 @@ static struct clk_rcg2 gp2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp2_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -787,10 +737,9 @@ static struct clk_rcg2 gp3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_gp3_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -806,10 +755,12 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_0_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -824,10 +775,12 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.cmd_rcgr = 0x1adc,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_pipe_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -843,10 +796,12 @@ static struct clk_rcg2 pcie_1_aux_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_1_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -856,10 +811,12 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	.cmd_rcgr = 0x1b5c,
 	.hid_width = 5,
 	.freq_tbl = ftbl_pcie_pipe_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_pipe_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -875,10 +832,9 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_pdm2_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -902,10 +858,9 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_gpll4_map,
 	.freq_tbl = ftbl_sdcc1_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll4,
+		.parent_data = gcc_xo_gpll0_gpll4,
 		.num_parents = 3,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -928,10 +883,9 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -943,10 +897,9 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc3_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -958,10 +911,9 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -977,10 +929,12 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.freq_tbl = ftbl_tsif_ref_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -997,10 +951,9 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1015,10 +968,12 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.cmd_rcgr = 0x1414,
 	.hid_width = 5,
 	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = (const char *[]) { "xo" },
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1034,10 +989,9 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
 	.freq_tbl = ftbl_usb_hs_system_clk_src,
-	.clkr.hw.init = &(struct clk_init_data)
-	{
+	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1049,8 +1003,7 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1484,
 		.enable_mask = BIT(17),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1062,12 +1015,9 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0648,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup1_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1080,12 +1030,9 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0644,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup1_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup1_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1098,12 +1045,9 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x06c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup2_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1116,12 +1060,9 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x06c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup2_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup2_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1134,12 +1075,9 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0748,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup3_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1152,12 +1090,9 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0744,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup3_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup3_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1170,12 +1105,9 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x07c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup4_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1188,12 +1120,9 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x07c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup4_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup4_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1206,12 +1135,9 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0848,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup5_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1224,12 +1150,9 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0844,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup5_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup5_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1242,12 +1165,9 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x08c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup6_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1260,12 +1180,9 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x08c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_qup6_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_qup6_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1278,12 +1195,9 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0684,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1296,12 +1210,9 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0704,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1314,12 +1225,9 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0784,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1332,12 +1240,9 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0804,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1350,12 +1255,9 @@ static struct clk_branch gcc_blsp1_uart5_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0884,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart5_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart5_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1368,12 +1270,9 @@ static struct clk_branch gcc_blsp1_uart6_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0904,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp1_uart6_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp1_uart6_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1387,8 +1286,7 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1484,
 		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1400,12 +1298,9 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0988,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup1_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1418,12 +1313,9 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0984,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup1_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup1_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1436,12 +1328,9 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup2_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1454,12 +1343,9 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup2_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup2_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1472,12 +1358,9 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup3_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1490,12 +1373,9 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup3_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup3_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1508,12 +1388,9 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup4_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1526,12 +1403,9 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup4_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup4_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1544,12 +1418,9 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup5_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1562,12 +1433,9 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup5_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup5_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1580,12 +1448,9 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c08,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_i2c_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup6_i2c_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1598,12 +1463,9 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c04,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_spi_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_qup6_spi_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_qup6_spi_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1616,12 +1478,9 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x09c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1634,12 +1493,9 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0a44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1652,12 +1508,9 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0ac4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart3_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1670,12 +1523,9 @@ static struct clk_branch gcc_blsp2_uart4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0b44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart4_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1688,12 +1538,9 @@ static struct clk_branch gcc_blsp2_uart5_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0bc4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart5_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart5_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart5_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1706,12 +1553,9 @@ static struct clk_branch gcc_blsp2_uart6_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0c44,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart6_apps_clk",
-			.parent_names = (const char *[]) {
-				"blsp2_uart6_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &blsp2_uart6_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1724,12 +1568,9 @@ static struct clk_branch gcc_gp1_clk = {
 	.clkr = {
 		.enable_reg = 0x1900,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]) {
-				"gp1_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp1_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1742,12 +1583,9 @@ static struct clk_branch gcc_gp2_clk = {
 	.clkr = {
 		.enable_reg = 0x1940,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]) {
-				"gp2_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp2_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1760,12 +1598,9 @@ static struct clk_branch gcc_gp3_clk = {
 	.clkr = {
 		.enable_reg = 0x1980,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]) {
-				"gp3_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &gp3_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1778,8 +1613,7 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x0280,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_lpass_q6_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1791,8 +1625,7 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x0284,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1804,12 +1637,9 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_0_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1822,8 +1652,7 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad0,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1835,8 +1664,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1acc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1849,12 +1677,9 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.clkr = {
 		.enable_reg = 0x1ad8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_0_pipe_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_0_pipe_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1868,8 +1693,7 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1ac8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1881,12 +1705,9 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1b54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_1_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1899,8 +1720,7 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1b54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1912,8 +1732,7 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1b50,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1926,12 +1745,9 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.clkr = {
 		.enable_reg = 0x1b58,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_names = (const char *[]) {
-				"pcie_1_pipe_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pcie_1_pipe_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1944,8 +1760,7 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1b48,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1957,12 +1772,9 @@ static struct clk_branch gcc_pdm2_clk = {
 	.clkr = {
 		.enable_reg = 0x0ccc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]) {
-				"pdm2_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &pdm2_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1975,8 +1787,7 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0cc4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -1988,12 +1799,9 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x04c4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc1_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc1_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2006,8 +1814,7 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x04c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2023,8 +1830,7 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0508,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2040,12 +1846,9 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0504,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc2_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc2_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2058,8 +1861,7 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0548,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2075,12 +1877,9 @@ static struct clk_branch gcc_sdcc3_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0544,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc3_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc3_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2093,8 +1892,7 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0588,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
 			.parent_names = (const char *[]){
 				"periph_noc_clk_src",
@@ -2110,12 +1908,9 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 	.clkr = {
 		.enable_reg = 0x0584,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_names = (const char *[]) {
-				"sdcc4_apps_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &sdcc4_apps_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2128,12 +1923,9 @@ static struct clk_branch gcc_sys_noc_ufs_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1d7c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2146,12 +1938,9 @@ static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x03fc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_axi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_master_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2164,8 +1953,7 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0d84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2177,12 +1965,9 @@ static struct clk_branch gcc_tsif_ref_clk = {
 	.clkr = {
 		.enable_reg = 0x0d88,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ref_clk",
-			.parent_names = (const char *[]) {
-				"tsif_ref_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &tsif_ref_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2195,8 +1980,7 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x1d4c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2208,12 +1992,9 @@ static struct clk_branch gcc_ufs_axi_clk = {
 	.clkr = {
 		.enable_reg = 0x1d48,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2226,12 +2007,9 @@ static struct clk_branch gcc_ufs_rx_cfg_clk = {
 	.clkr = {
 		.enable_reg = 0x1d54,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2245,8 +2023,7 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 	.clkr = {
 		.enable_reg = 0x1d60,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2259,8 +2036,7 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 	.clkr = {
 		.enable_reg = 0x1d64,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2272,12 +2048,9 @@ static struct clk_branch gcc_ufs_tx_cfg_clk = {
 	.clkr = {
 		.enable_reg = 0x1d50,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_cfg_clk",
-			.parent_names = (const char *[]) {
-				"ufs_axi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &ufs_axi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2291,8 +2064,7 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 	.clkr = {
 		.enable_reg = 0x1d58,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2305,8 +2077,7 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 	.clkr = {
 		.enable_reg = 0x1d5c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2318,9 +2089,13 @@ static struct clk_branch gcc_usb2_hs_phy_sleep_clk = {
 	.clkr = {
 		.enable_reg = 0x04ac,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2_hs_phy_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep",
+				.name = "sleep"
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2331,12 +2106,9 @@ static struct clk_branch gcc_usb30_master_clk = {
 	.clkr = {
 		.enable_reg = 0x03c8,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]) {
-				"usb30_master_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_master_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2349,12 +2121,9 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 	.clkr = {
 		.enable_reg = 0x03d0,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]) {
-				"usb30_mock_utmi_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb30_mock_utmi_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2367,9 +2136,13 @@ static struct clk_branch gcc_usb30_sleep_clk = {
 	.clkr = {
 		.enable_reg = 0x03cc,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep",
+				.name = "sleep"
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2380,12 +2153,9 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x1408,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]) {
-				"usb3_phy_aux_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb3_phy_aux_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2398,8 +2168,7 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x0488,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2411,12 +2180,9 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	.clkr = {
 		.enable_reg = 0x0484,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]) {
-				"usb_hs_system_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &usb_hs_system_clk_src.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2429,8 +2195,7 @@ static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
 	.clkr = {
 		.enable_reg = 0x1a84,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data)
-		{
+		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -2663,13 +2428,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
 
 static int gcc_msm8994_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct clk *clk;
-
-	clk = devm_clk_register(dev, &xo.hw);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
 }
 
-- 
2.30.2


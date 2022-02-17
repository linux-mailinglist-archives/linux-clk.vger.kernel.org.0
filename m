Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4281C4BAE1E
	for <lists+linux-clk@lfdr.de>; Fri, 18 Feb 2022 01:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiBRALS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Feb 2022 19:11:18 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiBRALS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 19:11:18 -0500
X-Greylist: delayed 2498 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 16:10:55 PST
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0DB593AC
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 16:10:55 -0800 (PST)
Received: from localhost.localdomain (abxk63.neoplus.adsl.tpnet.pl [83.9.4.63])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id D98143F825;
        Fri, 18 Feb 2022 00:24:12 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: gcc-msm8994: Remove NoC clocks
Date:   Fri, 18 Feb 2022 00:24:08 +0100
Message-Id: <20220217232408.78932-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Just like in commit 05cf3ec00d460b50088d421fb878a0f83f57e262
("clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk")
adding NoC clocks turned out to be a huge mistake, as they cause a lot of
issues at little benefit (basically letting Linux know about their
children's frequencies), especially when mishandled or misconfigured.

Adding these ones broke SDCC approx 99 out of 100 times, but that somehow
went unnoticed. To prevent further issues like this one, remove them.

This commit is effectively a revert of 74a33fac3aab77558ca0d80c9935
(clk: qcom: gcc-msm8994: Add missing NoC clocks) with ABI preservation.

Fixes: 74a33fac3aab ("clk: qcom: gcc-msm8994: Add missing NoC clocks")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 106 +++------------------------------
 1 file changed, 9 insertions(+), 97 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 702a9bdc0559..5df9f1ead48e 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -107,42 +107,6 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
 	{ .hw = &gpll4.clkr.hw },
 };
 
-static struct clk_rcg2 system_noc_clk_src = {
-	.cmd_rcgr = 0x0120,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "system_noc_clk_src",
-		.parent_data = gcc_xo_gpll0,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 config_noc_clk_src = {
-	.cmd_rcgr = 0x0150,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "config_noc_clk_src",
-		.parent_data = gcc_xo_gpll0,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_rcg2 periph_noc_clk_src = {
-	.cmd_rcgr = 0x0190,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "periph_noc_clk_src",
-		.parent_data = gcc_xo_gpll0,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -1149,8 +1113,6 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1434,8 +1396,6 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1763,8 +1723,6 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_lpass_q6_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1777,8 +1735,6 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1806,9 +1762,6 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1821,9 +1774,6 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1853,9 +1803,6 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1883,9 +1830,6 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1898,9 +1842,6 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1929,9 +1870,6 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1959,8 +1897,6 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1988,9 +1924,6 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2003,9 +1936,6 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2033,9 +1963,6 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2063,9 +1990,6 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2123,8 +2047,6 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2152,8 +2074,6 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2197,8 +2117,6 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2212,8 +2130,6 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2242,8 +2158,6 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2257,8 +2171,6 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
-			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2363,8 +2275,6 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2487,8 +2397,6 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2502,8 +2410,6 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2546,9 +2452,6 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL4_EARLY] = &gpll4_early.clkr,
 	[GPLL4] = &gpll4.clkr,
-	[CONFIG_NOC_CLK_SRC] = &config_noc_clk_src.clkr,
-	[PERIPH_NOC_CLK_SRC] = &periph_noc_clk_src.clkr,
-	[SYSTEM_NOC_CLK_SRC] = &system_noc_clk_src.clkr,
 	[UFS_AXI_CLK_SRC] = &ufs_axi_clk_src.clkr,
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
@@ -2695,6 +2598,15 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
 	[USB_SS_PHY_LDO] = &usb_ss_phy_ldo.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+
+	/*
+	 * The following clocks should NOT be managed by this driver, but they once were
+	 * mistakengly added. Now they are only here to indicate that they are not defined
+	 * on purpose, even though the names will stay in the header file (for ABI sanity).
+	 */
+	[CONFIG_NOC_CLK_SRC] = NULL,
+	[PERIPH_NOC_CLK_SRC] = NULL,
+	[SYSTEM_NOC_CLK_SRC] = NULL,
 };
 
 static struct gdsc *gcc_msm8994_gdscs[] = {
-- 
2.35.1


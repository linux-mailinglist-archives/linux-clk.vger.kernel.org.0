Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D33663061
	for <lists+linux-clk@lfdr.de>; Mon,  9 Jan 2023 20:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjAITb6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Jan 2023 14:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbjAITbP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 14:31:15 -0500
Received: from fallback18.mail.ru (fallback18.mail.ru [185.5.136.250])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA9164D4;
        Mon,  9 Jan 2023 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=+n+8sDe5LNhzCDx+1QcB7g9pFCAdnHxMXa3iXwALp7w=;
        t=1673292668;x=1673382668; 
        b=SViWTJ72/B8spZYsg0oR15yrbNRldRId02mxCe5GalaTJYO5u4ugRlBhtRFvdHpLaxUWDp4d7SPy0ZxACugDre0foclIkarM/dicgE6yrsRxKEQIQqwcDCNhmj4Uqj8+ihBCo/HM6jkaCkJYSqA3nyvk/UPwYO1LfJfTrCJpnH4=;
Received: from [10.161.64.59] (port=39012 helo=smtp51.i.mail.ru)
        by fallback18.m.smailru.net with esmtp (envelope-from <danila@jiaxyga.com>)
        id 1pExrO-0000rX-2p; Mon, 09 Jan 2023 22:31:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
        h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=+n+8sDe5LNhzCDx+1QcB7g9pFCAdnHxMXa3iXwALp7w=;
        t=1673292666;x=1673382666; 
        b=bqnyOkU7kyf78j10gmTFzGdXW90pe3lE1zpZyYZtEY/43r96naFLc2hMZdzCNBT3h08QftZ2HCtSUSPMz15xsy0dpOjhh6ckcTRnRWwtOMv5LHrchsBnpvJcJQSY+ss4JbsU+L9b7aFTgJBssF+BOeOqpj/B/IpmZoiZFFPXZjU=;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
        id 1pExrD-0001ej-VC; Mon, 09 Jan 2023 22:30:56 +0300
From:   Danila Tikhonov <danila@jiaxyga.com>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <davidwronek@gmail.com>
Subject: [PATCH 2/2] clk: qcom: Add Global Clock Controller (GCC) driver for SM7150
Date:   Mon,  9 Jan 2023 22:30:30 +0300
Message-Id: <20230109193030.42764-3-danila@jiaxyga.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109193030.42764-1-danila@jiaxyga.com>
References: <20230109193030.42764-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93F1575C7510F55478FC4166FA01937987B4D334E4ABBCC06182A05F5380850404C228DA9ACA6FE27364352F1C92FBF7B6CE2DCD60D62A0AD8020377F25CFA5559C35240DA3207F08
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72D70BB167BCA14CAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745ACBD918AA95FF88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D5F5920E4762ACAABCC1AF6BCD87349E117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC60CDF180582EB8FBA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520599709FD55CB46A66FD1C55BDD38FC3FD2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE22A4E020D69BCAC1CAA9C333723BB66AD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE36925688D23FC3BD3302FCEF25BFAB345C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006378534F7D0DA3B5694EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A51EF6B725D58B8A01FB4F5DD83CD21BBFEBAFFCA96C2C5FDF4EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3474B2583E51315984E2BABDDD91562A0A894505B1439E657F6DEA0086E632F1086144D59660AA06401D7E09C32AA3244CE11B20E95242DE0284A608444CEF35FF95A9E0DC41E9A4CF98DBA7662A2C9987
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqOyU7017cIvMga8u5OOlbg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981E397D480C3580E4E4B73940CA436B5F9A5379C86AB307262643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B41CF11DA7185A12D6AD7DD622C933E1B869753D7DFCFB718468F3CF0E9FE49B69FEFBE5D651DB9B9802F89172632D9E56844DE7BBE3E4FD4EDB2A95B4C67C2504
X-7FA49CB5: 0D63561A33F958A57632871621B6713A2003736B613DE3D14CAAE0D932F27B688941B15DA834481FA18204E546F3947C17119E5299B287EEF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063773DCDF0198120BE8389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063710FEC4F8C56CDF14D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636AAAE862A0553A39223F8577A6DFFEA7C3FD97E4CBBB7207543847C11F186F3C59DAA53EE0834AAEE
X-B7AD71C0: 1B70FBA5C9BEEE72C9761FC34675ADEB871C96603B655635EE9D5CB6078CC77C48C7A1893680B168146EF582D857B11F
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqOyU7017cIu50TgHhXGBUw==
X-Mailru-MI: 1000000000800
X-Mras: Ok
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the global clock controller found on SM7150
based devices. This should allow most non-multimedia device
drivers to probe and control their clocks.

Co-developed-by: David Wronek <davidwronek@gmail.com>
Signed-off-by: David Wronek <davidwronek@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig      |    8 +
 drivers/clk/qcom/Makefile     |    1 +
 drivers/clk/qcom/gcc-sm7150.c | 3159 +++++++++++++++++++++++++++++++++
 3 files changed, 3168 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sm7150.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1221dee63f99..3b153dba89f8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -733,6 +733,14 @@ config SM_GCC_6375
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS etc.
 
+config SM_GCC_7150
+	tristate "SM7150 Global Clock Controller"
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on SM7150 devices.
+	  Say Y if you want to use peripheral devices such as UART,
+	  SPI, I2C, USB, SD/UFS, PCIe etc.
+
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ce274b5f3e9d..3b8afb924c1b 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
 obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
 obj-$(CONFIG_SM_GCC_6350) += gcc-sm6350.o
 obj-$(CONFIG_SM_GCC_6375) += gcc-sm6375.o
+obj-$(CONFIG_SM_GCC_7150) += gcc-sm7150.o
 obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
new file mode 100644
index 000000000000..05bece700d19
--- /dev/null
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -0,0 +1,3159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2023, David Wronek <davidwronek@gmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7150-gcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_EVEN,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL6_OUT_MAIN,
+	P_GPLL7_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_fabia_even[] = {
+	{ 0x0, 1 },
+	{ 0x1, 2 },
+	{ 0x3, 4 },
+	{ 0x7, 8 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_fabia_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_pll0_main_div_cdiv = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "gcc_pll0_main_div_cdiv",
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll6 = {
+	.offset = 0x13000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll6",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll7 = {
+	.offset = 0x27000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.enable_reg = 0x52000,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll7",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+static const struct clk_parent_data gcc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct clk_parent_data gcc_parent_data_2_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL6_OUT_MAIN, 2 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll6.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL7_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll7.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
+	.cmd_rcgr = 0x48014,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_cpuss_ahb_clk_src",
+		.parent_data = gcc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_cpuss_rbcpr_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
+	.cmd_rcgr = 0x4815c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_cpuss_rbcpr_clk_src",
+		.parent_data = gcc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2_ao),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x64004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x65004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp3_clk_src = {
+	.cmd_rcgr = 0x66004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp3_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
+	.cmd_rcgr = 0x6b028,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_0_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_phy_refgen_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
+	.cmd_rcgr = 0x6f014,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_phy_refgen_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_phy_refgen_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x33010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
+	F(7372800, P_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(64000000, P_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(80000000, P_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(102400000, P_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(120000000, P_GPLL0_OUT_EVEN, 2.5, 0, 0),
+	F(128000000, P_GPLL0_OUT_MAIN, 1, 16, 75),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s0_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
+	.cmd_rcgr = 0x17034,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s1_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
+	.cmd_rcgr = 0x17164,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s2_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
+	.cmd_rcgr = 0x17294,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s3_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
+	.cmd_rcgr = 0x173c4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s4_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
+	.cmd_rcgr = 0x174f4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s5_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
+	.cmd_rcgr = 0x17624,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s6_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
+	.cmd_rcgr = 0x17754,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s7_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
+	.cmd_rcgr = 0x17884,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s0_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
+	.cmd_rcgr = 0x18018,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s1_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
+	.cmd_rcgr = 0x18148,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s2_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
+	.cmd_rcgr = 0x18278,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s3_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
+	.cmd_rcgr = 0x183a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s4_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
+	.cmd_rcgr = 0x184d8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s5_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
+	.cmd_rcgr = 0x18608,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s6_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
+	.cmd_rcgr = 0x18738,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
+	.name = "gcc_qupv3_wrap1_s7_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
+	.cmd_rcgr = 0x18868,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_GPLL0_OUT_EVEN, 5, 1, 3),
+	F(25000000, P_GPLL0_OUT_EVEN, 6, 1, 2),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(192000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
+	F(384000000, P_GPLL6_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x12028,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
+	F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x12010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_ice_core_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(208000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x1400c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc2_apps_clk_src",
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(33333333, P_GPLL0_OUT_EVEN, 9, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
+	.cmd_rcgr = 0x1600c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_sdcc4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc4_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_tsif_ref_clk_src[] = {
+	F(105495, P_BI_TCXO, 2, 1, 91),
+	{ }
+};
+
+static struct clk_rcg2 gcc_tsif_ref_clk_src = {
+	.cmd_rcgr = 0x36010,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_tsif_ref_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_tsif_ref_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src[] = {
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(240000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
+	.cmd_rcgr = 0x77020,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_ufs_phy_axi_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src[] = {
+	F(37500000, P_GPLL0_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
+	.cmd_rcgr = 0x77048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_ufs_phy_ice_core_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
+	.cmd_rcgr = 0x77098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_ufs_phy_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ufs_phy_unipro_core_clk_src[] = {
+	F(37500000, P_GPLL0_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(150000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
+	.cmd_rcgr = 0x77060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_ufs_phy_unipro_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_ufs_phy_unipro_core_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_prim_master_clk_src[] = {
+	F(66666667, P_GPLL0_OUT_EVEN, 4.5, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(240000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
+	.cmd_rcgr = 0xf01c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_prim_master_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_prim_mock_utmi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_GPLL0_OUT_EVEN, 15, 0, 0),
+	F(40000000, P_GPLL0_OUT_EVEN, 7.5, 0, 0),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
+	.cmd_rcgr = 0xf034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_prim_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb3_prim_phy_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
+	.cmd_rcgr = 0xf060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_usb3_prim_phy_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb3_prim_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_vs_ctrl_clk_src = {
+	.cmd_rcgr = 0x7a030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_usb3_prim_phy_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_vs_ctrl_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_vsensor_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_vsensor_clk_src = {
+	.cmd_rcgr = 0x7a018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_gcc_vsensor_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_vsensor_clk_src",
+		.parent_data = gcc_parent_data_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_aggre_noc_pcie_tbu_clk = {
+	.halt_reg = 0x2800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre_noc_pcie_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
+	.halt_reg = 0x82024,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x82024,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x82024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre_ufs_phy_axi_hw_ctl_clk = {
+	.halt_reg = 0x82024,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x82024,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x82024,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre_ufs_phy_axi_hw_ctl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_aggre_ufs_phy_axi_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch_simple_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
+	.halt_reg = 0x8201c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_apc_vs_clk = {
+	.halt_reg = 0x7a050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apc_vs_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vsensor_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_ahb_clk = {
+	.halt_reg = 0xb008,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0xb008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xb008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_hf_axi_clk = {
+	.halt_reg = 0xb020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_sf_axi_clk = {
+	.halt_reg = 0xb06c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_xo_clk = {
+	.halt_reg = 0xb02c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_xo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_ahb_clk = {
+	.halt_reg = 0x4100c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4100c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_axi_clk = {
+	.halt_reg = 0x41008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_clk = {
+	.halt_reg = 0x41004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x502c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x502c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpuss_ahb_clk = {
+	.halt_reg = 0x48000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(21),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpuss_rbcpr_clk = {
+	.halt_reg = 0x48008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x48008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_rbcpr_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_rbcpr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ddrss_gpu_axi_clk = {
+	.halt_reg = 0x4452c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x4452c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ddrss_gpu_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_ahb_clk = {
+	.halt_reg = 0xb00c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0xb00c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xb00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(18),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(19),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pll0_main_div_cdiv.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_hf_axi_clk = {
+	.halt_reg = 0xb024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_sf_axi_clk = {
+	.halt_reg = 0xb070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb070,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_xo_clk = {
+	.halt_reg = 0xb030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_xo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x64000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x64000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x65000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x65000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x66000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x66000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp3_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_cfg_ahb_clk = {
+	.halt_reg = 0x71004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x71004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x71004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_cfg_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(16),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pll0_main_div_cdiv.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
+	.halt_reg = 0x7100c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7100c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_snoc_dvm_gfx_clk = {
+	.halt_reg = 0x71018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x71018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_snoc_dvm_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_vs_clk = {
+	.halt_reg = 0x7a04c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_vs_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vsensor_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_npu_axi_clk = {
+	.halt_reg = 0x4d008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_npu_cfg_ahb_clk = {
+	.halt_reg = 0x4d004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x4d004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x4d004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_cfg_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_npu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(25),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_npu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(26),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pll0_main_div_cdiv.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_aux_clk = {
+	.halt_reg = 0x6b01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
+	.halt_reg = 0x6b018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x6b018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_clkref_clk = {
+	.halt_reg = 0x8c008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
+	.halt_reg = 0x6b014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_pipe_clk = {
+	.halt_reg = 0x6b020,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_slv_axi_clk = {
+	.halt_reg = 0x6b010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x6b010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_slv_q2a_axi_clk = {
+	.halt_reg = 0x6b00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_phy_aux_clk = {
+	.halt_reg = 0x6f004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_phy_refgen_clk = {
+	.halt_reg = 0x6f02c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6f02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_phy_refgen_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_phy_refgen_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x3300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pdm2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x33004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x33004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x33004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x33008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x33008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_prng_ahb_clk = {
+	.halt_reg = 0x34004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x34004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_prng_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_core_2x_clk = {
+	.halt_reg = 0x17014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_core_clk = {
+	.halt_reg = 0x1700c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
+	.halt_reg = 0x17030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
+	.halt_reg = 0x17160,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
+	.halt_reg = 0x17290,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
+	.halt_reg = 0x173c0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s3_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
+	.halt_reg = 0x174f0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
+	.halt_reg = 0x17620,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s5_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s6_clk = {
+	.halt_reg = 0x17750,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(16),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s6_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s7_clk = {
+	.halt_reg = 0x17880,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(17),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s7_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_core_2x_clk = {
+	.halt_reg = 0x18004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(18),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_core_clk = {
+	.halt_reg = 0x18008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(19),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
+	.halt_reg = 0x18014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(22),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
+	.halt_reg = 0x18144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(23),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
+	.halt_reg = 0x18274,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(24),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
+	.halt_reg = 0x183a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(25),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s3_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
+	.halt_reg = 0x184d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(26),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
+	.halt_reg = 0x18604,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(27),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s5_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s6_clk = {
+	.halt_reg = 0x18734,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(28),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s6_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap1_s7_clk = {
+	.halt_reg = 0x18864,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(29),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap1_s7_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_0_m_ahb_clk = {
+	.halt_reg = 0x17004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_0_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_0_s_ahb_clk = {
+	.halt_reg = 0x17008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_0_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_1_m_ahb_clk = {
+	.halt_reg = 0x1800c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(20),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_1_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_1_s_ahb_clk = {
+	.halt_reg = 0x18010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x18010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(21),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_1_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x12008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x1200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x12040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x14008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x14008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x14004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x14004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc2_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc4_ahb_clk = {
+	.halt_reg = 0x16008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x16008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc4_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc4_apps_clk = {
+	.halt_reg = 0x16004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x16004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc4_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc4_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
+	.halt_reg = 0x4144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_cpuss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tsif_ahb_clk = {
+	.halt_reg = 0x36004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x36004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_tsif_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tsif_inactivity_timers_clk = {
+	.halt_reg = 0x3600c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_tsif_inactivity_timers_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tsif_ref_clk = {
+	.halt_reg = 0x36008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x36008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_tsif_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_tsif_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_mem_clkref_clk = {
+	.halt_reg = 0x8c000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_mem_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_ahb_clk = {
+	.halt_reg = 0x77014,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_axi_clk = {
+	.halt_reg = 0x77038,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77038,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_axi_hw_ctl_clk = {
+	.halt_reg = 0x77038,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77038,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77038,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_axi_hw_ctl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch_simple_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_ice_core_clk = {
+	.halt_reg = 0x77090,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77090,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77090,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_ice_core_hw_ctl_clk = {
+	.halt_reg = 0x77090,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77090,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77090,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_ice_core_hw_ctl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_ice_core_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch_simple_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
+	.halt_reg = 0x77094,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77094,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_phy_aux_hw_ctl_clk = {
+	.halt_reg = 0x77094,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x77094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x77094,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_phy_aux_hw_ctl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_phy_aux_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch_simple_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
+	.halt_reg = 0x7701c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x7701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_rx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
+	.halt_reg = 0x77018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x77018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_tx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
+	.halt_reg = 0x7708c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x7708c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7708c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_unipro_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
+	.halt_reg = 0x7708c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x7708c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7708c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_unipro_core_hw_ctl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_unipro_core_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch_simple_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_master_clk = {
+	.halt_reg = 0xf010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_master_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
+	.halt_reg = 0xf018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_sleep_clk = {
+	.halt_reg = 0xf014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_clkref_clk = {
+	.halt_reg = 0x8c010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
+	.halt_reg = 0xf050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
+	.halt_reg = 0xf054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0xf058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
+	.halt_reg = 0x6a004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x6a004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vdda_vs_clk = {
+	.halt_reg = 0x7a00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vdda_vs_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vsensor_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vddcx_vs_clk = {
+	.halt_reg = 0x7a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vddcx_vs_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vsensor_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vddmx_vs_clk = {
+	.halt_reg = 0x7a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vddmx_vs_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vsensor_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_ahb_clk = {
+	.halt_reg = 0xb004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0xb004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_axi_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_xo_clk = {
+	.halt_reg = 0xb028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_xo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vs_ctrl_ahb_clk = {
+	.halt_reg = 0x7a014,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x7a014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7a014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vs_ctrl_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vs_ctrl_clk = {
+	.halt_reg = 0x7a010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7a010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vs_ctrl_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_vs_ctrl_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpuss_gnoc_clk = {
+	.halt_reg = 0x48004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x48004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(22),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_gnoc_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc pcie_0_gdsc = {
+	.gdscr = 0x6b004,
+	.pd = {
+		.name = "pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ufs_phy_gdsc = {
+	.gdscr = 0x77004,
+	.pd = {
+		.name = "ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_prim_gdsc = {
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc = {
+	.gdscr = 0x7d030,
+	.pd = {
+		.name = "hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc = {
+	.gdscr = 0x7d03c,
+	.pd = {
+		.name = "hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_aggre_noc_mmu_tbu1_gdsc = {
+	.gdscr = 0x7d034,
+	.pd = {
+		.name = "hlos1_vote_aggre_noc_mmu_tbu1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_aggre_noc_mmu_tbu2_gdsc = {
+	.gdscr = 0x7d038,
+	.pd = {
+		.name = "hlos1_vote_aggre_noc_mmu_tbu2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
+	.gdscr = 0x7d040,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
+	.gdscr = 0x7d048,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
+	.gdscr = 0x7d044,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct clk_hw *gcc_sm7150_hws[] = {
+	[GCC_GPLL0_MAIN_DIV_CDIV] = &gcc_pll0_main_div_cdiv.hw,
+};
+
+static struct clk_regmap *gcc_sm7150_clocks[] = {
+	[GCC_AGGRE_NOC_PCIE_TBU_CLK] = &gcc_aggre_noc_pcie_tbu_clk.clkr,
+	[GCC_AGGRE_UFS_PHY_AXI_CLK] = &gcc_aggre_ufs_phy_axi_clk.clkr,
+	[GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK] =
+		&gcc_aggre_ufs_phy_axi_hw_ctl_clk.clkr,
+	[GCC_AGGRE_USB3_PRIM_AXI_CLK] = &gcc_aggre_usb3_prim_axi_clk.clkr,
+	[GCC_APC_VS_CLK] = &gcc_apc_vs_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
+	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
+	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
+	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
+	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
+	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
+	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
+	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
+	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
+	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
+	[GCC_CPUSS_RBCPR_CLK] = &gcc_cpuss_rbcpr_clk.clkr,
+	[GCC_CPUSS_RBCPR_CLK_SRC] = &gcc_cpuss_rbcpr_clk_src.clkr,
+	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,
+	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
+	[GCC_DISP_GPLL0_CLK_SRC] = &gcc_disp_gpll0_clk_src.clkr,
+	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
+	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
+	[GCC_DISP_SF_AXI_CLK] = &gcc_disp_sf_axi_clk.clkr,
+	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
+	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
+	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
+	[GCC_GPU_GPLL0_DIV_CLK_SRC] = &gcc_gpu_gpll0_div_clk_src.clkr,
+	[GCC_GPU_MEMNOC_GFX_CLK] = &gcc_gpu_memnoc_gfx_clk.clkr,
+	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
+	[GCC_GPU_VS_CLK] = &gcc_gpu_vs_clk.clkr,
+	[GCC_NPU_AXI_CLK] = &gcc_npu_axi_clk.clkr,
+	[GCC_NPU_CFG_AHB_CLK] = &gcc_npu_cfg_ahb_clk.clkr,
+	[GCC_NPU_GPLL0_CLK_SRC] = &gcc_npu_gpll0_clk_src.clkr,
+	[GCC_NPU_GPLL0_DIV_CLK_SRC] = &gcc_npu_gpll0_div_clk_src.clkr,
+	[GCC_PCIE_0_AUX_CLK] = &gcc_pcie_0_aux_clk.clkr,
+	[GCC_PCIE_0_AUX_CLK_SRC] = &gcc_pcie_0_aux_clk_src.clkr,
+	[GCC_PCIE_0_CFG_AHB_CLK] = &gcc_pcie_0_cfg_ahb_clk.clkr,
+	[GCC_PCIE_0_CLKREF_CLK] = &gcc_pcie_0_clkref_clk.clkr,
+	[GCC_PCIE_0_MSTR_AXI_CLK] = &gcc_pcie_0_mstr_axi_clk.clkr,
+	[GCC_PCIE_0_PIPE_CLK] = &gcc_pcie_0_pipe_clk.clkr,
+	[GCC_PCIE_0_SLV_AXI_CLK] = &gcc_pcie_0_slv_axi_clk.clkr,
+	[GCC_PCIE_0_SLV_Q2A_AXI_CLK] = &gcc_pcie_0_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_PHY_AUX_CLK] = &gcc_pcie_phy_aux_clk.clkr,
+	[GCC_PCIE_PHY_REFGEN_CLK] = &gcc_pcie_phy_refgen_clk.clkr,
+	[GCC_PCIE_PHY_REFGEN_CLK_SRC] = &gcc_pcie_phy_refgen_clk_src.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP0_CORE_2X_CLK] = &gcc_qupv3_wrap0_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP0_CORE_CLK] = &gcc_qupv3_wrap0_core_clk.clkr,
+	[GCC_QUPV3_WRAP0_S0_CLK] = &gcc_qupv3_wrap0_s0_clk.clkr,
+	[GCC_QUPV3_WRAP0_S0_CLK_SRC] = &gcc_qupv3_wrap0_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S1_CLK] = &gcc_qupv3_wrap0_s1_clk.clkr,
+	[GCC_QUPV3_WRAP0_S1_CLK_SRC] = &gcc_qupv3_wrap0_s1_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S2_CLK] = &gcc_qupv3_wrap0_s2_clk.clkr,
+	[GCC_QUPV3_WRAP0_S2_CLK_SRC] = &gcc_qupv3_wrap0_s2_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S3_CLK] = &gcc_qupv3_wrap0_s3_clk.clkr,
+	[GCC_QUPV3_WRAP0_S3_CLK_SRC] = &gcc_qupv3_wrap0_s3_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S4_CLK] = &gcc_qupv3_wrap0_s4_clk.clkr,
+	[GCC_QUPV3_WRAP0_S4_CLK_SRC] = &gcc_qupv3_wrap0_s4_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S5_CLK] = &gcc_qupv3_wrap0_s5_clk.clkr,
+	[GCC_QUPV3_WRAP0_S5_CLK_SRC] = &gcc_qupv3_wrap0_s5_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S6_CLK] = &gcc_qupv3_wrap0_s6_clk.clkr,
+	[GCC_QUPV3_WRAP0_S6_CLK_SRC] = &gcc_qupv3_wrap0_s6_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S7_CLK] = &gcc_qupv3_wrap0_s7_clk.clkr,
+	[GCC_QUPV3_WRAP0_S7_CLK_SRC] = &gcc_qupv3_wrap0_s7_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_CORE_2X_CLK] = &gcc_qupv3_wrap1_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP1_CORE_CLK] = &gcc_qupv3_wrap1_core_clk.clkr,
+	[GCC_QUPV3_WRAP1_S0_CLK] = &gcc_qupv3_wrap1_s0_clk.clkr,
+	[GCC_QUPV3_WRAP1_S0_CLK_SRC] = &gcc_qupv3_wrap1_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S1_CLK] = &gcc_qupv3_wrap1_s1_clk.clkr,
+	[GCC_QUPV3_WRAP1_S1_CLK_SRC] = &gcc_qupv3_wrap1_s1_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S2_CLK] = &gcc_qupv3_wrap1_s2_clk.clkr,
+	[GCC_QUPV3_WRAP1_S2_CLK_SRC] = &gcc_qupv3_wrap1_s2_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S3_CLK] = &gcc_qupv3_wrap1_s3_clk.clkr,
+	[GCC_QUPV3_WRAP1_S3_CLK_SRC] = &gcc_qupv3_wrap1_s3_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S4_CLK] = &gcc_qupv3_wrap1_s4_clk.clkr,
+	[GCC_QUPV3_WRAP1_S4_CLK_SRC] = &gcc_qupv3_wrap1_s4_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S5_CLK] = &gcc_qupv3_wrap1_s5_clk.clkr,
+	[GCC_QUPV3_WRAP1_S5_CLK_SRC] = &gcc_qupv3_wrap1_s5_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S6_CLK] = &gcc_qupv3_wrap1_s6_clk.clkr,
+	[GCC_QUPV3_WRAP1_S6_CLK_SRC] = &gcc_qupv3_wrap1_s6_clk_src.clkr,
+	[GCC_QUPV3_WRAP1_S7_CLK] = &gcc_qupv3_wrap1_s7_clk.clkr,
+	[GCC_QUPV3_WRAP1_S7_CLK_SRC] = &gcc_qupv3_wrap1_s7_clk_src.clkr,
+	[GCC_QUPV3_WRAP_0_M_AHB_CLK] = &gcc_qupv3_wrap_0_m_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_0_S_AHB_CLK] = &gcc_qupv3_wrap_0_s_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_1_M_AHB_CLK] = &gcc_qupv3_wrap_1_m_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_1_S_AHB_CLK] = &gcc_qupv3_wrap_1_s_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
+	[GCC_SDCC4_AHB_CLK] = &gcc_sdcc4_ahb_clk.clkr,
+	[GCC_SDCC4_APPS_CLK] = &gcc_sdcc4_apps_clk.clkr,
+	[GCC_SDCC4_APPS_CLK_SRC] = &gcc_sdcc4_apps_clk_src.clkr,
+	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
+	[GCC_TSIF_AHB_CLK] = &gcc_tsif_ahb_clk.clkr,
+	[GCC_TSIF_INACTIVITY_TIMERS_CLK] = &gcc_tsif_inactivity_timers_clk.clkr,
+	[GCC_TSIF_REF_CLK] = &gcc_tsif_ref_clk.clkr,
+	[GCC_TSIF_REF_CLK_SRC] = &gcc_tsif_ref_clk_src.clkr,
+	[GCC_UFS_MEM_CLKREF_CLK] = &gcc_ufs_mem_clkref_clk.clkr,
+	[GCC_UFS_PHY_AHB_CLK] = &gcc_ufs_phy_ahb_clk.clkr,
+	[GCC_UFS_PHY_AXI_CLK] = &gcc_ufs_phy_axi_clk.clkr,
+	[GCC_UFS_PHY_AXI_CLK_SRC] = &gcc_ufs_phy_axi_clk_src.clkr,
+	[GCC_UFS_PHY_AXI_HW_CTL_CLK] = &gcc_ufs_phy_axi_hw_ctl_clk.clkr,
+	[GCC_UFS_PHY_ICE_CORE_CLK] = &gcc_ufs_phy_ice_core_clk.clkr,
+	[GCC_UFS_PHY_ICE_CORE_CLK_SRC] = &gcc_ufs_phy_ice_core_clk_src.clkr,
+	[GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK] =
+		&gcc_ufs_phy_ice_core_hw_ctl_clk.clkr,
+	[GCC_UFS_PHY_PHY_AUX_CLK] = &gcc_ufs_phy_phy_aux_clk.clkr,
+	[GCC_UFS_PHY_PHY_AUX_CLK_SRC] = &gcc_ufs_phy_phy_aux_clk_src.clkr,
+	[GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK] = &gcc_ufs_phy_phy_aux_hw_ctl_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK] = &gcc_ufs_phy_rx_symbol_0_clk.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK] = &gcc_ufs_phy_tx_symbol_0_clk.clkr,
+	[GCC_UFS_PHY_UNIPRO_CORE_CLK] = &gcc_ufs_phy_unipro_core_clk.clkr,
+	[GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC] =
+		&gcc_ufs_phy_unipro_core_clk_src.clkr,
+	[GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK] =
+		&gcc_ufs_phy_unipro_core_hw_ctl_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK] = &gcc_usb30_prim_mock_utmi_clk.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC] =
+		&gcc_usb30_prim_mock_utmi_clk_src.clkr,
+	[GCC_USB30_PRIM_SLEEP_CLK] = &gcc_usb30_prim_sleep_clk.clkr,
+	[GCC_USB3_PRIM_CLKREF_CLK] = &gcc_usb3_prim_clkref_clk.clkr,
+	[GCC_USB3_PRIM_PHY_AUX_CLK] = &gcc_usb3_prim_phy_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &gcc_usb3_prim_phy_aux_clk_src.clkr,
+	[GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_PIPE_CLK] = &gcc_usb3_prim_phy_pipe_clk.clkr,
+	[GCC_USB_PHY_CFG_AHB2PHY_CLK] = &gcc_usb_phy_cfg_ahb2phy_clk.clkr,
+	[GCC_VDDA_VS_CLK] = &gcc_vdda_vs_clk.clkr,
+	[GCC_VDDCX_VS_CLK] = &gcc_vddcx_vs_clk.clkr,
+	[GCC_VDDMX_VS_CLK] = &gcc_vddmx_vs_clk.clkr,
+	[GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,
+	[GCC_VIDEO_AXI_CLK] = &gcc_video_axi_clk.clkr,
+	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
+	[GCC_VS_CTRL_AHB_CLK] = &gcc_vs_ctrl_ahb_clk.clkr,
+	[GCC_VS_CTRL_CLK] = &gcc_vs_ctrl_clk.clkr,
+	[GCC_VS_CTRL_CLK_SRC] = &gcc_vs_ctrl_clk_src.clkr,
+	[GCC_VSENSOR_CLK_SRC] = &gcc_vsensor_clk_src.clkr,
+	[GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[GPLL7] = &gpll7.clkr,
+};
+
+static const struct qcom_reset_map gcc_sm7150_resets[] = {
+	[GCC_PCIE_0_BCR] = { 0x6b000 },
+	[GCC_PCIE_PHY_BCR] = { 0x6f000 },
+	[GCC_PCIE_PHY_COM_BCR] = { 0x6f010 },
+	[GCC_UFS_PHY_BCR] = { 0x77000 },
+	[GCC_USB30_PRIM_BCR] = { 0xf000 },
+	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x50008 },
+	[GCC_USB3_DP_PHY_SEC_BCR] = { 0x50014 },
+	[GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
+	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
+	[GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
+	[GCC_VIDEO_AXI_CLK_BCR] = { 0xb01c, 2 },
+};
+
+static const struct clk_rcg_dfs_data gcc_sm7150_dfs_desc[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
+};
+
+static struct gdsc *gcc_sm7150_gdscs[] = {
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[UFS_PHY_GDSC] = &ufs_phy_gdsc,
+	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
+	[HLOS1_VOTE_AGGRE_NOC_MMU_AUDIO_TBU_GDSC] =
+			&hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc,
+	[HLOS1_VOTE_AGGRE_NOC_MMU_PCIE_TBU_GDSC] =
+			&hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc,
+	[HLOS1_VOTE_AGGRE_NOC_MMU_TBU1_GDSC] =
+			&hlos1_vote_aggre_noc_mmu_tbu1_gdsc,
+	[HLOS1_VOTE_AGGRE_NOC_MMU_TBU2_GDSC] =
+			&hlos1_vote_aggre_noc_mmu_tbu2_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC] =
+			&hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC] =
+			&hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf_gdsc,
+};
+
+static const struct regmap_config gcc_sm7150_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x1820b0,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_sm7150_desc = {
+	.config = &gcc_sm7150_regmap_config,
+	.clk_hws = gcc_sm7150_hws,
+	.num_clk_hws = ARRAY_SIZE(gcc_sm7150_hws),
+	.clks = gcc_sm7150_clocks,
+	.num_clks = ARRAY_SIZE(gcc_sm7150_clocks),
+	.resets = gcc_sm7150_resets,
+	.num_resets = ARRAY_SIZE(gcc_sm7150_resets),
+	.gdscs = gcc_sm7150_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_sm7150_gdscs),
+};
+
+static const struct of_device_id gcc_sm7150_match_table[] = {
+	{ .compatible = "qcom,sm7150-gcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_sm7150_match_table);
+
+static int gcc_sm7150_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &gcc_sm7150_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/*
+	 * Disable the GPLL0 active input to MM blocks, NPU
+	 * and GPU via MISC registers.
+	 */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+
+	ret = qcom_cc_register_rcg_dfs(regmap, gcc_sm7150_dfs_desc,
+					ARRAY_SIZE(gcc_sm7150_dfs_desc));
+	if (ret)
+		return ret;
+
+	return qcom_cc_really_probe(pdev, &gcc_sm7150_desc, regmap);
+}
+
+static struct platform_driver gcc_sm7150_driver = {
+	.probe = gcc_sm7150_probe,
+	.driver = {
+		.name = "gcc-sm7150",
+		.of_match_table = gcc_sm7150_match_table,
+	},
+};
+
+static int __init gcc_sm7150_init(void)
+{
+	return platform_driver_register(&gcc_sm7150_driver);
+}
+subsys_initcall(gcc_sm7150_init);
+
+static void __exit gcc_sm7150_exit(void)
+{
+	platform_driver_unregister(&gcc_sm7150_driver);
+}
+module_exit(gcc_sm7150_exit);
+
+MODULE_DESCRIPTION("Qualcomm SM7150 Global Clock Controller");
+MODULE_LICENSE("GPL");
-- 
2.39.0


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886FC3FAE1E
	for <lists+linux-clk@lfdr.de>; Sun, 29 Aug 2021 21:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbhH2Thd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 Aug 2021 15:37:33 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:41371 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235962AbhH2Th3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 15:37:29 -0400
Received: from localhost.localdomain (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 435F83E81B;
        Sun, 29 Aug 2021 21:36:33 +0200 (CEST)
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
Subject: [PATCH RESEND v2 8/9] clk: qcom: gcc-msm8994: Add proper msm8992 support
Date:   Sun, 29 Aug 2021 21:36:15 +0200
Message-Id: <20210829193617.4105-8-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829193617.4105-1-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8992 is a cut-down version of MSM8994, featuring
largely the same hardware.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 73 +++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 7545e973fd0d..72038e4c04df 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -8,6 +8,7 @@
 #include <linux/ctype.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -218,6 +219,17 @@ static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	{ }
 };
 
+static struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src_8992[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.cmd_rcgr = 0x064c,
 	.mnd_width = 8,
@@ -974,6 +986,18 @@ static struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
 	{ }
 };
 
+static struct freq_tbl ftbl_sdcc1_apps_clk_src_8992[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 15, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(172000000, P_GPLL4, 2, 0, 0),
+	F(344000000, P_GPLL4, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.cmd_rcgr = 0x04d0,
 	.mnd_width = 8,
@@ -2710,13 +2734,60 @@ static const struct qcom_cc_desc gcc_msm8994_desc = {
 };
 
 static const struct of_device_id gcc_msm8994_match_table[] = {
-	{ .compatible = "qcom,gcc-msm8994" },
+	{ .compatible = "qcom,gcc-msm8992" },
+	{ .compatible = "qcom,gcc-msm8994" }, /* V2 and V2.1 */
 	{}
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
 
 static int gcc_msm8994_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,gcc-msm8992")) {
+		/* MSM8992 features less clocks and some have different freq tables */
+		gcc_msm8994_desc.clks[UFS_AXI_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[GCC_LPASS_Q6_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[UFS_PHY_LDO] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_AHB_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_CFG_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_SYMBOL_0_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_SYMBOL_1_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_CFG_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_SYMBOL_0_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_SYMBOL_1_CLK] = NULL;
+
+		sdcc1_apps_clk_src.freq_tbl = ftbl_sdcc1_apps_clk_src_8992;
+		blsp1_qup1_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup2_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup3_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup4_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup5_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup6_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup1_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup2_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup3_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup4_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup5_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup6_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+
+		/*
+		 * Some 8992 boards might *possibly* use
+		 * PCIe1 clocks and controller, but it's not
+		 * standard and they should be disabled otherwise.
+		 */
+		gcc_msm8994_desc.clks[PCIE_1_AUX_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[PCIE_1_PIPE_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[PCIE_1_PHY_LDO] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_AUX_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_CFG_AHB_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_MSTR_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_PIPE_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_SLV_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_SYS_NOC_UFS_AXI_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
 }
 
-- 
2.33.0


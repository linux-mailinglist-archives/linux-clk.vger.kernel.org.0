Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACC0761E8
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2019 11:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGZJYG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Jul 2019 05:24:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59266 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfGZJYG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jul 2019 05:24:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8501661793; Fri, 26 Jul 2019 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133043;
        bh=Bg+Z6pSfZ2ZG1fMXgEz69PLK+oMHlgo85n1KuAgr59U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TV/goBESPkMv2fVK6ZGXUBatcdL8O+2C/snnF5EWfXwZVokYWlch1QxDRwCu2uheB
         BGm6EbbeOf4P83yNANg8iMQz/Hl32A33sXaYNu58MSTYDNXl+KXtwABbM4F4cWsWkE
         E41wqTZJG3uP4WNPD2AhmVY0hDgYXrxDnFDYzCiU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9F61615E7;
        Fri, 26 Jul 2019 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133038;
        bh=Bg+Z6pSfZ2ZG1fMXgEz69PLK+oMHlgo85n1KuAgr59U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xlo9jE7raiLwR73IK7Gs+e8eC+MNAfCs+jYjY9dTr62hufIOqNkDFyCxb8I9vGf7h
         LGqn3ATghYHoT5TLOvzA/MhkJqRqY+Z52CI1JkfxpjquMjsBjzUXBqPyb95v8adPuJ
         bEIoFI6RX/Rp2NtSdYAlaC5li1iHk3AU4e74mkHM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9F61615E7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 6/7] remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
Date:   Fri, 26 Jul 2019 14:53:31 +0530
Message-Id: <20190726092332.25202-7-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add non PAS WCSS remoteproc driver support for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 570 ++++++++++++++++++++++++++--
 1 file changed, 532 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 84accf1755e9..c2e75f5b5737 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -4,14 +4,19 @@
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
  */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include "qcom_common.h"
@@ -24,6 +29,9 @@
 #define Q6SS_GFMUX_CTL_REG		0x020
 #define Q6SS_PWR_CTL_REG		0x030
 #define Q6SS_MEM_PWR_CTL		0x0B0
+#define Q6SS_STRAP_ACC			0x110
+#define Q6SS_CGC_OVERRIDE		0x034
+#define Q6SS_BCR_REG			0x6000
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -37,14 +45,19 @@
 #define Q6SS_CORE_ARES			BIT(1)
 #define Q6SS_BUS_ARES_ENABLE		BIT(2)
 
+/* Q6SS_BRC_RESET */
+#define Q6SS_BRC_BLK_ARES		BIT(0)
+
 /* Q6SS_GFMUX_CTL */
 #define Q6SS_CLK_ENABLE			BIT(1)
+#define Q6SS_SWITCH_CLK_SRC		BIT(8)
 
 /* Q6SS_PWR_CTL */
 #define Q6SS_L2DATA_STBY_N		BIT(18)
 #define Q6SS_SLP_RET_N			BIT(19)
 #define Q6SS_CLAMP_IO			BIT(20)
 #define QDSS_BHS_ON			BIT(21)
+#define QDSS_Q6_MEMORIES		GENMASK(15, 0)
 
 /* Q6SS parameters */
 #define Q6SS_LDO_BYP		BIT(25)
@@ -53,6 +66,7 @@
 #define Q6SS_CLAMP_QMC_MEM		BIT(22)
 #define HALT_CHECK_MAX_LOOPS		200
 #define Q6SS_XO_CBCR		GENMASK(5, 3)
+#define Q6SS_SLEEP_CBCR		GENMASK(5, 2)
 
 /* Q6SS config/status registers */
 #define TCSR_GLOBAL_CFG0	0x0
@@ -71,9 +85,23 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
+#define MAX_HALT_REG		3
+enum {
+	WCSS_IPQ8074,
+	WCSS_QCS404,
+};
+
 struct wcss_data {
 	const char *firmware_name;
 	int crash_reason_smem;
+	u32 version;
+	bool aon_reset_required;
+	bool wcss_q6_reset_required;
+	const char *ssr_name;
+	const char *sysmon_name;
+	int ssctl_id;
+	const struct rproc_ops *ops;
+	bool requires_force_stop;
 };
 
 struct q6v5_wcss {
@@ -87,9 +115,29 @@ struct q6v5_wcss {
 	u32 halt_wcss;
 	u32 halt_nc;
 
+	struct clk *xo;
+	struct clk *ahbfabric_cbcr_clk;
+	struct clk *gcc_abhs_cbcr;
+	struct clk *gcc_axim_cbcr;
+	struct clk *lcc_csr_cbcr;
+	struct clk *ahbs_cbcr;
+	struct clk *tcm_slave_cbcr;
+	struct clk *qdsp6ss_abhm_cbcr;
+	struct clk *qdsp6ss_sleep_cbcr;
+	struct clk *qdsp6ss_axim_cbcr;
+	struct clk *qdsp6ss_xo_cbcr;
+	struct clk *qdsp6ss_core_gfmux;
+	struct clk *lcc_bcr_sleep;
+	struct regulator *cx_supply;
+
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_sysmon *sysmon;
+
 	struct reset_control *wcss_aon_reset;
 	struct reset_control *wcss_reset;
 	struct reset_control *wcss_q6_reset;
+	struct reset_control *wcss_q6_bcr_reset;
 
 	struct qcom_q6v5 q6v5;
 
@@ -99,6 +147,8 @@ struct q6v5_wcss {
 	size_t mem_size;
 
 	int crash_reason_smem;
+	u32 version;
+	bool requires_force_stop;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -241,6 +291,207 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	return ret;
 }
 
+static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+	int ret, idx;
+
+	/* Toggle the restart */
+	reset_control_assert(wcss->wcss_reset);
+	usleep_range(200, 300);
+	reset_control_deassert(wcss->wcss_reset);
+	usleep_range(200, 300);
+
+	/* Enable GCC_WDSP_Q6SS_AHBS_CBCR clock */
+	ret = clk_prepare_enable(wcss->gcc_abhs_cbcr);
+	if (ret)
+		return ret;
+
+	/* Remove reset to the WCNSS QDSP6SS */
+	reset_control_deassert(wcss->wcss_q6_bcr_reset);
+
+	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
+	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
+	if (ret)
+		goto disable_gcc_abhs_cbcr_clk;
+
+	/* Enable the LCCCSR CBC clock, Q6SSTOP_Q6SSTOP_LCC_CSR_CBCR clock */
+	ret = clk_prepare_enable(wcss->lcc_csr_cbcr);
+	if (ret)
+		goto disable_ahbfabric_cbcr_clk;
+
+	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
+	ret = clk_prepare_enable(wcss->ahbs_cbcr);
+	if (ret)
+		goto disable_csr_cbcr_clk;
+
+	/* Enable the TCM slave CBC, Q6SSTOP_Q6SS_TCM_SLAVE_CBCR clock */
+	ret = clk_prepare_enable(wcss->tcm_slave_cbcr);
+	if (ret)
+		goto disable_ahbs_cbcr_clk;
+
+	/* Enable the Q6SS AHB master CBC, Q6SSTOP_Q6SS_AHBM_CBCR clock */
+	ret = clk_prepare_enable(wcss->qdsp6ss_abhm_cbcr);
+	if (ret)
+		goto disable_tcm_slave_cbcr_clk;
+
+	/* Enable the Q6SS AXI master CBC, Q6SSTOP_Q6SS_AXIM_CBCR clock */
+	ret = clk_prepare_enable(wcss->qdsp6ss_axim_cbcr);
+	if (ret)
+		goto disable_abhm_cbcr_clk;
+
+	/* Enable the Q6SS XO CBC */
+	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
+	val |= BIT(0);
+	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
+	/* Read CLKOFF bit to go low indicating CLK is enabled */
+	ret = readl_poll_timeout(wcss->reg_base + Q6SS_XO_CBCR,
+				 val, !(val & BIT(31)), 1,
+				 HALT_CHECK_MAX_LOOPS);
+	if (ret) {
+		dev_err(wcss->dev,
+			"xo cbcr enabling timed out (rc:%d)\n", ret);
+		return ret;
+	}
+
+	writel(0, wcss->reg_base + Q6SS_CGC_OVERRIDE);
+
+	/* Enable QDSP6 sleep clock clock */
+	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val |= BIT(0);
+	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+
+	/* Enable the Enable the Q6 AXI clock, GCC_WDSP_Q6SS_AXIM_CBCR*/
+	ret = clk_prepare_enable(wcss->gcc_axim_cbcr);
+	if (ret)
+		goto disable_sleep_cbcr_clk;
+
+	/* Assert resets, stop core */
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	/* Program the QDSP6SS PWR_CTL register */
+	writel(0x01700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x03700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x03300000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x033C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	/*
+	 * Enable memories by turning on the QDSP6 memory foot/head switch, one
+	 * bank at a time to avoid in-rush current
+	 */
+	for (idx = 28; idx >= 0; idx--) {
+		writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) |
+			(1 << idx)), wcss->reg_base + Q6SS_MEM_PWR_CTL);
+	}
+
+	writel(0x031C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+	writel(0x030C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val &= ~Q6SS_CORE_ARES;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	/* Enable the Q6 core clock at the GFM, Q6SSTOP_QDSP6SS_GFMUX_CTL */
+	val = readl(wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	val |= Q6SS_CLK_ENABLE | Q6SS_SWITCH_CLK_SRC;
+	writel(val, wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+
+	/* Enable sleep clock branch needed for BCR circuit */
+	ret = clk_prepare_enable(wcss->lcc_bcr_sleep);
+	if (ret)
+		goto disable_core_gfmux_clk;
+
+	return 0;
+
+disable_core_gfmux_clk:
+	val = readl(wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	val &= ~(Q6SS_CLK_ENABLE | Q6SS_SWITCH_CLK_SRC);
+	writel(val, wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	clk_disable_unprepare(wcss->gcc_axim_cbcr);
+disable_sleep_cbcr_clk:
+	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val &= ~Q6SS_CLK_ENABLE;
+	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
+	val &= ~Q6SS_CLK_ENABLE;
+	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
+	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+disable_abhm_cbcr_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
+disable_tcm_slave_cbcr_clk:
+	clk_disable_unprepare(wcss->tcm_slave_cbcr);
+disable_ahbs_cbcr_clk:
+	clk_disable_unprepare(wcss->ahbs_cbcr);
+disable_csr_cbcr_clk:
+	clk_disable_unprepare(wcss->lcc_csr_cbcr);
+disable_ahbfabric_cbcr_clk:
+	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+disable_gcc_abhs_cbcr_clk:
+	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
+
+	return ret;
+}
+
+static inline int q6v5_wcss_qcs404_reset(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+
+	writel(0x80800000, wcss->reg_base + Q6SS_STRAP_ACC);
+
+	/* Start core execution */
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val &= ~Q6SS_STOP_CORE;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	return 0;
+}
+
+static int q6v5_qcs404_wcss_start(struct rproc *rproc)
+{
+	struct q6v5_wcss *wcss = rproc->priv;
+	int ret;
+
+	ret = clk_prepare_enable(wcss->xo);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(wcss->cx_supply);
+	if (ret)
+		goto disable_xo_clk;
+
+	qcom_q6v5_prepare(&wcss->q6v5);
+
+	ret = q6v5_wcss_qcs404_power_on(wcss);
+	if (ret) {
+		dev_err(wcss->dev, "wcss clk_enable failed\n");
+		goto disable_cx_supply;
+	}
+
+	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+
+	q6v5_wcss_qcs404_reset(wcss);
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
+	if (ret == -ETIMEDOUT) {
+		dev_err(wcss->dev, "start timed out\n");
+		goto disable_cx_supply;
+	}
+
+	return 0;
+
+disable_cx_supply:
+	regulator_disable(wcss->cx_supply);
+disable_xo_clk:
+	clk_disable_unprepare(wcss->xo);
+
+	return ret;
+}
+
 static void q6v5_wcss_halt_axi_port(struct q6v5_wcss *wcss,
 				    struct regmap *halt_map,
 				    u32 offset)
@@ -275,6 +526,70 @@ static void q6v5_wcss_halt_axi_port(struct q6v5_wcss *wcss,
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
 }
 
+static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+	int ret;
+
+	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_wcss);
+
+	/* assert clamps to avoid MX current inrush */
+	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
+	val |= (Q6SS_CLAMP_IO | Q6SS_CLAMP_WL | Q6SS_CLAMP_QMC_MEM);
+	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	/* Disable memories by turning off memory foot/headswitch */
+	writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) &
+		~QDSS_Q6_MEMORIES),
+		wcss->reg_base + Q6SS_MEM_PWR_CTL);
+
+	/* Clear the BHS_ON bit */
+	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
+	val &= ~Q6SS_BHS_ON;
+	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+	clk_disable_unprepare(wcss->lcc_csr_cbcr);
+	clk_disable_unprepare(wcss->tcm_slave_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+
+	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val &= ~BIT(0);
+	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+
+	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
+	val &= ~BIT(0);
+	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
+
+	clk_disable_unprepare(wcss->ahbs_cbcr);
+	clk_disable_unprepare(wcss->lcc_bcr_sleep);
+
+	val = readl(wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	val &= ~(Q6SS_CLK_ENABLE | Q6SS_SWITCH_CLK_SRC);
+	writel(val, wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+
+	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
+
+	ret = reset_control_assert(wcss->wcss_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_reset failed\n");
+		return ret;
+	}
+	usleep_range(200, 300);
+
+	ret = reset_control_deassert(wcss->wcss_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_reset failed\n");
+		return ret;
+	}
+	usleep_range(200, 300);
+
+	clk_disable_unprepare(wcss->gcc_axim_cbcr);
+
+	return 0;
+}
+
 static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -394,20 +709,28 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	int ret;
 
 	/* WCSS powerdown */
-	ret = qcom_q6v5_request_stop(&wcss->q6v5);
-	if (ret == -ETIMEDOUT) {
-		dev_err(wcss->dev, "timed out on wait\n");
-		return ret;
+	if (wcss->requires_force_stop) {
+		ret = qcom_q6v5_request_stop(&wcss->q6v5);
+		if (ret == -ETIMEDOUT) {
+			dev_err(wcss->dev, "timed out on wait\n");
+			return ret;
+		}
 	}
 
-	ret = q6v5_wcss_powerdown(wcss);
-	if (ret)
-		return ret;
-
-	/* Q6 Power down */
-	ret = q6v5_q6_powerdown(wcss);
-	if (ret)
-		return ret;
+	if (wcss->version == WCSS_QCS404) {
+		ret = q6v5_qcs404_wcss_shutdown(wcss);
+		if (ret)
+			return ret;
+	} else {
+		ret = q6v5_wcss_powerdown(wcss);
+		if (ret)
+			return ret;
+
+		/* Q6 Power down */
+		ret = q6v5_q6_powerdown(wcss);
+		if (ret)
+			return ret;
+	}
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
@@ -443,14 +766,26 @@ static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.get_boot_addr = rproc_elf_get_boot_addr,
 };
 
-static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
+static const struct rproc_ops q6v5_wcss_qcs404_ops = {
+	.start = q6v5_qcs404_wcss_start,
+	.stop = q6v5_wcss_stop,
+	.da_to_va = q6v5_wcss_da_to_va,
+	.load = q6v5_wcss_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.parse_fw = qcom_register_dump_segments,
+};
+
+static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
+				const struct wcss_data *desc)
 {
 	struct device *dev = wcss->dev;
 
-	wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");
-	if (IS_ERR(wcss->wcss_aon_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_aon_reset\n");
-		return PTR_ERR(wcss->wcss_aon_reset);
+	if (desc->aon_reset_required) {
+		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");;
+		if (IS_ERR(wcss->wcss_aon_reset)) {
+			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
+			return PTR_ERR(wcss->wcss_aon_reset);
+		}
 	}
 
 	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
@@ -459,10 +794,18 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
-	if (IS_ERR(wcss->wcss_q6_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
-		return PTR_ERR(wcss->wcss_q6_reset);
+	if (desc->wcss_q6_reset_required) {
+		wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+		if (IS_ERR(wcss->wcss_q6_reset)) {
+			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
+			return PTR_ERR(wcss->wcss_q6_reset);
+		}
+	}
+
+	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
+	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
+		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
+		return PTR_ERR(wcss->wcss_q6_bcr_reset);
 	}
 
 	return 0;
@@ -471,35 +814,48 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
 static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 			       struct platform_device *pdev)
 {
-	struct of_phandle_args args;
+	unsigned int halt_reg[MAX_HALT_REG] = {0};
+	struct device_node *syscon;
 	struct resource *res;
 	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
-	wcss->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	wcss->reg_base = devm_ioremap(&pdev->dev, res->start,
+				      resource_size(res));
 	if (IS_ERR(wcss->reg_base))
 		return PTR_ERR(wcss->reg_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
-	wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(wcss->rmb_base))
-		return PTR_ERR(wcss->rmb_base);
+	if (wcss->version == WCSS_IPQ8074) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
+		wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(wcss->rmb_base))
+			return PTR_ERR(wcss->rmb_base);
+	}
 
-	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-					       "qcom,halt-regs", 3, 0, &args);
-	if (ret < 0) {
+	syscon = of_parse_phandle(pdev->dev.of_node,
+				  "qcom,halt-regs", 0);
+	if (!syscon) {
 		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
 		return -EINVAL;
 	}
 
-	wcss->halt_map = syscon_node_to_regmap(args.np);
-	of_node_put(args.np);
+	wcss->halt_map = syscon_node_to_regmap(syscon);
+	of_node_put(syscon);
 	if (IS_ERR(wcss->halt_map))
 		return PTR_ERR(wcss->halt_map);
 
-	wcss->halt_q6 = args.args[0];
-	wcss->halt_wcss = args.args[1];
-	wcss->halt_nc = args.args[2];
+	ret = of_property_read_variable_u32_array(pdev->dev.of_node,
+						  "qcom,halt-regs",
+						  halt_reg, 0,
+						  MAX_HALT_REG);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
+		return -EINVAL;
+	}
+
+	wcss->halt_q6 = halt_reg[0];
+	wcss->halt_wcss = halt_reg[1];
+	wcss->halt_nc = halt_reg[2];
 
 	return 0;
 }
@@ -533,6 +889,107 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
+{
+	int ret;
+
+	wcss->xo = devm_clk_get(wcss->dev, "xo");
+	if (IS_ERR(wcss->xo)) {
+		ret = PTR_ERR(wcss->xo);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get xo clock");
+		return ret;
+	}
+
+	wcss->gcc_abhs_cbcr = devm_clk_get(wcss->dev, "gcc_abhs_cbcr");
+	if (IS_ERR(wcss->gcc_abhs_cbcr)) {
+		ret = PTR_ERR(wcss->gcc_abhs_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get gcc abhs clock");
+		return PTR_ERR(wcss->gcc_abhs_cbcr);
+	}
+
+	wcss->gcc_axim_cbcr = devm_clk_get(wcss->dev, "gcc_axim_cbcr");
+	if (IS_ERR(wcss->gcc_axim_cbcr)) {
+		ret = PTR_ERR(wcss->gcc_axim_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get gcc axim clock\n");
+		return PTR_ERR(wcss->gcc_axim_cbcr);
+	}
+
+	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
+						"lcc_ahbfabric_cbc");
+	if (IS_ERR(wcss->ahbfabric_cbcr_clk)) {
+		ret = PTR_ERR(wcss->ahbfabric_cbcr_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get ahbfabric clock\n");
+		return PTR_ERR(wcss->ahbfabric_cbcr_clk);
+	}
+
+	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
+	if (IS_ERR(wcss->lcc_csr_cbcr)) {
+		ret = PTR_ERR(wcss->lcc_csr_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get csr cbcr clk\n");
+		return PTR_ERR(wcss->lcc_csr_cbcr);
+	}
+
+	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
+				       "lcc_abhs_cbc");
+	if (IS_ERR(wcss->ahbs_cbcr)) {
+		ret = PTR_ERR(wcss->ahbs_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get ahbs_cbcr clk\n");
+		return PTR_ERR(wcss->ahbs_cbcr);
+	}
+
+	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
+					    "lcc_tcm_slave_cbc");
+	if (IS_ERR(wcss->tcm_slave_cbcr)) {
+		ret = PTR_ERR(wcss->tcm_slave_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get tcm cbcr clk\n");
+		return PTR_ERR(wcss->tcm_slave_cbcr);
+	}
+
+	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
+	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get abhm cbcr clk\n");
+		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+	}
+
+	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
+	if (IS_ERR(wcss->qdsp6ss_axim_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_axim_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get axim cbcr clk\n");
+		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+	}
+
+	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
+	if (IS_ERR(wcss->lcc_bcr_sleep)) {
+		ret = PTR_ERR(wcss->lcc_bcr_sleep);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get bcr cbcr clk\n");
+		return PTR_ERR(wcss->lcc_bcr_sleep);
+	}
+
+	return 0;
+}
+
+static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
+{
+	wcss->cx_supply = devm_regulator_get(wcss->dev, "cx");
+	if (IS_ERR(wcss->cx_supply))
+		return PTR_ERR(wcss->cx_supply);
+
+	regulator_set_load(wcss->cx_supply, 100000);
+
+	return 0;
+}
+
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
 	const struct wcss_data *desc;
@@ -544,7 +1001,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ipq8074_ops,
+	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
 			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
@@ -553,7 +1010,10 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss = rproc->priv;
 	wcss->dev = &pdev->dev;
-	wcss->crash_reason_smem = desc->crash_reason_smem;
+	wcss->version = desc->version;
+
+	wcss->version = desc->version;
+	wcss->requires_force_stop = desc->requires_force_stop;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -563,7 +1023,17 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = q6v5_wcss_init_reset(wcss);
+	if (wcss->version == WCSS_QCS404) {
+		ret = q6v5_wcss_init_clock(wcss);
+		if (ret)
+			goto free_rproc;
+
+		ret = q6v5_wcss_init_regulator(wcss);
+		if (ret)
+			goto free_rproc;
+	}
+
+	ret = q6v5_wcss_init_reset(wcss, desc);
 	if (ret)
 		goto free_rproc;
 
@@ -572,6 +1042,12 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ssr_name);
+	wcss->sysmon = qcom_add_sysmon_subdev(rproc,
+					      desc->sysmon_name,
+					      desc->ssctl_id);
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -599,10 +1075,28 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
+	.aon_reset_required = true,
+	.wcss_q6_reset_required = true,
+	.ops = &q6v5_wcss_ipq8074_ops,
+	.requires_force_stop = true,
+};
+
+static const struct wcss_data wcss_qcs404_res_init = {
+	.crash_reason_smem = WCSS_CRASH_REASON,
+	.firmware_name = "wcnss.mdt",
+	.version = WCSS_QCS404,
+	.aon_reset_required = false,
+	.wcss_q6_reset_required = false,
+	.ssr_name = "mpss",
+	.sysmon_name = "wcnss",
+	.ssctl_id = 0x12,
+	.ops = &q6v5_wcss_qcs404_ops,
+	.requires_force_stop = false,
 };
 
 static const struct of_device_id q6v5_wcss_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "qcom,qcs404-wcss-pil", .data = &wcss_qcs404_res_init },
 
 	{ },
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


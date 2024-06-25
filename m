Return-Path: <linux-clk+bounces-8610-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7152915F91
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 09:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D7A1F2258D
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 07:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C56A149C7D;
	Tue, 25 Jun 2024 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j9nGXBuw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C619146D5A;
	Tue, 25 Jun 2024 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299213; cv=none; b=FNCzNDQSXS+SkZuzevHYHkjNDltUkwIkreO9OxC1zKhllBx02J6dea/hfk/2Z+sPBFGiEh6nKHH7ji2A98igYdjnntrMIfnDjrdws8ca+D29AM8d5OdlBKuLDUIqyAlFO6r2mXr514e5RBA2mHNiktKHuaHISRGvIOYMHkwBn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299213; c=relaxed/simple;
	bh=wekJYj2o7J58DDDsOmMC6z/j7TWT6taSv9u6aCqo0pU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvedwBy9Ia+PKA7pth403YoCMk/DceIjg/Ldjr0NMz++Ev85I2ULJCcK4VLo5vAVg95/ZviuAaRnz4JrTK0rB9gSwA0/iMm15bvfkWLHLN97KDab93lYP92Od88i1tbtMrNin9SnbZ7HJxWqgw8cx6j+C2kx12AmW0SwVk5liUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j9nGXBuw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OHV4gj001863;
	Tue, 25 Jun 2024 07:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RBFnJRByyQy
	OlMv0J96vjgkSkKWUAczmNgzZjuXrjNo=; b=j9nGXBuwETv92eSt0v+YA+7GeAn
	JZTu48Wu2m66jsJvQQDwsU553oFkh8kfPZSu5HDIclq8WyKk2W88BMs8G9F4aryw
	+7wEe2t2KhCVNQLNAC2mw7fLuRnlwgH2WVC+dg2JMBeKKHW8TyqLSL6jhj7FJsoo
	KjPSLG+UpDozsx81Kmj9i5G1bOJ5Ok8NnM7uew/3M+xFqASlcyL81l3l5f2TiMsa
	iFZaJrX9lMkWwtdoCkZfmllcVpHvqK+XVhx8DVOCBNEgkB7N3FLnWl/z5El+CCKS
	cX8940iVZypdw7Eh+ymOCDNrW/NQR6xK4nZMD8YlF9SXE2Xn8jhiqSNdCHg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaewyww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:06:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45P75CGY013158;
	Tue, 25 Jun 2024 07:05:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpky2v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45P75dH2013356;
	Tue, 25 Jun 2024 07:05:39 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45P75dHQ013348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:39 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id E59A5419A2; Tue, 25 Jun 2024 12:35:36 +0530 (+0530)
From: Devi Priya <quic_devipriy@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
        nfraprado@collabora.com, u-kumar1@ti.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for IPQ9574
Date: Tue, 25 Jun 2024 12:35:34 +0530
Message-Id: <20240625070536.3043630-6-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XMyzuZMjdsVXM7nzFb0M0CuBmW1FO3WF
X-Proofpoint-GUID: XMyzuZMjdsVXM7nzFb0M0CuBmW1FO3WF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_04,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250053

Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 Changes in V4:
	- NSS being the consumer of GCC_NSSCC_CLK, added support for enabling it
	  in the probe.

 drivers/clk/qcom/Kconfig         |    7 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/nsscc-ipq9574.c | 3082 ++++++++++++++++++++++++++++++
 3 files changed, 3090 insertions(+)
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index cb524c5f46e2..78a9d7a1810e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -255,6 +255,13 @@ config IPQ_GCC_9574
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq9574.
 
+config IPQ_NSSCC_9574
+        tristate "IPQ9574 NSS Clock Controller"
+        depends on ARM64 || COMPILE_TEST
+        depends on IPQ_GCC_9574
+        help
+          Support for NSS clock controller on ipq9574 devices.
+
 config IPQ_NSSCC_QCA8K
 	tristate "QCA8K(QCA8386 or QCA8084) NSS Clock Controller"
 	depends on MDIO_BUS
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d52c04f35e74..c39f4eab69da 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
 obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
+obj-$(CONFIG_IPQ_NSSCC_9574)	+= nsscc-ipq9574.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
 obj-$(CONFIG_IPQ_NSSCC_QCA8K) += nsscc-qca8k.o
 obj-$(CONFIG_MDM_GCC_9607) += gcc-mdm9607.o
diff --git a/drivers/clk/qcom/nsscc-ipq9574.c b/drivers/clk/qcom/nsscc-ipq9574.c
new file mode 100644
index 000000000000..37a71c497327
--- /dev/null
+++ b/drivers/clk/qcom/nsscc-ipq9574.c
@@ -0,0 +1,3082 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/interconnect-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
+#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_XO,
+	DT_BIAS_PLL_CC_CLK,
+	DT_BIAS_PLL_NSS_NOC_CLK,
+	DT_BIAS_PLL_UBI_NC_CLK,
+	DT_GCC_GPLL0_OUT_AUX,
+	DT_UNIPHY0_NSS_RX_CLK,
+	DT_UNIPHY0_NSS_TX_CLK,
+	DT_UNIPHY1_NSS_RX_CLK,
+	DT_UNIPHY1_NSS_TX_CLK,
+	DT_UNIPHY2_NSS_RX_CLK,
+	DT_UNIPHY2_NSS_TX_CLK,
+};
+
+enum {
+	P_XO,
+	P_BIAS_PLL_CC_CLK,
+	P_BIAS_PLL_NSS_NOC_CLK,
+	P_BIAS_PLL_UBI_NC_CLK,
+	P_GCC_GPLL0_OUT_AUX,
+	P_UBI32_PLL_OUT_MAIN,
+	P_UNIPHY0_NSS_RX_CLK,
+	P_UNIPHY0_NSS_TX_CLK,
+	P_UNIPHY1_NSS_RX_CLK,
+	P_UNIPHY1_NSS_TX_CLK,
+	P_UNIPHY2_NSS_RX_CLK,
+	P_UNIPHY2_NSS_TX_CLK,
+};
+
+static const struct alpha_pll_config ubi32_pll_config = {
+	.l = 0x3e,
+	.alpha = 0x6666,
+	.config_ctl_val = 0x200d4aa8,
+	.config_ctl_hi_val = 0x3c,
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.pre_div_val = 0x0,
+	.pre_div_mask = BIT(12),
+	.post_div_val = 0x0,
+	.post_div_mask = GENMASK(9, 8),
+	.alpha_en_mask = BIT(24),
+	.test_ctl_val = 0x1c0000c0,
+	.test_ctl_hi_val = 0x4000,
+};
+
+static struct clk_alpha_pll ubi32_pll_main = {
+	.offset = 0x28000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ubi32_pll_main",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_XO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv ubi32_pll = {
+	.offset = 0x28000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
+	.width = 2,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ubi32_pll",
+		.parent_hws = (const struct clk_hw *[]) {
+			&ubi32_pll_main.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct parent_map nss_cc_parent_map_0[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_CC_CLK, 1 },
+	{ P_UNIPHY0_NSS_RX_CLK, 2 },
+	{ P_UNIPHY0_NSS_TX_CLK, 3 },
+	{ P_UNIPHY1_NSS_RX_CLK, 4 },
+	{ P_UNIPHY1_NSS_TX_CLK, 5 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_0[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+	{ .index = DT_UNIPHY1_NSS_RX_CLK },
+	{ .index = DT_UNIPHY1_NSS_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_1[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_UBI_NC_CLK, 1 },
+	{ P_GCC_GPLL0_OUT_AUX, 2 },
+	{ P_BIAS_PLL_CC_CLK, 6 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_1[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_UBI_NC_CLK },
+	{ .index = DT_GCC_GPLL0_OUT_AUX },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_2[] = {
+	{ P_XO, 0 },
+	{ P_UBI32_PLL_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_AUX, 2 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_2[] = {
+	{ .index = DT_XO },
+	{ .hw = &ubi32_pll.clkr.hw },
+	{ .index = DT_GCC_GPLL0_OUT_AUX },
+};
+
+static const struct parent_map nss_cc_parent_map_3[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_CC_CLK, 1 },
+	{ P_GCC_GPLL0_OUT_AUX, 2 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_3[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+	{ .index = DT_GCC_GPLL0_OUT_AUX },
+};
+
+static const struct parent_map nss_cc_parent_map_4[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_CC_CLK, 1 },
+	{ P_UNIPHY0_NSS_RX_CLK, 2 },
+	{ P_UNIPHY0_NSS_TX_CLK, 3 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_4[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_5[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_CC_CLK, 1 },
+	{ P_UNIPHY2_NSS_RX_CLK, 2 },
+	{ P_UNIPHY2_NSS_TX_CLK, 3 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_5[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+	{ .index = DT_UNIPHY2_NSS_RX_CLK },
+	{ .index = DT_UNIPHY2_NSS_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_6[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_NSS_NOC_CLK, 1 },
+	{ P_GCC_GPLL0_OUT_AUX, 2 },
+	{ P_BIAS_PLL_CC_CLK, 6 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_6[] = {
+	{ .index = DT_XO },
+	{ .index = DT_BIAS_PLL_NSS_NOC_CLK },
+	{ .index = DT_GCC_GPLL0_OUT_AUX },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_7[] = {
+	{ P_XO, 0 },
+	{ P_UBI32_PLL_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_AUX, 2 },
+	{ P_BIAS_PLL_CC_CLK, 6 },
+};
+
+static const struct clk_parent_data nss_cc_parent_data_7[] = {
+	{ .index = DT_XO },
+	{ .hw = &ubi32_pll.clkr.hw },
+	{ .index = DT_GCC_GPLL0_OUT_AUX },
+	{ .index = DT_BIAS_PLL_CC_CLK },
+};
+
+static const struct freq_tbl ftbl_nss_cc_ce_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(353000000, P_BIAS_PLL_UBI_NC_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_ce_clk_src = {
+	.cmd_rcgr = 0x28404,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_1,
+	.freq_tbl = ftbl_nss_cc_ce_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ce_clk_src",
+		.parent_data = nss_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_cfg_clk_src[] = {
+	F(100000000, P_GCC_GPLL0_OUT_AUX, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_cfg_clk_src = {
+	.cmd_rcgr = 0x28104,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_3,
+	.freq_tbl = ftbl_nss_cc_cfg_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_cfg_clk_src",
+		.parent_data = nss_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_clc_clk_src[] = {
+	F(533333333, P_GCC_GPLL0_OUT_AUX, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_clc_clk_src = {
+	.cmd_rcgr = 0x28604,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_6,
+	.freq_tbl = ftbl_nss_cc_clc_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_clc_clk_src",
+		.parent_data = nss_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_crypto_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(300000000, P_BIAS_PLL_CC_CLK, 4, 0, 0),
+	F(600000000, P_BIAS_PLL_CC_CLK, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_crypto_clk_src = {
+	.cmd_rcgr = 0x16008,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_3,
+	.freq_tbl = ftbl_nss_cc_crypto_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_crypto_clk_src",
+		.parent_data = nss_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_haq_clk_src = {
+	.cmd_rcgr = 0x28304,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_1,
+	.freq_tbl = ftbl_nss_cc_ce_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_haq_clk_src",
+		.parent_data = nss_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_imem_clk_src = {
+	.cmd_rcgr = 0xe008,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_1,
+	.freq_tbl = ftbl_nss_cc_ce_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_imem_clk_src",
+		.parent_data = nss_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_int_cfg_clk_src[] = {
+	F(200000000, P_GCC_GPLL0_OUT_AUX, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_int_cfg_clk_src = {
+	.cmd_rcgr = 0x287b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_3,
+	.freq_tbl = ftbl_nss_cc_int_cfg_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_int_cfg_clk_src",
+		.parent_data = nss_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_rx_clk_src_25),
+	FMS(78125000, P_UNIPHY0_NSS_RX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port1_rx_clk_src_125),
+	FMS(312500000, P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_tx_clk_src_25),
+	FMS(78125000, P_UNIPHY0_NSS_TX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port1_tx_clk_src_125),
+	FMS(312500000, P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 1, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_rx_clk_src_25),
+	FMS(78125000, P_UNIPHY1_NSS_RX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port5_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_RX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_rx_clk_src_312p5),
+	{ }
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 1, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_tx_clk_src_25),
+	FMS(78125000, P_UNIPHY1_NSS_TX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port5_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_TX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_tx_clk_src_312p5),
+	{ }
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_rx_clk_src_25),
+	FMS(78125000, P_UNIPHY2_NSS_RX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port6_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_RX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_tx_clk_src_25),
+	FMS(78125000, P_UNIPHY2_NSS_TX_CLK, 4, 0, 0),
+	FM(125000000, ftbl_nss_cc_port6_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_TX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port1_rx_clk_src = {
+	.cmd_rcgr = 0x28110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_rx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port1_tx_clk_src = {
+	.cmd_rcgr = 0x2811c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_tx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_rx_clk_src = {
+	.cmd_rcgr = 0x28128,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_rx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_tx_clk_src = {
+	.cmd_rcgr = 0x28134,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_tx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_rx_clk_src = {
+	.cmd_rcgr = 0x28140,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_rx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_tx_clk_src = {
+	.cmd_rcgr = 0x2814c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_tx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port4_rx_clk_src = {
+	.cmd_rcgr = 0x28158,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_rx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port4_tx_clk_src = {
+	.cmd_rcgr = 0x28164,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_4,
+	.freq_multi_tbl = ftbl_nss_cc_port1_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_tx_clk_src",
+		.parent_data = nss_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_4),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port5_rx_clk_src = {
+	.cmd_rcgr = 0x28170,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_0,
+	.freq_multi_tbl = ftbl_nss_cc_port5_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_rx_clk_src",
+		.parent_data = nss_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_0),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port5_tx_clk_src = {
+	.cmd_rcgr = 0x2817c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_0,
+	.freq_multi_tbl = ftbl_nss_cc_port5_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_tx_clk_src",
+		.parent_data = nss_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_0),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port6_rx_clk_src = {
+	.cmd_rcgr = 0x28188,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_5,
+	.freq_multi_tbl = ftbl_nss_cc_port6_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_rx_clk_src",
+		.parent_data = nss_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_5),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port6_tx_clk_src = {
+	.cmd_rcgr = 0x28194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_5,
+	.freq_multi_tbl = ftbl_nss_cc_port6_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_tx_clk_src",
+		.parent_data = nss_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_5),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ppe_clk_src = {
+	.cmd_rcgr = 0x28204,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_1,
+	.freq_tbl = ftbl_nss_cc_ce_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ppe_clk_src",
+		.parent_data = nss_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_ubi0_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(187200000, P_UBI32_PLL_OUT_MAIN, 8, 0, 0),
+	F(748800000, P_UBI32_PLL_OUT_MAIN, 2, 0, 0),
+	F(1497600000, P_UBI32_PLL_OUT_MAIN, 1, 0, 0),
+	F(1689600000, P_UBI32_PLL_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_ubi0_clk_src = {
+	.cmd_rcgr = 0x28704,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_2,
+	.freq_tbl = ftbl_nss_cc_ubi0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi0_clk_src",
+		.parent_data = nss_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ubi1_clk_src = {
+	.cmd_rcgr = 0x2870c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_2,
+	.freq_tbl = ftbl_nss_cc_ubi0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi1_clk_src",
+		.parent_data = nss_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ubi2_clk_src = {
+	.cmd_rcgr = 0x28714,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_2,
+	.freq_tbl = ftbl_nss_cc_ubi0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi2_clk_src",
+		.parent_data = nss_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ubi3_clk_src = {
+	.cmd_rcgr = 0x2871c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_2,
+	.freq_tbl = ftbl_nss_cc_ubi0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi3_clk_src",
+		.parent_data = nss_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ubi_axi_clk_src = {
+	.cmd_rcgr = 0x28724,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_7,
+	.freq_tbl = ftbl_nss_cc_clc_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi_axi_clk_src",
+		.parent_data = nss_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_ubi_nc_axi_bfdcd_clk_src = {
+	.cmd_rcgr = 0x2872c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_1,
+	.freq_tbl = ftbl_nss_cc_ce_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi_nc_axi_bfdcd_clk_src",
+		.parent_data = nss_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(nss_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_rx_div_clk_src = {
+	.reg = 0x28118,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port1_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_tx_div_clk_src = {
+	.reg = 0x28124,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port1_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_rx_div_clk_src = {
+	.reg = 0x28130,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port2_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_tx_div_clk_src = {
+	.reg = 0x2813c,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port2_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_rx_div_clk_src = {
+	.reg = 0x28148,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port3_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_tx_div_clk_src = {
+	.reg = 0x28154,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port3_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_rx_div_clk_src = {
+	.reg = 0x28160,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port4_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_tx_div_clk_src = {
+	.reg = 0x2816c,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port4_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_rx_div_clk_src = {
+	.reg = 0x28178,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port5_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_tx_div_clk_src = {
+	.reg = 0x28184,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port5_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_rx_div_clk_src = {
+	.reg = 0x28190,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_rx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port6_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_tx_div_clk_src = {
+	.reg = 0x2819c,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_tx_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_port6_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_ubi0_div_clk_src = {
+	.reg = 0x287a4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ubi0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_ubi1_div_clk_src = {
+	.reg = 0x287a8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi1_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ubi1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_ubi2_div_clk_src = {
+	.reg = 0x287ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi2_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ubi2_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_ubi3_div_clk_src = {
+	.reg = 0x287b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_ubi3_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ubi3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac0_ptp_ref_div_clk_src = {
+	.reg = 0x28214,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac0_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac1_ptp_ref_div_clk_src = {
+	.reg = 0x28218,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac1_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac2_ptp_ref_div_clk_src = {
+	.reg = 0x2821c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac2_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac3_ptp_ref_div_clk_src = {
+	.reg = 0x28220,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac3_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac4_ptp_ref_div_clk_src = {
+	.reg = 0x28224,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac4_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac5_ptp_ref_div_clk_src = {
+	.reg = 0x28228,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac5_ptp_ref_div_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch nss_cc_ce_apb_clk = {
+	.halt_reg = 0x2840c,
+	.clkr = {
+		.enable_reg = 0x2840c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ce_apb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ce_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ce_axi_clk = {
+	.halt_reg = 0x28410,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28410,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ce_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ce_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_clc_axi_clk = {
+	.halt_reg = 0x2860c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2860c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_clc_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_clc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_crypto_clk = {
+	.halt_reg = 0x1601c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_crypto_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_crypto_ppe_clk = {
+	.halt_reg = 0x28240,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28240,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_crypto_ppe_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_haq_ahb_clk = {
+	.halt_reg = 0x2830c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2830c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_haq_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_haq_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_haq_axi_clk = {
+	.halt_reg = 0x28310,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28310,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_haq_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_haq_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_imem_ahb_clk = {
+	.halt_reg = 0xe018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_imem_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_imem_qsb_clk = {
+	.halt_reg = 0xe010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_imem_qsb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_imem_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nss_csr_clk = {
+	.halt_reg = 0x281d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nss_csr_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ce_apb_clk = {
+	.halt_reg = 0x28414,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28414,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ce_apb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ce_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ce_axi_clk = {
+	.halt_reg = 0x28418,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28418,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ce_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ce_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_clc_axi_clk = {
+	.halt_reg = 0x28610,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28610,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_clc_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_clc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_crypto_clk = {
+	.halt_reg = 0x16020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x16020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_crypto_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_haq_ahb_clk = {
+	.halt_reg = 0x28314,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28314,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_haq_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_haq_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_haq_axi_clk = {
+	.halt_reg = 0x28318,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28318,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_haq_axi_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_haq_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_imem_ahb_clk = {
+	.halt_reg = 0xe01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_imem_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_imem_qsb_clk = {
+	.halt_reg = 0xe014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_imem_qsb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_imem_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_nss_csr_clk = {
+	.halt_reg = 0x281d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_nss_csr_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_cfg_clk = {
+	.halt_reg = 0x28248,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28248,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ppe_cfg_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_clk = {
+	.halt_reg = 0x28244,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28244,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ppe_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ubi32_ahb0_clk = {
+	.halt_reg = 0x28788,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28788,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ubi32_ahb0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ubi32_axi0_clk = {
+	.halt_reg = 0x287a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x287a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ubi32_axi0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ubi32_int0_ahb_clk = {
+	.halt_reg = 0x2878c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2878c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ubi32_int0_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_int_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ubi32_nc_axi0_1_clk = {
+	.halt_reg = 0x287bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x287bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ubi32_nc_axi0_1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ubi32_nc_axi0_clk = {
+	.halt_reg = 0x28764,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28764,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_nssnoc_ubi32_nc_axi0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_mac_clk = {
+	.halt_reg = 0x2824c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2824c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port1_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_rx_clk = {
+	.halt_reg = 0x281a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port1_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_tx_clk = {
+	.halt_reg = 0x281a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port1_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_mac_clk = {
+	.halt_reg = 0x28250,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28250,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port2_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_rx_clk = {
+	.halt_reg = 0x281a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port2_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_tx_clk = {
+	.halt_reg = 0x281ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port2_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_mac_clk = {
+	.halt_reg = 0x28254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port3_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_rx_clk = {
+	.halt_reg = 0x281b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port3_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_tx_clk = {
+	.halt_reg = 0x281b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port3_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_mac_clk = {
+	.halt_reg = 0x28258,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28258,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port4_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_rx_clk = {
+	.halt_reg = 0x281b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port4_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_tx_clk = {
+	.halt_reg = 0x281bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port4_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_mac_clk = {
+	.halt_reg = 0x2825c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2825c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port5_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_rx_clk = {
+	.halt_reg = 0x281c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port5_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_tx_clk = {
+	.halt_reg = 0x281c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port5_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_mac_clk = {
+	.halt_reg = 0x28260,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28260,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port6_mac_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_rx_clk = {
+	.halt_reg = 0x281c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port6_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_tx_clk = {
+	.halt_reg = 0x281cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x281cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_port6_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_cfg_clk = {
+	.halt_reg = 0x2823c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2823c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_edma_cfg_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_clk = {
+	.halt_reg = 0x28238,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28238,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_edma_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_btq_clk = {
+	.halt_reg = 0x2827c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2827c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_switch_btq_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_cfg_clk = {
+	.halt_reg = 0x28234,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28234,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_switch_cfg_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_clk = {
+	.halt_reg = 0x28230,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28230,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_switch_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_ipe_clk = {
+	.halt_reg = 0x2822c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2822c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ppe_switch_ipe_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_ahb0_clk = {
+	.halt_reg = 0x28768,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28768,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_ahb0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_ahb1_clk = {
+	.halt_reg = 0x28770,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28770,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_ahb1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_ahb2_clk = {
+	.halt_reg = 0x28778,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28778,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_ahb2_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_ahb3_clk = {
+	.halt_reg = 0x28780,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28780,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_ahb3_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_axi0_clk = {
+	.halt_reg = 0x28790,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28790,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_axi0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_axi1_clk = {
+	.halt_reg = 0x28794,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28794,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_axi1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_axi2_clk = {
+	.halt_reg = 0x28798,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28798,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_axi2_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_axi3_clk = {
+	.halt_reg = 0x2879c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2879c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_axi3_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_core0_clk = {
+	.halt_reg = 0x28734,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28734,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_core0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_core1_clk = {
+	.halt_reg = 0x28738,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28738,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_core1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_core2_clk = {
+	.halt_reg = 0x2873c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2873c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_core2_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_core3_clk = {
+	.halt_reg = 0x28740,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28740,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_core3_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi3_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_intr0_ahb_clk = {
+	.halt_reg = 0x2876c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2876c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_intr0_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_int_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_intr1_ahb_clk = {
+	.halt_reg = 0x28774,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28774,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_intr1_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_int_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_intr2_ahb_clk = {
+	.halt_reg = 0x2877c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2877c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_intr2_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_int_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_intr3_ahb_clk = {
+	.halt_reg = 0x28784,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28784,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_intr3_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_int_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_nc_axi0_clk = {
+	.halt_reg = 0x28744,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28744,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_nc_axi0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_nc_axi1_clk = {
+	.halt_reg = 0x2874c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2874c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_nc_axi1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_nc_axi2_clk = {
+	.halt_reg = 0x28754,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28754,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_nc_axi2_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_nc_axi3_clk = {
+	.halt_reg = 0x2875c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2875c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_nc_axi3_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_utcm0_clk = {
+	.halt_reg = 0x28748,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28748,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_utcm0_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_utcm1_clk = {
+	.halt_reg = 0x28750,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28750,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_utcm1_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_utcm2_clk = {
+	.halt_reg = 0x28758,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28758,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_utcm2_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ubi32_utcm3_clk = {
+	.halt_reg = 0x28760,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28760,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ubi32_utcm3_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_rx_clk = {
+	.halt_reg = 0x28904,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28904,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port1_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_tx_clk = {
+	.halt_reg = 0x28908,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28908,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port1_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_rx_clk = {
+	.halt_reg = 0x2890c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2890c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port2_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_tx_clk = {
+	.halt_reg = 0x28910,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28910,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port2_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_rx_clk = {
+	.halt_reg = 0x28914,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28914,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port3_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_tx_clk = {
+	.halt_reg = 0x28918,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28918,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port3_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_rx_clk = {
+	.halt_reg = 0x2891c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2891c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port4_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_tx_clk = {
+	.halt_reg = 0x28920,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28920,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port4_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_rx_clk = {
+	.halt_reg = 0x28924,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28924,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port5_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_tx_clk = {
+	.halt_reg = 0x28928,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28928,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port5_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_rx_clk = {
+	.halt_reg = 0x2892c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2892c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port6_rx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_tx_clk = {
+	.halt_reg = 0x28930,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28930,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_uniphy_port6_tx_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac0_ptp_ref_clk = {
+	.halt_reg = 0x28264,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28264,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac0_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac0_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac1_ptp_ref_clk = {
+	.halt_reg = 0x28268,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28268,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac1_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac1_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac2_ptp_ref_clk = {
+	.halt_reg = 0x2826c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2826c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac2_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac2_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac3_ptp_ref_clk = {
+	.halt_reg = 0x28270,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28270,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac3_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac3_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac4_ptp_ref_clk = {
+	.halt_reg = 0x28274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac4_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac4_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac5_ptp_ref_clk = {
+	.halt_reg = 0x28278,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28278,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_xgmac5_ptp_ref_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &nss_cc_xgmac5_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *nss_cc_ipq9574_clocks[] = {
+	[NSS_CC_CE_APB_CLK] = &nss_cc_ce_apb_clk.clkr,
+	[NSS_CC_CE_AXI_CLK] = &nss_cc_ce_axi_clk.clkr,
+	[NSS_CC_CE_CLK_SRC] = &nss_cc_ce_clk_src.clkr,
+	[NSS_CC_CFG_CLK_SRC] = &nss_cc_cfg_clk_src.clkr,
+	[NSS_CC_CLC_AXI_CLK] = &nss_cc_clc_axi_clk.clkr,
+	[NSS_CC_CLC_CLK_SRC] = &nss_cc_clc_clk_src.clkr,
+	[NSS_CC_CRYPTO_CLK] = &nss_cc_crypto_clk.clkr,
+	[NSS_CC_CRYPTO_CLK_SRC] = &nss_cc_crypto_clk_src.clkr,
+	[NSS_CC_CRYPTO_PPE_CLK] = &nss_cc_crypto_ppe_clk.clkr,
+	[NSS_CC_HAQ_AHB_CLK] = &nss_cc_haq_ahb_clk.clkr,
+	[NSS_CC_HAQ_AXI_CLK] = &nss_cc_haq_axi_clk.clkr,
+	[NSS_CC_HAQ_CLK_SRC] = &nss_cc_haq_clk_src.clkr,
+	[NSS_CC_IMEM_AHB_CLK] = &nss_cc_imem_ahb_clk.clkr,
+	[NSS_CC_IMEM_CLK_SRC] = &nss_cc_imem_clk_src.clkr,
+	[NSS_CC_IMEM_QSB_CLK] = &nss_cc_imem_qsb_clk.clkr,
+	[NSS_CC_INT_CFG_CLK_SRC] = &nss_cc_int_cfg_clk_src.clkr,
+	[NSS_CC_NSS_CSR_CLK] = &nss_cc_nss_csr_clk.clkr,
+	[NSS_CC_NSSNOC_CE_APB_CLK] = &nss_cc_nssnoc_ce_apb_clk.clkr,
+	[NSS_CC_NSSNOC_CE_AXI_CLK] = &nss_cc_nssnoc_ce_axi_clk.clkr,
+	[NSS_CC_NSSNOC_CLC_AXI_CLK] = &nss_cc_nssnoc_clc_axi_clk.clkr,
+	[NSS_CC_NSSNOC_CRYPTO_CLK] = &nss_cc_nssnoc_crypto_clk.clkr,
+	[NSS_CC_NSSNOC_HAQ_AHB_CLK] = &nss_cc_nssnoc_haq_ahb_clk.clkr,
+	[NSS_CC_NSSNOC_HAQ_AXI_CLK] = &nss_cc_nssnoc_haq_axi_clk.clkr,
+	[NSS_CC_NSSNOC_IMEM_AHB_CLK] = &nss_cc_nssnoc_imem_ahb_clk.clkr,
+	[NSS_CC_NSSNOC_IMEM_QSB_CLK] = &nss_cc_nssnoc_imem_qsb_clk.clkr,
+	[NSS_CC_NSSNOC_NSS_CSR_CLK] = &nss_cc_nssnoc_nss_csr_clk.clkr,
+	[NSS_CC_NSSNOC_PPE_CFG_CLK] = &nss_cc_nssnoc_ppe_cfg_clk.clkr,
+	[NSS_CC_NSSNOC_PPE_CLK] = &nss_cc_nssnoc_ppe_clk.clkr,
+	[NSS_CC_NSSNOC_UBI32_AHB0_CLK] = &nss_cc_nssnoc_ubi32_ahb0_clk.clkr,
+	[NSS_CC_NSSNOC_UBI32_AXI0_CLK] = &nss_cc_nssnoc_ubi32_axi0_clk.clkr,
+	[NSS_CC_NSSNOC_UBI32_INT0_AHB_CLK] =
+		&nss_cc_nssnoc_ubi32_int0_ahb_clk.clkr,
+	[NSS_CC_NSSNOC_UBI32_NC_AXI0_1_CLK] =
+		&nss_cc_nssnoc_ubi32_nc_axi0_1_clk.clkr,
+	[NSS_CC_NSSNOC_UBI32_NC_AXI0_CLK] =
+		&nss_cc_nssnoc_ubi32_nc_axi0_clk.clkr,
+	[NSS_CC_PORT1_MAC_CLK] = &nss_cc_port1_mac_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK] = &nss_cc_port1_rx_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK_SRC] = &nss_cc_port1_rx_clk_src.clkr,
+	[NSS_CC_PORT1_RX_DIV_CLK_SRC] = &nss_cc_port1_rx_div_clk_src.clkr,
+	[NSS_CC_PORT1_TX_CLK] = &nss_cc_port1_tx_clk.clkr,
+	[NSS_CC_PORT1_TX_CLK_SRC] = &nss_cc_port1_tx_clk_src.clkr,
+	[NSS_CC_PORT1_TX_DIV_CLK_SRC] = &nss_cc_port1_tx_div_clk_src.clkr,
+	[NSS_CC_PORT2_MAC_CLK] = &nss_cc_port2_mac_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK] = &nss_cc_port2_rx_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK_SRC] = &nss_cc_port2_rx_clk_src.clkr,
+	[NSS_CC_PORT2_RX_DIV_CLK_SRC] = &nss_cc_port2_rx_div_clk_src.clkr,
+	[NSS_CC_PORT2_TX_CLK] = &nss_cc_port2_tx_clk.clkr,
+	[NSS_CC_PORT2_TX_CLK_SRC] = &nss_cc_port2_tx_clk_src.clkr,
+	[NSS_CC_PORT2_TX_DIV_CLK_SRC] = &nss_cc_port2_tx_div_clk_src.clkr,
+	[NSS_CC_PORT3_MAC_CLK] = &nss_cc_port3_mac_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK] = &nss_cc_port3_rx_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK_SRC] = &nss_cc_port3_rx_clk_src.clkr,
+	[NSS_CC_PORT3_RX_DIV_CLK_SRC] = &nss_cc_port3_rx_div_clk_src.clkr,
+	[NSS_CC_PORT3_TX_CLK] = &nss_cc_port3_tx_clk.clkr,
+	[NSS_CC_PORT3_TX_CLK_SRC] = &nss_cc_port3_tx_clk_src.clkr,
+	[NSS_CC_PORT3_TX_DIV_CLK_SRC] = &nss_cc_port3_tx_div_clk_src.clkr,
+	[NSS_CC_PORT4_MAC_CLK] = &nss_cc_port4_mac_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK] = &nss_cc_port4_rx_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK_SRC] = &nss_cc_port4_rx_clk_src.clkr,
+	[NSS_CC_PORT4_RX_DIV_CLK_SRC] = &nss_cc_port4_rx_div_clk_src.clkr,
+	[NSS_CC_PORT4_TX_CLK] = &nss_cc_port4_tx_clk.clkr,
+	[NSS_CC_PORT4_TX_CLK_SRC] = &nss_cc_port4_tx_clk_src.clkr,
+	[NSS_CC_PORT4_TX_DIV_CLK_SRC] = &nss_cc_port4_tx_div_clk_src.clkr,
+	[NSS_CC_PORT5_MAC_CLK] = &nss_cc_port5_mac_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK] = &nss_cc_port5_rx_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK_SRC] = &nss_cc_port5_rx_clk_src.clkr,
+	[NSS_CC_PORT5_RX_DIV_CLK_SRC] = &nss_cc_port5_rx_div_clk_src.clkr,
+	[NSS_CC_PORT5_TX_CLK] = &nss_cc_port5_tx_clk.clkr,
+	[NSS_CC_PORT5_TX_CLK_SRC] = &nss_cc_port5_tx_clk_src.clkr,
+	[NSS_CC_PORT5_TX_DIV_CLK_SRC] = &nss_cc_port5_tx_div_clk_src.clkr,
+	[NSS_CC_PORT6_MAC_CLK] = &nss_cc_port6_mac_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK] = &nss_cc_port6_rx_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK_SRC] = &nss_cc_port6_rx_clk_src.clkr,
+	[NSS_CC_PORT6_RX_DIV_CLK_SRC] = &nss_cc_port6_rx_div_clk_src.clkr,
+	[NSS_CC_PORT6_TX_CLK] = &nss_cc_port6_tx_clk.clkr,
+	[NSS_CC_PORT6_TX_CLK_SRC] = &nss_cc_port6_tx_clk_src.clkr,
+	[NSS_CC_PORT6_TX_DIV_CLK_SRC] = &nss_cc_port6_tx_div_clk_src.clkr,
+	[NSS_CC_PPE_CLK_SRC] = &nss_cc_ppe_clk_src.clkr,
+	[NSS_CC_PPE_EDMA_CFG_CLK] = &nss_cc_ppe_edma_cfg_clk.clkr,
+	[NSS_CC_PPE_EDMA_CLK] = &nss_cc_ppe_edma_clk.clkr,
+	[NSS_CC_PPE_SWITCH_BTQ_CLK] = &nss_cc_ppe_switch_btq_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CFG_CLK] = &nss_cc_ppe_switch_cfg_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CLK] = &nss_cc_ppe_switch_clk.clkr,
+	[NSS_CC_PPE_SWITCH_IPE_CLK] = &nss_cc_ppe_switch_ipe_clk.clkr,
+	[NSS_CC_UBI0_CLK_SRC] = &nss_cc_ubi0_clk_src.clkr,
+	[NSS_CC_UBI0_DIV_CLK_SRC] = &nss_cc_ubi0_div_clk_src.clkr,
+	[NSS_CC_UBI1_CLK_SRC] = &nss_cc_ubi1_clk_src.clkr,
+	[NSS_CC_UBI1_DIV_CLK_SRC] = &nss_cc_ubi1_div_clk_src.clkr,
+	[NSS_CC_UBI2_CLK_SRC] = &nss_cc_ubi2_clk_src.clkr,
+	[NSS_CC_UBI2_DIV_CLK_SRC] = &nss_cc_ubi2_div_clk_src.clkr,
+	[NSS_CC_UBI32_AHB0_CLK] = &nss_cc_ubi32_ahb0_clk.clkr,
+	[NSS_CC_UBI32_AHB1_CLK] = &nss_cc_ubi32_ahb1_clk.clkr,
+	[NSS_CC_UBI32_AHB2_CLK] = &nss_cc_ubi32_ahb2_clk.clkr,
+	[NSS_CC_UBI32_AHB3_CLK] = &nss_cc_ubi32_ahb3_clk.clkr,
+	[NSS_CC_UBI32_AXI0_CLK] = &nss_cc_ubi32_axi0_clk.clkr,
+	[NSS_CC_UBI32_AXI1_CLK] = &nss_cc_ubi32_axi1_clk.clkr,
+	[NSS_CC_UBI32_AXI2_CLK] = &nss_cc_ubi32_axi2_clk.clkr,
+	[NSS_CC_UBI32_AXI3_CLK] = &nss_cc_ubi32_axi3_clk.clkr,
+	[NSS_CC_UBI32_CORE0_CLK] = &nss_cc_ubi32_core0_clk.clkr,
+	[NSS_CC_UBI32_CORE1_CLK] = &nss_cc_ubi32_core1_clk.clkr,
+	[NSS_CC_UBI32_CORE2_CLK] = &nss_cc_ubi32_core2_clk.clkr,
+	[NSS_CC_UBI32_CORE3_CLK] = &nss_cc_ubi32_core3_clk.clkr,
+	[NSS_CC_UBI32_INTR0_AHB_CLK] = &nss_cc_ubi32_intr0_ahb_clk.clkr,
+	[NSS_CC_UBI32_INTR1_AHB_CLK] = &nss_cc_ubi32_intr1_ahb_clk.clkr,
+	[NSS_CC_UBI32_INTR2_AHB_CLK] = &nss_cc_ubi32_intr2_ahb_clk.clkr,
+	[NSS_CC_UBI32_INTR3_AHB_CLK] = &nss_cc_ubi32_intr3_ahb_clk.clkr,
+	[NSS_CC_UBI32_NC_AXI0_CLK] = &nss_cc_ubi32_nc_axi0_clk.clkr,
+	[NSS_CC_UBI32_NC_AXI1_CLK] = &nss_cc_ubi32_nc_axi1_clk.clkr,
+	[NSS_CC_UBI32_NC_AXI2_CLK] = &nss_cc_ubi32_nc_axi2_clk.clkr,
+	[NSS_CC_UBI32_NC_AXI3_CLK] = &nss_cc_ubi32_nc_axi3_clk.clkr,
+	[NSS_CC_UBI32_UTCM0_CLK] = &nss_cc_ubi32_utcm0_clk.clkr,
+	[NSS_CC_UBI32_UTCM1_CLK] = &nss_cc_ubi32_utcm1_clk.clkr,
+	[NSS_CC_UBI32_UTCM2_CLK] = &nss_cc_ubi32_utcm2_clk.clkr,
+	[NSS_CC_UBI32_UTCM3_CLK] = &nss_cc_ubi32_utcm3_clk.clkr,
+	[NSS_CC_UBI3_CLK_SRC] = &nss_cc_ubi3_clk_src.clkr,
+	[NSS_CC_UBI3_DIV_CLK_SRC] = &nss_cc_ubi3_div_clk_src.clkr,
+	[NSS_CC_UBI_AXI_CLK_SRC] = &nss_cc_ubi_axi_clk_src.clkr,
+	[NSS_CC_UBI_NC_AXI_BFDCD_CLK_SRC] =
+		&nss_cc_ubi_nc_axi_bfdcd_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_CLK] = &nss_cc_uniphy_port1_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_CLK] = &nss_cc_uniphy_port1_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_CLK] = &nss_cc_uniphy_port2_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_CLK] = &nss_cc_uniphy_port2_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_CLK] = &nss_cc_uniphy_port3_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_CLK] = &nss_cc_uniphy_port3_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_CLK] = &nss_cc_uniphy_port4_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_CLK] = &nss_cc_uniphy_port4_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_RX_CLK] = &nss_cc_uniphy_port5_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_TX_CLK] = &nss_cc_uniphy_port5_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_RX_CLK] = &nss_cc_uniphy_port6_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_TX_CLK] = &nss_cc_uniphy_port6_tx_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_CLK] = &nss_cc_xgmac0_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac0_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_CLK] = &nss_cc_xgmac1_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac1_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_CLK] = &nss_cc_xgmac2_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac2_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC3_PTP_REF_CLK] = &nss_cc_xgmac3_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC3_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac3_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC4_PTP_REF_CLK] = &nss_cc_xgmac4_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC4_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac4_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC5_PTP_REF_CLK] = &nss_cc_xgmac5_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC5_PTP_REF_DIV_CLK_SRC] =
+		&nss_cc_xgmac5_ptp_ref_div_clk_src.clkr,
+	[UBI32_PLL] = &ubi32_pll.clkr,
+	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
+};
+
+static const struct qcom_reset_map nss_cc_ipq9574_resets[] = {
+	[NSS_CC_CE_BCR] = { 0x28400, 0 },
+	[NSS_CC_CLC_BCR] = { 0x28600, 0 },
+	[NSS_CC_EIP197_BCR] = { 0x16004, 0 },
+	[NSS_CC_HAQ_BCR] = { 0x28300, 0 },
+	[NSS_CC_IMEM_BCR] = { 0xe004, 0 },
+	[NSS_CC_MAC_BCR] = { 0x28100, 0 },
+	[NSS_CC_PPE_BCR] = { 0x28200, 0 },
+	[NSS_CC_UBI_BCR] = { 0x28700, 0 },
+	[NSS_CC_UNIPHY_BCR] = { 0x28900, 0 },
+	[UBI3_CLKRST_CLAMP_ENABLE] = { 0x28a04, 9 },
+	[UBI3_CORE_CLAMP_ENABLE] = { 0x28a04, 8 },
+	[UBI2_CLKRST_CLAMP_ENABLE] = { 0x28a04, 7 },
+	[UBI2_CORE_CLAMP_ENABLE] = { 0x28a04, 6 },
+	[UBI1_CLKRST_CLAMP_ENABLE] = { 0x28a04, 5 },
+	[UBI1_CORE_CLAMP_ENABLE] = { 0x28a04, 4 },
+	[UBI0_CLKRST_CLAMP_ENABLE] = { 0x28a04, 3 },
+	[UBI0_CORE_CLAMP_ENABLE] = { 0x28a04, 2 },
+	[NSSNOC_NSS_CSR_ARES] = { 0x28a04, 1 },
+	[NSS_CSR_ARES] = { 0x28a04, 0 },
+	[PPE_BTQ_ARES] = { 0x28a08, 20 },
+	[PPE_IPE_ARES] = { 0x28a08, 19 },
+	[PPE_ARES] = { 0x28a08, 18 },
+	[PPE_CFG_ARES] = { 0x28a08, 17 },
+	[PPE_EDMA_ARES] = { 0x28a08, 16 },
+	[PPE_EDMA_CFG_ARES] = { 0x28a08, 15 },
+	[CRY_PPE_ARES] = { 0x28a08, 14 },
+	[NSSNOC_PPE_ARES] = { 0x28a08, 13 },
+	[NSSNOC_PPE_CFG_ARES] = { 0x28a08, 12 },
+	[PORT1_MAC_ARES] = { 0x28a08, 11 },
+	[PORT2_MAC_ARES] = { 0x28a08, 10 },
+	[PORT3_MAC_ARES] = { 0x28a08, 9 },
+	[PORT4_MAC_ARES] = { 0x28a08, 8 },
+	[PORT5_MAC_ARES] = { 0x28a08, 7 },
+	[PORT6_MAC_ARES] = { 0x28a08, 6 },
+	[XGMAC0_PTP_REF_ARES] = { 0x28a08, 5 },
+	[XGMAC1_PTP_REF_ARES] = { 0x28a08, 4 },
+	[XGMAC2_PTP_REF_ARES] = { 0x28a08, 3 },
+	[XGMAC3_PTP_REF_ARES] = { 0x28a08, 2 },
+	[XGMAC4_PTP_REF_ARES] = { 0x28a08, 1 },
+	[XGMAC5_PTP_REF_ARES] = { 0x28a08, 0 },
+	[HAQ_AHB_ARES] = { 0x28a0c, 3 },
+	[HAQ_AXI_ARES] = { 0x28a0c, 2 },
+	[NSSNOC_HAQ_AHB_ARES] = { 0x28a0c, 1 },
+	[NSSNOC_HAQ_AXI_ARES] = { 0x28a0c, 0 },
+	[CE_APB_ARES] = { 0x28a10, 3 },
+	[CE_AXI_ARES] = { 0x28a10, 2 },
+	[NSSNOC_CE_APB_ARES] = { 0x28a10, 1 },
+	[NSSNOC_CE_AXI_ARES] = { 0x28a10, 0 },
+	[CRYPTO_ARES] = { 0x28a14, 1 },
+	[NSSNOC_CRYPTO_ARES] = { 0x28a14, 0 },
+	[NSSNOC_NC_AXI0_1_ARES] = { 0x28a1c, 28 },
+	[UBI0_CORE_ARES] = { 0x28a1c, 27 },
+	[UBI1_CORE_ARES] = { 0x28a1c, 26 },
+	[UBI2_CORE_ARES] = { 0x28a1c, 25 },
+	[UBI3_CORE_ARES] = { 0x28a1c, 24 },
+	[NC_AXI0_ARES] = { 0x28a1c, 23 },
+	[UTCM0_ARES] = { 0x28a1c, 22 },
+	[NC_AXI1_ARES] = { 0x28a1c, 21 },
+	[UTCM1_ARES] = { 0x28a1c, 20 },
+	[NC_AXI2_ARES] = { 0x28a1c, 19 },
+	[UTCM2_ARES] = { 0x28a1c, 18 },
+	[NC_AXI3_ARES] = { 0x28a1c, 17 },
+	[UTCM3_ARES] = { 0x28a1c, 16 },
+	[NSSNOC_NC_AXI0_ARES] = { 0x28a1c, 15 },
+	[AHB0_ARES] = { 0x28a1c, 14 },
+	[INTR0_AHB_ARES] = { 0x28a1c, 13 },
+	[AHB1_ARES] = { 0x28a1c, 12 },
+	[INTR1_AHB_ARES] = { 0x28a1c, 11 },
+	[AHB2_ARES] = { 0x28a1c, 10 },
+	[INTR2_AHB_ARES] = { 0x28a1c, 9 },
+	[AHB3_ARES] = { 0x28a1c, 8 },
+	[INTR3_AHB_ARES] = { 0x28a1c, 7 },
+	[NSSNOC_AHB0_ARES] = { 0x28a1c, 6 },
+	[NSSNOC_INT0_AHB_ARES] = { 0x28a1c, 5 },
+	[AXI0_ARES] = { 0x28a1c, 4 },
+	[AXI1_ARES] = { 0x28a1c, 3 },
+	[AXI2_ARES] = { 0x28a1c, 2 },
+	[AXI3_ARES] = { 0x28a1c, 1 },
+	[NSSNOC_AXI0_ARES] = { 0x28a1c, 0 },
+	[IMEM_QSB_ARES] = { 0x28a20, 3 },
+	[NSSNOC_IMEM_QSB_ARES] = { 0x28a20, 2 },
+	[IMEM_AHB_ARES] = { 0x28a20, 1 },
+	[NSSNOC_IMEM_AHB_ARES] = { 0x28a20, 0 },
+	[UNIPHY_PORT1_RX_ARES] = { 0x28a24, 23 },
+	[UNIPHY_PORT1_TX_ARES] = { 0x28a24, 22 },
+	[UNIPHY_PORT2_RX_ARES] = { 0x28a24, 21 },
+	[UNIPHY_PORT2_TX_ARES] = { 0x28a24, 20 },
+	[UNIPHY_PORT3_RX_ARES] = { 0x28a24, 19 },
+	[UNIPHY_PORT3_TX_ARES] = { 0x28a24, 18 },
+	[UNIPHY_PORT4_RX_ARES] = { 0x28a24, 17 },
+	[UNIPHY_PORT4_TX_ARES] = { 0x28a24, 16 },
+	[UNIPHY_PORT5_RX_ARES] = { 0x28a24, 15 },
+	[UNIPHY_PORT5_TX_ARES] = { 0x28a24, 14 },
+	[UNIPHY_PORT6_RX_ARES] = { 0x28a24, 13 },
+	[UNIPHY_PORT6_TX_ARES] = { 0x28a24, 12 },
+	[PORT1_RX_ARES] = { 0x28a24, 11 },
+	[PORT1_TX_ARES] = { 0x28a24, 10 },
+	[PORT2_RX_ARES] = { 0x28a24, 9 },
+	[PORT2_TX_ARES] = { 0x28a24, 8 },
+	[PORT3_RX_ARES] = { 0x28a24, 7 },
+	[PORT3_TX_ARES] = { 0x28a24, 6 },
+	[PORT4_RX_ARES] = { 0x28a24, 5 },
+	[PORT4_TX_ARES] = { 0x28a24, 4 },
+	[PORT5_RX_ARES] = { 0x28a24, 3 },
+	[PORT5_TX_ARES] = { 0x28a24, 2 },
+	[PORT6_RX_ARES] = { 0x28a24, 1 },
+	[PORT6_TX_ARES] = { 0x28a24, 0 },
+	[PPE_FULL_RESET] = { .reg = 0x28a08, .bitmask = GENMASK(20, 17) },
+	[UNIPHY0_SOFT_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(23, 14) },
+	[UNIPHY1_SOFT_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(15, 14) },
+	[UNIPHY2_SOFT_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(13, 12) },
+	[UNIPHY_PORT1_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(23, 22) },
+	[UNIPHY_PORT2_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(21, 20) },
+	[UNIPHY_PORT3_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(19, 18) },
+	[UNIPHY_PORT4_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(17, 16) },
+	[UNIPHY_PORT5_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(15, 14) },
+	[UNIPHY_PORT6_ARES] = { .reg = 0x28a24, .bitmask = GENMASK(13, 12) },
+	[NSSPORT1_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(11, 10) },
+	[NSSPORT2_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(9, 8) },
+	[NSSPORT3_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(7, 6) },
+	[NSSPORT4_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(5, 4) },
+	[NSSPORT5_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(3, 2) },
+	[NSSPORT6_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(1, 0) },
+	[EDMA_HW_RESET] =  { .reg = 0x28a08, .bitmask = GENMASK(16, 15) },
+};
+
+static const struct regmap_config nss_cc_ipq9574_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x28a34,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc nss_cc_ipq9574_desc = {
+	.config = &nss_cc_ipq9574_regmap_config,
+	.clks = nss_cc_ipq9574_clocks,
+	.num_clks = ARRAY_SIZE(nss_cc_ipq9574_clocks),
+	.resets = nss_cc_ipq9574_resets,
+	.num_resets = ARRAY_SIZE(nss_cc_ipq9574_resets),
+};
+
+static const struct of_device_id nss_cc_ipq9574_match_table[] = {
+	{ .compatible = "qcom,ipq9574-nsscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nss_cc_ipq9574_match_table);
+
+static int nss_cc_ipq9574_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;
+	struct clk *nsscc_clk;
+	struct device_node *np = (&pdev->dev)->of_node;
+	int ret;
+
+	nsscc_clk = of_clk_get(np, 11);
+	if (IS_ERR(nsscc_clk))
+		return PTR_ERR(nsscc_clk);
+
+	ret = clk_prepare_enable(nsscc_clk);
+	if (ret)
+		clk_disable_unprepare(nsscc_clk);
+
+	regmap = qcom_cc_map(pdev, &nsscc_ipq9574_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
+
+	return qcom_cc_really_probe(&pdev->dev, &nsscc_ipq9574_desc, regmap);
+}
+
+static struct platform_driver nss_cc_ipq9574_driver = {
+	.probe = nss_cc_ipq9574_probe,
+	.driver = {
+		.name = "qcom,nsscc-ipq9574",
+		.of_match_table = nss_cc_ipq9574_match_table,
+		.sync_state = icc_sync_state,
+	},
+};
+
+module_platform_driver(nss_cc_ipq9574_driver);
+
+MODULE_DESCRIPTION("QTI NSS_CC IPQ9574 Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



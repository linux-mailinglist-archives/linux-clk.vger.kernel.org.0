Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E255629C9D
	for <lists+linux-clk@lfdr.de>; Tue, 15 Nov 2022 15:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKOOuX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Nov 2022 09:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiKOOuV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 09:50:21 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972F52019F;
        Tue, 15 Nov 2022 06:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKdtPXsxUPQGpJXfaD8+41W1QIh7/CN3pjKvCimdfv9Ca9uip8qdVQor/DLbO8Hjh/f06RbZL9VtC0Nn5GKyobOHqfUCQ7FQooNrYYeltb9pybAasRAUfFEGXoS4cm5u8iHYorPPhwbfay4GC/59WRjQCLAq/wYlVSkJ/6iIQp+SxHg3fcAeMN09mJ4Al2MnAs0K6dmWw/pQeT/PyiyN0WSN5Bbv65U5TsfBO1xXZeT8kbmCL0NDykMfvtj7A9is3tc+6HWpxoMcNLPaJ68atmzB5sHMzHLFqAIuR2T77/lo53NOPslacIHI9is9MPh4a+O7RRkd+xLWeAiXkuqEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8UJkQS0PpVosUUdL6DEDUwMY8PlAwtCeFn/BLDlDPQ=;
 b=S40qgylkbg7LUWe07W/Nr3vIWJ9qa70ZS9hGZmGPlwi5rzSS3UjbQ/7rY1y0QK2Hbvv8YIJpBL9OweeFEf/1l/sLw/zJ24thkEo6djD8Cd2XwBofayNkgbwl3zmiqwrVC+3jL+3Z/LvLNnX/Z2wHEBs7tWFuNS1laUQsCFSblEp1LLB0Awe4HQCbhdl8wiCJG45l5gdVdrjiHzeIvCjZW7eu3rXuzn4/Vc1SdolANIc4DaQ+gRU0O/vhc0VoMzoo3k2IO0sdOPawtpFt0toBFiVcdePPQHB5nJ2xp5Efy52OZBvgG0wBr/tbUKVMn9jPzbt+lnALQNLZWexN84ERbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8UJkQS0PpVosUUdL6DEDUwMY8PlAwtCeFn/BLDlDPQ=;
 b=BghcQxIx5xVD5g2rL679MtTBi1B/PUj0HtIiyENSNh4Z3oVfMPGwYOr0leIsf+uvzchMacvvibyt5RtxZTlFcTmXaPJ6DOhhW1B+h1lUe0lLapUU0t+sdiwWCsV40ynkM7uewF+n3RZlgnw2jxewmu61ln4Af9VSmO7+kAfTyNw=
Received: from MW4PR04CA0231.namprd04.prod.outlook.com (2603:10b6:303:87::26)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 14:50:16 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::f1) by MW4PR04CA0231.outlook.office365.com
 (2603:10b6:303:87::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 14:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 15 Nov 2022 14:50:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 08:50:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 06:50:13 -0800
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 15 Nov 2022 08:50:11 -0600
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@gmail.com>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v2 2/2] clocking-wizard: Add versal clocking wizard support
Date:   Tue, 15 Nov 2022 20:20:05 +0530
Message-ID: <20221115145005.4747-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
References: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 92eff729-175f-4f7b-0fec-08dac718b529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hyw/cqxphq0jD9S7IvBQrlpkrONm6Qd9buZ6kM9ka8DkJoVYGLL1knCL3HbMBwpmewAKZLgQn3ss3Cjq9czBXWrDP8Tv5C0bXuh9G/JqSBCwnM9XcL3Pf7FekbpwygPb4+3MmIGjq/1u9q9Ha+LZBKWkwafmrI1JFSNab/ispVJhdcIIhG4R3bOhrc9i85M4ZdIVpzZDUbG7AZnRd7dY24IsAm1Zi3gSWRFcuHGHoXTDEzhaCmnWI/ZGAWBLTI5kYdVGldVvNFgZhRjYQXuEGf52zlFuu5w9pAWFCLbu77dhhuySXe+NENZcY2OemERhScI9abFSjzyiXcUk+87iiK3fXoceLr8olHQrC9U/3idXcQ0T4yhl4o2UCf3o5fKRJKUya/F9e+tQ3X350GKYDjJD6JduwJo2paEzcNOLJH7CNDu8MbkYs/6LXoxYQJdkrD/LWSfsR2hQIo1JwuM8lro8Ly/GBCudwtkdtKL1LsNAOEXk4xgsgwPQqr8y+3KJl+t5k5RtTZv4wARjCZf9XXEnMWwKOu06jiMtAU9b0F3Bz+BLHTc4y4M2cAuni+givZd5QCoIV41XA0RpIBl1YH+0UKBYqMADlaxhwn2mK8J2UeY5nk48iTEctST6IQss0tPbJQ+WX489eoG+egJbjiBAw90V7Sx2pOIQRCDqozxnGlRU3luK+jl94KqOG7BffAycrr1OSMV5ATowIsBK9uCsLVvx4AK8fncaNg86GlIBULeRLfk+56oFTD3ytwJa+CJpFl14AEgs57ePmIE9OZm5RGkMsyEt/hmObMHrPDPX1/OlXysbSEhIVsFJsPSZ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(81166007)(356005)(86362001)(83380400001)(36860700001)(40460700003)(40480700001)(5660300002)(44832011)(30864003)(2906002)(336012)(2616005)(1076003)(186003)(47076005)(426003)(26005)(82740400003)(70586007)(70206006)(6916009)(54906003)(82310400005)(6666004)(4326008)(8936002)(8676002)(316002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 14:50:15.7293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92eff729-175f-4f7b-0fec-08dac718b529
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Clocking Wizard for Versal adaptive compute acceleration platforms.
Add Versal clocking wizard support. The driver supports configurable
number of outputs.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
update the warn
Update the compatible to reflect versal

 drivers/clk/xilinx/Kconfig                   |  13 +
 drivers/clk/xilinx/Makefile                  |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c | 739 +++++++++++++++++++
 3 files changed, 753 insertions(+)
 create mode 100644 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c

diff --git a/drivers/clk/xilinx/Kconfig b/drivers/clk/xilinx/Kconfig
index f205522c40ff..dd8e4a733d0b 100644
--- a/drivers/clk/xilinx/Kconfig
+++ b/drivers/clk/xilinx/Kconfig
@@ -29,3 +29,16 @@ config COMMON_CLK_XLNX_CLKWZRD
 
 	  If unsure, say N.
 
+config COMMON_CLK_XLNX_CLKWZRD_V
+	tristate "Xilinx Versal Clocking Wizard"
+	depends on COMMON_CLK && OF
+	depends on HAS_IOMEM
+	help
+	  Support for the Versal Xilinx Clocking Wizard IP core clock generator.
+	  This driver supports the Versal Xilinx clocking wizard programmable clock
+	  synthesizer. The number of output is configurable in the design.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called clk-xlnx-clock-wizard-v.
diff --git a/drivers/clk/xilinx/Makefile b/drivers/clk/xilinx/Makefile
index 7ac1789c6b1b..9e7e1c1c026c 100644
--- a/drivers/clk/xilinx/Makefile
+++ b/drivers/clk/xilinx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
+obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD_V)	+= clk-xlnx-clock-wizard-v.o
 obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c
new file mode 100644
index 000000000000..d97a46403c0f
--- /dev/null
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c
@@ -0,0 +1,739 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Versal Clocking Wizard driver
+ *
+ * Copyright (C) 2022, Advanced Micro Devices, Inc.
+ *
+ * Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define WZRD_NUM_OUTPUTS	7
+#define WZRD_ACLK_MAX_FREQ	250000000UL
+
+#define WZRD_CLK_CFG_REG(n)	(0x330 + 4 * (n))
+
+#define WZRD_CLKFBOUT_1		0
+#define WZRD_CLKFBOUT_2		1
+#define WZRD_CLKOUT0_1		2
+#define WZRD_CLKOUT0_2		3
+#define WZRD_DESKEW_2		20
+#define WZRD_DIVCLK		21
+#define WZRD_CLKFBOUT_4		51
+#define WZRD_CLKFBOUT_3		48
+#define WZRD_DUTY_CYCLE		2
+#define WZRD_O_DIV		4
+
+#define WZRD_CLKFBOUT_FRAC_EN	BIT(1)
+#define WZRD_CLKFBOUT_PREDIV2	(BIT(11) | BIT(12) | BIT(9))
+#define WZRD_MULT_PREDIV2	(BIT(10) | BIT(9) | BIT(12))
+#define WZRD_CLKFBOUT_EDGE	BIT(8)
+#define WZRD_P5EN		BIT(13)
+#define WZRD_P5EN_SHIFT		13
+#define WZRD_P5FEDGE		BIT(15)
+#define WZRD_DIVCLK_EDGE	BIT(10)
+#define WZRD_P5FEDGE_SHIFT	15
+#define WZRD_CLKOUT0_PREDIV2	BIT(11)
+#define WZRD_EDGE_SHIFT		8
+
+#define WZRD_CLKFBOUT_L_SHIFT	0
+#define WZRD_CLKFBOUT_H_SHIFT	8
+#define WZRD_CLKFBOUT_L_MASK	GENMASK(7, 0)
+#define WZRD_CLKFBOUT_H_MASK	GENMASK(15, 8)
+#define WZRD_CLKFBOUT_FRAC_SHIFT	16
+#define WZRD_CLKFBOUT_FRAC_MASK		GENMASK(5, 0)
+#define WZRD_DIVCLK_DIVIDE_MASK		GENMASK(7, 0)
+#define WZRD_CLKOUT_DIVIDE_SHIFT	0
+#define WZRD_CLKOUT_DIVIDE_WIDTH	8
+#define WZRD_CLKOUT_DIVIDE_MASK		GENMASK(7, 0)
+#define WZRD_CLKOUT_FRAC_SHIFT		8
+#define WZRD_CLKOUT_FRAC_MASK		0x3ff
+
+#define WZRD_DR_MAX_INT_DIV_VALUE	32767
+#define WZRD_DR_STATUS_REG_OFFSET	0x04
+#define WZRD_DR_LOCK_BIT_MASK		BIT(0)
+#define WZRD_DR_INIT_REG_OFFSET		0x14
+#define WZRD_DR_DIV_TO_PHASE_OFFSET	4
+#define WZRD_DR_BEGIN_DYNA_RECONF	0x03
+#define WZRD_MIN_ERR			500000
+#define WZRD_USEC_POLL			10
+#define WZRD_TIMEOUT_POLL		1000
+#define WZRD_FRAC_GRADIENT		64
+#define PREDIV2_MULT			2
+
+#define DIV_O				1
+#define DIV_ALL				3
+
+#define WZRD_M_MIN			4
+#define WZRD_M_MAX			432
+#define WZRD_D_MIN			1
+#define WZRD_D_MAX			123
+#define WZRD_VCO_MIN			2160000000
+#define WZRD_VCO_MAX			4320000000
+#define WZRD_O_MIN			2
+#define WZRD_O_MAX			511
+
+/* Extract divider instance from clock hardware instance */
+#define to_clk_wzrd_divider(_hw) container_of(_hw, struct clk_wzrd_divider, hw)
+
+enum clk_wzrd_int_clks {
+	wzrd_clk_mul,
+	wzrd_clk_mul_div,
+	wzrd_clk_int_max
+};
+
+/**
+ * struct clk_wzrd - Clock wizard private data structure
+ *
+ * @clk_data:		Clock data
+ * @nb:			Notifier block
+ * @base:		Memory base
+ * @clk_in1:		Handle to input clock 'clk_in1'
+ * @axi_clk:		Handle to input clock 's_axi_aclk'
+ * @clks_internal:	Internal clocks
+ * @clkout:		Output clocks
+ */
+struct clk_wzrd {
+	struct clk_onecell_data clk_data;
+	struct notifier_block nb;
+	void __iomem *base;
+	struct clk *clk_in1;
+	struct clk *axi_clk;
+	struct clk *clks_internal[wzrd_clk_int_max];
+	struct clk *clkout[WZRD_NUM_OUTPUTS];
+};
+
+/**
+ * struct clk_wzrd_divider - clock divider specific to clk_wzrd
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @base:	base address of register containing the divider
+ * @offset:	offset address of register containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @flags:	clk_wzrd divider flags
+ * @valuem:	value of the multiplier
+ * @valued:	value of the common divider
+ * @valueo:	value of the leaf divider
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ * @lock:	register lock
+ */
+struct clk_wzrd_divider {
+	struct clk_hw hw;
+	void __iomem *base;
+	u16 offset;
+	u8 shift;
+	u8 width;
+	u8 flags;
+	u32 valuem;
+	u32 valued;
+	u32 valueo;
+	const struct clk_div_table *table;
+	spinlock_t *lock; /* divider lock */
+};
+
+#define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
+
+/* spin lock variable for clk_wzrd */
+static DEFINE_SPINLOCK(clkwzrd_lock);
+
+static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	u32 edged, div, div2, p5en, edge, prediv2, all, regl, regh, mult, reg;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+
+	edge = !!(readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1)) & WZRD_CLKFBOUT_EDGE);
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+
+	mult = regl + regh + edge;
+	if (!mult)
+		mult = 1;
+
+	regl = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4)) &
+		     WZRD_CLKFBOUT_FRAC_EN;
+	if (regl) {
+		regl = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_3)) &
+			WZRD_CLKFBOUT_FRAC_MASK;
+		mult = mult * WZRD_FRAC_GRADIENT + regl;
+		parent_rate = DIV_ROUND_CLOSEST((parent_rate * mult), WZRD_FRAC_GRADIENT);
+	} else {
+		parent_rate = parent_rate * mult;
+	}
+
+	/* O Calculation */
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
+	edged = FIELD_GET(WZRD_CLKFBOUT_EDGE, reg);
+	p5en = FIELD_GET(WZRD_P5EN, reg);
+	prediv2 = FIELD_GET(WZRD_CLKOUT0_PREDIV2, reg);
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
+	/* Low time */
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	/* High time */
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+	all = regh + regl + edged;
+	if (!all)
+		all = 1;
+
+	if (prediv2)
+		div2 = PREDIV2_MULT * all + p5en;
+	else
+		div2 = all;
+
+	/* D calculation */
+	edged = !!(readl(divider->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2)) &
+			 WZRD_DIVCLK_EDGE);
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
+	/* Low time */
+	regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
+	/* High time */
+	regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
+	div = regl + regh + edged;
+	if (!div)
+		div = 1;
+
+	div = div * div2;
+	return divider_recalc_rate(hw, parent_rate, div, divider->table,
+				   divider->flags, divider->width);
+}
+
+static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, freq, diff;
+	u32 m, d, o;
+
+	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
+		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
+			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
+			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
+				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
+					freq = DIV_ROUND_CLOSEST(vco_freq, o);
+					diff = abs(freq - rate);
+
+					if (diff < WZRD_MIN_ERR) {
+						divider->valuem = m;
+						divider->valued = d;
+						divider->valueo = o;
+						return 0;
+					}
+				}
+			}
+		}
+	}
+	return -EBUSY;
+}
+
+static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	u32 value, regh, edged, p5en, p5fedge, value2, m, regval, regval1;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	int err;
+
+	err = clk_wzrd_get_divisors(hw, rate, parent_rate);
+	if (err)
+		return err;
+
+	writel(0, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4));
+
+	m = divider->valuem;
+	edged = m % WZRD_DUTY_CYCLE;
+	regh = m / WZRD_DUTY_CYCLE;
+	regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
+	regval1 |= WZRD_MULT_PREDIV2;
+	if (edged)
+		regval1 = regval1 | WZRD_CLKFBOUT_EDGE;
+	else
+		regval1 = regval1 & ~WZRD_CLKFBOUT_EDGE;
+
+	writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
+	regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+	writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
+
+	value2 = divider->valued;
+	edged = value2 % WZRD_DUTY_CYCLE;
+	regh = (value2 / WZRD_DUTY_CYCLE);
+	regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
+	writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2));
+	regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+	writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
+
+	value = divider->valueo;
+	regh = value / WZRD_O_DIV;
+	regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
+	regval1 |= WZRD_CLKFBOUT_PREDIV2;
+	regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
+
+	if (value % WZRD_O_DIV > 1) {
+		edged = 1;
+		regval1 |= edged << WZRD_CLKFBOUT_H_SHIFT;
+	}
+
+	p5fedge = value % WZRD_DUTY_CYCLE;
+	p5en = value % WZRD_DUTY_CYCLE;
+
+	regval1 = regval1 | FIELD_PREP(WZRD_P5EN, p5en) | FIELD_PREP(WZRD_P5FEDGE, p5fedge);
+	writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
+	regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+	writel(regval, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				 value, value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		return err;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				  value, value & WZRD_DR_LOCK_BIT_MASK,
+				  WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+}
+
+static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long flags = 0;
+	int ret;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return ret;
+}
+
+static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+	u32 div, p5en, edge, prediv2, all;
+	unsigned int vall, valh;
+
+	edge = !!(readl(div_addr) & WZRD_CLKFBOUT_EDGE);
+	p5en = !!(readl(div_addr) & WZRD_P5EN);
+	prediv2 = !!(readl(div_addr) & WZRD_CLKOUT0_PREDIV2);
+	vall = readl(div_addr + 4) & WZRD_CLKFBOUT_L_MASK;
+	valh = readl(div_addr + 4) >> WZRD_CLKFBOUT_H_SHIFT;
+	all = valh + vall + edge;
+	if (!all)
+		all = 1;
+
+	if (prediv2)
+		div = 2 * all + prediv2 * p5en;
+	else
+		div = all;
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
+}
+
+static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+	u32 value, regh, edged, p5en, p5fedge, regval, regval1;
+	unsigned long flags = 0;
+	int err;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	value = DIV_ROUND_CLOSEST(parent_rate, rate);
+	regh = (value / 4);
+	regval1 = readl(div_addr);
+	regval1 |= WZRD_CLKFBOUT_PREDIV2;
+	regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
+	if (value % 4 > 1) {
+		edged = 1;
+		regval1 |= (edged << WZRD_EDGE_SHIFT);
+	}
+	p5fedge = value % 2;
+	p5en = value % 2;
+	regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
+	writel(regval1, div_addr);
+
+	regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
+	writel(regval, div_addr + 4);
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				 value, value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		goto err_reconfig;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				 value, value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+
+err_reconfig:
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return err;
+}
+
+static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	return rate;
+}
+
+static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *prate)
+{
+	u8 div;
+
+	div = DIV_ROUND_CLOSEST(*prate, rate);
+
+	return *prate / div;
+}
+
+static const struct clk_ops clk_wzrd_clk_divider_ops = {
+	.round_rate = clk_wzrd_round_rate,
+	.set_rate = clk_wzrd_dynamic_reconfig,
+	.recalc_rate = clk_wzrd_recalc_rate,
+};
+
+static const struct clk_ops clk_wzrd_clk_div_all_ops = {
+	.round_rate = clk_wzrd_round_rate_all,
+	.set_rate = clk_wzrd_dynamic_all,
+	.recalc_rate = clk_wzrd_recalc_rate_all,
+};
+
+static struct clk *clk_wzrd_register_divider(struct device *dev,
+					     const char *name,
+					     const char *parent_name,
+					     unsigned long flags,
+					     void __iomem *base, u16 offset,
+					     u8 shift, u8 width,
+					     u8 clk_divider_flags,
+					     u32 div_type,
+					     spinlock_t *lock)
+{
+	struct clk_wzrd_divider *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
+		if (width + shift > 16) {
+			dev_warn(dev, "divider value exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_ro_ops;
+	else if (div_type == DIV_O)
+		init.ops = &clk_wzrd_clk_divider_ops;
+	else
+		init.ops = &clk_wzrd_clk_div_all_ops;
+
+	init.flags = flags;
+	init.parent_names = (parent_name ? &parent_name : NULL);
+	init.num_parents = (parent_name ? 1 : 0);
+
+	div->base = base;
+	div->offset = offset;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = NULL;
+
+	hw = &div->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw->clk;
+}
+
+static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+{
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return 0;
+}
+
+static int __maybe_unused clk_wzrd_resume(struct device *dev)
+{
+	int ret;
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(dev, "unable to enable s_axi_aclk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+			 clk_wzrd_resume);
+
+static int clk_wzrd_probe(struct platform_device *pdev)
+{
+	u32 regl, regh, edge, mult, regld, reghd, edged, div;
+	const char *clkout_name, *clk_name, *clk_mul_name;
+	struct device_node *np = pdev->dev.of_node;
+	struct clk_wzrd *clk_wzrd;
+	unsigned long rate;
+	int nr_outputs;
+	int i, j, ret;
+
+	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
+	if (!clk_wzrd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, clk_wzrd);
+
+	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clk_wzrd->base))
+		return PTR_ERR(clk_wzrd->base);
+
+	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
+		return -EINVAL;
+
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "in1");
+	if (IS_ERR(clk_wzrd->clk_in1))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
+				     "in1 not found\n");
+
+	clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi");
+	if (IS_ERR(clk_wzrd->axi_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
+				     "s_axi not found\n");
+
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
+		return ret;
+	}
+
+	rate = clk_get_rate(clk_wzrd->axi_clk);
+	if (rate > WZRD_ACLK_MAX_FREQ) {
+		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
+			rate);
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	if (nr_outputs == 1) {
+		clkout_name = kasprintf(GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
+		if (!clkout_name) {
+			ret = -ENOMEM;
+			goto err_disable_clk;
+		}
+
+		clk_wzrd->clkout[0] = clk_wzrd_register_divider
+				(&pdev->dev, clkout_name,
+				__clk_get_name(clk_wzrd->clk_in1), 0,
+				clk_wzrd->base, WZRD_CLK_CFG_REG(3),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				DIV_ALL, &clkwzrd_lock);
+
+		goto out;
+	}
+
+	/* register multiplier */
+	edge = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) & BIT(8));
+	regl = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(1)) &
+		     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
+	regh = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(1)) &
+		     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
+	mult = regl + regh + edge;
+	if (!mult)
+		mult = 1;
+	mult = mult * WZRD_FRAC_GRADIENT;
+
+	regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(51)) &
+		     WZRD_CLKFBOUT_FRAC_EN;
+	if (regl) {
+		regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(48)) &
+			WZRD_CLKFBOUT_FRAC_MASK;
+		mult = mult + regl;
+	}
+
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
+	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
+			(&pdev->dev, clk_name,
+			 __clk_get_name(clk_wzrd->clk_in1),
+			0, mult, WZRD_FRAC_GRADIENT);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
+		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
+		goto err_disable_clk;
+	}
+
+	/* register div */
+	edged = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(20)) &
+		     BIT(10));
+	regld = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(21)) &
+		     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
+	reghd = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(21)) &
+		     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
+	div = (regld  + reghd + edged);
+	if (!div)
+		div = 1;
+
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_rm_int_clk;
+	}
+
+	clk_mul_name = __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]);
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] =
+		clk_register_fixed_factor(&pdev->dev, clk_name,
+					  clk_mul_name, 0, 1, div);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
+		dev_err(&pdev->dev, "unable to register divider clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
+		goto err_rm_int_clk;
+	}
+
+	/* register div per output */
+	for (i = nr_outputs - 1; i >= 0 ; i--) {
+		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
+		if (!clkout_name) {
+			ret = -ENOMEM;
+			goto err_rm_int_clks;
+		}
+
+		clk_wzrd->clkout[i] =
+			clk_wzrd_register_divider(&pdev->dev,
+						  clkout_name, clk_name, 0,
+						  clk_wzrd->base,
+						  (WZRD_CLK_CFG_REG(3) + i * 8),
+						  WZRD_CLKOUT_DIVIDE_SHIFT,
+						  WZRD_CLKOUT_DIVIDE_WIDTH,
+						  CLK_DIVIDER_ONE_BASED |
+						  CLK_DIVIDER_ALLOW_ZERO,
+						  DIV_O, &clkwzrd_lock);
+
+		if (IS_ERR(clk_wzrd->clkout[i])) {
+			for (j = i + 1; j < nr_outputs; j++)
+				clk_unregister(clk_wzrd->clkout[j]);
+			dev_err(&pdev->dev,
+				"unable to register divider clock\n");
+			ret = PTR_ERR(clk_wzrd->clkout[i]);
+			goto err_rm_int_clks;
+		}
+	}
+
+	kfree(clk_name);
+	kfree(clkout_name);
+
+out:
+	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
+	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
+
+	return 0;
+
+err_rm_int_clks:
+	kfree(clkout_name);
+	clk_unregister(clk_wzrd->clks_internal[1]);
+err_rm_int_clk:
+	kfree(clk_name);
+	clk_unregister(clk_wzrd->clks_internal[0]);
+err_disable_clk:
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return ret;
+}
+
+static int clk_wzrd_remove(struct platform_device *pdev)
+{
+	int i;
+	struct clk_wzrd *clk_wzrd = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	for (i = 0; i < WZRD_NUM_OUTPUTS; i++)
+		clk_unregister(clk_wzrd->clkout[i]);
+	for (i = 0; i < wzrd_clk_int_max; i++)
+		clk_unregister(clk_wzrd->clks_internal[i]);
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return 0;
+}
+
+static const struct of_device_id clk_wzrd_ids[] = {
+	{ .compatible = "xlnx,versal-clk-wizard" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
+
+static struct platform_driver clk_wzrd_driver = {
+	.driver = {
+		.name = "clk-wizard",
+		.of_match_table = clk_wzrd_ids,
+		.pm = &clk_wzrd_dev_pm_ops,
+	},
+	.probe = clk_wzrd_probe,
+	.remove = clk_wzrd_remove,
+};
+module_platform_driver(clk_wzrd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>");
+MODULE_DESCRIPTION("Driver for the Versal Clocking Wizard IP core");
-- 
2.17.1


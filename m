Return-Path: <linux-clk+bounces-3734-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27D858F69
	for <lists+linux-clk@lfdr.de>; Sat, 17 Feb 2024 13:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4423B283B27
	for <lists+linux-clk@lfdr.de>; Sat, 17 Feb 2024 12:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ECD7AE48;
	Sat, 17 Feb 2024 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDZfj3wr"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E597A728;
	Sat, 17 Feb 2024 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708174337; cv=none; b=nzNQj7sQITI4tA+T7V/tXlFL+BXvsHAkomx8yx2qqopReoNuPL2jopm2awWSy16l622ZGYGVmSiNINdsGQZKqVB1NRDnSFYmp/oPu492Eqku2AEGR8uhrEMvTstDMAQJnkWDgbQF5AWPDHXcDl0RttdBQlBL4RSSz4vICWr8RE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708174337; c=relaxed/simple;
	bh=XQV3VcDC57Dc0HgcjBOqkBeHMtfsbnXNZOAaz0Q4Y/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q96/PVwqR3dXafXlG8sRJ8ZpD4FPlMWmPAmOOv6RVfXu2lLyBVuWOnmVxNei/XNgbJ/c9X6BWaMHGU48y4fhkBYCmM71+LHx9mIUwOGv19F8KVSEP2acKjUAT9mk7TWqnsPb5t/C0Knm0+xXFF3wviUU0NM6DaEzZNYlP6GEnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDZfj3wr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0E1BC43390;
	Sat, 17 Feb 2024 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708174336;
	bh=XQV3VcDC57Dc0HgcjBOqkBeHMtfsbnXNZOAaz0Q4Y/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DDZfj3wrAO8uid3HWKxazs8CxUYjL05WCXyYK2aPCo6tuGzZAP9t4DGCYx8uSCKPK
	 utd5/yeIBDVuDcSQOnK4ZPTQi9RLebXD3McISbM6OBhFFyjSzTQ/bn5fHCSEtPXJSJ
	 z0vdtwjBAtxPbeEjwDXaPG9UGV3uHAXo12A0UnKWz+3JmgHIteShVNZysEJnWQW2wy
	 1p6VIprvb9kTNQcEx0AKKyQn6zAYMwg6wVNQQs9fmhgDmQHpABn2Luvo7MkWDr93eY
	 nYQzgVlUwC43ePItF9f32XKcrsM9b/BClfQNzyGeAi95tFGXCRgGlIB6WmL8kfnHxM
	 O9Hfw3ynysjNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A7DC48BC4;
	Sat, 17 Feb 2024 12:52:16 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Sat, 17 Feb 2024 20:52:07 +0800
Subject: [PATCH RFC v2 2/5] clk: hisilicon: add CRG driver for Hi3798MV200
 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240217-clk-mv200-v2-2-b782e4eb66f7@outlook.com>
References: <20240217-clk-mv200-v2-0-b782e4eb66f7@outlook.com>
In-Reply-To: <20240217-clk-mv200-v2-0-b782e4eb66f7@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yang Xiwen <forbidden405@outlook.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708174332; l=16982;
 i=forbidden405@outlook.com; s=20230724; h=from:subject:message-id;
 bh=nZx/zPx1vfQB0+yNk6xOpwh8fJ8IeQrdPvyc6/5poNk=;
 b=VDEKvPGBsjb2dQXdPc4m3m8DWF1rFfigmy+5l6JhPEERYuno+TODjXeUCBur3Q16Qso04hZQU
 dIdQwu4w/yMA+oNnl9WwuFCMuqCCb/r+aYpGqVlrWjrY3xvH/wlda+C
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=qOD5jhp891/Xzc+H/PZ8LWVSWE3O/XCQnAg+5vdU2IU=
X-Endpoint-Received:
 by B4 Relay for forbidden405@outlook.com/20230724 with auth_id=67
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
Reply-To: <forbidden405@outlook.com>

From: Yang Xiwen <forbidden405@outlook.com>

Add CRG driver for Hi3798MV200 SoC. CRG(Clock and Reset
Generator) module generates clock and reset signals used
by other module blocks on SoC.

Only currently used clocks are added. Clocks without mainline
user are omitted.

Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 drivers/clk/hisilicon/Kconfig           |   8 +
 drivers/clk/hisilicon/Makefile          |   1 +
 drivers/clk/hisilicon/crg-hi3798mv200.c | 436 ++++++++++++++++++++++++++++++++
 3 files changed, 445 insertions(+)

diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index c1ec75aa4ccd..fab8059240b7 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -45,6 +45,14 @@ config COMMON_CLK_HI3798CV200
 	help
 	  Build the clock driver for hi3798cv200.
 
+config COMMON_CLK_HI3798MV200
+	tristate "Hi3798MV200 Clock Driver"
+	depends on ARCH_HISI || COMPILE_TEST
+	select RESET_HISI
+	default ARCH_HISI
+	help
+	  Build the clock driver for hi3798mv200.
+
 config COMMON_CLK_HI6220
 	bool "Hi6220 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 2978e56cb876..7acb63e909bd 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_COMMON_CLK_HI3559A)	+= clk-hi3559a.o
 obj-$(CONFIG_COMMON_CLK_HI3660) += clk-hi3660.o
 obj-$(CONFIG_COMMON_CLK_HI3670) += clk-hi3670.o
 obj-$(CONFIG_COMMON_CLK_HI3798CV200)	+= crg-hi3798cv200.o
+obj-$(CONFIG_COMMON_CLK_HI3798MV200)	+= crg-hi3798mv200.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
 obj-$(CONFIG_RESET_HISI)	+= reset.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
diff --git a/drivers/clk/hisilicon/crg-hi3798mv200.c b/drivers/clk/hisilicon/crg-hi3798mv200.c
new file mode 100644
index 000000000000..756deed9303f
--- /dev/null
+++ b/drivers/clk/hisilicon/crg-hi3798mv200.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hi3798MV200 Clock and Reset Generator Driver
+ *
+ * Copyright (c) 2024 Yang Xiwen <forbidden405@outlook.com>
+ * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
+ */
+
+#include <dt-bindings/clock/histb-clock.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include "clk.h"
+#include "crg.h"
+#include "reset.h"
+
+/* hi3798MV200 core CRG */
+#define HI3798MV200_INNER_CLK_OFFSET		64
+#define HI3798MV200_FIXED_3M			65
+#define HI3798MV200_FIXED_12M			66
+#define HI3798MV200_FIXED_24M			67
+#define HI3798MV200_FIXED_25M			68
+#define HI3798MV200_FIXED_27M			69
+#define HI3798MV200_FIXED_48M			70
+#define HI3798MV200_FIXED_50M			71
+#define HI3798MV200_FIXED_54M			72
+#define HI3798MV200_FIXED_60M			73
+#define HI3798MV200_FIXED_75M			74
+#define HI3798MV200_FIXED_100M			75
+#define HI3798MV200_FIXED_125M			76
+#define HI3798MV200_FIXED_150M			77
+#define HI3798MV200_FIXED_166P5M		78
+#define HI3798MV200_FIXED_200M			79
+#define HI3798MV200_MMC_MUX			80
+#define HI3798MV200_SDIO0_MUX			81
+#define HI3798MV200_SDIO1_MUX			82
+#define HI3798MV200_COMBPHY0_MUX		83
+#define HI3798MV200_FEMAC_MUX			84
+#define HI3798MV200_GMAC_MUX			85
+
+#define HI3798MV200_CRG_NR_CLKS			128
+
+static const struct hisi_fixed_rate_clock hi3798mv200_fixed_rate_clks[] = {
+	{ HISTB_OSC_CLK, "clk_osc", NULL, 0, 24000000, },
+	{ HISTB_APB_CLK, "clk_apb", NULL, 0, 100000000, },
+	{ HISTB_AHB_CLK, "clk_ahb", NULL, 0, 200000000, },
+	{ HI3798MV200_FIXED_3M, "3m", NULL, 0, 3000000, },
+	{ HI3798MV200_FIXED_12M, "12m", NULL, 0, 12000000, },
+	{ HI3798MV200_FIXED_24M, "24m", NULL, 0, 24000000, },
+	{ HI3798MV200_FIXED_25M, "25m", NULL, 0, 25000000, },
+	{ HI3798MV200_FIXED_27M, "27m", NULL, 0, 27000000, },
+	{ HI3798MV200_FIXED_48M, "48m", NULL, 0, 48000000, },
+	{ HI3798MV200_FIXED_50M, "50m", NULL, 0, 50000000, },
+	{ HI3798MV200_FIXED_54M, "54m", NULL, 0, 54000000, },
+	{ HI3798MV200_FIXED_60M, "60m", NULL, 0, 60000000, },
+	{ HI3798MV200_FIXED_75M, "75m", NULL, 0, 75000000, },
+	{ HI3798MV200_FIXED_100M, "100m", NULL, 0, 100000000, },
+	{ HI3798MV200_FIXED_125M, "125m", NULL, 0, 125000000, },
+	{ HI3798MV200_FIXED_150M, "150m", NULL, 0, 150000000, },
+	{ HI3798MV200_FIXED_166P5M, "166p5m", NULL, 0, 165000000, },
+	{ HI3798MV200_FIXED_200M, "200m", NULL, 0, 200000000, },
+};
+
+static const char *const mmc_mux_p[] = {
+		"100m", "50m", "25m", "200m", "150m" };
+static u32 mmc_mux_table[] = {0, 1, 2, 3, 6};
+
+static const char *const comphy_mux_p[] = {
+		"25m", "100m"};
+static u32 comphy_mux_table[] = {0, 1};
+
+static const char *const sdio_mux_p[] = {
+		"100m", "50m", "150m", "25m" };
+static u32 sdio_mux_table[] = {0, 1, 2, 3};
+
+static const char *const femac_mux_p[] = {
+		"54m", "27m" };
+static const char *const gmac_mux_p[] = {
+		"125m", "75m" };
+static u32 eth_mux_table[] = {0, 1};
+
+static struct hisi_mux_clock hi3798mv200_mux_clks[] = {
+	{ HI3798MV200_MMC_MUX, "mmc_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		0, 0xa0, 8, 3, CLK_MUX_ROUND_CLOSEST, mmc_mux_table, },
+	{ HI3798MV200_COMBPHY0_MUX, "combphy0_mux", comphy_mux_p,
+		ARRAY_SIZE(comphy_mux_p), 0, 0x188, 3, 1, 0, comphy_mux_table, },
+	{ HI3798MV200_SDIO0_MUX, "sdio0_mux", sdio_mux_p, ARRAY_SIZE(sdio_mux_p),
+		0, 0x9c, 8, 2, CLK_MUX_ROUND_CLOSEST, sdio_mux_table, },
+	{ HI3798MV200_SDIO1_MUX, "sdio1_mux", sdio_mux_p, ARRAY_SIZE(sdio_mux_p),
+		0, 0x28c, 8, 2, CLK_MUX_ROUND_CLOSEST, sdio_mux_table, },
+	{ HI3798MV200_FEMAC_MUX, "femac_mux", femac_mux_p, ARRAY_SIZE(femac_mux_p),
+		0, 0xd0, 2, 1, 0, eth_mux_table, },
+	{ HI3798MV200_GMAC_MUX, "gmac_mux", gmac_mux_p, ARRAY_SIZE(gmac_mux_p),
+		0, 0xcc, 7, 1, 0, eth_mux_table, },
+};
+
+static u32 mmc_phase_regvals[] = {0, 1, 2, 3, 4, 5, 6, 7};
+static u32 mmc_phase_degrees[] = {0, 45, 90, 135, 180, 225, 270, 315};
+
+static struct hisi_phase_clock hi3798mv200_phase_clks[] = {
+	{ HISTB_SDIO0_SAMPLE_CLK, "sdio0_sample", "clk_sdio0_ciu",
+		0, 0x9c, 12, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_SDIO0_DRV_CLK, "sdio0_drive", "clk_sdio0_ciu",
+		0, 0x9c, 16, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_SDIO1_SAMPLE_CLK, "sdio1_sample", "clk_sdio1_ciu",
+		0, 0x28c, 12, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_SDIO1_DRV_CLK, "sdio1_drive", "clk_sdio1_ciu",
+		0, 0x28c, 16, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_MMC_SAMPLE_CLK, "mmc_sample", "clk_mmc_ciu",
+		0, 0xa0, 12, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_MMC_DRV_CLK, "mmc_drive", "clk_mmc_ciu",
+		0, 0xa0, 16, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+};
+
+static const struct hisi_gate_clock hi3798mv200_gate_clks[] = {
+	/* UART */
+	{ HISTB_UART2_CLK, "clk_uart2", "75m",
+		CLK_SET_RATE_PARENT, 0x68, 4, 0, },
+	{ HISTB_UART3_CLK, "clk_uart3", "75m",
+		CLK_SET_RATE_PARENT, 0x68, 6, 0, },
+	/* SPI */
+	{ HISTB_SPI0_CLK, "clk_spi0", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x70, 0, 0, },
+	/* I2C */
+	{ HISTB_I2C0_CLK, "clk_i2c0", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6c, 4, 0, },
+	{ HISTB_I2C1_CLK, "clk_i2c1", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6c, 8, 0, },
+	{ HISTB_I2C2_CLK, "clk_i2c2", "clk_apb",
+		CLK_SET_RATE_PARENT, 0x6c, 12, 0, },
+	/* SDIO */
+	{ HISTB_SDIO0_BIU_CLK, "clk_sdio0_biu", "200m",
+		CLK_SET_RATE_PARENT, 0x9c, 0, 0, },
+	{ HISTB_SDIO0_CIU_CLK, "clk_sdio0_ciu", "sdio0_mux",
+		CLK_SET_RATE_PARENT, 0x9c, 1, 0, },
+	{ HISTB_SDIO1_BIU_CLK, "clk_sdio1_biu", "200m",
+		CLK_SET_RATE_PARENT, 0x28c, 0, 0, },
+	{ HISTB_SDIO1_CIU_CLK, "clk_sdio1_ciu", "sdio1_mux",
+		CLK_SET_RATE_PARENT, 0x28c, 1, 0, },
+	/* EMMC */
+	{ HISTB_MMC_BIU_CLK, "clk_mmc_biu", "200m",
+		CLK_SET_RATE_PARENT, 0xa0, 0, 0, },
+	{ HISTB_MMC_CIU_CLK, "clk_mmc_ciu", "mmc_mux",
+		CLK_SET_RATE_PARENT, 0xa0, 1, 0, },
+	/* Ethernet */
+	{ HI3798MV200_GMAC_CLK, "clk_gmac", "gmac_mux",
+		CLK_SET_RATE_PARENT, 0xcc, 2, 0, },
+	{ HI3798MV200_GMACIF_CLK, "clk_gmacif", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xcc, 0, 0, },
+	{ HI3798MV200_FEMAC_CLK, "clk_femac", "femac_mux",
+		CLK_SET_RATE_PARENT, 0xd0, 1, 0, },
+	{ HI3798MV200_FEMACIF_CLK, "clk_femacif", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xd0, 0, 0, },
+	{ HI3798MV200_FEPHY_CLK, "clk_fephy", "25m",
+		CLK_SET_RATE_PARENT, 0x388, 0, 0, },
+	/* COMBPHY0 */
+	{ HISTB_COMBPHY0_CLK, "clk_combphy0", "combphy0_mux",
+		CLK_SET_RATE_PARENT, 0x188, 0, 0, },
+	/* USB2 */
+	{ HISTB_USB2_BUS_CLK, "clk_u2_bus", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xb8, 0, 0, },
+	{ HISTB_USB2_PHY_CLK, "clk_u2_phy", "60m",
+		CLK_SET_RATE_PARENT, 0xb8, 4, 0, },
+	{ HISTB_USB2_12M_CLK, "clk_u2_12m", "12m",
+		CLK_SET_RATE_PARENT, 0xb8, 2, 0 },
+	{ HISTB_USB2_48M_CLK, "clk_u2_48m", "48m",
+		CLK_SET_RATE_PARENT, 0xb8, 1, 0 },
+	{ HISTB_USB2_UTMI0_CLK, "clk_u2_utmi0", "60m",
+		CLK_SET_RATE_PARENT, 0xb8, 5, 0 },
+	{ HISTB_USB2_UTMI1_CLK, "clk_u2_utmi1", "60m",
+		CLK_SET_RATE_PARENT, 0xb8, 6, 0 },
+	{ HISTB_USB2_OTG_UTMI_CLK, "clk_u2_otg_utmi", "60m",
+		CLK_SET_RATE_PARENT, 0xb8, 3, 0 },
+	{ HISTB_USB2_PHY1_REF_CLK, "clk_u2_phy1_ref", "24m",
+		CLK_SET_RATE_PARENT, 0xbc, 0, 0 },
+	{ HISTB_USB2_PHY2_REF_CLK, "clk_u2_phy2_ref", "24m",
+		CLK_SET_RATE_PARENT, 0xbc, 2, 0 },
+	/* USB3 bus */
+	{ HISTB_USB3_GM_CLK, "clk_u3_gm", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xb0, 6, 0 },
+	{ HISTB_USB3_GS_CLK, "clk_u3_gs", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xb0, 5, 0 },
+	{ HISTB_USB3_BUS_CLK, "clk_u3_bus", "clk_ahb",
+		CLK_SET_RATE_PARENT, 0xb0, 0, 0 },
+	/* USB3 ctrl */
+	{ HISTB_USB3_SUSPEND_CLK, "clk_u3_suspend", NULL,
+		CLK_SET_RATE_PARENT, 0xb0, 2, 0 },
+	{ HISTB_USB3_PIPE_CLK, "clk_u3_pipe", NULL,
+		CLK_SET_RATE_PARENT, 0xb0, 3, 0 },
+	{ HISTB_USB3_REF_CLK, "clk_u3_ref", "125m",
+		CLK_SET_RATE_PARENT, 0xb0, 1, 0 },
+	{ HISTB_USB3_UTMI_CLK, "clk_u3_utmi", "60m",
+		CLK_SET_RATE_PARENT, 0xb0, 4, 0 },
+	/* Watchdog */
+	{ HISTB_WDG0_CLK, "clk_wdg0", "24m",
+		CLK_SET_RATE_PARENT, 0x178, 0, 0 },
+};
+
+static struct hisi_clock_data *hi3798mv200_clk_register(
+				struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data;
+	int ret;
+
+	clk_data = hisi_clk_alloc(pdev, HI3798MV200_CRG_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	/* hisi_phase_clock is resource managed */
+	ret = hisi_clk_register_phase(&pdev->dev,
+				hi3798mv200_phase_clks,
+				ARRAY_SIZE(hi3798mv200_phase_clks),
+				clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_fixed_rate(hi3798mv200_fixed_rate_clks,
+				     ARRAY_SIZE(hi3798mv200_fixed_rate_clks),
+				     clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_mux(hi3798mv200_mux_clks,
+				ARRAY_SIZE(hi3798mv200_mux_clks),
+				clk_data);
+	if (ret)
+		goto unregister_fixed_rate;
+
+	ret = hisi_clk_register_gate(hi3798mv200_gate_clks,
+				ARRAY_SIZE(hi3798mv200_gate_clks),
+				clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+			of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_gate:
+	hisi_clk_unregister_gate(hi3798mv200_gate_clks,
+				ARRAY_SIZE(hi3798mv200_gate_clks),
+				clk_data);
+unregister_mux:
+	hisi_clk_unregister_mux(hi3798mv200_mux_clks,
+				ARRAY_SIZE(hi3798mv200_mux_clks),
+				clk_data);
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3798mv200_fixed_rate_clks,
+				ARRAY_SIZE(hi3798mv200_fixed_rate_clks),
+				clk_data);
+	return ERR_PTR(ret);
+}
+
+static void hi3798mv200_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3798mv200_gate_clks,
+				ARRAY_SIZE(hi3798mv200_gate_clks),
+				crg->clk_data);
+	hisi_clk_unregister_mux(hi3798mv200_mux_clks,
+				ARRAY_SIZE(hi3798mv200_mux_clks),
+				crg->clk_data);
+	hisi_clk_unregister_fixed_rate(hi3798mv200_fixed_rate_clks,
+				ARRAY_SIZE(hi3798mv200_fixed_rate_clks),
+				crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3798mv200_crg_funcs = {
+	.register_clks = hi3798mv200_clk_register,
+	.unregister_clks = hi3798mv200_clk_unregister,
+};
+
+/* hi3798MV200 sysctrl CRG */
+
+#define HI3798MV200_SYSCTRL_INNER_CLK_OFFSET	16
+#define HI3798MV200_UART0_MUX			17
+
+#define HI3798MV200_SYSCTRL_NR_CLKS		32
+
+static const char *const uart0_mux[] = {
+		"3m", "75m" };
+static u32 uart0_mux_table[] = {0, 1};
+
+static const struct hisi_mux_clock hi3798mv200_sysctrl_mux_clks[] = {
+	{ HI3798MV200_UART0_MUX, "uart0_mux", uart0_mux, ARRAY_SIZE(uart0_mux),
+		CLK_SET_RATE_PARENT, 0x48, 29, 1, 0, uart0_mux_table, },
+};
+
+static const struct hisi_gate_clock hi3798mv200_sysctrl_gate_clks[] = {
+	{ HISTB_IR_CLK, "clk_ir", "24m",
+		CLK_SET_RATE_PARENT, 0x48, 4, 0, },
+	{ HISTB_TIMER01_CLK, "clk_timer01", "24m",
+		CLK_SET_RATE_PARENT, 0x48, 6, 0, },
+	{ HISTB_UART0_CLK, "clk_uart0", "uart0_mux",
+		CLK_SET_RATE_PARENT, 0x48, 12, 0, },
+};
+
+static struct hisi_clock_data *hi3798mv200_sysctrl_clk_register(
+					struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data;
+	int ret;
+
+	clk_data = hisi_clk_alloc(pdev, HI3798MV200_SYSCTRL_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_mux(hi3798mv200_sysctrl_mux_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_mux_clks),
+				clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_gate(hi3798mv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_gate_clks),
+				clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+			of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_gate:
+	hisi_clk_unregister_gate(hi3798mv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_gate_clks),
+				clk_data);
+unregister_mux:
+	hisi_clk_unregister_mux(hi3798mv200_sysctrl_mux_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_mux_clks),
+				clk_data);
+	return ERR_PTR(ret);
+}
+
+static void hi3798mv200_sysctrl_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3798mv200_sysctrl_gate_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_gate_clks),
+				crg->clk_data);
+	hisi_clk_unregister_mux(hi3798mv200_sysctrl_mux_clks,
+				ARRAY_SIZE(hi3798mv200_sysctrl_mux_clks),
+				crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3798mv200_sysctrl_funcs = {
+	.register_clks = hi3798mv200_sysctrl_clk_register,
+	.unregister_clks = hi3798mv200_sysctrl_clk_unregister,
+};
+
+static const struct of_device_id hi3798mv200_crg_match_table[] = {
+	{ .compatible = "hisilicon,hi3798mv200-crg",
+		.data = &hi3798mv200_crg_funcs },
+	{ .compatible = "hisilicon,hi3798mv200-sysctrl",
+		.data = &hi3798mv200_sysctrl_funcs },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hi3798mv200_crg_match_table);
+
+static int hi3798mv200_crg_probe(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg;
+
+	crg = devm_kmalloc(&pdev->dev, sizeof(*crg), GFP_KERNEL);
+	if (!crg)
+		return -ENOMEM;
+
+	crg->funcs = of_device_get_match_data(&pdev->dev);
+	if (!crg->funcs)
+		return -ENOENT;
+
+	crg->rstc = hisi_reset_init(pdev);
+	if (!crg->rstc)
+		return -ENOMEM;
+
+	crg->clk_data = crg->funcs->register_clks(pdev);
+	if (IS_ERR(crg->clk_data)) {
+		hisi_reset_exit(crg->rstc);
+		return PTR_ERR(crg->clk_data);
+	}
+
+	platform_set_drvdata(pdev, crg);
+	return 0;
+}
+
+static int hi3798mv200_crg_remove(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	hisi_reset_exit(crg->rstc);
+	crg->funcs->unregister_clks(pdev);
+	return 0;
+}
+
+static struct platform_driver hi3798mv200_crg_driver = {
+	.probe          = hi3798mv200_crg_probe,
+	.remove		= hi3798mv200_crg_remove,
+	.driver         = {
+		.name   = "hi3798mv200-crg",
+		.of_match_table = hi3798mv200_crg_match_table,
+	},
+};
+
+static int __init hi3798mv200_crg_init(void)
+{
+	return platform_driver_register(&hi3798mv200_crg_driver);
+}
+core_initcall(hi3798mv200_crg_init);
+
+static void __exit hi3798mv200_crg_exit(void)
+{
+	platform_driver_unregister(&hi3798mv200_crg_driver);
+}
+module_exit(hi3798mv200_crg_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HiSilicon Hi3798MV200 CRG Driver");

-- 
2.43.0



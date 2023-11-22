Return-Path: <linux-clk+bounces-452-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F37F47BC
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 14:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE11A2811A0
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 13:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617F154BD8;
	Wed, 22 Nov 2023 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="alb8Ptt5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E3310C;
	Wed, 22 Nov 2023 05:24:07 -0800 (PST)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AM9RHF1001094;
	Wed, 22 Nov 2023 14:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=Qruxks4rDZgLHMXa4jfpbZxAapVkpSdffilNyi6HdDM=; b=al
	b8Ptt56BK7b8a+qvWIT6VXuZLMWmA+rcnSIVLy+iQLnkD45wO3r/Qkva8TP6R5yR
	h+OvAzfpI9jhWB7LIPq/KpT8cOVI8VwJn/MZDLmj3br+YxnqxqavyldELOsslyUt
	tGnC7afG8dQF3PCcPul8R8TSAHQzypqUzN1z768zlozJC2wvKq3dVm8/r2GWKA0J
	9J9YrFa4arEu4nVso3KMGhNPuNBiO5WvtTVHo+PCZacFU8NFr4m5Ffu9AS4ucVje
	8K0fSKwr4WkL52nH7u91JPJriQKaf0SxvCbtO8Ixc1hQLQD0pVkf0ajkmIgS89xX
	1WFhoVsyfPzRks5BLVQQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ugn5ud82e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:23:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1684A100044;
	Wed, 22 Nov 2023 14:23:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07373216EDF;
	Wed, 22 Nov 2023 14:23:30 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 22 Nov
 2023 14:23:29 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] clk: stm32: introduce clocks for STM32MP257 platform
Date: Wed, 22 Nov 2023 14:21:55 +0100
Message-ID: <20231122132156.158103-5-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122132156.158103-1-gabriel.fernandez@foss.st.com>
References: <20231122132156.158103-1-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

This driver is intended for the STM32MP25 clock family and utilizes
the stm32-core API, similar to the stm32mp13 clock driver.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Kconfig         |    7 +
 drivers/clk/stm32/Makefile        |    1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1125 +++++++
 drivers/clk/stm32/reset-stm32.c   |   62 +-
 drivers/clk/stm32/reset-stm32.h   |    7 +
 drivers/clk/stm32/stm32mp25_rcc.h | 4977 +++++++++++++++++++++++++++++
 6 files changed, 6164 insertions(+), 15 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
 create mode 100644 drivers/clk/stm32/stm32mp25_rcc.h

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 3c8493a94a11..dca409d52652 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -25,5 +25,12 @@ config COMMON_CLK_STM32MP157
 	help
 	  Support for stm32mp15x SoC family clocks.
 
+config COMMON_CLK_STM32MP257
+	bool "Clock driver for stm32mp25x clocks"
+	depends on ARM64 || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp25x SoC family clocks.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 5ced7fe3ddec..0a627164fcce 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
new file mode 100644
index 000000000000..2b30ecc925b8
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -0,0 +1,1125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include "clk-stm32-core.h"
+#include "reset-stm32.h"
+
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
+#include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+#include "stm32mp25_rcc.h"
+
+static const char * const adc12_src[] = {
+	"ck_flexgen_46", "ck_icn_ls_mcu"
+};
+
+static const char * const adc3_src[] = {
+	"ck_flexgen_47", "ck_icn_ls_mcu", "ck_flexgen_46"
+};
+
+static const char * const usb2phy1_src[] = {
+	"ck_flexgen_57", "hse_div2_ck"
+};
+
+static const char * const usb2phy2_src[] = {
+	"ck_flexgen_58", "hse_div2_ck"
+};
+
+static const char * const usb3pciphy_src[] = {
+	"ck_flexgen_34", "hse_div2_ck"
+};
+
+static const char * const dsiblane_src[] = {
+	"txbyteclk", "ck_ker_ltdc"
+};
+
+static const char * const dsiphy_src[] = {
+	"ck_flexgen_28", "hse_ck"
+};
+
+static const char * const lvdsphy_src[] = {
+	"ck_flexgen_32", "hse_ck"
+};
+
+static const char * const dts_src[] = {
+	"hsi_ck", "hse_ck", "msi_ck"
+};
+
+static const char * const mco1_src[] = {
+	"ck_flexgen_61", "ck_obs0"
+};
+
+static const char * const mco2_src[] = {
+	"ck_flexgen_62", "ck_obs1"
+};
+
+enum enum_mux_cfg {
+	MUX_ADC12,
+	MUX_ADC3,
+	MUX_DSIBLANE,
+	MUX_DSIPHY,
+	MUX_DTS,
+	MUX_LVDSPHY,
+	MUX_MCO1,
+	MUX_MCO2,
+	MUX_USB2PHY1,
+	MUX_USB2PHY2,
+	MUX_USB3PCIEPHY,
+	MUX_NB
+};
+
+#define MUX_CFG(id, _offset, _shift, _witdh)\
+	[id] = {\
+		.offset		= (_offset),\
+		.shift		= (_shift),\
+		.width		= (_witdh),\
+	}
+
+static const struct stm32_mux_cfg stm32mp25_muxes[MUX_NB] = {
+	MUX_CFG(MUX_ADC12,		RCC_ADC12CFGR,		12,	1),
+	MUX_CFG(MUX_ADC3,		RCC_ADC3CFGR,		12,	2),
+	MUX_CFG(MUX_DSIBLANE,		RCC_DSICFGR,		12,	1),
+	MUX_CFG(MUX_DSIPHY,		RCC_DSICFGR,		15,	1),
+	MUX_CFG(MUX_DTS,		RCC_DTSCFGR,		12,	2),
+	MUX_CFG(MUX_LVDSPHY,		RCC_LVDSCFGR,		15,	1),
+	MUX_CFG(MUX_MCO1,		RCC_MCO1CFGR,		0,	1),
+	MUX_CFG(MUX_MCO2,		RCC_MCO2CFGR,		0,	1),
+	MUX_CFG(MUX_USB2PHY1,		RCC_USB2PHY1CFGR,	15,	1),
+	MUX_CFG(MUX_USB2PHY2,		RCC_USB2PHY2CFGR,	15,	1),
+	MUX_CFG(MUX_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	15,	1),
+};
+
+enum enum_gate_cfg {
+	GATE_ADC12,
+	GATE_ADC3,
+	GATE_ADF1,
+	GATE_CCI,
+	GATE_CRC,
+	GATE_CRYP1,
+	GATE_CRYP2,
+	GATE_CSI,
+	GATE_DCMIPP,
+	GATE_DSI,
+	GATE_DTS,
+	GATE_ETH1,
+	GATE_ETH1MAC,
+	GATE_ETH1RX,
+	GATE_ETH1STP,
+	GATE_ETH1TX,
+	GATE_ETH2,
+	GATE_ETH2MAC,
+	GATE_ETH2RX,
+	GATE_ETH2STP,
+	GATE_ETH2TX,
+	GATE_ETHSW,
+	GATE_ETHSWACMCFG,
+	GATE_ETHSWACMMSG,
+	GATE_ETHSWMAC,
+	GATE_ETHSWREF,
+	GATE_FDCAN,
+	GATE_GPU,
+	GATE_HASH,
+	GATE_HDP,
+	GATE_I2C1,
+	GATE_I2C2,
+	GATE_I2C3,
+	GATE_I2C4,
+	GATE_I2C5,
+	GATE_I2C6,
+	GATE_I2C7,
+	GATE_I2C8,
+	GATE_I3C1,
+	GATE_I3C2,
+	GATE_I3C3,
+	GATE_I3C4,
+	GATE_IS2M,
+	GATE_IWDG1,
+	GATE_IWDG2,
+	GATE_IWDG3,
+	GATE_IWDG4,
+	GATE_IWDG5,
+	GATE_LPTIM1,
+	GATE_LPTIM2,
+	GATE_LPTIM3,
+	GATE_LPTIM4,
+	GATE_LPTIM5,
+	GATE_LPUART1,
+	GATE_LTDC,
+	GATE_LVDS,
+	GATE_MCO1,
+	GATE_MCO2,
+	GATE_MDF1,
+	GATE_OSPIIOM,
+	GATE_PCIE,
+	GATE_PKA,
+	GATE_RNG,
+	GATE_SAES,
+	GATE_SAI1,
+	GATE_SAI2,
+	GATE_SAI3,
+	GATE_SAI4,
+	GATE_SDMMC1,
+	GATE_SDMMC2,
+	GATE_SDMMC3,
+	GATE_SERC,
+	GATE_SPDIFRX,
+	GATE_SPI1,
+	GATE_SPI2,
+	GATE_SPI3,
+	GATE_SPI4,
+	GATE_SPI5,
+	GATE_SPI6,
+	GATE_SPI7,
+	GATE_SPI8,
+	GATE_TIM1,
+	GATE_TIM10,
+	GATE_TIM11,
+	GATE_TIM12,
+	GATE_TIM13,
+	GATE_TIM14,
+	GATE_TIM15,
+	GATE_TIM16,
+	GATE_TIM17,
+	GATE_TIM2,
+	GATE_TIM20,
+	GATE_TIM3,
+	GATE_TIM4,
+	GATE_TIM5,
+	GATE_TIM6,
+	GATE_TIM7,
+	GATE_TIM8,
+	GATE_UART4,
+	GATE_UART5,
+	GATE_UART7,
+	GATE_UART8,
+	GATE_UART9,
+	GATE_USART1,
+	GATE_USART2,
+	GATE_USART3,
+	GATE_USART6,
+	GATE_USB2,
+	GATE_USB2PHY1,
+	GATE_USB2PHY2,
+	GATE_USB3DR,
+	GATE_USB3PCIEPHY,
+	GATE_USBTC,
+	GATE_VDEC,
+	GATE_VENC,
+	GATE_VREF,
+	GATE_WWDG1,
+	GATE_WWDG2,
+	GATE_NB
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)\
+	[id] = {\
+		.offset		= (_offset),\
+		.bit_idx	= (_bit_idx),\
+		.set_clr	= (_offset_clr),\
+	}
+
+static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
+	GATE_CFG(GATE_ADC12,		RCC_ADC12CFGR,		1,	0),
+	GATE_CFG(GATE_ADC3,		RCC_ADC3CFGR,		1,	0),
+	GATE_CFG(GATE_ADF1,		RCC_ADF1CFGR,		1,	0),
+	GATE_CFG(GATE_CCI,		RCC_CCICFGR,		1,	0),
+	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
+	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
+	GATE_CFG(GATE_CRYP2,		RCC_CRYP2CFGR,		1,	0),
+	GATE_CFG(GATE_CSI,		RCC_CSICFGR,		1,	0),
+	GATE_CFG(GATE_DCMIPP,		RCC_DCMIPPCFGR,		1,	0),
+	GATE_CFG(GATE_DSI,		RCC_DSICFGR,		1,	0),
+	GATE_CFG(GATE_DTS,		RCC_DTSCFGR,		1,	0),
+	GATE_CFG(GATE_ETH1,		RCC_ETH1CFGR,		5,	0),
+	GATE_CFG(GATE_ETH1MAC,		RCC_ETH1CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1RX,		RCC_ETH1CFGR,		10,	0),
+	GATE_CFG(GATE_ETH1STP,		RCC_ETH1CFGR,		4,	0),
+	GATE_CFG(GATE_ETH1TX,		RCC_ETH1CFGR,		8,	0),
+	GATE_CFG(GATE_ETH2,		RCC_ETH2CFGR,		5,	0),
+	GATE_CFG(GATE_ETH2MAC,		RCC_ETH2CFGR,		1,	0),
+	GATE_CFG(GATE_ETH2RX,		RCC_ETH2CFGR,		10,	0),
+	GATE_CFG(GATE_ETH2STP,		RCC_ETH2CFGR,		4,	0),
+	GATE_CFG(GATE_ETH2TX,		RCC_ETH2CFGR,		8,	0),
+	GATE_CFG(GATE_ETHSW,		RCC_ETHSWCFGR,		5,	0),
+	GATE_CFG(GATE_ETHSWACMCFG,	RCC_ETHSWACMCFGR,	1,	0),
+	GATE_CFG(GATE_ETHSWACMMSG,	RCC_ETHSWACMMSGCFGR,	1,	0),
+	GATE_CFG(GATE_ETHSWMAC,		RCC_ETHSWCFGR,		1,	0),
+	GATE_CFG(GATE_ETHSWREF,		RCC_ETHSWCFGR,		21,	0),
+	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
+	GATE_CFG(GATE_GPU,		RCC_GPUCFGR,		1,	0),
+	GATE_CFG(GATE_HASH,		RCC_HASHCFGR,		1,	0),
+	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
+	GATE_CFG(GATE_I2C1,		RCC_I2C1CFGR,		1,	0),
+	GATE_CFG(GATE_I2C2,		RCC_I2C2CFGR,		1,	0),
+	GATE_CFG(GATE_I2C3,		RCC_I2C3CFGR,		1,	0),
+	GATE_CFG(GATE_I2C4,		RCC_I2C4CFGR,		1,	0),
+	GATE_CFG(GATE_I2C5,		RCC_I2C5CFGR,		1,	0),
+	GATE_CFG(GATE_I2C6,		RCC_I2C6CFGR,		1,	0),
+	GATE_CFG(GATE_I2C7,		RCC_I2C7CFGR,		1,	0),
+	GATE_CFG(GATE_I2C8,		RCC_I2C8CFGR,		1,	0),
+	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
+	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
+	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
+	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
+	GATE_CFG(GATE_IS2M,		RCC_IS2MCFGR,		1,	0),
+	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG5,		RCC_IWDG5CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
+	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
+	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
+	GATE_CFG(GATE_LVDS,		RCC_LVDSCFGR,		1,	0),
+	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
+	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,		8,	0),
+	GATE_CFG(GATE_MDF1,		RCC_MDF1CFGR,		1,	0),
+	GATE_CFG(GATE_OSPIIOM,		RCC_OSPIIOMCFGR,	1,	0),
+	GATE_CFG(GATE_PCIE,		RCC_PCIECFGR,		1,	0),
+	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
+	GATE_CFG(GATE_RNG,		RCC_RNGCFGR,		1,	0),
+	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
+	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
+	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
+	GATE_CFG(GATE_SAI3,		RCC_SAI3CFGR,		1,	0),
+	GATE_CFG(GATE_SAI4,		RCC_SAI4CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC1,		RCC_SDMMC1CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC2,		RCC_SDMMC2CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC3,		RCC_SDMMC3CFGR,		1,	0),
+	GATE_CFG(GATE_SERC,		RCC_SERCCFGR,		1,	0),
+	GATE_CFG(GATE_SPDIFRX,		RCC_SPDIFRXCFGR,	1,	0),
+	GATE_CFG(GATE_SPI1,		RCC_SPI1CFGR,		1,	0),
+	GATE_CFG(GATE_SPI2,		RCC_SPI2CFGR,		1,	0),
+	GATE_CFG(GATE_SPI3,		RCC_SPI3CFGR,		1,	0),
+	GATE_CFG(GATE_SPI4,		RCC_SPI4CFGR,		1,	0),
+	GATE_CFG(GATE_SPI5,		RCC_SPI5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
+	GATE_CFG(GATE_SPI7,		RCC_SPI7CFGR,		1,	0),
+	GATE_CFG(GATE_SPI8,		RCC_SPI8CFGR,		1,	0),
+	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
+	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
+	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
+	GATE_CFG(GATE_TIM12,		RCC_TIM12CFGR,		1,	0),
+	GATE_CFG(GATE_TIM13,		RCC_TIM13CFGR,		1,	0),
+	GATE_CFG(GATE_TIM14,		RCC_TIM14CFGR,		1,	0),
+	GATE_CFG(GATE_TIM15,		RCC_TIM15CFGR,		1,	0),
+	GATE_CFG(GATE_TIM16,		RCC_TIM16CFGR,		1,	0),
+	GATE_CFG(GATE_TIM17,		RCC_TIM17CFGR,		1,	0),
+	GATE_CFG(GATE_TIM2,		RCC_TIM2CFGR,		1,	0),
+	GATE_CFG(GATE_TIM20,		RCC_TIM20CFGR,		1,	0),
+	GATE_CFG(GATE_TIM3,		RCC_TIM3CFGR,		1,	0),
+	GATE_CFG(GATE_TIM4,		RCC_TIM4CFGR,		1,	0),
+	GATE_CFG(GATE_TIM5,		RCC_TIM5CFGR,		1,	0),
+	GATE_CFG(GATE_TIM6,		RCC_TIM6CFGR,		1,	0),
+	GATE_CFG(GATE_TIM7,		RCC_TIM7CFGR,		1,	0),
+	GATE_CFG(GATE_TIM8,		RCC_TIM8CFGR,		1,	0),
+	GATE_CFG(GATE_UART4,		RCC_UART4CFGR,		1,	0),
+	GATE_CFG(GATE_UART5,		RCC_UART5CFGR,		1,	0),
+	GATE_CFG(GATE_UART7,		RCC_UART7CFGR,		1,	0),
+	GATE_CFG(GATE_UART8,		RCC_UART8CFGR,		1,	0),
+	GATE_CFG(GATE_UART9,		RCC_UART9CFGR,		1,	0),
+	GATE_CFG(GATE_USART1,		RCC_USART1CFGR,		1,	0),
+	GATE_CFG(GATE_USART2,		RCC_USART2CFGR,		1,	0),
+	GATE_CFG(GATE_USART3,		RCC_USART3CFGR,		1,	0),
+	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
+	GATE_CFG(GATE_USB2,		RCC_USB2CFGR,		1,	0),
+	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
+	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
+	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
+	GATE_CFG(GATE_USBTC,		RCC_USBTCCFGR,		1,	0),
+	GATE_CFG(GATE_VDEC,		RCC_VDECCFGR,		1,	0),
+	GATE_CFG(GATE_VENC,		RCC_VENCCFGR,		1,	0),
+	GATE_CFG(GATE_VREF,		RCC_VREFCFGR,		1,	0),
+	GATE_CFG(GATE_WWDG1,		RCC_WWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_WWDG2,		RCC_WWDG2CFGR,		1,	0),
+};
+
+#define CLK_STM32_GATE(_name, _parent, _flags, _gate_id)\
+struct clk_stm32_gate _name = {\
+	.gate_id = _gate_id,\
+	.hw.init = CLK_HW_INIT(#_name, _parent, &clk_stm32_gate_ops, _flags),\
+}
+
+#define CLK_STM32_MUX(_name, _parents, _flags, _mux_id)\
+struct clk_stm32_mux _name = {\
+	.mux_id = _mux_id,\
+	.hw.init = CLK_HW_INIT_PARENTS(#_name, _parents, &clk_stm32_mux_ops, _flags),\
+}
+
+#define CLK_STM32_DIV(_name, _parent, _flags, _div_id)\
+struct clk_stm32_div _name = {\
+	.div_id = _div_id,\
+	.hw.init = CLK_HW_INIT(#_name, _parent, &clk_stm32_divider_ops, _flags),\
+}
+
+#define CLK_STM32_COMPOSITE(_name, _parents, _flags, _gate_id, _mux_id, _div_id)\
+struct clk_stm32_composite _name = {\
+	.gate_id = _gate_id,\
+	.mux_id = _mux_id,\
+	.div_id = _div_id,\
+	.hw.init = CLK_HW_INIT_PARENTS(#_name, _parents, &clk_stm32_composite_ops, _flags),\
+}
+
+/* ADC */
+static CLK_STM32_GATE(ck_icn_p_adc12, "ck_icn_ls_mcu", 0, GATE_ADC12);
+static CLK_STM32_COMPOSITE(ck_ker_adc12, adc12_src, 0, GATE_ADC12, MUX_ADC12, NO_STM32_DIV);
+static CLK_STM32_GATE(ck_icn_p_adc3, "ck_icn_ls_mcu", 0, GATE_ADC3);
+static CLK_STM32_COMPOSITE(ck_ker_adc3, adc3_src, 0, GATE_ADC3, MUX_ADC3, NO_STM32_DIV);
+
+/* ADF */
+static CLK_STM32_GATE(ck_icn_p_adf1, "ck_icn_ls_mcu", 0, GATE_ADF1);
+static CLK_STM32_GATE(ck_ker_adf1, "ck_flexgen_42", 0, GATE_ADF1);
+
+/* DCMI */
+static CLK_STM32_GATE(ck_icn_p_cci, "ck_icn_ls_mcu", 0, GATE_CCI);
+
+/* CSI-HOST */
+static CLK_STM32_GATE(ck_icn_p_csi, "ck_icn_apb4", 0, GATE_CSI);
+static CLK_STM32_GATE(ck_ker_csi, "ck_flexgen_29", 0, GATE_CSI);
+static CLK_STM32_GATE(ck_ker_csitxesc, "ck_flexgen_30", 0, GATE_CSI);
+
+/* CSI-PHY */
+static CLK_STM32_GATE(ck_ker_csiphy, "ck_flexgen_31", 0, GATE_CSI);
+
+/* DCMIPP */
+static CLK_STM32_GATE(ck_icn_p_dcmipp, "ck_icn_apb4", 0, GATE_DCMIPP);
+
+/* CRC */
+static CLK_STM32_GATE(ck_icn_p_crc, "ck_icn_ls_mcu", 0, GATE_CRC);
+
+/* CRYP */
+static CLK_STM32_GATE(ck_icn_p_cryp1, "ck_icn_ls_mcu", 0, GATE_CRYP1);
+static CLK_STM32_GATE(ck_icn_p_cryp2, "ck_icn_ls_mcu", 0, GATE_CRYP2);
+
+/* DBG & TRACE*/
+/* Trace and debug clocks are managed by SCMI */
+
+/* LTDC */
+static CLK_STM32_GATE(ck_icn_p_ltdc, "ck_icn_apb4", 0, GATE_LTDC);
+static CLK_STM32_GATE(ck_ker_ltdc, "ck_flexgen_27", CLK_SET_RATE_PARENT, GATE_LTDC);
+
+/* DSI */
+static CLK_STM32_GATE(ck_icn_p_dsi, "ck_icn_apb4", 0, GATE_DSI);
+static CLK_STM32_COMPOSITE(clk_lanebyte, dsiblane_src, 0, GATE_DSI, MUX_DSIBLANE, NO_STM32_DIV);
+
+/* LVDS */
+static CLK_STM32_GATE(ck_icn_p_lvds, "ck_icn_apb4", 0, GATE_LVDS);
+
+/* DSI PHY */
+static CLK_STM32_COMPOSITE(clk_phy_dsi, dsiphy_src, 0, GATE_DSI, MUX_DSIPHY, NO_STM32_DIV);
+
+/* LVDS PHY */
+static CLK_STM32_COMPOSITE(ck_ker_lvdsphy, lvdsphy_src, 0, GATE_LVDS, MUX_LVDSPHY, NO_STM32_DIV);
+
+/* DTS */
+static CLK_STM32_COMPOSITE(ck_ker_dts, dts_src, 0, GATE_DTS, MUX_DTS, NO_STM32_DIV);
+
+/* ETHERNET */
+static CLK_STM32_GATE(ck_icn_p_eth1, "ck_icn_ls_mcu", 0, GATE_ETH1);
+static CLK_STM32_GATE(ck_ker_eth1stp, "ck_icn_ls_mcu", 0, GATE_ETH1STP);
+static CLK_STM32_GATE(ck_ker_eth1, "ck_flexgen_54", 0, GATE_ETH1);
+static CLK_STM32_GATE(ck_ker_eth1ptp, "ck_flexgen_56", 0, GATE_ETH1);
+static CLK_STM32_GATE(ck_ker_eth1mac, "ck_icn_ls_mcu", 0, GATE_ETH1MAC);
+static CLK_STM32_GATE(ck_ker_eth1tx, "ck_icn_ls_mcu", 0, GATE_ETH1TX);
+static CLK_STM32_GATE(ck_ker_eth1rx, "ck_icn_ls_mcu", 0, GATE_ETH1RX);
+
+static CLK_STM32_GATE(ck_icn_p_eth2, "ck_icn_ls_mcu", 0, GATE_ETH2);
+static CLK_STM32_GATE(ck_ker_eth2stp, "ck_icn_ls_mcu", 0, GATE_ETH2STP);
+static CLK_STM32_GATE(ck_ker_eth2, "ck_flexgen_55", 0, GATE_ETH2);
+static CLK_STM32_GATE(ck_ker_eth2ptp, "ck_flexgen_56", 0, GATE_ETH2);
+static CLK_STM32_GATE(ck_ker_eth2mac, "ck_icn_ls_mcu", 0, GATE_ETH2MAC);
+static CLK_STM32_GATE(ck_ker_eth2tx, "ck_icn_ls_mcu", 0, GATE_ETH2TX);
+static CLK_STM32_GATE(ck_ker_eth2rx, "ck_icn_ls_mcu", 0, GATE_ETH2RX);
+
+static CLK_STM32_GATE(ck_icn_p_ethsw, "ck_icn_ls_mcu", 0, GATE_ETHSWMAC);
+static CLK_STM32_GATE(ck_ker_ethsw, "ck_flexgen_54", 0, GATE_ETHSW);
+static CLK_STM32_GATE(ck_ker_ethswref, "ck_flexgen_60", 0, GATE_ETHSWREF);
+
+static CLK_STM32_GATE(ck_icn_p_ethsw_acm_cfg, "ck_icn_ls_mcu", 0, GATE_ETHSWACMCFG);
+static CLK_STM32_GATE(ck_icn_p_ethsw_acm_msg, "ck_icn_ls_mcu", 0, GATE_ETHSWACMMSG);
+
+/* FDCAN */
+static CLK_STM32_GATE(ck_icn_p_fdcan, "ck_icn_apb2", 0, GATE_FDCAN);
+static CLK_STM32_GATE(ck_ker_fdcan, "ck_flexgen_26", 0, GATE_FDCAN);
+
+/* GPU */
+static CLK_STM32_GATE(ck_icn_m_gpu, "ck_flexgen_59", 0, GATE_GPU);
+static CLK_STM32_GATE(ck_ker_gpu, "ck_pll3", 0, GATE_GPU);
+
+/* HASH */
+static CLK_STM32_GATE(ck_icn_p_hash, "ck_icn_ls_mcu", 0, GATE_HASH);
+
+/* HDP */
+static CLK_STM32_GATE(ck_icn_p_hdp, "ck_icn_apb3", 0, GATE_HDP);
+
+/* I2C */
+static CLK_STM32_GATE(ck_icn_p_i2c8, "ck_icn_ls_mcu", 0, GATE_I2C8);
+static CLK_STM32_GATE(ck_icn_p_i2c1, "ck_icn_apb1", 0, GATE_I2C1);
+static CLK_STM32_GATE(ck_icn_p_i2c2, "ck_icn_apb1", 0, GATE_I2C2);
+static CLK_STM32_GATE(ck_icn_p_i2c3, "ck_icn_apb1", 0, GATE_I2C3);
+static CLK_STM32_GATE(ck_icn_p_i2c4, "ck_icn_apb1", 0, GATE_I2C4);
+static CLK_STM32_GATE(ck_icn_p_i2c5, "ck_icn_apb1", 0, GATE_I2C5);
+static CLK_STM32_GATE(ck_icn_p_i2c6, "ck_icn_apb1", 0, GATE_I2C6);
+static CLK_STM32_GATE(ck_icn_p_i2c7, "ck_icn_apb1", 0, GATE_I2C7);
+
+static CLK_STM32_GATE(ck_ker_i2c1, "ck_flexgen_12", 0, GATE_I2C1);
+static CLK_STM32_GATE(ck_ker_i2c2, "ck_flexgen_12", 0, GATE_I2C2);
+static CLK_STM32_GATE(ck_ker_i2c3, "ck_flexgen_13", 0, GATE_I2C3);
+static CLK_STM32_GATE(ck_ker_i2c5, "ck_flexgen_13", 0, GATE_I2C5);
+static CLK_STM32_GATE(ck_ker_i2c4, "ck_flexgen_14", 0, GATE_I2C4);
+static CLK_STM32_GATE(ck_ker_i2c6, "ck_flexgen_14", 0, GATE_I2C6);
+static CLK_STM32_GATE(ck_ker_i2c7, "ck_flexgen_15", 0, GATE_I2C7);
+static CLK_STM32_GATE(ck_ker_i2c8, "ck_flexgen_38", 0, GATE_I2C8);
+
+/* I3C */
+static CLK_STM32_GATE(ck_icn_p_i3c1, "ck_icn_apb1", 0, GATE_I3C1);
+static CLK_STM32_GATE(ck_icn_p_i3c2, "ck_icn_apb1", 0, GATE_I3C2);
+static CLK_STM32_GATE(ck_icn_p_i3c3, "ck_icn_apb1", 0, GATE_I3C3);
+static CLK_STM32_GATE(ck_icn_p_i3c4, "ck_icn_ls_mcu", 0, GATE_I3C4);
+
+static CLK_STM32_GATE(ck_ker_i3c1, "ck_flexgen_12", 0, GATE_I3C1);
+static CLK_STM32_GATE(ck_ker_i3c2, "ck_flexgen_12", 0, GATE_I3C2);
+static CLK_STM32_GATE(ck_ker_i3c3, "ck_flexgen_13", 0, GATE_I3C3);
+static CLK_STM32_GATE(ck_ker_i3c4, "ck_flexgen_36", 0, GATE_I3C4);
+
+/* I2S */
+static CLK_STM32_GATE(ck_icn_p_is2m, "ck_icn_apb3", 0, GATE_IS2M);
+
+/* IWDG */
+static CLK_STM32_GATE(ck_icn_p_iwdg2, "ck_icn_apb3", 0, GATE_IWDG2);
+static CLK_STM32_GATE(ck_icn_p_iwdg3, "ck_icn_apb3", 0, GATE_IWDG3);
+static CLK_STM32_GATE(ck_icn_p_iwdg4, "ck_icn_apb3", 0, GATE_IWDG4);
+static CLK_STM32_GATE(ck_icn_p_iwdg5, "ck_icn_ls_mcu", 0, GATE_IWDG5);
+
+/* LPTIM */
+static CLK_STM32_GATE(ck_icn_p_lptim1, "ck_icn_apb1", 0, GATE_LPTIM1);
+static CLK_STM32_GATE(ck_icn_p_lptim2, "ck_icn_apb1", 0, GATE_LPTIM2);
+static CLK_STM32_GATE(ck_icn_p_lptim3, "ck_icn_ls_mcu", 0, GATE_LPTIM3);
+static CLK_STM32_GATE(ck_icn_p_lptim4, "ck_icn_ls_mcu", 0, GATE_LPTIM4);
+static CLK_STM32_GATE(ck_icn_p_lptim5, "ck_icn_ls_mcu", 0, GATE_LPTIM5);
+
+static CLK_STM32_GATE(ck_ker_lptim1, "ck_flexgen_07", 0, GATE_LPTIM1);
+static CLK_STM32_GATE(ck_ker_lptim2, "ck_flexgen_07", 0, GATE_LPTIM2);
+static CLK_STM32_GATE(ck_ker_lptim3, "ck_flexgen_40", 0, GATE_LPTIM3);
+static CLK_STM32_GATE(ck_ker_lptim4, "ck_flexgen_41", 0, GATE_LPTIM4);
+static CLK_STM32_GATE(ck_ker_lptim5, "ck_flexgen_41", 0, GATE_LPTIM5);
+
+/* LPUART */
+static CLK_STM32_GATE(ck_icn_p_lpuart1, "ck_icn_ls_mcu", 0, GATE_LPUART1);
+static CLK_STM32_GATE(ck_ker_lpuart1, "ck_flexgen_39", 0, GATE_LPUART1);
+
+/* MCO1 & MCO2 */
+static CLK_STM32_COMPOSITE(ck_mco1, mco1_src, 0, GATE_MCO1, MUX_MCO1, NO_STM32_DIV);
+static CLK_STM32_COMPOSITE(ck_mco2, mco2_src, 0, GATE_MCO2, MUX_MCO2, NO_STM32_DIV);
+
+/* MDF */
+static CLK_STM32_GATE(ck_icn_p_mdf1, "ck_icn_ls_mcu", 0, GATE_MDF1);
+static CLK_STM32_GATE(ck_ker_mdf1, "ck_flexgen_23", 0, GATE_MDF1);
+
+/* OSPI */
+static CLK_STM32_GATE(ck_icn_p_ospiiom, "ck_icn_ls_mcu", 0, GATE_OSPIIOM);
+
+/* PCIE */
+static CLK_STM32_GATE(ck_icn_p_pcie, "ck_icn_ls_mcu", 0, GATE_PCIE);
+
+/* SAI */
+static CLK_STM32_GATE(ck_icn_p_sai1, "ck_icn_apb2", 0, GATE_SAI1);
+static CLK_STM32_GATE(ck_icn_p_sai2, "ck_icn_apb2", 0, GATE_SAI2);
+static CLK_STM32_GATE(ck_icn_p_sai3, "ck_icn_apb2", 0, GATE_SAI3);
+static CLK_STM32_GATE(ck_icn_p_sai4, "ck_icn_apb2", 0, GATE_SAI4);
+static CLK_STM32_GATE(ck_ker_sai1, "ck_flexgen_23", CLK_SET_RATE_PARENT, GATE_SAI1);
+static CLK_STM32_GATE(ck_ker_sai2, "ck_flexgen_24", CLK_SET_RATE_PARENT, GATE_SAI2);
+static CLK_STM32_GATE(ck_ker_sai3, "ck_flexgen_25", CLK_SET_RATE_PARENT, GATE_SAI3);
+static CLK_STM32_GATE(ck_ker_sai4, "ck_flexgen_25", CLK_SET_RATE_PARENT, GATE_SAI4);
+
+/* SDMMC */
+static CLK_STM32_GATE(ck_icn_m_sdmmc1, "ck_icn_sdmmc", 0, GATE_SDMMC1);
+static CLK_STM32_GATE(ck_icn_m_sdmmc2, "ck_icn_sdmmc", 0, GATE_SDMMC2);
+static CLK_STM32_GATE(ck_icn_m_sdmmc3, "ck_icn_sdmmc", 0, GATE_SDMMC3);
+static CLK_STM32_GATE(ck_ker_sdmmc1, "ck_flexgen_51", 0, GATE_SDMMC1);
+static CLK_STM32_GATE(ck_ker_sdmmc2, "ck_flexgen_52", 0, GATE_SDMMC2);
+static CLK_STM32_GATE(ck_ker_sdmmc3, "ck_flexgen_53", 0, GATE_SDMMC3);
+
+/* SERC */
+static CLK_STM32_GATE(ck_icn_p_serc, "ck_icn_apb3", 0, GATE_SERC);
+
+/* SPDIF */
+static CLK_STM32_GATE(ck_icn_p_spdifrx, "ck_icn_apb1", 0, GATE_SPDIFRX);
+static CLK_STM32_GATE(ck_ker_spdifrx, "ck_flexgen_11", 0, GATE_SPDIFRX);
+
+/* SPI */
+static CLK_STM32_GATE(ck_icn_p_spi1, "ck_icn_apb2", 0, GATE_SPI1);
+static CLK_STM32_GATE(ck_icn_p_spi2, "ck_icn_apb1", 0, GATE_SPI2);
+static CLK_STM32_GATE(ck_icn_p_spi3, "ck_icn_apb1", 0, GATE_SPI3);
+static CLK_STM32_GATE(ck_icn_p_spi4, "ck_icn_apb2", 0, GATE_SPI4);
+static CLK_STM32_GATE(ck_icn_p_spi5, "ck_icn_apb2", 0, GATE_SPI5);
+static CLK_STM32_GATE(ck_icn_p_spi6, "ck_icn_apb2", 0, GATE_SPI6);
+static CLK_STM32_GATE(ck_icn_p_spi7, "ck_icn_apb2", 0, GATE_SPI7);
+static CLK_STM32_GATE(ck_icn_p_spi8, "ck_icn_ls_mcu", 0, GATE_SPI8);
+
+static CLK_STM32_GATE(ck_ker_spi1, "ck_flexgen_16", CLK_SET_RATE_PARENT, GATE_SPI1);
+static CLK_STM32_GATE(ck_ker_spi2, "ck_flexgen_10", CLK_SET_RATE_PARENT, GATE_SPI2);
+static CLK_STM32_GATE(ck_ker_spi3, "ck_flexgen_10", CLK_SET_RATE_PARENT, GATE_SPI3);
+static CLK_STM32_GATE(ck_ker_spi4, "ck_flexgen_17", 0, GATE_SPI4);
+static CLK_STM32_GATE(ck_ker_spi5, "ck_flexgen_17", 0, GATE_SPI5);
+static CLK_STM32_GATE(ck_ker_spi6, "ck_flexgen_18", 0, GATE_SPI6);
+static CLK_STM32_GATE(ck_ker_spi7, "ck_flexgen_18", 0, GATE_SPI7);
+static CLK_STM32_GATE(ck_ker_spi8, "ck_flexgen_37", 0, GATE_SPI8);
+
+/* Timers */
+static CLK_STM32_GATE(ck_icn_p_tim2, "ck_icn_apb1", 0, GATE_TIM2);
+static CLK_STM32_GATE(ck_icn_p_tim3, "ck_icn_apb1", 0, GATE_TIM3);
+static CLK_STM32_GATE(ck_icn_p_tim4, "ck_icn_apb1", 0, GATE_TIM4);
+static CLK_STM32_GATE(ck_icn_p_tim5, "ck_icn_apb1", 0, GATE_TIM5);
+static CLK_STM32_GATE(ck_icn_p_tim6, "ck_icn_apb1", 0, GATE_TIM6);
+static CLK_STM32_GATE(ck_icn_p_tim7, "ck_icn_apb1", 0, GATE_TIM7);
+static CLK_STM32_GATE(ck_icn_p_tim10, "ck_icn_apb1", 0, GATE_TIM10);
+static CLK_STM32_GATE(ck_icn_p_tim11, "ck_icn_apb1", 0, GATE_TIM11);
+static CLK_STM32_GATE(ck_icn_p_tim12, "ck_icn_apb1", 0, GATE_TIM12);
+static CLK_STM32_GATE(ck_icn_p_tim13, "ck_icn_apb1", 0, GATE_TIM13);
+static CLK_STM32_GATE(ck_icn_p_tim14, "ck_icn_apb1", 0, GATE_TIM14);
+
+static CLK_STM32_GATE(ck_icn_p_tim1, "ck_icn_apb2", 0, GATE_TIM1);
+static CLK_STM32_GATE(ck_icn_p_tim8, "ck_icn_apb2", 0, GATE_TIM8);
+static CLK_STM32_GATE(ck_icn_p_tim15, "ck_icn_apb2", 0, GATE_TIM15);
+static CLK_STM32_GATE(ck_icn_p_tim16, "ck_icn_apb2", 0, GATE_TIM16);
+static CLK_STM32_GATE(ck_icn_p_tim17, "ck_icn_apb2", 0, GATE_TIM17);
+static CLK_STM32_GATE(ck_icn_p_tim20, "ck_icn_apb2", 0, GATE_TIM20);
+
+static CLK_STM32_GATE(ck_ker_tim2, "timg1_ck", 0, GATE_TIM2);
+static CLK_STM32_GATE(ck_ker_tim3, "timg1_ck", 0, GATE_TIM3);
+static CLK_STM32_GATE(ck_ker_tim4, "timg1_ck", 0, GATE_TIM4);
+static CLK_STM32_GATE(ck_ker_tim5, "timg1_ck", 0, GATE_TIM5);
+static CLK_STM32_GATE(ck_ker_tim6, "timg1_ck", 0, GATE_TIM6);
+static CLK_STM32_GATE(ck_ker_tim7, "timg1_ck", 0, GATE_TIM7);
+static CLK_STM32_GATE(ck_ker_tim10, "timg1_ck", 0, GATE_TIM10);
+static CLK_STM32_GATE(ck_ker_tim11, "timg1_ck", 0, GATE_TIM11);
+static CLK_STM32_GATE(ck_ker_tim12, "timg1_ck", 0, GATE_TIM12);
+static CLK_STM32_GATE(ck_ker_tim13, "timg1_ck", 0, GATE_TIM13);
+static CLK_STM32_GATE(ck_ker_tim14, "timg1_ck", 0, GATE_TIM14);
+
+static CLK_STM32_GATE(ck_ker_tim1, "timg2_ck", 0, GATE_TIM1);
+static CLK_STM32_GATE(ck_ker_tim8, "timg2_ck", 0, GATE_TIM8);
+static CLK_STM32_GATE(ck_ker_tim15, "timg2_ck", 0, GATE_TIM15);
+static CLK_STM32_GATE(ck_ker_tim16, "timg2_ck", 0, GATE_TIM16);
+static CLK_STM32_GATE(ck_ker_tim17, "timg2_ck", 0, GATE_TIM17);
+static CLK_STM32_GATE(ck_ker_tim20, "timg2_ck", 0, GATE_TIM20);
+
+/* UART/USART */
+static CLK_STM32_GATE(ck_icn_p_usart2, "ck_icn_apb1", 0, GATE_USART2);
+static CLK_STM32_GATE(ck_icn_p_usart3, "ck_icn_apb1", 0, GATE_USART3);
+static CLK_STM32_GATE(ck_icn_p_uart4, "ck_icn_apb1", 0, GATE_UART4);
+static CLK_STM32_GATE(ck_icn_p_uart5, "ck_icn_apb1", 0, GATE_UART5);
+static CLK_STM32_GATE(ck_icn_p_usart1, "ck_icn_apb2", 0, GATE_USART1);
+static CLK_STM32_GATE(ck_icn_p_usart6, "ck_icn_apb2", 0, GATE_USART6);
+static CLK_STM32_GATE(ck_icn_p_uart7, "ck_icn_apb2", 0, GATE_UART7);
+static CLK_STM32_GATE(ck_icn_p_uart8, "ck_icn_apb2", 0, GATE_UART8);
+static CLK_STM32_GATE(ck_icn_p_uart9, "ck_icn_apb2", 0, GATE_UART9);
+
+static CLK_STM32_GATE(ck_ker_usart2, "ck_flexgen_08", 0, GATE_USART2);
+static CLK_STM32_GATE(ck_ker_uart4, "ck_flexgen_08", 0, GATE_UART4);
+static CLK_STM32_GATE(ck_ker_usart3, "ck_flexgen_09", 0, GATE_USART3);
+static CLK_STM32_GATE(ck_ker_uart5, "ck_flexgen_09", 0, GATE_UART5);
+static CLK_STM32_GATE(ck_ker_usart1, "ck_flexgen_19", 0, GATE_USART1);
+static CLK_STM32_GATE(ck_ker_usart6, "ck_flexgen_20", 0, GATE_USART6);
+static CLK_STM32_GATE(ck_ker_uart7, "ck_flexgen_21", 0, GATE_UART7);
+static CLK_STM32_GATE(ck_ker_uart8, "ck_flexgen_21", 0, GATE_UART8);
+static CLK_STM32_GATE(ck_ker_uart9, "ck_flexgen_22", 0, GATE_UART9);
+
+/* USB2PHY1 */
+static CLK_STM32_COMPOSITE(ck_ker_usb2phy1, usb2phy1_src, 0,
+			   GATE_USB2PHY1, MUX_USB2PHY1, NO_STM32_DIV);
+
+/* USB2H */
+static CLK_STM32_GATE(ck_icn_m_usb2ehci, "ck_icn_hsl", 0, GATE_USB2);
+static CLK_STM32_GATE(ck_icn_m_usb2ohci, "ck_icn_hsl", 0, GATE_USB2);
+
+/* USB2PHY2 */
+static CLK_STM32_COMPOSITE(ck_ker_usb2phy2_en, usb2phy2_src, 0,
+			   GATE_USB2PHY2, MUX_USB2PHY2, NO_STM32_DIV);
+
+/* USB3 PCIe COMBOPHY */
+static CLK_STM32_GATE(ck_icn_p_usb3pciephy, "ck_icn_apb4", 0, GATE_USB3PCIEPHY);
+
+static CLK_STM32_COMPOSITE(ck_ker_usb3pciephy, usb3pciphy_src, 0,
+			   GATE_USB3PCIEPHY, MUX_USB3PCIEPHY, NO_STM32_DIV);
+
+/* USB3 DRD */
+static CLK_STM32_GATE(ck_icn_m_usb3dr, "ck_icn_hsl", 0, GATE_USB3DR);
+static CLK_STM32_GATE(ck_ker_usb2phy2, "ck_flexgen_58", 0, GATE_USB3DR);
+
+/* USBTC */
+static CLK_STM32_GATE(ck_icn_p_usbtc, "ck_icn_apb4", 0, GATE_USBTC);
+static CLK_STM32_GATE(ck_ker_usbtc, "ck_flexgen_35", 0, GATE_USBTC);
+
+/* VDEC / VENC */
+static CLK_STM32_GATE(ck_icn_p_vdec, "ck_icn_apb4", 0, GATE_VDEC);
+static CLK_STM32_GATE(ck_icn_p_venc, "ck_icn_apb4", 0, GATE_VENC);
+
+/* VREF */
+static CLK_STM32_GATE(ck_icn_p_vref, "ck_icn_apb3", 0, GATE_VREF);
+
+/* WWDG */
+static CLK_STM32_GATE(ck_icn_p_wwdg1, "ck_icn_apb3", 0, GATE_WWDG1);
+static CLK_STM32_GATE(ck_icn_p_wwdg2, "ck_icn_ls_mcu", 0, GATE_WWDG2);
+
+enum security_clk {
+	SECF_NONE,
+};
+
+static const struct clock_config stm32mp25_clock_cfg[] = {
+	STM32_GATE_CFG(CK_BUS_ETH1,		ck_icn_p_eth1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ETH2,		ck_icn_p_eth2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_PCIE,		ck_icn_p_pcie,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ETHSW,		ck_icn_p_ethsw,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ADC12,		ck_icn_p_adc12,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ADC3,		ck_icn_p_adc3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_CCI,		ck_icn_p_cci,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_CRC,		ck_icn_p_crc,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_MDF1,		ck_icn_p_mdf1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_OSPIIOM,		ck_icn_p_ospiiom,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_HASH,		ck_icn_p_hash,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_CRYP1,		ck_icn_p_cryp1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_CRYP2,		ck_icn_p_cryp2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ADF1,		ck_icn_p_adf1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI8,		ck_icn_p_spi8,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPUART1,		ck_icn_p_lpuart1,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C8,		ck_icn_p_i2c8,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPTIM3,		ck_icn_p_lptim3,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPTIM4,		ck_icn_p_lptim4,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPTIM5,		ck_icn_p_lptim5,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_IWDG5,		ck_icn_p_iwdg5,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_WWDG2,		ck_icn_p_wwdg2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I3C4,		ck_icn_p_i3c4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SDMMC1,		ck_icn_m_sdmmc1,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SDMMC2,		ck_icn_m_sdmmc2,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SDMMC3,		ck_icn_m_sdmmc3,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USB2OHCI,		ck_icn_m_usb2ohci,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USB2EHCI,		ck_icn_m_usb2ehci,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USB3DR,		ck_icn_m_usb3dr,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM2,		ck_icn_p_tim2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM3,		ck_icn_p_tim3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM4,		ck_icn_p_tim4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM5,		ck_icn_p_tim5,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM6,		ck_icn_p_tim6,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM7,		ck_icn_p_tim7,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM10,		ck_icn_p_tim10,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM11,		ck_icn_p_tim11,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM12,		ck_icn_p_tim12,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM13,		ck_icn_p_tim13,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM14,		ck_icn_p_tim14,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPTIM1,		ck_icn_p_lptim1,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LPTIM2,		ck_icn_p_lptim2,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI2,		ck_icn_p_spi2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI3,		ck_icn_p_spi3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPDIFRX,		ck_icn_p_spdifrx,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USART2,		ck_icn_p_usart2,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USART3,		ck_icn_p_usart3,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_UART4,		ck_icn_p_uart4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_UART5,		ck_icn_p_uart5,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C1,		ck_icn_p_i2c1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C2,		ck_icn_p_i2c2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C3,		ck_icn_p_i2c3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C4,		ck_icn_p_i2c4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C5,		ck_icn_p_i2c5,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C6,		ck_icn_p_i2c6,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I2C7,		ck_icn_p_i2c7,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I3C1,		ck_icn_p_i3c1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I3C2,		ck_icn_p_i3c2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_I3C3,		ck_icn_p_i3c3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM1,		ck_icn_p_tim1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM8,		ck_icn_p_tim8,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM15,		ck_icn_p_tim15,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM16,		ck_icn_p_tim16,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM17,		ck_icn_p_tim17,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_TIM20,		ck_icn_p_tim20,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SAI1,		ck_icn_p_sai1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SAI2,		ck_icn_p_sai2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SAI3,		ck_icn_p_sai3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SAI4,		ck_icn_p_sai4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USART1,		ck_icn_p_usart1,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USART6,		ck_icn_p_usart6,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_UART7,		ck_icn_p_uart7,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_UART8,		ck_icn_p_uart8,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_UART9,		ck_icn_p_uart9,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_FDCAN,		ck_icn_p_fdcan,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI1,		ck_icn_p_spi1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI4,		ck_icn_p_spi4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI5,		ck_icn_p_spi5,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI6,		ck_icn_p_spi6,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SPI7,		ck_icn_p_spi7,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_IWDG2,		ck_icn_p_iwdg2,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_IWDG3,		ck_icn_p_iwdg3,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_IWDG4,		ck_icn_p_iwdg4,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_WWDG1,		ck_icn_p_wwdg1,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_VREF,		ck_icn_p_vref,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_SERC,		ck_icn_p_serc,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_HDP,		ck_icn_p_hdp,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_IS2M,		ck_icn_p_is2m,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_DSI,		ck_icn_p_dsi,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LTDC,		ck_icn_p_ltdc,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_CSI,		ck_icn_p_csi,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_DCMIPP,		ck_icn_p_dcmipp,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_LVDS,		ck_icn_p_lvds,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USBTC,		ck_icn_p_usbtc,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_USB3PCIEPHY,	ck_icn_p_usb3pciephy,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_VDEC,		ck_icn_p_vdec,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_VENC,		ck_icn_p_venc,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM2,		ck_ker_tim2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM3,		ck_ker_tim3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM4,		ck_ker_tim4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM5,		ck_ker_tim5,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM6,		ck_ker_tim6,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM7,		ck_ker_tim7,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM10,		ck_ker_tim10,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM11,		ck_ker_tim11,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM12,		ck_ker_tim12,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM13,		ck_ker_tim13,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM14,		ck_ker_tim14,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM1,		ck_ker_tim1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM8,		ck_ker_tim8,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM15,		ck_ker_tim15,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM16,		ck_ker_tim16,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM17,		ck_ker_tim17,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_TIM20,		ck_ker_tim20,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPTIM1,		ck_ker_lptim1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPTIM2,		ck_ker_lptim2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USART2,		ck_ker_usart2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_UART4,		ck_ker_uart4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USART3,		ck_ker_usart3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_UART5,		ck_ker_uart5,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI2,		ck_ker_spi2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI3,		ck_ker_spi3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPDIFRX,		ck_ker_spdifrx,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C1,		ck_ker_i2c1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C2,		ck_ker_i2c2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I3C1,		ck_ker_i3c1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I3C2,		ck_ker_i3c2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C3,		ck_ker_i2c3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C5,		ck_ker_i2c5,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I3C3,		ck_ker_i3c3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C4,		ck_ker_i2c4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C6,		ck_ker_i2c6,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C7,		ck_ker_i2c7,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI1,		ck_ker_spi1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI4,		ck_ker_spi4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI5,		ck_ker_spi5,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI6,		ck_ker_spi6,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI7,		ck_ker_spi7,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USART1,		ck_ker_usart1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USART6,		ck_ker_usart6,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_UART7,		ck_ker_uart7,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_UART8,		ck_ker_uart8,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_UART9,		ck_ker_uart9,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_MDF1,		ck_ker_mdf1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SAI1,		ck_ker_sai1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SAI2,		ck_ker_sai2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SAI3,		ck_ker_sai3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SAI4,		ck_ker_sai4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_FDCAN,		ck_ker_fdcan,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_CSI,		ck_ker_csi,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_CSITXESC,		ck_ker_csitxesc,	SECF_NONE),
+	STM32_GATE_CFG(CK_KER_CSIPHY,		ck_ker_csiphy,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USBTC,		ck_ker_usbtc,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I3C4,		ck_ker_i3c4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SPI8,		ck_ker_spi8,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_I2C8,		ck_ker_i2c8,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPUART1,		ck_ker_lpuart1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPTIM3,		ck_ker_lptim3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPTIM4,		ck_ker_lptim4,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LPTIM5,		ck_ker_lptim5,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ADF1,		ck_ker_adf1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SDMMC1,		ck_ker_sdmmc1,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SDMMC2,		ck_ker_sdmmc2,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_SDMMC3,		ck_ker_sdmmc3,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETH1,		ck_ker_eth1,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH1_STP,		ck_ker_eth1stp,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETHSW,		ck_ker_ethsw,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETH2,		ck_ker_eth2,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH2_STP,		ck_ker_eth2stp,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETH1PTP,		ck_ker_eth1ptp,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETH2PTP,		ck_ker_eth2ptp,		SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_GPU,		ck_icn_m_gpu,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_GPU,		ck_ker_gpu,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_ETHSWREF,		ck_ker_ethswref,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ETHSWACMCFG,	ck_icn_p_ethsw_acm_cfg,	SECF_NONE),
+	STM32_GATE_CFG(CK_BUS_ETHSWACMMSG, ck_icn_p_ethsw_acm_msg,	SECF_NONE),
+	STM32_GATE_CFG(CK_ETH1_MAC,		ck_ker_eth1mac,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH1_TX,		ck_ker_eth1tx,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH1_RX,		ck_ker_eth1rx,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH2_MAC,		ck_ker_eth2mac,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH2_TX,		ck_ker_eth2tx,		SECF_NONE),
+	STM32_GATE_CFG(CK_ETH2_RX,		ck_ker_eth2rx,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_MCO1,		ck_mco1,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_MCO2,		ck_mco2,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_ADC12,	ck_ker_adc12,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_ADC3,	ck_ker_adc3,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SECF_NONE),
+	STM32_GATE_CFG(CK_KER_USB2PHY2,		ck_ker_usb2phy2,	SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_USB3PCIEPHY,	ck_ker_usb3pciephy,	SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_DSIBLANE,	clk_lanebyte,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_DSIPHY,	clk_phy_dsi,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_LVDSPHY,	ck_ker_lvdsphy,		SECF_NONE),
+	STM32_COMPOSITE_CFG(CK_KER_DTS,		ck_ker_dts,		SECF_NONE),
+	STM32_GATE_CFG(CK_KER_LTDC,		ck_ker_ltdc,		SECF_NONE),
+};
+
+#define RESET_MP25(id, _offset, _bit_idx, _set_clr)\
+	[id] = {\
+		.offset		= (_offset),\
+		.bit_idx	= (_bit_idx),\
+		.set_clr	= (_set_clr),\
+	}
+
+static const struct stm32_reset_cfg stm32mp25_reset_cfg[] = {
+	RESET_MP25(TIM1_R,		RCC_TIM1CFGR,		0,	0),
+	RESET_MP25(TIM2_R,		RCC_TIM2CFGR,		0,	0),
+	RESET_MP25(TIM3_R,		RCC_TIM3CFGR,		0,	0),
+	RESET_MP25(TIM4_R,		RCC_TIM4CFGR,		0,	0),
+	RESET_MP25(TIM5_R,		RCC_TIM5CFGR,		0,	0),
+	RESET_MP25(TIM6_R,		RCC_TIM6CFGR,		0,	0),
+	RESET_MP25(TIM7_R,		RCC_TIM7CFGR,		0,	0),
+	RESET_MP25(TIM8_R,		RCC_TIM8CFGR,		0,	0),
+	RESET_MP25(TIM10_R,		RCC_TIM10CFGR,		0,	0),
+	RESET_MP25(TIM11_R,		RCC_TIM11CFGR,		0,	0),
+	RESET_MP25(TIM12_R,		RCC_TIM12CFGR,		0,	0),
+	RESET_MP25(TIM13_R,		RCC_TIM13CFGR,		0,	0),
+	RESET_MP25(TIM14_R,		RCC_TIM14CFGR,		0,	0),
+	RESET_MP25(TIM15_R,		RCC_TIM15CFGR,		0,	0),
+	RESET_MP25(TIM16_R,		RCC_TIM16CFGR,		0,	0),
+	RESET_MP25(TIM17_R,		RCC_TIM17CFGR,		0,	0),
+	RESET_MP25(TIM20_R,		RCC_TIM20CFGR,		0,	0),
+	RESET_MP25(LPTIM1_R,		RCC_LPTIM1CFGR,		0,	0),
+	RESET_MP25(LPTIM2_R,		RCC_LPTIM2CFGR,		0,	0),
+	RESET_MP25(LPTIM3_R,		RCC_LPTIM3CFGR,		0,	0),
+	RESET_MP25(LPTIM4_R,		RCC_LPTIM4CFGR,		0,	0),
+	RESET_MP25(LPTIM5_R,		RCC_LPTIM5CFGR,		0,	0),
+	RESET_MP25(SPI1_R,		RCC_SPI1CFGR,		0,	0),
+	RESET_MP25(SPI2_R,		RCC_SPI2CFGR,		0,	0),
+	RESET_MP25(SPI3_R,		RCC_SPI3CFGR,		0,	0),
+	RESET_MP25(SPI4_R,		RCC_SPI4CFGR,		0,	0),
+	RESET_MP25(SPI5_R,		RCC_SPI5CFGR,		0,	0),
+	RESET_MP25(SPI6_R,		RCC_SPI6CFGR,		0,	0),
+	RESET_MP25(SPI7_R,		RCC_SPI7CFGR,		0,	0),
+	RESET_MP25(SPI8_R,		RCC_SPI8CFGR,		0,	0),
+	RESET_MP25(SPDIFRX_R,		RCC_SPDIFRXCFGR,	0,	0),
+	RESET_MP25(USART1_R,		RCC_USART1CFGR,		0,	0),
+	RESET_MP25(USART2_R,		RCC_USART2CFGR,		0,	0),
+	RESET_MP25(USART3_R,		RCC_USART3CFGR,		0,	0),
+	RESET_MP25(UART4_R,		RCC_UART4CFGR,		0,	0),
+	RESET_MP25(UART5_R,		RCC_UART5CFGR,		0,	0),
+	RESET_MP25(USART6_R,		RCC_USART6CFGR,		0,	0),
+	RESET_MP25(UART7_R,		RCC_UART7CFGR,		0,	0),
+	RESET_MP25(UART8_R,		RCC_UART8CFGR,		0,	0),
+	RESET_MP25(UART9_R,		RCC_UART9CFGR,		0,	0),
+	RESET_MP25(LPUART1_R,		RCC_LPUART1CFGR,	0,	0),
+	RESET_MP25(IS2M_R,		RCC_IS2MCFGR,		0,	0),
+	RESET_MP25(I2C1_R,		RCC_I2C1CFGR,		0,	0),
+	RESET_MP25(I2C2_R,		RCC_I2C2CFGR,		0,	0),
+	RESET_MP25(I2C3_R,		RCC_I2C3CFGR,		0,	0),
+	RESET_MP25(I2C4_R,		RCC_I2C4CFGR,		0,	0),
+	RESET_MP25(I2C5_R,		RCC_I2C5CFGR,		0,	0),
+	RESET_MP25(I2C6_R,		RCC_I2C6CFGR,		0,	0),
+	RESET_MP25(I2C7_R,		RCC_I2C7CFGR,		0,	0),
+	RESET_MP25(I2C8_R,		RCC_I2C8CFGR,		0,	0),
+	RESET_MP25(SAI1_R,		RCC_SAI1CFGR,		0,	0),
+	RESET_MP25(SAI2_R,		RCC_SAI2CFGR,		0,	0),
+	RESET_MP25(SAI3_R,		RCC_SAI3CFGR,		0,	0),
+	RESET_MP25(SAI4_R,		RCC_SAI4CFGR,		0,	0),
+	RESET_MP25(MDF1_R,		RCC_MDF1CFGR,		0,	0),
+	RESET_MP25(MDF2_R,		RCC_ADF1CFGR,		0,	0),
+	RESET_MP25(FDCAN_R,		RCC_FDCANCFGR,		0,	0),
+	RESET_MP25(HDP_R,		RCC_HDPCFGR,		0,	0),
+	RESET_MP25(ADC12_R,		RCC_ADC12CFGR,		0,	0),
+	RESET_MP25(ADC3_R,		RCC_ADC3CFGR,		0,	0),
+	RESET_MP25(ETH1_R,		RCC_ETH1CFGR,		0,	0),
+	RESET_MP25(ETH2_R,		RCC_ETH2CFGR,		0,	0),
+	RESET_MP25(USB2_R,		RCC_USB2CFGR,		0,	0),
+	RESET_MP25(USB2PHY1_R,		RCC_USB2PHY1CFGR,	0,	0),
+	RESET_MP25(USB2PHY2_R,		RCC_USB2PHY2CFGR,	0,	0),
+	RESET_MP25(USB3DR_R,		RCC_USB3DRCFGR,		0,	0),
+	RESET_MP25(USB3PCIEPHY_R,	RCC_USB3PCIEPHYCFGR,	0,	0),
+	RESET_MP25(USBTC_R,		RCC_USBTCCFGR,		0,	0),
+	RESET_MP25(ETHSW_R,		RCC_ETHSWCFGR,		0,	0),
+	RESET_MP25(SDMMC1_R,		RCC_SDMMC1CFGR,		0,	0),
+	RESET_MP25(SDMMC1DLL_R,		RCC_SDMMC1CFGR,		16,	0),
+	RESET_MP25(SDMMC2_R,		RCC_SDMMC2CFGR,		0,	0),
+	RESET_MP25(SDMMC2DLL_R,		RCC_SDMMC2CFGR,		16,	0),
+	RESET_MP25(SDMMC3_R,		RCC_SDMMC3CFGR,		0,	0),
+	RESET_MP25(SDMMC3DLL_R,		RCC_SDMMC3CFGR,		16,	0),
+	RESET_MP25(GPU_R,		RCC_GPUCFGR,		0,	0),
+	RESET_MP25(LTDC_R,		RCC_LTDCCFGR,		0,	0),
+	RESET_MP25(DSI_R,		RCC_DSICFGR,		0,	0),
+	RESET_MP25(LVDS_R,		RCC_LVDSCFGR,		0,	0),
+	RESET_MP25(CSI_R,		RCC_CSICFGR,		0,	0),
+	RESET_MP25(DCMIPP_R,		RCC_DCMIPPCFGR,		0,	0),
+	RESET_MP25(CCI_R,		RCC_CCICFGR,		0,	0),
+	RESET_MP25(VDEC_R,		RCC_VDECCFGR,		0,	0),
+	RESET_MP25(VENC_R,		RCC_VENCCFGR,		0,	0),
+	RESET_MP25(WWDG1_R,		RCC_WWDG1CFGR,		0,	0),
+	RESET_MP25(WWDG2_R,		RCC_WWDG2CFGR,		0,	0),
+	RESET_MP25(VREF_R,		RCC_VREFCFGR,		0,	0),
+	RESET_MP25(DTS_R,		RCC_DTSCFGR,		0,	0),
+	RESET_MP25(CRC_R,		RCC_CRCCFGR,		0,	0),
+	RESET_MP25(SERC_R,		RCC_SERCCFGR,		0,	0),
+	RESET_MP25(OSPIIOM_R,		RCC_OSPIIOMCFGR,	0,	0),
+	RESET_MP25(I3C1_R,		RCC_I3C1CFGR,		0,	0),
+	RESET_MP25(I3C2_R,		RCC_I3C2CFGR,		0,	0),
+	RESET_MP25(I3C3_R,		RCC_I3C3CFGR,		0,	0),
+	RESET_MP25(I3C4_R,		RCC_I3C4CFGR,		0,	0),
+	RESET_MP25(IWDG2_KER_R,		RCC_IWDGC1CFGSETR,	18,	1),
+	RESET_MP25(IWDG4_KER_R,		RCC_IWDGC2CFGSETR,	18,	1),
+	RESET_MP25(RNG_R,		RCC_RNGCFGR,		0,	0),
+	RESET_MP25(PKA_R,		RCC_PKACFGR,		0,	0),
+	RESET_MP25(SAES_R,		RCC_SAESCFGR,		0,	0),
+	RESET_MP25(HASH_R,		RCC_HASHCFGR,		0,	0),
+	RESET_MP25(CRYP1_R,		RCC_CRYP1CFGR,		0,	0),
+	RESET_MP25(CRYP2_R,		RCC_CRYP2CFGR,		0,	0),
+	RESET_MP25(PCIE_R,		RCC_PCIECFGR,		0,	0),
+};
+
+u16 stm32mp25_cpt_gate[GATE_NB];
+
+struct clk_stm32_clock_data stm32mp25_clock_data = {
+	.gate_cpt	= stm32mp25_cpt_gate,
+	.gates		= stm32mp25_gates,
+	.muxes		= stm32mp25_muxes,
+};
+
+struct clk_stm32_reset_data stm32mp25_reset_data = {
+	.reset_lines	= stm32mp25_reset_cfg,
+	.nr_lines	= ARRAY_SIZE(stm32mp25_reset_cfg),
+};
+
+static struct stm32_rcc_match_data stm32mp25_data = {
+	.tab_clocks	= stm32mp25_clock_cfg,
+	.num_clocks	= ARRAY_SIZE(stm32mp25_clock_cfg),
+	.maxbinding	= STM32MP25_LAST_CLK,
+	.clock_data	= &stm32mp25_clock_data,
+	.reset_data	= &stm32mp25_reset_data,
+};
+
+static const struct of_device_id stm32mp25_match_data[] = {
+	{
+		.compatible = "st,stm32mp25-rcc",
+		.data = &stm32mp25_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
+
+static int stm32mp25_rcc_init(struct device *dev)
+{
+	void __iomem *base;
+	int ret;
+
+	base = of_iomap(dev_of_node(dev), 0);
+	if (!base) {
+		dev_err(dev, "%pOFn: unable to map resource", dev_of_node(dev));
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
+
+out:
+	if (ret) {
+		if (base)
+			iounmap(base);
+
+		of_node_put(dev_of_node(dev));
+	}
+
+	return ret;
+}
+
+static int get_clock_deps(struct device *dev)
+{
+	static const char * const clock_deps_name[] = {
+		"hsi", "hse", "msi", "lsi", "lse",
+	};
+	size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
+	struct clk **clk_deps;
+	int i;
+
+	clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
+	if (!clk_deps)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(clock_deps_name); i++) {
+		struct clk *clk;
+
+		clk = of_clk_get_by_name(dev_of_node(dev), clock_deps_name[i]);
+
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EINVAL && PTR_ERR(clk) != -ENOENT)
+				return PTR_ERR(clk);
+		} else {
+			/* Device gets a reference count on the clock */
+			clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
+static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret = get_clock_deps(dev);
+
+	if (!ret)
+		ret = stm32mp25_rcc_init(dev);
+
+	return ret;
+}
+
+static int stm32mp25_rcc_clocks_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child, *np = dev_of_node(dev);
+
+	for_each_available_child_of_node(np, child)
+		of_clk_del_provider(child);
+
+	return 0;
+}
+
+static struct platform_driver stm32mp25_rcc_clocks_driver = {
+	.driver	= {
+		.name = "stm32mp25_rcc",
+		.of_match_table = stm32mp25_match_data,
+	},
+	.probe = stm32mp25_rcc_clocks_probe,
+	.remove = stm32mp25_rcc_clocks_remove,
+};
+
+static int __init stm32mp25_clocks_init(void)
+{
+	return platform_driver_register(&stm32mp25_rcc_clocks_driver);
+}
+
+core_initcall(stm32mp25_clocks_init);
diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index 14c2ee1eebee..3cd3ac7f0343 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -19,6 +19,14 @@ struct stm32_reset_data {
 	struct reset_controller_dev	rcdev;
 	void __iomem			*membase;
 	u32				clear_offset;
+	const struct stm32_reset_cfg	*reset_lines;
+};
+
+struct stm32_reset_line {
+	u32 offset;
+	u8 bit_idx;
+	bool set_clr;
+	u32 clear_offset;
 };
 
 static inline struct stm32_reset_data *
@@ -27,22 +35,44 @@ to_stm32_reset_data(struct reset_controller_dev *rcdev)
 	return container_of(rcdev, struct stm32_reset_data, rcdev);
 }
 
+static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_controller_dev *rcdev,
+							  unsigned long id,
+							  struct stm32_reset_cfg *line)
+{
+	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
+
+	if (!data->reset_lines) {
+		int reg_width = sizeof(u32);
+		int bank = id / (reg_width * BITS_PER_BYTE);
+		int offset = id % (reg_width * BITS_PER_BYTE);
+
+		line->offset = bank * reg_width;
+		line->bit_idx = offset;
+		line->set_clr = (data->clear_offset ? true : false);
+
+		return line;
+	}
+
+	return &data->reset_lines[id];
+}
+
 static int stm32_reset_update(struct reset_controller_dev *rcdev,
 			      unsigned long id, bool assert)
 {
 	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
+	struct stm32_reset_cfg line_reset;
+	const struct stm32_reset_cfg *ptr_line;
+
+	ptr_line = stm32_get_reset_line(rcdev, id, &line_reset);
 
-	if (data->clear_offset) {
+	if (ptr_line->set_clr) {
 		void __iomem *addr;
 
-		addr = data->membase + (bank * reg_width);
+		addr = data->membase + ptr_line->offset;
 		if (!assert)
 			addr += data->clear_offset;
 
-		writel(BIT(offset), addr);
+		writel(BIT(ptr_line->bit_idx), addr);
 
 	} else {
 		unsigned long flags;
@@ -50,14 +80,14 @@ static int stm32_reset_update(struct reset_controller_dev *rcdev,
 
 		spin_lock_irqsave(&data->lock, flags);
 
-		reg = readl(data->membase + (bank * reg_width));
+		reg = readl(data->membase + ptr_line->offset);
 
 		if (assert)
-			reg |= BIT(offset);
+			reg |= BIT(ptr_line->bit_idx);
 		else
-			reg &= ~BIT(offset);
+			reg &= ~BIT(ptr_line->bit_idx);
 
-		writel(reg, data->membase + (bank * reg_width));
+		writel(reg, data->membase + ptr_line->offset);
 
 		spin_unlock_irqrestore(&data->lock, flags);
 	}
@@ -81,14 +111,15 @@ static int stm32_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
 	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
+	struct stm32_reset_cfg line_reset;
+	const struct stm32_reset_cfg *ptr_line;
 	u32 reg;
 
-	reg = readl(data->membase + (bank * reg_width));
+	ptr_line = stm32_get_reset_line(rcdev, id, &line_reset);
+
+	reg = readl(data->membase + ptr_line->offset);
 
-	return !!(reg & BIT(offset));
+	return !!(reg & BIT(ptr_line->bit_idx));
 }
 
 static const struct reset_control_ops stm32_reset_ops = {
@@ -113,6 +144,7 @@ int stm32_rcc_reset_init(struct device *dev, struct clk_stm32_reset_data *data,
 	reset_data->rcdev.ops = &stm32_reset_ops;
 	reset_data->rcdev.of_node = dev_of_node(dev);
 	reset_data->rcdev.nr_resets = data->nr_lines;
+	reset_data->reset_lines = data->reset_lines;
 	reset_data->clear_offset = data->clear_offset;
 
 	return reset_controller_register(&reset_data->rcdev);
diff --git a/drivers/clk/stm32/reset-stm32.h b/drivers/clk/stm32/reset-stm32.h
index 8cf1cc9be480..bd3dce98a817 100644
--- a/drivers/clk/stm32/reset-stm32.h
+++ b/drivers/clk/stm32/reset-stm32.h
@@ -4,8 +4,15 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+struct stm32_reset_cfg {
+	u16 offset;
+	u8 bit_idx;
+	bool set_clr;
+};
+
 struct clk_stm32_reset_data {
 	const struct reset_control_ops *ops;
+	const struct stm32_reset_cfg *reset_lines;
 	unsigned int nr_lines;
 	u32 clear_offset;
 };
diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
new file mode 100644
index 000000000000..b1aca78a0b22
--- /dev/null
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -0,0 +1,4977 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef STM32MP25_RCC_H
+#define STM32MP25_RCC_H
+
+#define RCC_SECCFGR0				0x0
+#define RCC_SECCFGR1				0x4
+#define RCC_SECCFGR2				0x8
+#define RCC_SECCFGR3				0xC
+#define RCC_PRIVCFGR0				0x10
+#define RCC_PRIVCFGR1				0x14
+#define RCC_PRIVCFGR2				0x18
+#define RCC_PRIVCFGR3				0x1C
+#define RCC_RCFGLOCKR0				0x20
+#define RCC_RCFGLOCKR1				0x24
+#define RCC_RCFGLOCKR2				0x28
+#define RCC_RCFGLOCKR3				0x2C
+#define RCC_R0CIDCFGR				0x30
+#define RCC_R0SEMCR				0x34
+#define RCC_R1CIDCFGR				0x38
+#define RCC_R1SEMCR				0x3C
+#define RCC_R2CIDCFGR				0x40
+#define RCC_R2SEMCR				0x44
+#define RCC_R3CIDCFGR				0x48
+#define RCC_R3SEMCR				0x4C
+#define RCC_R4CIDCFGR				0x50
+#define RCC_R4SEMCR				0x54
+#define RCC_R5CIDCFGR				0x58
+#define RCC_R5SEMCR				0x5C
+#define RCC_R6CIDCFGR				0x60
+#define RCC_R6SEMCR				0x64
+#define RCC_R7CIDCFGR				0x68
+#define RCC_R7SEMCR				0x6C
+#define RCC_R8CIDCFGR				0x70
+#define RCC_R8SEMCR				0x74
+#define RCC_R9CIDCFGR				0x78
+#define RCC_R9SEMCR				0x7C
+#define RCC_R10CIDCFGR				0x80
+#define RCC_R10SEMCR				0x84
+#define RCC_R11CIDCFGR				0x88
+#define RCC_R11SEMCR				0x8C
+#define RCC_R12CIDCFGR				0x90
+#define RCC_R12SEMCR				0x94
+#define RCC_R13CIDCFGR				0x98
+#define RCC_R13SEMCR				0x9C
+#define RCC_R14CIDCFGR				0xA0
+#define RCC_R14SEMCR				0xA4
+#define RCC_R15CIDCFGR				0xA8
+#define RCC_R15SEMCR				0xAC
+#define RCC_R16CIDCFGR				0xB0
+#define RCC_R16SEMCR				0xB4
+#define RCC_R17CIDCFGR				0xB8
+#define RCC_R17SEMCR				0xBC
+#define RCC_R18CIDCFGR				0xC0
+#define RCC_R18SEMCR				0xC4
+#define RCC_R19CIDCFGR				0xC8
+#define RCC_R19SEMCR				0xCC
+#define RCC_R20CIDCFGR				0xD0
+#define RCC_R20SEMCR				0xD4
+#define RCC_R21CIDCFGR				0xD8
+#define RCC_R21SEMCR				0xDC
+#define RCC_R22CIDCFGR				0xE0
+#define RCC_R22SEMCR				0xE4
+#define RCC_R23CIDCFGR				0xE8
+#define RCC_R23SEMCR				0xEC
+#define RCC_R24CIDCFGR				0xF0
+#define RCC_R24SEMCR				0xF4
+#define RCC_R25CIDCFGR				0xF8
+#define RCC_R25SEMCR				0xFC
+#define RCC_R26CIDCFGR				0x100
+#define RCC_R26SEMCR				0x104
+#define RCC_R27CIDCFGR				0x108
+#define RCC_R27SEMCR				0x10C
+#define RCC_R28CIDCFGR				0x110
+#define RCC_R28SEMCR				0x114
+#define RCC_R29CIDCFGR				0x118
+#define RCC_R29SEMCR				0x11C
+#define RCC_R30CIDCFGR				0x120
+#define RCC_R30SEMCR				0x124
+#define RCC_R31CIDCFGR				0x128
+#define RCC_R31SEMCR				0x12C
+#define RCC_R32CIDCFGR				0x130
+#define RCC_R32SEMCR				0x134
+#define RCC_R33CIDCFGR				0x138
+#define RCC_R33SEMCR				0x13C
+#define RCC_R34CIDCFGR				0x140
+#define RCC_R34SEMCR				0x144
+#define RCC_R35CIDCFGR				0x148
+#define RCC_R35SEMCR				0x14C
+#define RCC_R36CIDCFGR				0x150
+#define RCC_R36SEMCR				0x154
+#define RCC_R37CIDCFGR				0x158
+#define RCC_R37SEMCR				0x15C
+#define RCC_R38CIDCFGR				0x160
+#define RCC_R38SEMCR				0x164
+#define RCC_R39CIDCFGR				0x168
+#define RCC_R39SEMCR				0x16C
+#define RCC_R40CIDCFGR				0x170
+#define RCC_R40SEMCR				0x174
+#define RCC_R41CIDCFGR				0x178
+#define RCC_R41SEMCR				0x17C
+#define RCC_R42CIDCFGR				0x180
+#define RCC_R42SEMCR				0x184
+#define RCC_R43CIDCFGR				0x188
+#define RCC_R43SEMCR				0x18C
+#define RCC_R44CIDCFGR				0x190
+#define RCC_R44SEMCR				0x194
+#define RCC_R45CIDCFGR				0x198
+#define RCC_R45SEMCR				0x19C
+#define RCC_R46CIDCFGR				0x1A0
+#define RCC_R46SEMCR				0x1A4
+#define RCC_R47CIDCFGR				0x1A8
+#define RCC_R47SEMCR				0x1AC
+#define RCC_R48CIDCFGR				0x1B0
+#define RCC_R48SEMCR				0x1B4
+#define RCC_R49CIDCFGR				0x1B8
+#define RCC_R49SEMCR				0x1BC
+#define RCC_R50CIDCFGR				0x1C0
+#define RCC_R50SEMCR				0x1C4
+#define RCC_R51CIDCFGR				0x1C8
+#define RCC_R51SEMCR				0x1CC
+#define RCC_R52CIDCFGR				0x1D0
+#define RCC_R52SEMCR				0x1D4
+#define RCC_R53CIDCFGR				0x1D8
+#define RCC_R53SEMCR				0x1DC
+#define RCC_R54CIDCFGR				0x1E0
+#define RCC_R54SEMCR				0x1E4
+#define RCC_R55CIDCFGR				0x1E8
+#define RCC_R55SEMCR				0x1EC
+#define RCC_R56CIDCFGR				0x1F0
+#define RCC_R56SEMCR				0x1F4
+#define RCC_R57CIDCFGR				0x1F8
+#define RCC_R57SEMCR				0x1FC
+#define RCC_R58CIDCFGR				0x200
+#define RCC_R58SEMCR				0x204
+#define RCC_R59CIDCFGR				0x208
+#define RCC_R59SEMCR				0x20C
+#define RCC_R60CIDCFGR				0x210
+#define RCC_R60SEMCR				0x214
+#define RCC_R61CIDCFGR				0x218
+#define RCC_R61SEMCR				0x21C
+#define RCC_R62CIDCFGR				0x220
+#define RCC_R62SEMCR				0x224
+#define RCC_R63CIDCFGR				0x228
+#define RCC_R63SEMCR				0x22C
+#define RCC_R64CIDCFGR				0x230
+#define RCC_R64SEMCR				0x234
+#define RCC_R65CIDCFGR				0x238
+#define RCC_R65SEMCR				0x23C
+#define RCC_R66CIDCFGR				0x240
+#define RCC_R66SEMCR				0x244
+#define RCC_R67CIDCFGR				0x248
+#define RCC_R67SEMCR				0x24C
+#define RCC_R68CIDCFGR				0x250
+#define RCC_R68SEMCR				0x254
+#define RCC_R69CIDCFGR				0x258
+#define RCC_R69SEMCR				0x25C
+#define RCC_R70CIDCFGR				0x260
+#define RCC_R70SEMCR				0x264
+#define RCC_R71CIDCFGR				0x268
+#define RCC_R71SEMCR				0x26C
+#define RCC_R72CIDCFGR				0x270
+#define RCC_R72SEMCR				0x274
+#define RCC_R73CIDCFGR				0x278
+#define RCC_R73SEMCR				0x27C
+#define RCC_R74CIDCFGR				0x280
+#define RCC_R74SEMCR				0x284
+#define RCC_R75CIDCFGR				0x288
+#define RCC_R75SEMCR				0x28C
+#define RCC_R76CIDCFGR				0x290
+#define RCC_R76SEMCR				0x294
+#define RCC_R77CIDCFGR				0x298
+#define RCC_R77SEMCR				0x29C
+#define RCC_R78CIDCFGR				0x2A0
+#define RCC_R78SEMCR				0x2A4
+#define RCC_R79CIDCFGR				0x2A8
+#define RCC_R79SEMCR				0x2AC
+#define RCC_R80CIDCFGR				0x2B0
+#define RCC_R80SEMCR				0x2B4
+#define RCC_R81CIDCFGR				0x2B8
+#define RCC_R81SEMCR				0x2BC
+#define RCC_R82CIDCFGR				0x2C0
+#define RCC_R82SEMCR				0x2C4
+#define RCC_R83CIDCFGR				0x2C8
+#define RCC_R83SEMCR				0x2CC
+#define RCC_R84CIDCFGR				0x2D0
+#define RCC_R84SEMCR				0x2D4
+#define RCC_R85CIDCFGR				0x2D8
+#define RCC_R85SEMCR				0x2DC
+#define RCC_R86CIDCFGR				0x2E0
+#define RCC_R86SEMCR				0x2E4
+#define RCC_R87CIDCFGR				0x2E8
+#define RCC_R87SEMCR				0x2EC
+#define RCC_R88CIDCFGR				0x2F0
+#define RCC_R88SEMCR				0x2F4
+#define RCC_R89CIDCFGR				0x2F8
+#define RCC_R89SEMCR				0x2FC
+#define RCC_R90CIDCFGR				0x300
+#define RCC_R90SEMCR				0x304
+#define RCC_R91CIDCFGR				0x308
+#define RCC_R91SEMCR				0x30C
+#define RCC_R92CIDCFGR				0x310
+#define RCC_R92SEMCR				0x314
+#define RCC_R93CIDCFGR				0x318
+#define RCC_R93SEMCR				0x31C
+#define RCC_R94CIDCFGR				0x320
+#define RCC_R94SEMCR				0x324
+#define RCC_R95CIDCFGR				0x328
+#define RCC_R95SEMCR				0x32C
+#define RCC_R96CIDCFGR				0x330
+#define RCC_R96SEMCR				0x334
+#define RCC_R97CIDCFGR				0x338
+#define RCC_R97SEMCR				0x33C
+#define RCC_R98CIDCFGR				0x340
+#define RCC_R98SEMCR				0x344
+#define RCC_R99CIDCFGR				0x348
+#define RCC_R99SEMCR				0x34C
+#define RCC_R100CIDCFGR				0x350
+#define RCC_R100SEMCR				0x354
+#define RCC_R101CIDCFGR				0x358
+#define RCC_R101SEMCR				0x35C
+#define RCC_R102CIDCFGR				0x360
+#define RCC_R102SEMCR				0x364
+#define RCC_R103CIDCFGR				0x368
+#define RCC_R103SEMCR				0x36C
+#define RCC_R104CIDCFGR				0x370
+#define RCC_R104SEMCR				0x374
+#define RCC_R105CIDCFGR				0x378
+#define RCC_R105SEMCR				0x37C
+#define RCC_R106CIDCFGR				0x380
+#define RCC_R106SEMCR				0x384
+#define RCC_R107CIDCFGR				0x388
+#define RCC_R107SEMCR				0x38C
+#define RCC_R108CIDCFGR				0x390
+#define RCC_R108SEMCR				0x394
+#define RCC_R109CIDCFGR				0x398
+#define RCC_R109SEMCR				0x39C
+#define RCC_R110CIDCFGR				0x3A0
+#define RCC_R110SEMCR				0x3A4
+#define RCC_R111CIDCFGR				0x3A8
+#define RCC_R111SEMCR				0x3AC
+#define RCC_R112CIDCFGR				0x3B0
+#define RCC_R112SEMCR				0x3B4
+#define RCC_R113CIDCFGR				0x3B8
+#define RCC_R113SEMCR				0x3BC
+#define RCC_GRSTCSETR				0x400
+#define RCC_C1RSTCSETR				0x404
+#define RCC_C1P1RSTCSETR			0x408
+#define RCC_C2RSTCSETR				0x40C
+#define RCC_HWRSTSCLRR				0x410
+#define RCC_C1HWRSTSCLRR			0x414
+#define RCC_C2HWRSTSCLRR			0x418
+#define RCC_C1BOOTRSTSSETR			0x41C
+#define RCC_C1BOOTRSTSCLRR			0x420
+#define RCC_C2BOOTRSTSSETR			0x424
+#define RCC_C2BOOTRSTSCLRR			0x428
+#define RCC_C1SREQSETR				0x42C
+#define RCC_C1SREQCLRR				0x430
+#define RCC_CPUBOOTCR				0x434
+#define RCC_STBYBOOTCR				0x438
+#define RCC_LEGBOOTCR				0x43C
+#define RCC_BDCR				0x440
+#define RCC_D3DCR				0x444
+#define RCC_D3DSR				0x448
+#define RCC_RDCR				0x44C
+#define RCC_C1MSRDCR				0x450
+#define RCC_PWRLPDLYCR				0x454
+#define RCC_C1CIESETR				0x458
+#define RCC_C1CIFCLRR				0x45C
+#define RCC_C2CIESETR				0x460
+#define RCC_C2CIFCLRR				0x464
+#define RCC_IWDGC1FZSETR			0x468
+#define RCC_IWDGC1FZCLRR			0x46C
+#define RCC_IWDGC1CFGSETR			0x470
+#define RCC_IWDGC1CFGCLRR			0x474
+#define RCC_IWDGC2FZSETR			0x478
+#define RCC_IWDGC2FZCLRR			0x47C
+#define RCC_IWDGC2CFGSETR			0x480
+#define RCC_IWDGC2CFGCLRR			0x484
+#define RCC_IWDGC3CFGSETR			0x488
+#define RCC_IWDGC3CFGCLRR			0x48C
+#define RCC_C3CFGR				0x490
+#define RCC_MCO1CFGR				0x494
+#define RCC_MCO2CFGR				0x498
+#define RCC_OCENSETR				0x49C
+#define RCC_OCENCLRR				0x4A0
+#define RCC_OCRDYR				0x4A4
+#define RCC_HSICFGR				0x4A8
+#define RCC_MSICFGR				0x4AC
+#define RCC_RTCDIVR				0x4B0
+#define RCC_APB1DIVR				0x4B4
+#define RCC_APB2DIVR				0x4B8
+#define RCC_APB3DIVR				0x4BC
+#define RCC_APB4DIVR				0x4C0
+#define RCC_APBDBGDIVR				0x4C4
+#define RCC_TIMG1PRER				0x4C8
+#define RCC_TIMG2PRER				0x4CC
+#define RCC_LSMCUDIVR				0x4D0
+#define RCC_DDRCPCFGR				0x4D4
+#define RCC_DDRCAPBCFGR				0x4D8
+#define RCC_DDRPHYCAPBCFGR			0x4DC
+#define RCC_DDRPHYCCFGR				0x4E0
+#define RCC_DDRCFGR				0x4E4
+#define RCC_DDRITFCFGR				0x4E8
+#define RCC_SYSRAMCFGR				0x4F0
+#define RCC_VDERAMCFGR				0x4F4
+#define RCC_SRAM1CFGR				0x4F8
+#define RCC_SRAM2CFGR				0x4FC
+#define RCC_RETRAMCFGR				0x500
+#define RCC_BKPSRAMCFGR				0x504
+#define RCC_LPSRAM1CFGR				0x508
+#define RCC_LPSRAM2CFGR				0x50C
+#define RCC_LPSRAM3CFGR				0x510
+#define RCC_OSPI1CFGR				0x514
+#define RCC_OSPI2CFGR				0x518
+#define RCC_FMCCFGR				0x51C
+#define RCC_DBGCFGR				0x520
+#define RCC_STM500CFGR				0x524
+#define RCC_ETRCFGR				0x528
+#define RCC_GPIOACFGR				0x52C
+#define RCC_GPIOBCFGR				0x530
+#define RCC_GPIOCCFGR				0x534
+#define RCC_GPIODCFGR				0x538
+#define RCC_GPIOECFGR				0x53C
+#define RCC_GPIOFCFGR				0x540
+#define RCC_GPIOGCFGR				0x544
+#define RCC_GPIOHCFGR				0x548
+#define RCC_GPIOICFGR				0x54C
+#define RCC_GPIOJCFGR				0x550
+#define RCC_GPIOKCFGR				0x554
+#define RCC_GPIOZCFGR				0x558
+#define RCC_HPDMA1CFGR				0x55C
+#define RCC_HPDMA2CFGR				0x560
+#define RCC_HPDMA3CFGR				0x564
+#define RCC_LPDMACFGR				0x568
+#define RCC_HSEMCFGR				0x56C
+#define RCC_IPCC1CFGR				0x570
+#define RCC_IPCC2CFGR				0x574
+#define RCC_RTCCFGR				0x578
+#define RCC_SYSCPU1CFGR				0x580
+#define RCC_BSECCFGR				0x584
+#define RCC_IS2MCFGR				0x58C
+#define RCC_PLL2CFGR1				0x590
+#define RCC_PLL2CFGR2				0x594
+#define RCC_PLL2CFGR3				0x598
+#define RCC_PLL2CFGR4				0x59C
+#define RCC_PLL2CFGR5				0x5A0
+#define RCC_PLL2CFGR6				0x5A8
+#define RCC_PLL2CFGR7				0x5AC
+#define RCC_PLL3CFGR1				0x5B8
+#define RCC_PLL3CFGR2				0x5BC
+#define RCC_PLL3CFGR3				0x5C0
+#define RCC_PLL3CFGR4				0x5C4
+#define RCC_PLL3CFGR5				0x5C8
+#define RCC_PLL3CFGR6				0x5D0
+#define RCC_PLL3CFGR7				0x5D4
+#define RCC_HSIFMONCR				0x5E0
+#define RCC_HSIFVALR				0x5E4
+#define RCC_TIM1CFGR				0x700
+#define RCC_TIM2CFGR				0x704
+#define RCC_TIM3CFGR				0x708
+#define RCC_TIM4CFGR				0x70C
+#define RCC_TIM5CFGR				0x710
+#define RCC_TIM6CFGR				0x714
+#define RCC_TIM7CFGR				0x718
+#define RCC_TIM8CFGR				0x71C
+#define RCC_TIM10CFGR				0x720
+#define RCC_TIM11CFGR				0x724
+#define RCC_TIM12CFGR				0x728
+#define RCC_TIM13CFGR				0x72C
+#define RCC_TIM14CFGR				0x730
+#define RCC_TIM15CFGR				0x734
+#define RCC_TIM16CFGR				0x738
+#define RCC_TIM17CFGR				0x73C
+#define RCC_TIM20CFGR				0x740
+#define RCC_LPTIM1CFGR				0x744
+#define RCC_LPTIM2CFGR				0x748
+#define RCC_LPTIM3CFGR				0x74C
+#define RCC_LPTIM4CFGR				0x750
+#define RCC_LPTIM5CFGR				0x754
+#define RCC_SPI1CFGR				0x758
+#define RCC_SPI2CFGR				0x75C
+#define RCC_SPI3CFGR				0x760
+#define RCC_SPI4CFGR				0x764
+#define RCC_SPI5CFGR				0x768
+#define RCC_SPI6CFGR				0x76C
+#define RCC_SPI7CFGR				0x770
+#define RCC_SPI8CFGR				0x774
+#define RCC_SPDIFRXCFGR				0x778
+#define RCC_USART1CFGR				0x77C
+#define RCC_USART2CFGR				0x780
+#define RCC_USART3CFGR				0x784
+#define RCC_UART4CFGR				0x788
+#define RCC_UART5CFGR				0x78C
+#define RCC_USART6CFGR				0x790
+#define RCC_UART7CFGR				0x794
+#define RCC_UART8CFGR				0x798
+#define RCC_UART9CFGR				0x79C
+#define RCC_LPUART1CFGR				0x7A0
+#define RCC_I2C1CFGR				0x7A4
+#define RCC_I2C2CFGR				0x7A8
+#define RCC_I2C3CFGR				0x7AC
+#define RCC_I2C4CFGR				0x7B0
+#define RCC_I2C5CFGR				0x7B4
+#define RCC_I2C6CFGR				0x7B8
+#define RCC_I2C7CFGR				0x7BC
+#define RCC_I2C8CFGR				0x7C0
+#define RCC_SAI1CFGR				0x7C4
+#define RCC_SAI2CFGR				0x7C8
+#define RCC_SAI3CFGR				0x7CC
+#define RCC_SAI4CFGR				0x7D0
+#define RCC_MDF1CFGR				0x7D8
+#define RCC_ADF1CFGR				0x7DC
+#define RCC_FDCANCFGR				0x7E0
+#define RCC_HDPCFGR				0x7E4
+#define RCC_ADC12CFGR				0x7E8
+#define RCC_ADC3CFGR				0x7EC
+#define RCC_ETH1CFGR				0x7F0
+#define RCC_ETH2CFGR				0x7F4
+#define RCC_USB2CFGR				0x7FC
+#define RCC_USB2PHY1CFGR			0x800
+#define RCC_USB2PHY2CFGR			0x804
+#define RCC_USB3DRCFGR				0x808
+#define RCC_USB3PCIEPHYCFGR			0x80C
+#define RCC_PCIECFGR				0x810
+#define RCC_USBTCCFGR				0x814
+#define RCC_ETHSWCFGR				0x818
+#define RCC_ETHSWACMCFGR			0x81C
+#define RCC_ETHSWACMMSGCFGR			0x820
+#define RCC_STGENCFGR				0x824
+#define RCC_SDMMC1CFGR				0x830
+#define RCC_SDMMC2CFGR				0x834
+#define RCC_SDMMC3CFGR				0x838
+#define RCC_GPUCFGR				0x83C
+#define RCC_LTDCCFGR				0x840
+#define RCC_DSICFGR				0x844
+#define RCC_LVDSCFGR				0x850
+#define RCC_CSICFGR				0x858
+#define RCC_DCMIPPCFGR				0x85C
+#define RCC_CCICFGR				0x860
+#define RCC_VDECCFGR				0x864
+#define RCC_VENCCFGR				0x868
+#define RCC_RNGCFGR				0x870
+#define RCC_PKACFGR				0x874
+#define RCC_SAESCFGR				0x878
+#define RCC_HASHCFGR				0x87C
+#define RCC_CRYP1CFGR				0x880
+#define RCC_CRYP2CFGR				0x884
+#define RCC_IWDG1CFGR				0x888
+#define RCC_IWDG2CFGR				0x88C
+#define RCC_IWDG3CFGR				0x890
+#define RCC_IWDG4CFGR				0x894
+#define RCC_IWDG5CFGR				0x898
+#define RCC_WWDG1CFGR				0x89C
+#define RCC_WWDG2CFGR				0x8A0
+#define RCC_VREFCFGR				0x8A8
+#define RCC_DTSCFGR				0x8AC
+#define RCC_CRCCFGR				0x8B4
+#define RCC_SERCCFGR				0x8B8
+#define RCC_OSPIIOMCFGR				0x8BC
+#define RCC_GICV2MCFGR				0x8C0
+#define RCC_I3C1CFGR				0x8C8
+#define RCC_I3C2CFGR				0x8CC
+#define RCC_I3C3CFGR				0x8D0
+#define RCC_I3C4CFGR				0x8D4
+#define RCC_MUXSELCFGR				0x1000
+#define RCC_XBAR0CFGR				0x1018
+#define RCC_XBAR1CFGR				0x101C
+#define RCC_XBAR2CFGR				0x1020
+#define RCC_XBAR3CFGR				0x1024
+#define RCC_XBAR4CFGR				0x1028
+#define RCC_XBAR5CFGR				0x102C
+#define RCC_XBAR6CFGR				0x1030
+#define RCC_XBAR7CFGR				0x1034
+#define RCC_XBAR8CFGR				0x1038
+#define RCC_XBAR9CFGR				0x103C
+#define RCC_XBAR10CFGR				0x1040
+#define RCC_XBAR11CFGR				0x1044
+#define RCC_XBAR12CFGR				0x1048
+#define RCC_XBAR13CFGR				0x104C
+#define RCC_XBAR14CFGR				0x1050
+#define RCC_XBAR15CFGR				0x1054
+#define RCC_XBAR16CFGR				0x1058
+#define RCC_XBAR17CFGR				0x105C
+#define RCC_XBAR18CFGR				0x1060
+#define RCC_XBAR19CFGR				0x1064
+#define RCC_XBAR20CFGR				0x1068
+#define RCC_XBAR21CFGR				0x106C
+#define RCC_XBAR22CFGR				0x1070
+#define RCC_XBAR23CFGR				0x1074
+#define RCC_XBAR24CFGR				0x1078
+#define RCC_XBAR25CFGR				0x107C
+#define RCC_XBAR26CFGR				0x1080
+#define RCC_XBAR27CFGR				0x1084
+#define RCC_XBAR28CFGR				0x1088
+#define RCC_XBAR29CFGR				0x108C
+#define RCC_XBAR30CFGR				0x1090
+#define RCC_XBAR31CFGR				0x1094
+#define RCC_XBAR32CFGR				0x1098
+#define RCC_XBAR33CFGR				0x109C
+#define RCC_XBAR34CFGR				0x10A0
+#define RCC_XBAR35CFGR				0x10A4
+#define RCC_XBAR36CFGR				0x10A8
+#define RCC_XBAR37CFGR				0x10AC
+#define RCC_XBAR38CFGR				0x10B0
+#define RCC_XBAR39CFGR				0x10B4
+#define RCC_XBAR40CFGR				0x10B8
+#define RCC_XBAR41CFGR				0x10BC
+#define RCC_XBAR42CFGR				0x10C0
+#define RCC_XBAR43CFGR				0x10C4
+#define RCC_XBAR44CFGR				0x10C8
+#define RCC_XBAR45CFGR				0x10CC
+#define RCC_XBAR46CFGR				0x10D0
+#define RCC_XBAR47CFGR				0x10D4
+#define RCC_XBAR48CFGR				0x10D8
+#define RCC_XBAR49CFGR				0x10DC
+#define RCC_XBAR50CFGR				0x10E0
+#define RCC_XBAR51CFGR				0x10E4
+#define RCC_XBAR52CFGR				0x10E8
+#define RCC_XBAR53CFGR				0x10EC
+#define RCC_XBAR54CFGR				0x10F0
+#define RCC_XBAR55CFGR				0x10F4
+#define RCC_XBAR56CFGR				0x10F8
+#define RCC_XBAR57CFGR				0x10FC
+#define RCC_XBAR58CFGR				0x1100
+#define RCC_XBAR59CFGR				0x1104
+#define RCC_XBAR60CFGR				0x1108
+#define RCC_XBAR61CFGR				0x110C
+#define RCC_XBAR62CFGR				0x1110
+#define RCC_XBAR63CFGR				0x1114
+#define RCC_PREDIV0CFGR				0x1118
+#define RCC_PREDIV1CFGR				0x111C
+#define RCC_PREDIV2CFGR				0x1120
+#define RCC_PREDIV3CFGR				0x1124
+#define RCC_PREDIV4CFGR				0x1128
+#define RCC_PREDIV5CFGR				0x112C
+#define RCC_PREDIV6CFGR				0x1130
+#define RCC_PREDIV7CFGR				0x1134
+#define RCC_PREDIV8CFGR				0x1138
+#define RCC_PREDIV9CFGR				0x113C
+#define RCC_PREDIV10CFGR			0x1140
+#define RCC_PREDIV11CFGR			0x1144
+#define RCC_PREDIV12CFGR			0x1148
+#define RCC_PREDIV13CFGR			0x114C
+#define RCC_PREDIV14CFGR			0x1150
+#define RCC_PREDIV15CFGR			0x1154
+#define RCC_PREDIV16CFGR			0x1158
+#define RCC_PREDIV17CFGR			0x115C
+#define RCC_PREDIV18CFGR			0x1160
+#define RCC_PREDIV19CFGR			0x1164
+#define RCC_PREDIV20CFGR			0x1168
+#define RCC_PREDIV21CFGR			0x116C
+#define RCC_PREDIV22CFGR			0x1170
+#define RCC_PREDIV23CFGR			0x1174
+#define RCC_PREDIV24CFGR			0x1178
+#define RCC_PREDIV25CFGR			0x117C
+#define RCC_PREDIV26CFGR			0x1180
+#define RCC_PREDIV27CFGR			0x1184
+#define RCC_PREDIV28CFGR			0x1188
+#define RCC_PREDIV29CFGR			0x118C
+#define RCC_PREDIV30CFGR			0x1190
+#define RCC_PREDIV31CFGR			0x1194
+#define RCC_PREDIV32CFGR			0x1198
+#define RCC_PREDIV33CFGR			0x119C
+#define RCC_PREDIV34CFGR			0x11A0
+#define RCC_PREDIV35CFGR			0x11A4
+#define RCC_PREDIV36CFGR			0x11A8
+#define RCC_PREDIV37CFGR			0x11AC
+#define RCC_PREDIV38CFGR			0x11B0
+#define RCC_PREDIV39CFGR			0x11B4
+#define RCC_PREDIV40CFGR			0x11B8
+#define RCC_PREDIV41CFGR			0x11BC
+#define RCC_PREDIV42CFGR			0x11C0
+#define RCC_PREDIV43CFGR			0x11C4
+#define RCC_PREDIV44CFGR			0x11C8
+#define RCC_PREDIV45CFGR			0x11CC
+#define RCC_PREDIV46CFGR			0x11D0
+#define RCC_PREDIV47CFGR			0x11D4
+#define RCC_PREDIV48CFGR			0x11D8
+#define RCC_PREDIV49CFGR			0x11DC
+#define RCC_PREDIV50CFGR			0x11E0
+#define RCC_PREDIV51CFGR			0x11E4
+#define RCC_PREDIV52CFGR			0x11E8
+#define RCC_PREDIV53CFGR			0x11EC
+#define RCC_PREDIV54CFGR			0x11F0
+#define RCC_PREDIV55CFGR			0x11F4
+#define RCC_PREDIV56CFGR			0x11F8
+#define RCC_PREDIV57CFGR			0x11FC
+#define RCC_PREDIV58CFGR			0x1200
+#define RCC_PREDIV59CFGR			0x1204
+#define RCC_PREDIV60CFGR			0x1208
+#define RCC_PREDIV61CFGR			0x120C
+#define RCC_PREDIV62CFGR			0x1210
+#define RCC_PREDIV63CFGR			0x1214
+#define RCC_PREDIVSR1				0x1218
+#define RCC_PREDIVSR2				0x121C
+#define RCC_FINDIV0CFGR				0x1224
+#define RCC_FINDIV1CFGR				0x1228
+#define RCC_FINDIV2CFGR				0x122C
+#define RCC_FINDIV3CFGR				0x1230
+#define RCC_FINDIV4CFGR				0x1234
+#define RCC_FINDIV5CFGR				0x1238
+#define RCC_FINDIV6CFGR				0x123C
+#define RCC_FINDIV7CFGR				0x1240
+#define RCC_FINDIV8CFGR				0x1244
+#define RCC_FINDIV9CFGR				0x1248
+#define RCC_FINDIV10CFGR			0x124C
+#define RCC_FINDIV11CFGR			0x1250
+#define RCC_FINDIV12CFGR			0x1254
+#define RCC_FINDIV13CFGR			0x1258
+#define RCC_FINDIV14CFGR			0x125C
+#define RCC_FINDIV15CFGR			0x1260
+#define RCC_FINDIV16CFGR			0x1264
+#define RCC_FINDIV17CFGR			0x1268
+#define RCC_FINDIV18CFGR			0x126C
+#define RCC_FINDIV19CFGR			0x1270
+#define RCC_FINDIV20CFGR			0x1274
+#define RCC_FINDIV21CFGR			0x1278
+#define RCC_FINDIV22CFGR			0x127C
+#define RCC_FINDIV23CFGR			0x1280
+#define RCC_FINDIV24CFGR			0x1284
+#define RCC_FINDIV25CFGR			0x1288
+#define RCC_FINDIV26CFGR			0x128C
+#define RCC_FINDIV27CFGR			0x1290
+#define RCC_FINDIV28CFGR			0x1294
+#define RCC_FINDIV29CFGR			0x1298
+#define RCC_FINDIV30CFGR			0x129C
+#define RCC_FINDIV31CFGR			0x12A0
+#define RCC_FINDIV32CFGR			0x12A4
+#define RCC_FINDIV33CFGR			0x12A8
+#define RCC_FINDIV34CFGR			0x12AC
+#define RCC_FINDIV35CFGR			0x12B0
+#define RCC_FINDIV36CFGR			0x12B4
+#define RCC_FINDIV37CFGR			0x12B8
+#define RCC_FINDIV38CFGR			0x12BC
+#define RCC_FINDIV39CFGR			0x12C0
+#define RCC_FINDIV40CFGR			0x12C4
+#define RCC_FINDIV41CFGR			0x12C8
+#define RCC_FINDIV42CFGR			0x12CC
+#define RCC_FINDIV43CFGR			0x12D0
+#define RCC_FINDIV44CFGR			0x12D4
+#define RCC_FINDIV45CFGR			0x12D8
+#define RCC_FINDIV46CFGR			0x12DC
+#define RCC_FINDIV47CFGR			0x12E0
+#define RCC_FINDIV48CFGR			0x12E4
+#define RCC_FINDIV49CFGR			0x12E8
+#define RCC_FINDIV50CFGR			0x12EC
+#define RCC_FINDIV51CFGR			0x12F0
+#define RCC_FINDIV52CFGR			0x12F4
+#define RCC_FINDIV53CFGR			0x12F8
+#define RCC_FINDIV54CFGR			0x12FC
+#define RCC_FINDIV55CFGR			0x1300
+#define RCC_FINDIV56CFGR			0x1304
+#define RCC_FINDIV57CFGR			0x1308
+#define RCC_FINDIV58CFGR			0x130C
+#define RCC_FINDIV59CFGR			0x1310
+#define RCC_FINDIV60CFGR			0x1314
+#define RCC_FINDIV61CFGR			0x1318
+#define RCC_FINDIV62CFGR			0x131C
+#define RCC_FINDIV63CFGR			0x1320
+#define RCC_FINDIVSR1				0x1324
+#define RCC_FINDIVSR2				0x1328
+#define RCC_FCALCOBS0CFGR			0x1340
+#define RCC_FCALCOBS1CFGR			0x1344
+#define RCC_FCALCREFCFGR			0x1348
+#define RCC_FCALCCR1				0x134C
+#define RCC_FCALCCR2				0x1354
+#define RCC_FCALCSR				0x1358
+#define RCC_PLL4CFGR1				0x1360
+#define RCC_PLL4CFGR2				0x1364
+#define RCC_PLL4CFGR3				0x1368
+#define RCC_PLL4CFGR4				0x136C
+#define RCC_PLL4CFGR5				0x1370
+#define RCC_PLL4CFGR6				0x1378
+#define RCC_PLL4CFGR7				0x137C
+#define RCC_PLL5CFGR1				0x1388
+#define RCC_PLL5CFGR2				0x138C
+#define RCC_PLL5CFGR3				0x1390
+#define RCC_PLL5CFGR4				0x1394
+#define RCC_PLL5CFGR5				0x1398
+#define RCC_PLL5CFGR6				0x13A0
+#define RCC_PLL5CFGR7				0x13A4
+#define RCC_PLL6CFGR1				0x13B0
+#define RCC_PLL6CFGR2				0x13B4
+#define RCC_PLL6CFGR3				0x13B8
+#define RCC_PLL6CFGR4				0x13BC
+#define RCC_PLL6CFGR5				0x13C0
+#define RCC_PLL6CFGR6				0x13C8
+#define RCC_PLL6CFGR7				0x13CC
+#define RCC_PLL7CFGR1				0x13D8
+#define RCC_PLL7CFGR2				0x13DC
+#define RCC_PLL7CFGR3				0x13E0
+#define RCC_PLL7CFGR4				0x13E4
+#define RCC_PLL7CFGR5				0x13E8
+#define RCC_PLL7CFGR6				0x13F0
+#define RCC_PLL7CFGR7				0x13F4
+#define RCC_PLL8CFGR1				0x1400
+#define RCC_PLL8CFGR2				0x1404
+#define RCC_PLL8CFGR3				0x1408
+#define RCC_PLL8CFGR4				0x140C
+#define RCC_PLL8CFGR5				0x1410
+#define RCC_PLL8CFGR6				0x1418
+#define RCC_PLL8CFGR7				0x141C
+#define RCC_VERR				0xFFF4
+#define RCC_IDR					0xFFF8
+#define RCC_SIDR				0xFFFC
+
+/* Offset between RCC_MP_xxxENSETR and RCC_MP_xxxENCLRR registers */
+#define RCC_MP_ENCLRR_OFFSET			4
+
+/* RCC_SECCFGR3 register fields */
+#define RCC_SECCFGR3_SEC_MASK			GENMASK(17, 0)
+#define RCC_SECCFGR3_SEC_SHIFT			0
+
+/* RCC_PRIVCFGR3 register fields */
+#define RCC_PRIVCFGR3_PRIV_MASK			GENMASK(17, 0)
+#define RCC_PRIVCFGR3_PRIV_SHIFT		0
+
+/* RCC_RCFGLOCKR3 register fields */
+#define RCC_RCFGLOCKR3_RLOCK_MASK		GENMASK(17, 0)
+#define RCC_RCFGLOCKR3_RLOCK_SHIFT		0
+
+/* RCC_R0CIDCFGR register fields */
+#define RCC_R0CIDCFGR_CFEN			BIT(0)
+#define RCC_R0CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R0CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R0CIDCFGR_SCID_SHIFT		4
+#define RCC_R0CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R0CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R0SEMCR register fields */
+#define RCC_R0SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R0SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R0SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R1CIDCFGR register fields */
+#define RCC_R1CIDCFGR_CFEN			BIT(0)
+#define RCC_R1CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R1CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R1CIDCFGR_SCID_SHIFT		4
+#define RCC_R1CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R1CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R1SEMCR register fields */
+#define RCC_R1SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R1SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R1SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R2CIDCFGR register fields */
+#define RCC_R2CIDCFGR_CFEN			BIT(0)
+#define RCC_R2CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R2CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R2CIDCFGR_SCID_SHIFT		4
+#define RCC_R2CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R2CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R2SEMCR register fields */
+#define RCC_R2SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R2SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R2SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R3CIDCFGR register fields */
+#define RCC_R3CIDCFGR_CFEN			BIT(0)
+#define RCC_R3CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R3CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R3CIDCFGR_SCID_SHIFT		4
+#define RCC_R3CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R3CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R3SEMCR register fields */
+#define RCC_R3SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R3SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R3SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R4CIDCFGR register fields */
+#define RCC_R4CIDCFGR_CFEN			BIT(0)
+#define RCC_R4CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R4CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R4CIDCFGR_SCID_SHIFT		4
+#define RCC_R4CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R4CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R4SEMCR register fields */
+#define RCC_R4SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R4SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R4SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R5CIDCFGR register fields */
+#define RCC_R5CIDCFGR_CFEN			BIT(0)
+#define RCC_R5CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R5CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R5CIDCFGR_SCID_SHIFT		4
+#define RCC_R5CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R5CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R5SEMCR register fields */
+#define RCC_R5SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R5SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R5SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R6CIDCFGR register fields */
+#define RCC_R6CIDCFGR_CFEN			BIT(0)
+#define RCC_R6CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R6CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R6CIDCFGR_SCID_SHIFT		4
+#define RCC_R6CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R6CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R6SEMCR register fields */
+#define RCC_R6SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R6SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R6SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R7CIDCFGR register fields */
+#define RCC_R7CIDCFGR_CFEN			BIT(0)
+#define RCC_R7CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R7CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R7CIDCFGR_SCID_SHIFT		4
+#define RCC_R7CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R7CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R7SEMCR register fields */
+#define RCC_R7SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R7SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R7SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R8CIDCFGR register fields */
+#define RCC_R8CIDCFGR_CFEN			BIT(0)
+#define RCC_R8CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R8CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R8CIDCFGR_SCID_SHIFT		4
+#define RCC_R8CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R8CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R8SEMCR register fields */
+#define RCC_R8SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R8SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R8SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R9CIDCFGR register fields */
+#define RCC_R9CIDCFGR_CFEN			BIT(0)
+#define RCC_R9CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R9CIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_R9CIDCFGR_SCID_SHIFT		4
+#define RCC_R9CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R9CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R9SEMCR register fields */
+#define RCC_R9SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R9SEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_R9SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R10CIDCFGR register fields */
+#define RCC_R10CIDCFGR_CFEN			BIT(0)
+#define RCC_R10CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R10CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R10CIDCFGR_SCID_SHIFT		4
+#define RCC_R10CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R10CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R10SEMCR register fields */
+#define RCC_R10SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R10SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R10SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R11CIDCFGR register fields */
+#define RCC_R11CIDCFGR_CFEN			BIT(0)
+#define RCC_R11CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R11CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R11CIDCFGR_SCID_SHIFT		4
+#define RCC_R11CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R11CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R11SEMCR register fields */
+#define RCC_R11SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R11SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R11SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R12CIDCFGR register fields */
+#define RCC_R12CIDCFGR_CFEN			BIT(0)
+#define RCC_R12CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R12CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R12CIDCFGR_SCID_SHIFT		4
+#define RCC_R12CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R12CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R12SEMCR register fields */
+#define RCC_R12SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R12SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R12SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R13CIDCFGR register fields */
+#define RCC_R13CIDCFGR_CFEN			BIT(0)
+#define RCC_R13CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R13CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R13CIDCFGR_SCID_SHIFT		4
+#define RCC_R13CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R13CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R13SEMCR register fields */
+#define RCC_R13SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R13SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R13SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R14CIDCFGR register fields */
+#define RCC_R14CIDCFGR_CFEN			BIT(0)
+#define RCC_R14CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R14CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R14CIDCFGR_SCID_SHIFT		4
+#define RCC_R14CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R14CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R14SEMCR register fields */
+#define RCC_R14SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R14SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R14SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R15CIDCFGR register fields */
+#define RCC_R15CIDCFGR_CFEN			BIT(0)
+#define RCC_R15CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R15CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R15CIDCFGR_SCID_SHIFT		4
+#define RCC_R15CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R15CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R15SEMCR register fields */
+#define RCC_R15SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R15SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R15SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R16CIDCFGR register fields */
+#define RCC_R16CIDCFGR_CFEN			BIT(0)
+#define RCC_R16CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R16CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R16CIDCFGR_SCID_SHIFT		4
+#define RCC_R16CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R16CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R16SEMCR register fields */
+#define RCC_R16SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R16SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R16SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R17CIDCFGR register fields */
+#define RCC_R17CIDCFGR_CFEN			BIT(0)
+#define RCC_R17CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R17CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R17CIDCFGR_SCID_SHIFT		4
+#define RCC_R17CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R17CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R17SEMCR register fields */
+#define RCC_R17SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R17SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R17SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R18CIDCFGR register fields */
+#define RCC_R18CIDCFGR_CFEN			BIT(0)
+#define RCC_R18CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R18CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R18CIDCFGR_SCID_SHIFT		4
+#define RCC_R18CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R18CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R18SEMCR register fields */
+#define RCC_R18SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R18SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R18SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R19CIDCFGR register fields */
+#define RCC_R19CIDCFGR_CFEN			BIT(0)
+#define RCC_R19CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R19CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R19CIDCFGR_SCID_SHIFT		4
+#define RCC_R19CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R19CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R19SEMCR register fields */
+#define RCC_R19SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R19SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R19SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R20CIDCFGR register fields */
+#define RCC_R20CIDCFGR_CFEN			BIT(0)
+#define RCC_R20CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R20CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R20CIDCFGR_SCID_SHIFT		4
+#define RCC_R20CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R20CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R20SEMCR register fields */
+#define RCC_R20SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R20SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R20SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R21CIDCFGR register fields */
+#define RCC_R21CIDCFGR_CFEN			BIT(0)
+#define RCC_R21CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R21CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R21CIDCFGR_SCID_SHIFT		4
+#define RCC_R21CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R21CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R21SEMCR register fields */
+#define RCC_R21SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R21SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R21SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R22CIDCFGR register fields */
+#define RCC_R22CIDCFGR_CFEN			BIT(0)
+#define RCC_R22CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R22CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R22CIDCFGR_SCID_SHIFT		4
+#define RCC_R22CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R22CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R22SEMCR register fields */
+#define RCC_R22SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R22SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R22SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R23CIDCFGR register fields */
+#define RCC_R23CIDCFGR_CFEN			BIT(0)
+#define RCC_R23CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R23CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R23CIDCFGR_SCID_SHIFT		4
+#define RCC_R23CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R23CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R23SEMCR register fields */
+#define RCC_R23SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R23SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R23SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R24CIDCFGR register fields */
+#define RCC_R24CIDCFGR_CFEN			BIT(0)
+#define RCC_R24CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R24CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R24CIDCFGR_SCID_SHIFT		4
+#define RCC_R24CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R24CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R24SEMCR register fields */
+#define RCC_R24SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R24SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R24SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R25CIDCFGR register fields */
+#define RCC_R25CIDCFGR_CFEN			BIT(0)
+#define RCC_R25CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R25CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R25CIDCFGR_SCID_SHIFT		4
+#define RCC_R25CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R25CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R25SEMCR register fields */
+#define RCC_R25SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R25SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R25SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R26CIDCFGR register fields */
+#define RCC_R26CIDCFGR_CFEN			BIT(0)
+#define RCC_R26CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R26CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R26CIDCFGR_SCID_SHIFT		4
+#define RCC_R26CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R26CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R26SEMCR register fields */
+#define RCC_R26SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R26SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R26SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R27CIDCFGR register fields */
+#define RCC_R27CIDCFGR_CFEN			BIT(0)
+#define RCC_R27CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R27CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R27CIDCFGR_SCID_SHIFT		4
+#define RCC_R27CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R27CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R27SEMCR register fields */
+#define RCC_R27SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R27SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R27SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R28CIDCFGR register fields */
+#define RCC_R28CIDCFGR_CFEN			BIT(0)
+#define RCC_R28CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R28CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R28CIDCFGR_SCID_SHIFT		4
+#define RCC_R28CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R28CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R28SEMCR register fields */
+#define RCC_R28SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R28SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R28SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R29CIDCFGR register fields */
+#define RCC_R29CIDCFGR_CFEN			BIT(0)
+#define RCC_R29CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R29CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R29CIDCFGR_SCID_SHIFT		4
+#define RCC_R29CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R29CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R29SEMCR register fields */
+#define RCC_R29SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R29SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R29SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R30CIDCFGR register fields */
+#define RCC_R30CIDCFGR_CFEN			BIT(0)
+#define RCC_R30CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R30CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R30CIDCFGR_SCID_SHIFT		4
+#define RCC_R30CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R30CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R30SEMCR register fields */
+#define RCC_R30SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R30SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R30SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R31CIDCFGR register fields */
+#define RCC_R31CIDCFGR_CFEN			BIT(0)
+#define RCC_R31CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R31CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R31CIDCFGR_SCID_SHIFT		4
+#define RCC_R31CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R31CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R31SEMCR register fields */
+#define RCC_R31SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R31SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R31SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R32CIDCFGR register fields */
+#define RCC_R32CIDCFGR_CFEN			BIT(0)
+#define RCC_R32CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R32CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R32CIDCFGR_SCID_SHIFT		4
+#define RCC_R32CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R32CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R32SEMCR register fields */
+#define RCC_R32SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R32SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R32SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R33CIDCFGR register fields */
+#define RCC_R33CIDCFGR_CFEN			BIT(0)
+#define RCC_R33CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R33CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R33CIDCFGR_SCID_SHIFT		4
+#define RCC_R33CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R33CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R33SEMCR register fields */
+#define RCC_R33SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R33SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R33SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R34CIDCFGR register fields */
+#define RCC_R34CIDCFGR_CFEN			BIT(0)
+#define RCC_R34CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R34CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R34CIDCFGR_SCID_SHIFT		4
+#define RCC_R34CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R34CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R34SEMCR register fields */
+#define RCC_R34SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R34SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R34SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R35CIDCFGR register fields */
+#define RCC_R35CIDCFGR_CFEN			BIT(0)
+#define RCC_R35CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R35CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R35CIDCFGR_SCID_SHIFT		4
+#define RCC_R35CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R35CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R35SEMCR register fields */
+#define RCC_R35SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R35SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R35SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R36CIDCFGR register fields */
+#define RCC_R36CIDCFGR_CFEN			BIT(0)
+#define RCC_R36CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R36CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R36CIDCFGR_SCID_SHIFT		4
+#define RCC_R36CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R36CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R36SEMCR register fields */
+#define RCC_R36SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R36SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R36SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R37CIDCFGR register fields */
+#define RCC_R37CIDCFGR_CFEN			BIT(0)
+#define RCC_R37CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R37CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R37CIDCFGR_SCID_SHIFT		4
+#define RCC_R37CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R37CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R37SEMCR register fields */
+#define RCC_R37SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R37SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R37SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R38CIDCFGR register fields */
+#define RCC_R38CIDCFGR_CFEN			BIT(0)
+#define RCC_R38CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R38CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R38CIDCFGR_SCID_SHIFT		4
+#define RCC_R38CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R38CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R38SEMCR register fields */
+#define RCC_R38SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R38SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R38SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R39CIDCFGR register fields */
+#define RCC_R39CIDCFGR_CFEN			BIT(0)
+#define RCC_R39CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R39CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R39CIDCFGR_SCID_SHIFT		4
+#define RCC_R39CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R39CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R39SEMCR register fields */
+#define RCC_R39SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R39SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R39SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R40CIDCFGR register fields */
+#define RCC_R40CIDCFGR_CFEN			BIT(0)
+#define RCC_R40CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R40CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R40CIDCFGR_SCID_SHIFT		4
+#define RCC_R40CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R40CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R40SEMCR register fields */
+#define RCC_R40SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R40SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R40SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R41CIDCFGR register fields */
+#define RCC_R41CIDCFGR_CFEN			BIT(0)
+#define RCC_R41CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R41CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R41CIDCFGR_SCID_SHIFT		4
+#define RCC_R41CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R41CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R41SEMCR register fields */
+#define RCC_R41SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R41SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R41SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R42CIDCFGR register fields */
+#define RCC_R42CIDCFGR_CFEN			BIT(0)
+#define RCC_R42CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R42CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R42CIDCFGR_SCID_SHIFT		4
+#define RCC_R42CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R42CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R42SEMCR register fields */
+#define RCC_R42SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R42SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R42SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R43CIDCFGR register fields */
+#define RCC_R43CIDCFGR_CFEN			BIT(0)
+#define RCC_R43CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R43CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R43CIDCFGR_SCID_SHIFT		4
+#define RCC_R43CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R43CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R43SEMCR register fields */
+#define RCC_R43SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R43SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R43SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R44CIDCFGR register fields */
+#define RCC_R44CIDCFGR_CFEN			BIT(0)
+#define RCC_R44CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R44CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R44CIDCFGR_SCID_SHIFT		4
+#define RCC_R44CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R44CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R44SEMCR register fields */
+#define RCC_R44SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R44SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R44SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R45CIDCFGR register fields */
+#define RCC_R45CIDCFGR_CFEN			BIT(0)
+#define RCC_R45CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R45CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R45CIDCFGR_SCID_SHIFT		4
+#define RCC_R45CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R45CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R45SEMCR register fields */
+#define RCC_R45SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R45SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R45SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R46CIDCFGR register fields */
+#define RCC_R46CIDCFGR_CFEN			BIT(0)
+#define RCC_R46CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R46CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R46CIDCFGR_SCID_SHIFT		4
+#define RCC_R46CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R46CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R46SEMCR register fields */
+#define RCC_R46SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R46SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R46SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R47CIDCFGR register fields */
+#define RCC_R47CIDCFGR_CFEN			BIT(0)
+#define RCC_R47CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R47CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R47CIDCFGR_SCID_SHIFT		4
+#define RCC_R47CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R47CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R47SEMCR register fields */
+#define RCC_R47SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R47SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R47SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R48CIDCFGR register fields */
+#define RCC_R48CIDCFGR_CFEN			BIT(0)
+#define RCC_R48CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R48CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R48CIDCFGR_SCID_SHIFT		4
+#define RCC_R48CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R48CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R48SEMCR register fields */
+#define RCC_R48SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R48SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R48SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R49CIDCFGR register fields */
+#define RCC_R49CIDCFGR_CFEN			BIT(0)
+#define RCC_R49CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R49CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R49CIDCFGR_SCID_SHIFT		4
+#define RCC_R49CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R49CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R49SEMCR register fields */
+#define RCC_R49SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R49SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R49SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R50CIDCFGR register fields */
+#define RCC_R50CIDCFGR_CFEN			BIT(0)
+#define RCC_R50CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R50CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R50CIDCFGR_SCID_SHIFT		4
+#define RCC_R50CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R50CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R50SEMCR register fields */
+#define RCC_R50SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R50SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R50SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R51CIDCFGR register fields */
+#define RCC_R51CIDCFGR_CFEN			BIT(0)
+#define RCC_R51CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R51CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R51CIDCFGR_SCID_SHIFT		4
+#define RCC_R51CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R51CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R51SEMCR register fields */
+#define RCC_R51SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R51SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R51SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R52CIDCFGR register fields */
+#define RCC_R52CIDCFGR_CFEN			BIT(0)
+#define RCC_R52CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R52CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R52CIDCFGR_SCID_SHIFT		4
+#define RCC_R52CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R52CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R52SEMCR register fields */
+#define RCC_R52SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R52SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R52SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R53CIDCFGR register fields */
+#define RCC_R53CIDCFGR_CFEN			BIT(0)
+#define RCC_R53CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R53CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R53CIDCFGR_SCID_SHIFT		4
+#define RCC_R53CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R53CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R53SEMCR register fields */
+#define RCC_R53SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R53SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R53SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R54CIDCFGR register fields */
+#define RCC_R54CIDCFGR_CFEN			BIT(0)
+#define RCC_R54CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R54CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R54CIDCFGR_SCID_SHIFT		4
+#define RCC_R54CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R54CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R54SEMCR register fields */
+#define RCC_R54SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R54SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R54SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R55CIDCFGR register fields */
+#define RCC_R55CIDCFGR_CFEN			BIT(0)
+#define RCC_R55CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R55CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R55CIDCFGR_SCID_SHIFT		4
+#define RCC_R55CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R55CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R55SEMCR register fields */
+#define RCC_R55SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R55SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R55SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R56CIDCFGR register fields */
+#define RCC_R56CIDCFGR_CFEN			BIT(0)
+#define RCC_R56CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R56CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R56CIDCFGR_SCID_SHIFT		4
+#define RCC_R56CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R56CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R56SEMCR register fields */
+#define RCC_R56SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R56SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R56SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R57CIDCFGR register fields */
+#define RCC_R57CIDCFGR_CFEN			BIT(0)
+#define RCC_R57CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R57CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R57CIDCFGR_SCID_SHIFT		4
+#define RCC_R57CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R57CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R57SEMCR register fields */
+#define RCC_R57SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R57SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R57SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R58CIDCFGR register fields */
+#define RCC_R58CIDCFGR_CFEN			BIT(0)
+#define RCC_R58CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R58CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R58CIDCFGR_SCID_SHIFT		4
+#define RCC_R58CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R58CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R58SEMCR register fields */
+#define RCC_R58SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R58SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R58SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R59CIDCFGR register fields */
+#define RCC_R59CIDCFGR_CFEN			BIT(0)
+#define RCC_R59CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R59CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R59CIDCFGR_SCID_SHIFT		4
+#define RCC_R59CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R59CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R59SEMCR register fields */
+#define RCC_R59SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R59SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R59SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R60CIDCFGR register fields */
+#define RCC_R60CIDCFGR_CFEN			BIT(0)
+#define RCC_R60CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R60CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R60CIDCFGR_SCID_SHIFT		4
+#define RCC_R60CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R60CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R60SEMCR register fields */
+#define RCC_R60SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R60SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R60SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R61CIDCFGR register fields */
+#define RCC_R61CIDCFGR_CFEN			BIT(0)
+#define RCC_R61CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R61CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R61CIDCFGR_SCID_SHIFT		4
+#define RCC_R61CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R61CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R61SEMCR register fields */
+#define RCC_R61SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R61SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R61SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R62CIDCFGR register fields */
+#define RCC_R62CIDCFGR_CFEN			BIT(0)
+#define RCC_R62CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R62CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R62CIDCFGR_SCID_SHIFT		4
+#define RCC_R62CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R62CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R62SEMCR register fields */
+#define RCC_R62SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R62SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R62SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R63CIDCFGR register fields */
+#define RCC_R63CIDCFGR_CFEN			BIT(0)
+#define RCC_R63CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R63CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R63CIDCFGR_SCID_SHIFT		4
+#define RCC_R63CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R63CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R63SEMCR register fields */
+#define RCC_R63SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R63SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R63SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R64CIDCFGR register fields */
+#define RCC_R64CIDCFGR_CFEN			BIT(0)
+#define RCC_R64CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R64CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R64CIDCFGR_SCID_SHIFT		4
+#define RCC_R64CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R64CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R64SEMCR register fields */
+#define RCC_R64SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R64SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R64SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R65CIDCFGR register fields */
+#define RCC_R65CIDCFGR_CFEN			BIT(0)
+#define RCC_R65CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R65CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R65CIDCFGR_SCID_SHIFT		4
+#define RCC_R65CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R65CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R65SEMCR register fields */
+#define RCC_R65SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R65SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R65SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R66CIDCFGR register fields */
+#define RCC_R66CIDCFGR_CFEN			BIT(0)
+#define RCC_R66CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R66CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R66CIDCFGR_SCID_SHIFT		4
+#define RCC_R66CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R66CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R66SEMCR register fields */
+#define RCC_R66SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R66SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R66SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R67CIDCFGR register fields */
+#define RCC_R67CIDCFGR_CFEN			BIT(0)
+#define RCC_R67CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R67CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R67CIDCFGR_SCID_SHIFT		4
+#define RCC_R67CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R67CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R67SEMCR register fields */
+#define RCC_R67SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R67SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R67SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R68CIDCFGR register fields */
+#define RCC_R68CIDCFGR_CFEN			BIT(0)
+#define RCC_R68CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R68CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R68CIDCFGR_SCID_SHIFT		4
+#define RCC_R68CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R68CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R68SEMCR register fields */
+#define RCC_R68SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R68SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R68SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R69CIDCFGR register fields */
+#define RCC_R69CIDCFGR_CFEN			BIT(0)
+#define RCC_R69CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R69CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R69CIDCFGR_SCID_SHIFT		4
+#define RCC_R69CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R69CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R69SEMCR register fields */
+#define RCC_R69SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R69SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R69SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R70CIDCFGR register fields */
+#define RCC_R70CIDCFGR_CFEN			BIT(0)
+#define RCC_R70CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R70CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R70CIDCFGR_SCID_SHIFT		4
+#define RCC_R70CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R70CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R70SEMCR register fields */
+#define RCC_R70SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R70SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R70SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R71CIDCFGR register fields */
+#define RCC_R71CIDCFGR_CFEN			BIT(0)
+#define RCC_R71CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R71CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R71CIDCFGR_SCID_SHIFT		4
+#define RCC_R71CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R71CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R71SEMCR register fields */
+#define RCC_R71SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R71SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R71SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R72CIDCFGR register fields */
+#define RCC_R72CIDCFGR_CFEN			BIT(0)
+#define RCC_R72CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R72CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R72CIDCFGR_SCID_SHIFT		4
+#define RCC_R72CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R72CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R72SEMCR register fields */
+#define RCC_R72SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R72SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R72SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R73CIDCFGR register fields */
+#define RCC_R73CIDCFGR_CFEN			BIT(0)
+#define RCC_R73CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R73CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R73CIDCFGR_SCID_SHIFT		4
+#define RCC_R73CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R73CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R73SEMCR register fields */
+#define RCC_R73SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R73SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R73SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R74CIDCFGR register fields */
+#define RCC_R74CIDCFGR_CFEN			BIT(0)
+#define RCC_R74CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R74CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R74CIDCFGR_SCID_SHIFT		4
+#define RCC_R74CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R74CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R74SEMCR register fields */
+#define RCC_R74SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R74SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R74SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R75CIDCFGR register fields */
+#define RCC_R75CIDCFGR_CFEN			BIT(0)
+#define RCC_R75CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R75CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R75CIDCFGR_SCID_SHIFT		4
+#define RCC_R75CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R75CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R75SEMCR register fields */
+#define RCC_R75SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R75SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R75SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R76CIDCFGR register fields */
+#define RCC_R76CIDCFGR_CFEN			BIT(0)
+#define RCC_R76CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R76CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R76CIDCFGR_SCID_SHIFT		4
+#define RCC_R76CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R76CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R76SEMCR register fields */
+#define RCC_R76SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R76SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R76SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R77CIDCFGR register fields */
+#define RCC_R77CIDCFGR_CFEN			BIT(0)
+#define RCC_R77CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R77CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R77CIDCFGR_SCID_SHIFT		4
+#define RCC_R77CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R77CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R77SEMCR register fields */
+#define RCC_R77SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R77SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R77SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R78CIDCFGR register fields */
+#define RCC_R78CIDCFGR_CFEN			BIT(0)
+#define RCC_R78CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R78CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R78CIDCFGR_SCID_SHIFT		4
+#define RCC_R78CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R78CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R78SEMCR register fields */
+#define RCC_R78SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R78SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R78SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R79CIDCFGR register fields */
+#define RCC_R79CIDCFGR_CFEN			BIT(0)
+#define RCC_R79CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R79CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R79CIDCFGR_SCID_SHIFT		4
+#define RCC_R79CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R79CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R79SEMCR register fields */
+#define RCC_R79SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R79SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R79SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R80CIDCFGR register fields */
+#define RCC_R80CIDCFGR_CFEN			BIT(0)
+#define RCC_R80CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R80CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R80CIDCFGR_SCID_SHIFT		4
+#define RCC_R80CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R80CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R80SEMCR register fields */
+#define RCC_R80SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R80SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R80SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R81CIDCFGR register fields */
+#define RCC_R81CIDCFGR_CFEN			BIT(0)
+#define RCC_R81CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R81CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R81CIDCFGR_SCID_SHIFT		4
+#define RCC_R81CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R81CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R81SEMCR register fields */
+#define RCC_R81SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R81SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R81SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R82CIDCFGR register fields */
+#define RCC_R82CIDCFGR_CFEN			BIT(0)
+#define RCC_R82CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R82CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R82CIDCFGR_SCID_SHIFT		4
+#define RCC_R82CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R82CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R82SEMCR register fields */
+#define RCC_R82SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R82SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R82SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R83CIDCFGR register fields */
+#define RCC_R83CIDCFGR_CFEN			BIT(0)
+#define RCC_R83CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R83CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R83CIDCFGR_SCID_SHIFT		4
+#define RCC_R83CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R83CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R83SEMCR register fields */
+#define RCC_R83SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R83SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R83SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R84CIDCFGR register fields */
+#define RCC_R84CIDCFGR_CFEN			BIT(0)
+#define RCC_R84CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R84CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R84CIDCFGR_SCID_SHIFT		4
+#define RCC_R84CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R84CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R84SEMCR register fields */
+#define RCC_R84SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R84SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R84SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R85CIDCFGR register fields */
+#define RCC_R85CIDCFGR_CFEN			BIT(0)
+#define RCC_R85CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R85CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R85CIDCFGR_SCID_SHIFT		4
+#define RCC_R85CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R85CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R85SEMCR register fields */
+#define RCC_R85SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R85SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R85SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R86CIDCFGR register fields */
+#define RCC_R86CIDCFGR_CFEN			BIT(0)
+#define RCC_R86CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R86CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R86CIDCFGR_SCID_SHIFT		4
+#define RCC_R86CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R86CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R86SEMCR register fields */
+#define RCC_R86SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R86SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R86SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R87CIDCFGR register fields */
+#define RCC_R87CIDCFGR_CFEN			BIT(0)
+#define RCC_R87CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R87CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R87CIDCFGR_SCID_SHIFT		4
+#define RCC_R87CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R87CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R87SEMCR register fields */
+#define RCC_R87SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R87SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R87SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R88CIDCFGR register fields */
+#define RCC_R88CIDCFGR_CFEN			BIT(0)
+#define RCC_R88CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R88CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R88CIDCFGR_SCID_SHIFT		4
+#define RCC_R88CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R88CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R88SEMCR register fields */
+#define RCC_R88SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R88SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R88SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R89CIDCFGR register fields */
+#define RCC_R89CIDCFGR_CFEN			BIT(0)
+#define RCC_R89CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R89CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R89CIDCFGR_SCID_SHIFT		4
+#define RCC_R89CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R89CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R89SEMCR register fields */
+#define RCC_R89SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R89SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R89SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R90CIDCFGR register fields */
+#define RCC_R90CIDCFGR_CFEN			BIT(0)
+#define RCC_R90CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R90CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R90CIDCFGR_SCID_SHIFT		4
+#define RCC_R90CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R90CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R90SEMCR register fields */
+#define RCC_R90SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R90SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R90SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R91CIDCFGR register fields */
+#define RCC_R91CIDCFGR_CFEN			BIT(0)
+#define RCC_R91CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R91CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R91CIDCFGR_SCID_SHIFT		4
+#define RCC_R91CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R91CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R91SEMCR register fields */
+#define RCC_R91SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R91SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R91SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R92CIDCFGR register fields */
+#define RCC_R92CIDCFGR_CFEN			BIT(0)
+#define RCC_R92CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R92CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R92CIDCFGR_SCID_SHIFT		4
+#define RCC_R92CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R92CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R92SEMCR register fields */
+#define RCC_R92SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R92SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R92SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R93CIDCFGR register fields */
+#define RCC_R93CIDCFGR_CFEN			BIT(0)
+#define RCC_R93CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R93CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R93CIDCFGR_SCID_SHIFT		4
+#define RCC_R93CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R93CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R93SEMCR register fields */
+#define RCC_R93SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R93SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R93SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R94CIDCFGR register fields */
+#define RCC_R94CIDCFGR_CFEN			BIT(0)
+#define RCC_R94CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R94CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R94CIDCFGR_SCID_SHIFT		4
+#define RCC_R94CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R94CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R94SEMCR register fields */
+#define RCC_R94SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R94SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R94SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R95CIDCFGR register fields */
+#define RCC_R95CIDCFGR_CFEN			BIT(0)
+#define RCC_R95CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R95CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R95CIDCFGR_SCID_SHIFT		4
+#define RCC_R95CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R95CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R95SEMCR register fields */
+#define RCC_R95SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R95SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R95SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R96CIDCFGR register fields */
+#define RCC_R96CIDCFGR_CFEN			BIT(0)
+#define RCC_R96CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R96CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R96CIDCFGR_SCID_SHIFT		4
+#define RCC_R96CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R96CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R96SEMCR register fields */
+#define RCC_R96SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R96SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R96SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R97CIDCFGR register fields */
+#define RCC_R97CIDCFGR_CFEN			BIT(0)
+#define RCC_R97CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R97CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R97CIDCFGR_SCID_SHIFT		4
+#define RCC_R97CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R97CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R97SEMCR register fields */
+#define RCC_R97SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R97SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R97SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R98CIDCFGR register fields */
+#define RCC_R98CIDCFGR_CFEN			BIT(0)
+#define RCC_R98CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R98CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R98CIDCFGR_SCID_SHIFT		4
+#define RCC_R98CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R98CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R98SEMCR register fields */
+#define RCC_R98SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R98SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R98SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R99CIDCFGR register fields */
+#define RCC_R99CIDCFGR_CFEN			BIT(0)
+#define RCC_R99CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R99CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R99CIDCFGR_SCID_SHIFT		4
+#define RCC_R99CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R99CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R99SEMCR register fields */
+#define RCC_R99SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R99SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R99SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R100CIDCFGR register fields */
+#define RCC_R100CIDCFGR_CFEN			BIT(0)
+#define RCC_R100CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R100CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R100CIDCFGR_SCID_SHIFT		4
+#define RCC_R100CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R100CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R100SEMCR register fields */
+#define RCC_R100SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R100SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R100SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R101CIDCFGR register fields */
+#define RCC_R101CIDCFGR_CFEN			BIT(0)
+#define RCC_R101CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R101CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R101CIDCFGR_SCID_SHIFT		4
+#define RCC_R101CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R101CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R101SEMCR register fields */
+#define RCC_R101SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R101SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R101SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R102CIDCFGR register fields */
+#define RCC_R102CIDCFGR_CFEN			BIT(0)
+#define RCC_R102CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R102CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R102CIDCFGR_SCID_SHIFT		4
+#define RCC_R102CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R102CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R102SEMCR register fields */
+#define RCC_R102SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R102SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R102SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R103CIDCFGR register fields */
+#define RCC_R103CIDCFGR_CFEN			BIT(0)
+#define RCC_R103CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R103CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R103CIDCFGR_SCID_SHIFT		4
+#define RCC_R103CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R103CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R103SEMCR register fields */
+#define RCC_R103SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R103SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R103SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R104CIDCFGR register fields */
+#define RCC_R104CIDCFGR_CFEN			BIT(0)
+#define RCC_R104CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R104CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R104CIDCFGR_SCID_SHIFT		4
+#define RCC_R104CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R104CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R104SEMCR register fields */
+#define RCC_R104SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R104SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R104SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R105CIDCFGR register fields */
+#define RCC_R105CIDCFGR_CFEN			BIT(0)
+#define RCC_R105CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R105CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R105CIDCFGR_SCID_SHIFT		4
+#define RCC_R105CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R105CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R105SEMCR register fields */
+#define RCC_R105SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R105SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R105SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R106CIDCFGR register fields */
+#define RCC_R106CIDCFGR_CFEN			BIT(0)
+#define RCC_R106CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R106CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R106CIDCFGR_SCID_SHIFT		4
+#define RCC_R106CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R106CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R106SEMCR register fields */
+#define RCC_R106SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R106SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R106SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R107CIDCFGR register fields */
+#define RCC_R107CIDCFGR_CFEN			BIT(0)
+#define RCC_R107CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R107CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R107CIDCFGR_SCID_SHIFT		4
+#define RCC_R107CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R107CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R107SEMCR register fields */
+#define RCC_R107SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R107SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R107SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R108CIDCFGR register fields */
+#define RCC_R108CIDCFGR_CFEN			BIT(0)
+#define RCC_R108CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R108CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R108CIDCFGR_SCID_SHIFT		4
+#define RCC_R108CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R108CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R108SEMCR register fields */
+#define RCC_R108SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R108SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R108SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R109CIDCFGR register fields */
+#define RCC_R109CIDCFGR_CFEN			BIT(0)
+#define RCC_R109CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R109CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R109CIDCFGR_SCID_SHIFT		4
+#define RCC_R109CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R109CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R109SEMCR register fields */
+#define RCC_R109SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R109SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R109SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R110CIDCFGR register fields */
+#define RCC_R110CIDCFGR_CFEN			BIT(0)
+#define RCC_R110CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R110CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R110CIDCFGR_SCID_SHIFT		4
+#define RCC_R110CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R110CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R110SEMCR register fields */
+#define RCC_R110SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R110SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R110SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R111CIDCFGR register fields */
+#define RCC_R111CIDCFGR_CFEN			BIT(0)
+#define RCC_R111CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R111CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R111CIDCFGR_SCID_SHIFT		4
+#define RCC_R111CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R111CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R111SEMCR register fields */
+#define RCC_R111SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R111SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R111SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R112CIDCFGR register fields */
+#define RCC_R112CIDCFGR_CFEN			BIT(0)
+#define RCC_R112CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R112CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R112CIDCFGR_SCID_SHIFT		4
+#define RCC_R112CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R112CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R112SEMCR register fields */
+#define RCC_R112SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R112SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R112SEMCR_SEMCID_SHIFT		4
+
+/* RCC_R113CIDCFGR register fields */
+#define RCC_R113CIDCFGR_CFEN			BIT(0)
+#define RCC_R113CIDCFGR_SEM_EN			BIT(1)
+#define RCC_R113CIDCFGR_SCID_MASK		GENMASK(6, 4)
+#define RCC_R113CIDCFGR_SCID_SHIFT		4
+#define RCC_R113CIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_R113CIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_R113SEMCR register fields */
+#define RCC_R113SEMCR_SEM_MUTEX			BIT(0)
+#define RCC_R113SEMCR_SEMCID_MASK		GENMASK(6, 4)
+#define RCC_R113SEMCR_SEMCID_SHIFT		4
+
+/* RCC_RxCIDCFGR register fields */
+#define RCC_RxCIDCFGR_CFEN			BIT(0)
+#define RCC_RxCIDCFGR_SEM_EN			BIT(1)
+#define RCC_RxCIDCFGR_SCID_MASK			GENMASK(6, 4)
+#define RCC_RxCIDCFGR_SCID_SHIFT		4
+#define RCC_RxCIDCFGR_SEMWLC_MASK		GENMASK(23, 16)
+#define RCC_RxCIDCFGR_SEMWLC_SHIFT		16
+
+/* RCC_RxSEMCR register fields */
+#define RCC_RxSEMCR_SEM_MUTEX			BIT(0)
+#define RCC_RxSEMCR_SEMCID_MASK			GENMASK(6, 4)
+#define RCC_RxSEMCR_SEMCID_SHIFT		4
+
+/* RCC_GRSTCSETR register fields */
+#define RCC_GRSTCSETR_SYSRST			BIT(0)
+
+/* RCC_C1RSTCSETR register fields */
+#define RCC_C1RSTCSETR_C1RST			BIT(0)
+
+/* RCC_C1P1RSTCSETR register fields */
+#define RCC_C1P1RSTCSETR_C1P1PORRST		BIT(0)
+#define RCC_C1P1RSTCSETR_C1P1RST		BIT(1)
+
+/* RCC_C2RSTCSETR register fields */
+#define RCC_C2RSTCSETR_C2RST			BIT(0)
+
+/* RCC_CxRSTCSETR register fields */
+#define RCC_CxRSTCSETR_CxRST			BIT(0)
+
+/* RCC_HWRSTSCLRR register fields */
+#define RCC_HWRSTSCLRR_PORRSTF			BIT(0)
+#define RCC_HWRSTSCLRR_BORRSTF			BIT(1)
+#define RCC_HWRSTSCLRR_PADRSTF			BIT(2)
+#define RCC_HWRSTSCLRR_HCSSRSTF			BIT(3)
+#define RCC_HWRSTSCLRR_VCORERSTF		BIT(4)
+#define RCC_HWRSTSCLRR_SYSC1RSTF		BIT(5)
+#define RCC_HWRSTSCLRR_SYSC2RSTF		BIT(6)
+#define RCC_HWRSTSCLRR_IWDG1SYSRSTF		BIT(7)
+#define RCC_HWRSTSCLRR_IWDG2SYSRSTF		BIT(8)
+#define RCC_HWRSTSCLRR_IWDG3SYSRSTF		BIT(9)
+#define RCC_HWRSTSCLRR_IWDG4SYSRSTF		BIT(10)
+#define RCC_HWRSTSCLRR_IWDG5SYSRSTF		BIT(11)
+#define RCC_HWRSTSCLRR_RETCRCERRRSTF		BIT(12)
+#define RCC_HWRSTSCLRR_RETECCFAILCRCRSTF	BIT(13)
+#define RCC_HWRSTSCLRR_RETECCFAILRESTRSTF	BIT(14)
+
+/* RCC_C1HWRSTSCLRR register fields */
+#define RCC_C1HWRSTSCLRR_VCPURSTF		BIT(0)
+#define RCC_C1HWRSTSCLRR_C1RSTF			BIT(1)
+#define RCC_C1HWRSTSCLRR_C1P1RSTF		BIT(2)
+
+/* RCC_C2HWRSTSCLRR register fields */
+#define RCC_C2HWRSTSCLRR_C2RSTF			BIT(0)
+
+/* RCC_C1BOOTRSTSSETR register fields */
+#define RCC_C1BOOTRSTSSETR_PORRSTF		BIT(0)
+#define RCC_C1BOOTRSTSSETR_BORRSTF		BIT(1)
+#define RCC_C1BOOTRSTSSETR_PADRSTF		BIT(2)
+#define RCC_C1BOOTRSTSSETR_HCSSRSTF		BIT(3)
+#define RCC_C1BOOTRSTSSETR_VCORERSTF		BIT(4)
+#define RCC_C1BOOTRSTSSETR_VCPURSTF		BIT(5)
+#define RCC_C1BOOTRSTSSETR_SYSC1RSTF		BIT(6)
+#define RCC_C1BOOTRSTSSETR_SYSC2RSTF		BIT(7)
+#define RCC_C1BOOTRSTSSETR_IWDG1SYSRSTF		BIT(8)
+#define RCC_C1BOOTRSTSSETR_IWDG2SYSRSTF		BIT(9)
+#define RCC_C1BOOTRSTSSETR_IWDG3SYSRSTF		BIT(10)
+#define RCC_C1BOOTRSTSSETR_IWDG4SYSRSTF		BIT(11)
+#define RCC_C1BOOTRSTSSETR_IWDG5SYSRSTF		BIT(12)
+#define RCC_C1BOOTRSTSSETR_C1RSTF		BIT(13)
+#define RCC_C1BOOTRSTSSETR_C1P1RSTF		BIT(16)
+#define RCC_C1BOOTRSTSSETR_RETCRCERRRSTF	BIT(17)
+#define RCC_C1BOOTRSTSSETR_RETECCFAILCRCRSTF	BIT(18)
+#define RCC_C1BOOTRSTSSETR_RETECCFAILRESTRSTF	BIT(19)
+#define RCC_C1BOOTRSTSSETR_STBYC1RSTF		BIT(20)
+#define RCC_C1BOOTRSTSSETR_D1STBYRSTF		BIT(22)
+#define RCC_C1BOOTRSTSSETR_D2STBYRSTF		BIT(23)
+
+/* RCC_C1BOOTRSTSCLRR register fields */
+#define RCC_C1BOOTRSTSCLRR_PORRSTF		BIT(0)
+#define RCC_C1BOOTRSTSCLRR_BORRSTF		BIT(1)
+#define RCC_C1BOOTRSTSCLRR_PADRSTF		BIT(2)
+#define RCC_C1BOOTRSTSCLRR_HCSSRSTF		BIT(3)
+#define RCC_C1BOOTRSTSCLRR_VCORERSTF		BIT(4)
+#define RCC_C1BOOTRSTSCLRR_VCPURSTF		BIT(5)
+#define RCC_C1BOOTRSTSCLRR_SYSC1RSTF		BIT(6)
+#define RCC_C1BOOTRSTSCLRR_SYSC2RSTF		BIT(7)
+#define RCC_C1BOOTRSTSCLRR_IWDG1SYSRSTF		BIT(8)
+#define RCC_C1BOOTRSTSCLRR_IWDG2SYSRSTF		BIT(9)
+#define RCC_C1BOOTRSTSCLRR_IWDG3SYSRSTF		BIT(10)
+#define RCC_C1BOOTRSTSCLRR_IWDG4SYSRSTF		BIT(11)
+#define RCC_C1BOOTRSTSCLRR_IWDG5SYSRSTF		BIT(12)
+#define RCC_C1BOOTRSTSCLRR_C1RSTF		BIT(13)
+#define RCC_C1BOOTRSTSCLRR_C1P1RSTF		BIT(16)
+#define RCC_C1BOOTRSTSCLRR_RETCRCERRRSTF	BIT(17)
+#define RCC_C1BOOTRSTSCLRR_RETECCFAILCRCRSTF	BIT(18)
+#define RCC_C1BOOTRSTSCLRR_RETECCFAILRESTRSTF	BIT(19)
+#define RCC_C1BOOTRSTSCLRR_STBYC1RSTF		BIT(20)
+#define RCC_C1BOOTRSTSCLRR_D1STBYRSTF		BIT(22)
+#define RCC_C1BOOTRSTSCLRR_D2STBYRSTF		BIT(23)
+
+/* RCC_C2BOOTRSTSSETR register fields */
+#define RCC_C2BOOTRSTSSETR_PORRSTF		BIT(0)
+#define RCC_C2BOOTRSTSSETR_BORRSTF		BIT(1)
+#define RCC_C2BOOTRSTSSETR_PADRSTF		BIT(2)
+#define RCC_C2BOOTRSTSSETR_HCSSRSTF		BIT(3)
+#define RCC_C2BOOTRSTSSETR_VCORERSTF		BIT(4)
+#define RCC_C2BOOTRSTSSETR_SYSC1RSTF		BIT(6)
+#define RCC_C2BOOTRSTSSETR_SYSC2RSTF		BIT(7)
+#define RCC_C2BOOTRSTSSETR_IWDG1SYSRSTF		BIT(8)
+#define RCC_C2BOOTRSTSSETR_IWDG2SYSRSTF		BIT(9)
+#define RCC_C2BOOTRSTSSETR_IWDG3SYSRSTF		BIT(10)
+#define RCC_C2BOOTRSTSSETR_IWDG4SYSRSTF		BIT(11)
+#define RCC_C2BOOTRSTSSETR_IWDG5SYSRSTF		BIT(12)
+#define RCC_C2BOOTRSTSSETR_C2RSTF		BIT(14)
+#define RCC_C2BOOTRSTSSETR_RETCRCERRRSTF	BIT(17)
+#define RCC_C2BOOTRSTSSETR_RETECCFAILCRCRSTF	BIT(18)
+#define RCC_C2BOOTRSTSSETR_RETECCFAILRESTRSTF	BIT(19)
+#define RCC_C2BOOTRSTSSETR_STBYC2RSTF		BIT(21)
+#define RCC_C2BOOTRSTSSETR_D2STBYRSTF		BIT(23)
+
+/* RCC_C2BOOTRSTSCLRR register fields */
+#define RCC_C2BOOTRSTSCLRR_PORRSTF		BIT(0)
+#define RCC_C2BOOTRSTSCLRR_BORRSTF		BIT(1)
+#define RCC_C2BOOTRSTSCLRR_PADRSTF		BIT(2)
+#define RCC_C2BOOTRSTSCLRR_HCSSRSTF		BIT(3)
+#define RCC_C2BOOTRSTSCLRR_VCORERSTF		BIT(4)
+#define RCC_C2BOOTRSTSCLRR_SYSC1RSTF		BIT(6)
+#define RCC_C2BOOTRSTSCLRR_SYSC2RSTF		BIT(7)
+#define RCC_C2BOOTRSTSCLRR_IWDG1SYSRSTF		BIT(8)
+#define RCC_C2BOOTRSTSCLRR_IWDG2SYSRSTF		BIT(9)
+#define RCC_C2BOOTRSTSCLRR_IWDG3SYSRSTF		BIT(10)
+#define RCC_C2BOOTRSTSCLRR_IWDG4SYSRSTF		BIT(11)
+#define RCC_C2BOOTRSTSCLRR_IWDG5SYSRSTF		BIT(12)
+#define RCC_C2BOOTRSTSCLRR_C2RSTF		BIT(14)
+#define RCC_C2BOOTRSTSCLRR_RETCRCERRRSTF	BIT(17)
+#define RCC_C2BOOTRSTSCLRR_RETECCFAILCRCRSTF	BIT(18)
+#define RCC_C2BOOTRSTSCLRR_RETECCFAILRESTRSTF	BIT(19)
+#define RCC_C2BOOTRSTSCLRR_STBYC2RSTF		BIT(21)
+#define RCC_C2BOOTRSTSCLRR_D2STBYRSTF		BIT(23)
+
+/* RCC_C1SREQSETR register fields */
+#define RCC_C1SREQSETR_STPREQ_P0		BIT(0)
+#define RCC_C1SREQSETR_STPREQ_P1		BIT(1)
+#define RCC_C1SREQSETR_ESLPREQ			BIT(16)
+
+/* RCC_C1SREQCLRR register fields */
+#define RCC_C1SREQCLRR_STPREQ_P0		BIT(0)
+#define RCC_C1SREQCLRR_STPREQ_P1		BIT(1)
+#define RCC_C1SREQCLRR_ESLPREQ			BIT(16)
+
+/* RCC_CPUBOOTCR register fields */
+#define RCC_CPUBOOTCR_BOOT_CPU2			BIT(0)
+#define RCC_CPUBOOTCR_BOOT_CPU1			BIT(1)
+
+/* RCC_STBYBOOTCR register fields */
+#define RCC_STBYBOOTCR_CPU_BEN_SEL		BIT(1)
+#define RCC_STBYBOOTCR_COLD_CPU2		BIT(2)
+#define RCC_STBYBOOTCR_CPU2_HW_BEN		BIT(4)
+#define RCC_STBYBOOTCR_CPU1_HW_BEN		BIT(5)
+#define RCC_STBYBOOTCR_RET_CRCERR_RSTEN		BIT(8)
+
+/* RCC_LEGBOOTCR register fields */
+#define RCC_LEGBOOTCR_LEGACY_BEN		BIT(0)
+
+/* RCC_BDCR register fields */
+#define RCC_BDCR_LSEON				BIT(0)
+#define RCC_BDCR_LSEBYP				BIT(1)
+#define RCC_BDCR_LSERDY				BIT(2)
+#define RCC_BDCR_LSEDIGBYP			BIT(3)
+#define RCC_BDCR_LSEDRV_MASK			GENMASK(5, 4)
+#define RCC_BDCR_LSEDRV_SHIFT			4
+#define RCC_BDCR_LSECSSON			BIT(6)
+#define RCC_BDCR_LSEGFON			BIT(7)
+#define RCC_BDCR_LSECSSD			BIT(8)
+#define RCC_BDCR_LSION				BIT(9)
+#define RCC_BDCR_LSIRDY				BIT(10)
+#define RCC_BDCR_RTCSRC_MASK			GENMASK(17, 16)
+#define RCC_BDCR_RTCSRC_SHIFT			16
+#define RCC_BDCR_RTCCKEN			BIT(20)
+#define RCC_BDCR_MSIFREQSEL			BIT(24)
+#define RCC_BDCR_C3SYSTICKSEL			BIT(25)
+#define RCC_BDCR_VSWRST				BIT(31)
+#define RCC_BDCR_LSEBYP_BIT			1
+#define RCC_BDCR_LSEDIGBYP_BIT			3
+#define RCC_BDCR_LSECSSON_BIT			6
+#define RCC_BDCR_LSERDY_BIT			2
+#define RCC_BDCR_LSIRDY_BIT			10
+
+#define RCC_BDCR_LSEDRV_SHIFT			4
+#define RCC_BDCR_LSEDRV_WIDTH			2
+
+/* RCC_D3DCR register fields */
+#define RCC_D3DCR_MSION				BIT(0)
+#define RCC_D3DCR_MSIKERON			BIT(1)
+#define RCC_D3DCR_MSIRDY			BIT(2)
+#define RCC_D3DCR_D3PERCKSEL_MASK		GENMASK(17, 16)
+#define RCC_D3DCR_D3PERCKSEL_SHIFT		16
+#define RCC_D3DCR_MSIRDY_BIT			2
+
+/* RCC_D3DSR register fields */
+#define RCC_D3DSR_D3STATE_MASK			GENMASK(1, 0)
+#define RCC_D3DSR_D3STATE_SHIFT			0
+
+/* RCC_RDCR register fields */
+#define RCC_RDCR_MRD_MASK			GENMASK(20, 16)
+#define RCC_RDCR_MRD_SHIFT			16
+#define RCC_RDCR_EADLY_MASK			GENMASK(27, 24)
+#define RCC_RDCR_EADLY_SHIFT			24
+
+/* RCC_C1MSRDCR register fields */
+#define RCC_C1MSRDCR_C1MSRD_MASK		GENMASK(4, 0)
+#define RCC_C1MSRDCR_C1MSRD_SHIFT		0
+#define RCC_C1MSRDCR_C1MSRST			BIT(8)
+
+/* RCC_PWRLPDLYCR register fields */
+#define RCC_PWRLPDLYCR_PWRLP_DLY_MASK		GENMASK(21, 0)
+#define RCC_PWRLPDLYCR_PWRLP_DLY_SHIFT		0
+#define RCC_PWRLPDLYCR_CPU2TMPSKP		BIT(24)
+
+/* RCC_C1CIESETR register fields */
+#define RCC_C1CIESETR_LSIRDYIE			BIT(0)
+#define RCC_C1CIESETR_LSERDYIE			BIT(1)
+#define RCC_C1CIESETR_HSIRDYIE			BIT(2)
+#define RCC_C1CIESETR_HSERDYIE			BIT(3)
+#define RCC_C1CIESETR_MSIRDYIE			BIT(4)
+#define RCC_C1CIESETR_PLL1RDYIE			BIT(5)
+#define RCC_C1CIESETR_PLL2RDYIE			BIT(6)
+#define RCC_C1CIESETR_PLL3RDYIE			BIT(7)
+#define RCC_C1CIESETR_PLL4RDYIE			BIT(8)
+#define RCC_C1CIESETR_PLL5RDYIE			BIT(9)
+#define RCC_C1CIESETR_PLL6RDYIE			BIT(10)
+#define RCC_C1CIESETR_PLL7RDYIE			BIT(11)
+#define RCC_C1CIESETR_PLL8RDYIE			BIT(12)
+#define RCC_C1CIESETR_LSECSSIE			BIT(16)
+#define RCC_C1CIESETR_WKUPIE			BIT(20)
+
+/* RCC_C1CIFCLRR register fields */
+#define RCC_C1CIFCLRR_LSIRDYF			BIT(0)
+#define RCC_C1CIFCLRR_LSERDYF			BIT(1)
+#define RCC_C1CIFCLRR_HSIRDYF			BIT(2)
+#define RCC_C1CIFCLRR_HSERDYF			BIT(3)
+#define RCC_C1CIFCLRR_MSIRDYF			BIT(4)
+#define RCC_C1CIFCLRR_PLL1RDYF			BIT(5)
+#define RCC_C1CIFCLRR_PLL2RDYF			BIT(6)
+#define RCC_C1CIFCLRR_PLL3RDYF			BIT(7)
+#define RCC_C1CIFCLRR_PLL4RDYF			BIT(8)
+#define RCC_C1CIFCLRR_PLL5RDYF			BIT(9)
+#define RCC_C1CIFCLRR_PLL6RDYF			BIT(10)
+#define RCC_C1CIFCLRR_PLL7RDYF			BIT(11)
+#define RCC_C1CIFCLRR_PLL8RDYF			BIT(12)
+#define RCC_C1CIFCLRR_LSECSSF			BIT(16)
+#define RCC_C1CIFCLRR_WKUPF			BIT(20)
+
+/* RCC_C2CIESETR register fields */
+#define RCC_C2CIESETR_LSIRDYIE			BIT(0)
+#define RCC_C2CIESETR_LSERDYIE			BIT(1)
+#define RCC_C2CIESETR_HSIRDYIE			BIT(2)
+#define RCC_C2CIESETR_HSERDYIE			BIT(3)
+#define RCC_C2CIESETR_MSIRDYIE			BIT(4)
+#define RCC_C2CIESETR_PLL1RDYIE			BIT(5)
+#define RCC_C2CIESETR_PLL2RDYIE			BIT(6)
+#define RCC_C2CIESETR_PLL3RDYIE			BIT(7)
+#define RCC_C2CIESETR_PLL4RDYIE			BIT(8)
+#define RCC_C2CIESETR_PLL5RDYIE			BIT(9)
+#define RCC_C2CIESETR_PLL6RDYIE			BIT(10)
+#define RCC_C2CIESETR_PLL7RDYIE			BIT(11)
+#define RCC_C2CIESETR_PLL8RDYIE			BIT(12)
+#define RCC_C2CIESETR_LSECSSIE			BIT(16)
+#define RCC_C2CIESETR_WKUPIE			BIT(20)
+
+/* RCC_C2CIFCLRR register fields */
+#define RCC_C2CIFCLRR_LSIRDYF			BIT(0)
+#define RCC_C2CIFCLRR_LSERDYF			BIT(1)
+#define RCC_C2CIFCLRR_HSIRDYF			BIT(2)
+#define RCC_C2CIFCLRR_HSERDYF			BIT(3)
+#define RCC_C2CIFCLRR_MSIRDYF			BIT(4)
+#define RCC_C2CIFCLRR_PLL1RDYF			BIT(5)
+#define RCC_C2CIFCLRR_PLL2RDYF			BIT(6)
+#define RCC_C2CIFCLRR_PLL3RDYF			BIT(7)
+#define RCC_C2CIFCLRR_PLL4RDYF			BIT(8)
+#define RCC_C2CIFCLRR_PLL5RDYF			BIT(9)
+#define RCC_C2CIFCLRR_PLL6RDYF			BIT(10)
+#define RCC_C2CIFCLRR_PLL7RDYF			BIT(11)
+#define RCC_C2CIFCLRR_PLL8RDYF			BIT(12)
+#define RCC_C2CIFCLRR_LSECSSF			BIT(16)
+#define RCC_C2CIFCLRR_WKUPF			BIT(20)
+
+/* RCC_CxCIESETR register fields */
+#define RCC_CxCIESETR_LSIRDYIE			BIT(0)
+#define RCC_CxCIESETR_LSERDYIE			BIT(1)
+#define RCC_CxCIESETR_HSIRDYIE			BIT(2)
+#define RCC_CxCIESETR_HSERDYIE			BIT(3)
+#define RCC_CxCIESETR_MSIRDYIE			BIT(4)
+#define RCC_CxCIESETR_SHSIRDYIE			BIT(5)
+#define RCC_CxCIESETR_PLL1RDYIE			BIT(6)
+#define RCC_CxCIESETR_PLL2RDYIE			BIT(7)
+#define RCC_CxCIESETR_PLL3RDYIE			BIT(8)
+#define RCC_CxCIESETR_PLL4RDYIE			BIT(9)
+#define RCC_CxCIESETR_PLL5RDYIE			BIT(10)
+#define RCC_CxCIESETR_PLL6RDYIE			BIT(11)
+#define RCC_CxCIESETR_PLL7RDYIE			BIT(12)
+#define RCC_CxCIESETR_PLL8RDYIE			BIT(13)
+#define RCC_CxCIESETR_LSECSSIE			BIT(16)
+#define RCC_CxCIESETR_WKUPIE			BIT(20)
+
+/* RCC_CxCIFCLRR register fields */
+#define RCC_CxCIFCLRR_LSIRDYF			BIT(0)
+#define RCC_CxCIFCLRR_LSERDYF			BIT(1)
+#define RCC_CxCIFCLRR_HSIRDYF			BIT(2)
+#define RCC_CxCIFCLRR_HSERDYF			BIT(3)
+#define RCC_CxCIFCLRR_MSIRDYF			BIT(4)
+#define RCC_CxCIFCLRR_SHSIRDYF			BIT(5)
+#define RCC_CxCIFCLRR_PLL1RDYF			BIT(6)
+#define RCC_CxCIFCLRR_PLL2RDYF			BIT(7)
+#define RCC_CxCIFCLRR_PLL3RDYF			BIT(8)
+#define RCC_CxCIFCLRR_PLL4RDYF			BIT(9)
+#define RCC_CxCIFCLRR_PLL5RDYF			BIT(10)
+#define RCC_CxCIFCLRR_PLL6RDYF			BIT(11)
+#define RCC_CxCIFCLRR_PLL7RDYF			BIT(12)
+#define RCC_CxCIFCLRR_PLL8RDYF			BIT(13)
+#define RCC_CxCIFCLRR_LSECSSF			BIT(16)
+#define RCC_CxCIFCLRR_WKUPF			BIT(20)
+
+/* RCC_IWDGC1FZSETR register fields */
+#define RCC_IWDGC1FZSETR_FZ_IWDG1		BIT(0)
+#define RCC_IWDGC1FZSETR_FZ_IWDG2		BIT(1)
+
+/* RCC_IWDGC1FZCLRR register fields */
+#define RCC_IWDGC1FZCLRR_FZ_IWDG1		BIT(0)
+#define RCC_IWDGC1FZCLRR_FZ_IWDG2		BIT(1)
+
+/* RCC_IWDGC1CFGSETR register fields */
+#define RCC_IWDGC1CFGSETR_IWDG1_SYSRSTEN	BIT(0)
+#define RCC_IWDGC1CFGSETR_IWDG2_SYSRSTEN	BIT(2)
+#define RCC_IWDGC1CFGSETR_IWDG2_KERRST		BIT(18)
+
+/* RCC_IWDGC1CFGCLRR register fields */
+#define RCC_IWDGC1CFGCLRR_IWDG1_SYSRSTEN	BIT(0)
+#define RCC_IWDGC1CFGCLRR_IWDG2_SYSRSTEN	BIT(2)
+#define RCC_IWDGC1CFGCLRR_IWDG2_KERRST		BIT(18)
+
+/* RCC_IWDGC2FZSETR register fields */
+#define RCC_IWDGC2FZSETR_FZ_IWDG3		BIT(0)
+#define RCC_IWDGC2FZSETR_FZ_IWDG4		BIT(1)
+
+/* RCC_IWDGC2FZCLRR register fields */
+#define RCC_IWDGC2FZCLRR_FZ_IWDG3		BIT(0)
+#define RCC_IWDGC2FZCLRR_FZ_IWDG4		BIT(1)
+
+/* RCC_IWDGC2CFGSETR register fields */
+#define RCC_IWDGC2CFGSETR_IWDG3_SYSRSTEN	BIT(0)
+#define RCC_IWDGC2CFGSETR_IWDG4_SYSRSTEN	BIT(2)
+#define RCC_IWDGC2CFGSETR_IWDG4_KERRST		BIT(18)
+
+/* RCC_IWDGC2CFGCLRR register fields */
+#define RCC_IWDGC2CFGCLRR_IWDG3_SYSRSTEN	BIT(0)
+#define RCC_IWDGC2CFGCLRR_IWDG4_SYSRSTEN	BIT(2)
+#define RCC_IWDGC2CFGCLRR_IWDG4_KERRST		BIT(18)
+
+/* RCC_IWDGC3CFGSETR register fields */
+#define RCC_IWDGC3CFGSETR_IWDG5_SYSRSTEN	BIT(0)
+
+/* RCC_IWDGC3CFGCLRR register fields */
+#define RCC_IWDGC3CFGCLRR_IWDG5_SYSRSTEN	BIT(0)
+
+/* RCC_C3CFGR register fields */
+#define RCC_C3CFGR_C3RST			BIT(0)
+#define RCC_C3CFGR_C3EN				BIT(1)
+#define RCC_C3CFGR_C3LPEN			BIT(2)
+#define RCC_C3CFGR_C3AMEN			BIT(3)
+#define RCC_C3CFGR_LPTIM3C3EN			BIT(16)
+#define RCC_C3CFGR_LPTIM4C3EN			BIT(17)
+#define RCC_C3CFGR_LPTIM5C3EN			BIT(18)
+#define RCC_C3CFGR_SPI8C3EN			BIT(19)
+#define RCC_C3CFGR_LPUART1C3EN			BIT(20)
+#define RCC_C3CFGR_I2C8C3EN			BIT(21)
+#define RCC_C3CFGR_ADF1C3EN			BIT(23)
+#define RCC_C3CFGR_GPIOZC3EN			BIT(24)
+#define RCC_C3CFGR_LPDMAC3EN			BIT(25)
+#define RCC_C3CFGR_RTCC3EN			BIT(26)
+#define RCC_C3CFGR_I3C4C3EN			BIT(27)
+
+/* RCC_MCO1CFGR register fields */
+#define RCC_MCO1CFGR_MCO1SEL			BIT(0)
+#define RCC_MCO1CFGR_MCO1ON			BIT(8)
+
+/* RCC_MCO2CFGR register fields */
+#define RCC_MCO2CFGR_MCO2SEL			BIT(0)
+#define RCC_MCO2CFGR_MCO2ON			BIT(8)
+
+/* RCC_MCOxCFGR register fields */
+#define RCC_MCOxCFGR_MCOxSEL			BIT(0)
+#define RCC_MCOxCFGR_MCOxON			BIT(8)
+
+/* RCC_OCENSETR register fields */
+#define RCC_OCENSETR_HSION			BIT(0)
+#define RCC_OCENSETR_HSIKERON			BIT(1)
+#define RCC_OCENSETR_HSEDIV2ON			BIT(5)
+#define RCC_OCENSETR_HSEDIV2BYP			BIT(6)
+#define RCC_OCENSETR_HSEDIGBYP			BIT(7)
+#define RCC_OCENSETR_HSEON			BIT(8)
+#define RCC_OCENSETR_HSEKERON			BIT(9)
+#define RCC_OCENSETR_HSEBYP			BIT(10)
+#define RCC_OCENSETR_HSECSSON			BIT(11)
+
+/* RCC_OCENCLRR register fields */
+#define RCC_OCENCLRR_HSION			BIT(0)
+#define RCC_OCENCLRR_HSIKERON			BIT(1)
+#define RCC_OCENCLRR_HSEDIV2ON			BIT(5)
+#define RCC_OCENCLRR_HSEDIV2BYP			BIT(6)
+#define RCC_OCENCLRR_HSEDIGBYP			BIT(7)
+#define RCC_OCENCLRR_HSEON			BIT(8)
+#define RCC_OCENCLRR_HSEKERON			BIT(9)
+#define RCC_OCENCLRR_HSEBYP			BIT(10)
+
+/* RCC_OCRDYR register fields */
+#define RCC_OCRDYR_HSIRDY			BIT(0)
+#define RCC_OCRDYR_HSERDY			BIT(8)
+#define RCC_OCRDYR_CKREST			BIT(25)
+
+#define RCC_OCRDYR_HSIRDY_BIT			0
+#define RCC_OCRDYR_HSERDY_BIT			8
+
+/* RCC_HSICFGR register fields */
+#define RCC_HSICFGR_HSITRIM_MASK		GENMASK(14, 8)
+#define RCC_HSICFGR_HSITRIM_SHIFT		8
+#define RCC_HSICFGR_HSICAL_MASK			GENMASK(24, 16)
+#define RCC_HSICFGR_HSICAL_SHIFT		16
+
+/* osc_data register fields */
+#define RCC_MSICFGR_MSITRIM_MASK		GENMASK(12, 8)
+#define RCC_MSICFGR_MSITRIM_SHIFT		8
+#define RCC_MSICFGR_MSICAL_MASK			GENMASK(23, 16)
+#define RCC_MSICFGR_MSICAL_SHIFT		16
+
+/* RCC_RTCDIVR register fields */
+#define RCC_RTCDIVR_RTCDIV_MASK			GENMASK(5, 0)
+#define RCC_RTCDIVR_RTCDIV_SHIFT		0
+
+/* RCC_APB1DIVR register fields */
+#define RCC_APB1DIVR_APB1DIV_MASK		GENMASK(2, 0)
+#define RCC_APB1DIVR_APB1DIV_SHIFT		0
+#define RCC_APB1DIVR_APB1DIVRDY			BIT(31)
+
+/* RCC_APB2DIVR register fields */
+#define RCC_APB2DIVR_APB2DIV_MASK		GENMASK(2, 0)
+#define RCC_APB2DIVR_APB2DIV_SHIFT		0
+#define RCC_APB2DIVR_APB2DIVRDY			BIT(31)
+
+/* RCC_APB3DIVR register fields */
+#define RCC_APB3DIVR_APB3DIV_MASK		GENMASK(2, 0)
+#define RCC_APB3DIVR_APB3DIV_SHIFT		0
+#define RCC_APB3DIVR_APB3DIVRDY			BIT(31)
+
+/* RCC_APB4DIVR register fields */
+#define RCC_APB4DIVR_APB4DIV_MASK		GENMASK(2, 0)
+#define RCC_APB4DIVR_APB4DIV_SHIFT		0
+#define RCC_APB4DIVR_APB4DIVRDY			BIT(31)
+
+/* RCC_APBDBGDIVR register fields */
+#define RCC_APBDBGDIVR_APBDBGDIV_MASK		GENMASK(2, 0)
+#define RCC_APBDBGDIVR_APBDBGDIV_SHIFT		0
+#define RCC_APBDBGDIVR_APBDBGDIVRDY		BIT(31)
+
+/* RCC_APBxDIVR register fields */
+#define RCC_APBxDIVR_APBxDIV_MASK		GENMASK(2, 0)
+#define RCC_APBxDIVR_APBxDIV_SHIFT		0
+#define RCC_APBxDIVR_APBxDIVRDY			BIT(31)
+
+/* RCC_TIMG1PRER register fields */
+#define RCC_TIMG1PRER_TIMG1PRE			BIT(0)
+#define RCC_TIMG1PRER_TIMG1PRERDY		BIT(31)
+
+/* RCC_TIMG2PRER register fields */
+#define RCC_TIMG2PRER_TIMG2PRE			BIT(0)
+#define RCC_TIMG2PRER_TIMG2PRERDY		BIT(31)
+
+/* RCC_TIMGxPRER register fields */
+#define RCC_TIMGxPRER_TIMGxPRE			BIT(0)
+#define RCC_TIMGxPRER_TIMGxPRERDY		BIT(31)
+
+/* RCC_LSMCUDIVR register fields */
+#define RCC_LSMCUDIVR_LSMCUDIV			BIT(0)
+#define RCC_LSMCUDIVR_LSMCUDIVRDY		BIT(31)
+
+/* RCC_DDRCPCFGR register fields */
+#define RCC_DDRCPCFGR_DDRCPRST			BIT(0)
+#define RCC_DDRCPCFGR_DDRCPEN			BIT(1)
+#define RCC_DDRCPCFGR_DDRCPLPEN			BIT(2)
+
+/* RCC_DDRCAPBCFGR register fields */
+#define RCC_DDRCAPBCFGR_DDRCAPBRST		BIT(0)
+#define RCC_DDRCAPBCFGR_DDRCAPBEN		BIT(1)
+#define RCC_DDRCAPBCFGR_DDRCAPBLPEN		BIT(2)
+
+/* RCC_DDRPHYCAPBCFGR register fields */
+#define RCC_DDRPHYCAPBCFGR_DDRPHYCAPBRST	BIT(0)
+#define RCC_DDRPHYCAPBCFGR_DDRPHYCAPBEN		BIT(1)
+#define RCC_DDRPHYCAPBCFGR_DDRPHYCAPBLPEN	BIT(2)
+
+/* RCC_DDRPHYCCFGR register fields */
+#define RCC_DDRPHYCCFGR_DDRPHYCEN		BIT(1)
+
+/* RCC_DDRCFGR register fields */
+#define RCC_DDRCFGR_DDRCFGRST			BIT(0)
+#define RCC_DDRCFGR_DDRCFGEN			BIT(1)
+#define RCC_DDRCFGR_DDRCFGLPEN			BIT(2)
+
+/* RCC_DDRITFCFGR register fields */
+#define RCC_DDRITFCFGR_DDRRST			BIT(0)
+#define RCC_DDRITFCFGR_DDRCKMOD_MASK		GENMASK(5, 4)
+#define RCC_DDRITFCFGR_DDRCKMOD_SHIFT		4
+#define RCC_DDRITFCFGR_DDRSHR			BIT(8)
+#define RCC_DDRITFCFGR_DDRPHYDLP		BIT(16)
+
+/* RCC_SYSRAMCFGR register fields */
+#define RCC_SYSRAMCFGR_SYSRAMEN			BIT(1)
+#define RCC_SYSRAMCFGR_SYSRAMLPEN		BIT(2)
+
+/* RCC_VDERAMCFGR register fields */
+#define RCC_VDERAMCFGR_VDERAMEN			BIT(1)
+#define RCC_VDERAMCFGR_VDERAMLPEN		BIT(2)
+
+/* RCC_SRAM1CFGR register fields */
+#define RCC_SRAM1CFGR_SRAM1EN			BIT(1)
+#define RCC_SRAM1CFGR_SRAM1LPEN			BIT(2)
+
+/* RCC_SRAM2CFGR register fields */
+#define RCC_SRAM2CFGR_SRAM2EN			BIT(1)
+#define RCC_SRAM2CFGR_SRAM2LPEN			BIT(2)
+
+/* RCC_RETRAMCFGR register fields */
+#define RCC_RETRAMCFGR_RETRAMEN			BIT(1)
+#define RCC_RETRAMCFGR_RETRAMLPEN		BIT(2)
+
+/* RCC_BKPSRAMCFGR register fields */
+#define RCC_BKPSRAMCFGR_BKPSRAMEN		BIT(1)
+#define RCC_BKPSRAMCFGR_BKPSRAMLPEN		BIT(2)
+
+/* RCC_LPSRAM1CFGR register fields */
+#define RCC_LPSRAM1CFGR_LPSRAM1EN		BIT(1)
+#define RCC_LPSRAM1CFGR_LPSRAM1LPEN		BIT(2)
+#define RCC_LPSRAM1CFGR_LPSRAM1AMEN		BIT(3)
+
+/* RCC_LPSRAM2CFGR register fields */
+#define RCC_LPSRAM2CFGR_LPSRAM2EN		BIT(1)
+#define RCC_LPSRAM2CFGR_LPSRAM2LPEN		BIT(2)
+#define RCC_LPSRAM2CFGR_LPSRAM2AMEN		BIT(3)
+
+/* RCC_LPSRAM3CFGR register fields */
+#define RCC_LPSRAM3CFGR_LPSRAM3EN		BIT(1)
+#define RCC_LPSRAM3CFGR_LPSRAM3LPEN		BIT(2)
+#define RCC_LPSRAM3CFGR_LPSRAM3AMEN		BIT(3)
+
+/* RCC_OSPI1CFGR register fields */
+#define RCC_OSPI1CFGR_OSPI1RST			BIT(0)
+#define RCC_OSPI1CFGR_OSPI1EN			BIT(1)
+#define RCC_OSPI1CFGR_OSPI1LPEN			BIT(2)
+#define RCC_OSPI1CFGR_OTFDEC1RST		BIT(8)
+#define RCC_OSPI1CFGR_OSPI1DLLRST		BIT(16)
+
+/* RCC_OSPI2CFGR register fields */
+#define RCC_OSPI2CFGR_OSPI2RST			BIT(0)
+#define RCC_OSPI2CFGR_OSPI2EN			BIT(1)
+#define RCC_OSPI2CFGR_OSPI2LPEN			BIT(2)
+#define RCC_OSPI2CFGR_OTFDEC2RST		BIT(8)
+#define RCC_OSPI2CFGR_OSPI2DLLRST		BIT(16)
+
+/* RCC_OSPIxCFGR register fields */
+#define RCC_OSPIxCFGR_OSPIxRST			BIT(0)
+#define RCC_OSPIxCFGR_OSPIxEN			BIT(1)
+#define RCC_OSPIxCFGR_OSPIxLPEN			BIT(2)
+#define RCC_OSPIxCFGR_OTFDECxRST		BIT(8)
+#define RCC_OSPIxCFGR_OSPIxDLLRST		BIT(16)
+
+/* RCC_FMCCFGR register fields */
+#define RCC_FMCCFGR_FMCRST			BIT(0)
+#define RCC_FMCCFGR_FMCEN			BIT(1)
+#define RCC_FMCCFGR_FMCLPEN			BIT(2)
+
+/* RCC_DBGCFGR register fields */
+#define RCC_DBGCFGR_DBGEN			BIT(8)
+#define RCC_DBGCFGR_TRACEEN			BIT(9)
+#define RCC_DBGCFGR_DBGRST			BIT(12)
+
+/* RCC_STM500CFGR register fields */
+#define RCC_STM500CFGR_STM500EN			BIT(1)
+#define RCC_STM500CFGR_STM500LPEN		BIT(2)
+
+/* RCC_ETRCFGR register fields */
+#define RCC_ETRCFGR_ETREN			BIT(1)
+#define RCC_ETRCFGR_ETRLPEN			BIT(2)
+
+/* RCC_GPIOACFGR register fields */
+#define RCC_GPIOACFGR_GPIOARST			BIT(0)
+#define RCC_GPIOACFGR_GPIOAEN			BIT(1)
+#define RCC_GPIOACFGR_GPIOALPEN			BIT(2)
+
+/* RCC_GPIOBCFGR register fields */
+#define RCC_GPIOBCFGR_GPIOBRST			BIT(0)
+#define RCC_GPIOBCFGR_GPIOBEN			BIT(1)
+#define RCC_GPIOBCFGR_GPIOBLPEN			BIT(2)
+
+/* RCC_GPIOCCFGR register fields */
+#define RCC_GPIOCCFGR_GPIOCRST			BIT(0)
+#define RCC_GPIOCCFGR_GPIOCEN			BIT(1)
+#define RCC_GPIOCCFGR_GPIOCLPEN			BIT(2)
+
+/* RCC_GPIODCFGR register fields */
+#define RCC_GPIODCFGR_GPIODRST			BIT(0)
+#define RCC_GPIODCFGR_GPIODEN			BIT(1)
+#define RCC_GPIODCFGR_GPIODLPEN			BIT(2)
+
+/* RCC_GPIOECFGR register fields */
+#define RCC_GPIOECFGR_GPIOERST			BIT(0)
+#define RCC_GPIOECFGR_GPIOEEN			BIT(1)
+#define RCC_GPIOECFGR_GPIOELPEN			BIT(2)
+
+/* RCC_GPIOFCFGR register fields */
+#define RCC_GPIOFCFGR_GPIOFRST			BIT(0)
+#define RCC_GPIOFCFGR_GPIOFEN			BIT(1)
+#define RCC_GPIOFCFGR_GPIOFLPEN			BIT(2)
+
+/* RCC_GPIOGCFGR register fields */
+#define RCC_GPIOGCFGR_GPIOGRST			BIT(0)
+#define RCC_GPIOGCFGR_GPIOGEN			BIT(1)
+#define RCC_GPIOGCFGR_GPIOGLPEN			BIT(2)
+
+/* RCC_GPIOHCFGR register fields */
+#define RCC_GPIOHCFGR_GPIOHRST			BIT(0)
+#define RCC_GPIOHCFGR_GPIOHEN			BIT(1)
+#define RCC_GPIOHCFGR_GPIOHLPEN			BIT(2)
+
+/* RCC_GPIOICFGR register fields */
+#define RCC_GPIOICFGR_GPIOIRST			BIT(0)
+#define RCC_GPIOICFGR_GPIOIEN			BIT(1)
+#define RCC_GPIOICFGR_GPIOILPEN			BIT(2)
+
+/* RCC_GPIOJCFGR register fields */
+#define RCC_GPIOJCFGR_GPIOJRST			BIT(0)
+#define RCC_GPIOJCFGR_GPIOJEN			BIT(1)
+#define RCC_GPIOJCFGR_GPIOJLPEN			BIT(2)
+
+/* RCC_GPIOKCFGR register fields */
+#define RCC_GPIOKCFGR_GPIOKRST			BIT(0)
+#define RCC_GPIOKCFGR_GPIOKEN			BIT(1)
+#define RCC_GPIOKCFGR_GPIOKLPEN			BIT(2)
+
+/* RCC_GPIOZCFGR register fields */
+#define RCC_GPIOZCFGR_GPIOZRST			BIT(0)
+#define RCC_GPIOZCFGR_GPIOZEN			BIT(1)
+#define RCC_GPIOZCFGR_GPIOZLPEN			BIT(2)
+#define RCC_GPIOZCFGR_GPIOZAMEN			BIT(3)
+
+/* RCC_GPIOxCFGR register fields */
+#define RCC_GPIOxCFGR_GPIOxRST			BIT(0)
+#define RCC_GPIOxCFGR_GPIOxEN			BIT(1)
+#define RCC_GPIOxCFGR_GPIOxLPEN			BIT(2)
+#define RCC_GPIOxCFGR_GPIOxAMEN			BIT(3)
+
+/* RCC_HPDMA1CFGR register fields */
+#define RCC_HPDMA1CFGR_HPDMA1RST		BIT(0)
+#define RCC_HPDMA1CFGR_HPDMA1EN			BIT(1)
+#define RCC_HPDMA1CFGR_HPDMA1LPEN		BIT(2)
+
+/* RCC_HPDMA2CFGR register fields */
+#define RCC_HPDMA2CFGR_HPDMA2RST		BIT(0)
+#define RCC_HPDMA2CFGR_HPDMA2EN			BIT(1)
+#define RCC_HPDMA2CFGR_HPDMA2LPEN		BIT(2)
+
+/* RCC_HPDMA3CFGR register fields */
+#define RCC_HPDMA3CFGR_HPDMA3RST		BIT(0)
+#define RCC_HPDMA3CFGR_HPDMA3EN			BIT(1)
+#define RCC_HPDMA3CFGR_HPDMA3LPEN		BIT(2)
+
+/* RCC_HPDMAxCFGR register fields */
+#define RCC_HPDMAxCFGR_HPDMAxRST		BIT(0)
+#define RCC_HPDMAxCFGR_HPDMAxEN			BIT(1)
+#define RCC_HPDMAxCFGR_HPDMAxLPEN		BIT(2)
+
+/* RCC_LPDMACFGR register fields */
+#define RCC_LPDMACFGR_LPDMARST			BIT(0)
+#define RCC_LPDMACFGR_LPDMAEN			BIT(1)
+#define RCC_LPDMACFGR_LPDMALPEN			BIT(2)
+#define RCC_LPDMACFGR_LPDMAAMEN			BIT(3)
+
+/* RCC_HSEMCFGR register fields */
+#define RCC_HSEMCFGR_HSEMRST			BIT(0)
+#define RCC_HSEMCFGR_HSEMEN			BIT(1)
+#define RCC_HSEMCFGR_HSEMLPEN			BIT(2)
+#define RCC_HSEMCFGR_HSEMAMEN			BIT(3)
+
+/* RCC_IPCC1CFGR register fields */
+#define RCC_IPCC1CFGR_IPCC1RST			BIT(0)
+#define RCC_IPCC1CFGR_IPCC1EN			BIT(1)
+#define RCC_IPCC1CFGR_IPCC1LPEN			BIT(2)
+
+/* RCC_IPCC2CFGR register fields */
+#define RCC_IPCC2CFGR_IPCC2RST			BIT(0)
+#define RCC_IPCC2CFGR_IPCC2EN			BIT(1)
+#define RCC_IPCC2CFGR_IPCC2LPEN			BIT(2)
+#define RCC_IPCC2CFGR_IPCC2AMEN			BIT(3)
+
+/* RCC_RTCCFGR register fields */
+#define RCC_RTCCFGR_RTCEN			BIT(1)
+#define RCC_RTCCFGR_RTCLPEN			BIT(2)
+#define RCC_RTCCFGR_RTCAMEN			BIT(3)
+
+/* RCC_SYSCPU1CFGR register fields */
+#define RCC_SYSCPU1CFGR_SYSCPU1EN		BIT(1)
+#define RCC_SYSCPU1CFGR_SYSCPU1LPEN		BIT(2)
+
+/* RCC_BSECCFGR register fields */
+#define RCC_BSECCFGR_BSECEN			BIT(1)
+#define RCC_BSECCFGR_BSECLPEN			BIT(2)
+
+/* RCC_IS2MCFGR register fields */
+#define RCC_IS2MCFGR_IS2MRST			BIT(0)
+#define RCC_IS2MCFGR_IS2MEN			BIT(1)
+#define RCC_IS2MCFGR_IS2MLPEN			BIT(2)
+
+/* RCC_PLL2CFGR1 register fields */
+#define RCC_PLL2CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL2CFGR1_PLLEN			BIT(8)
+#define RCC_PLL2CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL2CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL2CFGR2 register fields */
+#define RCC_PLL2CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL2CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL2CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL2CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL2CFGR3 register fields */
+#define RCC_PLL2CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL2CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL2CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL2CFGR3_DACEN			BIT(25)
+#define RCC_PLL2CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL2CFGR4 register fields */
+#define RCC_PLL2CFGR4_DSMEN			BIT(8)
+#define RCC_PLL2CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL2CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL2CFGR5 register fields */
+#define RCC_PLL2CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL2CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL2CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL2CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL2CFGR6 register fields */
+#define RCC_PLL2CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL2CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL2CFGR7 register fields */
+#define RCC_PLL2CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL2CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLL3CFGR1 register fields */
+#define RCC_PLL3CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL3CFGR1_PLLEN			BIT(8)
+#define RCC_PLL3CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL3CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL3CFGR2 register fields */
+#define RCC_PLL3CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL3CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL3CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL3CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL3CFGR3 register fields */
+#define RCC_PLL3CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL3CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL3CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL3CFGR3_DACEN			BIT(25)
+#define RCC_PLL3CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL3CFGR4 register fields */
+#define RCC_PLL3CFGR4_DSMEN			BIT(8)
+#define RCC_PLL3CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL3CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL3CFGR5 register fields */
+#define RCC_PLL3CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL3CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL3CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL3CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL3CFGR6 register fields */
+#define RCC_PLL3CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL3CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL3CFGR7 register fields */
+#define RCC_PLL3CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL3CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLLxCFGR1 register fields */
+#define RCC_PLLxCFGR1_SSMODRST			BIT(0)
+#define RCC_PLLxCFGR1_PLLEN			BIT(8)
+#define RCC_PLLxCFGR1_PLLRDY			BIT(24)
+#define RCC_PLLxCFGR1_CKREFST			BIT(28)
+
+/* RCC_PLLxCFGR2 register fields */
+#define RCC_PLLxCFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLLxCFGR2_FREFDIV_SHIFT		0
+#define RCC_PLLxCFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLLxCFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLLxCFGR3 register fields */
+#define RCC_PLLxCFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLLxCFGR3_FRACIN_SHIFT		0
+#define RCC_PLLxCFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLLxCFGR3_DACEN			BIT(25)
+#define RCC_PLLxCFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLLxCFGR4 register fields */
+#define RCC_PLLxCFGR4_DSMEN			BIT(8)
+#define RCC_PLLxCFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLLxCFGR4_BYPASS			BIT(10)
+
+/* RCC_PLLxCFGR5 register fields */
+#define RCC_PLLxCFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLLxCFGR5_DIVVAL_SHIFT		0
+#define RCC_PLLxCFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLLxCFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLLxCFGR6 register fields */
+#define RCC_PLLxCFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLLxCFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLLxCFGR7 register fields */
+#define RCC_PLLxCFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLLxCFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_HSIFMONCR register fields */
+#define RCC_HSIFMONCR_HSIREF_MASK		GENMASK(10, 0)
+#define RCC_HSIFMONCR_HSIREF_SHIFT		0
+#define RCC_HSIFMONCR_HSIMONEN			BIT(15)
+#define RCC_HSIFMONCR_HSIDEV_MASK		GENMASK(21, 16)
+#define RCC_HSIFMONCR_HSIDEV_SHIFT		16
+#define RCC_HSIFMONCR_HSIMONIE			BIT(30)
+#define RCC_HSIFMONCR_HSIMONF			BIT(31)
+
+/* RCC_HSIFVALR register fields */
+#define RCC_HSIFVALR_HSIVAL_MASK		GENMASK(10, 0)
+#define RCC_HSIFVALR_HSIVAL_SHIFT		0
+
+/* RCC_TIM1CFGR register fields */
+#define RCC_TIM1CFGR_TIM1RST			BIT(0)
+#define RCC_TIM1CFGR_TIM1EN			BIT(1)
+#define RCC_TIM1CFGR_TIM1LPEN			BIT(2)
+
+/* RCC_TIM2CFGR register fields */
+#define RCC_TIM2CFGR_TIM2RST			BIT(0)
+#define RCC_TIM2CFGR_TIM2EN			BIT(1)
+#define RCC_TIM2CFGR_TIM2LPEN			BIT(2)
+
+/* RCC_TIM3CFGR register fields */
+#define RCC_TIM3CFGR_TIM3RST			BIT(0)
+#define RCC_TIM3CFGR_TIM3EN			BIT(1)
+#define RCC_TIM3CFGR_TIM3LPEN			BIT(2)
+
+/* RCC_TIM4CFGR register fields */
+#define RCC_TIM4CFGR_TIM4RST			BIT(0)
+#define RCC_TIM4CFGR_TIM4EN			BIT(1)
+#define RCC_TIM4CFGR_TIM4LPEN			BIT(2)
+
+/* RCC_TIM5CFGR register fields */
+#define RCC_TIM5CFGR_TIM5RST			BIT(0)
+#define RCC_TIM5CFGR_TIM5EN			BIT(1)
+#define RCC_TIM5CFGR_TIM5LPEN			BIT(2)
+
+/* RCC_TIM6CFGR register fields */
+#define RCC_TIM6CFGR_TIM6RST			BIT(0)
+#define RCC_TIM6CFGR_TIM6EN			BIT(1)
+#define RCC_TIM6CFGR_TIM6LPEN			BIT(2)
+
+/* RCC_TIM7CFGR register fields */
+#define RCC_TIM7CFGR_TIM7RST			BIT(0)
+#define RCC_TIM7CFGR_TIM7EN			BIT(1)
+#define RCC_TIM7CFGR_TIM7LPEN			BIT(2)
+
+/* RCC_TIM8CFGR register fields */
+#define RCC_TIM8CFGR_TIM8RST			BIT(0)
+#define RCC_TIM8CFGR_TIM8EN			BIT(1)
+#define RCC_TIM8CFGR_TIM8LPEN			BIT(2)
+
+/* RCC_TIM10CFGR register fields */
+#define RCC_TIM10CFGR_TIM10RST			BIT(0)
+#define RCC_TIM10CFGR_TIM10EN			BIT(1)
+#define RCC_TIM10CFGR_TIM10LPEN			BIT(2)
+
+/* RCC_TIM11CFGR register fields */
+#define RCC_TIM11CFGR_TIM11RST			BIT(0)
+#define RCC_TIM11CFGR_TIM11EN			BIT(1)
+#define RCC_TIM11CFGR_TIM11LPEN			BIT(2)
+
+/* RCC_TIM12CFGR register fields */
+#define RCC_TIM12CFGR_TIM12RST			BIT(0)
+#define RCC_TIM12CFGR_TIM12EN			BIT(1)
+#define RCC_TIM12CFGR_TIM12LPEN			BIT(2)
+
+/* RCC_TIM13CFGR register fields */
+#define RCC_TIM13CFGR_TIM13RST			BIT(0)
+#define RCC_TIM13CFGR_TIM13EN			BIT(1)
+#define RCC_TIM13CFGR_TIM13LPEN			BIT(2)
+
+/* RCC_TIM14CFGR register fields */
+#define RCC_TIM14CFGR_TIM14RST			BIT(0)
+#define RCC_TIM14CFGR_TIM14EN			BIT(1)
+#define RCC_TIM14CFGR_TIM14LPEN			BIT(2)
+
+/* RCC_TIM15CFGR register fields */
+#define RCC_TIM15CFGR_TIM15RST			BIT(0)
+#define RCC_TIM15CFGR_TIM15EN			BIT(1)
+#define RCC_TIM15CFGR_TIM15LPEN			BIT(2)
+
+/* RCC_TIM16CFGR register fields */
+#define RCC_TIM16CFGR_TIM16RST			BIT(0)
+#define RCC_TIM16CFGR_TIM16EN			BIT(1)
+#define RCC_TIM16CFGR_TIM16LPEN			BIT(2)
+
+/* RCC_TIM17CFGR register fields */
+#define RCC_TIM17CFGR_TIM17RST			BIT(0)
+#define RCC_TIM17CFGR_TIM17EN			BIT(1)
+#define RCC_TIM17CFGR_TIM17LPEN			BIT(2)
+
+/* RCC_TIM20CFGR register fields */
+#define RCC_TIM20CFGR_TIM20RST			BIT(0)
+#define RCC_TIM20CFGR_TIM20EN			BIT(1)
+#define RCC_TIM20CFGR_TIM20LPEN			BIT(2)
+
+/* RCC_LPTIM1CFGR register fields */
+#define RCC_LPTIM1CFGR_LPTIM1RST		BIT(0)
+#define RCC_LPTIM1CFGR_LPTIM1EN			BIT(1)
+#define RCC_LPTIM1CFGR_LPTIM1LPEN		BIT(2)
+
+/* RCC_LPTIM2CFGR register fields */
+#define RCC_LPTIM2CFGR_LPTIM2RST		BIT(0)
+#define RCC_LPTIM2CFGR_LPTIM2EN			BIT(1)
+#define RCC_LPTIM2CFGR_LPTIM2LPEN		BIT(2)
+
+/* RCC_LPTIM3CFGR register fields */
+#define RCC_LPTIM3CFGR_LPTIM3RST		BIT(0)
+#define RCC_LPTIM3CFGR_LPTIM3EN			BIT(1)
+#define RCC_LPTIM3CFGR_LPTIM3LPEN		BIT(2)
+#define RCC_LPTIM3CFGR_LPTIM3AMEN		BIT(3)
+
+/* RCC_LPTIM4CFGR register fields */
+#define RCC_LPTIM4CFGR_LPTIM4RST		BIT(0)
+#define RCC_LPTIM4CFGR_LPTIM4EN			BIT(1)
+#define RCC_LPTIM4CFGR_LPTIM4LPEN		BIT(2)
+#define RCC_LPTIM4CFGR_LPTIM4AMEN		BIT(3)
+
+/* RCC_LPTIM5CFGR register fields */
+#define RCC_LPTIM5CFGR_LPTIM5RST		BIT(0)
+#define RCC_LPTIM5CFGR_LPTIM5EN			BIT(1)
+#define RCC_LPTIM5CFGR_LPTIM5LPEN		BIT(2)
+#define RCC_LPTIM5CFGR_LPTIM5AMEN		BIT(3)
+
+/* RCC_LPTIMxCFGR register fields */
+#define RCC_LPTIMxCFGR_LPTIMxRST		BIT(0)
+#define RCC_LPTIMxCFGR_LPTIMxEN			BIT(1)
+#define RCC_LPTIMxCFGR_LPTIMxLPEN		BIT(2)
+#define RCC_LPTIMxCFGR_LPTIMxAMEN		BIT(3)
+
+/* RCC_SPI1CFGR register fields */
+#define RCC_SPI1CFGR_SPI1RST			BIT(0)
+#define RCC_SPI1CFGR_SPI1EN			BIT(1)
+#define RCC_SPI1CFGR_SPI1LPEN			BIT(2)
+
+/* RCC_SPI2CFGR register fields */
+#define RCC_SPI2CFGR_SPI2RST			BIT(0)
+#define RCC_SPI2CFGR_SPI2EN			BIT(1)
+#define RCC_SPI2CFGR_SPI2LPEN			BIT(2)
+
+/* RCC_SPI3CFGR register fields */
+#define RCC_SPI3CFGR_SPI3RST			BIT(0)
+#define RCC_SPI3CFGR_SPI3EN			BIT(1)
+#define RCC_SPI3CFGR_SPI3LPEN			BIT(2)
+
+/* RCC_SPI4CFGR register fields */
+#define RCC_SPI4CFGR_SPI4RST			BIT(0)
+#define RCC_SPI4CFGR_SPI4EN			BIT(1)
+#define RCC_SPI4CFGR_SPI4LPEN			BIT(2)
+
+/* RCC_SPI5CFGR register fields */
+#define RCC_SPI5CFGR_SPI5RST			BIT(0)
+#define RCC_SPI5CFGR_SPI5EN			BIT(1)
+#define RCC_SPI5CFGR_SPI5LPEN			BIT(2)
+
+/* RCC_SPI6CFGR register fields */
+#define RCC_SPI6CFGR_SPI6RST			BIT(0)
+#define RCC_SPI6CFGR_SPI6EN			BIT(1)
+#define RCC_SPI6CFGR_SPI6LPEN			BIT(2)
+
+/* RCC_SPI7CFGR register fields */
+#define RCC_SPI7CFGR_SPI7RST			BIT(0)
+#define RCC_SPI7CFGR_SPI7EN			BIT(1)
+#define RCC_SPI7CFGR_SPI7LPEN			BIT(2)
+
+/* RCC_SPI8CFGR register fields */
+#define RCC_SPI8CFGR_SPI8RST			BIT(0)
+#define RCC_SPI8CFGR_SPI8EN			BIT(1)
+#define RCC_SPI8CFGR_SPI8LPEN			BIT(2)
+#define RCC_SPI8CFGR_SPI8AMEN			BIT(3)
+
+/* RCC_SPIxCFGR register fields */
+#define RCC_SPIxCFGR_SPIxRST			BIT(0)
+#define RCC_SPIxCFGR_SPIxEN			BIT(1)
+#define RCC_SPIxCFGR_SPIxLPEN			BIT(2)
+#define RCC_SPIxCFGR_SPIxAMEN			BIT(3)
+
+/* RCC_SPDIFRXCFGR register fields */
+#define RCC_SPDIFRXCFGR_SPDIFRXRST		BIT(0)
+#define RCC_SPDIFRXCFGR_SPDIFRXEN		BIT(1)
+#define RCC_SPDIFRXCFGR_SPDIFRXLPEN		BIT(2)
+
+/* RCC_USART1CFGR register fields */
+#define RCC_USART1CFGR_USART1RST		BIT(0)
+#define RCC_USART1CFGR_USART1EN			BIT(1)
+#define RCC_USART1CFGR_USART1LPEN		BIT(2)
+
+/* RCC_USART2CFGR register fields */
+#define RCC_USART2CFGR_USART2RST		BIT(0)
+#define RCC_USART2CFGR_USART2EN			BIT(1)
+#define RCC_USART2CFGR_USART2LPEN		BIT(2)
+
+/* RCC_USART3CFGR register fields */
+#define RCC_USART3CFGR_USART3RST		BIT(0)
+#define RCC_USART3CFGR_USART3EN			BIT(1)
+#define RCC_USART3CFGR_USART3LPEN		BIT(2)
+
+/* RCC_UART4CFGR register fields */
+#define RCC_UART4CFGR_UART4RST			BIT(0)
+#define RCC_UART4CFGR_UART4EN			BIT(1)
+#define RCC_UART4CFGR_UART4LPEN			BIT(2)
+
+/* RCC_UART5CFGR register fields */
+#define RCC_UART5CFGR_UART5RST			BIT(0)
+#define RCC_UART5CFGR_UART5EN			BIT(1)
+#define RCC_UART5CFGR_UART5LPEN			BIT(2)
+
+/* RCC_USART6CFGR register fields */
+#define RCC_USART6CFGR_USART6RST		BIT(0)
+#define RCC_USART6CFGR_USART6EN			BIT(1)
+#define RCC_USART6CFGR_USART6LPEN		BIT(2)
+
+/* RCC_UART7CFGR register fields */
+#define RCC_UART7CFGR_UART7RST			BIT(0)
+#define RCC_UART7CFGR_UART7EN			BIT(1)
+#define RCC_UART7CFGR_UART7LPEN			BIT(2)
+
+/* RCC_UART8CFGR register fields */
+#define RCC_UART8CFGR_UART8RST			BIT(0)
+#define RCC_UART8CFGR_UART8EN			BIT(1)
+#define RCC_UART8CFGR_UART8LPEN			BIT(2)
+
+/* RCC_UART9CFGR register fields */
+#define RCC_UART9CFGR_UART9RST			BIT(0)
+#define RCC_UART9CFGR_UART9EN			BIT(1)
+#define RCC_UART9CFGR_UART9LPEN			BIT(2)
+
+/* RCC_USARTxCFGR register fields */
+#define RCC_USARTxCFGR_USARTxRST		BIT(0)
+#define RCC_USARTxCFGR_USARTxEN			BIT(1)
+#define RCC_USARTxCFGR_USARTxLPEN		BIT(2)
+
+/* RCC_UARTxCFGR register fields */
+#define RCC_UARTxCFGR_UARTxRST			BIT(0)
+#define RCC_UARTxCFGR_UARTxEN			BIT(1)
+#define RCC_UARTxCFGR_UARTxLPEN			BIT(2)
+
+/* RCC_LPUART1CFGR register fields */
+#define RCC_LPUART1CFGR_LPUART1RST		BIT(0)
+#define RCC_LPUART1CFGR_LPUART1EN		BIT(1)
+#define RCC_LPUART1CFGR_LPUART1LPEN		BIT(2)
+#define RCC_LPUART1CFGR_LPUART1AMEN		BIT(3)
+
+/* RCC_I2C1CFGR register fields */
+#define RCC_I2C1CFGR_I2C1RST			BIT(0)
+#define RCC_I2C1CFGR_I2C1EN			BIT(1)
+#define RCC_I2C1CFGR_I2C1LPEN			BIT(2)
+
+/* RCC_I2C2CFGR register fields */
+#define RCC_I2C2CFGR_I2C2RST			BIT(0)
+#define RCC_I2C2CFGR_I2C2EN			BIT(1)
+#define RCC_I2C2CFGR_I2C2LPEN			BIT(2)
+
+/* RCC_I2C3CFGR register fields */
+#define RCC_I2C3CFGR_I2C3RST			BIT(0)
+#define RCC_I2C3CFGR_I2C3EN			BIT(1)
+#define RCC_I2C3CFGR_I2C3LPEN			BIT(2)
+
+/* RCC_I2C4CFGR register fields */
+#define RCC_I2C4CFGR_I2C4RST			BIT(0)
+#define RCC_I2C4CFGR_I2C4EN			BIT(1)
+#define RCC_I2C4CFGR_I2C4LPEN			BIT(2)
+
+/* RCC_I2C5CFGR register fields */
+#define RCC_I2C5CFGR_I2C5RST			BIT(0)
+#define RCC_I2C5CFGR_I2C5EN			BIT(1)
+#define RCC_I2C5CFGR_I2C5LPEN			BIT(2)
+
+/* RCC_I2C6CFGR register fields */
+#define RCC_I2C6CFGR_I2C6RST			BIT(0)
+#define RCC_I2C6CFGR_I2C6EN			BIT(1)
+#define RCC_I2C6CFGR_I2C6LPEN			BIT(2)
+
+/* RCC_I2C7CFGR register fields */
+#define RCC_I2C7CFGR_I2C7RST			BIT(0)
+#define RCC_I2C7CFGR_I2C7EN			BIT(1)
+#define RCC_I2C7CFGR_I2C7LPEN			BIT(2)
+
+/* RCC_I2C8CFGR register fields */
+#define RCC_I2C8CFGR_I2C8RST			BIT(0)
+#define RCC_I2C8CFGR_I2C8EN			BIT(1)
+#define RCC_I2C8CFGR_I2C8LPEN			BIT(2)
+#define RCC_I2C8CFGR_I2C8AMEN			BIT(3)
+
+/* RCC_I2CxCFGR register fields */
+#define RCC_I2CxCFGR_I2CxRST			BIT(0)
+#define RCC_I2CxCFGR_I2CxEN			BIT(1)
+#define RCC_I2CxCFGR_I2CxLPEN			BIT(2)
+#define RCC_I2CxCFGR_I2CxAMEN			BIT(3)
+
+/* RCC_SAI1CFGR register fields */
+#define RCC_SAI1CFGR_SAI1RST			BIT(0)
+#define RCC_SAI1CFGR_SAI1EN			BIT(1)
+#define RCC_SAI1CFGR_SAI1LPEN			BIT(2)
+
+/* RCC_SAI2CFGR register fields */
+#define RCC_SAI2CFGR_SAI2RST			BIT(0)
+#define RCC_SAI2CFGR_SAI2EN			BIT(1)
+#define RCC_SAI2CFGR_SAI2LPEN			BIT(2)
+
+/* RCC_SAI3CFGR register fields */
+#define RCC_SAI3CFGR_SAI3RST			BIT(0)
+#define RCC_SAI3CFGR_SAI3EN			BIT(1)
+#define RCC_SAI3CFGR_SAI3LPEN			BIT(2)
+
+/* RCC_SAI4CFGR register fields */
+#define RCC_SAI4CFGR_SAI4RST			BIT(0)
+#define RCC_SAI4CFGR_SAI4EN			BIT(1)
+#define RCC_SAI4CFGR_SAI4LPEN			BIT(2)
+
+/* RCC_SAIxCFGR register fields */
+#define RCC_SAIxCFGR_SAIxRST			BIT(0)
+#define RCC_SAIxCFGR_SAIxEN			BIT(1)
+#define RCC_SAIxCFGR_SAIxLPEN			BIT(2)
+
+/* RCC_MDF1CFGR register fields */
+#define RCC_MDF1CFGR_MDF1RST			BIT(0)
+#define RCC_MDF1CFGR_MDF1EN			BIT(1)
+#define RCC_MDF1CFGR_MDF1LPEN			BIT(2)
+
+/* RCC_ADF1CFGR register fields */
+#define RCC_ADF1CFGR_ADF1RST			BIT(0)
+#define RCC_ADF1CFGR_ADF1EN			BIT(1)
+#define RCC_ADF1CFGR_ADF1LPEN			BIT(2)
+#define RCC_ADF1CFGR_ADF1AMEN			BIT(3)
+
+/* RCC_FDCANCFGR register fields */
+#define RCC_FDCANCFGR_FDCANRST			BIT(0)
+#define RCC_FDCANCFGR_FDCANEN			BIT(1)
+#define RCC_FDCANCFGR_FDCANLPEN			BIT(2)
+
+/* RCC_HDPCFGR register fields */
+#define RCC_HDPCFGR_HDPRST			BIT(0)
+#define RCC_HDPCFGR_HDPEN			BIT(1)
+
+/* RCC_ADC12CFGR register fields */
+#define RCC_ADC12CFGR_ADC12RST			BIT(0)
+#define RCC_ADC12CFGR_ADC12EN			BIT(1)
+#define RCC_ADC12CFGR_ADC12LPEN			BIT(2)
+#define RCC_ADC12CFGR_ADC12KERSEL		BIT(12)
+
+/* RCC_ADC3CFGR register fields */
+#define RCC_ADC3CFGR_ADC3RST			BIT(0)
+#define RCC_ADC3CFGR_ADC3EN			BIT(1)
+#define RCC_ADC3CFGR_ADC3LPEN			BIT(2)
+#define RCC_ADC3CFGR_ADC3KERSEL_MASK		GENMASK(13, 12)
+#define RCC_ADC3CFGR_ADC3KERSEL_SHIFT		12
+
+/* RCC_ETH1CFGR register fields */
+#define RCC_ETH1CFGR_ETH1RST			BIT(0)
+#define RCC_ETH1CFGR_ETH1MACEN			BIT(1)
+#define RCC_ETH1CFGR_ETH1MACLPEN		BIT(2)
+#define RCC_ETH1CFGR_ETH1STPEN			BIT(4)
+#define RCC_ETH1CFGR_ETH1EN			BIT(5)
+#define RCC_ETH1CFGR_ETH1LPEN			BIT(6)
+#define RCC_ETH1CFGR_ETH1TXEN			BIT(8)
+#define RCC_ETH1CFGR_ETH1TXLPEN			BIT(9)
+#define RCC_ETH1CFGR_ETH1RXEN			BIT(10)
+#define RCC_ETH1CFGR_ETH1RXLPEN			BIT(11)
+
+/* RCC_ETH2CFGR register fields */
+#define RCC_ETH2CFGR_ETH2RST			BIT(0)
+#define RCC_ETH2CFGR_ETH2MACEN			BIT(1)
+#define RCC_ETH2CFGR_ETH2MACLPEN		BIT(2)
+#define RCC_ETH2CFGR_ETH2STPEN			BIT(4)
+#define RCC_ETH2CFGR_ETH2EN			BIT(5)
+#define RCC_ETH2CFGR_ETH2LPEN			BIT(6)
+#define RCC_ETH2CFGR_ETH2TXEN			BIT(8)
+#define RCC_ETH2CFGR_ETH2TXLPEN			BIT(9)
+#define RCC_ETH2CFGR_ETH2RXEN			BIT(10)
+#define RCC_ETH2CFGR_ETH2RXLPEN			BIT(11)
+
+/* RCC_ETHxCFGR register fields */
+#define RCC_ETHxCFGR_ETHxRST			BIT(0)
+#define RCC_ETHxCFGR_ETHxMACEN			BIT(1)
+#define RCC_ETHxCFGR_ETHxMACLPEN		BIT(2)
+#define RCC_ETHxCFGR_ETHxSTPEN			BIT(4)
+#define RCC_ETHxCFGR_ETHxEN			BIT(5)
+#define RCC_ETHxCFGR_ETHxLPEN			BIT(6)
+#define RCC_ETHxCFGR_ETHxTXEN			BIT(8)
+#define RCC_ETHxCFGR_ETHxTXLPEN			BIT(9)
+#define RCC_ETHxCFGR_ETHxRXEN			BIT(10)
+#define RCC_ETHxCFGR_ETHxRXLPEN			BIT(11)
+
+/* RCC_USB2CFGR register fields */
+#define RCC_USB2CFGR_USB2RST			BIT(0)
+#define RCC_USB2CFGR_USB2EN			BIT(1)
+#define RCC_USB2CFGR_USB2LPEN			BIT(2)
+#define RCC_USB2CFGR_USB2STPEN			BIT(4)
+
+/* RCC_USB2PHY1CFGR register fields */
+#define RCC_USB2PHY1CFGR_USB2PHY1RST		BIT(0)
+#define RCC_USB2PHY1CFGR_USB2PHY1EN		BIT(1)
+#define RCC_USB2PHY1CFGR_USB2PHY1LPEN		BIT(2)
+#define RCC_USB2PHY1CFGR_USB2PHY1STPEN		BIT(4)
+#define RCC_USB2PHY1CFGR_USB2PHY1CKREFSEL	BIT(15)
+
+/* RCC_USB2PHY2CFGR register fields */
+#define RCC_USB2PHY2CFGR_USB2PHY2RST		BIT(0)
+#define RCC_USB2PHY2CFGR_USB2PHY2EN		BIT(1)
+#define RCC_USB2PHY2CFGR_USB2PHY2LPEN		BIT(2)
+#define RCC_USB2PHY2CFGR_USB2PHY2STPEN		BIT(4)
+#define RCC_USB2PHY2CFGR_USB2PHY2CKREFSEL	BIT(15)
+
+/* RCC_USB2PHYxCFGR register fields */
+#define RCC_USB2PHYxCFGR_USB2PHY1RST		BIT(0)
+#define RCC_USB2PHYxCFGR_USB2PHY1EN		BIT(1)
+#define RCC_USB2PHYxCFGR_USB2PHY1LPEN		BIT(2)
+#define RCC_USB2PHYxCFGR_USB2PHY1STPEN		BIT(4)
+#define RCC_USB2PHYxCFGR_USB2PHY1CKREFSEL	BIT(15)
+
+/* RCC_USB3DRCFGR register fields */
+#define RCC_USB3DRCFGR_USB3DRRST		BIT(0)
+#define RCC_USB3DRCFGR_USB3DREN			BIT(1)
+#define RCC_USB3DRCFGR_USB3DRLPEN		BIT(2)
+#define RCC_USB3DRCFGR_USB3DRSTPEN		BIT(4)
+
+/* RCC_USB3PCIEPHYCFGR register fields */
+#define RCC_USB3PCIEPHYCFGR_USB3PCIEPHYRST	BIT(0)
+#define RCC_USB3PCIEPHYCFGR_USB3PCIEPHYEN	BIT(1)
+#define RCC_USB3PCIEPHYCFGR_USB3PCIEPHYLPEN	BIT(2)
+#define RCC_USB3PCIEPHYCFGR_USB3PCIEPHYSTPEN	BIT(4)
+#define RCC_USB3PCIEPHYCFGR_USB3PCIEPHYCKREFSEL	BIT(15)
+
+/* RCC_PCIECFGR register fields */
+#define RCC_PCIECFGR_PCIERST			BIT(0)
+#define RCC_PCIECFGR_PCIEEN			BIT(1)
+#define RCC_PCIECFGR_PCIELPEN			BIT(2)
+#define RCC_PCIECFGR_PCIESTPEN			BIT(4)
+
+/* RCC_USBTCCFGR register fields */
+#define RCC_USBTCCFGR_USBTCRST			BIT(0)
+#define RCC_USBTCCFGR_USBTCEN			BIT(1)
+#define RCC_USBTCCFGR_USBTCLPEN			BIT(2)
+
+/* RCC_ETHSWCFGR register fields */
+#define RCC_ETHSWCFGR_ETHSWRST			BIT(0)
+#define RCC_ETHSWCFGR_ETHSWMACEN		BIT(1)
+#define RCC_ETHSWCFGR_ETHSWMACLPEN		BIT(2)
+#define RCC_ETHSWCFGR_ETHSWEN			BIT(5)
+#define RCC_ETHSWCFGR_ETHSWLPEN			BIT(6)
+#define RCC_ETHSWCFGR_ETHSWREFEN		BIT(21)
+#define RCC_ETHSWCFGR_ETHSWREFLPEN		BIT(22)
+
+/* RCC_ETHSWACMCFGR register fields */
+#define RCC_ETHSWACMCFGR_ETHSWACMEN		BIT(1)
+#define RCC_ETHSWACMCFGR_ETHSWACMLPEN		BIT(2)
+
+/* RCC_ETHSWACMMSGCFGR register fields */
+#define RCC_ETHSWACMMSGCFGR_ETHSWACMMSGEN	BIT(1)
+#define RCC_ETHSWACMMSGCFGR_ETHSWACMMSGLPEN	BIT(2)
+
+/* RCC_STGENCFGR register fields */
+#define RCC_STGENCFGR_STGENEN			BIT(1)
+#define RCC_STGENCFGR_STGENLPEN			BIT(2)
+#define RCC_STGENCFGR_STGENSTPEN		BIT(4)
+
+/* RCC_SDMMC1CFGR register fields */
+#define RCC_SDMMC1CFGR_SDMMC1RST		BIT(0)
+#define RCC_SDMMC1CFGR_SDMMC1EN			BIT(1)
+#define RCC_SDMMC1CFGR_SDMMC1LPEN		BIT(2)
+#define RCC_SDMMC1CFGR_SDMMC1DLLRST		BIT(16)
+
+/* RCC_SDMMC2CFGR register fields */
+#define RCC_SDMMC2CFGR_SDMMC2RST		BIT(0)
+#define RCC_SDMMC2CFGR_SDMMC2EN			BIT(1)
+#define RCC_SDMMC2CFGR_SDMMC2LPEN		BIT(2)
+#define RCC_SDMMC2CFGR_SDMMC2DLLRST		BIT(16)
+
+/* RCC_SDMMC3CFGR register fields */
+#define RCC_SDMMC3CFGR_SDMMC3RST		BIT(0)
+#define RCC_SDMMC3CFGR_SDMMC3EN			BIT(1)
+#define RCC_SDMMC3CFGR_SDMMC3LPEN		BIT(2)
+#define RCC_SDMMC3CFGR_SDMMC3DLLRST		BIT(16)
+
+/* RCC_SDMMCxCFGR register fields */
+#define RCC_SDMMCxCFGR_SDMMC1RST		BIT(0)
+#define RCC_SDMMCxCFGR_SDMMC1EN			BIT(1)
+#define RCC_SDMMCxCFGR_SDMMC1LPEN		BIT(2)
+#define RCC_SDMMCxCFGR_SDMMC1DLLRST		BIT(16)
+
+/* RCC_GPUCFGR register fields */
+#define RCC_GPUCFGR_GPURST			BIT(0)
+#define RCC_GPUCFGR_GPUEN			BIT(1)
+#define RCC_GPUCFGR_GPULPEN			BIT(2)
+
+/* RCC_LTDCCFGR register fields */
+#define RCC_LTDCCFGR_LTDCRST			BIT(0)
+#define RCC_LTDCCFGR_LTDCEN			BIT(1)
+#define RCC_LTDCCFGR_LTDCLPEN			BIT(2)
+
+/* RCC_DSICFGR register fields */
+#define RCC_DSICFGR_DSIRST			BIT(0)
+#define RCC_DSICFGR_DSIEN			BIT(1)
+#define RCC_DSICFGR_DSILPEN			BIT(2)
+#define RCC_DSICFGR_DSIBLSEL			BIT(12)
+#define RCC_DSICFGR_DSIPHYCKREFSEL		BIT(15)
+
+/* RCC_LVDSCFGR register fields */
+#define RCC_LVDSCFGR_LVDSRST			BIT(0)
+#define RCC_LVDSCFGR_LVDSEN			BIT(1)
+#define RCC_LVDSCFGR_LVDSLPEN			BIT(2)
+#define RCC_LVDSCFGR_LVDSPHYCKREFSEL		BIT(15)
+
+/* RCC_CSICFGR register fields */
+#define RCC_CSICFGR_CSIRST			BIT(0)
+#define RCC_CSICFGR_CSIEN			BIT(1)
+#define RCC_CSICFGR_CSILPEN			BIT(2)
+
+/* RCC_DCMIPPCFGR register fields */
+#define RCC_DCMIPPCFGR_DCMIPPRST		BIT(0)
+#define RCC_DCMIPPCFGR_DCMIPPEN			BIT(1)
+#define RCC_DCMIPPCFGR_DCMIPPLPEN		BIT(2)
+
+/* RCC_CCICFGR register fields */
+#define RCC_CCICFGR_CCIRST			BIT(0)
+#define RCC_CCICFGR_CCIEN			BIT(1)
+#define RCC_CCICFGR_CCILPEN			BIT(2)
+
+/* RCC_VDECCFGR register fields */
+#define RCC_VDECCFGR_VDECRST			BIT(0)
+#define RCC_VDECCFGR_VDECEN			BIT(1)
+#define RCC_VDECCFGR_VDECLPEN			BIT(2)
+
+/* RCC_VENCCFGR register fields */
+#define RCC_VENCCFGR_VENCRST			BIT(0)
+#define RCC_VENCCFGR_VENCEN			BIT(1)
+#define RCC_VENCCFGR_VENCLPEN			BIT(2)
+
+/* RCC_RNGCFGR register fields */
+#define RCC_RNGCFGR_RNGRST			BIT(0)
+#define RCC_RNGCFGR_RNGEN			BIT(1)
+#define RCC_RNGCFGR_RNGLPEN			BIT(2)
+
+/* RCC_PKACFGR register fields */
+#define RCC_PKACFGR_PKARST			BIT(0)
+#define RCC_PKACFGR_PKAEN			BIT(1)
+#define RCC_PKACFGR_PKALPEN			BIT(2)
+
+/* RCC_SAESCFGR register fields */
+#define RCC_SAESCFGR_SAESRST			BIT(0)
+#define RCC_SAESCFGR_SAESEN			BIT(1)
+#define RCC_SAESCFGR_SAESLPEN			BIT(2)
+
+/* RCC_HASHCFGR register fields */
+#define RCC_HASHCFGR_HASHRST			BIT(0)
+#define RCC_HASHCFGR_HASHEN			BIT(1)
+#define RCC_HASHCFGR_HASHLPEN			BIT(2)
+
+/* RCC_CRYP1CFGR register fields */
+#define RCC_CRYP1CFGR_CRYP1RST			BIT(0)
+#define RCC_CRYP1CFGR_CRYP1EN			BIT(1)
+#define RCC_CRYP1CFGR_CRYP1LPEN			BIT(2)
+
+/* RCC_CRYP2CFGR register fields */
+#define RCC_CRYP2CFGR_CRYP2RST			BIT(0)
+#define RCC_CRYP2CFGR_CRYP2EN			BIT(1)
+#define RCC_CRYP2CFGR_CRYP2LPEN			BIT(2)
+
+/* RCC_CRYPxCFGR register fields */
+#define RCC_CRYPxCFGR_CRYPxRST			BIT(0)
+#define RCC_CRYPxCFGR_CRYPxEN			BIT(1)
+#define RCC_CRYPxCFGR_CRYPxLPEN			BIT(2)
+
+/* RCC_IWDG1CFGR register fields */
+#define RCC_IWDG1CFGR_IWDG1EN			BIT(1)
+#define RCC_IWDG1CFGR_IWDG1LPEN			BIT(2)
+
+/* RCC_IWDG2CFGR register fields */
+#define RCC_IWDG2CFGR_IWDG2EN			BIT(1)
+#define RCC_IWDG2CFGR_IWDG2LPEN			BIT(2)
+
+/* RCC_IWDG3CFGR register fields */
+#define RCC_IWDG3CFGR_IWDG3EN			BIT(1)
+#define RCC_IWDG3CFGR_IWDG3LPEN			BIT(2)
+
+/* RCC_IWDG4CFGR register fields */
+#define RCC_IWDG4CFGR_IWDG4EN			BIT(1)
+#define RCC_IWDG4CFGR_IWDG4LPEN			BIT(2)
+
+/* RCC_IWDGxCFGR register fields */
+#define RCC_IWDGxCFGR_IWDGxEN			BIT(1)
+#define RCC_IWDGxCFGR_IWDGxLPEN			BIT(2)
+
+/* RCC_IWDG5CFGR register fields */
+#define RCC_IWDG5CFGR_IWDG5EN			BIT(1)
+#define RCC_IWDG5CFGR_IWDG5LPEN			BIT(2)
+#define RCC_IWDG5CFGR_IWDG5AMEN			BIT(3)
+
+/* RCC_WWDG1CFGR register fields */
+#define RCC_WWDG1CFGR_WWDG1RST			BIT(0)
+#define RCC_WWDG1CFGR_WWDG1EN			BIT(1)
+#define RCC_WWDG1CFGR_WWDG1LPEN			BIT(2)
+
+/* RCC_WWDG2CFGR register fields */
+#define RCC_WWDG2CFGR_WWDG2RST			BIT(0)
+#define RCC_WWDG2CFGR_WWDG2EN			BIT(1)
+#define RCC_WWDG2CFGR_WWDG2LPEN			BIT(2)
+#define RCC_WWDG2CFGR_WWDG2AMEN			BIT(3)
+
+/* RCC_VREFCFGR register fields */
+#define RCC_VREFCFGR_VREFRST			BIT(0)
+#define RCC_VREFCFGR_VREFEN			BIT(1)
+#define RCC_VREFCFGR_VREFLPEN			BIT(2)
+
+/* RCC_DTSCFGR register fields */
+#define RCC_DTSCFGR_DTSRST			BIT(0)
+#define RCC_DTSCFGR_DTSEN			BIT(1)
+#define RCC_DTSCFGR_DTSLPEN			BIT(2)
+#define RCC_DTSCFGR_DTSKERSEL_MASK		GENMASK(13, 12)
+#define RCC_DTSCFGR_DTSKERSEL_SHIFT		12
+
+/* RCC_CRCCFGR register fields */
+#define RCC_CRCCFGR_CRCRST			BIT(0)
+#define RCC_CRCCFGR_CRCEN			BIT(1)
+#define RCC_CRCCFGR_CRCLPEN			BIT(2)
+
+/* RCC_SERCCFGR register fields */
+#define RCC_SERCCFGR_SERCRST			BIT(0)
+#define RCC_SERCCFGR_SERCEN			BIT(1)
+#define RCC_SERCCFGR_SERCLPEN			BIT(2)
+
+/* RCC_OSPIIOMCFGR register fields */
+#define RCC_OSPIIOMCFGR_OSPIIOMRST		BIT(0)
+#define RCC_OSPIIOMCFGR_OSPIIOMEN		BIT(1)
+#define RCC_OSPIIOMCFGR_OSPIIOMLPEN		BIT(2)
+
+/* RCC_GICV2MCFGR register fields */
+#define RCC_GICV2MCFGR_GICV2MEN			BIT(1)
+#define RCC_GICV2MCFGR_GICV2MLPEN		BIT(2)
+
+/* RCC_I3C1CFGR register fields */
+#define RCC_I3C1CFGR_I3C1RST			BIT(0)
+#define RCC_I3C1CFGR_I3C1EN			BIT(1)
+#define RCC_I3C1CFGR_I3C1LPEN			BIT(2)
+
+/* RCC_I3C2CFGR register fields */
+#define RCC_I3C2CFGR_I3C2RST			BIT(0)
+#define RCC_I3C2CFGR_I3C2EN			BIT(1)
+#define RCC_I3C2CFGR_I3C2LPEN			BIT(2)
+
+/* RCC_I3C3CFGR register fields */
+#define RCC_I3C3CFGR_I3C3RST			BIT(0)
+#define RCC_I3C3CFGR_I3C3EN			BIT(1)
+#define RCC_I3C3CFGR_I3C3LPEN			BIT(2)
+
+/* RCC_I3C4CFGR register fields */
+#define RCC_I3C4CFGR_I3C4RST			BIT(0)
+#define RCC_I3C4CFGR_I3C4EN			BIT(1)
+#define RCC_I3C4CFGR_I3C4LPEN			BIT(2)
+#define RCC_I3C4CFGR_I3C4AMEN			BIT(3)
+
+/* RCC_I3CxCFGR register fields */
+#define RCC_I3CxCFGR_I3CxRST			BIT(0)
+#define RCC_I3CxCFGR_I3CxEN			BIT(1)
+#define RCC_I3CxCFGR_I3CxLPEN			BIT(2)
+#define RCC_I3CxCFGR_I3CxAMEN			BIT(3)
+
+/* RCC_MUXSELCFGR register fields */
+#define RCC_MUXSELCFGR_MUXSEL0_MASK		GENMASK(1, 0)
+#define RCC_MUXSELCFGR_MUXSEL0_SHIFT		0
+#define RCC_MUXSELCFGR_MUXSEL1_MASK		GENMASK(5, 4)
+#define RCC_MUXSELCFGR_MUXSEL1_SHIFT		4
+#define RCC_MUXSELCFGR_MUXSEL2_MASK		GENMASK(9, 8)
+#define RCC_MUXSELCFGR_MUXSEL2_SHIFT		8
+#define RCC_MUXSELCFGR_MUXSEL3_MASK		GENMASK(13, 12)
+#define RCC_MUXSELCFGR_MUXSEL3_SHIFT		12
+#define RCC_MUXSELCFGR_MUXSEL4_MASK		GENMASK(17, 16)
+#define RCC_MUXSELCFGR_MUXSEL4_SHIFT		16
+#define RCC_MUXSELCFGR_MUXSEL5_MASK		GENMASK(21, 20)
+#define RCC_MUXSELCFGR_MUXSEL5_SHIFT		20
+#define RCC_MUXSELCFGR_MUXSEL6_MASK		GENMASK(25, 24)
+#define RCC_MUXSELCFGR_MUXSEL6_SHIFT		24
+#define RCC_MUXSELCFGR_MUXSEL7_MASK		GENMASK(29, 28)
+#define RCC_MUXSELCFGR_MUXSEL7_SHIFT		28
+
+/* RCC_XBAR0CFGR register fields */
+#define RCC_XBAR0CFGR_XBAR0SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR0CFGR_XBAR0SEL_SHIFT		0
+#define RCC_XBAR0CFGR_XBAR0EN			BIT(6)
+#define RCC_XBAR0CFGR_XBAR0STS			BIT(7)
+
+/* RCC_XBAR1CFGR register fields */
+#define RCC_XBAR1CFGR_XBAR1SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR1CFGR_XBAR1SEL_SHIFT		0
+#define RCC_XBAR1CFGR_XBAR1EN			BIT(6)
+#define RCC_XBAR1CFGR_XBAR1STS			BIT(7)
+
+/* RCC_XBAR2CFGR register fields */
+#define RCC_XBAR2CFGR_XBAR2SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR2CFGR_XBAR2SEL_SHIFT		0
+#define RCC_XBAR2CFGR_XBAR2EN			BIT(6)
+#define RCC_XBAR2CFGR_XBAR2STS			BIT(7)
+
+/* RCC_XBAR3CFGR register fields */
+#define RCC_XBAR3CFGR_XBAR3SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR3CFGR_XBAR3SEL_SHIFT		0
+#define RCC_XBAR3CFGR_XBAR3EN			BIT(6)
+#define RCC_XBAR3CFGR_XBAR3STS			BIT(7)
+
+/* RCC_XBAR4CFGR register fields */
+#define RCC_XBAR4CFGR_XBAR4SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR4CFGR_XBAR4SEL_SHIFT		0
+#define RCC_XBAR4CFGR_XBAR4EN			BIT(6)
+#define RCC_XBAR4CFGR_XBAR4STS			BIT(7)
+
+/* RCC_XBAR5CFGR register fields */
+#define RCC_XBAR5CFGR_XBAR5SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR5CFGR_XBAR5SEL_SHIFT		0
+#define RCC_XBAR5CFGR_XBAR5EN			BIT(6)
+#define RCC_XBAR5CFGR_XBAR5STS			BIT(7)
+
+/* RCC_XBAR6CFGR register fields */
+#define RCC_XBAR6CFGR_XBAR6SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR6CFGR_XBAR6SEL_SHIFT		0
+#define RCC_XBAR6CFGR_XBAR6EN			BIT(6)
+#define RCC_XBAR6CFGR_XBAR6STS			BIT(7)
+
+/* RCC_XBAR7CFGR register fields */
+#define RCC_XBAR7CFGR_XBAR7SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR7CFGR_XBAR7SEL_SHIFT		0
+#define RCC_XBAR7CFGR_XBAR7EN			BIT(6)
+#define RCC_XBAR7CFGR_XBAR7STS			BIT(7)
+
+/* RCC_XBAR8CFGR register fields */
+#define RCC_XBAR8CFGR_XBAR8SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR8CFGR_XBAR8SEL_SHIFT		0
+#define RCC_XBAR8CFGR_XBAR8EN			BIT(6)
+#define RCC_XBAR8CFGR_XBAR8STS			BIT(7)
+
+/* RCC_XBAR9CFGR register fields */
+#define RCC_XBAR9CFGR_XBAR9SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR9CFGR_XBAR9SEL_SHIFT		0
+#define RCC_XBAR9CFGR_XBAR9EN			BIT(6)
+#define RCC_XBAR9CFGR_XBAR9STS			BIT(7)
+
+/* RCC_XBAR10CFGR register fields */
+#define RCC_XBAR10CFGR_XBAR10SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR10CFGR_XBAR10SEL_SHIFT		0
+#define RCC_XBAR10CFGR_XBAR10EN			BIT(6)
+#define RCC_XBAR10CFGR_XBAR10STS		BIT(7)
+
+/* RCC_XBAR11CFGR register fields */
+#define RCC_XBAR11CFGR_XBAR11SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR11CFGR_XBAR11SEL_SHIFT		0
+#define RCC_XBAR11CFGR_XBAR11EN			BIT(6)
+#define RCC_XBAR11CFGR_XBAR11STS		BIT(7)
+
+/* RCC_XBAR12CFGR register fields */
+#define RCC_XBAR12CFGR_XBAR12SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR12CFGR_XBAR12SEL_SHIFT		0
+#define RCC_XBAR12CFGR_XBAR12EN			BIT(6)
+#define RCC_XBAR12CFGR_XBAR12STS		BIT(7)
+
+/* RCC_XBAR13CFGR register fields */
+#define RCC_XBAR13CFGR_XBAR13SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR13CFGR_XBAR13SEL_SHIFT		0
+#define RCC_XBAR13CFGR_XBAR13EN			BIT(6)
+#define RCC_XBAR13CFGR_XBAR13STS		BIT(7)
+
+/* RCC_XBAR14CFGR register fields */
+#define RCC_XBAR14CFGR_XBAR14SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR14CFGR_XBAR14SEL_SHIFT		0
+#define RCC_XBAR14CFGR_XBAR14EN			BIT(6)
+#define RCC_XBAR14CFGR_XBAR14STS		BIT(7)
+
+/* RCC_XBAR15CFGR register fields */
+#define RCC_XBAR15CFGR_XBAR15SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR15CFGR_XBAR15SEL_SHIFT		0
+#define RCC_XBAR15CFGR_XBAR15EN			BIT(6)
+#define RCC_XBAR15CFGR_XBAR15STS		BIT(7)
+
+/* RCC_XBAR16CFGR register fields */
+#define RCC_XBAR16CFGR_XBAR16SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR16CFGR_XBAR16SEL_SHIFT		0
+#define RCC_XBAR16CFGR_XBAR16EN			BIT(6)
+#define RCC_XBAR16CFGR_XBAR16STS		BIT(7)
+
+/* RCC_XBAR17CFGR register fields */
+#define RCC_XBAR17CFGR_XBAR17SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR17CFGR_XBAR17SEL_SHIFT		0
+#define RCC_XBAR17CFGR_XBAR17EN			BIT(6)
+#define RCC_XBAR17CFGR_XBAR17STS		BIT(7)
+
+/* RCC_XBAR18CFGR register fields */
+#define RCC_XBAR18CFGR_XBAR18SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR18CFGR_XBAR18SEL_SHIFT		0
+#define RCC_XBAR18CFGR_XBAR18EN			BIT(6)
+#define RCC_XBAR18CFGR_XBAR18STS		BIT(7)
+
+/* RCC_XBAR19CFGR register fields */
+#define RCC_XBAR19CFGR_XBAR19SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR19CFGR_XBAR19SEL_SHIFT		0
+#define RCC_XBAR19CFGR_XBAR19EN			BIT(6)
+#define RCC_XBAR19CFGR_XBAR19STS		BIT(7)
+
+/* RCC_XBAR20CFGR register fields */
+#define RCC_XBAR20CFGR_XBAR20SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR20CFGR_XBAR20SEL_SHIFT		0
+#define RCC_XBAR20CFGR_XBAR20EN			BIT(6)
+#define RCC_XBAR20CFGR_XBAR20STS		BIT(7)
+
+/* RCC_XBAR21CFGR register fields */
+#define RCC_XBAR21CFGR_XBAR21SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR21CFGR_XBAR21SEL_SHIFT		0
+#define RCC_XBAR21CFGR_XBAR21EN			BIT(6)
+#define RCC_XBAR21CFGR_XBAR21STS		BIT(7)
+
+/* RCC_XBAR22CFGR register fields */
+#define RCC_XBAR22CFGR_XBAR22SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR22CFGR_XBAR22SEL_SHIFT		0
+#define RCC_XBAR22CFGR_XBAR22EN			BIT(6)
+#define RCC_XBAR22CFGR_XBAR22STS		BIT(7)
+
+/* RCC_XBAR23CFGR register fields */
+#define RCC_XBAR23CFGR_XBAR23SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR23CFGR_XBAR23SEL_SHIFT		0
+#define RCC_XBAR23CFGR_XBAR23EN			BIT(6)
+#define RCC_XBAR23CFGR_XBAR23STS		BIT(7)
+
+/* RCC_XBAR24CFGR register fields */
+#define RCC_XBAR24CFGR_XBAR24SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR24CFGR_XBAR24SEL_SHIFT		0
+#define RCC_XBAR24CFGR_XBAR24EN			BIT(6)
+#define RCC_XBAR24CFGR_XBAR24STS		BIT(7)
+
+/* RCC_XBAR25CFGR register fields */
+#define RCC_XBAR25CFGR_XBAR25SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR25CFGR_XBAR25SEL_SHIFT		0
+#define RCC_XBAR25CFGR_XBAR25EN			BIT(6)
+#define RCC_XBAR25CFGR_XBAR25STS		BIT(7)
+
+/* RCC_XBAR26CFGR register fields */
+#define RCC_XBAR26CFGR_XBAR26SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR26CFGR_XBAR26SEL_SHIFT		0
+#define RCC_XBAR26CFGR_XBAR26EN			BIT(6)
+#define RCC_XBAR26CFGR_XBAR26STS		BIT(7)
+
+/* RCC_XBAR27CFGR register fields */
+#define RCC_XBAR27CFGR_XBAR27SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR27CFGR_XBAR27SEL_SHIFT		0
+#define RCC_XBAR27CFGR_XBAR27EN			BIT(6)
+#define RCC_XBAR27CFGR_XBAR27STS		BIT(7)
+
+/* RCC_XBAR28CFGR register fields */
+#define RCC_XBAR28CFGR_XBAR28SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR28CFGR_XBAR28SEL_SHIFT		0
+#define RCC_XBAR28CFGR_XBAR28EN			BIT(6)
+#define RCC_XBAR28CFGR_XBAR28STS		BIT(7)
+
+/* RCC_XBAR29CFGR register fields */
+#define RCC_XBAR29CFGR_XBAR29SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR29CFGR_XBAR29SEL_SHIFT		0
+#define RCC_XBAR29CFGR_XBAR29EN			BIT(6)
+#define RCC_XBAR29CFGR_XBAR29STS		BIT(7)
+
+/* RCC_XBAR30CFGR register fields */
+#define RCC_XBAR30CFGR_XBAR30SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR30CFGR_XBAR30SEL_SHIFT		0
+#define RCC_XBAR30CFGR_XBAR30EN			BIT(6)
+#define RCC_XBAR30CFGR_XBAR30STS		BIT(7)
+
+/* RCC_XBAR31CFGR register fields */
+#define RCC_XBAR31CFGR_XBAR31SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR31CFGR_XBAR31SEL_SHIFT		0
+#define RCC_XBAR31CFGR_XBAR31EN			BIT(6)
+#define RCC_XBAR31CFGR_XBAR31STS		BIT(7)
+
+/* RCC_XBAR32CFGR register fields */
+#define RCC_XBAR32CFGR_XBAR32SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR32CFGR_XBAR32SEL_SHIFT		0
+#define RCC_XBAR32CFGR_XBAR32EN			BIT(6)
+#define RCC_XBAR32CFGR_XBAR32STS		BIT(7)
+
+/* RCC_XBAR33CFGR register fields */
+#define RCC_XBAR33CFGR_XBAR33SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR33CFGR_XBAR33SEL_SHIFT		0
+#define RCC_XBAR33CFGR_XBAR33EN			BIT(6)
+#define RCC_XBAR33CFGR_XBAR33STS		BIT(7)
+
+/* RCC_XBAR34CFGR register fields */
+#define RCC_XBAR34CFGR_XBAR34SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR34CFGR_XBAR34SEL_SHIFT		0
+#define RCC_XBAR34CFGR_XBAR34EN			BIT(6)
+#define RCC_XBAR34CFGR_XBAR34STS		BIT(7)
+
+/* RCC_XBAR35CFGR register fields */
+#define RCC_XBAR35CFGR_XBAR35SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR35CFGR_XBAR35SEL_SHIFT		0
+#define RCC_XBAR35CFGR_XBAR35EN			BIT(6)
+#define RCC_XBAR35CFGR_XBAR35STS		BIT(7)
+
+/* RCC_XBAR36CFGR register fields */
+#define RCC_XBAR36CFGR_XBAR36SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR36CFGR_XBAR36SEL_SHIFT		0
+#define RCC_XBAR36CFGR_XBAR36EN			BIT(6)
+#define RCC_XBAR36CFGR_XBAR36STS		BIT(7)
+
+/* RCC_XBAR37CFGR register fields */
+#define RCC_XBAR37CFGR_XBAR37SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR37CFGR_XBAR37SEL_SHIFT		0
+#define RCC_XBAR37CFGR_XBAR37EN			BIT(6)
+#define RCC_XBAR37CFGR_XBAR37STS		BIT(7)
+
+/* RCC_XBAR38CFGR register fields */
+#define RCC_XBAR38CFGR_XBAR38SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR38CFGR_XBAR38SEL_SHIFT		0
+#define RCC_XBAR38CFGR_XBAR38EN			BIT(6)
+#define RCC_XBAR38CFGR_XBAR38STS		BIT(7)
+
+/* RCC_XBAR39CFGR register fields */
+#define RCC_XBAR39CFGR_XBAR39SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR39CFGR_XBAR39SEL_SHIFT		0
+#define RCC_XBAR39CFGR_XBAR39EN			BIT(6)
+#define RCC_XBAR39CFGR_XBAR39STS		BIT(7)
+
+/* RCC_XBAR40CFGR register fields */
+#define RCC_XBAR40CFGR_XBAR40SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR40CFGR_XBAR40SEL_SHIFT		0
+#define RCC_XBAR40CFGR_XBAR40EN			BIT(6)
+#define RCC_XBAR40CFGR_XBAR40STS		BIT(7)
+
+/* RCC_XBAR41CFGR register fields */
+#define RCC_XBAR41CFGR_XBAR41SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR41CFGR_XBAR41SEL_SHIFT		0
+#define RCC_XBAR41CFGR_XBAR41EN			BIT(6)
+#define RCC_XBAR41CFGR_XBAR41STS		BIT(7)
+
+/* RCC_XBAR42CFGR register fields */
+#define RCC_XBAR42CFGR_XBAR42SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR42CFGR_XBAR42SEL_SHIFT		0
+#define RCC_XBAR42CFGR_XBAR42EN			BIT(6)
+#define RCC_XBAR42CFGR_XBAR42STS		BIT(7)
+
+/* RCC_XBAR43CFGR register fields */
+#define RCC_XBAR43CFGR_XBAR43SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR43CFGR_XBAR43SEL_SHIFT		0
+#define RCC_XBAR43CFGR_XBAR43EN			BIT(6)
+#define RCC_XBAR43CFGR_XBAR43STS		BIT(7)
+
+/* RCC_XBAR44CFGR register fields */
+#define RCC_XBAR44CFGR_XBAR44SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR44CFGR_XBAR44SEL_SHIFT		0
+#define RCC_XBAR44CFGR_XBAR44EN			BIT(6)
+#define RCC_XBAR44CFGR_XBAR44STS		BIT(7)
+
+/* RCC_XBAR45CFGR register fields */
+#define RCC_XBAR45CFGR_XBAR45SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR45CFGR_XBAR45SEL_SHIFT		0
+#define RCC_XBAR45CFGR_XBAR45EN			BIT(6)
+#define RCC_XBAR45CFGR_XBAR45STS		BIT(7)
+
+/* RCC_XBAR46CFGR register fields */
+#define RCC_XBAR46CFGR_XBAR46SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR46CFGR_XBAR46SEL_SHIFT		0
+#define RCC_XBAR46CFGR_XBAR46EN			BIT(6)
+#define RCC_XBAR46CFGR_XBAR46STS		BIT(7)
+
+/* RCC_XBAR47CFGR register fields */
+#define RCC_XBAR47CFGR_XBAR47SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR47CFGR_XBAR47SEL_SHIFT		0
+#define RCC_XBAR47CFGR_XBAR47EN			BIT(6)
+#define RCC_XBAR47CFGR_XBAR47STS		BIT(7)
+
+/* RCC_XBAR48CFGR register fields */
+#define RCC_XBAR48CFGR_XBAR48SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR48CFGR_XBAR48SEL_SHIFT		0
+#define RCC_XBAR48CFGR_XBAR48EN			BIT(6)
+#define RCC_XBAR48CFGR_XBAR48STS		BIT(7)
+
+/* RCC_XBAR49CFGR register fields */
+#define RCC_XBAR49CFGR_XBAR49SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR49CFGR_XBAR49SEL_SHIFT		0
+#define RCC_XBAR49CFGR_XBAR49EN			BIT(6)
+#define RCC_XBAR49CFGR_XBAR49STS		BIT(7)
+
+/* RCC_XBAR50CFGR register fields */
+#define RCC_XBAR50CFGR_XBAR50SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR50CFGR_XBAR50SEL_SHIFT		0
+#define RCC_XBAR50CFGR_XBAR50EN			BIT(6)
+#define RCC_XBAR50CFGR_XBAR50STS		BIT(7)
+
+/* RCC_XBAR51CFGR register fields */
+#define RCC_XBAR51CFGR_XBAR51SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR51CFGR_XBAR51SEL_SHIFT		0
+#define RCC_XBAR51CFGR_XBAR51EN			BIT(6)
+#define RCC_XBAR51CFGR_XBAR51STS		BIT(7)
+
+/* RCC_XBAR52CFGR register fields */
+#define RCC_XBAR52CFGR_XBAR52SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR52CFGR_XBAR52SEL_SHIFT		0
+#define RCC_XBAR52CFGR_XBAR52EN			BIT(6)
+#define RCC_XBAR52CFGR_XBAR52STS		BIT(7)
+
+/* RCC_XBAR53CFGR register fields */
+#define RCC_XBAR53CFGR_XBAR53SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR53CFGR_XBAR53SEL_SHIFT		0
+#define RCC_XBAR53CFGR_XBAR53EN			BIT(6)
+#define RCC_XBAR53CFGR_XBAR53STS		BIT(7)
+
+/* RCC_XBAR54CFGR register fields */
+#define RCC_XBAR54CFGR_XBAR54SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR54CFGR_XBAR54SEL_SHIFT		0
+#define RCC_XBAR54CFGR_XBAR54EN			BIT(6)
+#define RCC_XBAR54CFGR_XBAR54STS		BIT(7)
+
+/* RCC_XBAR55CFGR register fields */
+#define RCC_XBAR55CFGR_XBAR55SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR55CFGR_XBAR55SEL_SHIFT		0
+#define RCC_XBAR55CFGR_XBAR55EN			BIT(6)
+#define RCC_XBAR55CFGR_XBAR55STS		BIT(7)
+
+/* RCC_XBAR56CFGR register fields */
+#define RCC_XBAR56CFGR_XBAR56SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR56CFGR_XBAR56SEL_SHIFT		0
+#define RCC_XBAR56CFGR_XBAR56EN			BIT(6)
+#define RCC_XBAR56CFGR_XBAR56STS		BIT(7)
+
+/* RCC_XBAR57CFGR register fields */
+#define RCC_XBAR57CFGR_XBAR57SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR57CFGR_XBAR57SEL_SHIFT		0
+#define RCC_XBAR57CFGR_XBAR57EN			BIT(6)
+#define RCC_XBAR57CFGR_XBAR57STS		BIT(7)
+
+/* RCC_XBAR58CFGR register fields */
+#define RCC_XBAR58CFGR_XBAR58SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR58CFGR_XBAR58SEL_SHIFT		0
+#define RCC_XBAR58CFGR_XBAR58EN			BIT(6)
+#define RCC_XBAR58CFGR_XBAR58STS		BIT(7)
+
+/* RCC_XBAR59CFGR register fields */
+#define RCC_XBAR59CFGR_XBAR59SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR59CFGR_XBAR59SEL_SHIFT		0
+#define RCC_XBAR59CFGR_XBAR59EN			BIT(6)
+#define RCC_XBAR59CFGR_XBAR59STS		BIT(7)
+
+/* RCC_XBAR60CFGR register fields */
+#define RCC_XBAR60CFGR_XBAR60SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR60CFGR_XBAR60SEL_SHIFT		0
+#define RCC_XBAR60CFGR_XBAR60EN			BIT(6)
+#define RCC_XBAR60CFGR_XBAR60STS		BIT(7)
+
+/* RCC_XBAR61CFGR register fields */
+#define RCC_XBAR61CFGR_XBAR61SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR61CFGR_XBAR61SEL_SHIFT		0
+#define RCC_XBAR61CFGR_XBAR61EN			BIT(6)
+#define RCC_XBAR61CFGR_XBAR61STS		BIT(7)
+
+/* RCC_XBAR62CFGR register fields */
+#define RCC_XBAR62CFGR_XBAR62SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR62CFGR_XBAR62SEL_SHIFT		0
+#define RCC_XBAR62CFGR_XBAR62EN			BIT(6)
+#define RCC_XBAR62CFGR_XBAR62STS		BIT(7)
+
+/* RCC_XBAR63CFGR register fields */
+#define RCC_XBAR63CFGR_XBAR63SEL_MASK		GENMASK(3, 0)
+#define RCC_XBAR63CFGR_XBAR63SEL_SHIFT		0
+#define RCC_XBAR63CFGR_XBAR63EN			BIT(6)
+#define RCC_XBAR63CFGR_XBAR63STS		BIT(7)
+
+/* RCC_XBARxCFGR register fields */
+#define RCC_XBARxCFGR_XBARxSEL_MASK		GENMASK(3, 0)
+#define RCC_XBARxCFGR_XBARxSEL_SHIFT		0
+#define RCC_XBARxCFGR_XBARxEN			BIT(6)
+#define RCC_XBARxCFGR_XBARxSTS			BIT(7)
+
+/* RCC_PREDIV0CFGR register fields */
+#define RCC_PREDIV0CFGR_PREDIV0_MASK		GENMASK(9, 0)
+#define RCC_PREDIV0CFGR_PREDIV0_SHIFT		0
+
+/* RCC_PREDIV1CFGR register fields */
+#define RCC_PREDIV1CFGR_PREDIV1_MASK		GENMASK(9, 0)
+#define RCC_PREDIV1CFGR_PREDIV1_SHIFT		0
+
+/* RCC_PREDIV2CFGR register fields */
+#define RCC_PREDIV2CFGR_PREDIV2_MASK		GENMASK(9, 0)
+#define RCC_PREDIV2CFGR_PREDIV2_SHIFT		0
+
+/* RCC_PREDIV3CFGR register fields */
+#define RCC_PREDIV3CFGR_PREDIV3_MASK		GENMASK(9, 0)
+#define RCC_PREDIV3CFGR_PREDIV3_SHIFT		0
+
+/* RCC_PREDIV4CFGR register fields */
+#define RCC_PREDIV4CFGR_PREDIV4_MASK		GENMASK(9, 0)
+#define RCC_PREDIV4CFGR_PREDIV4_SHIFT		0
+
+/* RCC_PREDIV5CFGR register fields */
+#define RCC_PREDIV5CFGR_PREDIV5_MASK		GENMASK(9, 0)
+#define RCC_PREDIV5CFGR_PREDIV5_SHIFT		0
+
+/* RCC_PREDIV6CFGR register fields */
+#define RCC_PREDIV6CFGR_PREDIV6_MASK		GENMASK(9, 0)
+#define RCC_PREDIV6CFGR_PREDIV6_SHIFT		0
+
+/* RCC_PREDIV7CFGR register fields */
+#define RCC_PREDIV7CFGR_PREDIV7_MASK		GENMASK(9, 0)
+#define RCC_PREDIV7CFGR_PREDIV7_SHIFT		0
+
+/* RCC_PREDIV8CFGR register fields */
+#define RCC_PREDIV8CFGR_PREDIV8_MASK		GENMASK(9, 0)
+#define RCC_PREDIV8CFGR_PREDIV8_SHIFT		0
+
+/* RCC_PREDIV9CFGR register fields */
+#define RCC_PREDIV9CFGR_PREDIV9_MASK		GENMASK(9, 0)
+#define RCC_PREDIV9CFGR_PREDIV9_SHIFT		0
+
+/* RCC_PREDIV10CFGR register fields */
+#define RCC_PREDIV10CFGR_PREDIV10_MASK		GENMASK(9, 0)
+#define RCC_PREDIV10CFGR_PREDIV10_SHIFT		0
+
+/* RCC_PREDIV11CFGR register fields */
+#define RCC_PREDIV11CFGR_PREDIV11_MASK		GENMASK(9, 0)
+#define RCC_PREDIV11CFGR_PREDIV11_SHIFT		0
+
+/* RCC_PREDIV12CFGR register fields */
+#define RCC_PREDIV12CFGR_PREDIV12_MASK		GENMASK(9, 0)
+#define RCC_PREDIV12CFGR_PREDIV12_SHIFT		0
+
+/* RCC_PREDIV13CFGR register fields */
+#define RCC_PREDIV13CFGR_PREDIV13_MASK		GENMASK(9, 0)
+#define RCC_PREDIV13CFGR_PREDIV13_SHIFT		0
+
+/* RCC_PREDIV14CFGR register fields */
+#define RCC_PREDIV14CFGR_PREDIV14_MASK		GENMASK(9, 0)
+#define RCC_PREDIV14CFGR_PREDIV14_SHIFT		0
+
+/* RCC_PREDIV15CFGR register fields */
+#define RCC_PREDIV15CFGR_PREDIV15_MASK		GENMASK(9, 0)
+#define RCC_PREDIV15CFGR_PREDIV15_SHIFT		0
+
+/* RCC_PREDIV16CFGR register fields */
+#define RCC_PREDIV16CFGR_PREDIV16_MASK		GENMASK(9, 0)
+#define RCC_PREDIV16CFGR_PREDIV16_SHIFT		0
+
+/* RCC_PREDIV17CFGR register fields */
+#define RCC_PREDIV17CFGR_PREDIV17_MASK		GENMASK(9, 0)
+#define RCC_PREDIV17CFGR_PREDIV17_SHIFT		0
+
+/* RCC_PREDIV18CFGR register fields */
+#define RCC_PREDIV18CFGR_PREDIV18_MASK		GENMASK(9, 0)
+#define RCC_PREDIV18CFGR_PREDIV18_SHIFT		0
+
+/* RCC_PREDIV19CFGR register fields */
+#define RCC_PREDIV19CFGR_PREDIV19_MASK		GENMASK(9, 0)
+#define RCC_PREDIV19CFGR_PREDIV19_SHIFT		0
+
+/* RCC_PREDIV20CFGR register fields */
+#define RCC_PREDIV20CFGR_PREDIV20_MASK		GENMASK(9, 0)
+#define RCC_PREDIV20CFGR_PREDIV20_SHIFT		0
+
+/* RCC_PREDIV21CFGR register fields */
+#define RCC_PREDIV21CFGR_PREDIV21_MASK		GENMASK(9, 0)
+#define RCC_PREDIV21CFGR_PREDIV21_SHIFT		0
+
+/* RCC_PREDIV22CFGR register fields */
+#define RCC_PREDIV22CFGR_PREDIV22_MASK		GENMASK(9, 0)
+#define RCC_PREDIV22CFGR_PREDIV22_SHIFT		0
+
+/* RCC_PREDIV23CFGR register fields */
+#define RCC_PREDIV23CFGR_PREDIV23_MASK		GENMASK(9, 0)
+#define RCC_PREDIV23CFGR_PREDIV23_SHIFT		0
+
+/* RCC_PREDIV24CFGR register fields */
+#define RCC_PREDIV24CFGR_PREDIV24_MASK		GENMASK(9, 0)
+#define RCC_PREDIV24CFGR_PREDIV24_SHIFT		0
+
+/* RCC_PREDIV25CFGR register fields */
+#define RCC_PREDIV25CFGR_PREDIV25_MASK		GENMASK(9, 0)
+#define RCC_PREDIV25CFGR_PREDIV25_SHIFT		0
+
+/* RCC_PREDIV26CFGR register fields */
+#define RCC_PREDIV26CFGR_PREDIV26_MASK		GENMASK(9, 0)
+#define RCC_PREDIV26CFGR_PREDIV26_SHIFT		0
+
+/* RCC_PREDIV27CFGR register fields */
+#define RCC_PREDIV27CFGR_PREDIV27_MASK		GENMASK(9, 0)
+#define RCC_PREDIV27CFGR_PREDIV27_SHIFT		0
+
+/* RCC_PREDIV28CFGR register fields */
+#define RCC_PREDIV28CFGR_PREDIV28_MASK		GENMASK(9, 0)
+#define RCC_PREDIV28CFGR_PREDIV28_SHIFT		0
+
+/* RCC_PREDIV29CFGR register fields */
+#define RCC_PREDIV29CFGR_PREDIV29_MASK		GENMASK(9, 0)
+#define RCC_PREDIV29CFGR_PREDIV29_SHIFT		0
+
+/* RCC_PREDIV30CFGR register fields */
+#define RCC_PREDIV30CFGR_PREDIV30_MASK		GENMASK(9, 0)
+#define RCC_PREDIV30CFGR_PREDIV30_SHIFT		0
+
+/* RCC_PREDIV31CFGR register fields */
+#define RCC_PREDIV31CFGR_PREDIV31_MASK		GENMASK(9, 0)
+#define RCC_PREDIV31CFGR_PREDIV31_SHIFT		0
+
+/* RCC_PREDIV32CFGR register fields */
+#define RCC_PREDIV32CFGR_PREDIV32_MASK		GENMASK(9, 0)
+#define RCC_PREDIV32CFGR_PREDIV32_SHIFT		0
+
+/* RCC_PREDIV33CFGR register fields */
+#define RCC_PREDIV33CFGR_PREDIV33_MASK		GENMASK(9, 0)
+#define RCC_PREDIV33CFGR_PREDIV33_SHIFT		0
+
+/* RCC_PREDIV34CFGR register fields */
+#define RCC_PREDIV34CFGR_PREDIV34_MASK		GENMASK(9, 0)
+#define RCC_PREDIV34CFGR_PREDIV34_SHIFT		0
+
+/* RCC_PREDIV35CFGR register fields */
+#define RCC_PREDIV35CFGR_PREDIV35_MASK		GENMASK(9, 0)
+#define RCC_PREDIV35CFGR_PREDIV35_SHIFT		0
+
+/* RCC_PREDIV36CFGR register fields */
+#define RCC_PREDIV36CFGR_PREDIV36_MASK		GENMASK(9, 0)
+#define RCC_PREDIV36CFGR_PREDIV36_SHIFT		0
+
+/* RCC_PREDIV37CFGR register fields */
+#define RCC_PREDIV37CFGR_PREDIV37_MASK		GENMASK(9, 0)
+#define RCC_PREDIV37CFGR_PREDIV37_SHIFT		0
+
+/* RCC_PREDIV38CFGR register fields */
+#define RCC_PREDIV38CFGR_PREDIV38_MASK		GENMASK(9, 0)
+#define RCC_PREDIV38CFGR_PREDIV38_SHIFT		0
+
+/* RCC_PREDIV39CFGR register fields */
+#define RCC_PREDIV39CFGR_PREDIV39_MASK		GENMASK(9, 0)
+#define RCC_PREDIV39CFGR_PREDIV39_SHIFT		0
+
+/* RCC_PREDIV40CFGR register fields */
+#define RCC_PREDIV40CFGR_PREDIV40_MASK		GENMASK(9, 0)
+#define RCC_PREDIV40CFGR_PREDIV40_SHIFT		0
+
+/* RCC_PREDIV41CFGR register fields */
+#define RCC_PREDIV41CFGR_PREDIV41_MASK		GENMASK(9, 0)
+#define RCC_PREDIV41CFGR_PREDIV41_SHIFT		0
+
+/* RCC_PREDIV42CFGR register fields */
+#define RCC_PREDIV42CFGR_PREDIV42_MASK		GENMASK(9, 0)
+#define RCC_PREDIV42CFGR_PREDIV42_SHIFT		0
+
+/* RCC_PREDIV43CFGR register fields */
+#define RCC_PREDIV43CFGR_PREDIV43_MASK		GENMASK(9, 0)
+#define RCC_PREDIV43CFGR_PREDIV43_SHIFT		0
+
+/* RCC_PREDIV44CFGR register fields */
+#define RCC_PREDIV44CFGR_PREDIV44_MASK		GENMASK(9, 0)
+#define RCC_PREDIV44CFGR_PREDIV44_SHIFT		0
+
+/* RCC_PREDIV45CFGR register fields */
+#define RCC_PREDIV45CFGR_PREDIV45_MASK		GENMASK(9, 0)
+#define RCC_PREDIV45CFGR_PREDIV45_SHIFT		0
+
+/* RCC_PREDIV46CFGR register fields */
+#define RCC_PREDIV46CFGR_PREDIV46_MASK		GENMASK(9, 0)
+#define RCC_PREDIV46CFGR_PREDIV46_SHIFT		0
+
+/* RCC_PREDIV47CFGR register fields */
+#define RCC_PREDIV47CFGR_PREDIV47_MASK		GENMASK(9, 0)
+#define RCC_PREDIV47CFGR_PREDIV47_SHIFT		0
+
+/* RCC_PREDIV48CFGR register fields */
+#define RCC_PREDIV48CFGR_PREDIV48_MASK		GENMASK(9, 0)
+#define RCC_PREDIV48CFGR_PREDIV48_SHIFT		0
+
+/* RCC_PREDIV49CFGR register fields */
+#define RCC_PREDIV49CFGR_PREDIV49_MASK		GENMASK(9, 0)
+#define RCC_PREDIV49CFGR_PREDIV49_SHIFT		0
+
+/* RCC_PREDIV50CFGR register fields */
+#define RCC_PREDIV50CFGR_PREDIV50_MASK		GENMASK(9, 0)
+#define RCC_PREDIV50CFGR_PREDIV50_SHIFT		0
+
+/* RCC_PREDIV51CFGR register fields */
+#define RCC_PREDIV51CFGR_PREDIV51_MASK		GENMASK(9, 0)
+#define RCC_PREDIV51CFGR_PREDIV51_SHIFT		0
+
+/* RCC_PREDIV52CFGR register fields */
+#define RCC_PREDIV52CFGR_PREDIV52_MASK		GENMASK(9, 0)
+#define RCC_PREDIV52CFGR_PREDIV52_SHIFT		0
+
+/* RCC_PREDIV53CFGR register fields */
+#define RCC_PREDIV53CFGR_PREDIV53_MASK		GENMASK(9, 0)
+#define RCC_PREDIV53CFGR_PREDIV53_SHIFT		0
+
+/* RCC_PREDIV54CFGR register fields */
+#define RCC_PREDIV54CFGR_PREDIV54_MASK		GENMASK(9, 0)
+#define RCC_PREDIV54CFGR_PREDIV54_SHIFT		0
+
+/* RCC_PREDIV55CFGR register fields */
+#define RCC_PREDIV55CFGR_PREDIV55_MASK		GENMASK(9, 0)
+#define RCC_PREDIV55CFGR_PREDIV55_SHIFT		0
+
+/* RCC_PREDIV56CFGR register fields */
+#define RCC_PREDIV56CFGR_PREDIV56_MASK		GENMASK(9, 0)
+#define RCC_PREDIV56CFGR_PREDIV56_SHIFT		0
+
+/* RCC_PREDIV57CFGR register fields */
+#define RCC_PREDIV57CFGR_PREDIV57_MASK		GENMASK(9, 0)
+#define RCC_PREDIV57CFGR_PREDIV57_SHIFT		0
+
+/* RCC_PREDIV58CFGR register fields */
+#define RCC_PREDIV58CFGR_PREDIV58_MASK		GENMASK(9, 0)
+#define RCC_PREDIV58CFGR_PREDIV58_SHIFT		0
+
+/* RCC_PREDIV59CFGR register fields */
+#define RCC_PREDIV59CFGR_PREDIV59_MASK		GENMASK(9, 0)
+#define RCC_PREDIV59CFGR_PREDIV59_SHIFT		0
+
+/* RCC_PREDIV60CFGR register fields */
+#define RCC_PREDIV60CFGR_PREDIV60_MASK		GENMASK(9, 0)
+#define RCC_PREDIV60CFGR_PREDIV60_SHIFT		0
+
+/* RCC_PREDIV61CFGR register fields */
+#define RCC_PREDIV61CFGR_PREDIV61_MASK		GENMASK(9, 0)
+#define RCC_PREDIV61CFGR_PREDIV61_SHIFT		0
+
+/* RCC_PREDIV62CFGR register fields */
+#define RCC_PREDIV62CFGR_PREDIV62_MASK		GENMASK(9, 0)
+#define RCC_PREDIV62CFGR_PREDIV62_SHIFT		0
+
+/* RCC_PREDIV63CFGR register fields */
+#define RCC_PREDIV63CFGR_PREDIV63_MASK		GENMASK(9, 0)
+#define RCC_PREDIV63CFGR_PREDIV63_SHIFT		0
+
+/* RCC_PREDIVxCFGR register fields */
+#define RCC_PREDIVxCFGR_PREDIVx_MASK		GENMASK(9, 0)
+#define RCC_PREDIVxCFGR_PREDIVx_SHIFT		0
+
+/* RCC_FINDIV0CFGR register fields */
+#define RCC_FINDIV0CFGR_FINDIV0_MASK		GENMASK(5, 0)
+#define RCC_FINDIV0CFGR_FINDIV0_SHIFT		0
+#define RCC_FINDIV0CFGR_FINDIV0EN		BIT(6)
+
+/* RCC_FINDIV1CFGR register fields */
+#define RCC_FINDIV1CFGR_FINDIV1_MASK		GENMASK(5, 0)
+#define RCC_FINDIV1CFGR_FINDIV1_SHIFT		0
+#define RCC_FINDIV1CFGR_FINDIV1EN		BIT(6)
+
+/* RCC_FINDIV2CFGR register fields */
+#define RCC_FINDIV2CFGR_FINDIV2_MASK		GENMASK(5, 0)
+#define RCC_FINDIV2CFGR_FINDIV2_SHIFT		0
+#define RCC_FINDIV2CFGR_FINDIV2EN		BIT(6)
+
+/* RCC_FINDIV3CFGR register fields */
+#define RCC_FINDIV3CFGR_FINDIV3_MASK		GENMASK(5, 0)
+#define RCC_FINDIV3CFGR_FINDIV3_SHIFT		0
+#define RCC_FINDIV3CFGR_FINDIV3EN		BIT(6)
+
+/* RCC_FINDIV4CFGR register fields */
+#define RCC_FINDIV4CFGR_FINDIV4_MASK		GENMASK(5, 0)
+#define RCC_FINDIV4CFGR_FINDIV4_SHIFT		0
+#define RCC_FINDIV4CFGR_FINDIV4EN		BIT(6)
+
+/* RCC_FINDIV5CFGR register fields */
+#define RCC_FINDIV5CFGR_FINDIV5_MASK		GENMASK(5, 0)
+#define RCC_FINDIV5CFGR_FINDIV5_SHIFT		0
+#define RCC_FINDIV5CFGR_FINDIV5EN		BIT(6)
+
+/* RCC_FINDIV6CFGR register fields */
+#define RCC_FINDIV6CFGR_FINDIV6_MASK		GENMASK(5, 0)
+#define RCC_FINDIV6CFGR_FINDIV6_SHIFT		0
+#define RCC_FINDIV6CFGR_FINDIV6EN		BIT(6)
+
+/* RCC_FINDIV7CFGR register fields */
+#define RCC_FINDIV7CFGR_FINDIV7_MASK		GENMASK(5, 0)
+#define RCC_FINDIV7CFGR_FINDIV7_SHIFT		0
+#define RCC_FINDIV7CFGR_FINDIV7EN		BIT(6)
+
+/* RCC_FINDIV8CFGR register fields */
+#define RCC_FINDIV8CFGR_FINDIV8_MASK		GENMASK(5, 0)
+#define RCC_FINDIV8CFGR_FINDIV8_SHIFT		0
+#define RCC_FINDIV8CFGR_FINDIV8EN		BIT(6)
+
+/* RCC_FINDIV9CFGR register fields */
+#define RCC_FINDIV9CFGR_FINDIV9_MASK		GENMASK(5, 0)
+#define RCC_FINDIV9CFGR_FINDIV9_SHIFT		0
+#define RCC_FINDIV9CFGR_FINDIV9EN		BIT(6)
+
+/* RCC_FINDIV10CFGR register fields */
+#define RCC_FINDIV10CFGR_FINDIV10_MASK		GENMASK(5, 0)
+#define RCC_FINDIV10CFGR_FINDIV10_SHIFT		0
+#define RCC_FINDIV10CFGR_FINDIV10EN		BIT(6)
+
+/* RCC_FINDIV11CFGR register fields */
+#define RCC_FINDIV11CFGR_FINDIV11_MASK		GENMASK(5, 0)
+#define RCC_FINDIV11CFGR_FINDIV11_SHIFT		0
+#define RCC_FINDIV11CFGR_FINDIV11EN		BIT(6)
+
+/* RCC_FINDIV12CFGR register fields */
+#define RCC_FINDIV12CFGR_FINDIV12_MASK		GENMASK(5, 0)
+#define RCC_FINDIV12CFGR_FINDIV12_SHIFT		0
+#define RCC_FINDIV12CFGR_FINDIV12EN		BIT(6)
+
+/* RCC_FINDIV13CFGR register fields */
+#define RCC_FINDIV13CFGR_FINDIV13_MASK		GENMASK(5, 0)
+#define RCC_FINDIV13CFGR_FINDIV13_SHIFT		0
+#define RCC_FINDIV13CFGR_FINDIV13EN		BIT(6)
+
+/* RCC_FINDIV14CFGR register fields */
+#define RCC_FINDIV14CFGR_FINDIV14_MASK		GENMASK(5, 0)
+#define RCC_FINDIV14CFGR_FINDIV14_SHIFT		0
+#define RCC_FINDIV14CFGR_FINDIV14EN		BIT(6)
+
+/* RCC_FINDIV15CFGR register fields */
+#define RCC_FINDIV15CFGR_FINDIV15_MASK		GENMASK(5, 0)
+#define RCC_FINDIV15CFGR_FINDIV15_SHIFT		0
+#define RCC_FINDIV15CFGR_FINDIV15EN		BIT(6)
+
+/* RCC_FINDIV16CFGR register fields */
+#define RCC_FINDIV16CFGR_FINDIV16_MASK		GENMASK(5, 0)
+#define RCC_FINDIV16CFGR_FINDIV16_SHIFT		0
+#define RCC_FINDIV16CFGR_FINDIV16EN		BIT(6)
+
+/* RCC_FINDIV17CFGR register fields */
+#define RCC_FINDIV17CFGR_FINDIV17_MASK		GENMASK(5, 0)
+#define RCC_FINDIV17CFGR_FINDIV17_SHIFT		0
+#define RCC_FINDIV17CFGR_FINDIV17EN		BIT(6)
+
+/* RCC_FINDIV18CFGR register fields */
+#define RCC_FINDIV18CFGR_FINDIV18_MASK		GENMASK(5, 0)
+#define RCC_FINDIV18CFGR_FINDIV18_SHIFT		0
+#define RCC_FINDIV18CFGR_FINDIV18EN		BIT(6)
+
+/* RCC_FINDIV19CFGR register fields */
+#define RCC_FINDIV19CFGR_FINDIV19_MASK		GENMASK(5, 0)
+#define RCC_FINDIV19CFGR_FINDIV19_SHIFT		0
+#define RCC_FINDIV19CFGR_FINDIV19EN		BIT(6)
+
+/* RCC_FINDIV20CFGR register fields */
+#define RCC_FINDIV20CFGR_FINDIV20_MASK		GENMASK(5, 0)
+#define RCC_FINDIV20CFGR_FINDIV20_SHIFT		0
+#define RCC_FINDIV20CFGR_FINDIV20EN		BIT(6)
+
+/* RCC_FINDIV21CFGR register fields */
+#define RCC_FINDIV21CFGR_FINDIV21_MASK		GENMASK(5, 0)
+#define RCC_FINDIV21CFGR_FINDIV21_SHIFT		0
+#define RCC_FINDIV21CFGR_FINDIV21EN		BIT(6)
+
+/* RCC_FINDIV22CFGR register fields */
+#define RCC_FINDIV22CFGR_FINDIV22_MASK		GENMASK(5, 0)
+#define RCC_FINDIV22CFGR_FINDIV22_SHIFT		0
+#define RCC_FINDIV22CFGR_FINDIV22EN		BIT(6)
+
+/* RCC_FINDIV23CFGR register fields */
+#define RCC_FINDIV23CFGR_FINDIV23_MASK		GENMASK(5, 0)
+#define RCC_FINDIV23CFGR_FINDIV23_SHIFT		0
+#define RCC_FINDIV23CFGR_FINDIV23EN		BIT(6)
+
+/* RCC_FINDIV24CFGR register fields */
+#define RCC_FINDIV24CFGR_FINDIV24_MASK		GENMASK(5, 0)
+#define RCC_FINDIV24CFGR_FINDIV24_SHIFT		0
+#define RCC_FINDIV24CFGR_FINDIV24EN		BIT(6)
+
+/* RCC_FINDIV25CFGR register fields */
+#define RCC_FINDIV25CFGR_FINDIV25_MASK		GENMASK(5, 0)
+#define RCC_FINDIV25CFGR_FINDIV25_SHIFT		0
+#define RCC_FINDIV25CFGR_FINDIV25EN		BIT(6)
+
+/* RCC_FINDIV26CFGR register fields */
+#define RCC_FINDIV26CFGR_FINDIV26_MASK		GENMASK(5, 0)
+#define RCC_FINDIV26CFGR_FINDIV26_SHIFT		0
+#define RCC_FINDIV26CFGR_FINDIV26EN		BIT(6)
+
+/* RCC_FINDIV27CFGR register fields */
+#define RCC_FINDIV27CFGR_FINDIV27_MASK		GENMASK(5, 0)
+#define RCC_FINDIV27CFGR_FINDIV27_SHIFT		0
+#define RCC_FINDIV27CFGR_FINDIV27EN		BIT(6)
+
+/* RCC_FINDIV28CFGR register fields */
+#define RCC_FINDIV28CFGR_FINDIV28_MASK		GENMASK(5, 0)
+#define RCC_FINDIV28CFGR_FINDIV28_SHIFT		0
+#define RCC_FINDIV28CFGR_FINDIV28EN		BIT(6)
+
+/* RCC_FINDIV29CFGR register fields */
+#define RCC_FINDIV29CFGR_FINDIV29_MASK		GENMASK(5, 0)
+#define RCC_FINDIV29CFGR_FINDIV29_SHIFT		0
+#define RCC_FINDIV29CFGR_FINDIV29EN		BIT(6)
+
+/* RCC_FINDIV30CFGR register fields */
+#define RCC_FINDIV30CFGR_FINDIV30_MASK		GENMASK(5, 0)
+#define RCC_FINDIV30CFGR_FINDIV30_SHIFT		0
+#define RCC_FINDIV30CFGR_FINDIV30EN		BIT(6)
+
+/* RCC_FINDIV31CFGR register fields */
+#define RCC_FINDIV31CFGR_FINDIV31_MASK		GENMASK(5, 0)
+#define RCC_FINDIV31CFGR_FINDIV31_SHIFT		0
+#define RCC_FINDIV31CFGR_FINDIV31EN		BIT(6)
+
+/* RCC_FINDIV32CFGR register fields */
+#define RCC_FINDIV32CFGR_FINDIV32_MASK		GENMASK(5, 0)
+#define RCC_FINDIV32CFGR_FINDIV32_SHIFT		0
+#define RCC_FINDIV32CFGR_FINDIV32EN		BIT(6)
+
+/* RCC_FINDIV33CFGR register fields */
+#define RCC_FINDIV33CFGR_FINDIV33_MASK		GENMASK(5, 0)
+#define RCC_FINDIV33CFGR_FINDIV33_SHIFT		0
+#define RCC_FINDIV33CFGR_FINDIV33EN		BIT(6)
+
+/* RCC_FINDIV34CFGR register fields */
+#define RCC_FINDIV34CFGR_FINDIV34_MASK		GENMASK(5, 0)
+#define RCC_FINDIV34CFGR_FINDIV34_SHIFT		0
+#define RCC_FINDIV34CFGR_FINDIV34EN		BIT(6)
+
+/* RCC_FINDIV35CFGR register fields */
+#define RCC_FINDIV35CFGR_FINDIV35_MASK		GENMASK(5, 0)
+#define RCC_FINDIV35CFGR_FINDIV35_SHIFT		0
+#define RCC_FINDIV35CFGR_FINDIV35EN		BIT(6)
+
+/* RCC_FINDIV36CFGR register fields */
+#define RCC_FINDIV36CFGR_FINDIV36_MASK		GENMASK(5, 0)
+#define RCC_FINDIV36CFGR_FINDIV36_SHIFT		0
+#define RCC_FINDIV36CFGR_FINDIV36EN		BIT(6)
+
+/* RCC_FINDIV37CFGR register fields */
+#define RCC_FINDIV37CFGR_FINDIV37_MASK		GENMASK(5, 0)
+#define RCC_FINDIV37CFGR_FINDIV37_SHIFT		0
+#define RCC_FINDIV37CFGR_FINDIV37EN		BIT(6)
+
+/* RCC_FINDIV38CFGR register fields */
+#define RCC_FINDIV38CFGR_FINDIV38_MASK		GENMASK(5, 0)
+#define RCC_FINDIV38CFGR_FINDIV38_SHIFT		0
+#define RCC_FINDIV38CFGR_FINDIV38EN		BIT(6)
+
+/* RCC_FINDIV39CFGR register fields */
+#define RCC_FINDIV39CFGR_FINDIV39_MASK		GENMASK(5, 0)
+#define RCC_FINDIV39CFGR_FINDIV39_SHIFT		0
+#define RCC_FINDIV39CFGR_FINDIV39EN		BIT(6)
+
+/* RCC_FINDIV40CFGR register fields */
+#define RCC_FINDIV40CFGR_FINDIV40_MASK		GENMASK(5, 0)
+#define RCC_FINDIV40CFGR_FINDIV40_SHIFT		0
+#define RCC_FINDIV40CFGR_FINDIV40EN		BIT(6)
+
+/* RCC_FINDIV41CFGR register fields */
+#define RCC_FINDIV41CFGR_FINDIV41_MASK		GENMASK(5, 0)
+#define RCC_FINDIV41CFGR_FINDIV41_SHIFT		0
+#define RCC_FINDIV41CFGR_FINDIV41EN		BIT(6)
+
+/* RCC_FINDIV42CFGR register fields */
+#define RCC_FINDIV42CFGR_FINDIV42_MASK		GENMASK(5, 0)
+#define RCC_FINDIV42CFGR_FINDIV42_SHIFT		0
+#define RCC_FINDIV42CFGR_FINDIV42EN		BIT(6)
+
+/* RCC_FINDIV43CFGR register fields */
+#define RCC_FINDIV43CFGR_FINDIV43_MASK		GENMASK(5, 0)
+#define RCC_FINDIV43CFGR_FINDIV43_SHIFT		0
+#define RCC_FINDIV43CFGR_FINDIV43EN		BIT(6)
+
+/* RCC_FINDIV44CFGR register fields */
+#define RCC_FINDIV44CFGR_FINDIV44_MASK		GENMASK(5, 0)
+#define RCC_FINDIV44CFGR_FINDIV44_SHIFT		0
+#define RCC_FINDIV44CFGR_FINDIV44EN		BIT(6)
+
+/* RCC_FINDIV45CFGR register fields */
+#define RCC_FINDIV45CFGR_FINDIV45_MASK		GENMASK(5, 0)
+#define RCC_FINDIV45CFGR_FINDIV45_SHIFT		0
+#define RCC_FINDIV45CFGR_FINDIV45EN		BIT(6)
+
+/* RCC_FINDIV46CFGR register fields */
+#define RCC_FINDIV46CFGR_FINDIV46_MASK		GENMASK(5, 0)
+#define RCC_FINDIV46CFGR_FINDIV46_SHIFT		0
+#define RCC_FINDIV46CFGR_FINDIV46EN		BIT(6)
+
+/* RCC_FINDIV47CFGR register fields */
+#define RCC_FINDIV47CFGR_FINDIV47_MASK		GENMASK(5, 0)
+#define RCC_FINDIV47CFGR_FINDIV47_SHIFT		0
+#define RCC_FINDIV47CFGR_FINDIV47EN		BIT(6)
+
+/* RCC_FINDIV48CFGR register fields */
+#define RCC_FINDIV48CFGR_FINDIV48_MASK		GENMASK(5, 0)
+#define RCC_FINDIV48CFGR_FINDIV48_SHIFT		0
+#define RCC_FINDIV48CFGR_FINDIV48EN		BIT(6)
+
+/* RCC_FINDIV49CFGR register fields */
+#define RCC_FINDIV49CFGR_FINDIV49_MASK		GENMASK(5, 0)
+#define RCC_FINDIV49CFGR_FINDIV49_SHIFT		0
+#define RCC_FINDIV49CFGR_FINDIV49EN		BIT(6)
+
+/* RCC_FINDIV50CFGR register fields */
+#define RCC_FINDIV50CFGR_FINDIV50_MASK		GENMASK(5, 0)
+#define RCC_FINDIV50CFGR_FINDIV50_SHIFT		0
+#define RCC_FINDIV50CFGR_FINDIV50EN		BIT(6)
+
+/* RCC_FINDIV51CFGR register fields */
+#define RCC_FINDIV51CFGR_FINDIV51_MASK		GENMASK(5, 0)
+#define RCC_FINDIV51CFGR_FINDIV51_SHIFT		0
+#define RCC_FINDIV51CFGR_FINDIV51EN		BIT(6)
+
+/* RCC_FINDIV52CFGR register fields */
+#define RCC_FINDIV52CFGR_FINDIV52_MASK		GENMASK(5, 0)
+#define RCC_FINDIV52CFGR_FINDIV52_SHIFT		0
+#define RCC_FINDIV52CFGR_FINDIV52EN		BIT(6)
+
+/* RCC_FINDIV53CFGR register fields */
+#define RCC_FINDIV53CFGR_FINDIV53_MASK		GENMASK(5, 0)
+#define RCC_FINDIV53CFGR_FINDIV53_SHIFT		0
+#define RCC_FINDIV53CFGR_FINDIV53EN		BIT(6)
+
+/* RCC_FINDIV54CFGR register fields */
+#define RCC_FINDIV54CFGR_FINDIV54_MASK		GENMASK(5, 0)
+#define RCC_FINDIV54CFGR_FINDIV54_SHIFT		0
+#define RCC_FINDIV54CFGR_FINDIV54EN		BIT(6)
+
+/* RCC_FINDIV55CFGR register fields */
+#define RCC_FINDIV55CFGR_FINDIV55_MASK		GENMASK(5, 0)
+#define RCC_FINDIV55CFGR_FINDIV55_SHIFT		0
+#define RCC_FINDIV55CFGR_FINDIV55EN		BIT(6)
+
+/* RCC_FINDIV56CFGR register fields */
+#define RCC_FINDIV56CFGR_FINDIV56_MASK		GENMASK(5, 0)
+#define RCC_FINDIV56CFGR_FINDIV56_SHIFT		0
+#define RCC_FINDIV56CFGR_FINDIV56EN		BIT(6)
+
+/* RCC_FINDIV57CFGR register fields */
+#define RCC_FINDIV57CFGR_FINDIV57_MASK		GENMASK(5, 0)
+#define RCC_FINDIV57CFGR_FINDIV57_SHIFT		0
+#define RCC_FINDIV57CFGR_FINDIV57EN		BIT(6)
+
+/* RCC_FINDIV58CFGR register fields */
+#define RCC_FINDIV58CFGR_FINDIV58_MASK		GENMASK(5, 0)
+#define RCC_FINDIV58CFGR_FINDIV58_SHIFT		0
+#define RCC_FINDIV58CFGR_FINDIV58EN		BIT(6)
+
+/* RCC_FINDIV59CFGR register fields */
+#define RCC_FINDIV59CFGR_FINDIV59_MASK		GENMASK(5, 0)
+#define RCC_FINDIV59CFGR_FINDIV59_SHIFT		0
+#define RCC_FINDIV59CFGR_FINDIV59EN		BIT(6)
+
+/* RCC_FINDIV60CFGR register fields */
+#define RCC_FINDIV60CFGR_FINDIV60_MASK		GENMASK(5, 0)
+#define RCC_FINDIV60CFGR_FINDIV60_SHIFT		0
+#define RCC_FINDIV60CFGR_FINDIV60EN		BIT(6)
+
+/* RCC_FINDIV61CFGR register fields */
+#define RCC_FINDIV61CFGR_FINDIV61_MASK		GENMASK(5, 0)
+#define RCC_FINDIV61CFGR_FINDIV61_SHIFT		0
+#define RCC_FINDIV61CFGR_FINDIV61EN		BIT(6)
+
+/* RCC_FINDIV62CFGR register fields */
+#define RCC_FINDIV62CFGR_FINDIV62_MASK		GENMASK(5, 0)
+#define RCC_FINDIV62CFGR_FINDIV62_SHIFT		0
+#define RCC_FINDIV62CFGR_FINDIV62EN		BIT(6)
+
+/* RCC_FINDIV63CFGR register fields */
+#define RCC_FINDIV63CFGR_FINDIV63_MASK		GENMASK(5, 0)
+#define RCC_FINDIV63CFGR_FINDIV63_SHIFT		0
+#define RCC_FINDIV63CFGR_FINDIV63EN		BIT(6)
+
+/* RCC_FINDIVxCFGR register fields */
+#define RCC_FINDIVxCFGR_FINDIVx_MASK		GENMASK(5, 0)
+#define RCC_FINDIVxCFGR_FINDIVx_SHIFT		0
+#define RCC_FINDIVxCFGR_FINDIVxEN		BIT(6)
+
+/* RCC_FCALCOBS0CFGR register fields */
+#define RCC_FCALCOBS0CFGR_CKINTSEL_MASK		GENMASK(7, 0)
+#define RCC_FCALCOBS0CFGR_CKINTSEL_SHIFT	0
+#define RCC_FCALCOBS0CFGR_CKEXTSEL_MASK		GENMASK(10, 8)
+#define RCC_FCALCOBS0CFGR_CKEXTSEL_SHIFT	8
+#define RCC_FCALCOBS0CFGR_FCALCCKEXTSEL		BIT(15)
+#define RCC_FCALCOBS0CFGR_CKOBSEXTSEL		BIT(16)
+#define RCC_FCALCOBS0CFGR_FCALCCKINV		BIT(17)
+#define RCC_FCALCOBS0CFGR_CKOBSINV		BIT(18)
+#define RCC_FCALCOBS0CFGR_CKOBSDIV_MASK		GENMASK(24, 22)
+#define RCC_FCALCOBS0CFGR_CKOBSDIV_SHIFT	22
+#define RCC_FCALCOBS0CFGR_FCALCCKEN		BIT(25)
+#define RCC_FCALCOBS0CFGR_CKOBSEN		BIT(26)
+
+/* RCC_FCALCOBS1CFGR register fields */
+#define RCC_FCALCOBS1CFGR_CKINTSEL_MASK		GENMASK(7, 0)
+#define RCC_FCALCOBS1CFGR_CKINTSEL_SHIFT	0
+#define RCC_FCALCOBS1CFGR_CKEXTSEL_MASK		GENMASK(10, 8)
+#define RCC_FCALCOBS1CFGR_CKEXTSEL_SHIFT	8
+#define RCC_FCALCOBS1CFGR_CKOBSEXTSEL		BIT(16)
+#define RCC_FCALCOBS1CFGR_CKOBSINV		BIT(18)
+#define RCC_FCALCOBS1CFGR_CKOBSDIV_MASK		GENMASK(24, 22)
+#define RCC_FCALCOBS1CFGR_CKOBSDIV_SHIFT	22
+#define RCC_FCALCOBS1CFGR_CKOBSEN		BIT(26)
+#define RCC_FCALCOBS1CFGR_FCALCRSTN		BIT(27)
+
+/* RCC_FCALCREFCFGR register fields */
+#define RCC_FCALCREFCFGR_FCALCREFCKSEL_MASK	GENMASK(2, 0)
+#define RCC_FCALCREFCFGR_FCALCREFCKSEL_SHIFT	0
+
+/* RCC_FCALCCR1 register fields */
+#define RCC_FCALCCR1_FCALCRUN			BIT(0)
+
+/* RCC_FCALCCR2 register fields */
+#define RCC_FCALCCR2_FCALCMD_MASK		GENMASK(4, 3)
+#define RCC_FCALCCR2_FCALCMD_SHIFT		3
+#define RCC_FCALCCR2_FCALCTWC_MASK		GENMASK(14, 11)
+#define RCC_FCALCCR2_FCALCTWC_SHIFT		11
+#define RCC_FCALCCR2_FCALCTYP_MASK		GENMASK(21, 17)
+#define RCC_FCALCCR2_FCALCTYP_SHIFT		17
+
+/* RCC_FCALCSR register fields */
+#define RCC_FCALCSR_FVAL_MASK			GENMASK(16, 0)
+#define RCC_FCALCSR_FVAL_SHIFT			0
+#define RCC_FCALCSR_FCALCSTS			BIT(19)
+
+/* RCC_PLL4CFGR1 register fields */
+#define RCC_PLL4CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL4CFGR1_PLLEN			BIT(8)
+#define RCC_PLL4CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL4CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL4CFGR2 register fields */
+#define RCC_PLL4CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL4CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL4CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL4CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL4CFGR3 register fields */
+#define RCC_PLL4CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL4CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL4CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL4CFGR3_DACEN			BIT(25)
+#define RCC_PLL4CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL4CFGR4 register fields */
+#define RCC_PLL4CFGR4_DSMEN			BIT(8)
+#define RCC_PLL4CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL4CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL4CFGR5 register fields */
+#define RCC_PLL4CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL4CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL4CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL4CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL4CFGR6 register fields */
+#define RCC_PLL4CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL4CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL4CFGR7 register fields */
+#define RCC_PLL4CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL4CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLL5CFGR1 register fields */
+#define RCC_PLL5CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL5CFGR1_PLLEN			BIT(8)
+#define RCC_PLL5CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL5CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL5CFGR2 register fields */
+#define RCC_PLL5CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL5CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL5CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL5CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL5CFGR3 register fields */
+#define RCC_PLL5CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL5CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL5CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL5CFGR3_DACEN			BIT(25)
+#define RCC_PLL5CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL5CFGR4 register fields */
+#define RCC_PLL5CFGR4_DSMEN			BIT(8)
+#define RCC_PLL5CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL5CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL5CFGR5 register fields */
+#define RCC_PLL5CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL5CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL5CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL5CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL5CFGR6 register fields */
+#define RCC_PLL5CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL5CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL5CFGR7 register fields */
+#define RCC_PLL5CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL5CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLL6CFGR1 register fields */
+#define RCC_PLL6CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL6CFGR1_PLLEN			BIT(8)
+#define RCC_PLL6CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL6CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL6CFGR2 register fields */
+#define RCC_PLL6CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL6CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL6CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL6CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL6CFGR3 register fields */
+#define RCC_PLL6CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL6CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL6CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL6CFGR3_DACEN			BIT(25)
+#define RCC_PLL6CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL6CFGR4 register fields */
+#define RCC_PLL6CFGR4_DSMEN			BIT(8)
+#define RCC_PLL6CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL6CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL6CFGR5 register fields */
+#define RCC_PLL6CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL6CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL6CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL6CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL6CFGR6 register fields */
+#define RCC_PLL6CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL6CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL6CFGR7 register fields */
+#define RCC_PLL6CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL6CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLL7CFGR1 register fields */
+#define RCC_PLL7CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL7CFGR1_PLLEN			BIT(8)
+#define RCC_PLL7CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL7CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL7CFGR2 register fields */
+#define RCC_PLL7CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL7CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL7CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL7CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL7CFGR3 register fields */
+#define RCC_PLL7CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL7CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL7CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL7CFGR3_DACEN			BIT(25)
+#define RCC_PLL7CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL7CFGR4 register fields */
+#define RCC_PLL7CFGR4_DSMEN			BIT(8)
+#define RCC_PLL7CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL7CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL7CFGR5 register fields */
+#define RCC_PLL7CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL7CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL7CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL7CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL7CFGR6 register fields */
+#define RCC_PLL7CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL7CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL7CFGR7 register fields */
+#define RCC_PLL7CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL7CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLL8CFGR1 register fields */
+#define RCC_PLL8CFGR1_SSMODRST			BIT(0)
+#define RCC_PLL8CFGR1_PLLEN			BIT(8)
+#define RCC_PLL8CFGR1_PLLRDY			BIT(24)
+#define RCC_PLL8CFGR1_CKREFST			BIT(28)
+
+/* RCC_PLL8CFGR2 register fields */
+#define RCC_PLL8CFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLL8CFGR2_FREFDIV_SHIFT		0
+#define RCC_PLL8CFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLL8CFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLL8CFGR3 register fields */
+#define RCC_PLL8CFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLL8CFGR3_FRACIN_SHIFT		0
+#define RCC_PLL8CFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLL8CFGR3_DACEN			BIT(25)
+#define RCC_PLL8CFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLL8CFGR4 register fields */
+#define RCC_PLL8CFGR4_DSMEN			BIT(8)
+#define RCC_PLL8CFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLL8CFGR4_BYPASS			BIT(10)
+
+/* RCC_PLL8CFGR5 register fields */
+#define RCC_PLL8CFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLL8CFGR5_DIVVAL_SHIFT		0
+#define RCC_PLL8CFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLL8CFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLL8CFGR6 register fields */
+#define RCC_PLL8CFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLL8CFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLL8CFGR7 register fields */
+#define RCC_PLL8CFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLL8CFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_PLLxCFGR1 register fields */
+#define RCC_PLLxCFGR1_SSMODRST			BIT(0)
+#define RCC_PLLxCFGR1_PLLEN			BIT(8)
+#define RCC_PLLxCFGR1_PLLRDY			BIT(24)
+#define RCC_PLLxCFGR1_CKREFST			BIT(28)
+
+/* RCC_PLLxCFGR2 register fields */
+#define RCC_PLLxCFGR2_FREFDIV_MASK		GENMASK(5, 0)
+#define RCC_PLLxCFGR2_FREFDIV_SHIFT		0
+#define RCC_PLLxCFGR2_FBDIV_MASK		GENMASK(27, 16)
+#define RCC_PLLxCFGR2_FBDIV_SHIFT		16
+
+/* RCC_PLLxCFGR3 register fields */
+#define RCC_PLLxCFGR3_FRACIN_MASK		GENMASK(23, 0)
+#define RCC_PLLxCFGR3_FRACIN_SHIFT		0
+#define RCC_PLLxCFGR3_DOWNSPREAD		BIT(24)
+#define RCC_PLLxCFGR3_DACEN			BIT(25)
+#define RCC_PLLxCFGR3_SSCGDIS			BIT(26)
+
+/* RCC_PLLxCFGR4 register fields */
+#define RCC_PLLxCFGR4_DSMEN			BIT(8)
+#define RCC_PLLxCFGR4_FOUTPOSTDIVEN		BIT(9)
+#define RCC_PLLxCFGR4_BYPASS			BIT(10)
+
+/* RCC_PLLxCFGR5 register fields */
+#define RCC_PLLxCFGR5_DIVVAL_MASK		GENMASK(3, 0)
+#define RCC_PLLxCFGR5_DIVVAL_SHIFT		0
+#define RCC_PLLxCFGR5_SPREAD_MASK		GENMASK(20, 16)
+#define RCC_PLLxCFGR5_SPREAD_SHIFT		16
+
+/* RCC_PLLxCFGR6 register fields */
+#define RCC_PLLxCFGR6_POSTDIV1_MASK		GENMASK(2, 0)
+#define RCC_PLLxCFGR6_POSTDIV1_SHIFT		0
+
+/* RCC_PLLxCFGR7 register fields */
+#define RCC_PLLxCFGR7_POSTDIV2_MASK		GENMASK(2, 0)
+#define RCC_PLLxCFGR7_POSTDIV2_SHIFT		0
+
+/* RCC_VERR register fields */
+#define RCC_VERR_MINREV_MASK			GENMASK(3, 0)
+#define RCC_VERR_MINREV_SHIFT			0
+#define RCC_VERR_MAJREV_MASK			GENMASK(7, 4)
+#define RCC_VERR_MAJREV_SHIFT			4
+
+#endif /* STM32MP25_RCC_H */
-- 
2.25.1



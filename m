Return-Path: <linux-clk+bounces-1061-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863780A5C6
	for <lists+linux-clk@lfdr.de>; Fri,  8 Dec 2023 15:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA3DB1F213B7
	for <lists+linux-clk@lfdr.de>; Fri,  8 Dec 2023 14:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488D91DFF3;
	Fri,  8 Dec 2023 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6+Y6/zBL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8119419AC;
	Fri,  8 Dec 2023 06:38:18 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B886V1g015617;
	Fri, 8 Dec 2023 15:38:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=e5JQ/h42L5uhpTPt24TWXUIHpp+cXePsoRZw+56u2lo=; b=6+
	Y6/zBLLTDeb9FPZ/PaNDhiubCn23NbV8apdhatVKfplUkMoE/ZdZV8LD79os9s2F
	8Fwv3xHu56WtoifEEW7nOK7qz+mbr/B5n86YeCi3NhaPyCJ2N48snCr+CtadSdAl
	YuUgfiJPTfLdaOytI7fG4O2/6jrbZTG+FQuqjDqfzlRkVy3lWgn79mREB2d3YraU
	80g0IAMvgkjjkUd4L0x2ZA4ZApmHxWhkIQj8hldnh0xDwy9ZygI2qsuYuAfhJOCn
	q8GTTHlV1V6dAWFzFhg+NVrNQzoxJXn3GoYsA0E7/+ev1XGMxVZ/6AKV85Qz3DVf
	pUqMQw2YtNHt+44cEliw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2gn3a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 15:38:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F722100058;
	Fri,  8 Dec 2023 15:38:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67466229A79;
	Fri,  8 Dec 2023 15:38:06 +0100 (CET)
Received: from localhost (10.252.31.8) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 15:38:06 +0100
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
Subject: [PATCH v6 5/5] arm64: dts: st: add rcc support in stm32mp251
Date: Fri, 8 Dec 2023 15:37:00 +0100
Message-ID: <20231208143700.354785-6-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_09,2023-12-07_01,2023-05-22_02

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add RCC support to manage clocks and resets on the STM32MP251.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 59 ++++++++++++++------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 124403f5f1f4..dfbdb3a773e4 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -3,7 +3,9 @@
  * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
 / {
 	#address-cells = <2>;
@@ -35,22 +37,10 @@ arm_wdt: watchdog {
 	};
 
 	clocks {
-		ck_flexgen_08: ck-flexgen-08 {
+		clk_rcbsec: clk-rcbsec {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <100000000>;
-		};
-
-		ck_flexgen_51: ck-flexgen-51 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-		};
-
-		ck_icn_ls_mcu: ck-icn-ls-mcu {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
+			clock-frequency = <64000000>;
 		};
 	};
 
@@ -122,7 +112,7 @@ usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ck_flexgen_08>;
+				clocks = <&rcc CK_KER_USART2>;
 				status = "disabled";
 			};
 
@@ -131,7 +121,7 @@ sdmmc1: mmc@48220000 {
 				arm,primecell-periphid = <0x00353180>;
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
 				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ck_flexgen_51>;
+				clocks = <&rcc CK_KER_SDMMC1 >;
 				clock-names = "apb_pclk";
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
@@ -140,6 +130,19 @@ sdmmc1: mmc@48220000 {
 			};
 		};
 
+		rcc: clock-controller@44200000 {
+			compatible = "st,stm32mp25-rcc";
+			reg = <0x44200000 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clock-names = "hse", "hsi", "msi", "lse", "lsi";
+			clocks = <&scmi_clk CK_SCMI_HSE>,
+				<&scmi_clk CK_SCMI_HSI>,
+				<&scmi_clk CK_SCMI_MSI>,
+				<&scmi_clk CK_SCMI_LSE>,
+				<&scmi_clk CK_SCMI_LSI>;
+		};
+
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
@@ -158,7 +161,7 @@ gpioa: gpio@44240000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x0 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
 				status = "disabled";
 			};
@@ -169,7 +172,7 @@ gpiob: gpio@44250000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x10000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
 				status = "disabled";
 			};
@@ -180,7 +183,7 @@ gpioc: gpio@44260000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x20000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
 				status = "disabled";
 			};
@@ -191,7 +194,7 @@ gpiod: gpio@44270000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x30000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
 				status = "disabled";
 			};
@@ -202,7 +205,7 @@ gpioe: gpio@44280000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x40000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
 				status = "disabled";
 			};
@@ -213,7 +216,7 @@ gpiof: gpio@44290000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x50000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
 				status = "disabled";
 			};
@@ -224,7 +227,7 @@ gpiog: gpio@442a0000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x60000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
 				status = "disabled";
 			};
@@ -235,7 +238,7 @@ gpioh: gpio@442b0000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x70000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
 				status = "disabled";
 			};
@@ -246,7 +249,7 @@ gpioi: gpio@442c0000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x80000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
 				status = "disabled";
 			};
@@ -257,7 +260,7 @@ gpioj: gpio@442d0000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0x90000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOJ>;
 				st,bank-name = "GPIOJ";
 				status = "disabled";
 			};
@@ -268,7 +271,7 @@ gpiok: gpio@442e0000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0xa0000 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOK>;
 				st,bank-name = "GPIOK";
 				status = "disabled";
 			};
@@ -287,7 +290,7 @@ gpioz: gpio@46200000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				reg = <0 0x400>;
-				clocks = <&ck_icn_ls_mcu>;
+				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
 				status = "disabled";
-- 
2.25.1



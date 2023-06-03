Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB9B721213
	for <lists+linux-clk@lfdr.de>; Sat,  3 Jun 2023 22:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjFCUEZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 3 Jun 2023 16:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjFCUET (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Jun 2023 16:04:19 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B43EE55;
        Sat,  3 Jun 2023 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685822642; x=1717358642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ml1USQ1Kf69+ZTPyN/cgKQ7aDljJOZ1mI+h9P+UA0JA=;
  b=TNVPHJ1lnwlUnFytQ9LQs+UMr8/bNDwNuaiNe6Vbt8PaFLvh9IoBWn4f
   Fteook/OsK9V6cHBf2Bkgcnl0o42x8nsHGmdtfjlg5WwVmP2XFOlkHxZr
   g37DhMRIW8kv4KXztmNrkY2uD2yOa7hOGMuPQRJMB3L5d7+P39WNHeatc
   NeB8Nm5NxYpHTKKZD8uGLrnXtavo99ZbibA94OLsOwz+xvIHIrRpi+fav
   9ut+blnjCkLHuQ1c11esbC8PoNI277l4KGwMCD7DWIunOuZhz6uXwhu4R
   ZdTmpkB8J+IA4OMVMiVKCmkLvn0RJLy7p4zq4IW9ZZ6PK4ZBuutAwwr3u
   A==;
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="218711144"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jun 2023 13:04:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 3 Jun 2023 13:03:59 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Sat, 3 Jun 2023 13:03:47 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <gregkh@linuxfoundation.org>, <linux@armlinux.org.uk>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <sre@kernel.org>,
        <broonie@kernel.org>, <varshini.rajendran@microchip.com>,
        <arnd@arndb.de>, <gregory.clement@bootlin.com>,
        <sudeep.holla@arm.com>, <balamanikandan.gunasundar@microchip.com>,
        <mihai.sain@microchip.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-pm@vger.kernel.org>
CC:     <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
        <durai.manickamkr@microchip.com>, <manikandan.m@microchip.com>,
        <dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
        <balakrishnan.s@microchip.com>
Subject: [PATCH 04/21] ARM: dts: at91: sam9x7: add device tree for soc
Date:   Sun, 4 Jun 2023 01:32:26 +0530
Message-ID: <20230603200243.243878-5-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230603200243.243878-1-varshini.rajendran@microchip.com>
References: <20230603200243.243878-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree file for SAM9X7 SoC family

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
[nicolas.ferre@microchip.com: add support for gmac to sam9x7]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
[balamanikandan.gunasundar@microchip.com: Add device node csi2host and isc]
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 arch/arm/boot/dts/sam9x7.dtsi | 1333 +++++++++++++++++++++++++++++++++
 1 file changed, 1333 insertions(+)
 create mode 100644 arch/arm/boot/dts/sam9x7.dtsi

diff --git a/arch/arm/boot/dts/sam9x7.dtsi b/arch/arm/boot/dts/sam9x7.dtsi
new file mode 100644
index 000000000000..f98160182fe6
--- /dev/null
+++ b/arch/arm/boot/dts/sam9x7.dtsi
@@ -0,0 +1,1333 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * sam9x7.dtsi - Device Tree Include file for Microchip SAM9X7 SoC family
+ *
+ * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
+ */
+
+#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/dma/at91.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/pinctrl/at91.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "Microchip SAM9X7 SoC";
+	compatible = "microchip,sam9x7";
+	interrupt-parent = <&aic>;
+
+	aliases {
+		serial0 = &dbgu;
+		gpio0 = &pioA;
+		gpio1 = &pioB;
+		gpio2 = &pioC;
+		gpio3 = &pioD;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,arm926ej-s";
+			device_type = "cpu";
+			reg = <0>;
+		};
+	};
+
+	clocks {
+		slow_xtal: slow_xtal {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		main_xtal: main_xtal {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	sram: sram@300000 {
+		compatible = "mmio-sram";
+		reg = <0x300000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x300000 0x10000>;
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usb0: gadget@500000 {
+			compatible = "microchip,sam9x60-udc";
+			reg = <0x500000 0x100000>,
+			      <0xf803c000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clock-names = "pclk", "hclk";
+			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-rates = <480000000>;
+			status = "disabled";
+		};
+
+		ohci0: usb@600000 {
+			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
+			reg = <0x600000 0x100000>;
+			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_SYSTEM 6>;
+			clock-names = "ohci_clk", "hclk", "uhpck";
+			status = "disabled";
+		};
+
+		ehci0: usb@700000 {
+			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
+			reg = <0x700000 0x100000>;
+			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
+			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clock-names = "usb_clk", "ehci_clk";
+			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-rates = <480000000>;
+			status = "disabled";
+		};
+
+		sdmmc0: sdio-host@80000000 {
+			compatible = "microchip,sam9x60-sdhci";
+			reg = <0x80000000 0x300>;
+			interrupts = <12 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 12>, <&pmc PMC_TYPE_GCK 12>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 12>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
+		sdmmc1: sdio-host@90000000 {
+			compatible = "microchip,sam9x60-sdhci";
+			reg = <0x90000000 0x300>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_GCK 26>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 26>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+	};
+
+	apb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flx4: flexcom@f0000000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf0000000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf0000000 0x800>;
+			status = "disabled";
+
+			uart4: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(8))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(9))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi4: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(8))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(9))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(8))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(9))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx5: flexcom@f0004000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf0004000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf0004000 0x800>;
+			status = "disabled";
+
+			uart5: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(10))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(11))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi5: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(10))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(11))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(10))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(11))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		dma0: dma-controller@f0008000 {
+			compatible = "microchip,sam9x60-dma", "atmel,sama5d4-dma";
+			reg = <0xf0008000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 20>;
+			clock-names = "dma_clk";
+			status = "disabled";
+		};
+
+		ssc: ssc@f0010000 {
+			compatible = "atmel,at91sam9g45-ssc";
+			reg = <0xf0010000 0x4000>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH 5>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(38))>,
+			       <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(39))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 28>;
+			clock-names = "pclk";
+		};
+
+		gpu: gfx2d@f0018000 {
+			compatible = "microchip,sam9x60-gfx2d";
+			reg = <0xf0018000 0x4000>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			clock-names = "periph_clk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2s: i2s@f001c000 {
+			compatible = "microchip,sam9x60-i2smcc";
+			reg = <0xf001c000 0x100>;
+			interrupts = <34 IRQ_TYPE_LEVEL_HIGH 7>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(36))>,
+			       <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(37))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 34>, <&pmc PMC_TYPE_GCK 34>;
+			clock-names = "pclk", "gclk";
+			status = "disabled";
+		};
+
+		flx11: flexcom@f0020000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf0020000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf0020000 0x800>;
+			status = "disabled";
+
+			uart11: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(22))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(23))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(22))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(23))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx12: flexcom@f0024000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf0024000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf0024000 0x800>;
+			status = "disabled";
+
+			uart12: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(24))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(25))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(24))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(25))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		pit64b0: timer@f0028000 {
+			compatible = "microchip,sam9x60-pit64b";
+			reg = <0xf0028000 0x100>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 37>, <&pmc PMC_TYPE_GCK 37>;
+			clock-names = "pclk", "gclk";
+		};
+
+		sha: sha@f002c000 {
+			compatible = "atmel,at91sam9g46-sha";
+			reg = <0xf002c000 0x100>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 0>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(34))>;
+			dma-names = "tx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
+			clock-names = "sha_clk";
+		};
+
+		trng: trng@f0030000 {
+			compatible = "microchip,sam9x60-trng";
+			reg = <0xf0030000 0x100>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
+			status = "disabled";
+		};
+
+		aes: aes@f0034000 {
+			compatible = "atmel,at91sam9g46-aes";
+			reg = <0xf0034000 0x100>;
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH 0>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(32))>,
+			       <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(33))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
+			clock-names = "aes_clk";
+		};
+
+		tdes: tdes@f0038000 {
+			compatible = "atmel,at91sam9g46-tdes";
+			reg = <0xf0038000 0x100>;
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH 0>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(31))>,
+			       <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(30))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
+			clock-names = "tdes_clk";
+		};
+
+		classd: classd@f003c000 {
+			compatible = "atmel,sama5d2-classd";
+			reg = <0xf003c000 0x100>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH 7>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(35))>;
+			dma-names = "tx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>, <&pmc PMC_TYPE_GCK 42>;
+			clock-names = "pclk", "gclk";
+			status = "disabled";
+		};
+
+		pit64b1: timer@f0040000 {
+			compatible = "microchip,sam9x60-pit64b";
+			reg = <0xf0040000 0x100>;
+			interrupts = <58 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 58>, <&pmc PMC_TYPE_GCK 58>;
+			clock-names = "pclk", "gclk";
+		};
+
+		can0: can@f8000000 {
+			compatible = "bosch,m_can";
+			reg = <0xf8000000 0x100>, <0x300000 0x7800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <29 IRQ_TYPE_LEVEL_HIGH 0
+				      68 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 29>, <&pmc PMC_TYPE_GCK 29>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 29>;
+			assigned-clock-rates = <480000000>, <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		can1: can@f8004000 {
+			compatible = "bosch,m_can";
+			reg = <0xf8004000 0x100>, <0x300000 0xbc00>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <30 IRQ_TYPE_LEVEL_HIGH 0
+				      69 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 30>, <&pmc PMC_TYPE_GCK 30>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 30>;
+			assigned-clock-rates = <480000000>, <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		tcb: timer@f8008000 {
+			compatible = "microchip,sam9x60-tcb", "simple-mfd", "syscon";
+			reg = <0xf8008000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&clk32k 0>;
+			clock-names = "t0_clk", "slow_clk";
+			status = "disabled";
+		};
+
+		flx6: flexcom@f8010000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8010000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8010000 0x800>;
+			status = "disabled";
+
+			uart6: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(12))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(13))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(12))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(13))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx7: flexcom@f8014000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8014000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8014000 0x800>;
+			status = "disabled";
+
+			uart7: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(14))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(15))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(14))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(15))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx8: flexcom@f8018000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8018000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8018000 0x800>;
+			status = "disabled";
+
+			uart8: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(16))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(17))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(16))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(17))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx0: flexcom@f801c000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf801c000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf801c000 0x800>;
+			status = "disabled";
+
+			uart0: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(0))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(1))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi0: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(0))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(1))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c0: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(0))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(1))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx1: flexcom@f8020000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8020000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8020000 0x800>;
+			status = "disabled";
+
+			uart1: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(2))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(3))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi1: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(2))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(3))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(2))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(3))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx2: flexcom@f8024000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8024000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8024000 0x800>;
+			status = "disabled";
+
+			uart2: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(4))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(5))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi2: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(4))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(5))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(4))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(5))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx3: flexcom@f8028000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8028000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8028000 0x800>;
+			status = "disabled";
+
+			uart3: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(6))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(7))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			spi3: spi@400 {
+				compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+				clock-names = "spi_clk";
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(6))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(7))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(6))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(7))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		gmac: ethernet@f802c000 {
+			compatible = "microchip,sam9x7-gem";
+			reg = <0xf802c000 0x1000>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH 3		/* Queue 0 */
+				      60 IRQ_TYPE_LEVEL_HIGH 3          /* Queue 1 */
+				      61 IRQ_TYPE_LEVEL_HIGH 3          /* Queue 2 */
+				      62 IRQ_TYPE_LEVEL_HIGH 3          /* Queue 3 */
+				      63 IRQ_TYPE_LEVEL_HIGH 3          /* Queue 4 */
+				      64 IRQ_TYPE_LEVEL_HIGH 3>;        /* Queue 5 */
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>;
+			clock-names = "hclk", "pclk";
+			status = "disabled";
+		};
+
+		flx9: flexcom@f8040000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8040000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8040000 0x800>;
+			status = "disabled";
+
+			uart9: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(18))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(19))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(18))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(19))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		flx10: flexcom@f8044000 {
+			compatible = "atmel,sama5d2-flexcom";
+			reg = <0xf8044000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf8044000 0x800>;
+			status = "disabled";
+
+			uart10: serial@200 {
+				compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(20))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(21))>;
+				dma-names = "tx", "rx";
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
+				clock-names = "usart";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@600 {
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(20))>,
+					<&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) |
+					 AT91_XDMAC_DT_PER_IF(1) |
+					 AT91_XDMAC_DT_PERID(21))>;
+				dma-names = "tx", "rx";
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		xisc: xisc@f8048000 {
+			compatible = "microchip,sama7g5-isc";
+			reg = <0xf8048000 0x2000>;
+			interrupts = <43 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
+			clock-names = "hclock";
+			#clock-cells = <0>;
+			clock-output-names = "isc-mck";
+			status = "disabled";
+
+			port {
+				xisc_in: endpoint {
+					bus-width = <14>;
+					hsync-active = <1>;
+					vsync-active = <1>;
+					remote-endpoint = <&csi2dc_out>;
+				};
+			};
+		};
+
+		sfr: sfr@f8050000 {
+			compatible = "microchip,sam9x60-sfr", "syscon";
+			reg = <0xf8050000 0x100>;
+		};
+
+		csi2host: csi2host@f8058000 {
+			compatible = "snps,dw-csi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xf8058000 0x7FF>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 53>, <&pmc PMC_TYPE_GCK 55>;
+			clock-names = "perclk", "phyclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 55>;
+			assigned-clock-rates = <26600000>;
+			snps,output-type = <1>;
+			phys = <&csi_dphy>;
+			status = "disabled";
+
+			port@1 {
+				reg = <1>;
+				csi2host_in: endpoint {
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				csi2host_out: endpoint {
+				};
+			};
+		};
+
+		csi_dphy: dphy@f8058040 {
+			compatible = "snps,dw-dphy-rx";
+			#phy-cells = <0>;
+			bus-width = <8>;
+			snps,dphy-frequency = <900000>;
+			snps,phy_type = <0>;
+			reg = <0xf8058040 0x20>;
+			status = "disabled";
+		};
+
+		csi2dc: csi2dc@f805c000 {
+			compatible = "microchip,sama7g5-csi2dc";
+			reg = <0xf805c000 0x500>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 52>, <&xisc>;
+			clock-names = "pclk", "scck";
+			assigned-clocks = <&xisc>;
+			assigned-clock-rates = <266000000>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					csi2dc_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					csi2dc_out: endpoint {
+						bus-width = <14>;
+						hsync-active = <1>;
+						vsync-active = <1>;
+						remote-endpoint = <&xisc_in>;
+					};
+				};
+			};
+		};
+
+		matrix: matrix@ffffde00 {
+			compatible = "microchip,sam9x60-matrix", "atmel,at91sam9x5-matrix", "syscon";
+			reg = <0xffffde00 0x200>;
+		};
+
+		pmecc: ecc-engine@ffffe000 {
+			compatible = "microchip,sam9x60-pmecc", "atmel,at91sam9g45-pmecc";
+			reg = <0xffffe000 0x300>,
+			      <0xffffe600 0x100>;
+		};
+
+		mpddrc: mpddrc@ffffe800 {
+			compatible = "microchip,sam9x60-ddramc", "atmel,sama5d3-ddramc";
+			reg = <0xffffe800 0x200>;
+			clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clock-names = "ddrck", "mpddr";
+		};
+
+		smc: smc@ffffea00 {
+			compatible = "microchip,sam9x60-smc", "atmel,at91sam9260-smc", "syscon";
+			reg = <0xffffea00 0x100>;
+		};
+
+		aic: interrupt-controller@fffff100 {
+			compatible = "microchip,sam9x7-aic";
+			reg = <0xfffff100 0x100>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			atmel,external-irqs = <31>;
+		};
+
+		dbgu: serial@fffff200 {
+			compatible = "microchip,sam9x60-dbgu", "microchip,sam9x60-usart", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
+			reg = <0xfffff200 0x200>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH 7>;
+			dmas = <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(28))>,
+			       <&dma0
+				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+				 AT91_XDMAC_DT_PERID(29))>;
+			dma-names = "tx", "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 47>;
+			clock-names = "usart";
+			status = "disabled";
+		};
+
+		pinctrl: pinctrl@fffff400 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "microchip,sam9x60-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
+			ranges = <0xfffff400 0xfffff400 0x800>;
+
+			/* mux-mask corresponding to sam9x7 SoC in TFBGA228L package */
+			atmel,mux-mask = <
+					 /*  A		B	   C	      D	  */
+					 0xffffffff 0xffffefc0 0xc0ffd000 0x00000000	/* pioA */
+					 0x07ffffff 0x0805fe7f 0x01ff9f80 0x06078000	/* pioB */
+					 0xffffffff 0x07dfffff 0xfa3fffff 0x00000000	/* pioC */
+					 0x00003fff 0x00003fe0 0x0000003f 0x00000000	/* pioD */
+					 >;
+
+			pioA: gpio@fffff400 {
+				compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff400 0x200>;
+				interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+			};
+
+			pioB: gpio@fffff600 {
+				compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff600 0x200>;
+				interrupts = <3 IRQ_TYPE_LEVEL_HIGH 1>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				#gpio-lines = <26>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 3>;
+			};
+
+			pioC: gpio@fffff800 {
+				compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff800 0x200>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH 1>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 4>;
+			};
+
+			pioD: gpio@fffffa00 {
+				compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffffa00 0x200>;
+				interrupts = <44 IRQ_TYPE_LEVEL_HIGH 1>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				#gpio-lines = <22>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+			};
+		};
+
+		pmc: pmc@fffffc00 {
+			compatible = "microchip,sam9x7-pmc", "syscon";
+			reg = <0xfffffc00 0x200>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+			#clock-cells = <2>;
+			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
+			clock-names = "td_slck", "md_slck", "main_xtal";
+		};
+
+		reset_controller: rstc@fffffe00 {
+			compatible = "microchip,sam9x60-rstc";
+			reg = <0xfffffe00 0x10>;
+			clocks = <&clk32k 0>;
+		};
+
+		shutdown_controller: shdwc@fffffe10 {
+			compatible = "microchip,sam9x60-shdwc";
+			reg = <0xfffffe10 0x10>;
+			clocks = <&clk32k 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			atmel,wakeup-rtc-timer;
+			atmel,wakeup-rtt-timer;
+			status = "disabled";
+		};
+
+		rtt: rtc@fffffe20 {
+			compatible = "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt";
+			reg = <0xfffffe20 0x20>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&clk32k 0>;
+		};
+
+		clk32k: sckc@fffffe50 {
+			compatible = "microchip,sam9x60-sckc";
+			reg = <0xfffffe50 0x4>;
+			clocks = <&slow_xtal>;
+			#clock-cells = <1>;
+		};
+
+		gpbr: syscon@fffffe60 {
+			compatible = "microchip,sam9x60-gpbr", "atmel,at91sam9260-gpbr", "syscon";
+			reg = <0xfffffe60 0x10>;
+		};
+
+		rtc: rtc@fffffea8 {
+			compatible = "microchip,sam9x60-rtc";
+			reg = <0xfffffea8 0x100>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&clk32k 0>;
+		};
+
+		watchdog: watchdog@ffffff80 {
+			compatible = "microchip,sam9x60-wdt";
+			reg = <0xffffff80 0x24>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+			clocks = <&clk32k 0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.25.1


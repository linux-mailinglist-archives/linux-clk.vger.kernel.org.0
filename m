Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2336B76A602
	for <lists+linux-clk@lfdr.de>; Tue,  1 Aug 2023 03:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjHABGn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Jul 2023 21:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjHABGm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 21:06:42 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF901FFD;
        Mon, 31 Jul 2023 18:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690851984; x=1722387984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TfM4Yqg18dpR3fm1fYfdsdZBHxZ2WEli4frkDuAW+vg=;
  b=L55NtoZQx2Fh1WiDL/Sw7wr9Senn+CVgQUXBiHNuHQFfCGuA/f6hO0J1
   Hi20yunsLsxe2tVpH+tc4GIvV5TNcK5mZ4i20jIcDOvfjwAUF1w3Sj5r0
   ZWypySjkn+Enu9i/U3WgDfwOjlVtUOR84Udug6phJyQRSFrWBbgO7kkCl
   gENAQY9efdEYKcnz5PKMOzhV8fPA9uPfGdZkrmqsFH3NnZnT8+OflDMzE
   VzG6RAHHrcbkveVh7t++qisbT2+qFr96OGNZVEqo1zQQT9Nfovr3JpDLD
   TbbcaaC9qnKnZc0p5apDThAHSjG9LnYxxfgNBBxQ6Q2cV/r1FGkU7IlcZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372788425"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="372788425"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 18:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818587732"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="818587732"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2023 18:04:16 -0700
From:   niravkumar.l.rabara@intel.com
To:     niravkumar.l.rabara@intel.com
Cc:     adrian.ho.yin.ng@intel.com, andrew@lunn.ch, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dinguyen@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        netdev@vger.kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
        wen.ping.teh@intel.com
Subject: [PATCH v2 5/5] arm64: dts: agilex5: add initial support for Intel Agilex5 SoCFPGA
Date:   Tue,  1 Aug 2023 09:02:34 +0800
Message-Id: <20230801010234.792557-6-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801010234.792557-1-niravkumar.l.rabara@intel.com>
References: <20230618132235.728641-1-niravkumar.l.rabara@intel.com>
 <20230801010234.792557-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Add the initial device tree files for Intel Agilex5 SoCFPGA platform.

Reviewed-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 468 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  39 ++
 3 files changed, 508 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index c2a723838344..d39cfb723f5b 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -2,5 +2,6 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex5_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
new file mode 100644
index 000000000000..dcdaf7064953
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ */
+
+/dts-v1/;
+#include <dt-bindings/reset/altr,rst-mgr-s10.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/intel,agilex5-clkmgr.h>
+
+/ {
+	compatible = "intel,socfpga-agilex5";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		service_reserved: svcbuffer@0 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x2000000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a76";
+			reg = <0x200>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a76";
+			reg = <0x300>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	intc: interrupt-controller@1d000000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x1d000000 0 0x10000>,
+			<0x0 0x1d060000 0 0x100000>;
+		ranges;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells =<2>;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x20000>;
+
+		its: msi-controller@1d040000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x0 0x1d040000 0x0 0x20000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	/* Clock tree 5 main sources*/
+	clocks {
+		cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		cb_intosc_ls_clk: cb-intosc-ls-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		f2s_free_clk: f2s-free-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		osc1: osc1 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		qspi_clk: qspi-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	usbphy0: usbphy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xffffffff>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		interrupt-parent = <&intc>;
+
+		clkmgr: clock-controller@10d10000 {
+			compatible = "intel,agilex5-clkmgr";
+			reg = <0x10d10000 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		i2c0: i2c@10c02800 {
+			compatible = "snps,designware-i2c";
+			reg = <0x10c02800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst I2C0_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@10c02900 {
+			compatible = "snps,designware-i2c";
+			reg = <0x10c02900 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst I2C1_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10c02a00 {
+			compatible = "snps,designware-i2c";
+			reg = <0x10c02a00 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst I2C2_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10c02b00 {
+			compatible = "snps,designware-i2c";
+			reg = <0x10c02b00 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst I2C3_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@10c02c00 {
+			compatible = "snps,designware-i2c";
+			reg = <0x10c02c00 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst I2C4_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			status = "disabled";
+		};
+
+		i3c0: i3c-master@10da0000 {
+			compatible = "snps,dw-i3c-master-1.00a";
+			reg = <0x10da0000 0x1000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
+			status = "disabled";
+		};
+
+		i3c1: i3c-master@10da1000 {
+			compatible = "snps,dw-i3c-master-1.00a";
+			reg = <0x10da1000 0x1000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@10c03300 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x10c03300 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&rst GPIO1_RESET>;
+			status = "disabled";
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <24>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		nand: nand-controller@10b80000 {
+			compatible = "cdns,hp-nfc";
+			reg = <0x10b80000 0x10000>,
+					<0x10840000 0x10000>;
+			reg-names = "reg", "sdma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_NAND_NF_CLK>;
+			cdns,board-delay-ps = <4830>;
+			status = "disabled";
+		};
+
+		ocram: sram@0 {
+			compatible = "mmio-sram";
+			reg = <0x00000000 0x80000>;
+			ranges = <0 0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
+		dmac0: dma-controller@10db0000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x10db0000 0x500>;
+			clocks = <&clkmgr AGILEX5_L4_MAIN_CLK>,
+				 <&clkmgr AGILEX5_L4_MP_CLK>;
+			clock-names = "core-clk", "cfgr-clk";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			snps,dma-masters = <1>;
+			snps,data-width = <2>;
+			snps,block-size = <32767 32767 32767 32767>;
+			snps,priority = <0 1 2 3>;
+			snps,axi-max-burst-len = <8>;
+		};
+
+		dmac1: dma-controller@10dc0000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x10dc0000 0x500>;
+			clocks = <&clkmgr AGILEX5_L4_MAIN_CLK>,
+				 <&clkmgr AGILEX5_L4_MP_CLK>;
+			clock-names = "core-clk", "cfgr-clk";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			snps,dma-masters = <1>;
+			snps,data-width = <2>;
+			snps,block-size = <32767 32767 32767 32767>;
+			snps,priority = <0 1 2 3>;
+			snps,axi-max-burst-len = <8>;
+		};
+
+		rst: rstmgr@10d11000 {
+			compatible = "altr,stratix10-rst-mgr", "altr,rst-mgr";
+			reg = <0x10d11000 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		spi0: spi@10da4000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x10da4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst SPIM0_RESET>;
+			reset-names = "spi";
+			reg-io-width = <4>;
+			num-cs = <4>;
+			clocks = <&clkmgr AGILEX5_L4_MAIN_CLK>;
+			dmas = <&dmac0 2>, <&dmac0 3>;
+			dma-names ="tx", "rx";
+			status = "disabled";
+
+		};
+
+		spi1: spi@10da5000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x10da5000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst SPIM1_RESET>;
+			reset-names = "spi";
+			reg-io-width = <4>;
+			num-cs = <4>;
+			clocks = <&clkmgr AGILEX5_L4_MAIN_CLK>;
+			status = "disabled";
+		};
+
+		sysmgr: sysmgr@10d12000 {
+			compatible = "altr,sys-mgr-s10","altr,sys-mgr";
+			reg = <0x10d12000 0x500>;
+		};
+
+		timer0: timer0@10c03000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0x10c03000 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			clock-names = "timer";
+		};
+
+		timer1: timer1@10c03100 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0x10c03100 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			clock-names = "timer";
+		};
+
+		timer2: timer2@10d00000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0x10d00000 0x100>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			clock-names = "timer";
+		};
+
+		timer3: timer3@10d00100 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0x10d00100 0x100>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+			clock-names = "timer";
+		};
+
+		uart0: serial@10c02000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x10c02000 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst UART0_RESET>;
+			status = "disabled";
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+		};
+
+		uart1: serial@10c02100 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x10c02100 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst UART1_RESET>;
+			status = "disabled";
+			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
+		};
+
+		usb0: usb@10b00000 {
+			compatible = "snps,dwc2";
+			reg = <0x10b00000 0x40000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
+			reset-names = "dwc2", "dwc2-ecc";
+			clocks = <&clkmgr AGILEX5_USB2OTG_HCLK>;
+			clock-names = "otg";
+			status = "disabled";
+		};
+
+		watchdog0: watchdog@10d00200 {
+			compatible = "snps,dw-wdt";
+			reg = <0x10d00200 0x100>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst WATCHDOG0_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SYS_FREE_CLK>;
+			status = "disabled";
+		};
+
+		watchdog1: watchdog@10d00300 {
+			compatible = "snps,dw-wdt";
+			reg = <0x10d00300 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst WATCHDOG1_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SYS_FREE_CLK>;
+			status = "disabled";
+		};
+
+		watchdog2: watchdog@10d00400 {
+			compatible = "snps,dw-wdt";
+			reg = <0x10d00400 0x100>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst WATCHDOG2_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SYS_FREE_CLK>;
+			status = "disabled";
+		};
+
+		watchdog3: watchdog@10d00500 {
+			compatible = "snps,dw-wdt";
+			reg = <0x10d00500 0x100>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst WATCHDOG3_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SYS_FREE_CLK>;
+			status = "disabled";
+		};
+
+		watchdog4: watchdog@10d00600 {
+			compatible = "snps,dw-wdt";
+			reg = <0x10d00600 0x100>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst WATCHDOG4_RESET>;
+			clocks = <&clkmgr AGILEX5_L4_SYS_FREE_CLK>;
+			status = "disabled";
+		};
+
+		qspi: spi@108d2000 {
+			compatible = "intel,socfpga-qspi", "cdns,qspi-nor";
+			reg = <0x108d2000 0x100>,
+			      <0x10900000 0x100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			cdns,fifo-depth = <128>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x00000000>;
+			clocks = <&qspi_clk>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
new file mode 100644
index 000000000000..c533e5a3a610
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK";
+	compatible = "intel,socfpga-agilex5-socdk", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.25.1


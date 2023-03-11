Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43986B59BD
	for <lists+linux-clk@lfdr.de>; Sat, 11 Mar 2023 10:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjCKJIl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Sat, 11 Mar 2023 04:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjCKJII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Mar 2023 04:08:08 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5206903F;
        Sat, 11 Mar 2023 01:07:58 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1AC3E24E1BB;
        Sat, 11 Mar 2023 17:07:46 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:46 +0800
Received: from ubuntu.localdomain (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:44 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
Date:   Sat, 11 Mar 2023 17:07:23 +0800
Message-ID: <20230311090733.56918-12-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311090733.56918-1-hal.feng@starfivetech.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Emil Renner Berthing <kernel@esmil.dk>

Add bindings for the system clock and reset generator (SYSCRG) on the
JH7110 RISC-V SoC by StarFive Ltd.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
 MAINTAINERS                                   |   8 +-
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
 4 files changed, 454 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
 create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
new file mode 100644
index 000000000000..84373ae31644
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 System Clock and Reset Generator
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    const: starfive,jh7110-syscrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    oneOf:
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC1 RMII reference or GMAC1 RGMII RX
+          - description: External I2S TX bit clock
+          - description: External I2S TX left/right channel clock
+          - description: External I2S RX bit clock
+          - description: External I2S RX left/right channel clock
+          - description: External TDM clock
+          - description: External audio master clock
+
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC1 RMII reference
+          - description: GMAC1 RGMII RX
+          - description: External I2S TX bit clock
+          - description: External I2S TX left/right channel clock
+          - description: External I2S RX bit clock
+          - description: External I2S RX left/right channel clock
+          - description: External TDM clock
+          - description: External audio master clock
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: osc
+          - enum:
+              - gmac1_rmii_refin
+              - gmac1_rgmii_rxin
+          - const: i2stx_bclk_ext
+          - const: i2stx_lrck_ext
+          - const: i2srx_bclk_ext
+          - const: i2srx_lrck_ext
+          - const: tdm_ext
+          - const: mclk_ext
+
+      - items:
+          - const: osc
+          - const: gmac1_rmii_refin
+          - const: gmac1_rgmii_rxin
+          - const: i2stx_bclk_ext
+          - const: i2stx_lrck_ext
+          - const: i2srx_bclk_ext
+          - const: i2srx_lrck_ext
+          - const: tdm_ext
+          - const: mclk_ext
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/starfive,jh7110-crg.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@13020000 {
+        compatible = "starfive,jh7110-syscrg";
+        reg = <0x13020000 0x10000>;
+        clocks = <&osc>, <&gmac1_rmii_refin>,
+                 <&gmac1_rgmii_rxin>,
+                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
+                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
+                 <&tdm_ext>, <&mclk_ext>;
+        clock-names = "osc", "gmac1_rmii_refin",
+                      "gmac1_rgmii_rxin",
+                      "i2stx_bclk_ext", "i2stx_lrck_ext",
+                      "i2srx_bclk_ext", "i2srx_lrck_ext",
+                      "tdm_ext", "mclk_ext";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0fb7158835b0..958b7ec118b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19915,10 +19915,11 @@ F:	arch/riscv/boot/dts/starfive/
 
 STARFIVE JH71X0 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@starfivetech.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
+F:	Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
 F:	drivers/clk/starfive/clk-starfive-jh71*
-F:	include/dt-bindings/clock/starfive-jh7100*.h
+F:	include/dt-bindings/clock/starfive?jh71*.h
 
 STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
@@ -19938,10 +19939,11 @@ F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
 
 STARFIVE JH71X0 RESET CONTROLLER DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 F:	drivers/reset/starfive/reset-starfive-jh71*
-F:	include/dt-bindings/reset/starfive-jh7100.h
+F:	include/dt-bindings/reset/starfive?jh71*.h
 
 STARFIVE JH71XX PMU CONTROLLER DRIVER
 M:	Walker Chen <walker.chen@starfivetech.com>
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
new file mode 100644
index 000000000000..fdd1852e34cc
--- /dev/null
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
+#define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
+
+/* SYSCRG clocks */
+#define JH7110_SYSCLK_CPU_ROOT			0
+#define JH7110_SYSCLK_CPU_CORE			1
+#define JH7110_SYSCLK_CPU_BUS			2
+#define JH7110_SYSCLK_GPU_ROOT			3
+#define JH7110_SYSCLK_PERH_ROOT			4
+#define JH7110_SYSCLK_BUS_ROOT			5
+#define JH7110_SYSCLK_NOCSTG_BUS		6
+#define JH7110_SYSCLK_AXI_CFG0			7
+#define JH7110_SYSCLK_STG_AXIAHB		8
+#define JH7110_SYSCLK_AHB0			9
+#define JH7110_SYSCLK_AHB1			10
+#define JH7110_SYSCLK_APB_BUS			11
+#define JH7110_SYSCLK_APB0			12
+#define JH7110_SYSCLK_PLL0_DIV2			13
+#define JH7110_SYSCLK_PLL1_DIV2			14
+#define JH7110_SYSCLK_PLL2_DIV2			15
+#define JH7110_SYSCLK_AUDIO_ROOT		16
+#define JH7110_SYSCLK_MCLK_INNER		17
+#define JH7110_SYSCLK_MCLK			18
+#define JH7110_SYSCLK_MCLK_OUT			19
+#define JH7110_SYSCLK_ISP_2X			20
+#define JH7110_SYSCLK_ISP_AXI			21
+#define JH7110_SYSCLK_GCLK0			22
+#define JH7110_SYSCLK_GCLK1			23
+#define JH7110_SYSCLK_GCLK2			24
+#define JH7110_SYSCLK_CORE			25
+#define JH7110_SYSCLK_CORE1			26
+#define JH7110_SYSCLK_CORE2			27
+#define JH7110_SYSCLK_CORE3			28
+#define JH7110_SYSCLK_CORE4			29
+#define JH7110_SYSCLK_DEBUG			30
+#define JH7110_SYSCLK_RTC_TOGGLE		31
+#define JH7110_SYSCLK_TRACE0			32
+#define JH7110_SYSCLK_TRACE1			33
+#define JH7110_SYSCLK_TRACE2			34
+#define JH7110_SYSCLK_TRACE3			35
+#define JH7110_SYSCLK_TRACE4			36
+#define JH7110_SYSCLK_TRACE_COM			37
+#define JH7110_SYSCLK_NOC_BUS_CPU_AXI		38
+#define JH7110_SYSCLK_NOC_BUS_AXICFG0_AXI	39
+#define JH7110_SYSCLK_OSC_DIV2			40
+#define JH7110_SYSCLK_PLL1_DIV4			41
+#define JH7110_SYSCLK_PLL1_DIV8			42
+#define JH7110_SYSCLK_DDR_BUS			43
+#define JH7110_SYSCLK_DDR_AXI			44
+#define JH7110_SYSCLK_GPU_CORE			45
+#define JH7110_SYSCLK_GPU_CORE_CLK		46
+#define JH7110_SYSCLK_GPU_SYS_CLK		47
+#define JH7110_SYSCLK_GPU_APB			48
+#define JH7110_SYSCLK_GPU_RTC_TOGGLE		49
+#define JH7110_SYSCLK_NOC_BUS_GPU_AXI		50
+#define JH7110_SYSCLK_ISP_TOP_CORE		51
+#define JH7110_SYSCLK_ISP_TOP_AXI		52
+#define JH7110_SYSCLK_NOC_BUS_ISP_AXI		53
+#define JH7110_SYSCLK_HIFI4_CORE		54
+#define JH7110_SYSCLK_HIFI4_AXI			55
+#define JH7110_SYSCLK_AXI_CFG1_MAIN		56
+#define JH7110_SYSCLK_AXI_CFG1_AHB		57
+#define JH7110_SYSCLK_VOUT_SRC			58
+#define JH7110_SYSCLK_VOUT_AXI			59
+#define JH7110_SYSCLK_NOC_BUS_DISP_AXI		60
+#define JH7110_SYSCLK_VOUT_TOP_AHB		61
+#define JH7110_SYSCLK_VOUT_TOP_AXI		62
+#define JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK	63
+#define JH7110_SYSCLK_VOUT_TOP_MIPIPHY_REF	64
+#define JH7110_SYSCLK_JPEGC_AXI			65
+#define JH7110_SYSCLK_CODAJ12_AXI		66
+#define JH7110_SYSCLK_CODAJ12_CORE		67
+#define JH7110_SYSCLK_CODAJ12_APB		68
+#define JH7110_SYSCLK_VDEC_AXI			69
+#define JH7110_SYSCLK_WAVE511_AXI		70
+#define JH7110_SYSCLK_WAVE511_BPU		71
+#define JH7110_SYSCLK_WAVE511_VCE		72
+#define JH7110_SYSCLK_WAVE511_APB		73
+#define JH7110_SYSCLK_VDEC_JPG			74
+#define JH7110_SYSCLK_VDEC_MAIN			75
+#define JH7110_SYSCLK_NOC_BUS_VDEC_AXI		76
+#define JH7110_SYSCLK_VENC_AXI			77
+#define JH7110_SYSCLK_WAVE420L_AXI		78
+#define JH7110_SYSCLK_WAVE420L_BPU		79
+#define JH7110_SYSCLK_WAVE420L_VCE		80
+#define JH7110_SYSCLK_WAVE420L_APB		81
+#define JH7110_SYSCLK_NOC_BUS_VENC_AXI		82
+#define JH7110_SYSCLK_AXI_CFG0_MAIN_DIV		83
+#define JH7110_SYSCLK_AXI_CFG0_MAIN		84
+#define JH7110_SYSCLK_AXI_CFG0_HIFI4		85
+#define JH7110_SYSCLK_AXIMEM2_AXI		86
+#define JH7110_SYSCLK_QSPI_AHB			87
+#define JH7110_SYSCLK_QSPI_APB			88
+#define JH7110_SYSCLK_QSPI_REF_SRC		89
+#define JH7110_SYSCLK_QSPI_REF			90
+#define JH7110_SYSCLK_SDIO0_AHB			91
+#define JH7110_SYSCLK_SDIO1_AHB			92
+#define JH7110_SYSCLK_SDIO0_SDCARD		93
+#define JH7110_SYSCLK_SDIO1_SDCARD		94
+#define JH7110_SYSCLK_USB_125M			95
+#define JH7110_SYSCLK_NOC_BUS_STG_AXI		96
+#define JH7110_SYSCLK_GMAC1_AHB			97
+#define JH7110_SYSCLK_GMAC1_AXI			98
+#define JH7110_SYSCLK_GMAC_SRC			99
+#define JH7110_SYSCLK_GMAC1_GTXCLK		100
+#define JH7110_SYSCLK_GMAC1_RMII_RTX		101
+#define JH7110_SYSCLK_GMAC1_PTP			102
+#define JH7110_SYSCLK_GMAC1_RX			103
+#define JH7110_SYSCLK_GMAC1_RX_INV		104
+#define JH7110_SYSCLK_GMAC1_TX			105
+#define JH7110_SYSCLK_GMAC1_TX_INV		106
+#define JH7110_SYSCLK_GMAC1_GTXC		107
+#define JH7110_SYSCLK_GMAC0_GTXCLK		108
+#define JH7110_SYSCLK_GMAC0_PTP			109
+#define JH7110_SYSCLK_GMAC_PHY			110
+#define JH7110_SYSCLK_GMAC0_GTXC		111
+#define JH7110_SYSCLK_IOMUX_APB			112
+#define JH7110_SYSCLK_MAILBOX_APB		113
+#define JH7110_SYSCLK_INT_CTRL_APB		114
+#define JH7110_SYSCLK_CAN0_APB			115
+#define JH7110_SYSCLK_CAN0_TIMER		116
+#define JH7110_SYSCLK_CAN0_CAN			117
+#define JH7110_SYSCLK_CAN1_APB			118
+#define JH7110_SYSCLK_CAN1_TIMER		119
+#define JH7110_SYSCLK_CAN1_CAN			120
+#define JH7110_SYSCLK_PWM_APB			121
+#define JH7110_SYSCLK_WDT_APB			122
+#define JH7110_SYSCLK_WDT_CORE			123
+#define JH7110_SYSCLK_TIMER_APB			124
+#define JH7110_SYSCLK_TIMER0			125
+#define JH7110_SYSCLK_TIMER1			126
+#define JH7110_SYSCLK_TIMER2			127
+#define JH7110_SYSCLK_TIMER3			128
+#define JH7110_SYSCLK_TEMP_APB			129
+#define JH7110_SYSCLK_TEMP_CORE			130
+#define JH7110_SYSCLK_SPI0_APB			131
+#define JH7110_SYSCLK_SPI1_APB			132
+#define JH7110_SYSCLK_SPI2_APB			133
+#define JH7110_SYSCLK_SPI3_APB			134
+#define JH7110_SYSCLK_SPI4_APB			135
+#define JH7110_SYSCLK_SPI5_APB			136
+#define JH7110_SYSCLK_SPI6_APB			137
+#define JH7110_SYSCLK_I2C0_APB			138
+#define JH7110_SYSCLK_I2C1_APB			139
+#define JH7110_SYSCLK_I2C2_APB			140
+#define JH7110_SYSCLK_I2C3_APB			141
+#define JH7110_SYSCLK_I2C4_APB			142
+#define JH7110_SYSCLK_I2C5_APB			143
+#define JH7110_SYSCLK_I2C6_APB			144
+#define JH7110_SYSCLK_UART0_APB			145
+#define JH7110_SYSCLK_UART0_CORE		146
+#define JH7110_SYSCLK_UART1_APB			147
+#define JH7110_SYSCLK_UART1_CORE		148
+#define JH7110_SYSCLK_UART2_APB			149
+#define JH7110_SYSCLK_UART2_CORE		150
+#define JH7110_SYSCLK_UART3_APB			151
+#define JH7110_SYSCLK_UART3_CORE		152
+#define JH7110_SYSCLK_UART4_APB			153
+#define JH7110_SYSCLK_UART4_CORE		154
+#define JH7110_SYSCLK_UART5_APB			155
+#define JH7110_SYSCLK_UART5_CORE		156
+#define JH7110_SYSCLK_PWMDAC_APB		157
+#define JH7110_SYSCLK_PWMDAC_CORE		158
+#define JH7110_SYSCLK_SPDIF_APB			159
+#define JH7110_SYSCLK_SPDIF_CORE		160
+#define JH7110_SYSCLK_I2STX0_APB		161
+#define JH7110_SYSCLK_I2STX0_BCLK_MST		162
+#define JH7110_SYSCLK_I2STX0_BCLK_MST_INV	163
+#define JH7110_SYSCLK_I2STX0_LRCK_MST		164
+#define JH7110_SYSCLK_I2STX0_BCLK		165
+#define JH7110_SYSCLK_I2STX0_BCLK_INV		166
+#define JH7110_SYSCLK_I2STX0_LRCK		167
+#define JH7110_SYSCLK_I2STX1_APB		168
+#define JH7110_SYSCLK_I2STX1_BCLK_MST		169
+#define JH7110_SYSCLK_I2STX1_BCLK_MST_INV	170
+#define JH7110_SYSCLK_I2STX1_LRCK_MST		171
+#define JH7110_SYSCLK_I2STX1_BCLK		172
+#define JH7110_SYSCLK_I2STX1_BCLK_INV		173
+#define JH7110_SYSCLK_I2STX1_LRCK		174
+#define JH7110_SYSCLK_I2SRX_APB			175
+#define JH7110_SYSCLK_I2SRX_BCLK_MST		176
+#define JH7110_SYSCLK_I2SRX_BCLK_MST_INV	177
+#define JH7110_SYSCLK_I2SRX_LRCK_MST		178
+#define JH7110_SYSCLK_I2SRX_BCLK		179
+#define JH7110_SYSCLK_I2SRX_BCLK_INV		180
+#define JH7110_SYSCLK_I2SRX_LRCK		181
+#define JH7110_SYSCLK_PDM_DMIC			182
+#define JH7110_SYSCLK_PDM_APB			183
+#define JH7110_SYSCLK_TDM_AHB			184
+#define JH7110_SYSCLK_TDM_APB			185
+#define JH7110_SYSCLK_TDM_INTERNAL		186
+#define JH7110_SYSCLK_TDM_TDM			187
+#define JH7110_SYSCLK_TDM_TDM_INV		188
+#define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
+
+#define JH7110_SYSCLK_END			190
+
+#endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
new file mode 100644
index 000000000000..b88216a4fe40
--- /dev/null
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__
+#define __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__
+
+/* SYSCRG resets */
+#define JH7110_SYSRST_JTAG_APB			0
+#define JH7110_SYSRST_SYSCON_APB		1
+#define JH7110_SYSRST_IOMUX_APB			2
+#define JH7110_SYSRST_BUS			3
+#define JH7110_SYSRST_DEBUG			4
+#define JH7110_SYSRST_CORE0			5
+#define JH7110_SYSRST_CORE1			6
+#define JH7110_SYSRST_CORE2			7
+#define JH7110_SYSRST_CORE3			8
+#define JH7110_SYSRST_CORE4			9
+#define JH7110_SYSRST_CORE0_ST			10
+#define JH7110_SYSRST_CORE1_ST			11
+#define JH7110_SYSRST_CORE2_ST			12
+#define JH7110_SYSRST_CORE3_ST			13
+#define JH7110_SYSRST_CORE4_ST			14
+#define JH7110_SYSRST_TRACE0			15
+#define JH7110_SYSRST_TRACE1			16
+#define JH7110_SYSRST_TRACE2			17
+#define JH7110_SYSRST_TRACE3			18
+#define JH7110_SYSRST_TRACE4			19
+#define JH7110_SYSRST_TRACE_COM			20
+#define JH7110_SYSRST_GPU_APB			21
+#define JH7110_SYSRST_GPU_DOMA			22
+#define JH7110_SYSRST_NOC_BUS_APB		23
+#define JH7110_SYSRST_NOC_BUS_AXICFG0_AXI	24
+#define JH7110_SYSRST_NOC_BUS_CPU_AXI		25
+#define JH7110_SYSRST_NOC_BUS_DISP_AXI		26
+#define JH7110_SYSRST_NOC_BUS_GPU_AXI		27
+#define JH7110_SYSRST_NOC_BUS_ISP_AXI		28
+#define JH7110_SYSRST_NOC_BUS_DDRC		29
+#define JH7110_SYSRST_NOC_BUS_STG_AXI		30
+#define JH7110_SYSRST_NOC_BUS_VDEC_AXI		31
+
+#define JH7110_SYSRST_NOC_BUS_VENC_AXI		32
+#define JH7110_SYSRST_AXI_CFG1_AHB		33
+#define JH7110_SYSRST_AXI_CFG1_MAIN		34
+#define JH7110_SYSRST_AXI_CFG0_MAIN		35
+#define JH7110_SYSRST_AXI_CFG0_MAIN_DIV		36
+#define JH7110_SYSRST_AXI_CFG0_HIFI4		37
+#define JH7110_SYSRST_DDR_AXI			38
+#define JH7110_SYSRST_DDR_OSC			39
+#define JH7110_SYSRST_DDR_APB			40
+#define JH7110_SYSRST_ISP_TOP			41
+#define JH7110_SYSRST_ISP_TOP_AXI		42
+#define JH7110_SYSRST_VOUT_TOP_SRC		43
+#define JH7110_SYSRST_CODAJ12_AXI		44
+#define JH7110_SYSRST_CODAJ12_CORE		45
+#define JH7110_SYSRST_CODAJ12_APB		46
+#define JH7110_SYSRST_WAVE511_AXI		47
+#define JH7110_SYSRST_WAVE511_BPU		48
+#define JH7110_SYSRST_WAVE511_VCE		49
+#define JH7110_SYSRST_WAVE511_APB		50
+#define JH7110_SYSRST_VDEC_JPG			51
+#define JH7110_SYSRST_VDEC_MAIN			52
+#define JH7110_SYSRST_AXIMEM0_AXI		53
+#define JH7110_SYSRST_WAVE420L_AXI		54
+#define JH7110_SYSRST_WAVE420L_BPU		55
+#define JH7110_SYSRST_WAVE420L_VCE		56
+#define JH7110_SYSRST_WAVE420L_APB		57
+#define JH7110_SYSRST_AXIMEM1_AXI		58
+#define JH7110_SYSRST_AXIMEM2_AXI		59
+#define JH7110_SYSRST_INTMEM			60
+#define JH7110_SYSRST_QSPI_AHB			61
+#define JH7110_SYSRST_QSPI_APB			62
+#define JH7110_SYSRST_QSPI_REF			63
+
+#define JH7110_SYSRST_SDIO0_AHB			64
+#define JH7110_SYSRST_SDIO1_AHB			65
+#define JH7110_SYSRST_GMAC1_AXI			66
+#define JH7110_SYSRST_GMAC1_AHB			67
+#define JH7110_SYSRST_MAILBOX_APB		68
+#define JH7110_SYSRST_SPI0_APB			69
+#define JH7110_SYSRST_SPI1_APB			70
+#define JH7110_SYSRST_SPI2_APB			71
+#define JH7110_SYSRST_SPI3_APB			72
+#define JH7110_SYSRST_SPI4_APB			73
+#define JH7110_SYSRST_SPI5_APB			74
+#define JH7110_SYSRST_SPI6_APB			75
+#define JH7110_SYSRST_I2C0_APB			76
+#define JH7110_SYSRST_I2C1_APB			77
+#define JH7110_SYSRST_I2C2_APB			78
+#define JH7110_SYSRST_I2C3_APB			79
+#define JH7110_SYSRST_I2C4_APB			80
+#define JH7110_SYSRST_I2C5_APB			81
+#define JH7110_SYSRST_I2C6_APB			82
+#define JH7110_SYSRST_UART0_APB			83
+#define JH7110_SYSRST_UART0_CORE		84
+#define JH7110_SYSRST_UART1_APB			85
+#define JH7110_SYSRST_UART1_CORE		86
+#define JH7110_SYSRST_UART2_APB			87
+#define JH7110_SYSRST_UART2_CORE		88
+#define JH7110_SYSRST_UART3_APB			89
+#define JH7110_SYSRST_UART3_CORE		90
+#define JH7110_SYSRST_UART4_APB			91
+#define JH7110_SYSRST_UART4_CORE		92
+#define JH7110_SYSRST_UART5_APB			93
+#define JH7110_SYSRST_UART5_CORE		94
+#define JH7110_SYSRST_SPDIF_APB			95
+
+#define JH7110_SYSRST_PWMDAC_APB		96
+#define JH7110_SYSRST_PDM_DMIC			97
+#define JH7110_SYSRST_PDM_APB			98
+#define JH7110_SYSRST_I2SRX_APB			99
+#define JH7110_SYSRST_I2SRX_BCLK		100
+#define JH7110_SYSRST_I2STX0_APB		101
+#define JH7110_SYSRST_I2STX0_BCLK		102
+#define JH7110_SYSRST_I2STX1_APB		103
+#define JH7110_SYSRST_I2STX1_BCLK		104
+#define JH7110_SYSRST_TDM_AHB			105
+#define JH7110_SYSRST_TDM_CORE			106
+#define JH7110_SYSRST_TDM_APB			107
+#define JH7110_SYSRST_PWM_APB			108
+#define JH7110_SYSRST_WDT_APB			109
+#define JH7110_SYSRST_WDT_CORE			110
+#define JH7110_SYSRST_CAN0_APB			111
+#define JH7110_SYSRST_CAN0_CORE			112
+#define JH7110_SYSRST_CAN0_TIMER		113
+#define JH7110_SYSRST_CAN1_APB			114
+#define JH7110_SYSRST_CAN1_CORE			115
+#define JH7110_SYSRST_CAN1_TIMER		116
+#define JH7110_SYSRST_TIMER_APB			117
+#define JH7110_SYSRST_TIMER0			118
+#define JH7110_SYSRST_TIMER1			119
+#define JH7110_SYSRST_TIMER2			120
+#define JH7110_SYSRST_TIMER3			121
+#define JH7110_SYSRST_INT_CTRL_APB		122
+#define JH7110_SYSRST_TEMP_APB			123
+#define JH7110_SYSRST_TEMP_CORE			124
+#define JH7110_SYSRST_JTAG_CERTIFICATION	125
+
+#define JH7110_SYSRST_END			126
+
+#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.38.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C426DEB51
	for <lists+linux-clk@lfdr.de>; Wed, 12 Apr 2023 07:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjDLFjh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Apr 2023 01:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjDLFjR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 01:39:17 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993EA6589;
        Tue, 11 Apr 2023 22:38:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id c3so11321048pjg.1;
        Tue, 11 Apr 2023 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681277935; x=1683869935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwBnqjI+W2Ghh9s2nV/ej83gYv5b7UeYGgEXrKPGbXQ=;
        b=EIhXbOceg2NgRZbb1SNfReBsPBoqxDTZABdkSMdPYErKuJEwf65AMF6t9fAWfzzFUs
         Shu8qUDf6gqdq5T7WdjI0o0zwbRYUUxa+H/SgERSW2qjdu/1UfmvR7iDxhI0ZwxF+eJc
         /gM9k3mbmbkd15w0BWobADQz2KbEBYIy6lVBeV9XqPNhWjrBqoA0YOX9D5gI7ySh9mmM
         zyJOBrXli3aoyyZJStchvbXqaSMViRz2gmVOVFvANhsANulRSUHDuUFFmClezNhkEVwy
         SV5yBZbxjN/hgvECZ+d45tIM/bgEIn/IZUeKU6hQjrIVs1gRd7C4lEPzxUG08lermLVZ
         b30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277935; x=1683869935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwBnqjI+W2Ghh9s2nV/ej83gYv5b7UeYGgEXrKPGbXQ=;
        b=EGpFA8Os2sZL9D90OIBABuTLzVK5Q9NWV4bnNwgrl8SokCpPLGtFR9w6ADxq8e4/Iz
         sX5aZhPYvxBShTaZqKuknJpzgDElCLRB+xxlejTAhBCAn395tPluzHf9SvA+hVIxMDmc
         SCRjBUsKlV1lQ/M3MvrAAkShlILN7LspbPWYOubqHwcFYpz2WRKI1ZLyst+Ph5tWf8Nu
         erdsgYrQV6ccumsUMZXC4NTCnAuOw3G6u5jDwk58N/OjDOrb2kzi+MG0xbdDPtCrKxWH
         c2DTMm+rf5DR9j92nmbhCeKkWOl0DchL3Zvo7B5bTZ1yEzb33GIysCe5lrMORm9Uzuj9
         i0+Q==
X-Gm-Message-State: AAQBX9fbEBfiGve0/o8kvNjykZ6LHU5XG6yHugo2FM6fD7uW3WUY2zAw
        KxsnyJQMoFrR/RgTgGW8zV8=
X-Google-Smtp-Source: AKy350bFxjwO10beI7vDm1h/6YVbGTOg6QL/XHVDPvPm+gLNsjvb8zI5+1/OPVJU088rttMk/tO7KQ==
X-Received: by 2002:a17:903:41ca:b0:1a6:6d1d:bbf4 with SMTP id u10-20020a17090341ca00b001a66d1dbbf4mr1240783ple.11.1681277935289;
        Tue, 11 Apr 2023 22:38:55 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id ix10-20020a170902f80a00b001a64c4023aesm619640plb.36.2023.04.11.22.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:38:54 -0700 (PDT)
From:   Jacky Huang <ychuang570808@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        arnd@arndb.de, schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v7 08/12] arm64: dts: nuvoton: Add initial ma35d1 device tree
Date:   Wed, 12 Apr 2023 05:38:20 +0000
Message-Id: <20230412053824.106-9-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412053824.106-1-ychuang570808@gmail.com>
References: <20230412053824.106-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jacky Huang <ychuang3@nuvoton.com>

Add initial device tree support for Nuvoton ma35d1 SoC, including
cpu, clock, reset, and serial controllers.
Add reference boards som-256m and iot-512m.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile          |   2 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  56 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  56 +++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 232 ++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index a99dab90472a..c11ab4eac9c7 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
+dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-iot-512m.dtb
+dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-som-256m.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
new file mode 100644
index 000000000000..b89e2be6abae
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+/dts-v1/;
+#include "ma35d1.dtsi"
+
+/ {
+	model = "Nuvoton MA35D1-IoT";
+	compatible = "nuvoton,ma35d1-iot", "nuvoton,ma35d1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	mem: memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x20000000>; /* 512M DRAM */
+	};
+
+	clk_hxt: clock-hxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_hxt";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&clk {
+	assigned-clocks = <&clk CAPLL>,
+			  <&clk DDRPLL>,
+			  <&clk APLL>,
+			  <&clk EPLL>,
+			  <&clk VPLL>;
+	assigned-clock-rates = <800000000>,
+			       <266000000>,
+			       <180000000>,
+			       <500000000>,
+			       <102000000>;
+	nuvoton,pll-mode = "integer",
+			   "fractional",
+			   "integer",
+			   "integer",
+			   "integer";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
new file mode 100644
index 000000000000..a1ebddecb7f8
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+/dts-v1/;
+#include "ma35d1.dtsi"
+
+/ {
+	model = "Nuvoton MA35D1-SOM";
+	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	mem: memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x10000000>; /* 256M DRAM */
+	};
+
+	clk_hxt: clock-hxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_hxt";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&clk {
+	assigned-clocks = <&clk CAPLL>,
+			  <&clk DDRPLL>,
+			  <&clk APLL>,
+			  <&clk EPLL>,
+			  <&clk VPLL>;
+	assigned-clock-rates = <800000000>,
+			       <266000000>,
+			       <180000000>,
+			       <500000000>,
+			       <102000000>;
+	nuvoton,pll-mode = "integer",
+			   "fractional",
+			   "integer",
+			   "integer",
+			   "integer";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
new file mode 100644
index 000000000000..94eda4b3e5da
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+#include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+/ {
+	compatible = "nuvoton,ma35d1";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		L2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@50801000 {
+		compatible = "arm,gic-400";
+		reg = <0x0 0x50801000 0 0x1000>, /* GICD */
+		      <0x0 0x50802000 0 0x2000>, /* GICC */
+		      <0x0 0x50804000 0 0x2000>, /* GICH */
+		      <0x0 0x50806000 0 0x2000>; /* GICV */
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
+			      IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		interrupt-parent = <&gic>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sys: system-management@40460000 {
+			compatible = "nuvoton,ma35d1-reset", "syscon";
+			reg = <0x0 0x40460000 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		clk: clock-controller@40460200 {
+			compatible = "nuvoton,ma35d1-clk";
+			reg = <0x00000000 0x40460200 0x0 0x100>;
+			#clock-cells = <1>;
+			clocks = <&clk_hxt>;
+		};
+
+		uart0: serial@40700000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40700000 0x0 0x100>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART0_GATE>;
+			status = "disabled";
+		};
+
+		uart1: serial@40710000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40710000 0x0 0x100>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART1_GATE>;
+			status = "disabled";
+		};
+
+		uart2: serial@40720000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40720000 0x0 0x100>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART2_GATE>;
+			status = "disabled";
+		};
+
+		uart3: serial@40730000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40730000 0x0 0x100>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART3_GATE>;
+			status = "disabled";
+		};
+
+		uart4: serial@40740000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40740000 0x0 0x100>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART4_GATE>;
+			status = "disabled";
+		};
+
+		uart5: serial@40750000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40750000 0x0 0x100>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART5_GATE>;
+			status = "disabled";
+		};
+
+		uart6: serial@40760000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40760000 0x0 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART6_GATE>;
+			status = "disabled";
+		};
+
+		uart7: serial@40770000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40770000 0x0 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART7_GATE>;
+			status = "disabled";
+		};
+
+		uart8: serial@40780000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40780000 0x0 0x100>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART8_GATE>;
+			status = "disabled";
+		};
+
+		uart9: serial@40790000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40790000 0x0 0x100>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART9_GATE>;
+			status = "disabled";
+		};
+
+		uart10: serial@407a0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407a0000 0x0 0x100>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART10_GATE>;
+			status = "disabled";
+		};
+
+		uart11: serial@407b0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407b0000 0x0 0x100>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART11_GATE>;
+			status = "disabled";
+		};
+
+		uart12: serial@407c0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407c0000 0x0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART12_GATE>;
+			status = "disabled";
+		};
+
+		uart13: serial@407d0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407d0000 0x0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART13_GATE>;
+			status = "disabled";
+		};
+
+		uart14: serial@407e0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407e0000 0x0 0x100>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART14_GATE>;
+			status = "disabled";
+		};
+
+		uart15: serial@407f0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407f0000 0x0 0x100>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART15_GATE>;
+			status = "disabled";
+		};
+
+		uart16: serial@40880000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40880000 0x0 0x100>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART16_GATE>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.34.1


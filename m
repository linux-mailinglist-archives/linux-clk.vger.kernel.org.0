Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB9B6B59CB
	for <lists+linux-clk@lfdr.de>; Sat, 11 Mar 2023 10:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCKJJD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Sat, 11 Mar 2023 04:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjCKJIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Mar 2023 04:08:09 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640A0E1AD;
        Sat, 11 Mar 2023 01:08:00 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id B468A24E22F;
        Sat, 11 Mar 2023 17:07:55 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:55 +0800
Received: from ubuntu.localdomain (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:54 +0800
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
Subject: [PATCH v5 21/21] riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device tree
Date:   Sat, 11 Mar 2023 17:07:33 +0800
Message-ID: <20230311090733.56918-22-hal.feng@starfivetech.com>
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
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Emil Renner Berthing <kernel@esmil.dk>

Add a minimal device tree for StarFive JH7110 VisionFive 2 board
which has version A and version B. Support booting and basic
clock/reset/pinctrl/uart drivers.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/Makefile         |   6 +-
 .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
 .../jh7110-starfive-visionfive-2-v1.3b.dts    |  13 ++
 .../jh7110-starfive-visionfive-2.dtsi         | 215 ++++++++++++++++++
 4 files changed, 246 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 7b00a48580ca..170956846d49 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
+
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
new file mode 100644
index 000000000000..4af3300f3cf3
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7110-starfive-visionfive-2.dtsi"
+
+/ {
+	model = "StarFive VisionFive 2 v1.2A";
+	compatible = "starfive,visionfive-2-v1.2a", "starfive,jh7110";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
new file mode 100644
index 000000000000..9230cc3d8946
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7110-starfive-visionfive-2.dtsi"
+
+/ {
+	model = "StarFive VisionFive 2 v1.3B";
+	compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
new file mode 100644
index 000000000000..2a6d81609284
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7110.dtsi"
+#include "jh7110-pinfunc.h"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		i2c0 = &i2c0;
+		i2c2 = &i2c2;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <4000000>;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x1 0x0>;
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
+		priority = <224>;
+	};
+};
+
+&gmac0_rgmii_rxin {
+	clock-frequency = <125000000>;
+};
+
+&gmac0_rmii_refin {
+	clock-frequency = <50000000>;
+};
+
+&gmac1_rgmii_rxin {
+	clock-frequency = <125000000>;
+};
+
+&gmac1_rmii_refin {
+	clock-frequency = <50000000>;
+};
+
+&i2srx_bclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&i2srx_lrck_ext {
+	clock-frequency = <192000>;
+};
+
+&i2stx_bclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&i2stx_lrck_ext {
+	clock-frequency = <192000>;
+};
+
+&mclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&rtc_osc {
+	clock-frequency = <32768>;
+};
+
+&tdm_ext {
+	clock-frequency = <49152000>;
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+	status = "okay";
+};
+
+&i2c6 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_pins>;
+	status = "okay";
+};
+
+&sysgpio {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(57, GPOUT_LOW,
+					      GPOEN_SYS_I2C0_CLK,
+					      GPI_SYS_I2C0_CLK)>,
+				 <GPIOMUX(58, GPOUT_LOW,
+					      GPOEN_SYS_I2C0_DATA,
+					      GPI_SYS_I2C0_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(3, GPOUT_LOW,
+					     GPOEN_SYS_I2C2_CLK,
+					     GPI_SYS_I2C2_CLK)>,
+				 <GPIOMUX(2, GPOUT_LOW,
+					     GPOEN_SYS_I2C2_DATA,
+					     GPI_SYS_I2C2_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(19, GPOUT_LOW,
+					      GPOEN_SYS_I2C5_CLK,
+					      GPI_SYS_I2C5_CLK)>,
+				 <GPIOMUX(20, GPOUT_LOW,
+					      GPOEN_SYS_I2C5_DATA,
+					      GPI_SYS_I2C5_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c6_pins: i2c6-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(16, GPOUT_LOW,
+					      GPOEN_SYS_I2C6_CLK,
+					      GPI_SYS_I2C6_CLK)>,
+				 <GPIOMUX(17, GPOUT_LOW,
+					      GPOEN_SYS_I2C6_DATA,
+					      GPI_SYS_I2C6_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
+					     GPOEN_ENABLE,
+					     GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pinmux = <GPIOMUX(6, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_UART0_RX)>;
+			bias-disable; /* external pull-up */
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
-- 
2.38.1


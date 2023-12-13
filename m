Return-Path: <linux-clk+bounces-977-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F6806F0B
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 12:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4948A1F2115C
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 11:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB7134578;
	Wed,  6 Dec 2023 11:51:24 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795E51981;
	Wed,  6 Dec 2023 03:51:12 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DDD0C24E311;
	Wed,  6 Dec 2023 19:51:10 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:51:10 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:51:03 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100 System-North-West clock and reset generator
Date: Wed, 6 Dec 2023 19:49:51 +0800
Message-ID: <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add bindings for the System-North-West clock and reset generator
(SYSCRG-NW) on JH8100 SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++++++++++++++++
 .../dt-bindings/clock/starfive,jh8100-crg.h   |  45 +++++++
 .../dt-bindings/reset/starfive,jh8100-crg.h   |  15 +++
 3 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh81=
00-syscrg-nw.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-sysc=
rg-nw.yaml b/Documentation/devicetree/bindings/clock/starfive,jh8100-sysc=
rg-nw.yaml
new file mode 100644
index 000000000000..b16a874828dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.y=
aml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh8100-syscrg-nw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH8100 System-North-West Clock and Reset Generator
+
+maintainers:
+  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh8100-syscrg-nw
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Oscillator (24 MHz)
+      - description: APB_BUS clock from SYSCRG
+      - description: ISP_2X clock from SYSCRG
+      - description: ISP_AXI clock from SYSCRG
+      - description: VOUT_ROOT0 clock from SYSCRG
+      - description: VOUT_ROOT1 clock from SYSCRG
+      - description: VOUT_SCAN_ATS clock from SYSCRG
+      - description: VOUT_DC_CORE clock from SYSCRG
+      - description: VOUT_AXI clock from SYSCRG
+      - description: AXI_400 clock from SYSCRG
+      - description: AXI_200 clock from SYSCRG
+      - description: Peripheral clock from SYSCRG
+      - description: External DVP clock
+      - description: External ISP DPHY TAP TCK clock
+      - description: External golbal clock
+      - description: External i2s_tscko clock
+      - description: External VOUT MIPI DPHY TAP TCK
+      - description: External VOUT eDP TAP TCK
+      - description: External SPI In2 clock
+
+  clock-names:
+    items:
+      - const: clk_osc
+      - const: sys_clk_apb_bus
+      - const: sys_clk_isp_2x
+      - const: sys_clk_isp_axi
+      - const: sys_clk_vout_root0
+      - const: sys_clk_vout_root1
+      - const: sys_clk_vout_scan_ats
+      - const: sys_clk_vout_dc_core
+      - const: sys_clk_vout_axi
+      - const: sys_clk_axi_400
+      - const: sys_clk_axi_200
+      - const: sys_clk_perh_root_preosc
+      - const: clk_dvp_ext
+      - const: clk_isp_dphy_tap_tck_ext
+      - const: clk_glb_ext_clk
+      - const: clk_i2s_tscko
+      - const: clk_vout_mipi_dphy_tap_tck_ext
+      - const: clk_vout_edp_tap_tck_ext
+      - const: clk_spi_in2_ext
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh8100-crg.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/starfive,jh8100-crg.h> for valid indices.
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
+    #include <dt-bindings/clock/starfive,jh8100-crg.h>
+
+    clock-controller@123c0000 {
+            compatible =3D "starfive,jh8100-syscrg-nw";
+            reg =3D <0x123c0000 0x10000>;
+            clocks =3D <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
+                     <&syscrg SYSCRG_CLK_ISP_2X>,
+                     <&syscrg SYSCRG_CLK_ISP_AXI>,
+                     <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
+                     <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
+                     <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
+                     <&syscrg SYSCRG_CLK_VOUT_DC_CORE>,
+                     <&syscrg SYSCRG_CLK_VOUT_AXI>,
+                     <&syscrg SYSCRG_CLK_AXI_400>,
+                     <&syscrg SYSCRG_CLK_AXI_200>,
+                     <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
+                     <&clk_dvp_ext>,
+                     <&clk_isp_dphy_tap_tck_ext>,
+                     <&clk_glb_ext_clk>,
+                     <&clk_i2s_tscko>,
+                     <&clk_vout_mipi_dphy_tap_tck_ext>,
+                     <&clk_vout_edp_tap_tck_ext>,
+                     <&clk_spi_in2_ext>;
+            clock-names =3D "clk_osc", "sys_clk_apb_bus", "sys_clk_isp_2=
x",
+                          "sys_clk_isp_axi", "sys_clk_vout_root0",
+                          "sys_clk_vout_root1", "sys_clk_vout_scan_ats",
+                          "sys_clk_vout_dc_core", "sys_clk_vout_axi",
+                          "sys_clk_axi_400", "sys_clk_axi_200",
+                          "sys_clk_perh_root_preosc", "clk_dvp_ext",
+                          "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
+                          "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_e=
xt",
+                          "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
+            #clock-cells =3D <1>;
+            #reset-cells =3D <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh8100-crg.h b/include/dt=
-bindings/clock/starfive,jh8100-crg.h
index e5bb588ce798..8417455c2409 100644
--- a/include/dt-bindings/clock/starfive,jh8100-crg.h
+++ b/include/dt-bindings/clock/starfive,jh8100-crg.h
@@ -120,4 +120,49 @@
 #define SYSCRG_CLK_NNE_ICG_EN						108
=20
 #define SYSCRG_CLK_END							109
+
+/* SYSCRG_NW_CLK */
+#define SYSCRG_NW_CLK_PLL5_DIV2						0
+#define SYSCRG_NW_CLK_GCLK5						1
+#define SYSCRG_NW_CLK_GPIO_100						2
+#define SYSCRG_NW_CLK_GPIO_50						3
+#define SYSCRG_NW_CLK_GPIO_150						4
+#define SYSCRG_NW_CLK_GPIO_60						5
+#define SYSCRG_NW_CLK_IOMUX_WEST_PCLK					6
+#define SYSCRG_NW_CLK_I2C6_APB						7
+#define SYSCRG_NW_CLK_I2C7_APB						8
+#define SYSCRG_NW_CLK_SPI2_APB						9
+#define SYSCRG_NW_CLK_SPI2_CORE						10
+#define SYSCRG_NW_CLK_SPI2_SCLK_IN					11
+#define SYSCRG_NW_CLK_SMBUS1_APB					12
+#define SYSCRG_NW_CLK_SMBUS1_CORE					13
+#define SYSCRG_NW_CLK_ISP_DVP						14
+#define SYSCRG_NW_CLK_ISP_CORE_2X					15
+#define SYSCRG_NW_CLK_ISP_AXI						16
+#define SYSCRG_NW_CLK_ISP_DPHY_TAP_TCK					17
+#define SYSCRG_NW_CLK_FLEXNOC_ISPSLV					18
+#define SYSCRG_NW_CLK_VOUT_PIX0						19
+#define SYSCRG_NW_CLK_VOUT_PIX1						20
+#define SYSCRG_NW_CLK_VOUT_SCAN_ATS					21
+#define SYSCRG_NW_CLK_VOUT_DC_CORE					22
+#define SYSCRG_NW_CLK_VOUT_APB						23
+#define SYSCRG_NW_CLK_VOUT_DSI						24
+#define SYSCRG_NW_CLK_VOUT_AHB						25
+#define SYSCRG_NW_CLK_VOUT_AXI						26
+#define SYSCRG_NW_CLK_VOUT_MIPI_DPHY_TAP_TCK				27
+#define SYSCRG_NW_CLK_VOUT_EDP_PHY_TAP_TCK				28
+#define SYSCRG_NW_CLK_UART5_CORE_PREOSC					29
+#define SYSCRG_NW_CLK_UART5_APB						30
+#define SYSCRG_NW_CLK_UART5_CORE					31
+#define SYSCRG_NW_CLK_UART6_CORE_PREOSC					32
+#define SYSCRG_NW_CLK_UART6_APB						33
+#define SYSCRG_NW_CLK_UART6_CORE					34
+#define SYSCRG_NW_CLK_SPI2_ICG_EN					35
+#define SYSCRG_NW_CLK_SMBUS1_ICG_EN					36
+#define SYSCRG_NW_CLK_ISP_ICG_EN					37
+#define SYSCRG_NW_CLK_VOUT_ICG_EN					38
+#define SYSCRG_NW_CLK_UART5_ICG_EN					39
+#define SYSCRG_NW_CLK_UART6_ICG_EN					40
+
+#define SYSCRG_NW_CLK_END						41
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH8100_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh8100-crg.h b/include/dt=
-bindings/reset/starfive,jh8100-crg.h
index 3b7b92488e76..8c3a858bdf6a 100644
--- a/include/dt-bindings/reset/starfive,jh8100-crg.h
+++ b/include/dt-bindings/reset/starfive,jh8100-crg.h
@@ -20,4 +20,19 @@
=20
 #define SYSCRG_RESET_NR_RESETS					8
=20
+/*
+ * syscrg_nw: assert0
+ */
+#define SYSCRG_NW_RSTN_PRESETN					0
+#define SYSCRG_NW_RSTN_SYS_IOMUX_W				1
+#define SYSCRG_NW_RSTN_I2C6					2
+#define SYSCRG_NW_RSTN_I2C7					3
+#define SYSCRG_NW_RSTN_SPI2					4
+#define SYSCRG_NW_RSTN_SMBUS1					5
+#define SYSCRG_NW_RSTN_UART5					6
+#define SYSCRG_NW_RSTN_UART6					7
+#define SYSCRG_NW_RSTN_MERAK0_TVSENSOR				8
+#define SYSCRG_NW_RSTN_MERAK1_TVSENSOR				9
+
+#define SYSCRG_NW_RESET_NR_RESETS				10
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH8100_H__ */
--=20
2.34.1



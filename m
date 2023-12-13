Return-Path: <linux-clk+bounces-986-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA29806F37
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 12:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F691F21645
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 11:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A423B34CFE;
	Wed,  6 Dec 2023 11:54:22 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2145E212A;
	Wed,  6 Dec 2023 03:51:59 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2D48B24E2D2;
	Wed,  6 Dec 2023 19:51:58 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:51:58 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:51:50 +0800
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
Subject: [PATCH v1 13/16] dt-bindings: clock: Add StarFive JH8100 Always-On clock and reset generator
Date: Wed, 6 Dec 2023 19:49:57 +0800
Message-ID: <20231206115000.295825-14-jeeheng.sia@starfivetech.com>
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

Add bindings for the Always-On clock and reset generator
(AONCRG) on JH8100 SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 .../clock/starfive,jh8100-aoncrg.yaml         | 77 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh8100-crg.h   | 69 +++++++++++++++++
 .../dt-bindings/reset/starfive,jh8100-crg.h   | 18 +++++
 3 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh81=
00-aoncrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-aonc=
rg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh8100-aoncrg.=
yaml
new file mode 100644
index 000000000000..fd55bf212259
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-aoncrg.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh8100-aoncrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH8100 Always-On Clock and Reset Generator
+
+maintainers:
+  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh8100-aoncrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Oscillator (24 MHz)
+      - description: GMAC0 RMII func
+      - description: GMAC0 RGMII func
+      - description: AON 125MHz clock
+      - description: AON 2000MHz clock
+      - description: AON 200MHz clock
+      - description: AON 667MHz clock
+      - description: RTC clock
+
+  clock-names:
+    items:
+      - const: clk_osc
+      - const: clk_gmac0_rmii_func
+      - const: clk_gmac0_rgmii_func
+      - const: clk_aon125
+      - const: clk_aon2000
+      - const: clk_aon200
+      - const: clk_aon667
+      - const: clk_rtc
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh8100-crg.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/starfive-jh8100-crg.h> for valid indices.
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
+    clock-controller@1f310000 {
+            compatible =3D "starfive,jh8100-aoncrg";
+            reg =3D <0x1f310000 0x10000>;
+            clocks =3D <&clk_osc>, <&clk_gmac0_rmii_func>,
+                     <&clk_gmac0_rgmii_func>, <&clk_aon125>,
+                     <&clk_aon2000>, <&clk_aon200>,
+                     <&clk_aon667>, <&clk_rtc>;
+            clock-names =3D "clk_osc", "clk_gmac0_rmii_func", "clk_gmac0=
_rgmii_func",
+                          "clk_aon125", "clk_aon2000", "clk_aon200",
+                          "clk_aon667", "clk_rtc";
+            #clock-cells =3D <1>;
+            #reset-cells =3D <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh8100-crg.h b/include/dt=
-bindings/clock/starfive,jh8100-crg.h
index 3ce0b9ec66be..65e719bd51a5 100644
--- a/include/dt-bindings/clock/starfive,jh8100-crg.h
+++ b/include/dt-bindings/clock/starfive,jh8100-crg.h
@@ -358,4 +358,73 @@
 #define SYSCRG_SW_CLK_VDEC_ICG_EN					9
=20
 #define SYSCRG_SW_CLK_END						10
+
+/* AONCRG_CLK */
+#define AONCRG_CLK_GMAC0_RMII_REFIN					0
+#define AONCRG_CLK_GMAC0_RGMII_RXIN					1
+#define AONCRG_CLK_GMAC0_GTXCLK						2
+#define AONCRG_CLK_AON_1000						3
+#define AONCRG_CLK_AON_400						4
+#define AONCRG_CLK_AON_400_POSTOSC					5
+#define AONCRG_CLK_AON_500						6
+#define AONCRG_CLK_AON_500_POSTOSC					7
+#define AONCRG_CLK_XSPI_PHY						8
+#define AONCRG_CLK_AON_100						9
+#define AONCRG_CLK_AON_100_POSTOSC					10
+#define AONCRG_CLK_AON_50_POSTOSC					11
+#define AONCRG_CLK_DDR50_POSTOCC_ICG					12
+#define AONCRG_CLK_DDR100_POSTOCC_ICG					13
+#define AONCRG_CLK_PUFRT_APB						14
+#define AONCRG_CLK_RTC_HMS_APB						15
+#define AONCRG_CLK_RTC_INTERNAL						16
+#define AONCRG_CLK_RTC_HMS_OSC32K					17
+#define AONCRG_CLK_RTC_HMS_CAL						18
+#define AONCRG_CLK_GMAC0_AXI128_AHB					19
+#define AONCRG_CLK_GMAC0_AXI128_MSTRCLK					20
+#define AONCRG_CLK_GMAC0_AXI128_AXI					21
+#define AONCRG_CLK_GMAC0_RMII_RTX					22
+#define AONCRG_CLK_GMAC0_AXI128_TX					23
+#define AONCRG_CLK_GMAC0_AXI128_TX_INV					24
+#define AONCRG_CLK_GMAC0_AXI128_RX					25
+#define AONCRG_CLK_GMAC0_AXI128_RX_INV					26
+#define AONCRG_CLK_GMAC0_GTXC						27
+#define AONCRG_CLK_XSPI_AXI						28
+#define AONCRG_CLK_XSPI_APB						29
+#define AONCRG_CLK_XSPI_XSPI_PHY					30
+#define AONCRG_CLK_TVSENSOR_PCLK					31
+#define AONCRG_CLK_TVSENSOR_TSADC					32
+#define AONCRG_CLK_TVSENSOR_BG						33
+#define AONCRG_CLK_MEU_PCLK_AP						34
+#define AONCRG_CLK_MEU_PCLK_SCP						35
+#define AONCRG_CLK_MEU_MEM_AXI						36
+#define AONCRG_CLK_AXIMEM_128B_ACLK					37
+#define AONCRG_CLK_APB2BISR_APB						38
+#define AONCRG_CLK_APB2BISR_BISR					39
+#define AONCRG_CLK_EMMC_S_PCLK						40
+#define AONCRG_CLK_EMMC_MSTRCLK						41
+#define AONCRG_CLK_EMMC							42
+#define AONCRG_CLK_EMMC_SDMCLK						43
+#define AONCRG_CLK_EMMC_SDPHY_PCLK					44
+#define AONCRG_CLK_SDIO0_PCLK						45
+#define AONCRG_CLK_SDIO0_MSTRCLK					46
+#define AONCRG_CLK_SDIO0						47
+#define AONCRG_CLK_SDIO0_SDMCLK						48
+#define AONCRG_CLK_SDIO0_SDPHY_PCLK					49
+#define AONCRG_CLK_HCLK							50
+#define AONCRG_CLK_ACLK							51
+#define AONCRG_CLK_PERF_MSTRCLK						52
+#define AONCRG_CLK_PERF_SLVCLK						53
+#define AONCRG_CLK_GCLK0						54
+#define AONCRG_CLK_GCLK_OSC						55
+#define AONCRG_CLK_RTC_ICG_EN						56
+#define AONCRG_CLK_GMAC0_ICG_EN						57
+#define AONCRG_CLK_XSPI_ICG_EN						58
+#define AONCRG_CLK_TVSENSOR0_ICG_EN					59
+#define AONCRG_CLK_MEU_ICG_EN						60
+#define AONCRG_CLK_APB2BISR_ICG_EN					61
+#define AONCRG_CLK_EMMC_ICG_EN						62
+#define AONCRG_CLK_SDIO0_ICG_EN						63
+#define AONCRG_CLK_TOP_ICG_EN					64
+
+#define AONCRG_CLK_END							65
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH8100_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh8100-crg.h b/include/dt=
-bindings/reset/starfive,jh8100-crg.h
index 55209382e00e..a89ba78b9bf8 100644
--- a/include/dt-bindings/reset/starfive,jh8100-crg.h
+++ b/include/dt-bindings/reset/starfive,jh8100-crg.h
@@ -106,4 +106,22 @@
 #define SYSCRG_SW_RSTN_DDR_TVSENSOR				3
=20
 #define SYSCRG_SW_RESET_NR_RESETS				4
+
+/*
+ * aoncrg
+ */
+#define AONCRG_RSTN_AON_IOMUX_PRESETN				0
+#define AONCRG_RSTN_RTC						1
+#define AONCRG_RSTN_GMAC0					2
+#define AONCRG_RSTN_XSPI					3
+#define AONCRG_RSTN_TVSENSOR					4
+#define AONCRG_RSTN_MEU						5
+#define AONCRG_RSTN_AXIMEM_128B_ARESET				6
+#define AONCRG_RSTN_APB2BISR_APB				7
+#define AONCRG_RSTN_SDIO0					8
+#define AONCRG_RSTN_EMMC					9
+#define AONCRG_RSTN_TOP						10
+#define AONCRG_RSTN_IRQ_CTRL					11
+
+#define AONCRG_RESET_NR_RESETS					12
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH8100_H__ */
--=20
2.34.1



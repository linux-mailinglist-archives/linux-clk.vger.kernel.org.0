Return-Path: <linux-clk+bounces-981-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BD806F16
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 12:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA93281BD8
	for <lists+linux-clk@lfdr.de>; Wed,  6 Dec 2023 11:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D2F347D3;
	Wed,  6 Dec 2023 11:52:07 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2906F10C3;
	Wed,  6 Dec 2023 03:51:43 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8B6D77FD6;
	Wed,  6 Dec 2023 19:51:42 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:51:42 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:51:35 +0800
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
Subject: [PATCH v1 11/16] dt-bindings: clock: Add StarFive JH8100 System-South-West clock and reset generator
Date: Wed, 6 Dec 2023 19:49:55 +0800
Message-ID: <20231206115000.295825-12-jeeheng.sia@starfivetech.com>
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

Add bindings for the System-South-West clock and reset generator
(SYSCRG-SW) on JH8100 SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 .../clock/starfive,jh8100-syscrg-sw.yaml      | 66 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh8100-crg.h   | 14 ++++
 .../dt-bindings/reset/starfive,jh8100-crg.h   | 10 +++
 3 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh81=
00-syscrg-sw.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-sysc=
rg-sw.yaml b/Documentation/devicetree/bindings/clock/starfive,jh8100-sysc=
rg-sw.yaml
new file mode 100644
index 000000000000..8bd41af040b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-sw.y=
aml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh8100-syscrg-sw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH8100 System-South-West Clock And Reset Generator
+
+maintainers:
+  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh8100-syscrg-sw
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB_BUS clock from SYSCRG
+      - description: VDEC_ROOT clock from SYSCRG
+      - description: FLEXNOC1 clock from SYSCRG
+
+  clock-names:
+    items:
+      - const: sys_clk_apb_bus
+      - const: sys_clk_vdec_root
+      - const: sys_clk_flexnoc1
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
+    clock-controller@12720000 {
+            compatible =3D "starfive,jh8100-syscrg-sw";
+            reg =3D <0x12720000 0x10000>;
+            clocks =3D <&syscrg SYSCRG_CLK_APB_BUS>,
+                     <&syscrg SYSCRG_CLK_VDEC_ROOT>,
+                     <&syscrg SYSCRG_CLK_FLEXNOC1>;
+            clock-names =3D "sys_clk_apb_bus",
+                          "sys_clk_vdec_root",
+                          "sys_clk_flexnoc1";
+            #clock-cells =3D <1>;
+            #reset-cells =3D <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh8100-crg.h b/include/dt=
-bindings/clock/starfive,jh8100-crg.h
index b30ccd16a802..3ce0b9ec66be 100644
--- a/include/dt-bindings/clock/starfive,jh8100-crg.h
+++ b/include/dt-bindings/clock/starfive,jh8100-crg.h
@@ -344,4 +344,18 @@
 #define SYSCRG_NE_CLK_SMBUS0_ICG_EN					174
=20
 #define SYSCRG_NE_CLK_END						175
+
+/* SYSCRG_SW_CLK */
+#define SYSCRG_SW_CLK_JPEG_AXI						0
+#define SYSCRG_SW_CLK_VC9000DJ_AXI					1
+#define SYSCRG_SW_CLK_VC9000DJ_VDEC					2
+#define SYSCRG_SW_CLK_VC9000DJ_APB					3
+#define SYSCRG_SW_CLK_VDEC_AXI						4
+#define SYSCRG_SW_CLK_VC9000D_AXI					5
+#define SYSCRG_SW_CLK_VC9000D_VDEC					6
+#define SYSCRG_SW_CLK_VC9000D_APB					7
+#define SYSCRG_SW_CLK_JPEG_ICG_EN					8
+#define SYSCRG_SW_CLK_VDEC_ICG_EN					9
+
+#define SYSCRG_SW_CLK_END						10
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH8100_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh8100-crg.h b/include/dt=
-bindings/reset/starfive,jh8100-crg.h
index 7626da648686..55209382e00e 100644
--- a/include/dt-bindings/reset/starfive,jh8100-crg.h
+++ b/include/dt-bindings/reset/starfive,jh8100-crg.h
@@ -96,4 +96,14 @@
 #define SYSCRG_NE_RSTN_DUBHE_TVSENSOR				49
=20
 #define SYSCRG_NE_RESET_NR_RESETS				50
+
+/*
+ * syscrg_sw: assert0
+ */
+#define SYSCRG_SW_RSTN_PRESETN					0
+#define SYSCRG_SW_RSTN_VC9000DJ					1
+#define SYSCRG_SW_RSTN_VC9000D					2
+#define SYSCRG_SW_RSTN_DDR_TVSENSOR				3
+
+#define SYSCRG_SW_RESET_NR_RESETS				4
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH8100_H__ */
--=20
2.34.1



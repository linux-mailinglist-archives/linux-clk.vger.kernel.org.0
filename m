Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D4B7502CF
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jul 2023 11:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjGLJUY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Wed, 12 Jul 2023 05:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbjGLJUU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 05:20:20 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7669610F3;
        Wed, 12 Jul 2023 02:20:14 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 893F382D6;
        Wed, 12 Jul 2023 17:20:12 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:12 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:11 +0800
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v7 5/9] dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset generator
Date:   Wed, 12 Jul 2023 17:20:03 +0800
Message-ID: <20230712092007.31013-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings for the Video-Output clock and reset generator (VOUTCRG)
on the JH7110 RISC-V SoC by StarFive Ltd.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-voutcrg.yaml        | 90 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
 3 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
new file mode 100644
index 000000000000..af77bd8c86b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-voutcrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Video-Output Clock and Reset Generator
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-voutcrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Vout Top core
+      - description: Vout Top Ahb
+      - description: Vout Top Axi
+      - description: Vout Top HDMI MCLK
+      - description: I2STX0 BCLK
+      - description: external HDMI pixel
+
+  clock-names:
+    items:
+      - const: vout_src
+      - const: vout_top_ahb
+      - const: vout_top_axi
+      - const: vout_top_hdmitx0_mclk
+      - const: i2stx0_bclk
+      - const: hdmitx0_pixelclk
+
+  resets:
+    maxItems: 1
+    description: Vout Top core
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
+  power-domains:
+    maxItems: 1
+    description:
+      Vout domain power
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - '#clock-cells'
+  - '#reset-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    voutcrg: clock-controller@295C0000 {
+        compatible = "starfive,jh7110-voutcrg";
+        reg = <0x295C0000 0x10000>;
+        clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+                 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+                 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+                 <&hdmitx0_pixelclk>;
+        clock-names = "vout_src", "vout_top_ahb",
+                      "vout_top_axi", "vout_top_hdmitx0_mclk",
+                      "i2stx0_bclk", "hdmitx0_pixelclk";
+        resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        power-domains = <&pwrc JH7110_PD_VOUT>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 39acf30db491..016227c64a27 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -270,4 +270,26 @@
 
 #define JH7110_ISPCLK_END			14
 
+/* VOUTCRG clocks */
+#define JH7110_VOUTCLK_APB			0
+#define JH7110_VOUTCLK_DC8200_PIX		1
+#define JH7110_VOUTCLK_DSI_SYS			2
+#define JH7110_VOUTCLK_TX_ESC			3
+#define JH7110_VOUTCLK_DC8200_AXI		4
+#define JH7110_VOUTCLK_DC8200_CORE		5
+#define JH7110_VOUTCLK_DC8200_AHB		6
+#define JH7110_VOUTCLK_DC8200_PIX0		7
+#define JH7110_VOUTCLK_DC8200_PIX1		8
+#define JH7110_VOUTCLK_DOM_VOUT_TOP_LCD		9
+#define JH7110_VOUTCLK_DSITX_APB		10
+#define JH7110_VOUTCLK_DSITX_SYS		11
+#define JH7110_VOUTCLK_DSITX_DPI		12
+#define JH7110_VOUTCLK_DSITX_TXESC		13
+#define JH7110_VOUTCLK_MIPITX_DPHY_TXESC	14
+#define JH7110_VOUTCLK_HDMI_TX_MCLK		15
+#define JH7110_VOUTCLK_HDMI_TX_BCLK		16
+#define JH7110_VOUTCLK_HDMI_TX_SYS		17
+
+#define JH7110_VOUTCLK_END			18
+
 #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
index 2c5d9dcefffa..eaf4a0d84f6a 100644
--- a/include/dt-bindings/reset/starfive,jh7110-crg.h
+++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
@@ -195,4 +195,20 @@
 
 #define JH7110_ISPRST_END			12
 
+/* VOUTCRG resets */
+#define JH7110_VOUTRST_DC8200_AXI		0
+#define JH7110_VOUTRST_DC8200_AHB		1
+#define JH7110_VOUTRST_DC8200_CORE		2
+#define JH7110_VOUTRST_DSITX_DPI		3
+#define JH7110_VOUTRST_DSITX_APB		4
+#define JH7110_VOUTRST_DSITX_RXESC		5
+#define JH7110_VOUTRST_DSITX_SYS		6
+#define JH7110_VOUTRST_DSITX_TXBYTEHS		7
+#define JH7110_VOUTRST_DSITX_TXESC		8
+#define JH7110_VOUTRST_HDMI_TX_HDMI		9
+#define JH7110_VOUTRST_MIPITX_DPHY_SYS		10
+#define JH7110_VOUTRST_MIPITX_DPHY_TXBYTEHS	11
+
+#define JH7110_VOUTRST_END			12
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
-- 
2.25.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB4F1AD3C6
	for <lists+linux-clk@lfdr.de>; Fri, 17 Apr 2020 02:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgDQAty (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Apr 2020 20:49:54 -0400
Received: from inva020.nxp.com ([92.121.34.13]:53672 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgDQAtw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Apr 2020 20:49:52 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E429A1A0F0D;
        Fri, 17 Apr 2020 02:49:49 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C84EA1A0FCC;
        Fri, 17 Apr 2020 02:49:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 95037402C4;
        Fri, 17 Apr 2020 08:49:38 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 4/5] dt-bindings: clock: Convert i.MX6SLL clock to json-schema
Date:   Fri, 17 Apr 2020 08:41:30 +0800
Message-Id: <1587084091-5941-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587084091-5941-1-git-send-email-Anson.Huang@nxp.com>
References: <1587084091-5941-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the i.MX6SLL clock binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V2:
	- Force 'interrupts' minItem/maxItem to 2.
---
 .../devicetree/bindings/clock/imx6sll-clock.txt    | 36 -------------
 .../devicetree/bindings/clock/imx6sll-clock.yaml   | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/imx6sll-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/imx6sll-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.txt b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
deleted file mode 100644
index fee849d..0000000
--- a/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Clock bindings for Freescale i.MX6 SLL
-
-Required properties:
-- compatible: Should be "fsl,imx6sll-ccm"
-- reg: Address and length of the register set
-- #clock-cells: Should be <1>
-- clocks: list of clock specifiers, must contain an entry for each required
-  entry in clock-names
-- clock-names: should include entries "ckil", "osc", "ipp_di0" and "ipp_di1"
-
-The clock consumer should specify the desired clock by having the clock
-ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6sll-clock.h
-for the full list of i.MX6 SLL clock IDs.
-
-Examples:
-
-#include <dt-bindings/clock/imx6sll-clock.h>
-
-clks: clock-controller@20c4000 {
-		compatible = "fsl,imx6sll-ccm";
-		reg = <0x020c4000 0x4000>;
-		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
-		#clock-cells = <1>;
-		clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
-		clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
-};
-
-uart1: serial@2020000 {
-		compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
-		reg = <0x02020000 0x4000>;
-		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clks IMX6SLL_CLK_UART1_IPG>,
-			 <&clks IMX6SLL_CLK_UART1_SERIAL>;
-		clock-names = "ipg", "per";
-};
diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
new file mode 100644
index 0000000..f22b203
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imx6sll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for Freescale i.MX6 SLL
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx6sll-ccm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: 32k osc
+      - description: 24m osc
+      - description: ipp_di0 clock input
+      - description: ipp_di1 clock input
+
+  clock-names:
+    items:
+      - const: ckil
+      - const: osc
+      - const: ipp_di0
+      - const: ipp_di1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+examples:
+  # Clock Control Module node:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    clks: clock-controller@20c4000 {
+        compatible = "fsl,imx6sll-ccm";
+        reg = <0x020c4000 0x4000>;
+        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
+        clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+    };
-- 
2.7.4


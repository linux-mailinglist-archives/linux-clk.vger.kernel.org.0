Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C303A247D0B
	for <lists+linux-clk@lfdr.de>; Tue, 18 Aug 2020 05:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHRDk2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Aug 2020 23:40:28 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44740 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgHRDkM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Aug 2020 23:40:12 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EDC7200DE3;
        Tue, 18 Aug 2020 05:40:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3943C2000ED;
        Tue, 18 Aug 2020 05:40:04 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AF45B402C3;
        Tue, 18 Aug 2020 05:39:56 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org,
        fugang.duan@nxp.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 3/5] dt-bindings: serial: Convert i.MX uart to json-schema
Date:   Tue, 18 Aug 2020 11:34:43 +0800
Message-Id: <1597721685-9280-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597721685-9280-1-git-send-email-Anson.Huang@nxp.com>
References: <1597721685-9280-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the i.MX uart binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no change.
---
 .../devicetree/bindings/serial/fsl-imx-uart.txt    | 40 ----------
 .../devicetree/bindings/serial/fsl-imx-uart.yaml   | 92 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
deleted file mode 100644
index 9582fc2..0000000
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Freescale i.MX Universal Asynchronous Receiver/Transmitter (UART)
-
-Required properties:
-- compatible : Should be "fsl,<soc>-uart"
-- reg : Address and length of the register set for the device
-- interrupts : Should contain uart interrupt
-
-Optional properties:
-- fsl,dte-mode : Indicate the uart works in DTE mode. The uart works
-                  in DCE mode by default.
-- fsl,inverted-tx , fsl,inverted-rx : Indicate that the hardware attached
-  to the peripheral inverts the signal transmitted or received,
-  respectively, and that the peripheral should invert its output/input
-  using the INVT/INVR registers.
-- rs485-rts-delay, rs485-rts-active-low, rs485-rx-during-tx,
-  linux,rs485-enabled-at-boot-time: see rs485.txt. Note that for RS485
-  you must enable either the "uart-has-rtscts" or the "rts-gpios"
-  properties. In case you use "uart-has-rtscts" the signal that controls
-  the transceiver is actually CTS_B, not RTS_B. CTS_B is always output,
-  and RTS_B is input, regardless of dte-mode.
-
-Please check Documentation/devicetree/bindings/serial/serial.yaml
-for the complete list of generic properties.
-
-Note: Each uart controller should have an alias correctly numbered
-in "aliases" node.
-
-Example:
-
-aliases {
-	serial0 = &uart1;
-};
-
-uart1: serial@73fbc000 {
-	compatible = "fsl,imx51-uart", "fsl,imx21-uart";
-	reg = <0x73fbc000 0x4000>;
-	interrupts = <31>;
-	uart-has-rtscts;
-	fsl,dte-mode;
-};
diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
new file mode 100644
index 0000000..cba3f83
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX Universal Asynchronous Receiver/Transmitter (UART)
+
+maintainers:
+  - Fabio Estevam <fabio.estevam@nxp.com>
+
+allOf:
+  - $ref: "serial.yaml"
+  - $ref: "rs485.yaml"
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx1-uart
+      - const: fsl,imx21-uart
+      - const: fsl,imx53-uart
+      - const: fsl,imx6q-uart
+      - items:
+          - enum:
+            - fsl,imx25-uart
+            - fsl,imx27-uart
+            - fsl,imx31-uart
+            - fsl,imx35-uart
+            - fsl,imx50-uart
+            - fsl,imx51-uart
+          - const: fsl,imx21-uart
+      - items:
+          - enum:
+            - fsl,imx6sl-uart
+            - fsl,imx6sll-uart
+            - fsl,imx6sx-uart
+            - fsl,imx6ul-uart
+            - fsl,imx7d-uart
+          - const: fsl,imx6q-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  fsl,dte-mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Indicate the uart works in DTE mode. The uart works in DCE mode by default.
+
+  fsl,inverted-tx:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Indicate that the hardware attached to the peripheral inverts the signal
+      transmitted, and that the peripheral should invert its output using the
+      INVT registers.
+
+  fsl,inverted-rx:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Indicate that the hardware attached to the peripheral inverts the signal
+      received, and that the peripheral should invert its input using the
+      INVR registers.
+
+  uart-has-rtscts: true
+
+  rs485-rts-delay: true
+  rs485-rts-active-low: true
+  rs485-rx-during-tx: true
+  linux,rs485-enabled-at-boot-time: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    aliases {
+        serial0 = &uart1;
+    };
+
+    uart1: serial@73fbc000 {
+        compatible = "fsl,imx51-uart", "fsl,imx21-uart";
+        reg = <0x73fbc000 0x4000>;
+        interrupts = <31>;
+        uart-has-rtscts;
+        fsl,dte-mode;
+    };
-- 
2.7.4


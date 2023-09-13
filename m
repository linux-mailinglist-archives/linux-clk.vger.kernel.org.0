Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8B279E3EB
	for <lists+linux-clk@lfdr.de>; Wed, 13 Sep 2023 11:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239190AbjIMJkP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Sep 2023 05:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238849AbjIMJkO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Sep 2023 05:40:14 -0400
Received: from hsmtpd-def.xspmail.jp (hsmtpd-def.xspmail.jp [202.238.198.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D704319A9
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 02:40:10 -0700 (PDT)
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by hsmtpd-out-2.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
        id 442df404-0834-4cb3-ba72-c9c658ddbebf;
        Wed, 13 Sep 2023 18:24:04 +0900 (JST)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
        by sakura.ysato.name (Postfix) with ESMTPSA id 810BA1C0198;
        Wed, 13 Sep 2023 18:24:04 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        glaubitz@physik.fu-berlin.de, linux-clk@vger.kernel.org
Subject: [RFC PATCH v2 13/30] Documentation/devicetree: Add renesas,sh7751-cpg binding document.
Date:   Wed, 13 Sep 2023 18:23:38 +0900
Message-Id: <66ed5e27cb600f3317d315c4fd60bd3e9eb09c17.1694596125.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694596125.git.ysato@users.sourceforge.jp>
References: <cover.1694596125.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/clock/renesas,sh7750-cpg.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
new file mode 100644
index 000000000000..bf10a09440ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,cpg-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SH7750 / SH7751 Clock Pulse Generator (CPG)
+
+maintainers:
+  - Yoshinori Sato <ysato@users.sourceforge.jp>
+
+description:
+  The Clock Pulse Generator (CPG) generates core clocks for the SoC.  It
+  includes PLLs, and fixed and variable ratio dividers.
+
+  The CPG may also provide a Clock Domain for SoC devices,
+
+properties:
+  compatible:
+      - const: renesas,sh7750-cpg	# SH7750 / 7750S / 7751
+      - items:
+          - const: renesas,sh7750r-cpg	# SH7750R / 7751R
+
+  reg:
+    maxItems: 2
+    items:
+      - description: FRQCR register
+      - description: WDT registers
+
+  clocks: true
+
+  '#clock-cells':
+    const: 1
+
+  renesas,mode:
+    description: Board-specific settings of the MD0 - MD2 bits
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 6
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+        cpg: cpg@ffc00000 {
+		#clock-cells = <1>;
+	        compatible = "renesas,sh7750r-cpg","renesas,sh7750-cpg";
+    		clocks = <&xtal>;
+		reg = <0xffc00000 2>, <0xffc00008 4>;
+		renesas,mode = <0x05>
+        };
-- 
2.39.2


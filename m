Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DC14265E1
	for <lists+linux-clk@lfdr.de>; Fri,  8 Oct 2021 10:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhJHI2w (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Oct 2021 04:28:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:41891 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbhJHI2v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 04:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633681616; x=1665217616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2WvBJoWG6j0VjjRmv9XAuxDaSLYBrOksj06LTTUf0/o=;
  b=ba6NZaXAe1BMhcwlytomrABm0fhgw0S3p9MMiYDAADmr/F+Nzo17FrVe
   +TV720KU5FTPdPH5WaU3LfwZrQcs5/nIFFZ4f2/XDpdqjYjsjDKgPwIoR
   hrX4IqLOpsN2vs0jARzlE1PLohlCefUYpa5PZ7sHvYXhXkN/yjOsM/D7M
   6iYoQbIwvyaBb/PaslCosg9D/rkyFjZC8dMWa070HW/FxAqNF3N0WU4LA
   OjAZPPMV/2lg1o0B3XdOjRjhYyekhGXokQ2YfWTd2Db2LjRHskkIjgwBR
   1Q/031VMxGWq0J26S3yCExO4m/OihtW6tRw7ncWSlAZbJOyatRQu0G4yc
   w==;
IronPort-SDR: Ju8DJh+boz93YBO9wvcOefm/61NjoK7o1h2KhKR6WbdMeycYOHxsWYJBdL8kdiH73AvV0GdXsn
 7T6PtfmLJDKQquEPCv8N0HyN/kP2Fk4ar+3BbGXqrYrmETDkPDuwrXINPcyLy/hDhKlj7VO/Os
 JCfQCgwUx4U8Y4AauO/AP4BECkgZtRrkjwpXDqtQfHOPLq/M6RCakz2UIE9yOCn5Gf4mhroekx
 FgMe4657EyDsWaoUF6SPX3ZddIViIq+Q6yJvPNbKGyv8fzTCjibExhpn95VNdJlH/6KWEpDiAA
 syKJarbJ3zjKytu090bskOTM
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="147261273"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Oct 2021 01:26:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Oct 2021 01:26:55 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Oct 2021 01:26:52 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <nicolas.ferre@microchip.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Eugen.Hristev@microchip.com>, <Kavyasree.Kotagiri@microchip.com>,
        <Manohar.Puri@microchip.com>
Subject: [PATCH v8 2/3] dt-bindings: clock: lan966x: Add LAN966X Clock Controller
Date:   Fri, 8 Oct 2021 13:56:34 +0530
Message-ID: <20211008082635.31774-3-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211008082635.31774-1-kavyasree.kotagiri@microchip.com>
References: <20211008082635.31774-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the DT bindings documentation for lan966x SoC
generic clock controller.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v7 -> v8:
- No changes.

v6 -> v7:
- No changes.

v5 -> v6:
- Removed "_clk" in clock-names.
- Added Reviewed-by.

v4 -> v5:
- In v4 dt-bindings, missed adding "clock-names" in required
  properties and example. So, added them.

v3 -> v4:
- Updated "clocks" description.
- Added "clock-names".

v2 -> v3:
- Fixed dt_binding_check errors.

v1 -> v2:
- Updated example provided for clk controller DT node.

 .../bindings/clock/microchip,lan966x-gck.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,lan966x-gck.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,lan966x-gck.yaml b/Documentation/devicetree/bindings/clock/microchip,lan966x-gck.yaml
new file mode 100644
index 000000000000..fca83bd68e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,lan966x-gck.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,lan966x-gck.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN966X Generic Clock Controller
+
+maintainers:
+  - Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
+
+description: |
+  The LAN966X Generic clock controller contains 3 PLLs - cpu_clk,
+  ddr_clk and sys_clk. This clock controller generates and supplies
+  clock to various peripherals within the SoC.
+
+properties:
+  compatible:
+    const: microchip,lan966x-gck
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: CPU clock source
+      - description: DDR clock source
+      - description: System clock source
+
+  clock-names:
+    items:
+      - const: cpu
+      - const: ddr
+      - const: sys
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clks: clock-controller@e00c00a8 {
+        compatible = "microchip,lan966x-gck";
+        #clock-cells = <1>;
+        clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+        clock-names = "cpu", "ddr", "sys";
+        reg = <0xe00c00a8 0x38>;
+    };
+...
-- 
2.17.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E700E36B636
	for <lists+linux-clk@lfdr.de>; Mon, 26 Apr 2021 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhDZP4A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Apr 2021 11:56:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53086 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbhDZPz6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Apr 2021 11:55:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13QFt6oe122082;
        Mon, 26 Apr 2021 10:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1619452506;
        bh=jexecR9/N1z8Aia7OdaqZaMfzWK4vBKhV7ZDwuuuPdY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qNqo82ZOhTzSl77Ne7bRQvhNLIkzoAJIO/4/aSMyX0Bv3d9N+TycieR/M3sRnKi2D
         RN0ze57zhghvPKk6yjdGlXgkX0XAWUqRE0frC/izj3qKr3B5gtHrskJmS7GiKglxDE
         RO+qpZLPL/WP2WowAq/8XEmHB6Qf0dUR8Den37qc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13QFt5E4096585
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Apr 2021 10:55:06 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 26
 Apr 2021 10:55:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 26 Apr 2021 10:55:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13QFt5mr024694;
        Mon, 26 Apr 2021 10:55:05 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 2/4] dt-bindings: clock: Convert ti,sci-clk to json schema
Date:   Mon, 26 Apr 2021 10:54:55 -0500
Message-ID: <20210426155457.21221-3-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210426155457.21221-1-nm@ti.com>
References: <20210426155457.21221-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the ti,sci-clk to json schema for better checks and documentation.

Differences being:
 - Drop consumer example as they are documented in the corresponding
   bindings themselves.
 - Standardize the node name as clock-controller rather than clocks as
   it is more appropriate.
 - Drop phandle description for clock-cells as it is redundant.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Tero Kristo <kristo@kernel.org>
---

Changes since V1:
 * reviewed by from Tero
   https://lore.kernel.org/linux-arm-kernel/56388707-c8d3-ebdf-77a2-c5a983856b4d@kernel.org/
 * Updated commit message to drop the 'checkpatch warning'
 * Dropped reference to clock.yaml

v1: https://lore.kernel.org/linux-arm-kernel/20210416063721.20538-3-nm@ti.com/

 .../devicetree/bindings/clock/ti,sci-clk.txt  | 36 --------------
 .../devicetree/bindings/clock/ti,sci-clk.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti,sci-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
deleted file mode 100644
index 4e59dc6b1778..000000000000
--- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Texas Instruments TI-SCI Clocks
-===============================
-
-All clocks on Texas Instruments' SoCs that contain a System Controller,
-are only controlled by this entity. Communication between a host processor
-running an OS and the System Controller happens through a protocol known
-as TI-SCI[1]. This clock implementation plugs into the common clock
-framework and makes use of the TI-SCI protocol on clock API requests.
-
-[1] Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
-
-Required properties:
--------------------
-- compatible: Must be "ti,k2g-sci-clk"
-- #clock-cells: Shall be 2.
-  In clock consumers, this cell represents the device ID and clock ID
-  exposed by the PM firmware. The list of valid values for the device IDs
-  and clocks IDs for 66AK2G SoC are documented at
-  http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
-
-Examples:
---------
-
-pmmc: pmmc {
-	compatible = "ti,k2g-sci";
-
-	k2g_clks: clocks {
-		compatible = "ti,k2g-sci-clk";
-		#clock-cells = <2>;
-	};
-};
-
-uart0: serial@2530c00 {
-	compatible = "ns16550a";
-	clocks = <&k2g_clks 0x2c 0>;
-};
diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
new file mode 100644
index 000000000000..0e370289a053
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,sci-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-SCI clock controller node bindings
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+description: |
+  Some TI SoCs contain a system controller (like the Power Management Micro
+  Controller (PMMC) on Keystone 66AK2G SoC) that are responsible for controlling
+  the state of the various hardware modules present on the SoC. Communication
+  between the host processor running an OS and the system controller happens
+  through a protocol called TI System Control Interface (TI-SCI protocol).
+
+  This clock controller node uses the TI SCI protocol to perform various clock
+  management of various hardware modules (devices) present on the SoC. This
+  node must be a child node of the associated TI-SCI system controller node.
+
+properties:
+  $nodename:
+    pattern: "^clock-controller$"
+
+  compatible:
+    const: ti,k2g-sci-clk
+
+  "#clock-cells":
+    const: 2
+    description:
+      The two cells represent values that the TI-SCI controller defines.
+
+      The first cell should contain the device ID.
+
+      The second cell should contain the clock ID.
+
+      Please see  http://processors.wiki.ti.com/index.php/TISCI for
+      protocol documentation for the values to be used for different devices.
+
+additionalProperties: false
+
+examples:
+  - |
+    k3_clks: clock-controller {
+        compatible = "ti,k2g-sci-clk";
+        #clock-cells = <2>;
+    };
-- 
2.31.0


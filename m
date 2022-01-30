Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943C94A36F0
	for <lists+linux-clk@lfdr.de>; Sun, 30 Jan 2022 15:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355207AbiA3Ovg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 30 Jan 2022 09:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355203AbiA3Ovg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 30 Jan 2022 09:51:36 -0500
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE082C061714;
        Sun, 30 Jan 2022 06:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
         s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FxdEucy7tA80MoD1Kxf5uiGRrCxiQazHuU2nauOT5/8=; b=GmoHBEoBhYTQZ8EKnhpksQGw6q
        UODXuyv9wvky8GIxc9GEzT7UBPSg7KCsTP/xGYj/Hrk2QiwDKgCyywxf7Dd2IBOaRF3nNDazSN5bc
        0EvKCnTqw00WLzW3QwETOWbDrG5LHpJBMJ6q8fEQOwRaWqXoQBzuvNbFzObjuGlXlYzE=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <nbd@nbd.name>)
        id 1nEBY8-0002if-Dl; Sun, 30 Jan 2022 15:51:28 +0100
From:   Felix Fietkau <nbd@nbd.name>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     soc@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, john@phrozen.org,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 05/13] dt-bindings: Add en7523-scu device tree binding documentation
Date:   Sun, 30 Jan 2022 15:51:08 +0100
Message-Id: <20220130145116.88406-6-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: John Crispin <john@phrozen.org>

Adds device tree binding documentation for clocks in the EN7523 SOC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 58 +++++++++++++++++++
 include/dt-bindings/clock/en7523-clk.h        | 17 ++++++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
 create mode 100644 include/dt-bindings/clock/en7523-clk.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
new file mode 100644
index 000000000000..d60e74654809
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/airoha,en7523-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EN7523 Clock Device Tree Bindings
+
+maintainers:
+  - Felix Fietkau <nbd@nbd.name>
+  - John Crispin <nbd@nbd.name>
+
+description: |
+  This node defines the System Control Unit of the EN7523 SoC,
+  a collection of registers configuring many different aspects of the SoC.
+
+  The clock driver uses it to read and configure settings of the
+  PLL controller, which provides clocks for the CPU, the bus and
+  other SoC internal peripherals.
+
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify which clock they consume.
+
+  All these identifiers can be found in:
+  [1]: <include/dt-bindings/clock/en7523-clk.h>.
+
+  The clocks are provided inside a system controller node.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,en7523-scu
+
+  reg:
+    maxItems: 2
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock number, see [1] for available
+      clocks.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/en7523-clk.h>
+    scu: system-controller@1fa20000 {
+      compatible = "airoha,en7523-scu";
+      reg = <0x1fa20000 0x400>,
+            <0x1fb00000 0x1000>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
new file mode 100644
index 000000000000..717d23a5e5ae
--- /dev/null
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_
+#define _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_
+
+#define EN7523_CLK_GSW		0
+#define EN7523_CLK_EMI		1
+#define EN7523_CLK_BUS		2
+#define EN7523_CLK_SLIC		3
+#define EN7523_CLK_SPI		4
+#define EN7523_CLK_NPU		5
+#define EN7523_CLK_CRYPTO	6
+#define EN7523_CLK_PCIE		7
+
+#define EN7523_NUM_CLOCKS	8
+
+#endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.32.0 (Apple Git-132)


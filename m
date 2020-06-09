Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C1E1F35B6
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jun 2020 10:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgFIIHj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Jun 2020 04:07:39 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35433 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIIHi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Jun 2020 04:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591690057; x=1623226057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ZRgHyR7eaQxBSmCf9+/YJqcKtpYgQquClsNmaPOZws=;
  b=B9Osgtbr5iqb8F5ux1IeGdsaoickpdQZTOhuH3hOwVdRz9p08DwTj4cP
   i5bsTFGjX0F7uBeyAMEkocBYtNgaVZKYgNlAo5INwwnGmNIaUu1ypl3Cn
   Q3Z05DXbEtVAuPyp8Gik5pyKSws3nKHCoYc5AdZMc8VPJCqicesinbkGv
   a4HlsbnvwFgKTEa9onoESLSCC6cFJlqXOoIV0emrNlTyiMquMH5uRBmcI
   iXiINWiOblqpvTxAToFdHisk82J4NHjwyyGt3INZNLbVcZPJ7nV1pjHDR
   nu/PmNpQak1x8OAt9j1/qk9Np1bZaFMkWgNb/mzpQVpWVxahbrAmM9QAc
   g==;
IronPort-SDR: RjOhFtpkmZ128gT0j3F+3j2mTuMXCigKJY6U7cS1ZRM5NYDx/g34g5GDf/fKNv/GYE3BQXG7BK
 4LOnHR0xIqYY1DYj11oXF+vA7Wpt8b6GHcfUE38oA48jV+WeLQ1Uh+PYE39pLUN9dZgU6ATZmK
 qq/WVPvbvqisd7kbiCKf1WrpWr+d+wfmAX+164IsnkycteONTuhRWsKcUeP/Xqxmp3XTd9pxoF
 QyJWp79t4aXwORiyNhWoIioJGtHy45qhvnn8hi3LdcDXL0CLHrkl5i13qLws3HBIb+RrGtCjHn
 YV0=
X-IronPort-AV: E=Sophos;i="5.73,491,1583218800"; 
   d="scan'208";a="79412603"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2020 01:07:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 9 Jun 2020 01:07:36 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Tue, 9 Jun 2020 01:07:33 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
Date:   Tue, 9 Jun 2020 10:07:00 +0200
Message-ID: <20200609080709.9654-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200608123024.5330-1-lars.povlsen@microchip.com>
References: <20200608123024.5330-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the main Sparx5 SoC DT documentation file, with information
abut the supported board types.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../bindings/arm/microchip,sparx5.yaml        | 65 +++++++++++++++++++
 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
new file mode 100644
index 0000000000000..ecf6fa12e6ad2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 Boards Device Tree Bindings
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+description: |+
+   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
+   gigabit TSN-capable gigabit switches.
+
+   The SparX-5 Ethernet switch family provides a rich set of switching
+   features such as advanced TCAM-based VLAN and QoS processing
+   enabling delivery of differentiated services, and security through
+   TCAM-based frame processing using versatile content aware processor
+   (VCAP)
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The Sparx5 pcb125 board is a modular board,
+          which has both spi-nor and eMMC storage. The modular design
+          allows for connection of different network ports.
+        items:
+          - const: microchip,sparx5-pcb125
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb134 is a pizzabox form factor
+          gigabit switch with 20 SFP ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb134
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb135 is a pizzabox form factor
+          gigabit switch with 48+4 Cu ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb135
+          - const: microchip,sparx5
+
+  axi@600000000:
+    type: object
+    description: the root node in the Sparx5 platforms must contain
+      an axi bus child node. They are always at physical address
+      0x600000000 in all the Sparx5 variants.
+    properties:
+      compatible:
+        items:
+          - const: simple-bus
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - axi@600000000
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 19bdaf781853b..f3fba860d3cc5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -38,6 +38,7 @@ properties:
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - microchip,sparx5-cpu-syscon

           - const: syscon

--
2.27.0

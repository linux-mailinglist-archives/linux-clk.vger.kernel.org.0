Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DA315C01B
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2020 15:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbgBMOLb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Feb 2020 09:11:31 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33593 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbgBMOLb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Feb 2020 09:11:31 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so4396238lfl.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2020 06:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkyOwSYDYLCdovDDNZ6yM3vQcsvjxUIa3A0TtLeyc58=;
        b=zpuQcF4IR7KFvezlHtOuRuJc/2Dsd2TkahsrLS8QTkeJjn/6GEORtvxGdauyY9R8vl
         HFH3aTs4Wvkfu5R9e8LgZkjt4jZYx7POqEzOlFWrL6iq57v94L29n3bWODrLZMDIB1fo
         YTix78gb6hGm3o1FO65QhEZqTXIhPZS1+HfD/JlL+9hrkvD47SnS2PMxp8rK85Gm5M5J
         tukD8Sksdx3vG6Q1femuZMH8v3Cpb/smToT4/zUP/ruRWMiibYM7LowpeqMZzZg9frpU
         +QmqwsBdP9mXTqNg2bmWGGXu3qatCg5+o5scD3zVQ4NK5rkqj1/n04m8m9coGcs+vzrk
         xytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkyOwSYDYLCdovDDNZ6yM3vQcsvjxUIa3A0TtLeyc58=;
        b=PlKBa6rbsA2vyvcZ5b2ByvlZO/wFWk74sncBS9oIrR6r+a0wCJOHKgzjphuJxn2yj5
         +IGBb2dzxtQpiCcG2cCKk2dQfk/Wdl1j5uS2dM6gAVvf4sr//L7YrpAv7qYJoa/zJtBG
         13yMrR5rq2OunCfn33AC99hSqqM+R3l8dPjAIRXVYOt6csCZvvbaoC+lfCBVUp8PyCvo
         8V6avvmX7mUBp7H4E5S0VC3mZfRJJo7pC/l6+WKB2E69M76vLgUEn2gTHIFhHS/XEaVE
         dsnWwGnlogxKP41J1igUVsqgwgXlBOQF4Mg6Svv/aqBvGNis6DD9TXaKaT4OTDYJo4Fa
         pHnw==
X-Gm-Message-State: APjAAAUm9TWGcRi5z03CuahEf3bCR8Wx0v19h1Wm5ZmR7IUIePySuKUF
        mtm8FEjvMrjg76Z6EwSN3KkFLxSnJy8=
X-Google-Smtp-Source: APXvYqwh1eIQAnNU3umYZ4iPkxKgdjn0x6R3bDtbfcd59H84763IYh7kv9qMZz/ARfyMYJNFrL8abA==
X-Received: by 2002:a19:c7c5:: with SMTP id x188mr530244lff.22.1581603087555;
        Thu, 13 Feb 2020 06:11:27 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r2sm1707612lff.63.2020.02.13.06.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 06:11:26 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Create YAML schema for ICST clocks
Date:   Thu, 13 Feb 2020 15:11:18 +0100
Message-Id: <20200213141119.66462-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ICST clocks used in the ARM Integrator, Versatile and
RealView platforms are updated to use YAML schema, and two
new ICST clocks used by the Integrator IM-PD1 logical module
are added in the process.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/clock/arm,syscon-icst.yaml       | 102 ++++++++++++++++++
 .../bindings/clock/arm-integrator.txt         |  34 ------
 .../bindings/clock/arm-syscon-icst.txt        |  70 ------------
 3 files changed, 102 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/arm-integrator.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/arm-syscon-icst.txt

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
new file mode 100644
index 000000000000..06c4d84e8c3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/arm,syscon-icst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM System Conctroller ICST Clocks
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: The ICS525 and ICS307 oscillators are produced by Integrated
+  Devices Technology (IDT). ARM integrated these oscillators deeply into their
+  reference designs by adding special control registers that manage such
+  oscillators to their system controllers.
+
+  The various ARM system controllers contain logic to serialize and initialize
+  an ICST clock request after a write to the 32 bit register at an offset
+  into the system controller. Furthermore, to even be able to alter one of
+  these frequencies, the system controller must first be unlocked by
+  writing a special token to another offset in the system controller.
+
+  Some ARM hardware contain special versions of the serial interface that only
+  connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
+  different values and sometimes also hardwire the output divider. They
+  therefore have special compatible strings as per this table (the OD value is
+  the value on the pins, not the resulting output divider).
+
+  In the core modules and logic tiles, the ICST is a configurable clock fed
+  from a 24 MHz clock on the motherboard (usually the main crystal) used for
+  generating e.g. video clocks. It is located on the core module and there is
+  only one of these. This clock node must be a subnode of the core module.
+
+  Hardware variant         RDW     OD          VDW
+
+  Integrator/AP            22      1           Bit 8 0, rest variable
+  integratorap-cm
+
+  Integrator/AP            46      3           Bit 8 0, rest variable
+  integratorap-sys
+
+  Integrator/AP            22 or   1           17 or (33 or 25 MHz)
+  integratorap-pci         14      1           14
+
+  Integrator/CP            22      variable    Bit 8 0, rest variable
+  integratorcp-cm-core
+
+  Integrator/CP            22      variable    Bit 8 0, rest variable
+  integratorcp-cm-mem
+
+  The ICST oscillator must be provided inside a system controller node.
+
+properties:
+  "#clock-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - arm,syscon-icst525
+      - arm,syscon-icst307
+      - arm,syscon-icst525-integratorap-cm
+      - arm,syscon-icst525-integratorap-sys
+      - arm,syscon-icst525-integratorap-pci
+      - arm,syscon-icst525-integratorcp-cm-core
+      - arm,syscon-icst525-integratorcp-cm-mem
+      - arm,integrator-cm-auxosc
+      - arm,versatile-cm-auxosc
+      - arm,impd-vco1
+      - arm,impd-vco2
+
+  clocks:
+    description: Parent clock for the ICST VCO
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  lock-offset:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Offset to the unlocking register for the oscillator
+
+  vco-offset:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Offset to the VCO register for the oscillator
+
+required:
+  - "#clock-cells"
+  - compatible
+  - clocks
+
+examples:
+  - |
+    vco1: clock@00 {
+      compatible = "arm,impd1-vco1";
+      #clock-cells = <0>;
+      lock-offset = <0x08>;
+      vco-offset = <0x00>;
+      clocks = <&sysclk>;
+      clock-output-names = "IM-PD1-VCO1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/arm-integrator.txt b/Documentation/devicetree/bindings/clock/arm-integrator.txt
deleted file mode 100644
index 11f5f95f571b..000000000000
--- a/Documentation/devicetree/bindings/clock/arm-integrator.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Clock bindings for ARM Integrator and Versatile Core Module clocks
-
-Auxiliary Oscillator Clock
-
-This is a configurable clock fed from a 24 MHz chrystal,
-used for generating e.g. video clocks. It is located on the
-core module and there is only one of these.
-
-This clock node *must* be a subnode of the core module, since
-it obtains the base address for it's address range from its
-parent node.
-
-
-Required properties:
-- compatible: must be "arm,integrator-cm-auxosc" or "arm,versatile-cm-auxosc"
-- #clock-cells: must be <0>
-
-Optional properties:
-- clocks: parent clock(s)
-
-Example:
-
-core-module@10000000 {
-	xtal24mhz: xtal24mhz@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-	};
-	auxosc: cm_aux_osc@25M {
-		#clock-cells = <0>;
-		compatible = "arm,integrator-cm-auxosc";
-		clocks = <&xtal24mhz>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
deleted file mode 100644
index 4cd81742038f..000000000000
--- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-ARM System Controller ICST clocks
-
-The ICS525 and ICS307 oscillators are produced by Integrated Devices
-Technology (IDT). ARM integrated these oscillators deeply into their
-reference designs by adding special control registers that manage such
-oscillators to their system controllers.
-
-The various ARM system controllers contain logic to serialize and initialize
-an ICST clock request after a write to the 32 bit register at an offset
-into the system controller. Furthermore, to even be able to alter one of
-these frequencies, the system controller must first be unlocked by
-writing a special token to another offset in the system controller.
-
-Some ARM hardware contain special versions of the serial interface that only
-connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
-different values and sometimes also hardwire the output divider. They
-therefore have special compatible strings as per this table (the OD value is
-the value on the pins, not the resulting output divider):
-
-Hardware variant:        RDW     OD          VDW
-
-Integrator/AP            22      1           Bit 8 0, rest variable
-integratorap-cm
-
-Integrator/AP            46      3           Bit 8 0, rest variable
-integratorap-sys
-
-Integrator/AP            22 or   1           17 or (33 or 25 MHz)
-integratorap-pci         14      1           14
-
-Integrator/CP            22      variable    Bit 8 0, rest variable
-integratorcp-cm-core
-
-Integrator/CP            22      variable    Bit 8 0, rest variable
-integratorcp-cm-mem
-
-The ICST oscillator must be provided inside a system controller node.
-
-Required properties:
-- compatible: must be one of
-  "arm,syscon-icst525"
-  "arm,syscon-icst307"
-  "arm,syscon-icst525-integratorap-cm"
-  "arm,syscon-icst525-integratorap-sys"
-  "arm,syscon-icst525-integratorap-pci"
-  "arm,syscon-icst525-integratorcp-cm-core"
-  "arm,syscon-icst525-integratorcp-cm-mem"
-- lock-offset: the offset address into the system controller where the
-  unlocking register is located
-- vco-offset: the offset address into the system controller where the
-  ICST control register is located (even 32 bit address)
-- #clock-cells: must be <0>
-- clocks: parent clock, since the ICST needs a parent clock to derive its
-  frequency from, this attribute is compulsory.
-
-Example:
-
-syscon: syscon@10000000 {
-	compatible = "syscon";
-	reg = <0x10000000 0x1000>;
-
-	oscclk0: osc0@c {
-		compatible = "arm,syscon-icst307";
-		#clock-cells = <0>;
-		lock-offset = <0x20>;
-		vco-offset = <0x0c>;
-		clocks = <&xtal24mhz>;
-	};
-	(...)
-};
-- 
2.23.0


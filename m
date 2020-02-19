Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F076C16412A
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2020 11:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgBSKEB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Feb 2020 05:04:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35938 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgBSKEA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:04:00 -0500
Received: by mail-lf1-f67.google.com with SMTP id f24so16937803lfh.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ex0WUr4F2ykNAf/zHRS2tfhIPnCxChpfveEhtUGkE0=;
        b=C2uNySUwOeXYR/vew7ZZjkCVofjMXMj+nLEIq58Zg1YK8jCxDkcDmp2/mbQMJm83G/
         piahvjEDPIwTmNhg28Yc1I5G6tVoQLboIm6/4xfUCiN50EfXiA910XCSUINyvei67vrq
         y3N0YOB6uW7YRBGHRbkBMXQetSjWXJoNzWiUPCjt4VLmRAHR+1OdoSKrSjxqRDTmak72
         sUPMZ/PFGqMUrjBwnjThdNLGZaDcjkKs+2q1a9fHefyCo5lpvvfyFskYskw/RuvqClBz
         +XA8btAavsQ0y3+04JkqrR/w0y9nfgzE3uEEdZPZNLvVwpLXsZu6C7WyUIEyAo6auMRu
         tiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ex0WUr4F2ykNAf/zHRS2tfhIPnCxChpfveEhtUGkE0=;
        b=fhM8v8yPwI69yPzm5dm1RahdNrYNspTlIXtayL1V46+q7PrOEkfUjP5nRijTpWaxsB
         RqyqQWkWHcQ5rL+OLp4kXsonJ9mYMOg0ZheqpXnRVbgivz44Qn38JcL6kEUH3OHV6USp
         BKGzynSKLcYpubGdEOGF36hTzYo6hRAqYoF3BpNwIvTDrOZjL6RkL34E3NU7kHlePCg+
         XBxQriWQhbThtpX2vI+28Nq91RJ97jFjmnfAjsLiJ3YqmnXfpFC1WV5Dd5C1P/5lUwEk
         CmDl5PFn7O109Mn4jrJUi8EXBdBwejkt3/njiYAVpv1AibsM7cY64gUF+1XL1EcalEDq
         ZSZA==
X-Gm-Message-State: APjAAAXgwI8LE50jUCUiBac0kGfGMsy5M5i8yQgNmgnfguBAjzLowQD6
        GE1x5uxP7YLR61yYf/9By6k9Cw==
X-Google-Smtp-Source: APXvYqzuj2PjMvzj7EzYtgRASEpJMDNCrByBqcjlHrIBICaGty2X3Tjzk6HvHNW1CVKmSUN9qM4gwg==
X-Received: by 2002:a19:c3c2:: with SMTP id t185mr13021040lff.56.1582106636682;
        Wed, 19 Feb 2020 02:03:56 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n1sm918913lfq.16.2020.02.19.02.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:03:55 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3 v2] dt-bindings: clock: Create YAML schema for ICST clocks
Date:   Wed, 19 Feb 2020 11:03:44 +0100
Message-Id: <20200219100346.78227-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add a literal | to preserve formatting in the bindings
- Collect Rob's review tag
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
2.24.1


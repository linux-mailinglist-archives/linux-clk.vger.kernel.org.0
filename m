Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7C841AB1A
	for <lists+linux-clk@lfdr.de>; Tue, 28 Sep 2021 10:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239911AbhI1IwO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Sep 2021 04:52:14 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53526
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239811AbhI1Ivv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 04:51:51 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A21864030B
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819007;
        bh=aaXYHrp3L66rLENOSWMMcR2xo/U8IXQjJU/MbbXOyWE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=W1YuOFv0AtBLnvvETmGx6h2OU2do/Kol37Wzpv0qZyt+kprOrW/+fCe0aMuOtBBFK
         4PyN84pHmSfSJve7Jts8kdoFEAbPVWaYnbH1cGtgricbJwxY9xgYsx4R9s/xvN6wYO
         CyWhPRJU4xBaT+6WG9U9c5lwP524UFclEIT7FYI5uszTPb3xt1aiWUram3EUW/o31Y
         Y3CmEsp9S9TFsHG1/KM6Qzu0OlbvqlkglQft7pYMHtPYvwmE0jewHWAJRonWkn4TON
         bE0jKdWG0jLNKS3rfHLt61GmPV+AwQVJ7lngMKtbLuUJp66q7mh7cgUZ0GXLOS9COV
         lYetyef8eCwsA==
Received: by mail-lf1-f69.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so18635316lfv.18
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 01:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aaXYHrp3L66rLENOSWMMcR2xo/U8IXQjJU/MbbXOyWE=;
        b=vSSwkUmg7k75/K1eE2kEJir0zjgLAT8peVbmapmBhCxHN+92ASBDPnmGo+U9dKX14b
         Jpl4B9J8fE36WttY+jNXMLSPwtwy7ZktWouy+GgXbAGqSx+ADGYicuI0Ba+KByojaG8j
         4amc85v9oIazt4M0rST+1N0y1PaOMllNsfBDAcUUJH753aUASOwwdjNl7gl8mA7/2nCD
         K6DdPG9ltgiZq0fTpB0Ib/pIygFcH+gib4rR+UvLbWPXWeu+caYEEaoUEmpJb8qApLhG
         TJfOx4PGtLEUBZDaYnnaIXlfSM4fw6v0zO7ePcPLQ2X3yEvNR/rUuJPceuqFDH4T0b7h
         xOOw==
X-Gm-Message-State: AOAM530342BEH1JLouKNwM6juSIPRkmDKcg7Q/k3CB/GqY7CH1scCx5e
        QmLZtIbhLphZm65EWg2GnMkUc/S2UhDNV3p4Uwt1GtCNQVOoxL+NhMfAU3FZt2E+i3IN12/HS8l
        vQ6naQv5HvOc9Ycrv4ZQq365sVBZyPpwjzSZQvg==
X-Received: by 2002:a2e:bd0b:: with SMTP id n11mr4499616ljq.71.1632819006776;
        Tue, 28 Sep 2021 01:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKy4lO/av6WQys4KPIoUq6wtdoC1OXcEyjEG5vqlXamc6XBE+xwdwWsL0TrDgbW3Po0RUtBg==
X-Received: by 2002:a2e:bd0b:: with SMTP id n11mr4499588ljq.71.1632819006559;
        Tue, 28 Sep 2021 01:50:06 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 07/12] mfd: dt-bindings: samsung,s2mps11: convert to dtschema
Date:   Tue, 28 Sep 2021 10:49:44 +0200
Message-Id: <20210928084949.27939-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the MFD part of Samsung S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02
family of PMICs to DT schema format.  Previously the bindings were
mostly in mfd/samsung,sec-core.txt.

The conversion copies parts of description from existing bindings
therefore the license is not changed from GPLv2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/samsung,s2mps11.yaml         | 267 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..771b3f16da96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -0,0 +1,267 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS11/13/14/15 and S2MPU02 Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPS11/13/14/15 and S2MPU02 is a family of Power Management IC
+  which include voltage and current regulators, RTC, clock outputs and other
+  sub-blocks.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mps11-pmic
+      - samsung,s2mps13-pmic
+      - samsung,s2mps14-pmic
+      - samsung,s2mps15-pmic
+      - samsung,s2mpu02-pmic
+
+  clocks:
+    $ref: ../clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+
+  samsung,s2mps11-acokb-ground:
+    description: |
+      Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
+      the PMIC must manually set PWRHOLD bit in CTRL1 register to turn off the
+      power. Usually the ACOKB is pulled up to VBATT so when PWRHOLD pin goes
+      low, the rising ACOKB will trigger power off.
+    type: boolean
+
+  samsung,s2mps11-wrstbi-ground:
+    description: |
+      Indicates that WRSTBI pin of PMIC is pulled down. When the system is
+      suspended it will always go down thus triggerring unwanted buck warm
+      reset (setting buck voltages to default values).
+    type: boolean
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps11.yaml
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps13-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps13.yaml
+        samsung,s2mps11-acokb-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps14-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps14.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps15-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps15.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpu02-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mpu02.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mps11-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx0>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&s2mps11_irq>;
+            samsung,s2mps11-acokb-ground;
+            wakeup-source;
+
+            clocks {
+                compatible = "samsung,s2mps11-clk";
+                #clock-cells = <1>;
+                clock-output-names = "s2mps11_ap", "s2mps11_cp", "s2mps11_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+                };
+
+                LDO4 {
+                    regulator-name = "vdd_adc";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ....
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                BUCK2 {
+                    regulator-name = "vdd_arm";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1500000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-coupled-with = <&buck3_reg>;
+                    regulator-coupled-max-spread = <300000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                BUCK3 {
+                    regulator-name = "vdd_int";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-coupled-with = <&buck2_reg>;
+                    regulator-coupled-max-spread = <300000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ...
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mps14-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx0>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            wakeup-source;
+
+            clocks {
+                compatible = "samsung,s2mps14-clk";
+                #clock-cells = <1>;
+                clock-output-names = "s2mps14_ap", "unused", "s2mps14_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "VLDO1_1.0V";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+
+                    regulator-state-mem {
+                        regulator-on-in-suspend;
+                    };
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "VBUCK1_1.0V";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ...
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5a7cb990b182..2de215d1274c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16600,6 +16600,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DA2423EC8
	for <lists+linux-clk@lfdr.de>; Wed,  6 Oct 2021 15:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbhJFN00 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Oct 2021 09:26:26 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52012
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238917AbhJFN0I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 09:26:08 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0AF743FFF8
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526647;
        bh=KfSCaQMomfHsy7AGnVEI+DmoKrSLHDTNwrS04t4ZHlM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Gbfjb12HxXK/dARhpoPjOHU+RoCNgMgK5BJmV05Ab22m8rYOIZ0krRsIMZ5OFyZik
         KE1o3p5dIC8i4AplC0rcz9HVbLmzGxj+UEwpEvj/fDCNf3oA19Rly7GB5cFEC80B+t
         /mB2GHEhBKP1SF0EwPUjBjIqphGrwSSq8fl7sdvBCBJTFBhkzQkDPQGoWxZUitwynJ
         5mTEtGH/Ce1rTdQy0wj2zX0XFuRG6Puu8IIldaOW53Ekf95QVAsyiJ92NsNoT5fVnz
         ceYJoPR/MpnhRJD0JIf++lNBb2QffQeoNFMDF9FbOQzPqpeyDUg55ycul6TURT7FxR
         N8BB9KnahETrg==
Received: by mail-lf1-f69.google.com with SMTP id z29-20020a195e5d000000b003fd437f0e07so1940978lfi.20
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 06:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfSCaQMomfHsy7AGnVEI+DmoKrSLHDTNwrS04t4ZHlM=;
        b=yuTIjxPYHoinIKMRnS5uCoPcfNL2IApBfFuKTukSSsbNE8bU1/GxiNGcy1NuPEhaRK
         krVkNNlY0l5RXdqp/WwqWz6J1q8PRqkh3gFMraq52CTWcoeZhsEjvIrjEQ2aM2cTDBaX
         Pl7/ZFMtByZtsWRaM0FeXJ3EULFUf7HwkypnSeaRW4rouWZRI03C215pPeQFN6fC2nzk
         t1e31xTbZUynt3zhkmnuEKxYcFC7TcaZHsxnZzH0SFRPMdx9+nvoTm4/UuMYF7bucf8g
         wht9bB4jt78Ib7v50oHBSHjAYJHTjCkwYA4kP+PYDzGCxQneZQ3/T5wstMP04464BWc6
         BChQ==
X-Gm-Message-State: AOAM530kfycfg/qARKT8jOlhZ1axnR33PJrZKWWg319iUGvSsJFOADYE
        tFa1umJmn+u8WPGs+TFIB+PcNwKRT62ox0HXw98VUPMyNVTxCIo0cl1zO5xYYQHlHqW6Gnq/sv5
        P6J8F/P9p/uamMMNlqUotCnCKWeAbiKTEW//5qg==
X-Received: by 2002:a05:651c:4c7:: with SMTP id e7mr29626234lji.386.1633526645689;
        Wed, 06 Oct 2021 06:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxaWQ8vzUbzbQ7WQCw7dRKCOgpCf6OBkyKb8ASAh6fzY4fxIHb4PlWnpE2oID9argltnkaoQ==
X-Received: by 2002:a05:651c:4c7:: with SMTP id e7mr29626195lji.386.1633526645324;
        Wed, 06 Oct 2021 06:24:05 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:04 -0700 (PDT)
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
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 04/10] regulator: dt-bindings: samsung,s2m: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:18 +0200
Message-Id: <20211006132324.76008-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the regulators of Samsung
S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02 family of PMICs to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------------------
 .../bindings/regulator/samsung,s2mps11.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps13.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps14.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mps15.yaml   |  44 ++++++++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  44 ++++++++
 MAINTAINERS                                   |   2 +-
 7 files changed, 221 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
deleted file mode 100644
index 27a48bf1b185..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Binding for Samsung S2M family regulator block
-==============================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPS11/13/14/15 and S2MPU02 devices provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by different devices:
-	- LDOn
-		  - valid values for n are:
-			- S2MPS11: 1 to 38
-			- S2MPS13: 1 to 40
-			- S2MPS14: 1 to 25
-			- S2MPS15: 1 to 27
-			- S2MPU02: 1 to 28
-		  - Example: LDO1, LDO2, LDO28
-	- BUCKn
-		  - valid values for n are:
-			- S2MPS11: 1 to 10
-			- S2MPS13: 1 to 10
-			- S2MPS14: 1 to 5
-			- S2MPS15: 1 to 10
-			- S2MPU02: 1 to 7
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of the nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500,
-   25000 (default) or 50000.
-
-   Additionally S2MPS11 supports disabling ramp delay for BUCK{2,3,4,6}
-   by setting it to <0>.
-
-   Note: On S2MPS11 some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{3,4},
-    - buck{7,8,10}.
-
- - samsung,ext-control-gpios: On S2MPS14 the LDO10, LDO11 and LDO12 can be
-   configured to external control over GPIO. To turn this feature on this
-   property must be added to the regulator sub-node:
-    - samsung,ext-control-gpios: GPIO specifier for one GPIO
-                                 controlling this regulator (enable/disable)
-  Example:
-	LDO12 {
-		regulator-name = "V_EMMC_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		samsung,ext-control-gpios = <&gpk0 2 0>;
-	};
-
-
-Example:
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ABB_3.3V";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDD_ALIVE_1.1V";
-				regulator-min-microvolt = <1100000>;
-				regulator-max-microvolt = <1100000>;
-				regulator-always-on;
-			};
-
-			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-ramp-delay = <50000>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..e3b780715f44
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS11 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS11 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 38 LDOs
+  "^LDO([1-9]|[1-2][0-9]|3[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
new file mode 100644
index 000000000000..579d77aefc3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps13.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS13 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS13 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 40 LDOs
+  "^LDO([1-9]|[1-3][0-9]|40)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
new file mode 100644
index 000000000000..fdea290b3e94
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps14.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS14 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS14 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 25 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-5])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 5 bucks
+  "^BUCK[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
new file mode 100644
index 000000000000..b3a883c94628
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps15.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS15 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS15 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 27 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-7])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
new file mode 100644
index 000000000000..0ded6953e3b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpu02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPU02 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPU02 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 28 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+
+  # 7 bucks
+  "^BUCK[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 2c66ae863996..ac83c22c67d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16601,7 +16601,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
-F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
-- 
2.30.2


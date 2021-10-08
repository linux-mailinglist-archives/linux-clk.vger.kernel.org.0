Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C684269FE
	for <lists+linux-clk@lfdr.de>; Fri,  8 Oct 2021 13:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242442AbhJHLpT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Oct 2021 07:45:19 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33766
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242433AbhJHLmL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 07:42:11 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5C3140016
        for <linux-clk@vger.kernel.org>; Fri,  8 Oct 2021 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693214;
        bh=B1LQlQ7B/5D6Dgl3qfPf6DLDJ9sR5D/GqEBR3sbuvCA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jXU0HLLgHBaP1b7E567QazLOTnCenmdPEKIxgTYwd0zt+wHIBLibRkevKhFr//AN1
         leU4BzaBt8JJjFrQVt+CRv4gWc0ngzUj3Prelg5gTY+FF6Twz5QUXKz9wbE9a6MEIB
         hcuKh5q9Zgy/doqv1uRvWVVQoRh1/X89XMdyERmAvrVx90U2HJfhMmWz0pANEpFMpW
         Zjt0eT1/n5dsnLaCZ04IoCre5gJn5s3/UJAXSARMDs5DAM9KvC5ol18/2D39TZ/8rG
         aLgO94H3TCqq0g3IHI3SQX243y/E72CYC1Fu4spNsrT4Z8ZhnSibdfx3SNPMJE0VhQ
         fU8twIfe4m2Dg==
Received: by mail-ed1-f69.google.com with SMTP id u23-20020a50a417000000b003db23c7e5e2so8941665edb.8
        for <linux-clk@vger.kernel.org>; Fri, 08 Oct 2021 04:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1LQlQ7B/5D6Dgl3qfPf6DLDJ9sR5D/GqEBR3sbuvCA=;
        b=LeeBp5dl53rw8QE6Pit0L+77NPcgPulEdEv3srtdcvgvWBsEKHPMBsRD1RoForUi8G
         mxaJCNZVtH8qIK3x5lUKUUsNlF3Cn9qm6p+aj8lkGQTskMin5za//Vr8fEKnxH/1nDIg
         tiiWRIkzlhgXhS8inKA2uEOHBcmn9t9UDkW7LvAt88yD+GEVZ9PjrRDIUk2YLjzD3Odj
         nTb5HHogYxGL6bh2Ri/Fmh+wvJo8h7dHqVFULuv9K6GxK2JU8Bv8PvoJyKyek4/T4Ogw
         JAFE9EkntDruxuL4PGnMoD+xYrRTzR7TbmBxXO84sqnQ5jvsK6aDme4WcCjNrps8AbPH
         Aisw==
X-Gm-Message-State: AOAM532PDKMMYQvmQ3zn1kxAXd0iWy/qa3rDSfIUx2LPCxNzsaBvhg7R
        ZilDfQWgE6wDeOcqwZbyJEWNa735cFPjNenH6I9ojaPLc9tmwmX2Oro4raCfFX5XauA2BABBGrG
        JxbXSkwjrcdskh/FM7CYTUQbYtEidd0tAJp2T6Q==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr3691956ejb.146.1633693214140;
        Fri, 08 Oct 2021 04:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuKP5BdLY5Fq3JlRDEgrRfyOt0gnhtGpKb+dXUYuugRnsOqnr9q4TsCmLP/rwcRPZSHNmP0w==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr3691930ejb.146.1633693213918;
        Fri, 08 Oct 2021 04:40:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id c17sm901437edu.11.2021.10.08.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:40:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 05/10] regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
Date:   Fri,  8 Oct 2021 13:39:27 +0200
Message-Id: <20211008113931.134847-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the regulators of Samsung S2MPA01 PMIC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/samsung,s2mpa01.txt    | 79 -------------------
 .../bindings/regulator/samsung,s2mpa01.yaml   | 62 +++++++++++++++
 2 files changed, 62 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
deleted file mode 100644
index bae3c7f838cf..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-Binding for Samsung S2MPA01 regulator block
-===========================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPA01 device provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by S2MPA01 device:
-	- LDOn
-		  - valid values for n are 1 to 26
-		  - Example: LDO1, LD02, LDO26
-	- BUCKn
-		  - valid values for n are 1 to 10.
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of buck regulator nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
-   (default), 25000, or 50000. May be 0 for disabling the ramp delay on
-   BUCK{1,2,3,4}.
-
-   In the absence of the regulator-ramp-delay property, the default ramp
-   delay will be used.
-
-   Note: Some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{2,4},
-    - buck{8,9,10}.
-
-Example:
-
-	s2mpa01_pmic@66 {
-		compatible = "samsung,s2mpa01-pmic";
-		reg = <0x66>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ALIVE";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDDQ_MMC2";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
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
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
new file mode 100644
index 000000000000..0627dec513da
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPA01 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPA01 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml for
+  additional information and example.
+
+patternProperties:
+  # 26 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-6])$":
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
+    properties:
+      regulator-ramp-delay:
+        enum: [0, 6250, 12500, 25000, 50000]
+        default: 12500
+        description: |
+          May be 0 for disabling the ramp delay on BUCK{1,2,3,4}.
+
+          In the absence of the regulator-ramp-delay property, the default ramp
+          delay will be used.
+
+          Note: Some bucks share the ramp rate setting i.e. same ramp value
+          will be set for a particular group of bucks so provide the same
+          regulator-ramp-delay value for them.
+          Groups sharing ramp rate:
+            * buck{1,6},
+            * buck{2,4},
+            * buck{8,9,10}.
+
+    required:
+      - regulator-name
+
+additionalProperties: false
-- 
2.30.2


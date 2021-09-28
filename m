Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7B541AB1F
	for <lists+linux-clk@lfdr.de>; Tue, 28 Sep 2021 10:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239802AbhI1IwP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Sep 2021 04:52:15 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53520
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239807AbhI1Ivv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 04:51:51 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B390340310
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819005;
        bh=3FyIoF+l87btuV2gCMyoUwEZNsQSiir9nPQbvweRDTU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KuAF8PoCulEZYIKgaVpHeKgQHccYqxPnZs0VCcTuQWx+v4GmYnVDw8AjlPjuwuE4+
         yuyYPwDk2sHjPhDnnkHmSkIE9QgzpXzFr2nEb52OhHFFBN2tfww2c4TDOR3av/bb7l
         3WFE6os9eLIsZSnmy5iWgz6bS+vO94QzZW9wcXDR/FL0DwPQ9HueoKDGruKLhqZvST
         ywv/6EX+Wri2ofgd20bPwvDv973yCib+Qj4rNNVjGTmVywrZEOHv1y9PFwYfNZo/1o
         Byy0jNyiSIJet5tPRkVe/pSESNUYJ2Ak9ZFZ70L29tccfk3ceOxtDGPBwuB42U35Jc
         KjCMHgYs/IRNA==
Received: by mail-lf1-f70.google.com with SMTP id c24-20020ac25318000000b003f257832dfdso18524213lfh.20
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 01:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3FyIoF+l87btuV2gCMyoUwEZNsQSiir9nPQbvweRDTU=;
        b=zJ2w7x+MFOVA17GE+ZlYrlj0RyhMm4Ap4F1NqRT/1XVRytW6e0/T8+5/agisC50sBz
         fQ+FTcC0BS9w2PhZKxbPh9xcV9wzxWD04KWsp48Yfcm7zMHAwO4dzVxGkGxWUTry5Mij
         FABSp8b2oxuPB32Ma2kIobxEIggbxNUMfH7BT4U1EadEwhmaVoFQ4NzDvrEQuXiZycwf
         D477dzr9O1JxmGyus/xSxvr04zCm3htG8gdTo7tYxTuF01wbqcTcMVOG5W2S1uUqR2E7
         oyByvFP7nGNFbnAY3UjaZRIZ0gjL5L2m+aJbIa9sNEXlGI/4l6TkGXvJ4Hy+6WrOX3BI
         C+HQ==
X-Gm-Message-State: AOAM532sOMvV0wFM3QniqdiGD5FZLvE3yYLHnA4z1ekqZz4ujeIbFIb3
        NoQW863s3URgIWM81Tvseb8e4ZyDk8S5EpGXfh5/zf3aFyizr8dJXb4Juu8Y8iiCoOdaBau36mT
        6Y+NtMJsp0mEHfnRTGSRfhe8W+HjX20kjm/Rw0A==
X-Received: by 2002:ac2:4299:: with SMTP id m25mr4508817lfh.642.1632819005083;
        Tue, 28 Sep 2021 01:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzID+/4VPDoZG/gRCQjpRp0k1FQrjHO5rhrm9zAeLg4wHuLsQtsKRjX0AR+3EK8kzwHdODrVg==
X-Received: by 2002:ac2:4299:: with SMTP id m25mr4508796lfh.642.1632819004873;
        Tue, 28 Sep 2021 01:50:04 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:04 -0700 (PDT)
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
Subject: [PATCH 06/12] regulator: dt-bindings: samsung,s5m8767: convert to dtschema
Date:   Tue, 28 Sep 2021 10:49:43 +0200
Message-Id: <20210928084949.27939-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the regulators of Samsung S5M8767 PMIC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s5m8767.txt    | 23 +----
 .../bindings/regulator/samsung,s5m8767.yaml   | 83 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 85 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index 6cd83d920155..a1c6eb6f07c8 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -48,28 +48,7 @@ Additional properties required if either of the optional properties are used:
    for dvs. The format of the gpio specifier depends in the gpio controller.
 
 
-Names of regulators supported by S5M8767 device:
-	- LDOn
-		  - valid values for n are 1 to 28
-		  - Example: LDO1, LDO2, LDO28
-	- BUCKn
-		  - valid values for n are 1 to 9.
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of the nodes under "regulators" sub-node:
- - op_mode: describes the different operating modes of the LDO's with
-            power mode change in SOC. The different possible values are,
-             0 - always off mode
-             1 - on in normal mode
-             2 - low power mode
-             3 - suspend mode
- - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
-                                   GPIO controlling this regulator
-                                   (enable/disable); This is valid only
-                                   for buck9.
+
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
new file mode 100644
index 000000000000..cf4425eb8e84
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s5m8767.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5M8767 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S5M8767 provide buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
+  additional information and example.
+
+patternProperties:
+  # 28 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+      op_mode:
+        enum: [0, 1, 2, 3]
+        default: 1
+        description: |
+          Describes the different operating modes of the LDO's with power mode
+          change in SOC. The different possible values are:
+            0 - always off mode
+            1 - on in normal mode
+            2 - low power mode
+            3 - suspend mode
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 8 bucks
+  "^BUCK[1-8]$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 9 buck
+  "^BUCK9$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+      s5m8767,pmic-ext-control-gpios:
+        maxItems: 1
+        description: |
+          GPIO specifier for one GPIO controlling this regulator on/off.
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index ee486357cf45..5a7cb990b182 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16602,7 +16602,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
-F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
 F:	drivers/regulator/s2m*.c
-- 
2.30.2


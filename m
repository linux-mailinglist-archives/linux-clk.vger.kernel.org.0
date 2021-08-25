Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610203F7616
	for <lists+linux-clk@lfdr.de>; Wed, 25 Aug 2021 15:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241361AbhHYNm0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Aug 2021 09:42:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35650
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241353AbhHYNmZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 09:42:25 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 657A840798
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629898899;
        bh=3BeYCa6etdZJwOiOIOx2BlpgBaN0BYtuZ70xa3Q3gJw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Bo+eOzRv7knh2TtJ0v7socOQVEF4OCukyLQppAKKqwU6zK+O4t52gMHaOjHlZrSXZ
         3KOUtFV8xnjtBMz/2L+XtqLOatFnNZNOigBzhgrDP4l6I+Xr3mj927GCNKm8dBh5kT
         J7rRd4wkdQ1FTQzsUPuh1RYFrwJaeMsXuxASJ9vx93uLG9KHDKG0EwOFS7YaEfo3Gy
         /uL1rtcsCEIPr4EV12SV+cyecvouSIrTqpt+lhXQ537+lk/JP1V8YDu4/mNUjFUwVU
         36l+telTQjgOfZa8+NbyJV/vYZpFVY+5R3SOuP5VVLbGLRlX0WXF42elrXqBgAetlJ
         Cvz8JkVyjy9uQ==
Received: by mail-wm1-f71.google.com with SMTP id j33-20020a05600c1c21b02902e6828f7a20so1873468wms.7
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 06:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3BeYCa6etdZJwOiOIOx2BlpgBaN0BYtuZ70xa3Q3gJw=;
        b=GeJpEVlIR2syCX8b36SmhrV3PmoO34u1oKdEa1v/N2A1AT0SH/1pieINGGt8zvvQNQ
         YB/MSOLlAcG/N58IMYSeAVEkNGjsdlrzjVIC1isLvyVPBKvWWUjdTBN8WE/+9FhYi5mv
         0YhQ8wwhjiNV0tVnDBxL21IzIS0yNZ7LsCz1fpwKpXbOEGOTDdr9QZ8RJRou1w6NFr3i
         PlHxPQQ5b3TvZETPpOp+EXsJwcu9oBb1F51PsKbd/KR3p9+E4L7/QioSKsCO5KKAUt6E
         LLrzE29O17hbgItzij4FQ9Rnpx4oB/pn+lpcPHC8PCHwxIfBhGibSV1dBLwG0T+LhOpH
         FXLQ==
X-Gm-Message-State: AOAM533Eb09S7x4daWWBTA8s7HSgfOwgEEQeRxPIvPmhjpVbYKY1EHAd
        nEGwmfCj8oZpLzoJt8MhfY2hn4/Ngw4YeK++dzPSLI133IXHF5YaGwjp9xjp/uPBIcJ3tHjUptd
        9av2C7jBjtclqhd/R6yMnirtr05wiEIO1G4Zq3w==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr24634039wrs.325.1629898899020;
        Wed, 25 Aug 2021 06:41:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMNk96nGD0nSPfmPeR4PMi9ayfFJhAOGX/YMg51IFQJAS9mSAFII8FpPMdb71xYHisw9UhMg==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr24634013wrs.325.1629898898844;
        Wed, 25 Aug 2021 06:41:38 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id g5sm7185861wrq.80.2021.08.25.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:41:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 1/8] dt-bindings: clock: samsung: convert Exynos5250 to dtschema
Date:   Wed, 25 Aug 2021 15:40:49 +0200
Message-Id: <20210825134056.219884-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert Samsung Exynos5250 clock controller bindings to DT schema format
using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/clock/exynos5250-clock.txt       | 41 -----------------
 .../bindings/clock/samsung,exynos-clock.yaml  | 46 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 47 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
deleted file mode 100644
index aff266a12eeb..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Samsung Exynos5250 Clock Controller
-
-The Exynos5250 clock controller generates and supplies clock to various
-controllers within the Exynos5250 SoC.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos5250-clock" - controller compatible with Exynos5250 SoC.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/exynos5250.h header and can be used in device
-tree sources.
-
-Example 1: An example of a clock controller node is listed below.
-
-	clock: clock-controller@10010000 {
-		compatible = "samsung,exynos5250-clock";
-		reg = <0x10010000 0x30000>;
-		#clock-cells = <1>;
-	};
-
-Example 2: UART controller node that consumes the clock generated by the clock
-	   controller. Refer to the standard clock bindings for information
-	   about 'clocks' and 'clock-names' property.
-
-	serial@13820000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x13820000 0x100>;
-		interrupts = <0 54 0>;
-		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
new file mode 100644
index 000000000000..1642f8405ed9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/ headers.
+
+properties:
+  compatible:
+    const: samsung,exynos5250-clock
+
+  clocks:
+    maxItems: 4
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    clock: clock-controller@10010000 {
+        compatible = "samsung,exynos5250-clock";
+        reg = <0x10010000 0x30000>;
+        #clock-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 64bb17c47bda..a8e1e5d10d1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16491,6 +16491,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/exynos*.txt
+F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
 F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
-- 
2.30.2


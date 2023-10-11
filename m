Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018C07C5BC8
	for <lists+linux-clk@lfdr.de>; Wed, 11 Oct 2023 20:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbjJKSta (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Oct 2023 14:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234720AbjJKStZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 14:49:25 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C126E4
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:49:20 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32caaa1c493so121376f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050158; x=1697654958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmvATsaTcMJ19Dm+6zr7DE57EEBi8DlV0ssb1TyaVI=;
        b=Yn74MsWDY5XPIxWpuOLDgKRYUkcnYiGitzvhwywR8QfkbRU+zF9WMjJ+p0CQJUeyB/
         tFfICExNk8DX8LyNbb/+N2H34iAdT5OVnOY0VAfDb3PA8wuKdiIdK0fOc0OJcAqMrKgU
         v/vgiVcIQIwDUttWJUAJv9Nwv6U64Psiz+UZoE92e+iN5YN0ZM00RKi2fpsgkxF87aq5
         xkeVL/34rdo5dku0Loz8CZ6TQamfipbQ4ybSp04t54f22SPyybr+IyQQefpJIVqeEqS3
         VifF0KGZt63ANUdyt6ih/qBeedZtqWKd92M98Qq468ZWbePKJ4aSBDO9ZW7KLL/pnB8G
         NSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050158; x=1697654958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpmvATsaTcMJ19Dm+6zr7DE57EEBi8DlV0ssb1TyaVI=;
        b=pu05VvMnvfRpuWz8M2GvPQy4RwLGuDS26yFNDosM6LhzBcqIGwKnWvuYmpJPEIDd0k
         9DX+Z5JbdlJZyDWiAfH8h4AgXC2jVpNHESTE6VI3/nGz4/5dLMMOCOTTKE2wj3f06vUn
         Qf+5Y2ltvgDJrNoIe6t19iXWsqG32sug5PugM8bRX37PjunLlo2Aw84f3shyVTc2IQAX
         ddWiW0dy51Y0aYqWLhN6Q5Y5msbShRf3dpmdqPNmvjJuF98hkNEAPZ7VerQ1A8oDdqEj
         JY8l0OhCKyWIWKiIiQ6UMpQ3edDG9+aijHRdVBbDRbmBBHqCFdqV/QUlOG3xDBK+RPZm
         0SHw==
X-Gm-Message-State: AOJu0YzzeO499SRbCA90YsAnZtY1eHfcrpZa/bG10mJU637RQ+j4NpbX
        Jb7EY2+vUyCp+NQDvCC+jIfKAw==
X-Google-Smtp-Source: AGHT+IHAy75oAsFakfAP4prwtA4lP8VergujqRJdjvDK4geKc35P1aWpL2Iak1gQMuJSm2FE2tk89Q==
X-Received: by 2002:a5d:568e:0:b0:319:867e:97d7 with SMTP id f14-20020a5d568e000000b00319867e97d7mr19718489wrv.52.1697050158598;
        Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/20] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date:   Wed, 11 Oct 2023 19:48:08 +0100
Message-ID: <20231011184823.443959-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..167945e4d5ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/google.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor platforms
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
+  devices.
+
+  Currently upstream this is devices using "gs101" SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a.
+
+  Google have a few different names for the SoC.
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845");
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased board codename.
+  e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+additionalProperties: true
+
+...
-- 
2.42.0.655.g421f12c284-goog


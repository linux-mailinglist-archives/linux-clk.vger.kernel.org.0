Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3967125CFAA
	for <lists+linux-clk@lfdr.de>; Fri,  4 Sep 2020 05:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgIDDLk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Sep 2020 23:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgIDDKv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Sep 2020 23:10:51 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64741C061251
        for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2020 20:10:51 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id v54so3664260qtj.7
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2020 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+t3CtOzEXzKd9ngzhAxPof+bLlKadgwcq/2TMWIhXg0=;
        b=y2PD7w3Y9/Ir1BwTOm6sag5wZO7oOaD91rvugSw8Ndz2qRmexWpPHCxtwPNYL48TxO
         /ojpVW8U1cfg3Of4SFU+GB9nZtG7d+LuddpLTXVTsYHnNayHAdQf7DI+mEG6kyfdposc
         nGHMdPPuSTLQKqCcAXOR/ZoJ3EvyzWhj9oyNyTgQXXFLcMfTScISFcwnUj4lr4weyoO9
         Gt9p+0vraZO42MTUo31Krh7WmPfdwhh9jMIRc3AZkS8oXdUjpgHEGkU/O4eo+esXGP/i
         Q1YW3IHSgX6gIIb78HHikoRsbCTS0Y6SZVuCtQMisQH5QIYRdrwaK4PET3rWaGPiHluR
         hyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+t3CtOzEXzKd9ngzhAxPof+bLlKadgwcq/2TMWIhXg0=;
        b=h5GSvDS7OAbJWo+12ns6XOiuaVCDF8WGsY6YlQmrh145H3Fzan7QYjt0oKnK3OotQg
         mQO8U5ppOVKWWSnUGnTfOW6gt9+zji0k+ZjFjnk6jMkvgrD3Lpa7/XdF/yszLHAiYpfS
         lrZFWC9zJQEwcXIMPzVu7xIKl9zVQgjvMdj75LiDsCN0OgL7g/KOtal7LAWfxkvTaksV
         XRqbDKTybuUQpv7E7wfPknSgO5Xcu5fCXVKxwPHLVSUXjkE5Nb2jGOkfi48yraywUaPX
         rHAsU7ikMDOlxegrBwar/j/BHlb6R86vILgJ+TIIC09vDtUDJ8YYnXg0s4JVzt5HPwei
         Zh7g==
X-Gm-Message-State: AOAM530gSn4+jljsGAbElaCozHiAAeKXPjbjd4NP6MXbpOFQHy6NavaQ
        HBFW3fQhOYRGJS2gFfa3+smWmA==
X-Google-Smtp-Source: ABdhPJyi7pQcD/2vnQqUFuSTtOg7LMhJ4HlJAuZaBse5VQK01i6CidCEw9znfi7FvkbrOxrVDNYpOQ==
X-Received: by 2002:ac8:24f1:: with SMTP id t46mr6594264qtt.93.1599189050469;
        Thu, 03 Sep 2020 20:10:50 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x59sm3481063qte.14.2020.09.03.20.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 20:10:50 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] dt-bindings: clock: combine qcom,sdm845-videocc and qcom,sc7180-videocc
Date:   Thu,  3 Sep 2020 23:09:50 -0400
Message-Id: <20200904030958.13325-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904030958.13325-1-jonathan@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These two bindings are almost identical, so combine them into one. This
will make it easier to add the sm8150 and sm8250 videocc bindings.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,sc7180-videocc.yaml   | 65 -------------------
 ...,sdm845-videocc.yaml => qcom,videocc.yaml} | 14 ++--
 2 files changed, 9 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (76%)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
deleted file mode 100644
index 2feea2b91aa9..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
+++ /dev/null
@@ -1,65 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sc7180-videocc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Video Clock & Reset Controller Binding for SC7180
-
-maintainers:
-  - Taniya Das <tdas@codeaurora.org>
-
-description: |
-  Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SC7180.
-
-  See also dt-bindings/clock/qcom,videocc-sc7180.h.
-
-properties:
-  compatible:
-    const: qcom,sc7180-videocc
-
-  clocks:
-    items:
-      - description: Board XO source
-
-  clock-names:
-    items:
-      - const: bi_tcxo
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    clock-controller@ab00000 {
-      compatible = "qcom,sc7180-videocc";
-      reg = <0x0ab00000 0x10000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>;
-      clock-names = "bi_tcxo";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
similarity index 76%
rename from Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
rename to Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f7a0cf53d5f0..17666425476f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -1,23 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,sdm845-videocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Video Clock & Reset Controller Binding for SDM845
+title: Qualcomm Video Clock & Reset Controller Binding
 
 maintainers:
   - Taniya Das <tdas@codeaurora.org>
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845.
+  power domains on SDM845/SC7180.
 
-  See also dt-bindings/clock/qcom,videocc-sdm845.h.
+  See also:
+    dt-bindings/clock/qcom,videocc-sdm845.h
+    dt-bindings/clock/qcom,videocc-sc7180.h
 
 properties:
   compatible:
-    const: qcom,sdm845-videocc
+    enum:
+      - qcom,sdm845-videocc
+      - qcom,sc7180-videocc
 
   clocks:
     items:
-- 
2.26.1


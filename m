Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBFF4FC13C
	for <lists+linux-clk@lfdr.de>; Mon, 11 Apr 2022 17:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348190AbiDKPqh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Apr 2022 11:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348176AbiDKPqY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 11:46:24 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463B810E8
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 08:44:09 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lc2so11184362ejb.12
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mbNpbkkEChotn+zfIrEUISzZtq6Ebit9E8w1dEveKi4=;
        b=aYr0ukfkZGIsCt/4FT/QKR69G8IU6TdAGT0VhxtNMxD/ZM2av3R60rfzy0Lr+z2jqX
         RNffGh7JAzN/ky5V6U8TCJAnWdy3iGs3KhP04uuK3EugGOnpLwwcGZ2fTIgLFM56bQaF
         tbuWxvmlORJFEJxu81ME/WoTRcDnrFtKZ4M8HuZecRxEPgqPKITFt+ju1BeHb2YcHKUa
         iR8iLpWXca6o/Mwk8EvwYFqlUBxH0JRF0IUfHs1g6bPNU08wkfwWhQOP7w/whgOjQjfI
         YX1kzMwC0NEyR+1iPz3swS1o1S5TWeDzVAip9VKO1Jfd+vnYpKHzQSkH5s+HiHLRM0Jw
         MFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mbNpbkkEChotn+zfIrEUISzZtq6Ebit9E8w1dEveKi4=;
        b=HdziMamEjLzfGq/d/IlogHId4tZNFdKI7/zsdT7qXj73xsnZHs2UCwMNTkow4G+O5Y
         dYbGQJ8qrcZL5u0Q/f0t6JCd2TP9Pbs0PcMT4y4ZWmjUnVTOCY8uQioeHuSf9kEszN7q
         EgHLdv/rPkWkj8MxJcqhChwdoiad5CJXOCZlDjdfGlvsamYTS+047BjyEylXsGTBqU5i
         230xwQB8KY2NdNZMchYJuXF/U/CBDhVGxVznTwl5ZbTgG7LL3APwiiMrHPS+aX9HcKBS
         s4yBh5rjF0rA/teoPm893dqwcBVr4sWu1QMugY1qmEIsuLq0sZunsxne3NOjIvZyR/7q
         Gc3Q==
X-Gm-Message-State: AOAM533GahxdF+2HKRuC0dPScfzlDmILLd8joiRad3rqKTgJ0J4XVGZO
        wf/uPArI/L7Mgf/e6ZmBDw9qcQ==
X-Google-Smtp-Source: ABdhPJwrK+vLq5FHXsKcsbi/1tugMQSwYKotl7aV7TAwegLV/VGDWOX0mMt4H3we7pNjfWm9PA2Pzg==
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id b8-20020a170906d10800b006e87765a70bmr8961267ejz.436.1649691847786;
        Mon, 11 Apr 2022 08:44:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906608e00b006d1455acc62sm12173177ejj.74.2022.04.11.08.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:44:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH v2 3/6] dt-bindings: ufs: common: add OPP table
Date:   Mon, 11 Apr 2022 17:43:44 +0200
Message-Id: <20220411154347.491396-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
References: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Except scaling UFS and bus clocks, it's necessary to scale also the
voltages of regulators or power domain performance state levels.  Adding
Operating Performance Points table allows to adjust power domain
performance state, depending on the UFS clock speed.

OPPv2 deprecates previous property limited to clock scaling:
freq-table-hz.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Rob's review tag because patch changed significantly.
---
 .../devicetree/bindings/ufs/ufs-common.yaml   | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 47a4e9e1a775..d7d2c8a136bb 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -20,11 +20,24 @@ properties:
       items:
         - description: Minimum frequency for given clock in Hz
         - description: Maximum frequency for given clock in Hz
+    deprecated: true
     description: |
+      Preferred is operating-points-v2.
+
       Array of <min max> operating frequencies in Hz stored in the same order
-      as the clocks property. If this property is not defined or a value in the
-      array is "0" then it is assumed that the frequency is set by the parent
-      clock or a fixed rate clock source.
+      as the clocks property. If either this property or operating-points-v2 is
+      not defined or a value in the array is "0" then it is assumed that the
+      frequency is set by the parent clock or a fixed rate clock source.
+
+  operating-points-v2:
+    description:
+      Preferred over freq-table-hz.
+      If present, each OPP must contain array of frequencies stored in the same
+      order for each clock.  If clock frequency in the array is "0" then it is
+      assumed that the frequency is set by the parent clock or a fixed rate
+      clock source.
+
+  opp-table: true
 
   interrupts:
     maxItems: 1
@@ -75,8 +88,23 @@ properties:
 
 dependencies:
   freq-table-hz: [ 'clocks' ]
+  operating-points-v2: [ 'clocks', 'clock-names' ]
 
 required:
   - interrupts
 
+allOf:
+  - if:
+      required:
+        - freq-table-hz
+    then:
+      properties:
+        operating-points-v2: false
+  - if:
+      required:
+        - operating-points-v2
+    then:
+      properties:
+        freq-table-hz: false
+
 additionalProperties: true
-- 
2.32.0


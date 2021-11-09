Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B9544B168
	for <lists+linux-clk@lfdr.de>; Tue,  9 Nov 2021 17:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbhKIQra (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Nov 2021 11:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhKIQr3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 11:47:29 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69ADC061766
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 08:44:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bi35so45758723lfb.9
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qSUReGNxk4ZLXo5VHaOBHgErhw/rH9if4VpyxIXVG+w=;
        b=w+FOgP2dVaPUDlgMSLKc8w3h/k4LUAy+RoxkqWR1qkQTce/CFFwJTzfDETxNtRNC5G
         7irgxuop7X3AOiDvLYtm8NUcOI9jORMS6OFxTV4EESs1WJTHgqWF1ey0UxcykIYO2TwK
         TTMNDcULWUaCpyeNSg73mzMB8QG40wWSf9a0UiR2h4mcwLsAjNjUZZil3l3dcFEsyEha
         KfbWIOc8uv9XyjjUQcSPjo15JJVbtcFAhQ07WAIc67Os+iNv9HtfV0fp7o2gBLpulr3p
         02tRS5TuFqw59qUED3odM9zDplxzBmBuPiAV8Cb48RW6EVprivO6eEpqrSgt5/4Wy8lw
         3ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSUReGNxk4ZLXo5VHaOBHgErhw/rH9if4VpyxIXVG+w=;
        b=ig2bq8n/s599oktUbAaZjZptbkdaQWYVzstLT9SXnRivNe+Wo60PL/qqJeo01AERBf
         z+mtWnyq6QRc59rKwE4SZd0e5/+Jm2XyaOH+LdGaXo/o2rjbuWLd80lis1T301dwWq/4
         9ookrO2HMQlWaoX8n8BWvZh+qIqszVMDsQIbBDAYh1OfAwUYsqDDW8wAS78jTHRF8utX
         D/ml4CExP5rmf10LresdNA7bLYDhrDx3W68olfuho+eIJ4LRYkj+n/iS2AJECGoGZYtx
         z9gelKp4GifiWqlEeioB6GpTBYQBrgtXn+MYnTzgW/iSVYhYIZljyV2CnXzr7R4NrZuh
         U1nA==
X-Gm-Message-State: AOAM533AmBrA0lh2sOAvmlEJlm63Wvzq8Cn4FtFtZiqAdIEiP73kuSO9
        YRMOksiE8SLdZeur2T97Z43mRw==
X-Google-Smtp-Source: ABdhPJzyoM1ePV7EISliWuxd9maw0TJrCuO2Ft6t74k6bqJxec/9vuIjX9MXTg+e0tZ358PiH1iBHA==
X-Received: by 2002:ac2:51b8:: with SMTP id f24mr5626666lfk.83.1636476279633;
        Tue, 09 Nov 2021 08:44:39 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q5sm1855633ljb.125.2021.11.09.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:44:39 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850 CMU_CMGP
Date:   Tue,  9 Nov 2021 18:44:35 +0200
Message-Id: <20211109164436.11098-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109164436.11098-1-semen.protsenko@linaro.org>
References: <20211109164436.11098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CMU_CMGP generates USI and ADC clocks for BLK_ALIVE. In particular USI
clocks are needed for HSI2C_3 and HSI2C_4 instances.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 5618cfa62f80..80ba60838f2b 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -33,6 +33,7 @@ properties:
     enum:
       - samsung,exynos850-cmu-top
       - samsung,exynos850-cmu-apm
+      - samsung,exynos850-cmu-cmgp
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
@@ -87,6 +88,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_apm_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-cmgp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_CMGP bus clock (from CMU_APM)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_clkcmu_cmgp_bus
+
   - if:
       properties:
         compatible:
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCDB7C5BC0
	for <lists+linux-clk@lfdr.de>; Wed, 11 Oct 2023 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbjJKSt2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Oct 2023 14:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbjJKStU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 14:49:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B9FC4
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3215f19a13aso136872f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050157; x=1697654957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=Vb3iVZSEzScUycXz76wnJ9U7Zh8dMr/e5Tohy3NOFtPqlhheFzsEQ8l5O6iZIq24Vw
         9zHdP7uBq0p/ztxTDtJxdtl9AmlratWy0I15c928u99yB6JTWNBOp0ZuYg0Go3SYKEUj
         V19gkzUIr1Z0kekfzp88TGHaP5u6gSzLlmZSzdeN3+fRvHjMMEZGuDhvyaxEG6cWonNh
         05GFZM2W9GJPSglB5ynnL0QUtlMsELEjGrib0nFJDtfakZPok1nvKbPOaZaIye2W1rb+
         6InaFSWRUQaYXePI2L8uLFL5NO/MaebofN1Oj85LMdSVGatC5dL9kcESLw+7czXv4aXB
         3y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050157; x=1697654957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=WmGDXZUAUBPQTERUG8fzS+gamfS2uZLxId9r3XYxPoeBoGZ6V1a50A+MrlhhuQozil
         vQrV5TzKKOqYEYSJgNRU+zrbPm+mpmEpSt01usyvYElLy5J5ETwQjKum2Ya1jFznIvyO
         gFdeW6AUWPh1UkWxMLkuhKK0xbtw2FT2Pj160rP1NjYU/W5/swnJCizNPmodhvheDADL
         Ipq1t4mBhH8F0EEd83abEaxEncJkkARrEka8vw2xSGzCM96bEUuMkma8jLJlQaYBENs+
         F0gqZ9TN1dtjG8rYBXco3NVj4FYNpBPfpFgP4NXMxyypGiBDUEwEV2fT96zly2S6znTa
         AkBw==
X-Gm-Message-State: AOJu0YxGVkJg0ymDKm6sEDM+MDSyEpot/3DOsrAQrlo5mC9idJRRrOi5
        cyqbLIztL78+MP9f91gmNS15Iw==
X-Google-Smtp-Source: AGHT+IFxlm4cPaWsTc52dhhsUdZJ7p0CWvQbKiYLmqnWDAlsMz9mO82xwtskyxNES5kIDLvUoOD0dg==
X-Received: by 2002:a05:6000:a12:b0:321:9c00:b886 with SMTP id co18-20020a0560000a1200b003219c00b886mr9286954wrb.68.1697050157235;
        Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:16 -0700 (PDT)
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
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Wed, 11 Oct 2023 19:48:07 +0100
Message-ID: <20231011184823.443959-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..67c8767f0499 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,8 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs201
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +44,13 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gsx01).
 
 required:
   - compatible
@@ -69,6 +71,8 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -79,6 +83,8 @@ allOf:
             enum:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       properties:
         clocks:
-- 
2.42.0.655.g421f12c284-goog


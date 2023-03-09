Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F3C6B169F
	for <lists+linux-clk@lfdr.de>; Thu,  9 Mar 2023 00:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjCHXic (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Mar 2023 18:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjCHXib (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 18:38:31 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE9758B7C
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 15:38:27 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id l15-20020a9d7a8f000000b0069447f0db6fso141067otn.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 15:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1aCfh++R75HCn6rV29gUz4FnrRGANFpdhcsqijAx/o=;
        b=wcTZjull7l8jDiPC59APixfrJy4MzvcItSe+rO/P7rkBtJoa3ywzaJv46Y/KgyTUax
         qzYWrVXLlM4b14dlgS2xci/lFbCiD3O7xwA/RRt7tvx435mRv1BaCLTUHVU1TcUX/ZxW
         R+0hLvOs3ntoFIeUr4YvifDPZgc5G85dLm8X6/d2EgtWB36YJMeJVLk4w1Prk0ZqeTPJ
         WwWxiiigVozkcncmyAsGCChDIrqkU3mxVRt+qJUI60lKGffD+G2RtdF+3FC4ugKsjo3S
         JeCn7mBRV3Jo4u0C8U4siURtbIU2otXgX1YVQzukY1zVr1ddwsQdTC6xa4PNIkRVlu4D
         43TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1aCfh++R75HCn6rV29gUz4FnrRGANFpdhcsqijAx/o=;
        b=hbW/FB4vwq2iIoMRDMTyO4s2JF4OgAQ+4k6wiBjR1EHZuaOskR4gI3lvUfWkXlyKgc
         /8u4BCcLTFPVGg0rtQWi1FkgDZo+dprOovUuQp1BYU2ziWZCIATxfQF28DnIzlNA4x3A
         2bT9Gdvk1QhislF+tgIOF+yHFn1fZDT5fXyCV+Y3yHKkQTsamLHVmlIIGmGQVFVNX0F3
         5L7OpRLBwx4Oj30FA4xmjwJ6lVplSdA8YaiKptsXV10EyJebAXeNQkMoIAL0VoujpNbf
         WwZKvTtcj5iH0mq9ydVaw6ygfzfV8HIc/Y9D49MxFUVDZB42dj5c3dIwkbR2l0KAaggm
         KwCw==
X-Gm-Message-State: AO0yUKX8YQ57qm9AyuASjSQcF3NqxMyQhtS9uXL2bV9hYIdE+87V5Aac
        nu6cR5xp+W4vDwCVZQDtA69xVg==
X-Google-Smtp-Source: AK7set86T3Ma2Mao5rC+bFw/kxkZzZq2DqDx+Iag9iINHHJah+WzhFV01lHKVAqMkmHZY45R4VkleA==
X-Received: by 2002:a9d:3e03:0:b0:690:ee9d:f47 with SMTP id a3-20020a9d3e03000000b00690ee9d0f47mr8122115otd.1.1678318706541;
        Wed, 08 Mar 2023 15:38:26 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id y12-20020a9d714c000000b006864b5f4650sm7159351otj.46.2023.03.08.15.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:26 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: exynos850: Add tzpc property
Date:   Wed,  8 Mar 2023 17:38:17 -0600
Message-Id: <20230308233822.31180-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Exynos850 requires extra TZPC handling to keep CMU registers non-secure
(accessible from the kernel) after PM resume. It's done using a specific
SMC call to the EL3 monitor.

Describe "samsung,tzpc" property for Exynos850 clock controller which
allows one to specify the SMC call address for PD capable CMUs.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/clock/samsung,exynos850-clock.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index cc1e9173b272..5098dce5caf6 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -60,6 +60,16 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,tzpc:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The register address in corresponding Trust Zone Protection Control block
+      for setting the CMU registers access to non-secure. If provided, it'll be
+      used for issuing SMC calls to EL3 monitor during CMU's PM suspend and
+      resume operations, ensuring CMU registers are unprotected after waking up.
+
+      This property is optional.
+
 allOf:
   - if:
       properties:
-- 
2.39.2


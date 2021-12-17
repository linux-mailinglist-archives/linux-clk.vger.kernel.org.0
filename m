Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9507F47911A
	for <lists+linux-clk@lfdr.de>; Fri, 17 Dec 2021 17:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238935AbhLQQPz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Dec 2021 11:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238934AbhLQQPz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 11:15:55 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6575AC061401
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:54 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u22so4144126lju.7
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYUgzkFeggr15Llsv7e4ur2WY7UgMDKixIFqjG977bw=;
        b=F2jtMQd6lFhjMlrZmy5glgqNLxj8Apz92pg2lAKfSb8G1i0CNoBUFiP9jX3BYPIVDD
         mfF7M4tzVp735bLJg/h3OQ9Shd8fRY1aYbW6hSik+O6qtKqWPHoJaoz6F68AlOsgxC8F
         lhCUxPVnU6lZZIVnroe6HKt7cp69kFRALfdxnKiuSbv+ayQEpNPzdxFf8Z5PxTBEfRkx
         a0jz6+Ofm6k3Rh5ippSmoMBPY+oV6CP3kE7NcIxGcE1WhiXU5FlApoD259firKb7AOJv
         E871UhUt0AwGXETud/tRgwH+wW7aAahl6wqbIUXzLVU8GlS05qXJS+prwp+bsKBG7HKn
         DIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYUgzkFeggr15Llsv7e4ur2WY7UgMDKixIFqjG977bw=;
        b=R+85vurMCDsVEY/goejSz5noyhvOgjMwwK/VN1UGTqruwOenWpYzzcJ27nxumD474S
         D0/2NhsJ4VMlpCA/NqBuCY7lIZzdcRyNCs/ipith+ux/ExNOJGTXRWvXRRG/xC27APpz
         /j7i0xNkexcIJ1lf9KL3UdCV26x6XiJDYGlG2e8kQZygD1ZOKlXSqiwrz+kUrDS/N0x5
         pQpfWP+V0S27J+PrDANXfWqFKB2TxIsTBwPT2dNTL/D89BCXZSin6h0w9aAper05I5l0
         w5d+z5EsTAsnBl37CfOE7THCXHZNOEKgX888rmPx+ypjpTejXX518FVbE2GzIs4kSFNv
         u7dw==
X-Gm-Message-State: AOAM530ytGkpAGT2AwhNpvWcIcJFQpBRURwZACmGcXmciuwBJscKFrz9
        j9kOGTiy2fas0vA+QUrV1wexXg==
X-Google-Smtp-Source: ABdhPJy0VR2MXAw5jDzn//v7uQ/IRIcK/YKLE/K7Gvn2bHvsL5z9YVii0mln7K2J8Er4j8Ywf3eYdA==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr3277105lji.20.1639757752333;
        Fri, 17 Dec 2021 08:15:52 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w23sm1455089lfa.191.2021.12.17.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:51 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg clocks
Date:   Fri, 17 Dec 2021 18:15:43 +0200
Message-Id: <20211217161549.24836-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217161549.24836-1-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

System Register is used to configure system behavior, like USI protocol,
etc. SYSREG clocks should be provided to corresponding syscon nodes, to
make it possible to modify SYSREG registers.

While at it, add also missing PMU and GPIO clocks, which looks necessary
and might be needed for corresponding Exynos850 features soon.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - (none)

Changes in v3:
  - (none)

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Rob Herring
  - Added Ack tag by Chanwoo Choi

 include/dt-bindings/clock/exynos850.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 8aa5e82af0d3..0b6a3c6a7c90 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -82,7 +82,10 @@
 #define CLK_GOUT_I3C_PCLK		19
 #define CLK_GOUT_I3C_SCLK		20
 #define CLK_GOUT_SPEEDY_PCLK		21
-#define APM_NR_CLK			22
+#define CLK_GOUT_GPIO_ALIVE_PCLK	22
+#define CLK_GOUT_PMU_ALIVE_PCLK		23
+#define CLK_GOUT_SYSREG_APM_PCLK	24
+#define APM_NR_CLK			25
 
 /* CMU_CMGP */
 #define CLK_RCO_CMGP			1
@@ -99,7 +102,8 @@
 #define CLK_GOUT_CMGP_USI0_PCLK		12
 #define CLK_GOUT_CMGP_USI1_IPCLK	13
 #define CLK_GOUT_CMGP_USI1_PCLK		14
-#define CMGP_NR_CLK			15
+#define CLK_GOUT_SYSREG_CMGP_PCLK	15
+#define CMGP_NR_CLK			16
 
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
@@ -167,7 +171,9 @@
 #define CLK_GOUT_MMC_EMBD_SDCLKIN	10
 #define CLK_GOUT_SSS_ACLK		11
 #define CLK_GOUT_SSS_PCLK		12
-#define CORE_NR_CLK			13
+#define CLK_GOUT_GPIO_CORE_PCLK		13
+#define CLK_GOUT_SYSREG_CORE_PCLK	14
+#define CORE_NR_CLK			15
 
 /* CMU_DPU */
 #define CLK_MOUT_DPU_USER		1
-- 
2.30.2


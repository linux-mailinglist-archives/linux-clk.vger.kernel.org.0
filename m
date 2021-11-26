Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20745F5FD
	for <lists+linux-clk@lfdr.de>; Fri, 26 Nov 2021 21:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbhKZUpZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Nov 2021 15:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbhKZUnX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Nov 2021 15:43:23 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F17C06175F
        for <linux-clk@vger.kernel.org>; Fri, 26 Nov 2021 12:36:45 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id l7so20894398lja.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Nov 2021 12:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL+cXQOYHhgidLM99dBCGy7kasZp0rKjTyY/gJtJdQ4=;
        b=BMTsjWWZUf226r0O46xi6CYkFlWm4vfNRvYD+wh4KTBX2j3WsYChKyNieTjL5pER1x
         woEWSvm4nj3xg9A5atvpLm8FQ+6jaCBj2rl7zZQ6bR/PGxYWNZ+GtZc8YBVC7v6luAd4
         bpwGxCioARQeunnpIIG/XrIiksJiGK3/Bs2PHra56pBYCfw+2K+YMBMDUTkwOmkHFy3E
         8CDxI2CkNUghVdCU2c4RNZvNHgP9AeaVMmG+Qi2gI3k9BjeIdQ4OuiGfauMmxbplUaC/
         v8NxLw8ITZLXoUAxlfWZ6QQ0K7F0/d6WPDrGrLJuFGKmjssFYK4fA+jIdI+jCPQhnfwH
         tcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL+cXQOYHhgidLM99dBCGy7kasZp0rKjTyY/gJtJdQ4=;
        b=FDloCC06E1xTbTkD/j43waYkpKoQQrliwf5qRZnK6IP77syQBKWVsbX0hX4xPxxOQW
         l0DLwKMes5JrM2Lb9+NUi4LoS0UrvYmWmZxZ3bPV7/UAgpLtZBwV9FDSnJN0adK3EIZY
         5hFBOS+BqQxjmOey8yfi3VnhpNu/YbHCDcQo1w5T/Yjtb1fKQpfI4WovLnUp5P0FraHZ
         4F21B8PEzY7T+1rWk2nsrnryoTjSMVV3KIzgU5aZAunbEWSX188BIFjc46FjqLNIyFzn
         9RpLX3d9rsibQiXqVvleQuGeNf59LBCl2q+5NZ6moHbyABS4Zg1ZwNgiKFbTQyPulPpx
         /f9Q==
X-Gm-Message-State: AOAM530U7zLeuL/aFfZR9JhF8kRXut9pxH4ja72gBOBeDblB0DLllblh
        Kgo5sfxNpeIJ+8Sj461EXfBUOw==
X-Google-Smtp-Source: ABdhPJyAth1JfmI8KnvqiYVW7NfxbEhPUAsrlQ7saok2itcm6rdRZ1bWu82XuJvu51fkDxdqx1HIvg==
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr33611410ljn.250.1637959003359;
        Fri, 26 Nov 2021 12:36:43 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u16sm583114lfu.42.2021.11.26.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 12:36:42 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg clocks
Date:   Fri, 26 Nov 2021 22:36:40 +0200
Message-Id: <20211126203641.24005-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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


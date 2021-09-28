Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB7241BB62
	for <lists+linux-clk@lfdr.de>; Wed, 29 Sep 2021 01:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243509AbhI1X7C (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Sep 2021 19:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243375AbhI1X6z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 19:58:55 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA57C06177A
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 16:57:07 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id n9-20020a63f809000000b0026930ed1b24so593061pgh.23
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 16:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DjQX0rmtYmtVJ75AljDj9ozfBfZdMqL0Po1o8FwRztQ=;
        b=PVmCAsU6FWM7arTDm8LIMtp834CqK3hJ8eh78bve2d4u27FniVQggLqO5m0M7NzVz1
         n9uJniN0JnfMjLOTSysI6BZ/4gNxVsXN+yiQynmUaE52kUTp+Hb0hWLnKF+M80dCVczH
         uEo2JL+bhdeI0res1nhnXWrNGziPqxGh87NYn/WA3QI/MCzju53xK9ABg+HCx0e1qYCs
         GBclciPCZzlfdlcpFPRwEtWcMF28l6ZG6eOOa+n13GlsTakyQrG1RnXKSiqx4Pkaoyz1
         u3d/feZl6+uZglsgxIAOipbvbUr1DL09sd0BffKLoOBYIixMGXde3YbM3RdlSoKiMcpl
         XT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DjQX0rmtYmtVJ75AljDj9ozfBfZdMqL0Po1o8FwRztQ=;
        b=Y1rb2dyoiNRC+pE2Cv3nRH36EMJCmDDcaRYqIr4bPEkS2Mt64oHrUTbM5kLT4PsqZs
         H78IZCjaCYbeZpwRg2JqLtW08vCH7Z3WCepSPOlL7D60I1m4Go4HH/R6efK9Tjhd9bTl
         YSK+6zWCKEz3HiTPR4OkQdQH1U+LTTTbSND1idbtGGU7mxbFlmyydWD/qav3vXU3M/1Q
         ucWFgSMV2/FdWUVzgCdZM2Ns3Okzkz06lzHSuhjsihymCCmG83I1abjVxc6kdxJWcL/g
         mE634shim0l6BKP55h2+yiG40ZnxzlLZ/IQ34JB5mJzXYtcjbmgob72vTdsHhlfKMay/
         kE8g==
X-Gm-Message-State: AOAM530pajBV8G4Hh8elDOe4IQjKrsRD5h4Y+zbBnR0+/DZBanJGctVn
        vgf+JCQDyy2XwOfc2KymeJOrx7cb7P8nqRxVBpQ=
X-Google-Smtp-Source: ABdhPJw9COqBlMTA4Zr9DmBfv5Dx8uBsdTDKgOtq9BaILmXCWbs/lYaV7SMppz0TKyuEFa+256t3BYuHmk/0Nk8SwBk=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:aa7:8f2b:0:b0:43e:393:e855 with SMTP
 id y11-20020aa78f2b000000b0043e0393e855mr7885033pfr.18.1632873427115; Tue, 28
 Sep 2021 16:57:07 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:24 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-8-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 07/12] clk: samsung: set exynos arm64 clk driver as tristate
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This sets the COMMON_CLK_SAMSUNG and EXYNOS_ARM64_COMMON_CLK drivers as
tristate so that we can compile them as modules.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/mach-exynos/Kconfig      | 1 -
 arch/arm/mach-s3c/Kconfig.s3c64xx | 1 -
 arch/arm/mach-s5pv210/Kconfig     | 1 -
 arch/arm64/Kconfig.platforms      | 1 -
 drivers/clk/samsung/Kconfig       | 5 +++--
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 30f930e20599..01b8e8b8d95d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -12,7 +12,6 @@ menuconfig ARCH_EXYNOS
 	select ARM_AMBA
 	select ARM_GIC
 	select EXYNOS_IRQ_COMBINER
-	select COMMON_CLK_SAMSUNG
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU
 	select EXYNOS_SROM
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index f3fcb570edf5..f65117bb9f4c 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -9,7 +9,6 @@ menuconfig ARCH_S3C64XX
 	select ARM_AMBA
 	select ARM_VIC
 	select CLKSRC_SAMSUNG_PWM
-	select COMMON_CLK_SAMSUNG
 	select GPIO_SAMSUNG if ATAGS
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index d644b45bc29d..3d7e0b5739d8 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -10,7 +10,6 @@ config ARCH_S5PV210
 	depends on ARCH_MULTI_V7
 	select ARM_VIC
 	select CLKSRC_SAMSUNG_PWM
-	select COMMON_CLK_SAMSUNG
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 90c5cf4856e1..e6d4abadacd8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,7 +91,6 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select COMMON_CLK_SAMSUNG
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select HAVE_S3C_RTC if RTC_CLASS
diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 0441c4f73ac9..f987d386979d 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Recent Exynos platforms should just select COMMON_CLK_SAMSUNG:
 config COMMON_CLK_SAMSUNG
-	bool "Samsung Exynos clock controller support" if COMPILE_TEST
+	tristate "Samsung Exynos clock controller support"
+	default y if ARCH_EXYNOS || ARCH_S5PV210 || ARCH_S3C64XX
 	select S3C64XX_COMMON_CLK if ARM && ARCH_S3C64XX
 	select S5PV210_COMMON_CLK if ARM && ARCH_S5PV210
 	select EXYNOS_3250_COMMON_CLK if ARM && SOC_EXYNOS3250
@@ -70,7 +71,7 @@ config EXYNOS_5420_COMMON_CLK
 	  Exynos5420 SoCs. Choose Y here only if you build for this SoC.
 
 config EXYNOS_ARM64_COMMON_CLK
-	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
+	tristate "Samsung Exynos ARMv8-family clock controller support"
 	depends on COMMON_CLK_SAMSUNG
 
 config EXYNOS_AUDSS_CLK_CON
-- 
2.33.0.685.g46640cef36-goog


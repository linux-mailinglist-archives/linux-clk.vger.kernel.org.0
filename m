Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D29B057D
	for <lists+linux-clk@lfdr.de>; Thu, 12 Sep 2019 00:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbfIKWTL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Sep 2019 18:19:11 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36264 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbfIKWTJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Sep 2019 18:19:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so10775040plr.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Sep 2019 15:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=mMNl63FO67KUuEHw42vIWKlthSpMwd5FVOOXIHmqrU4=;
        b=a8PMTBBTeeZyu/Wvz6ibbwLc/1cJ7vElKoSkSXAji0+1n+9jR/t/r7x/pf8m+oNx7I
         7DSzXISCFD+sD00yT2TicutThMC9mFxdIcPpLvxkcBseFcgNlCwSKCbVM20+jp4pQGu3
         CnExwUjzYpA2YT+AfVkJr/xlkDxC8joLHCGhWZBITmmkqldtD8BD3W30lM3IXT6t6Qcc
         Euk0Yp8DJlwSseJv53H0WKPmfZNPCnVsL5Z/CotAsmdO2tFTKSizohPZrDC6a/rbfzmZ
         kQfygH+3vorPTAqv2ENiOYfY5POKMqh2gH6PW3WeAfwSm2RyHHQFxOjzkCHBMgw8Ly1k
         PNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=mMNl63FO67KUuEHw42vIWKlthSpMwd5FVOOXIHmqrU4=;
        b=P65jbBIFQCifqIbQshxxYPfm2/6yy2JMm1r01Eo1MDuV/CQ42KjAN2F0IAfw6FVkWg
         lPJBW6uSk3Y2GNFokwF18m2IhKDhq063nwpbmEWNELsfYQ7kmIMqTgA9PaHuTNTbYJIw
         vMyJIG0mJyKDciLKs1tMFCT3ZPfuFaBTGWbv6NX608+y+3gaqwt/a4/wqDXz+zbbskJI
         DV1R1BFW6HWbittdKgqGBR7Icwli0t9CpGtYZHhE3Hm8uq80vDWkHy4z8ol8lKkqaz0q
         4CRXJW9gnUhoV1RcYIv9rTe+fFZB3eHmmj++U0lWgBsR8HrcagFqHvlvDNpXYLHz9am/
         YHfw==
X-Gm-Message-State: APjAAAVYfdYz/h1e36mBpobz5Ulk5P1bd6KjzlQwVuLSqdBmz+36Uhn/
        90OGUGucDhUnSq3nSNZQpt+rEUYNSpLorA==
X-Google-Smtp-Source: APXvYqxywK/VqaJubZy+tpMXHI2hldjrJm9ASPz2i3rYysqWyhJf1sL0Mqz/b5O7hDlKl+2gVQIUJg==
X-Received: by 2002:a17:902:8d81:: with SMTP id v1mr22729125plo.23.1568240348925;
        Wed, 11 Sep 2019 15:19:08 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id c2sm23999870pfd.66.2019.09.11.15.19.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:19:08 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>
Cc:     linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: Kconfig: Fix EXYNOS driver dependencies
Date:   Thu, 12 Sep 2019 03:48:48 +0530
Message-Id: <79755cb29b8c23709e346b5dd290481a36627648.1568239378.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568239378.git.amit.kucheria@linaro.org>
References: <cover.1568239378.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568239378.git.amit.kucheria@linaro.org>
References: <cover.1568239378.git.amit.kucheria@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Push various EXYNOS drivers behind ARCH_EXYNOS dependency so that it
doesn't get enabled by default on other platforms.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/clk/Kconfig       | 1 +
 drivers/regulator/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 9b2790d3f18a..bdf164a7a7c5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -194,6 +194,7 @@ config COMMON_CLK_ASPEED
 
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
+	depends on ARCH_EXYNOS
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	---help---
 	  This driver supports S2MPS11/S2MPS14/S5M8767 crystal oscillator
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b57093d7c01f..a4c4f01343fd 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -797,6 +797,7 @@ config REGULATOR_S2MPA01
 
 config REGULATOR_S2MPS11
 	tristate "Samsung S2MPS11/13/14/15/S2MPU02 voltage regulator"
+	depends on ARCH_EXYNOS
 	depends on MFD_SEC_CORE
 	help
 	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02 voltage
-- 
2.17.1


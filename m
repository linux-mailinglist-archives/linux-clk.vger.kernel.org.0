Return-Path: <linux-clk+bounces-4055-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B68862757
	for <lists+linux-clk@lfdr.de>; Sat, 24 Feb 2024 21:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66336B21A91
	for <lists+linux-clk@lfdr.de>; Sat, 24 Feb 2024 20:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57574DA06;
	Sat, 24 Feb 2024 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvSgK1nR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7D4D110
	for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806059; cv=none; b=CBseS/a/sQQ13mIGoZLZ+5OUlx3GSIyUazmdvklsBVvm8hCmzYvHZmQTCdJx5j3ohq6T3g+43GXIYjVKOt0vkjVIOR3H4Xnl++rZP5WDQDeRuItz92YZEb6zROXXKPPMKJC/ZWjVyG8i6AxmO8pOv2kqPuYVnYPfrbZkctxY9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806059; c=relaxed/simple;
	bh=fN7G3wPmBsJcgLlgsVKiAx8cGoftNtuuXTgf0LWnTHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NeEK5UeYnNkR6QHO1cbRe3yVqS4D3CqduHWhzawNNddYDknj4p7T58WYY242Bcj3jK3pSvkmAyG4dCYWDGXmq36BlEgh7g3ug+d6pl6IAWsi+5LWg7WCI00L6JZ7j2yAkOUslXd4jR+8ni49gDWdZ7/CWGxEYeMDsNiv3ibWbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvSgK1nR; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ddca59e336so1161169a34.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806056; x=1709410856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4GSfJijJ5j5tZLrOHCfmxmebAz3nZFw4CYMZ7bPECs=;
        b=dvSgK1nRbn7WRjpSKi8ySSRSfygHhpdwrNX4OcsRg7a4QmM24ZM9WN1mjOB5nnahj1
         r0MkgJJSqQ0NX1yzxS0iLsgdxmv8B0gfV3yI0WYnfRd2NHQU0Pywde1aDEkb/MHIgv1A
         K0IgdI1ehG8SSbyDhRJKvpaUJcbBnBK3XgfN164KYN7rVzfGkoHLF7p3E7S8J3tOboxF
         tigH5dQWR9dgDCBAXyv95b8pSez9lyyyk3EfR03GYdr6QXAPAuQb4kZIpgI33ltEExDd
         u7Yz9iv++1Ivp6kPea4TuzAYhi7JeIdy6YtyABBteo1YTb7m+lFP424IGBwhku43lsgY
         hhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806056; x=1709410856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4GSfJijJ5j5tZLrOHCfmxmebAz3nZFw4CYMZ7bPECs=;
        b=Qbqijl/Xq0k90IhZ3PmP4Vz7NXXkzK//Sw+dh3iFg6h69k8RPyTBOUK6EWm+CNhn3B
         gw6LR4rYCqNONgFwKHcUf4GhJ5ZrZdUUR5TyPEkqyg57c/k8iPHEdYCX1cS7GZVVJsHR
         IC2fAkKsy9dq5mmZXbhh51nTsRT2rNoqG0SF+mLfBSBhb/ohx4WvdWKa+eJxlg0Ua5gN
         2YL9TtBDrjDVaG/e9ExGwPvHu/wwn/D/AQZiLBSysNETQvhyTXxu2taPgT5jzWUXOG+C
         3e011ktpvcdHEVbXqm0WexXO6b3JwHhfqquYy70AqbDX6o6nRlcJ3JWVkQckB7HBK2zB
         BS9w==
X-Forwarded-Encrypted: i=1; AJvYcCW7OYzWEzUE/cTzavypFqJliuFbLy57yClbyyAF1oMx8Y574ZhO/gbUDNdjYLXfHELo1KaWTjPx0X1I9plyJN6kjfMrftD7kXhc
X-Gm-Message-State: AOJu0YymHvqV+jBCyMgwFu5XQMFw8bvjHtsut4vFHFldvDV/2629MX/S
	pQzeaPdsz4+xXLlKX9m1XOBZPCRyaOSV28ulsSQAQUko12roo4jB2tWTpPJBCxk=
X-Google-Smtp-Source: AGHT+IFezpIvERjHD2pciFQcNjycbJTG/ZehyajyoyHMTJjZFoS0RTBxr/K78EmMg1zM64y7rVK69g==
X-Received: by 2002:a9d:754b:0:b0:6e4:527c:14b with SMTP id b11-20020a9d754b000000b006e4527c014bmr1191372otl.5.1708806056671;
        Sat, 24 Feb 2024 12:20:56 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id t22-20020a0568301e3600b006e12266433csm407445otr.27.2024.02.24.12.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:20:56 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/15] clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
Date: Sat, 24 Feb 2024 14:20:41 -0600
Message-Id: <20240224202053.25313-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224202053.25313-1-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the scope of struct exynos_cpuclk, as it's only used in clk-cpu.c
internally. All drivers using clk-pll.h already include clk.h as well,
so this change doesn't break anything.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - none

Changes in v2:
  - none

 drivers/clk/samsung/clk-cpu.c | 29 +++++++++++++++++++++++++
 drivers/clk/samsung/clk-cpu.h | 41 +++++------------------------------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index e02730776aaa..6412fd2580e0 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -34,6 +34,8 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+
+#include "clk.h"
 #include "clk-cpu.h"
 
 #define E4210_SRC_CPU		0x0
@@ -64,6 +66,33 @@
 #define DIV_MASK_ALL		GENMASK(31, 0)
 #define MUX_MASK		GENMASK(2, 0)
 
+/**
+ * struct exynos_cpuclk - information about clock supplied to a CPU core
+ * @hw:		handle between CCF and CPU clock
+ * @alt_parent:	alternate parent clock to use when switching the speed
+ *		of the primary parent clock
+ * @ctrl_base:	base address of the clock controller
+ * @lock:	cpu clock domain register access lock
+ * @cfg:	cpu clock rate configuration data
+ * @num_cfgs:	number of array elements in @cfg array
+ * @clk_nb:	clock notifier registered for changes in clock speed of the
+ *		primary parent clock
+ * @flags:	configuration flags for the CPU clock
+ *
+ * This structure holds information required for programming the CPU clock for
+ * various clock speeds.
+ */
+struct exynos_cpuclk {
+	struct clk_hw				hw;
+	const struct clk_hw			*alt_parent;
+	void __iomem				*ctrl_base;
+	spinlock_t				*lock;
+	const struct exynos_cpuclk_cfg_data	*cfg;
+	const unsigned long			num_cfgs;
+	struct notifier_block			clk_nb;
+	unsigned long				flags;
+};
+
 /*
  * Helper function to wait until divider(s) have stabilized after the divider
  * value has changed.
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index 0164bd9ad021..ee57f3638fed 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -8,7 +8,12 @@
 #ifndef __SAMSUNG_CLK_CPU_H
 #define __SAMSUNG_CLK_CPU_H
 
-#include "clk.h"
+/* The CPU clock registers have DIV1 configuration register */
+#define CLK_CPU_HAS_DIV1		BIT(0)
+/* When ALT parent is active, debug clocks need safe divider values */
+#define CLK_CPU_NEEDS_DEBUG_ALT_DIV	BIT(1)
+/* The CPU clock registers have Exynos5433-compatible layout */
+#define CLK_CPU_HAS_E5433_REGS_LAYOUT	BIT(2)
 
 /**
  * struct exynos_cpuclk_cfg_data - config data to setup cpu clocks
@@ -28,38 +33,4 @@ struct exynos_cpuclk_cfg_data {
 	unsigned long	div1;
 };
 
-/**
- * struct exynos_cpuclk - information about clock supplied to a CPU core
- * @hw:		handle between CCF and CPU clock
- * @alt_parent:	alternate parent clock to use when switching the speed
- *		of the primary parent clock
- * @ctrl_base:	base address of the clock controller
- * @lock:	cpu clock domain register access lock
- * @cfg:	cpu clock rate configuration data
- * @num_cfgs:	number of array elements in @cfg array
- * @clk_nb:	clock notifier registered for changes in clock speed of the
- *		primary parent clock
- * @flags:	configuration flags for the CPU clock
- *
- * This structure holds information required for programming the CPU clock for
- * various clock speeds.
- */
-struct exynos_cpuclk {
-	struct clk_hw				hw;
-	const struct clk_hw			*alt_parent;
-	void __iomem				*ctrl_base;
-	spinlock_t				*lock;
-	const struct exynos_cpuclk_cfg_data	*cfg;
-	const unsigned long			num_cfgs;
-	struct notifier_block			clk_nb;
-	unsigned long				flags;
-
-/* The CPU clock registers have DIV1 configuration register */
-#define CLK_CPU_HAS_DIV1		(1 << 0)
-/* When ALT parent is active, debug clocks need safe divider values */
-#define CLK_CPU_NEEDS_DEBUG_ALT_DIV	(1 << 1)
-/* The CPU clock registers have Exynos5433-compatible layout */
-#define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
-};
-
 #endif /* __SAMSUNG_CLK_CPU_H */
-- 
2.39.2



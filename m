Return-Path: <linux-clk+bounces-1127-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F480B7E9
	for <lists+linux-clk@lfdr.de>; Sun, 10 Dec 2023 00:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D938280F52
	for <lists+linux-clk@lfdr.de>; Sat,  9 Dec 2023 23:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812232E40F;
	Sat,  9 Dec 2023 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOeOlSBf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F5B1703
	for <linux-clk@vger.kernel.org>; Sat,  9 Dec 2023 15:31:39 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso7900045e9.1
        for <linux-clk@vger.kernel.org>; Sat, 09 Dec 2023 15:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164697; x=1702769497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFN6xER1loihBa9uWQwup/JqyzQhajX2oH9kffaNe40=;
        b=hOeOlSBfMzazKzhmY3FrTHrdqkxtQVBsOAUW9IOUt5Xr759tedIuFGmYvQfCpBzNf5
         xMtXHlArBtQ65QPxIHAluVSYTuDBxMVrIIyrzC3MGutWWkAFlgbpeMLaB+xSqkQDYL/s
         A7i5SbPXQpOYPwQWeQUclkIsSTzZRCKRz6vUNvSgsSLZqlgTBicbJkrrrszxpzZDjHGT
         9uXQOpphPywmHPHkFpdBou7ARMVZ6AqHVbk6cctIg1T9gp/o8SRUy8B+oLuMbG28p4Wl
         bUChVZJRq8m/td0P6TSWfsPNH8LhNcOQExW+xAzsP1LTpvIyWCi1rjeVjXgzFgL0GIp2
         k+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164697; x=1702769497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFN6xER1loihBa9uWQwup/JqyzQhajX2oH9kffaNe40=;
        b=iyoWa49X2k+8LOmBqjhFXySUJBs7R1hp27WHBuqmIxFeNvRS6d2IeqLWTZwonAn3Ho
         jOQqYRRuVzE93FeBTz8fW0C/4jNjDDO0W2zrouz8nFL1J8Gf1DBax7NLYaYFAMK+qwRI
         4x3W6wWM8QBxNPo8W5VKYoXwNo/nU9H0apt7YqnQGL5qGvUx2u6T57K9L7Z9whq4kk7v
         Z9b4l1iJGcaLmibBA5hbK8aBb1tBpTE7GsvVsga9cCidICLMNezti5JZ28U3A0S86MOR
         aRKijr7oN+lt5wAmfeHF0+LE48ReGLz8568EX7eBvzOWnKGEEBcG23J070EVUrfw6smA
         irbA==
X-Gm-Message-State: AOJu0Yz5FOWFYVMdbKEbA8MrUK1B5Q+oBkSCGGQ1EWB2pCIS9xO7rtCq
	SHKjorLlFuaoBHgMdg393pnUKQ==
X-Google-Smtp-Source: AGHT+IHlNWaNCCCVx46tnk9DPqNQxKSg2eKBcJFo3Qqg135ZJrQ+9HNnrazePrrKs5Bhv5Z8UV7hxA==
X-Received: by 2002:a7b:c850:0:b0:40c:2b16:1e3 with SMTP id c16-20020a7bc850000000b0040c2b1601e3mr782723wml.84.1702164697697;
        Sat, 09 Dec 2023 15:31:37 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 15/20] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
Date: Sat,  9 Dec 2023 23:31:01 +0000
Message-ID: <20231209233106.147416-16-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the remaining QUIRK macros to use the BIT macro.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 7ecb762a371d..b7a03668f743 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -107,11 +107,11 @@
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
  */
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
-#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
-#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
-#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
-#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_WTCLRINT_REG			BIT(0)
+#define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
+#define QUIRK_HAS_PMU_RST_STAT			BIT(2)
+#define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
+#define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
-- 
2.43.0.472.g3155946c3a-goog



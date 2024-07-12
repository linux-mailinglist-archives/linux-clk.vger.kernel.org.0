Return-Path: <linux-clk+bounces-9554-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B792FF2F
	for <lists+linux-clk@lfdr.de>; Fri, 12 Jul 2024 19:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE93285407
	for <lists+linux-clk@lfdr.de>; Fri, 12 Jul 2024 17:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC66B178CF2;
	Fri, 12 Jul 2024 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+zND2oO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0414176AC0
	for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720804188; cv=none; b=KUt0qvgWfHf1nlV7Q9iz2X3G2UUEqGKTIgsiSh8ZBY+oY0dqfOHyRie36zXQ/Mu15D6RlszzX3KMrcs52Z7BbHFai7InRyvDuzCvmQ3efZKGrMg6qZEsQbWOyXMyDdh/vkZpNexXiZxpD3OsFp9fdFI9mKVZRimMBD01GzcfW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720804188; c=relaxed/simple;
	bh=6tgkrdVDa5dO23xQQght0Ng+/wDIbTHMud7WpTmLNbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHz60AbpMx+7ZMb696tgwRGinXbpCH9i+lhetv5N8rvTzC5KFQ6Zw1sgCvOAc8TNHoxXVbGyOmVdApJCrEH3S74gKq1QnbeBC4nKGk3FtJVZbGZEVS7kvQUPWFZnNUXmq4aQ3M2rX9GtiV0cnpP2a82KrQ2WPu6ZqbcHbhV7YEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+zND2oO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa6c4so2926396a12.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720804185; x=1721408985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nY0eQU/tg2nCxr+WiXke0QlA4moV9D3eyAAMfVXyTw=;
        b=c+zND2oO0QvfveJRoh0+pT6ulUxZu5aUGtHc5G2EpFjpr4y0+yQyoMGUNnxJZhwF7B
         VGzCVwPOkz6z5aXs7ntymlUA1aEDnKrcdRcDOfRb3Q2QlFeYsjBwneRsuSAszCVph3ci
         zPWFLQnVUlAglzIpV4y2GyDuR81neQInX76fxSDXB5c/sXrDvATq5Q+mjkt4rVa3uf6C
         3yeBI8k1vUh5chrq8Vod3rEZXvlT1xEUt80iaNkR9UyKASaVOi08RzKDMZpsvrv6T0vP
         EZ2qBpkOU6lnmdNYZPhI4gsOglzqQLzk9AOqeMLZaew5WR9YOmX7kt6WE5l4ZklmN2ag
         tE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720804185; x=1721408985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nY0eQU/tg2nCxr+WiXke0QlA4moV9D3eyAAMfVXyTw=;
        b=kPUjgVnHdCPOaIZzNwf8x6NUTBEYz1Z/no4lPNqOcxs6OWcJWE5MJBHsMGPETXeB4B
         1n9KEd+acULw0+oJIbzziySRjVuGo4Q6rVJ0HwYqJGrwCZxPySdPwJwj2n1gBxFbA8qB
         GqtSh1h3qHZH/frZY6xzJZAsCrNwpQ9vXGw1lm0hAfYAU1B98LKXTLuYskQJ6Oq0FAEg
         xtnxeYweVKWr0NuyTiRNAAi6rbph1WExOfPJzeq4ZvoznYP98c4wcUWAMGS636MtTj64
         gmwaC5qmV19BQNLsznsUXv4c5mnP+qR1e6bzkvn++yQtLe7Bl5PW4C6496DNjEP3HGwD
         3s8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/DD6mEM1tU1Qg149YEE3WSBP2dLHHI0fHa1KoczxWIjhmHkxn2/mBogML3XkA9Tm+s1bp1IrGTMnA8151GSNI6i6y0xYGlY0A
X-Gm-Message-State: AOJu0YynpRSmlhSicUJiLDGyi0V0r7T68RXWnjXwhWzRJQJnqX2rvlbR
	LJLR3hcc7ZjZLvPVP8Sbf3S9Sfgn2oSHr+5yTTuMPAXPunAwF3u5X0Z8Glagq+s=
X-Google-Smtp-Source: AGHT+IGhlF+D6i2f93oWiQUD7N6Ca4gkcUIWssLva7MfhIN2bbrAB4lN1vZ78G8Sb5kAz2YFpuYDTQ==
X-Received: by 2002:a17:906:528c:b0:a6f:d990:338c with SMTP id a640c23a62f3a-a780b6b18c1mr835509866b.20.1720804185058;
        Fri, 12 Jul 2024 10:09:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871f0esm363750466b.194.2024.07.12.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 10:09:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 12 Jul 2024 18:09:43 +0100
Subject: [PATCH v4 1/2] clk: samsung: gs101: allow earlycon to work
 unconditionally
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240712-gs101-non-essential-clocks-2-v4-1-310aee0de46e@linaro.org>
References: <20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
In-Reply-To: <20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

earlycon depends on the bootloader setup UART clocks being retained.
This patch adds some logic to detect these clocks if earlycon is
enabled, to bump their usage count during init and release them again
at the end of init.

This helps with cases where the UART clocks (or their parents) get
disabled during loading of other drivers (e.g. i2c) causing earlycon to
stop to work sometime into the boot, halting the whole system.

The general idea is based on similar code in the i.MX clock driver, but
since our clocks are coming from various different clock units, we have
to run this code multiple times until all required UART clocks have
probed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 85098c61c15e..429690757923 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -8,8 +8,13 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_clk.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/clock/google,gs101.h>
 
@@ -4381,6 +4386,99 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 
 /* ---- platform_driver ----------------------------------------------------- */
 
+static struct {
+	struct mutex lock;
+
+	bool bump_refs;
+
+	struct clk **clks;
+	size_t n_clks;
+} gs101_stdout_clks __initdata = {
+	.lock = __MUTEX_INITIALIZER(gs101_stdout_clks.lock),
+};
+
+static int __init gs101_keep_uart_clocks_param(char *str)
+{
+	gs101_stdout_clks.bump_refs = true;
+	return 0;
+}
+early_param("earlycon", gs101_keep_uart_clocks_param);
+
+static void __init gs101_bump_uart_clock_references(void)
+{
+	size_t n_clks;
+
+	/* We only support device trees - do nothing if not available. */
+	if (!IS_ENABLED(CONFIG_OF))
+		return;
+
+	n_clks = of_clk_get_parent_count(of_stdout);
+	if (!n_clks || !of_stdout)
+		return;
+
+	mutex_lock(&gs101_stdout_clks.lock);
+
+	/*
+	 * We only need to run this code if required to do so, and if we have
+	 * not succeeded previously, which will be the case if not all required
+	 * clocks were ready yet during previous attempts.
+	 */
+	if (!gs101_stdout_clks.bump_refs)
+		goto out_unlock;
+
+	if (!gs101_stdout_clks.clks) {
+		gs101_stdout_clks.n_clks = n_clks;
+
+		gs101_stdout_clks.clks = kcalloc(gs101_stdout_clks.n_clks,
+					       sizeof(*gs101_stdout_clks.clks),
+					       GFP_KERNEL);
+		if (!gs101_stdout_clks.clks)
+			goto out_unlock;
+	}
+
+	/* assume that this time we'll be able to grab all required clocks */
+	gs101_stdout_clks.bump_refs = false;
+	for (size_t i = 0; i < n_clks; ++i) {
+		struct clk *clk;
+
+		/* we might have grabbed this clock in a previous attempt */
+		if (gs101_stdout_clks.clks[i])
+			continue;
+
+		clk = of_clk_get(of_stdout, i);
+		if (IS_ERR(clk)) {
+			/*
+			 * clock might not have probed yet so we'll have to try
+			 * again next time
+			 */
+			gs101_stdout_clks.bump_refs = true;
+			continue;
+		}
+
+		if (clk_prepare_enable(clk)) {
+			clk_put(clk);
+			continue;
+		}
+		gs101_stdout_clks.clks[i] = clk;
+	}
+
+out_unlock:
+	mutex_unlock(&gs101_stdout_clks.lock);
+}
+
+static int __init gs101_drop_extra_uart_clock_references(void)
+{
+	for (size_t i = 0; i < gs101_stdout_clks.n_clks; ++i) {
+		clk_disable_unprepare(gs101_stdout_clks.clks[i]);
+		clk_put(gs101_stdout_clks.clks[i]);
+	}
+
+	kfree(gs101_stdout_clks.clks);
+
+	return 0;
+}
+late_initcall_sync(gs101_drop_extra_uart_clock_references);
+
 static int __init gs101_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -4389,6 +4487,8 @@ static int __init gs101_cmu_probe(struct platform_device *pdev)
 	info = of_device_get_match_data(dev);
 	exynos_arm64_register_cmu(dev, dev->of_node, info);
 
+	gs101_bump_uart_clock_references();
+
 	return 0;
 }
 

-- 
2.45.2.993.g49e7a77208-goog



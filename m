Return-Path: <linux-clk+bounces-13185-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5C99F334
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 18:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E3A8B23066
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 16:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFA21FAF09;
	Tue, 15 Oct 2024 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ND11Q3V5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2B1F9EDB
	for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010889; cv=none; b=ZJmVEc+MQCQpyrGDYV78Qk3BVJpYHtfPe+S2cVNrqDqGRE0OpArPYtOQhV5V2rQLal9W1PkEz9wr/wQXUquLe/SySXUHOCqOB4/aVNHat6yObj1XtVwIFvawkZ4vRmOW0M3KqOMpY9iSuW6kR6Z9tBj41di5d3pvaFT7KmJmwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010889; c=relaxed/simple;
	bh=Do6R67fDrh9jcYKlaytygcK60uwldKHxRsm47aMNHGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dO9oq++TOCikoDwSclJjptXw309909sn7TjjS4tbyCQiBawRvn2Ruv9XOp96ZynaA1vHdLEwNKia1DvEPrlYzOBud0unbNoFzK01Mm0o1/nDY0nX4AooPQdBdrz2eZvYbPAxw9KeDH2Ux4Fc5+qLU+lFPJG3Mi57LI5XsZsY8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ND11Q3V5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d5aedd177so2867329f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010886; x=1729615686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+WjlxGYvCEnZMLQQq/g2hxfKe8FSL9YNlHSnfanC+Q=;
        b=ND11Q3V5CbQbjKBaTyhLSaUK3vA8iLwFSE9vjjPMMMXv65XpQjNJm8otm6sDdcLG6L
         /xuwfrH0PfdZVc3aaEmjn+qtaY6qJbAmJQ0MEt1YOOvfzKHagF7tlsc6JMMZJRH0gwyt
         cc0hOSKpeRSV5R0KixwmncUOnHbTjbQMtjBDGIZlllDauIX5VxUExT0CpLuVFMzN9Lp0
         5bj4GAbZ6zRlx4FSbHea7TnQYW78Bg25D3UBw/6/fiEGrmAWw40bP8KBrnYb2e8Nxigo
         4VT8NNXHfRlIVMO7n1fZG+zSPo4NBePYywQ8Dvth6CHoIHHbpROit8i5o4fm1nF43Nfc
         X0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010886; x=1729615686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+WjlxGYvCEnZMLQQq/g2hxfKe8FSL9YNlHSnfanC+Q=;
        b=flC90v+D09juG14Wbkwamn1WnytMizxTnKyEW8kd7bDi+yBCLtnInMG5dMSPPUqeGr
         Ox5NgMCYsXEACVP8Hi00WRQBAosaXtBbJP559GDNTuB9p2sXkHeL8mw0f+d21FJH+fNV
         4lnt2+xLCHj0p9dCYks7KYUHnjwFXOTJdF2SMqrXT7Fm2RUUHM1hNxQyTx3JQFCzpYGL
         Q9F6R4VqZZp4Ya6z9XdvQ0PWKQKqv7d+oF2muH+SMQXmbCXoIyEn6zLrlyteys8O/ELf
         BRK2gp/OICvI7A7emD+upwA1+URc2eej72k4HhOOM+eXp8wcejWC8SSQ2KrwVXjWLKRc
         QuQg==
X-Forwarded-Encrypted: i=1; AJvYcCWVeih18aEcW2CDAmU3N34YSXyWAE3Jh+OhEg8bWmff3pNNCJGjlh/+MShnXVfUDBRMULPQQYakZJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6RQ6YysV9996+hEqutPgrVmllqwr5hiE8mN8yS6J5hyyftAu
	4fNdmmyi1fcP8LbWvhMlbrzfE+5UM0kkCYfD0Fg9RF2NfNXZFOZ0iV4PevdJlbE=
X-Google-Smtp-Source: AGHT+IFbPxKiOb7gV0asDYaMtDQ6cVmg+NsPy6xW6VOvqCFQFXVTlGbw+GFY1xG0Jhjvm9YrsIjHwQ==
X-Received: by 2002:a05:6000:4f:b0:37c:cfeb:e612 with SMTP id ffacd0b85a97d-37d55198893mr9563540f8f.1.1729010885896;
        Tue, 15 Oct 2024 09:48:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:48:05 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Tue, 15 Oct 2024 19:47:32 +0300
Message-Id: <20241015164732.4085249-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
this case, the watchdog device need to be powered on in
struct watchdog_ops::restart API. This can be done though
pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
watchdog device though pm_runtime_irq_safe().

Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") pm_runtime_get_sync() was used in watchdog restart handler
(which is similar to pm_runtime_resume_and_get() except the later one
handles the runtime resume errors).

Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") dropped the pm_runtime_get_sync() and replaced it with
clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
in genpd_runtime_resume() being called from atomic context. But
clk_prepare_enable() doesn't fit for this either (as reported by
Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
wait context warning as it is not written for this).

Because the watchdog device is marked now as IRQ safe (though this patch)
the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
1 for devices not registering an IRQ safe PM domain for watchdog (as the
watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
always-on), this being the case for RZ/G3S with old device trees and
the rest of the SoCs that use this driver, we can now drop also the
clk_prepare_enable() calls in restart handler and rely on
pm_runtime_resume_and_get().

Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
watchdog restart handler.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected Geert's tag

Changes in v3:
- collected Ulf's tag

Changes in v2:
- adjusted patch description and comment from code
- collected tags

Changes since RFC:
- use pm_runtime_resume_and_get() and pm_runtime_irq_safe()
- drop clock prepare in probe

 drivers/watchdog/rzg2l_wdt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 2a35f890a288..11bbe48160ec 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/units.h>
@@ -166,8 +167,22 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	clk_prepare_enable(priv->pclk);
-	clk_prepare_enable(priv->osc_clk);
+	/*
+	 * In case of RZ/G3S the watchdog device may be part of an IRQ safe power
+	 * domain that is currently powered off. In this case we need to power
+	 * it on before accessing registers. Along with this the clocks will be
+	 * enabled. We don't undo the pm_runtime_resume_and_get() as the device
+	 * need to be on for the reboot to happen.
+	 *
+	 * For the rest of SoCs not registering a watchdog IRQ safe power
+	 * domain it is safe to call pm_runtime_resume_and_get() as the
+	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
+	 * returns non zero value and the genpd_lock() is avoided, thus, there
+	 * will be no invalid wait context reported by lockdep.
+	 */
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	if (priv->devtype == WDT_RZG2L) {
 		ret = reset_control_deassert(priv->rstc);
@@ -275,6 +290,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2



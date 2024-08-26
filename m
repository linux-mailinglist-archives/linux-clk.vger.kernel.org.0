Return-Path: <linux-clk+bounces-11190-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83195F4FA
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 17:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198A01F220ED
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CAD194AC7;
	Mon, 26 Aug 2024 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gbldyVGl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8A194122
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685948; cv=none; b=MTr2EASIa6KKNvhJ09NgUycz6xuYth4Gk4mx4aBMTa4WC3Z2Jq+nF3Sd3KdzDogqAyJ/R0+GpKS5wZG2SyBAAhwULOqATnmP0AgkJMq6fM467aqMkOEy3BoOwNsj64l2vWrJUsrH31BpZWGnq88aXVZs/sbRY8lcTxpIoyF6OdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685948; c=relaxed/simple;
	bh=XWVC5HUqa4FOSOr6jFDlVoBbwf0lh/Ow1BEEkfWRRYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Isi9dQawqEEdXzvTlrQSZ0IZvAG7SjifSJg7RsuGcNTK+umOC3o+SWY6V0oDat9y9K9ezgzh9JgUDfbstxQhqra3+msVzfYv8lCIsR+iUdSTWKPgP4JLETvoy23qEWvyFAoxb7cpmtfNPpfLBFlrk+/CfpAi2EcosBX1UzWDRig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gbldyVGl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f4f24263acso58398191fa.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724685944; x=1725290744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X7RWHf9c2Nsin/P0/MRWONZQiMlvlo7ShNISxGRapI=;
        b=gbldyVGlJeZfkyhrR68yz9aFdsGuOpqlIaqQo/94wYzFHVjo+tJVVbB5oHkrcafTUU
         GM7WQ3KRyNuMoA0IVDEBe2D6dq2vI7XQkIWJNokLZqLSlVSiLnUYtj+ZMdFdAGSs5j72
         zfQUN+EECMn8Q8xAtIiR3dRZ04xkeon+VW5Fkcu3HfDsYh4B1jgvdd2EUHnwExvyUxra
         zQj2BabNosdbC1tmhTa5n70iy1q3i3XagGiiUU7brPRcSwOpZg5eCvDHgEA4/VpQmCrp
         7yJEvqSkXD6EZY2DRaginvaTlZatcaRoijxuVMbmeGvMz9Vnw4oaOEJmEBfkicSb8aFl
         0zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685944; x=1725290744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X7RWHf9c2Nsin/P0/MRWONZQiMlvlo7ShNISxGRapI=;
        b=SXV6LkvEDZjy4eDJ+vvF5ooMO74jR1Yt87kyPCiWkw6gWv0hO6mRdeKNGdUBQHorsA
         ztUYXzDDwXnxV/hqd8aBHFnaWcVlLyh5Lo2cImF/6quMw0/VA4Fnhh5kgE4jLETYMUs7
         +QS8vhwwgxKE/aJ9C1wEdSjO5GKku5IhDZiRv+PQopDx20Rk1bTtv9nB3hTNbLD/th68
         GFeJ16MbjJyNLpA+LuLP8LRpKerMP1y3o8Fk0Duy9jYjZ7l1DPOHPC4lWRZRoDCgoIpQ
         NWyhcU/sNwhIidwqVo/D4PqORq6QjkpJc7PMyDuSwT71F/S7IfqtsHqpYd+T/CVFS85M
         y4oA==
X-Forwarded-Encrypted: i=1; AJvYcCXTKoiXF1k3TVkiqd0pWT10wCDwBsV15b+lG9VR1UwWmh12jUwY8qVjObZnbXY4vfImxbQSIdR3g0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAnZZQwCMU6NchedBC9Yh7klxVpAqobSnl8GYZ/hXngI7FzZQ
	FiuOCRh9kSQkdv/Rpdx5CEwLC/rXuR6YdzUnxGcz4NA+fjZw1BXSdkHIn62w1EA=
X-Google-Smtp-Source: AGHT+IG/0Rw3KjFlXHyoNSA5O3duIeqvGmjekfYBFzagXObV7ksdyWtivPN8UapEZYUG+dChI+97qw==
X-Received: by 2002:a2e:b704:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f4f5750715mr71543281fa.16.1724685944207;
        Mon, 26 Aug 2024 08:25:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f437d5fsm683005866b.99.2024.08.26.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:25:43 -0700 (PDT)
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
Subject: [PATCH 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Mon, 26 Aug 2024 18:25:29 +0300
Message-Id: <20240826152529.2080248-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
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
always-on), this being the case of RZ/G2 devices that uses this driver,
we can now drop also the clk_prepare_enable() calls in restart handler and
rely on pm_runtime_resume_and_get().

Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
watchdog restart handler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 2a35f890a288..e9e0408c96f7 100644
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
@@ -166,8 +167,23 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
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
+	 * For the rest of RZ/G2 devices (and for RZ/G3S with old device trees
+	 * where PM domains are registered like on RZ/G2 devices) it is safe
+	 * to call pm_runtime_resume_and_get() as the
+	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
+	 * returns non zero value and the genpd_lock() is avoided, thus, there
+	 * will be no invalid wait context reported by lockdep.
+	 */
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	if (priv->devtype == WDT_RZG2L) {
 		ret = reset_control_deassert(priv->rstc);
@@ -275,6 +291,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2



Return-Path: <linux-clk+bounces-3148-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95094843C3F
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 11:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5B71F2FAD9
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 10:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4C17868D;
	Wed, 31 Jan 2024 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aOiNE0tb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776D7762C
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696444; cv=none; b=JB61mb1EodZIOEPmHtAC9/YLB6cUiO7KM3MAQtn9hdYuEHJmuVr59iSuush2VudAksWX66/GlA7uHYmIpTCCmLBEv6QfRo/HtlvtH/skcAexUk2efhWkSguAQvtoZzPX8hXgtrBOUJJFv0edfZKHqry8A7fow/Ny5Vtf66fsStA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696444; c=relaxed/simple;
	bh=KfuRhhLmE07WK/b0NK4ixhoDmWb8VLkg+y5Qwl/Q9mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHwYX+nQFBq1ZBEWSl2E5eKgIk9O4DGeVmvwDkdXL8dgedCivXNQ/ls5zbNqLsiLOyD+JUoWTnvKi5499esQ++29dRQfrSZkjRqV3IIjJBy/JC5eY53mMMLhwWYyoZyXZQ/tQBydrudENdLNckcmCHESoTFSqlCwSGfUwjO3Kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aOiNE0tb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3510d79ae9so567062266b.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696441; x=1707301241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re1llhHjXbi/fwsrvWTI3Q6/LQ8fqrYY5y017PvqPXI=;
        b=aOiNE0tbfs3lSypbslnTs7F4K+HDKoTi6ELx3XEdbF5Zw+hwk29Bm72mPslXXkqMK4
         F+HuvPJCzkzPkStmRbOeiEgBHSyADNEjTdP9DjTNaD6JROajM5UJYCiMPlrio2cIggQz
         jgoszl6HZG5ILBp86SGcYU88y7a884VhYaOOBP1WYguVDHmWOFzl/MMpP4QWdzlt76OE
         52H6dfSrua0kJggih+4Th4MgA5aPvCsfozmaFz4y8/cc9bJFQqMBNkuvM+kJAUvdz1Ob
         SjROt6SLv2KYA+hThCALSjg3VOoLd3YSd0BikxorDBD9BMvkNZ2WmCfcHJ+pKxkh+0Q1
         gjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696441; x=1707301241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re1llhHjXbi/fwsrvWTI3Q6/LQ8fqrYY5y017PvqPXI=;
        b=b4RP3qyQXFm3funJ+XDFRTtBLvtfdGOm9E/QaewBU2Vp9/P124jzyyT9O46Jxwp72e
         JEBPoq+e+1AZWoOjXPSZUSG3WqhPC2FXJZkKsnbzjAmdnUooQj1MWuLX+ZmxIKAa6SY5
         81q8PKvNnJIpp3w0bEpOTUAtfkBrEnlFSOBU3NyJdXXzikyPsbD9pFmPlOz390XXi4Y8
         xQIRbO1xMj4uJeRGngZ+yATHZt7YakX/njYd3PdbD5yO2FeK4vL8QgrgUzkO04FXsNyc
         JNorMeiMmDWoDbjhFflqVy1rvJqjaxCTXKhg7RgThDochskMlsKaLcJEoJnu6g6994tD
         8aug==
X-Gm-Message-State: AOJu0YxtY+bgMtumh4toLjLO2YXPBx71Jz8nNFFq+QGTreZEyBYzgMLn
	rXl7BG4pQDEBqqyxZGIQ9JXODKq1qwaqdfJYYADI28mbiiA7q52/nz4aIlhejI4=
X-Google-Smtp-Source: AGHT+IGH3oGpt8K1+2F7+2thKN5hEJnCO18EtD4fUn5WGTHvIHBe7AHURNYu86QqHaotNIioRL4Q8w==
X-Received: by 2002:a17:907:38b:b0:a35:deb0:cd19 with SMTP id ss11-20020a170907038b00b00a35deb0cd19mr778279ejb.41.1706696441009;
        Wed, 31 Jan 2024 02:20:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVBGAnIobJGMCBoRS3rBZWHSsy51Fg3CfwmauNVPMeWQqpZxk1/wtcqVj+P4yOO02nPJWwNFfDyHPZ6gTJnY69KJWF3jqVyZAlwv8GEOF2SOxPCqbfDaC4Iu0Mc8xTqvXoXZt9EIH2+RaY/mq8OBC2pQZvq0CZGGB1aCgZE/wt8fG3AAQonsDmUTlO8PzBfjAQTU3A5VVQoPyipMxsEXzMX0vpxotDMvdzdT1Xlvm2vDd9/ixWXbM2Cq36GDg/5j5OIp6TDBJWtCVNhtbN3i6edwhfxgD4HBa1ZxohE/JZnbwtu3Zs3flWpBtz69joij0dVjImG/buy8iWic3oXGmeY8DToF2+mlnj4J55pNJwH7NHdA4F2F2cHgxBVs3DV6qBMyG4ADD5YQXBmRIPOl0rl/v97DoCqzRdfFPsrvhw4HlYjwlW8ad1EaHw0hy7ht0+dthExKfkFvNceJ59nxCXO5hl82s32JTxu/ibVnRO88N7MHL4YPNUiv2m/3a1/3wyoSFzYF6vMa4n2t7hYw673BplsNvdZVRiy2CCaGwKoP0lBZ4wi6Me4u2cA0cOmNrPWNTWkHIVwXW8rSGbWqr9GTbDXxnqirvjQo0zA+zAzhwQ=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/11] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Wed, 31 Jan 2024 12:20:14 +0200
Message-Id: <20240131102017.1841495-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S supports deep sleep states where power to most of the IP blocks
is cut off. To ensure proper working of the watchdog when resuming from
such states, the suspend function is stopping the watchdog and the resume
function is starting it. There is no need to configure the watchdog
in case the watchdog was stopped prior to starting suspend.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- remove the usage of pm_ptr()

 drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 42f1d5d6f07e..c8c20cfb97a3 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -284,6 +284,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
+	dev_set_drvdata(dev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret)
 		return ret;
@@ -305,10 +306,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
 
+static int rzg2l_wdt_suspend_late(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_stop(&priv->wdev);
+}
+
+static int rzg2l_wdt_resume_early(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_start(&priv->wdev);
+}
+
+static const struct dev_pm_ops rzg2l_wdt_pm_ops = {
+	LATE_SYSTEM_SLEEP_PM_OPS(rzg2l_wdt_suspend_late, rzg2l_wdt_resume_early)
+};
+
 static struct platform_driver rzg2l_wdt_driver = {
 	.driver = {
 		.name = "rzg2l_wdt",
 		.of_match_table = rzg2l_wdt_ids,
+		.pm = &rzg2l_wdt_pm_ops,
 	},
 	.probe = rzg2l_wdt_probe,
 };
-- 
2.39.2



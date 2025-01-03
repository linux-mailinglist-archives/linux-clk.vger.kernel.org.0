Return-Path: <linux-clk+bounces-16612-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E37A00C34
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jan 2025 17:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBFAF1643F9
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jan 2025 16:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B6F1FC10F;
	Fri,  3 Jan 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qRB7LCsf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3B1FC0E9
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922315; cv=none; b=s9iRQUFrwAHhRji+v1TBlw57jsrRfIFtBAHdSBVcHwJf43qiXqv+B3Q2GdlRovavPN80Ia1gV9nbWryoU7OEA0d9Zi/gLWNj6anh5bQXoiE/XOnPCrXcGzf1i7zxDlFJ/7L3IaBE+6QoTaafQDkW1qlpp6ZVa0tTjoNsw33sulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922315; c=relaxed/simple;
	bh=vpTcFyTpxAUWxXlbXnvHItbsODwPD9kf9XkrqqjjlH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0+icr/wnS1nuGTUtl1qU5VlSEdBB7+tF94fulocrqwzO/zS5MgM0j8GY1PCdWnZAfox798A3OiV9a9T23qwz0T4hu5xoaMlGQ8hOVpaiv3mw4BwTvo4bV1pylW16oD5Gh0RuNapHW66FzpcGiWyhqTSWMlfqBlQQDmw+/5iHMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qRB7LCsf; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa679ad4265so2424868366b.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922312; x=1736527112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKO092aqGvuaWEK1ec47bOLS5kCK+a7HRvUCASG+XdU=;
        b=qRB7LCsfEUXtUCJCCYE1O+T7QP6Q/nbrT7YYV7oRxfNPItosEmNCItcK7PZsE086JI
         H2lUPBlxf1xm3NdU9otdAXG58Dqe8YO5KkyxdBSsh6pLw5xtffBYN6q7vnYp/XceGSkb
         O1YmJnNSMm79TsDD89qy1OdImNWIWqSvO0ADY3zGTddttxG9WKXQhPYzaOaALI1+YxGc
         j1AuZAiyt3HMdCuHaLHYdM33tPDCRtQ6vYkCElHbsjmHAD5vP4wgZLpOrqurrp3zN8tS
         c9BCIzmdTikuRiF6WbaOD67HszImnYJI6j+ch1byDrBivBGz7lbnl8Zx9oqWf2EyPLgf
         9TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922312; x=1736527112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKO092aqGvuaWEK1ec47bOLS5kCK+a7HRvUCASG+XdU=;
        b=OosW5rlto1Oj+x+6jZvEqBVyCrNG2rOHkCrE5qiR1p7jghKTi0xOw8V4qHprWkorOy
         WAtAEuZiHbmGgENHvyJjHlXPdWMYVuCj0NCNr24x2X06S5WtomxcY3yb5ZJc8r284+kj
         HvxfHRUHXcPHZgjiLD2DAoqTMSk+gT+2YwF3HXsszS1oAagK2mgDuoy4V62nSbAwclRv
         TzDzrM5WXQBu9TLEyHrBY+IGxmWPqGZAQlg9wpRtnsdp5Wx42SY3Bj1UqoOPVAkulY8+
         Op8jfBIB8B8WG+za/Wke1Usatl0fs0qvs9dIA/U80t1OSFxYoJf08EGHhzn8f2AcVcTh
         QTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf/BtBofrReqaLWZw0lHvwr6VEUYpI182d/0gp/iLbIBYgz8oWFrAyqGmrCr+szkMtowbynzhNpCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYuB6z1WMqvxoeT4ULKJb9vxGykBcaydzBPj4w2ALuIfUZKl7g
	FW+7slsyHhImDfnrjughrtWbs+jvd7jv9T/XADMqSTuNCxmpTYO2Y8+tLVaaLCo=
X-Gm-Gg: ASbGncvJozDr/e88XY2nhCHmJvv87pUqa6qckBv5jsZ2KBACeBIPrcc8wfLQoZaDU4k
	3pCmpbv90Ma+NpXmjz/N0iZ2clHYta8xOmMN+gTdMrJwE64nsCds2jztRKhoygZVjyeagF2cvWE
	c2Cubw1mRcXVV25pHVsbb1piOJjk8Z48nk9ETLS87XGW3vP4WM6h3mqkLDK8O5FzBJZPGrJ5WTw
	MGy3VUBaHDa7pW9Hf5TH4kqee7UQomB6UXalFpMBU0GvynfjEabc5rCoHXMKA3MSrjgG46NBVCO
	KVXc0TKTMUE=
X-Google-Smtp-Source: AGHT+IHotX0t/tDNEmrDmtZY7hNyawr8SL8uDODoko36MDXxVpeudAHOQDSv7TvNphEb+Zb8F3tSTg==
X-Received: by 2002:a17:906:4fcb:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-aac0812631emr4709225166b.8.1735922312040;
        Fri, 03 Jan 2025 08:38:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:31 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/6] thermal: of: Export non-devres helper to register/unregister thermal zone
Date: Fri,  3 Jan 2025 18:38:01 +0200
Message-ID: <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
clocks are managed through PM domains. These PM domains, registered on
behalf of the clock controller driver, are configured with
GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
clocks are enabled/disabled using runtime PM APIs.

During probe, devices are attached to the PM domain controlling their
clocks. Similarly, during removal, devices are detached from the PM domain.

The detachment call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      device_remove() ->
        platform_remove() ->
	  dev_pm_domain_detach()

In the upcoming Renesas RZ/G3S thermal driver, the
struct thermal_zone_device_ops::change_mode API is implemented to
start/stop the thermal sensor unit. Register settings are updated within
the change_mode API.

In case devres helpers are used for thermal zone register/unregister the
struct thermal_zone_device_ops::change_mode API is invoked when the
driver is unbound. The identified call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    device_unbind_cleanup() ->
      devres_release_all() ->
        devm_thermal_of_zone_release() ->
	  thermal_zone_device_disable() ->
	    thermal_zone_device_set_mode() ->
	      rzg3s_thermal_change_mode()

The device_unbind_cleanup() function is called after the thermal device is
detached from the PM domain (via dev_pm_domain_detach()).

The rzg3s_thermal_change_mode() implementation calls
pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
accessing the registers. However, during the unbind scenario, the
devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
Consequently, the clocks are not enabled, as the device is removed from
the PM domain at this time, leading to an Asynchronous SError Interrupt.
The system cannot be used after this.

Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
be used in the upcomming RZ/G3S thermal driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/thermal/thermal_of.c |  8 +++++---
 include/linux/thermal.h      | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index fab11b98ca49..8fc35d20db60 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
  *
  * @tz: a pointer to the thermal zone structure
  */
-static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
+void thermal_of_zone_unregister(struct thermal_zone_device *tz)
 {
 	thermal_zone_device_disable(tz);
 	thermal_zone_device_unregister(tz);
 }
+EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
 
 /**
  * thermal_of_zone_register - Register a thermal zone with device node
@@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
  *	- ENOMEM: if one structure can not be allocated
  *	- Other negative errors are returned by the underlying called functions
  */
-static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
-							    const struct thermal_zone_device_ops *ops)
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops)
 {
 	struct thermal_zone_device_ops of_ops = *ops;
 	struct thermal_zone_device *tz;
@@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(thermal_of_zone_register);
 
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
 {
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 69f9bedd0ee8..adbb4092a064 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -195,13 +195,23 @@ struct thermal_zone_params {
 
 /* Function declarations */
 #ifdef CONFIG_THERMAL_OF
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops);
 struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
 							  const struct thermal_zone_device_ops *ops);
 
+void thermal_of_zone_unregister(struct thermal_zone_device *tz);
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 #else
 
+static inline
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline
 struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
 							  const struct thermal_zone_device_ops *ops)
@@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 	return ERR_PTR(-ENOTSUPP);
 }
 
+static inline void thermal_of_zone_unregister(struct thermal_zone_device *tz)
+{
+}
+
 static inline void devm_thermal_of_zone_unregister(struct device *dev,
 						   struct thermal_zone_device *tz)
 {
-- 
2.43.0



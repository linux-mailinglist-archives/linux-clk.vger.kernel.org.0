Return-Path: <linux-clk+bounces-13183-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2D99F328
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 18:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F2328718E
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 16:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255E61F9EBC;
	Tue, 15 Oct 2024 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z5ao1M4v"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4291F9413
	for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010886; cv=none; b=E9pS+Pkz7NRLhB7x3io53B38Ufbnswiq930tq+m5BNSM3gjG+XnxV1JWNK6OyAwBBXI7P7AZ4SrL3/6AzAS6NAIpE2MqmZ/gBu9LLrQxng3ziVa+p2p/JEb/Pz74cfvkixFhn680D7xR1g2QLvwBGWJZMxOe3/0tE7920IMoUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010886; c=relaxed/simple;
	bh=Jb5I9yevY8Ohi3WQ6h5tfsgDg3BdRc3SmPZpDeGGynA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AhHeGWfHSrnULYS5/PPuT5i72+9vyeNYGtIQTpv7kVCaI17G5IfWOs9n2PRIWgZWfDx4lY2Gej1jCkoLjHxWAd4W2lIePd8+Y0u5eJPW7O1FvvBj3hGihd6Oe3ACauA60xAMGwODRfEh4YGpauwdNK7E/xm3kWmvuxJ5n2QpeXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z5ao1M4v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431481433bdso5004955e9.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010882; x=1729615682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa2k11SdDGuhZHKsqJ/TS4gDqIGQb7t26+plXvVEVl4=;
        b=Z5ao1M4vbsAOwbbqydzUrxzuGqNF6xGKeyj/c0dacnOnZ+E4AQerq75yE+L1BNkK9f
         tuWChYfsUwN/W3yj/HV42HdB4AnC3XZYG/mjpZZbixmB20VbHx3/4HqYU4eaFRR6XQPG
         yP1wKDQmfon0MIdPXKvgfhKEigLS+Ynp9xnBaEwixd8NHusP7GIHFBk13lQE78UZhmiS
         GFNcjMW+IYnc6YgaMs71y0AX561ATTB3qVvsmFuhVfaZvHqfn1or1qghsIonyJPjwfMf
         vNb/4FDw9iqj1VZZcA0xdQA2CjWNyKRfnrNFtvk2rV3olXpQRKwRUV5c7viMsaSc7mmK
         exnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010882; x=1729615682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aa2k11SdDGuhZHKsqJ/TS4gDqIGQb7t26+plXvVEVl4=;
        b=mdUU85ZF0nfbLKSnZ7NCGn4QHZbQdURvAwMZ9aRPxFcMmSuMtGkaMIEeV45nCShWXx
         1V3nBO+n/ADysRUncnXR9Q7Kcd+RqQgJfZhN0Dsed9Uzf1est+9cbq+9At/fCQiIWXAR
         xrb1kQPRI/q7jUwD2KmpaGicn/5gsx0EWUJpOPd9MaPLYCdxzdLhzp9BSL31BMh7X+1W
         TrTE5kpnKh8bDiXY8l0Hq9DcknxlReVbz6VvudkGTQxlSa6SG+m1ve5NxhytEUKZbH7n
         I1YcU20tLt0LmZaYUI94sJfZJeFeEpuQmw841RQElFsPhrxIssXlXMtXy9niI7FvTvjm
         qDZA==
X-Forwarded-Encrypted: i=1; AJvYcCWEl3vYVuNOc4qqRbHOsukC2uroGaKcpUl0khYozq4Jr0vPmU/aAGhoNar5djGbgn0VSFA5Fmx9AQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBPGHcC4DgsZnJAq00emrm8iSpFi3fBzvkAJASGc1qV5phSMFf
	5L/+8WCU2pAPcfJrZvTaA9BIKmeu0CaY/EWacKV6I162mrXYU+EqQ6DWh/wXoiHnxa9Owp/JTCb
	o
X-Google-Smtp-Source: AGHT+IFtO/+0oKxhctg37h6yJi7w7d+SI/mPQq4wE3AQYP22Ho6+mJDTTlrYPnox00UJhtypId0rQg==
X-Received: by 2002:a5d:6703:0:b0:37d:4dd5:220f with SMTP id ffacd0b85a97d-37d551fba84mr10424622f8f.26.1729010882139;
        Tue, 15 Oct 2024 09:48:02 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:48:01 -0700 (PDT)
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
Subject: [PATCH v4 2/4] clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
Date: Tue, 15 Oct 2024 19:47:30 +0300
Message-Id: <20241015164732.4085249-3-claudiu.beznea.uj@bp.renesas.com>
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

For watchdog PM domain it is necessary to provide GENPD_FLAG_IRQ_SAFE flag
to be able to power on the watchdog PM domain from atomic context. For
this, adjust the current infrastructure to be able to provide GENPD_FLAG_*
for individual PM domains.

With this, remove the always_on flag from rzg2l_cpg_add_pm_domains() as
it is not necessary anymore.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- rebased on latest next
- collected tags

Changes in v3:
- update patch description
- diff in rzg2l_cpg_add_pm_domains() is now simplified as a result
  of adding patch 01/04 from this series

Changes in v2:
- none

Changes since RFC:
- none; this patch is new

 drivers/clk/renesas/r9a08g045-cpg.c | 53 +++++++++++------------------
 drivers/clk/renesas/rzg2l-cpg.c     |  4 +--
 drivers/clk/renesas/rzg2l-cpg.h     | 10 ++----
 3 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1ce40fb51f13..a24cafcbc619 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/pm_domain.h>
 
 #include <dt-bindings/clock/r9a08g045-cpg.h>
 
@@ -266,61 +267,47 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	/* Keep always-on domain on the first position for proper domains registration. */
 	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
 				DEF_REG_CONF(0, 0),
-				RZG2L_PD_F_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("gic",		R9A08G045_PD_GIC,
 				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
-				RZG2L_PD_F_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("ia55",		R9A08G045_PD_IA55,
 				DEF_REG_CONF(CPG_BUS_PERI_CPU_MSTOP, BIT(13)),
-				RZG2L_PD_F_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("dmac",		R9A08G045_PD_DMAC,
 				DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
-				RZG2L_PD_F_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("wdt0",		R9A08G045_PD_WDT0,
-				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
 	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
 	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(1)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(1)), 0),
 	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(11)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(11)), 0),
 	DEF_PD("usb0",		R9A08G045_PD_USB0,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, GENMASK(6, 5)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, GENMASK(6, 5)), 0),
 	DEF_PD("usb1",		R9A08G045_PD_USB1,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(7)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(7)), 0),
 	DEF_PD("usb-phy",	R9A08G045_PD_USB_PHY,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(4)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(4)), 0),
 	DEF_PD("eth0",		R9A08G045_PD_ETHER0,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(2)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(2)), 0),
 	DEF_PD("eth1",		R9A08G045_PD_ETHER1,
-				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(3)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(3)), 0),
 	DEF_PD("i2c0",		R9A08G045_PD_I2C0,
-				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(10)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(10)), 0),
 	DEF_PD("i2c1",		R9A08G045_PD_I2C1,
-				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(11)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(11)), 0),
 	DEF_PD("i2c2",		R9A08G045_PD_I2C2,
-				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(12)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(12)), 0),
 	DEF_PD("i2c3",		R9A08G045_PD_I2C3,
-				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(13)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(13)), 0),
 	DEF_PD("scif0",		R9A08G045_PD_SCIF0,
-				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)),
-				RZG2L_PD_F_NONE),
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
-				RZG2L_PD_F_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON),
 };
 
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 63ad467196f3..85dad87f2318 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1786,7 +1786,6 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 		return ret;
 
 	for (unsigned int i = 0; i < info->num_pm_domains; i++) {
-		bool always_on = !!(info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON);
 		struct rzg2l_cpg_pd *pd;
 
 		pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
@@ -1794,8 +1793,7 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 			return -ENOMEM;
 
 		pd->genpd.name = info->pm_domains[i].name;
-		if (always_on)
-			pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
+		pd->genpd.flags = info->pm_domains[i].genpd_flags;
 		pd->conf = info->pm_domains[i].conf;
 		pd->id = info->pm_domains[i].id;
 		pd->priv = priv;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ecfe7e7ea8a1..881a89b5a710 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -270,14 +270,14 @@ struct rzg2l_cpg_pm_domain_conf {
  * struct rzg2l_cpg_pm_domain_init_data - PM domain init data
  * @name: PM domain name
  * @conf: PM domain configuration
- * @flags: RZG2L PM domain flags (see RZG2L_PD_F_*)
+ * @genpd_flags: genpd flags (see GENPD_FLAG_*)
  * @id: PM domain ID (similar to the ones defined in
  *      include/dt-bindings/clock/<soc-id>-cpg.h)
  */
 struct rzg2l_cpg_pm_domain_init_data {
 	const char * const name;
 	struct rzg2l_cpg_pm_domain_conf conf;
-	u32 flags;
+	u32 genpd_flags;
 	u16 id;
 };
 
@@ -288,13 +288,9 @@ struct rzg2l_cpg_pm_domain_init_data {
 		.conf = { \
 			.mstop = (_mstop_conf), \
 		}, \
-		.flags = (_flags), \
+		.genpd_flags = (_flags), \
 	}
 
-/* Power domain flags. */
-#define RZG2L_PD_F_ALWAYS_ON	BIT(0)
-#define RZG2L_PD_F_NONE		(0)
-
 /**
  * struct rzg2l_cpg_info - SoC-specific CPG Description
  *
-- 
2.39.2



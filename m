Return-Path: <linux-clk+bounces-13182-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F399F322
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 18:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B32D286ED5
	for <lists+linux-clk@lfdr.de>; Tue, 15 Oct 2024 16:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A061F9EA0;
	Tue, 15 Oct 2024 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lL5PztFz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B41F76B0
	for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010883; cv=none; b=Nk9wmwW1qMN0SUZI/zC4FAA+Wfc5AUFgTAUZwuau3qy00MCu3SCd9V3eNRgPoAvFOVm2dZExWzSvCJrN5SncaxEy4+3pA+muk+iXHhyxDMb1OMx91O30rGztX6pAaEVFivsRZv5awU6MpkFIudZfV0axtI1bCeaED+z0FL5pFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010883; c=relaxed/simple;
	bh=LERwhS4RVKBGhttEmAJP9WRlWvBzyJk53VHGxQRRYkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=prTIEnt24s1iTdkJWCVDsL9m7mDQtOKAYf9BIPALtikzNS3ZKbqMwcIZ42DNpFf9VKZTocjoplZrx5gRqQ907gkThuEqFlfcIzzsI498ApCEk1rgl5O+jgBsQXPQT/Yvq8NZGZvvD3aYLUfiZSyN4IBisV5hIxdSWdK9PrZj5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lL5PztFz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4fd00574so32555f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2024 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010880; x=1729615680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pKXusPTZ5tcxxkq2V3AB08xzlPZhMDjS7/H8WgERgg=;
        b=lL5PztFz4D8EHVoAv5hJ+NRkYoJLwIl+QIl+G4+5Q6q7zwnOSPqCz16bCLRI5hL34t
         8NwDj6Ws6BV97AlrLMOWESxySb+F3LzXIXG6GtKrgQKBi1y6W7kMhVOsRwqusehNFPYt
         uD+LxlnT/p6KJZz8oIANxWWRfFJ7mOE7biesvxbhNclfSARd99Pis4J8N26HZs4aUgrI
         rt5f0P7pWLY2J3wmJyNpYcKeeqqL2jQvsRrCDUvWtbZ+DdxKDza5ii0skz7BAkeBpt+p
         4de+Oy+dQAGoX3wXQX1ZUU0nlc2knlKIBLe8e8OBRcsnGEae0lyMt5dEgOJEdZO6mBv7
         gqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010880; x=1729615680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pKXusPTZ5tcxxkq2V3AB08xzlPZhMDjS7/H8WgERgg=;
        b=uePSM3JE7KuAt53XtShAaZLrQan2E2U/UF5IYHapwyjTpKWU3ZHXdfRfCePQp6EkRM
         NYwdlHEDyUjxqav7de2vD9qJXINj0cOG/0LIOCXtR0kspJamu4g0ajyJLYlvLQwVquvU
         wHF+IUIBKOl12dreYS5KZcQwU3rdRd0KjYrJtUtChhWyOKOaDPPdUpQrG5uPQT9QTUAF
         EqznuVG/im5aH9hG19XpSwgx3briX6ykoH8GD3iUtF/ClBtr5Xyk//69Ph08kOFI8JN1
         yE6CkOo5FBiw04Iw8uhb9yA4PFxJ5GU4pIuA0XWzgq/wpcYwxeoGINZANEb1n+9PG9H/
         +b0A==
X-Forwarded-Encrypted: i=1; AJvYcCXzZDVZ3DFaZ7jYKIpkVE4zRSCv8Rext0cdv1b53sBINo4PYCOGXXJtds1micTkSeT8ar8qjoP7J0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1JpQaMVgikGkbS4SXFBm6hlzZik3hLMXH9DVWcLHu0dR9eSz
	q4JcHXcQaVnzjxr9cab5R2uuInRMjsn133T1pbWnnDGHiNZQzCafnK6EMbAZdN0=
X-Google-Smtp-Source: AGHT+IHHc60GgREOlS98Zspu++ht5CfNcHtWXghPlVy/gA432Hwxq+nY4kDwZWwzU4bPGzheaVwXoQ==
X-Received: by 2002:a05:6000:194b:b0:37d:460d:2d07 with SMTP id ffacd0b85a97d-37d86285f8cmr1094955f8f.10.1729010879983;
        Tue, 15 Oct 2024 09:47:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:47:59 -0700 (PDT)
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
Subject: [PATCH v4 1/4] clk: renesas: rzg2l-cpg: Move PM domain power on in rzg2l_cpg_pd_setup()
Date: Tue, 15 Oct 2024 19:47:29 +0300
Message-Id: <20241015164732.4085249-2-claudiu.beznea.uj@bp.renesas.com>
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

Move the PM domain power on in rzg2l_cpg_pd_setup(). With this the
previously always-on power domains got
struct generic_pm_domain::{power_on, power_off} populated (and
registered with simple_qos_governor if #power-domain-cells = <1> and
with pm_domain_always_on_gov if #power-domain-cells = <0>). The values for
struct generic_pm_domain::{power_on, power_off} are now populated for
all registered domains but used by core only for the domains that can
use them (the PM domain should be non always-on and registered with
simple_qos_governor). Moreover, the power on/off functions check if the
mstop support is valid. The mstop is populated only by the RZ/G3S
initialization code at the moment.

This approach was chosen to keep the code simple and use the same code
across different implementations. There should be no issues with this
approach as the always on domains are registered with GENPD_FLAG_ALWAYS_ON
and the PM domain core takes care of it.

This approach allows doing further cleanups on the rzg2l_cpg power domain
registering code that will be handled by the next commit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- call rzg2l_cpg_power_on() unconditionally
- drop the governor parameter of rzg2l_cpg_pd_setup() and decide the
  governor based on always_on flag
- collected tags

Changes in v3:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 41 ++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88bf39e8c79c..63ad467196f3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1680,23 +1680,31 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
+static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd)
 {
+	bool always_on = !!(pd->genpd.flags & GENPD_FLAG_ALWAYS_ON);
 	struct dev_power_governor *governor;
+	int ret;
+
+	if (always_on)
+		governor = &pm_domain_always_on_gov;
+	else
+		governor = &simple_qos_governor;
 
 	pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
 	pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
-	if (always_on) {
-		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
-		governor = &pm_domain_always_on_gov;
-	} else {
-		pd->genpd.power_on = rzg2l_cpg_power_on;
-		pd->genpd.power_off = rzg2l_cpg_power_off;
-		governor = &simple_qos_governor;
-	}
+	pd->genpd.power_on = rzg2l_cpg_power_on;
+	pd->genpd.power_off = rzg2l_cpg_power_off;
+
+	ret = pm_genpd_init(&pd->genpd, governor, !always_on);
+	if (ret)
+		return ret;
 
-	return pm_genpd_init(&pd->genpd, governor, !always_on);
+	if (always_on)
+		ret = rzg2l_cpg_power_on(&pd->genpd);
+
+	return ret;
 }
 
 static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
@@ -1711,8 +1719,9 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 		return -ENOMEM;
 
 	pd->genpd.name = np->name;
+	pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 	pd->priv = priv;
-	ret = rzg2l_cpg_pd_setup(pd, true);
+	ret = rzg2l_cpg_pd_setup(pd);
 	if (ret)
 		return ret;
 
@@ -1785,20 +1794,16 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 			return -ENOMEM;
 
 		pd->genpd.name = info->pm_domains[i].name;
+		if (always_on)
+			pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 		pd->conf = info->pm_domains[i].conf;
 		pd->id = info->pm_domains[i].id;
 		pd->priv = priv;
 
-		ret = rzg2l_cpg_pd_setup(pd, always_on);
+		ret = rzg2l_cpg_pd_setup(pd);
 		if (ret)
 			return ret;
 
-		if (always_on) {
-			ret = rzg2l_cpg_power_on(&pd->genpd);
-			if (ret)
-				return ret;
-		}
-
 		domains->domains[i] = &pd->genpd;
 		/* Parent should be on the very first entry of info->pm_domains[]. */
 		if (!i) {
-- 
2.39.2



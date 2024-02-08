Return-Path: <linux-clk+bounces-3448-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696384E100
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 13:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767E91C26F8A
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C19B7AE45;
	Thu,  8 Feb 2024 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FP9DzUmq"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2EE79DDA
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396244; cv=none; b=lHDlnPZbonptPS5g/Fohpp87Dw7qtdpoOEGtddtyJA3wEB18cc0ikXU2wvdLWEsnNpaOfIsue0fESOVPqjXm8lAgKmiSpxx3i84K60jBPZXxbAd7kFcAn9LI64YK3VtwNebjR327YNxeMgs9y7YymNMcta7vLiXgX6oGKnQOohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396244; c=relaxed/simple;
	bh=+gSZowtOafOkFEg/8GzUB59ugQv6XER3KjvpNas12QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FcEk5CviQhYeVvII/O7YcEboKqUDQIXiuojZ0TiFZ7sp1m33fzHuK2vsb1MQxpP86k8oe0awWsb+6g8zOd8FWAOPb5QGdhjK7jXQN8mw6CkP+wTwBKlZ9Gi51SOK8pM0GtNk/ELw7Ne1HfFfxdHb3tVC3SUU726nZC3qGSI7BVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FP9DzUmq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41001c6e19aso5064795e9.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 04:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396241; x=1708001041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv9Z6nQcLOaMLoKcRVuDq7kdqWUsIytFPDBtdXgyc1s=;
        b=FP9DzUmqXfFDC/9mImdmE/T1f02N2v/+m62ALpAo8VX/UTp8wPJWwH0ftFBUAq84pN
         eurLeXYnH1Sikq+JBKGnmnwMqSrKhTX2lB6PB6A68mnsIcMG1uS7YbAYmMX22uRUpb+Z
         WgnBVEFtZ8GJceeLfs2TH3GkkK/WVosbleFjOHdEdbHZVvM07wtQ0h4VobsIJdttYLau
         XFf17/0xB92XabnZ3qHidPgGTWjL5NHlrnr1psWhZBwUCXjWZeSnUrMt0LnkHT3XAbfk
         CmtDu/a8bffuZmaXr2T2N6do1bpIFW589cAd3yY8YJhKtO/Tsf/Je8P2kSYS3J3u22GG
         mH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396241; x=1708001041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv9Z6nQcLOaMLoKcRVuDq7kdqWUsIytFPDBtdXgyc1s=;
        b=jrVen4I5b/Z7lZBZy4pfwFVIlEwl4s+Xl9peAjM+TvBlOylM78E0qf5mF4yRDIJXo9
         VD0GS67A4yXlE8jTdiNMTQTOahZodtr/WKrbHYSsnpNb0H+o+bNIBLeulonzN6Bl4PXG
         45VInYD5s7kkM9DfUyKRoGWlnK+6kGq/T+QDJ7htxaielICJT/ffm7NhAE5Xt5ErihH5
         zPaSmF9zmcoci9NkWIcEPCjcWWa3kdCeo5HvgbCxcLvomDJNQs+msrXKj5Y1h16etMe9
         UJEwnoGZ4JeV9eGUZANewPt6iO4ShGDYqW34BRv30UYTtl9sly6FPuYBSwNyGv20bWPK
         nbbw==
X-Gm-Message-State: AOJu0YxS+t8iGIcyweRv6yxMuKzlf+QCvMG6A/SK2AF8LDlZqW6ypGED
	NWI6YHT0MYJBqeugmiDfnF2qw6nHF9HX0sFVE1vMpMNRmdBFsYj6S5eHHgLkUG0=
X-Google-Smtp-Source: AGHT+IGPf+tOjZxKr12KJ5O/kHqF0Pw/lgg3MGFgbg4N1gp8MsFkI8SOVl/Z6PrM4cqJntkkJTHPFA==
X-Received: by 2002:a05:600c:310f:b0:410:250b:23e9 with SMTP id g15-20020a05600c310f00b00410250b23e9mr2015911wmo.10.1707396241228;
        Thu, 08 Feb 2024 04:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2QgNkbPk5Pfnbvt3t9K4nhWX52PbIVQJ7YusgWGo/a3ebnA0tziphGQNx9jHLoW6hMMVCUT1/QEdegQQvR4Q7z1ZaVBDXEkm1Uk5zOoKaGbMlIHEyxA2ZCxPHtc98YFTSCUCo3WjYn41bDdzxnW72rZvkI5odMdlQdi+TwnGF8q7UZv1A3BucB2TiBsVYNHmDtbSe41Brz5dY66mFfGd1/AVCCtDBZAnrC+4XVMeDol6twNJ/AoIgx6OLJfw49yX82n5UbYorlkml0XJ9S+UadQXdILF83WibuRK2Krx3C8rJFXW+XBgpvf421nMy9LJTo7sUnX8/jnfLtkqgJzdnQ04bwvsBa4o38SgC9n2qZXrN1ZcYixYj7DekGjPuJ+5HZ7DnucGay0G2KjZs/GpojdJfT6gJhk7tlasGy6tnZ5kW7sxGsjwLfajgeHvqrX3XcVeMbnsWgzogBSjl4Pl/+ffp+H6HbmoVBVGsEJlemE0W0XJdEYj84DYlo82ErVnmgzQU5gbGiSzbXRcfMxc4fo9bulECVaiKwJZeSO+cQKEo0NR/vMUwcFq76KiTtpo=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:00 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for power domains
Date: Thu,  8 Feb 2024 14:42:51 +0200
Message-Id: <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Instantiate always-on power domain for R9A07G043 SoC. At the moment, all
the IPs are part of this domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index acfb06cad441..3a7fddd1fa61 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -358,6 +358,11 @@ static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 };
 #endif
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a07g043_pm_domains[] = {
+	DEF_PD("always-on",	R9A07G043_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+};
+
 const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a07g043_core_clks,
@@ -392,5 +397,9 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Power domains. */
+	.pm_domains = r9a07g043_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g043_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.39.2



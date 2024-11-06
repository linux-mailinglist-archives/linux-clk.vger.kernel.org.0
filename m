Return-Path: <linux-clk+bounces-14238-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFB9BE03E
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 09:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45EEEB21E68
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 08:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F171D435F;
	Wed,  6 Nov 2024 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TuBmwVHJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C21D4609
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881161; cv=none; b=L8Nf6zGKEvFLgWdJ4FyH+TyXBy/PtK2r2Y+AHLH4Z7q34mBys5iBs5LMCdfURj+4z7UTBqrWPxQ1hO04uwJiMtH48Qp4mzSc0dYiYoxt+S9UaXUnJWP6GB9xZpe4OSCa85x2ugVa1ODfZwWLcv03Bsi5D0lG1iiTlEHsqaDzJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881161; c=relaxed/simple;
	bh=wIAZhI2L7AgNlpk7R2kynKKgko0xrLuPdmEQFFDuRHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ASMaYB308BsrzqcE5fshVwwm5urRvsKZht2/8ZbU1CvCjphB7PkItGy/BwErSEZbM/tK/n96+4ZOtxltCwmiGeybV2O7SZFF+WjJt8h8712tovLC9JnidntvkYUiVL6eWrVj0C8w49I6FFFV+Hj9Cz88xvEVkZyevBYarfMj7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TuBmwVHJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7aa086b077so824550166b.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881157; x=1731485957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjZyRFf+ggCRDSZ/jRiaVjDROYmGDQ4TjBntpQqqtgQ=;
        b=TuBmwVHJJjKMjMPK5FwNkSDgoY7LGZgBkDKktZyNu6u1x5/FFsQsNRv4TfmCmZC7vz
         hhDycFpnhhXPuoI8V9AdaMtXi4DoruSPgKhQr6vXvy6zmJdYZEAAJtQvF2y3jetJdQ81
         HBW1O5dz7dwVO0AJUE16cGe4YH6RgYxNbCbYJ1wH//XI9Zg5qHwOWLAk8ElUYx60Texu
         0Z+ADON06bhEQHtd7aXBLvmqtp1qIlddfiVIO8riA1eSZV05k75dmIiN3qnF1vu3cPz8
         crppaMZDx8UU1CwilDwC9MdeGOrS/yuV4a4sI5L4DfQXwU36iMzwqC9oP7P3u3xdrPC5
         4ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881157; x=1731485957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjZyRFf+ggCRDSZ/jRiaVjDROYmGDQ4TjBntpQqqtgQ=;
        b=UFL/xVrkJrq9HCKT1GiGs2q+E7oYi2cmewShCINRb/b9S06FMIEgkh/AZg/Hm0VA4V
         leOoa1Lm/G5R39t+AQBAPHZSWlLoMidcK19nDDnnoTtrhSyUZCmCXdid3pjRtUVkntrt
         wNlT9oE6HUsVn4WZLn/TX6T/SpwoNeS9FL39ZIK8aYN2lDFPnFLNMHV1lN8UqESf/Y91
         IYmSwaiBaur374o9kSUqbdiDE3ajg2jWdtXC/17txZuTTTdnNAnExdPKRtc9nsIQPimv
         TJaWgamgDmODVYaeOnGQYrvc9aiZCkIg9JPAZOeIs5LO6q7H9rLQO3junGgCCSHXyvOf
         Vi7w==
X-Forwarded-Encrypted: i=1; AJvYcCV9Z0JNEmbEPgTZEorJBPhbk7KHC6NxODyBxT6mvfW/88mDw5MCjqluDM1PPa6v1CwSFzr+yiTR8Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpY1GcowJ/Uu4MFfM+ThnMB4L0f7TCxtoTzMMtaDCWjBprXpDP
	dCzNhdAqDcelsczszoopdXBycvrWLQjj4ZyWKWotmgTCzASeeRJMcez7RsMqjW0=
X-Google-Smtp-Source: AGHT+IHc1SBa37Zc5hY9x9+xd6Yuiv0kIPY8lGcBBjtgyaTbmjEF6WHAwoybgZOFTyUf7zxelOPZbg==
X-Received: by 2002:a17:907:7e8b:b0:a9a:3cec:b322 with SMTP id a640c23a62f3a-a9e3a6c99e0mr2395311166b.45.1730881157192;
        Wed, 06 Nov 2024 00:19:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:16 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 01/31] clk: renesas: r9a08g045-cpg: Add clocks, resets and power domains support for SSI
Date: Wed,  6 Nov 2024 10:17:56 +0200
Message-Id: <20241106081826.1211088-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add SSI clocks, resets and power domains support for the SSI blocks
available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index b2ae8cdc4723..d71e77624fac 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -209,6 +209,14 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("sdhi2_imclk2",		R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9),
 	DEF_MOD("sdhi2_clk_hs",		R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10),
 	DEF_MOD("sdhi2_aclk",		R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11),
+	DEF_MOD("ssi0_pclk",		R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0),
+	DEF_MOD("ssi0_sfr",		R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 1),
+	DEF_MOD("ssi1_pclk",		R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2),
+	DEF_MOD("ssi1_sfr",		R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 3),
+	DEF_MOD("ssi2_pclk",		R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4),
+	DEF_MOD("ssi2_sfr",		R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 5),
+	DEF_MOD("ssi3_pclk",		R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6),
+	DEF_MOD("ssi3_sfr",		R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 7),
 	DEF_MOD("usb0_host",		R9A08G045_USB_U2H0_HCLK, R9A08G045_CLK_P1, 0x578, 0),
 	DEF_MOD("usb1_host",		R9A08G045_USB_U2H1_HCLK, R9A08G045_CLK_P1, 0x578, 1),
 	DEF_MOD("usb0_func",		R9A08G045_USB_U2P_EXR_CPUCLK, R9A08G045_CLK_P1, 0x578, 2),
@@ -238,6 +246,10 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
+	DEF_RST(R9A08G045_SSI0_RST_M2_REG, 0x870, 0),
+	DEF_RST(R9A08G045_SSI1_RST_M2_REG, 0x870, 1),
+	DEF_RST(R9A08G045_SSI2_RST_M2_REG, 0x870, 2),
+	DEF_RST(R9A08G045_SSI3_RST_M2_REG, 0x870, 3),
 	DEF_RST(R9A08G045_USB_U2H0_HRESETN, 0x878, 0),
 	DEF_RST(R9A08G045_USB_U2H1_HRESETN, 0x878, 1),
 	DEF_RST(R9A08G045_USB_U2P_EXL_SYSRST, 0x878, 2),
@@ -286,6 +298,14 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(1)), 0),
 	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2,
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(11)), 0),
+	DEF_PD("ssi0",		R9A08G045_PD_SSI0,
+				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(10)), 0),
+	DEF_PD("ssi1",		R9A08G045_PD_SSI1,
+				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(11)), 0),
+	DEF_PD("ssi2",		R9A08G045_PD_SSI2,
+				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(12)), 0),
+	DEF_PD("ssi3",		R9A08G045_PD_SSI3,
+				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(13)), 0),
 	DEF_PD("usb0",		R9A08G045_PD_USB0,
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, GENMASK(6, 5)), 0),
 	DEF_PD("usb1",		R9A08G045_PD_USB1,
-- 
2.39.2



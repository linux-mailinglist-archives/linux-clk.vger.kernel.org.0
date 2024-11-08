Return-Path: <linux-clk+bounces-14414-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1C9C19D0
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAD52852CB
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922FD1E260C;
	Fri,  8 Nov 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CPylKTkC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F61E22FF
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060330; cv=none; b=Mshs1i9VpCdJ9JL+x9289jzwbxOZ3ZaZ4vr057OWEH7g4y+rm6eonWv3+B/bTzYj1E5CdiqOd+Ql2iBLC9eu/iGBSh1KV3ea7b28A/q8e1BikOvXqvb3CO3IEbfk9OaMl3kNIVDgoL4zBHATzzsYmkOiMMQSHwvuopRfobJ50xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060330; c=relaxed/simple;
	bh=a09TZjaJcli/9KjW2Y58bjHm/OHi7sfljFTEl8afyHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyhqFPJZUW976G7UeONsG9nXJimp4TVtkyGtaV/OwinI97V4G+E279QDcmhLvA9wL2HxGz9q7xCE01MUkrb/O3btttP+UJYszPzWDsMn1+7MmVheteAZHIDoF/fdHLrNXGNE/QIm3/DK9lpn6Mc5F5b95dBPj+2uYFbimt3KQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CPylKTkC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so2847917a12.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060326; x=1731665126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYtY0OrBk7bZC9xeU2MrwDxPJ4Uy97W0JFgkjB2WAnY=;
        b=CPylKTkCrCdWg1cOhzPX96pIbem9p2KrtWLfUi4d54SRHNnB/oWwlOZtLq+rdvpRyb
         XYT6xS2U9W7xlrgDwfpEmXdRhgJ1vmxbo+knuJttG+WJoXXxvaAQ90LgLZdea6MZPLuO
         gzbRrIOtV3eUDaCCqUnazsReR8QLOOX41MN7sInjun0JMbAsz7zzQ1QblWwTxFI8ApvJ
         2FDS4cTSiegOfMdkweBJ8karEjORAO9k0pxQP1lNl77+b6n1zfN9gJwvx2uTYImxa0eg
         ZGzVfOrlKujg0SqZs5smc6uUZ9S9vI7aoqybif9mkR1Ew6CGHtiSFR9K1Ry2jHc+f3Nb
         PHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060326; x=1731665126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYtY0OrBk7bZC9xeU2MrwDxPJ4Uy97W0JFgkjB2WAnY=;
        b=Crw+ZtfL5uU43uBAiLTtYYD+mDFL46aEMBMSJmv6YphzZyk7CZYr8UrYQpbKsiDyf4
         CmMFxrhxlaFAt5BmkbI2H6kT4RfsSc8SG2d6SF8Rr9pP5DSeU8yrlCUJfCGDs4TO+XQS
         nP40C3Z5HsUFlKLRsIMZdNIQApIUnXaMoblxwPjW/SX+j6jaT55VlynSKhh17trgvoeM
         FodyE2nOQseAW2pvmY/hNCUGkb/OSZEoWjlcJe2ZZHQqI6D0jybNx7Mkhcm1aSiQRWXE
         XUOPDszGaRfhaMOc7RNol/uIyTBjbDHAxEluV+XJCM44tYjk/tL6q2ApfO2OhiD8NPrR
         SGBA==
X-Forwarded-Encrypted: i=1; AJvYcCXAT7nXlvEmoos1g6Cg+W6T+rjNXAjRoKhPopZ5XbN2Lmvj2GeXlj5nxsNVCiAXZo0ld9kUCDUvf6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPQJhE3LaAhlAWVx4EYlUa72+rTxjv8gP3g3JHKCS+4OmfIa6
	K4v5KzgUXeotwRdixZCDantvDVi2+Ir5g16lOs4z38KB1wR2XlPAzxMfAg52QrY=
X-Google-Smtp-Source: AGHT+IGqaJPUNFmTSByl5fjdpcyTvHiAsDHzpLWJpILteDkcG+h1df3v5dSwPZt0Fhdmn53vA4DN6g==
X-Received: by 2002:a05:6402:3547:b0:5ce:c9e0:aebc with SMTP id 4fb4d7f45d1cf-5cf0a30c5e7mr1433755a12.1.1731060325622;
        Fri, 08 Nov 2024 02:05:25 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:25 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/8] clk: renesas: r9a08g045: Add clock, reset and power domain for the remaining SCIFs
Date: Fri,  8 Nov 2024 12:05:06 +0200
Message-Id: <20241108100513.2814957-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC has 6 SCIF interfaces. SCIF0 is used as debug
console and is already enabled. Add the clock, reset and power domain
support for the remaining ones.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/clk/renesas/r9a08g045-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index b2ae8cdc4723..da6dfffa089a 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -224,6 +224,11 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("i2c2_pclk",		R9A08G045_I2C2_PCLK, R9A08G045_CLK_P0, 0x580, 2),
 	DEF_MOD("i2c3_pclk",		R9A08G045_I2C3_PCLK, R9A08G045_CLK_P0, 0x580, 3),
 	DEF_MOD("scif0_clk_pck",	R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0),
+	DEF_MOD("scif1_clk_pck",	R9A08G045_SCIF1_CLK_PCK, R9A08G045_CLK_P0, 0x584, 1),
+	DEF_MOD("scif2_clk_pck",	R9A08G045_SCIF2_CLK_PCK, R9A08G045_CLK_P0, 0x584, 2),
+	DEF_MOD("scif3_clk_pck",	R9A08G045_SCIF3_CLK_PCK, R9A08G045_CLK_P0, 0x584, 3),
+	DEF_MOD("scif4_clk_pck",	R9A08G045_SCIF4_CLK_PCK, R9A08G045_CLK_P0, 0x584, 4),
+	DEF_MOD("scif5_clk_pck",	R9A08G045_SCIF5_CLK_PCK, R9A08G045_CLK_P0, 0x584, 5),
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
@@ -249,6 +254,11 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_I2C2_MRST, 0x880, 2),
 	DEF_RST(R9A08G045_I2C3_MRST, 0x880, 3),
 	DEF_RST(R9A08G045_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G045_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A08G045_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A08G045_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A08G045_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A08G045_SCIF5_RST_SYSTEM_N, 0x884, 5),
 	DEF_RST(R9A08G045_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G045_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
@@ -306,6 +316,16 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(13)), 0),
 	DEF_PD("scif0",		R9A08G045_PD_SCIF0,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)), 0),
+	DEF_PD("scif1",		R9A08G045_PD_SCIF1,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(2)), 0),
+	DEF_PD("scif2",		R9A08G045_PD_SCIF2,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(3)), 0),
+	DEF_PD("scif3",		R9A08G045_PD_SCIF3,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(4)), 0),
+	DEF_PD("scif4",		R9A08G045_PD_SCIF4,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(5)), 0),
+	DEF_PD("scif5",		R9A08G045_PD_SCIF5,
+				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(4)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.39.2



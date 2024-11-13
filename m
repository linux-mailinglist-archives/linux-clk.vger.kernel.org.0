Return-Path: <linux-clk+bounces-14629-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202B9C716E
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 14:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BF82B29D8F
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DA31F8EEB;
	Wed, 13 Nov 2024 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QOO0wjA5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5751EF94C
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504950; cv=none; b=aPW740emNqDe+nNF4p/rc2ioVfAGV69XEI2rOElKNUQIxFbX7gbWA392Iq7dhwA460jgxv9IZIUJgJsQ2bR2maoUZJlT+AW2ta6Tugeb1wPRGd8lzvlW0gZQKnl+Ze9E57mfOZuxmlHfT+L6EQZlaRGhmydmOemHBAXCqH4Yyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504950; c=relaxed/simple;
	bh=tRCvEtnmNEMPpYJQYZQqSgTO3s8UYztq2iLuGkoPOpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sv+z/ibTVExaqAKCBjzNL6Cl6020k7fWEBZH/Wj2oGzpWAz7obBje520HO9suOkuXmoWVsWQI1h4r9UQNGifsfVuR5kqiHTAcrCOkNhfWzSzaFnMCCCJJnbgiD9YODj6G+Z3rxBMKFCx3XHQCNLnC0KBTbfT01tr7HKbQxR7eP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QOO0wjA5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431688d5127so55860385e9.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504947; x=1732109747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIKrCTKqo0knpYzgqc5iDCSA2PYAxbi2sKJksW310Bo=;
        b=QOO0wjA5dpONZKhyUX3ow0rznyCc6A9iV7V3tMfxpwbwrFLK9lBpD4e5xxLv4sABQL
         938ov4IhJ+fi1BxqxsLgISP3cy1rMOTQr9c/mxUoX4ftUn3rCFsulT+VAt/2P/Zw/tQN
         O7lm7ae1j7F4h5SivXgzzCCa0+3eSzHsFb1mDl2Gji9FFTn+dIlxt3hucdUIhfcvxCGW
         6F9783SwCflzfGPbnjGs0UyS3GMuiuTPZdkS6KR5fS2tb0VfrG+GsgywuiPWmejC1pHF
         M0rC8RW31V5sPGDBe6egH9Fl9yvueBYCVmwBzcMli8yPLGQ75VY8WVyN6xJGLoyogFiD
         yNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504947; x=1732109747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIKrCTKqo0knpYzgqc5iDCSA2PYAxbi2sKJksW310Bo=;
        b=TLKjejyKnDQH4CJiIG5WCj4CdHj6IoD1w0s3GEuiyJku5d/r3TBBa2h4oOzlfrzAOF
         DiMOIxslMtLWeCzpHcXGsHeAt9GVnVGG3AYVzZjzds0Fp+0kAUUfgityEpb+mdFwnQtQ
         wW7MnN03Af0GfB5qOoPK37ILsXq/nzpzxvvwS157n4GzjqCMn1mXROyAPrOr5XDSyte0
         /NcXtuO9vtp9H67M49mW4oXaLGnxvbe9GwE4+O6tkxXkztdHWfMgze9JnwgRYUVJ/r8n
         eZs61Pwgd6NVP1oMzr0L1s2/JeigRBN9jfU4oDeWcJoq49IrMnOXFJCCdm9Z1gwvHJyO
         CUPA==
X-Forwarded-Encrypted: i=1; AJvYcCVTzNLAZJ4a/EYThG0vy8PNmj7Yy6VTBnaQqz0y+9TAIOPEEdF7OLLTu+R+k1WJvQDdwaeZgk7ckMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbmNb//B4+QIuRqSaiFFPFE7UiA3SkxA2dI5FPpMCBpej5eyu
	70fRY4xkvL6amkTIT1ZVItoxmIrEB2CZ0+WpVJTMSbj9VdNyQ73FA3NxJbPxFkA=
X-Google-Smtp-Source: AGHT+IFQreZFi8mnOtWCfd/MMXO2rPTH6077T8y5lvDdCLcFj2DGPY9RyFbfHD6Lh3FLLf+PiUBOcQ==
X-Received: by 2002:a05:600c:a40a:b0:432:d866:f45e with SMTP id 5b1f17b1804b1-432d866f646mr7318525e9.33.1731504947270;
        Wed, 13 Nov 2024 05:35:47 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:46 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets and power domains support for SSI
Date: Wed, 13 Nov 2024 15:35:16 +0200
Message-Id: <20241113133540.2005850-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

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



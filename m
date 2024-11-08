Return-Path: <linux-clk+bounces-14451-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAA9C1B9A
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D641F2118D
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C561F8905;
	Fri,  8 Nov 2024 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b5QF2SRW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445261F818C
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063077; cv=none; b=ZDUBBhHkrFgU1Osl+HM7kpxUBXyVB1wVxITmHMKvb21OZNKp6u8SxYbL4k4VhTqP8wU9CbTi22JITBc6HnZF53T/nWv6jGVGBFuUhLWnMPDD78iQLig3YRELGlrugm9ziQ/elAufPXYd6eeaCqPrP3h0peV54G9L0quq062WBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063077; c=relaxed/simple;
	bh=hqyu/9qwuqDDVwdAINLf2spd90W5bEVXoMMCjRUAF+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HxR5DfcYCam8LkXxyqMFw0Bxe0kCYZcqvDkwK3rfD2e3eYupjFHrr3TOeeNSiNjJZNF7e2Mv3mlb4a0mcLSPjP0gf/zt/t21FvRo1GignH50ofnlEsjHcxsGok94p5UdknO1WzyyK30dtG8V15Q2GsmaoIAXHkyul5LWa5cqvac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b5QF2SRW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a628b68a7so331797466b.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063074; x=1731667874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhv+LUNkX03bFAIIjXJ8kSHL67xt82fodrUWsAE+DN4=;
        b=b5QF2SRW7dwruDQtoYYbgvRLhlZiw7pV4vDoXRUGgw1IHJWGbkIsX+UQeGYAdgUFht
         9V6S6AcQrO70wNgEL7f3CbRarYy6HlP8CQFp3Pd7Hz8AA6wgL79cTXGUFskdsqYuVY/W
         ROOxS5BfJi7m6teqBcS/Vn7m/xIuyO4LYoMsuIjn4OxLWCLY8ynfAyZdJD/24GZfCYVN
         x4wN55SiatmMDcbrmK/C7wm1+crMfWH4r3H4jbjCBzTRQtfAnCau0sZo9L3K4xPdQbCQ
         Z6zTKOTTy3e8KpJqYcvaIk16fW+jMIgK1gNbmh9sCMxUFLAfAPkWRXd7heVzzZBEzmW9
         Czfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063074; x=1731667874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhv+LUNkX03bFAIIjXJ8kSHL67xt82fodrUWsAE+DN4=;
        b=HWz/upLR1Zf9eHfN4lNwV0t3mTC6uU51XsaOcOpAZyg7Vh3RraoYhiexQo2UGnpuLC
         TOpl35dtYAV5MwftINgC9LWyrz88eoO/HAGiKNuomAS/LYlimGYuDIb9iWOa/wicmpjD
         Wp2E0i+UjGBkxVtv6USvE3K4eXRGyMoMNm4xu8XjBuCjV+IMss1tinRMT8TWQldxuk7l
         jaoIMHEtdv+R1xxM0t5368G2nDDMovTmnP4u3S7t6+upbn8ayr2Hnc/u4pS2ZDq/3Lil
         jtSgmQ+2K3kio3NvxHHetkSFMDu+mcEqk2iQUHPYWeLbapKr3qOPr/kZtNze3mbzx7vB
         /Ngg==
X-Forwarded-Encrypted: i=1; AJvYcCWy8mbTsp47vBKwou2Agx7/cBoqrayyfAEmssog95sz/IxQEFNnTZDczPoNPitAoLA0dq+rcow6oLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44wkxRvthRJitqH/dwoWuLdCWqaHWyvdGcvcv686iHhRA/RQu
	D6Q+46Xh84A1Mx1rWsw3achfhUEDRHnkOiU5sxbGU9Xe4oYnD50pU+HWj0aU9MU=
X-Google-Smtp-Source: AGHT+IHUKLF63fTQjZZXGL9+QOGbq1MfnR4SJIk9s5yAvSCxzRCwnV4uEpnoB/HG2rOronjoba1QRA==
X-Received: by 2002:a17:907:608b:b0:a9a:6847:e82c with SMTP id a640c23a62f3a-a9eefeecd1emr186776366b.15.1731063073712;
        Fri, 08 Nov 2024 02:51:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:13 -0800 (PST)
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
Subject: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Fri,  8 Nov 2024 12:49:57 +0200
Message-Id: <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SSI3.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4aa99814b808..6dd439e68bd4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -94,6 +99,11 @@ da7212: codec@1a {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -151,6 +161,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -171,3 +188,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2



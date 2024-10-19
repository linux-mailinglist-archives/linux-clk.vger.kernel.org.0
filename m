Return-Path: <linux-clk+bounces-13412-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 895739A4C56
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 10:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE2B1F22B85
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 08:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3471E0DF7;
	Sat, 19 Oct 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qsp2UG3g"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD331E0DC0
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327692; cv=none; b=mIs7kQ4w67PU9oit2zwhLl7WoOARmbubFZ1TJzAdzblCa3/k1QDtYwOgwPUbcInPaIlbMPhi6cnf49QxjBLMSHIV5K4fzQujeA8ReBYePwwegVCD1NgJzJF88HenJ53yEzahSS/R9O79CuQO/BOR8BOVsj987wPrrkraOvGrn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327692; c=relaxed/simple;
	bh=bD1jMPeKmNiNSoxPoaIA2WFft1eg2mBIz6AGJlahQeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdGrvIxEmSrdSk7kf/B18O6alipUK9F7QG35AL+hoCRW9dwRFdCNHQjOO8gaeJqOjL+eroxqvyepIN5KcAhmmB29T58nV/CaYXOr5gXPlCQg0BvrxI6RsAkNK0YQk1Y025niRMGrDG24I8je1Ev8/aHbm27H8mQyObFXUxRHGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qsp2UG3g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so29990065e9.3
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327689; x=1729932489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4OL4boJT/2hL4Oh+ceYHE7eZzRVFhBoQ6Np4j2BgTU=;
        b=qsp2UG3gckT7lNNA6o7WPNX43OUZ4E7Wzl3iLtnOA0XQzeg8OZzaFKfrrTx/fauMUz
         iIAmzcQtjsYkNGKVYSiTqi001s9IrLDtaXL3lKJ18oJ2OrrmxAyNcHr1JOkl8xutWU97
         VhA+2Hygz++BT4z3iWim8hnh8IfNqqwt6BE6k7kfvYMBmnTdcIn0K8kp6x2mbY2FFQfv
         nUi2Gv+1t4BB4Kzc/7lBzdWm6xdjiUoB4dSPVMeCRGiSzRhN0A2vTYGhgkBtczPREjIX
         WxKiZMkMnWmrvSC2IaSBdrFyUDBh8wHCMe7PySpt8TlMg5CnaWd55rOK6Uess4r4HlG4
         rrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327689; x=1729932489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4OL4boJT/2hL4Oh+ceYHE7eZzRVFhBoQ6Np4j2BgTU=;
        b=Y9siKPzvO66/gPV7VLy/Gqx06Js1M59MDaCcbtCM3GHIK6IsLlBuTpXGAoIcC0nw4b
         uB2M0+wCeG/sIHIxiUdSRouP7ZQXU4qNM5Xms95OQazeOZJoulN6kDEtQtfWZL9zbh0V
         7XEWg3twcpiORbxRNjKQZofA6pBbnJ9/8xBWAL8Io+zAPaLqDPbeWeQm0q7WAf6i9BMT
         uDdxc6ptstH4VKQCwfmqqX7A05sz8axxDNOosbb424nUDv3UUmgpQrYoP+eADVQAHWzi
         +sMAdV+70w6EjGYdNbh+gm6qddKq1I0eeHWCU99pl5Lplwi5vMejHcsZrPIdOmuEEdXf
         7U4g==
X-Forwarded-Encrypted: i=1; AJvYcCVdXMPTy9vqSf8imGHlHPfKY1FeE1vLI1MVSqqsuSVwtupHRp+v/PpVMvAupn0PO4DMkk5S1KbdAGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAMUxQXLanrGlstngSHYRKGdG9hicrae/ZvnWyLND4j+3kOzx
	H9pkRjsrn+9W06q8dXetNdZ44vOvt+4FfhAvBuf1n++LvbopyhD3CSqQsQBKNVI=
X-Google-Smtp-Source: AGHT+IGuwNzhPfqAHFLa3fosifp/I0jtRbEAeCuSIqQl7cObyIUSv6yK/EkVUXdr3J1GxmE8+2J+NA==
X-Received: by 2002:a05:600c:8719:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-431616331ddmr38040205e9.7.1729327688555;
        Sat, 19 Oct 2024 01:48:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:07 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Sat, 19 Oct 2024 11:47:36 +0300
Message-Id: <20241019084738.3370489-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 21bfa4e03972..6be0ffdcb87e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -346,6 +347,18 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+	status = "okay";
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2



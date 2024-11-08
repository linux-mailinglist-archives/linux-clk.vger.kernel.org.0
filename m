Return-Path: <linux-clk+bounces-14418-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FE9C19E3
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F9852853F2
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067241E3DEA;
	Fri,  8 Nov 2024 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WdeJYyzM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9D1E377F
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060339; cv=none; b=ob9tUHFua/TPs1QJziPl8EkzlLy4iKC6cIoxSxyBuINWkblE5J9mWa7S/43abViAMieBffe5QqKoO5H3wX1H5pH1q1tKvTW+sCFH8o97J3RuBOC32o2JFrdjSYYJV4XwgwSDUrK1dfPaOJUVkJQm1qd1Ec7fMVji09/vVUmcQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060339; c=relaxed/simple;
	bh=aVeWIhV+EQgINF/dzLhLAY+zJ+kL2qc72LUlFGQF1ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V21d0FAVB6g7npuimC01XH3pHGPGZkAxmhb4kC46WjpxVL4XGFVVvqmpwYDuXsTyaiT2aP/sODG+4rOuHNO/Z2ut7Wg66bGIbn7WlW6+qEGhRAYyL/oJJiQmPSFu328uklL8nn5/Cgjq0q4IIay5aqnX6WP/DECSUG7NXPAYk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WdeJYyzM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf0810f5f9so862419a12.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060336; x=1731665136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cwCXjU0n2G3z+UZFHjOKDveE8Cms1D3rG5Gj4FG1Ng=;
        b=WdeJYyzMfDHB3RNFOPzCwN0kvYWctAD+e+egwAkKdcVoQGp4bGaclcKgF6LmRXvL6x
         2I4H6IcFsg/sWrEYRy3PyoGTOIzIZIW2pXiR9+iTt5r0pGfst+mH0Pzd8XEmgfXZJpR7
         vJvMRX5Hi4+eKVYmIkUCoXNs1MvFSPCA8rwQfKjx33yZBKfYYyHI2ONsEslk4qyfdx16
         n8Xa21JN15Z8NpWpByR0EemOy6eVAe5iLaQU2XSTR9xy7XK0G0StM8+VeWxIsvfI3WOZ
         HXq1yNhagdZL4GUmzVBgFXApLdJBgmoYuHirp80o0sS4pSIF71fAamV8ibGx25PL4J0m
         iCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060336; x=1731665136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cwCXjU0n2G3z+UZFHjOKDveE8Cms1D3rG5Gj4FG1Ng=;
        b=QrTjIgbKC9ehPv52SLe4CFgzjWCATjuKND09LPiN18X6DoHyf3r52zPywjYxX8O9gw
         /YM79QVWRkpnEiV0T2K4IO+3eS4yuFn72VIWBtxUDi7z+4qy+d0BIgyYsKZ97nQkPZy3
         LUQFE7TB1OvdZTpbcRDY8W6Mumo0DlU09JuPpSe1i/gTWRQWtjjVb7mvxW2n9WksVAV9
         PjFtJOnHouIC4c+LlH4qFrIOtr+xvyzX9F2y/ZZEaxCkAczJfvHFIRzble8kXRptCXlH
         DWQ17BsF6MmmKmOAj5mR9AGELUn2s04EdOndsUfHZNNU1zrl//lPoHXd+8mXeK4opDXg
         cgCA==
X-Forwarded-Encrypted: i=1; AJvYcCWy9eCIhvuN+5b1HQlS1uEI3KLxzjLIxHaipoy3rHkBHXCpK8li7FXA26SWYNecJsuKFRWULslTbZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgL1I4t6T1cScAn/8ucdKMtDjfXHvqhhqMTujfEtc9h4lNOH0
	p6lh6VpjDHnmJZKzrM/DOEpuyGPm7HXNUpNItgeoIxV4huL9TCbkJwhPCgLuS/RC6EMCQQVLUnu
	R
X-Google-Smtp-Source: AGHT+IEhAY36VlwWizUIHL2fn1f9dEMQ6HoqJ2ZC+QNZ3eCzorNxh6EUQp5eUYFZp0uhHTBZAdJVUQ==
X-Received: by 2002:a50:9f89:0:b0:5cf:11cc:91d3 with SMTP id 4fb4d7f45d1cf-5cf11cc9357mr775907a12.9.1731060336107;
        Fri, 08 Nov 2024 02:05:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:35 -0800 (PST)
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
Subject: [PATCH v2 5/8] arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
Date: Fri,  8 Nov 2024 12:05:10 +0200
Message-Id: <20241108100513.2814957-6-claudiu.beznea.uj@bp.renesas.com>
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

The debug serial of the RZ/G3S is SCIF0 which is routed on the Renesas
RZ SMARC Carrier II board on the SER3_UART. Use serial3 alias for it for
better hardware description. Along with it, the chosen properties were
moved to the device tree corresponding to the RZ SMARC Carrier II board.

Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM")
Fixes: d1ae4200bb26 ("arm64: dts: renesas: Add initial device tree for RZ SMARC Carrier-II Board")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 -----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi     | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..55c72c8a0735 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -43,11 +43,6 @@ aliases {
 #endif
 	};
 
-	chosen {
-		bootargs = "ignore_loglevel";
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory@48000000 {
 		device_type = "memory";
 		/* First 128MB is reserved for secure area. */
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..33b9873b225a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -12,10 +12,15 @@
 / {
 	aliases {
 		i2c0 = &i2c0;
-		serial0 = &scif0;
+		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
 
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial3:115200n8";
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
-- 
2.39.2



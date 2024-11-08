Return-Path: <linux-clk+bounces-14450-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AC9C1B99
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8E31F2118D
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5951F80C8;
	Fri,  8 Nov 2024 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NYMrsbIr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98561F818A
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063076; cv=none; b=skCPmod8yVtKhTUFH0FdtUhTWJJ+oDjWdAWG1pxcGa6JVIZlGE7fS+7tit8TFeXoMrWvCe/ymBGiWChNSFl4m4rl/GY+tRuCJ+uC8ApZ6S9EHJTLbc84LIeiWK/meolABFdn7qxs3hKydmwCQpqB9GtyQE2fyuwBN7DolvsFGNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063076; c=relaxed/simple;
	bh=+elLfA4VfsJY2MnJEDUj2dewBBjmVeBPdM0RWsMhp1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HkYWmdNzMfKHOQHWtm4V81P7HSuxjK6gI40V5IjobMrm+anQ3TNZ/Ki7dZNL36r6FHzSN6agEN9CmBe3MB01mggtmCZr2msjnXuZASgbGObj+fwSO5tjbqXq48ljneLrj0u8QqdreeHmVIYMBGaVri949ULBXqkJyU+Xy0lPIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NYMrsbIr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9e8522445dso333484066b.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063071; x=1731667871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snMV9I7XJiOsIBTioF2I79J9msSQHgGVZ9Uaq5lTtJM=;
        b=NYMrsbIrssCJgP6VSEXNbXwxv6JU9D296rshM8eNBFHa2rtLZZQZHlwUh49BF92q0i
         R+PoN44YD0M757RFJg8yDzgriEWBP0+jd+kxJ+/OBRh/t7L4Lhesy2VHO9s3Mi56JoaY
         S5WJtOSEIVVK37eHkdYitqX2/xIWB3OWsczXcR2cmfUzR+0qrPCMyDcXm5PGd/v5MqK4
         3T3rVskEfyUnL0R183781BddMsma4oE+wCXrKV78X44C6s4/JjDjW4DjReR8X65nAt7j
         lQaZtpFt6Dc04NYyWV4haOlzrKk6XJjjLo8ocpReZ9/5KmX4+PXRN5D5hAXAcQ+0E5E4
         79Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063071; x=1731667871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snMV9I7XJiOsIBTioF2I79J9msSQHgGVZ9Uaq5lTtJM=;
        b=ug75lMw0NPPQDsMlApraSzqXL6+sUUVoSeqilx4Ed36XKwOf6ny76GY1m24HUrsaqN
         i2V2EmawHaJfnE+qQnUnRuk720b7loENcXc33T5i0kIGs07HtbIIhr9XN6qwpAsP8RkJ
         0Qwku1eB1TOnXGiL1j6IUW3LReq4WcAC99vPkoYPE2oN0CWbRA84u6e7QWT0LT9mp1C9
         Oiy+lQdd1eflnUcmRIzI398M7vj8qlxp9KabaKdwiWdbmKOeNVr371A46Ewe8yUBOqO8
         Ola30bezGKUHJJU/uhpv9d9PuFzqMJLyQ66B/Q/9xTZF4F2woyOucPxEtgujZvRT6wN0
         +LPw==
X-Forwarded-Encrypted: i=1; AJvYcCV6pKJJ4wdKpNJBkL9i7TYkqeRnEffN7BGl7P34IS0FXeKeNzZKDnXwA7Ju8Y03JJ8+wCl/i80RU34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC+HO+/su7xWGgCuSK+LPQYje0wU65/a7qMRAfpLjuO3x3CLC2
	iKWsRdc56z2tegzQ9qkMI6aUvirjc8K8DJSIN/kjdUb53E5dvZEQ7uEPxN9+mX8=
X-Google-Smtp-Source: AGHT+IEXk2PGrE7aJCjvmKPF0q+eI385OHavfjmtOJvm3sOKQT90Qxfcy+mFFxyUp6Mj3N/Qcl6BUA==
X-Received: by 2002:a17:906:6a1c:b0:a99:6791:5449 with SMTP id a640c23a62f3a-a9ef0019165mr208984566b.52.1731063071286;
        Fri, 08 Nov 2024 02:51:11 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:10 -0800 (PST)
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
Subject: [PATCH v2 23/25] arm64: dts: renesas: Add da7212 audio codec node
Date: Fri,  8 Nov 2024 12:49:56 +0200
Message-Id: <20241108104958.2931943-24-claudiu.beznea.uj@bp.renesas.com>
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

Add the da7212 audio codec node. Along with it regulators nodes were
reworked to be able to re-use them on da7212.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 23 +++++++++++++++++++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6e58d47d85b0..5ee9dac4aebb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
-#else
-	reg_1p8v: regulator1 {
+
+	reg_1p8v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-#endif
 
-	vcc_sdhi2: regulator2 {
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi2: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..4aa99814b808 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -68,6 +68,29 @@ &i2c0 {
 	status = "okay";
 
 	clock-frequency = <1000000>;
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
 };
 
 &pinctrl {
-- 
2.39.2



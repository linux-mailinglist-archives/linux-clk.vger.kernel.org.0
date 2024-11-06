Return-Path: <linux-clk+bounces-14295-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AC9BE69F
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 13:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C55E2804D1
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 12:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C96E1E0E09;
	Wed,  6 Nov 2024 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qpWnTctF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7ED1E04B2
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894504; cv=none; b=Y+CRV9ccxog2UQw/w/+z94yFKfuyo6HFiPojMB749e4tinnR9H954hgn6+Bu0bwNRP75Acd70LcDF7LhBgVTLGJswG1jteVE3JwFS5lv7mE8muEEQMsQvDcX8uJyrYOtqn3o5D9zGl/ljNrepDP/YurZNRrzOcwHxiHLVW7Zt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894504; c=relaxed/simple;
	bh=0jeuRPiyyg5MoDwyj3mqnXFmNpzYM4erd+w9ZG5JZZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vD8KjAjvxfz1fx5/YINLLAXAF25eZ6B2E3n5I5AO947tUCospb+hGzJNJjil+byX0sz+czK2N966HfMiXZQMEQDjitqTlTlvj8ufPAj28QH06HosKfKOOe8MiuMZ7pR2wXiVXXrTmhS4J0lOfbrkrcasdghwROJAoAc5H3WHn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qpWnTctF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso4714605a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730894499; x=1731499299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dfLgZ6EMGgbdpUoSorvdjE4ZEjo6VB1d0vruAXMU0w=;
        b=qpWnTctF5wvCzT0722KLgyuUhc6TdFZu5dl6nzs6yx4xxd8xwjz9erxqPA/YahdoR8
         JglWxmnv4ZOqP811cWjY1Kn/N7a/TP4Iw6HoeG1wxYhZJd2Axn6t0gvww1GJg6MZ8P4L
         xNxnM/K5vsdjGNxgAzNqRt74mZv2KzMK5hqZKWA3ACih9pnJ0lGcm8diY3RhG9FtLvI/
         y/SyjpuJX56ygtcZ+ke/wMRN1JP+NDmrz5MiJ8BNq1vNpdqDBVlcjaNacOHqOu5D++sg
         mVmbTrmwqQviA2HPJvXJgAPBfNbuRIGU+BQcvkIj+HyhRKGRdkS+CGKoN5ZwUY8Lvk+0
         3+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894499; x=1731499299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dfLgZ6EMGgbdpUoSorvdjE4ZEjo6VB1d0vruAXMU0w=;
        b=Y3TCo8J0Z7N2qcDwBokjoXeaEHJUUqrkagmxv3E5jPOosO9qsOrPv4vOFPUOg6HMem
         N4uv+RwBKH5SpznJhi7uqArIjnM5KYv5mEwKhaPwMCUWWS98wAZlMQsJc2AKriBO312k
         klNwJnRuFK5YslWWdIkP2RUJVmZM9MmC1OAi0NWRlq9hMsNC42Fi2snjLLpeEzTZEdO0
         aa0Jg67F1f2FdyBl5xnUPUPAcJeoP0KIbTAHjA31VRujM3OBxAGi8hEZbHCr2f1SrjO4
         h3EFOi2F9kxP0VegtZydtbwDQz4lf1ujktBjTcyi53xavnZmY2qpy+doBuBqW5tEoNkT
         W7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftC1JslXXhvZDkLu19pNZ5TDAWOQaFqtyZl78e7y1JlLCYufD6yHzM/vJlOVCNRMlmv0NDXSA/rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4Yu23jAHfwuYEuoxRMZ49iQnTwLRWNJ03LwH2/aAATy5Xn3H
	SsadrTuc6fBwOhYMegtizbSritwCsrUCamu65v+IE4lTEesMg6NNUrP2jdqNB3c=
X-Google-Smtp-Source: AGHT+IEj8QQdYUS9iAJlLLKfU0ogFglwclPszCya71IFXAUQsoN0hO3T3mJeIbY3qcMSrfrfaYLezg==
X-Received: by 2002:a05:6402:50cb:b0:5ce:d1b2:efc2 with SMTP id 4fb4d7f45d1cf-5ced1b2f1bcmr9628388a12.3.1730894499493;
        Wed, 06 Nov 2024 04:01:39 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe528sm2697984a12.55.2024.11.06.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:01:39 -0800 (PST)
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
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/9] arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
Date: Wed,  6 Nov 2024 14:01:14 +0200
Message-Id: <20241106120118.1719888-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC has 6 SCIF interfaces. SCIF0 is used as debug
console. Add the remaining ones.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index be8a0a768c65..5b15ff2482ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -73,6 +73,96 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		scif1: serial@1004bc00 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004bc00 0 0x400>;
+			interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G045_SCIF1_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_SCIF1_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif2: serial@1004c000 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c000 0 0x400>;
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G045_SCIF2_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_SCIF2_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif3: serial@1004c400 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c400 0 0x400>;
+			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G045_SCIF3_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_SCIF3_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif4: serial@1004c800 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c800 0 0x400>;
+			interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G045_SCIF4_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_SCIF4_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif5: serial@1004e000 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004e000 0 0x400>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G045_SCIF5_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_SCIF5_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
 		rtc: rtc@1004ec00 {
 			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x1004ec00 0 0x400>;
-- 
2.39.2



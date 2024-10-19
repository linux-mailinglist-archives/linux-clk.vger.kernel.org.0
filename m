Return-Path: <linux-clk+bounces-13410-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79049A4C4E
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 10:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5911C21A65
	for <lists+linux-clk@lfdr.de>; Sat, 19 Oct 2024 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4331E0DB7;
	Sat, 19 Oct 2024 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZYs2wCD9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562221E0B6B
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327690; cv=none; b=R7itfTVv71jC/3vWsk66SDvuxwEtyhIj7lz97xbWVa6CtF1EqR1n52+ez+SxDrhvE7V+Uiwnqy937yxgB1RORNzzLem7A0tD17NiW35MKsO7f/t52Ib5nYXvYVrrGI18T1EC33SeUWnYzkI3QR6gI7J2PMlisi8OBpyQFWat/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327690; c=relaxed/simple;
	bh=7mbQShJcFfpZtsV/0O0X70LuaZZJCjkF9SKuyahgYN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFz6G3aMwnyne2wc+zHQKR+EI+Q6nh8G3BEwyecgoRZZOP3ZOuvd/bwXAB4Oc8A+4QmRDtn02sVDpGUWsQ/i8gCptgS7E+J4HkMpyzkmA29f0uMuxfK748m54PyBgwBO2pFU30iLPC8MHfEeqz1b8/MUZXgrlRcJJmAsyLJG8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZYs2wCD9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so2134310f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327685; x=1729932485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n76uaOc9JNK30gqBdGs/PkLGDzcsWgIHozNG9uixX7Y=;
        b=ZYs2wCD91F5zDk3THtLqKIm6kGVt5+cYYKijkacAKsZiHLFb8ghPItFZsXDz4hHtoG
         ISgPYpsMuYWxFAR4CuuL84RiXmlfESs5qtT5hXrF8yDTLZiHjJwmz7daOYCGGdRXSkow
         PDk1gUB7ibPPkxKa+0SvdO7h1DfINN7zP0mPRSTzrX5pNDjVJ+1SPUBVX/ugqYRdOT0n
         pcUwD+Bb9nXFYR2y6jhXyPXw+mxUpM2Jyy42uTTJtQGOfnp8hc0zGz9tX6wYVjRv9UBm
         ZVmNMlslYjR6q+hST0ESNEzkNpOKhCteYWvha5DEZs5ZB6XRu3vycgacYWuiJtH1rgL1
         Z6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327685; x=1729932485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n76uaOc9JNK30gqBdGs/PkLGDzcsWgIHozNG9uixX7Y=;
        b=skfpUDGBJmiveCL2Qfouwh+CUYZ7eZ2jlFzX7Dd+wfXqhrgsAl/8MVskICOuunt0HP
         mLiZwI5j081Kbe3pHPPjSJVRYxCDFpOdtTbyRKUnYopZTo8qQlMCBpTxPeU0516iqS1k
         Kd+6vYKMBrU1+VB1WXGSszjRf031ESzILwtcihqTW/93nBXgV6pPaetOUR5ibrV1l90k
         9RyCXEOIjTN0dAQKKkcOaZ2ytjwv151ky2SHMcVIaWAK012g3nx7komvCWorxnDssm05
         1UeyS0W5qRXXJd7HR4E6ES6l+LBAh3EZjS0/vKx/Uy+evEVJogwki7HIV78jzSM3gIDW
         G9gw==
X-Forwarded-Encrypted: i=1; AJvYcCU9/32MnBt1wSPHTlq6cU3XK4NePMRSH3KSMfAQ+GBj5dLBHtAcF5BgPYYuIw8iYKoFVq0ppzDZI90=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpmrg7PfFXmi1HMvGgx26l+muzXIjwS6LXgj0w9qzQyAmlbbog
	Ej6/hjsPQ2LdJ4icGwB25WNn95AnEsRp1tgWH0yzVor4rG8QmGoke8HwhwcFzyY=
X-Google-Smtp-Source: AGHT+IEEpZiPiPfOC3M+a4OKPRdnozREuAvkhWiKYBAZoC4J0fDI95R1gsDCMYp599YKfb8ArETdfQ==
X-Received: by 2002:a5d:67cc:0:b0:37d:4cd6:6f2b with SMTP id ffacd0b85a97d-37eab6ec97cmr3930148f8f.14.1729327684650;
        Sat, 19 Oct 2024 01:48:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:04 -0700 (PDT)
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
Subject: [PATCH v4 08/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Sat, 19 Oct 2024 11:47:34 +0300
Message-Id: <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
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

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..827db9f61802 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,12 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
 };
-- 
2.39.2



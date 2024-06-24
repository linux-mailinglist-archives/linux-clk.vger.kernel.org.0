Return-Path: <linux-clk+bounces-8512-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8F914061
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 04:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 534C0B2096A
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 02:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453EC15E83;
	Mon, 24 Jun 2024 02:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="XWNcKc/V"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823214A2D
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195352; cv=none; b=l1k6hDm/aeLqgKFOBSD2y/P4+QJYIMrr4mQC5jjkiAbASVp4kddDaWvs6WENTYf58dzz6dDXzl2IlsXY+SkAbPAB/J0BdyxaW2C+UCHZWh8MnIt2p0G9HZtxsZ4uWB8jiAXVbuDwyhoajdBXY/9t8zjb3dZri9KSOXoqOpzQr08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195352; c=relaxed/simple;
	bh=CJyRU2euk+h8MQ3uF4akWb8lHgrUYTVPRvEJzPNHbOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GksamBEZ0KyvECwpf9+wagjOoN3j1wcEtzW9g0W450SpOvShBtnM46pPjLwEHNgLf5ecYgCjOUYCSSgq2k327jlJ0B30uhub/fNwk9gY4O2HGmPB08+bWpsss8hoeRbjKpyUH0e2wSj8daEZoYdh4jK8l9ehGlzGoFcOUO6LlH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=XWNcKc/V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7067cac6d6bso483035b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195350; x=1719800150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tH6rWt87YBXaBxQCAVQ+Z5WC/hDEvaUvyKWsHR45ns=;
        b=XWNcKc/VfnWLeA0N38TkS4fBTAZx8B74AoiEkTGubhpYz2HWFQw+9nWysBc3Uo6KtE
         hyH7bOxue1DY6uL0VKKBdJD8rZRZyj8Lke1A1zSuzCw5gUwYoEbGyXsavEMXk1VAx8TV
         zPv+iQgJwtgQASfJN01tV1/Kv5XPPmmGmdBRFB8LoaqVfjB1Qw9ErBXvtK0uy3JZfDu3
         x/tlykYfPEb3Za3p24RD/qfn/3nOUyUjE365IPTKQGoU8BWoXoAmkPsIBmgGlJhF6l8V
         5wdFJKEe4pK3jlgKDCkDiMIL5zUGoEj0axxowazYMyHp89hlbkLSjcdOJetB4BNjhpQI
         PntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195350; x=1719800150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tH6rWt87YBXaBxQCAVQ+Z5WC/hDEvaUvyKWsHR45ns=;
        b=G5dHm+3pITXNeuKcN0ds45ceSjzvqm68j0OI56gFU+Qc+e7FLddj3r6b50hZ8PW24K
         rCbC+PD4V2ReHXYoU8+U5Ock6CZlHSakFXC2ZB7nDxEzkxo24dNel6Hqi4vjgpDTm9rq
         cvvoPrMavHz7UT9FHXAWzuuEuEVBysiwc59RNDebj16Oy3Y/a5E0mpSiWAHu9N8mJIK0
         8k46atLkYIj4q7WDmJLhNjcyTgbnXLtXwmDjS2bS0OEXEGPGQoDgX2xaZM/26QBKZjaA
         xH6lWJMpn2+kEtYKqdkSoHJgiq+jpylklVRZzIei8fj3xZRWefLxLD6m6kjUI571K/BW
         RL7g==
X-Forwarded-Encrypted: i=1; AJvYcCXJN4C6NZGjamunbsPHiI68K+d0xiW4uxGrSEBreunIUMay8tGobzmAsdQSl/Jgy9yeNL0pH3yDt3r8xPII/oC9eyQvrjwVCrj1
X-Gm-Message-State: AOJu0YxuvIJAQPFC/2aiAe89pHCjmipGRo+LiWVK6UQ/Ut92ULbjiFfQ
	K5YtGC7HrtmOoL57e6Uhkn+jULDy930El02Pfy8ZqkJw6sUywQFeGaazyxEzv94ZP09tdY5Dp1p
	g
X-Google-Smtp-Source: AGHT+IEUJLdlkhMcqrUxWGpGRoomP5WHV8JsDb9iG6LQ+cz+fofSU7fQMeosaMpMZ24408AuC/xRzQ==
X-Received: by 2002:aa7:8a10:0:b0:706:6af8:e081 with SMTP id d2e1a72fcca58-70674548c80mr3226939b3a.1.1719195349715;
        Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:36 -0700
Subject: [PATCH v2 6/7] riscv: dts: thead: update TH1520 dma and timer
 nodes to use clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-th1520-clk-v2-6-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=4851;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=CJyRU2euk+h8MQ3uF4akWb8lHgrUYTVPRvEJzPNHbOU=;
 b=mNsn8JF4kFtRIlgga/Xmq9+3MshgDGyu9OUR6HpWzEdWNOwPQV05o7B8GmUXs3Dk7ZQ2mNxJi
 2BPyOgkY7t/CJRA4WBk2A5H8jQn9JkuBsh1SoYfj6/gWb5uq9Mn+hF0
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Change the dma-controller and timer nodes to use the APB clock provided
by the AP_SUBSYS clock controller.

Remove apb_clk reference from BeagleV Ahead and LPI4a dts.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 ++++++++--------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 55f1ed0cb433..1180e41c7b07 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -44,10 +44,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 762eceb415f8..78977bdbbe3d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,10 +25,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce3a0847aa9c..d05002ad7c96 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -135,12 +135,6 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
-	apb_clk: apb-clk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "apb_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -325,7 +319,7 @@ dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
 			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>, <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>, <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
 			dma-channels = <4>;
@@ -340,7 +334,7 @@ dmac0: dma-controller@ffefc00000 {
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -349,7 +343,7 @@ timer0: timer@ffefc32000 {
 		timer1: timer@ffefc32014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -358,7 +352,7 @@ timer1: timer@ffefc32014 {
 		timer2: timer@ffefc32028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -367,7 +361,7 @@ timer2: timer@ffefc32028 {
 		timer3: timer@ffefc3203c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc3203c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -398,7 +392,7 @@ uart5: serial@fff7f0c000 {
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -407,7 +401,7 @@ timer4: timer@ffffc33000 {
 		timer5: timer@ffffc33014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -416,7 +410,7 @@ timer5: timer@ffffc33014 {
 		timer6: timer@ffffc33028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -425,7 +419,7 @@ timer6: timer@ffffc33028 {
 		timer7: timer@ffffc3303c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc3303c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";

-- 
2.34.1



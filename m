Return-Path: <linux-clk+bounces-6760-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 526408BDA6B
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 06:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACEB62814AE
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 04:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6044C73539;
	Tue,  7 May 2024 04:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="f+T8K9QX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C06BFAA
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715057860; cv=none; b=mrLdSHMpwPyGju02qxPOE/hOPAGBDQpXbN8HbJFOFXIhbPT/eltuRL8FxB8YlH/C06cv0phVY2ZtzvU/EBcwUqsfdYrlewbjoUZs/6lX/W7/F2NUwKsgTJRwEQaJZd3ATZpsJ+AI9YYw9AHGX4+2vKC8lfXsqVVnUeoDydL6C04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715057860; c=relaxed/simple;
	bh=uoSZcE5Xsilp2h5kGfeS4a/3IqaGYxAdmgKgnxrBUNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIuXlawQFfr9sw7TxSqgnVldDklosMOANyps4CweWgUSf8LUTCcN+2uV9oJZgi7sARaDDESFjp3+/tHmxCPA1CkTaxgobuZzyjfRT8Y7LWx4alG9F+GbyuqnRsMuHGa94NrPnWWZx4H9reaRq+9EpxrNOOZzlXG3cqRl4MaEJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=f+T8K9QX; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6f0442816e7so1159383a34.2
        for <linux-clk@vger.kernel.org>; Mon, 06 May 2024 21:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057857; x=1715662657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2lHWLueNqka2AOPVIme5EVkkFZiGfvJi+3KgwWaTVY=;
        b=f+T8K9QXa+YaVglHch31/iPrzzedmDT1m01HWO2oUMALlURQz2kvCuFhg4FzizbsxS
         ryZlWVaBm+DoCajCWJ4Lrdfplg3JgN8swDJS/mCRV6EIvcn4SW8bg30aRl2K3LSL719M
         0Im6kMAhvzuSiJYq2hDc7g6zgmTN03T7jsnKGiMl7vp94u5WfcX9ciettnTCzyy0g+o1
         Sqs9TjZNPEZCpDmT9xRR6a/OpiQfUAeI6wdwEejGUeA2AzxVW+LM57tO1Y8g2j6HhEVg
         zVBjQY8tBB29C+vWHXBJKLx9p3LmTFjTWZDR1pdw7M2YY+kE226lP+UslHwMD32TnBTh
         Rk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057857; x=1715662657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2lHWLueNqka2AOPVIme5EVkkFZiGfvJi+3KgwWaTVY=;
        b=LNGBvpWTAywsRPkjUX8w3S3hEl1UF7boPx2bkMV+u9PDnmoSWVgrk8fsSxVB5hql6P
         2YZ5uSpYzfV0SX0EjB5aUr9DN5FpZSPJk//e+QJLouGjxgg9Ysu4N6/qzdlrrMshD57k
         IYvbJhJJk4rgSvX1sVUqKa0TQlfiBpKBKkzoqyuhZytQmRLb0Rqurgi2cAWhZMzftT7M
         CR4LdGKu8g8169jcY8lD1nk049xXW7qX6bmWOynKkHlW/fTe4U9vXoswLDgw/xfz5klA
         KnIgtTjOqdkNEv/cUdgOvTnp0sVoIWmMMK82Lg3MVMfy6du00unPKH4SlfJ+dCAYcxWK
         J/jA==
X-Forwarded-Encrypted: i=1; AJvYcCXHRsw2UWm4dYknaRQMbtFsM3134ejKp63XVX+UT4O5Er+dZQVdp4kC06Y0hQHvjCN5L/y2DtJk76U+Ad3xochNBv7O8ITxLMIY
X-Gm-Message-State: AOJu0Yy+UlRzJqFA6I2oLJl1x1mGsZ7SslHVPfR/4BlwI5wBJyPJPK7+
	X14YOOaf7+9LHUVuXHuXH7qLcprotc5VdDRdlibZSvv7OM9tOmRSDZA3Xpq29ZA=
X-Google-Smtp-Source: AGHT+IHeM+LZlAASDgAgZoJYi6IfqhYsJvdtMF0w6gMHjoszi7FeDpQTCR5RBlOwPb4z0zSfsEZQvQ==
X-Received: by 2002:a9d:66c3:0:b0:6ef:9159:8915 with SMTP id t3-20020a9d66c3000000b006ef91598915mr13321544otm.37.1715057857495;
        Mon, 06 May 2024 21:57:37 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:37 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 06 May 2024 21:55:20 -0700
Subject: [PATCH RFC v3 7/7] riscv: dts: thead: update TH1520 dma and timer
 nodes to use clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-th1520-clk-v3-7-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
In-Reply-To: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=4851;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=uoSZcE5Xsilp2h5kGfeS4a/3IqaGYxAdmgKgnxrBUNU=;
 b=BifQO2sCcHe9fBTRk7kaehpgYjaAujHk0VCVti7HuFvmS4vxrzgImnYMt0/hjY1s2xpIUoVAI
 3VNZYMYtEGwCH+FsfP6I8l3tUiDWT1Vg/QZawgOwqZNahnDphwqvTET
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
index cf2141c3976f..34bd58b45baa 100644
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
@@ -326,7 +320,7 @@ dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
 			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>, <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>, <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
 			dma-channels = <4>;
@@ -341,7 +335,7 @@ dmac0: dma-controller@ffefc00000 {
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -350,7 +344,7 @@ timer0: timer@ffefc32000 {
 		timer1: timer@ffefc32014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -359,7 +353,7 @@ timer1: timer@ffefc32014 {
 		timer2: timer@ffefc32028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -368,7 +362,7 @@ timer2: timer@ffefc32028 {
 		timer3: timer@ffefc3203c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc3203c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -399,7 +393,7 @@ uart5: serial@fff7f0c000 {
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -408,7 +402,7 @@ timer4: timer@ffffc33000 {
 		timer5: timer@ffffc33014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -417,7 +411,7 @@ timer5: timer@ffffc33014 {
 		timer6: timer@ffffc33028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -426,7 +420,7 @@ timer6: timer@ffffc33028 {
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



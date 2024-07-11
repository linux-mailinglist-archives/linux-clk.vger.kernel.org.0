Return-Path: <linux-clk+bounces-9512-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C392ED42
	for <lists+linux-clk@lfdr.de>; Thu, 11 Jul 2024 18:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E411C20F06
	for <lists+linux-clk@lfdr.de>; Thu, 11 Jul 2024 16:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A45716EB5F;
	Thu, 11 Jul 2024 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WM3vqhHK"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75016EB48
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716997; cv=none; b=Y9ovsgwG0Av5pFUZtk+ov+8oDswiJbTDT2qbov2kXnrBzXgoAXnVjYOUBSDvHvsgxQMGknp4xbmJstsvOqNkR5q3OQoFiLPmJMlscukyQW+y5AQrYBfAROuRRCG3a7S3JHwqlxzcje24fMjRcrA+tqwp/dBEwIiuMCuccyp8Qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716997; c=relaxed/simple;
	bh=tRjLHNA3SUuyjwpgTudoab8pZI9wG5YkzGm3OgGpM00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZ4q4PfTAuwiPAzvxyziSZ/4dqYd3k9c7DlFhiF8u2An0PXRiyX150OIiyZTboFNmqZCUkPWsK5uCQsQ83wpsVsC5f1Ugeocxe1Bs8ALBnKMLV5qGgPMOIIhEDkPvu6MmVkp8/4YNhBNyP0cFsV0L2BHLIvYZ4s68+3OriPthLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WM3vqhHK; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-382458be75bso4590005ab.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716995; x=1721321795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=te6oCpGS/6VZhMCuPEflrqjqzTzldtZxzFsSrDrIRSM=;
        b=WM3vqhHKHHzLTfrUpFRYflHQ+fRw7rXGRY/SdRFvqgkgrcE6hhAmeROmQtlvQ4QmVU
         RgZx2/DtVLwOGxoFNoLYCxwPE7gKWwUJOxnvQEaHwYeoQdyzvuxv3hLUyyUcDDELd9lo
         Q1ojke64PaITxvEdc8xq4Z5IX7YW0B3eRBqgLW5vxxzP7KDLMnc0EBk2Qcsq3iSRonJ1
         z4i3jqNWkKM2SdLjsVTAbSkm4325r1y7Hr3zRpUoJAj3wBlR8Q8n8mE8LiwRxC9nuKI+
         7n9YyJNSXxMArgCcyW44snDuUeMqGiqslwDdG1CgsvT4hu6bdch3xt+fo351Dj5S+PZb
         9i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716995; x=1721321795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te6oCpGS/6VZhMCuPEflrqjqzTzldtZxzFsSrDrIRSM=;
        b=OgwrCxceC1/gXOk6jIqTfL4Zeo9ktK+F7WSc7wHtgnrkCsJ4tHYgtpUxvnkhrlnTrl
         idL2Dtev0Si1OmrXzjorrNbngMnKox7ING9DMf4p8oNqVmLbYoSgxDEmsAUlxTmd70AA
         ststT6glAjqTKLdbjteT0F4QcIBTbz7asgdbIlHMK9i10n9NhnN23py8RLlMDDBJUohF
         1M1hFW1q5pk+HkB9snKmNDcobWUab9kvWlDM3u/JnlBFqN/6uo+12rpXkQQ+CBcX0zQ3
         NmPgDxzJOlrbgEyHcmVLjhbycYsyyKNgghcUWgKc3j3Xe5y6LdhSqhbWTYCDVnVza0xK
         fHyA==
X-Forwarded-Encrypted: i=1; AJvYcCVIhlInlvbPSenU86URl4O3Wh4p7xcdvF3zBOj6xiadZaKoQA5lMS5KjNMRMoHrsTmj/JUBvFKyyoISA6WLkzp1ytWjRvJfZ4PT
X-Gm-Message-State: AOJu0YzVLBiLz6s7eVj7kTBD3A2YeStGZsACI7jP7mzIdHWJE33d2xfG
	G9vRd6sa9TWOUjbE22bl++IPrhjIeSzXZiDwNBUhUJmxflx/9WF42Xlu5TkfkE0=
X-Google-Smtp-Source: AGHT+IGzWPfDV/E3YcTV0DYpsGumkkg2HKME8gswI8MuO7enICuTRWBiTCWgxl87cgh3yZKPyv10Pw==
X-Received: by 2002:a05:6e02:1aa3:b0:374:a781:64b9 with SMTP id e9e14a558f8ab-38a581a844cmr111474085ab.13.1720716991215;
        Thu, 11 Jul 2024 09:56:31 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:30 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:23 -0700
Subject: [PATCH v3 5/7] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-th1520-clk-v3-5-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=2932;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=tRjLHNA3SUuyjwpgTudoab8pZI9wG5YkzGm3OgGpM00=;
 b=/J1Le/i2Ub7P3mFRDRhdpUD8z6RNIFe8SaZHadbyBrIr8iwcVW+MMA9ZwLU7NYkZQFxaufvA3
 4rYWM5YCrJ5AjZXjifm3Pum7SMOQhZ0ySfNAxPh953GcvtVzQG1jmgo
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Change the clock property in the TH1520 mmc controller nodes to a clock
provided by AP_SYS clock controller.

Remove sdhci fixed clock reference from BeagleV Ahead and LPI4a dts.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     |  4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 13 +++----------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 164afd18b56c..55f1ed0cb433 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,10 +48,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1b7ede570994..762eceb415f8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,10 +29,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 66df04ceb3e4..ce3a0847aa9c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,13 +141,6 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
-	sdhci_clk: sdhci-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "sdhci_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -200,7 +193,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -209,7 +202,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -218,7 +211,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.34.1



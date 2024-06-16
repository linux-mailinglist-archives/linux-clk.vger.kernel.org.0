Return-Path: <linux-clk+bounces-8097-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A2909B2C
	for <lists+linux-clk@lfdr.de>; Sun, 16 Jun 2024 03:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CF78B20C4E
	for <lists+linux-clk@lfdr.de>; Sun, 16 Jun 2024 01:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D21C16191A;
	Sun, 16 Jun 2024 01:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="IbcOJjIF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06551649D9
	for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2024 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718502926; cv=none; b=n6qgOMj8Zkf0C1Uj6zVOiMZ8NryRtBkw3vspqQIPGLVjCMuPxlRYec9CQXvPACKJ3N3TPNUvPq2fnXkZvwkcZTiXj45GUL2Aoj8R1W5vHHDq0WmTcB6mMThi8JAYKSyJTVZU+QLvl04++jZ/54ohSGS42K6GEe+iRC5Zdo3Y3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718502926; c=relaxed/simple;
	bh=aOj88rgDFr9OsXNqJrSMqZorSrYAxWXmKG05lo+T9jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hrxbh5pcGsktZFhYXjhGD72JT+MK3NG6BU/ruyF7z7/+EEzcbA+tuM4TaOvD/m4fjIFcSadxrzqajyoNFqqKbXzaM7anVtsYNONMVXF4B8YDLNqrexSQ1mQDBhTH1tfqWUApMpAGeCPqSopWRzRjwv7GqIwffMJzKzZHUocvMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=IbcOJjIF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-709423bc2e5so45834a12.0
        for <linux-clk@vger.kernel.org>; Sat, 15 Jun 2024 18:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718502924; x=1719107724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDYKB1w0bo2FQ2U8u3ozHVKFF/ufxd2dL8jVGoWI+BA=;
        b=IbcOJjIFGCN0rwyEUi6prm534wwSFT3RHvAkGbLc3ISA2gx6+X3Kecoi3G/pG+kpD3
         IDdsbndoY4x7dvDU/hncPTjjvVUojmyB+ui0Ak9CjSl/cItZFct6Vqid8UQubH5s/IcJ
         pIyKct8c9uKaCxJcibmUD95qI+cFUKgsHUtM5GVNRUZq/MfmPHd80OCpfPjbXrUid5w3
         BLLyrnUAWphUB6yy4R8zKd2AKJGeTukUinNor7+EvwbM9aMT+2ua1ZBG6DTWJUIHHhE4
         Ecm2VqEbBmZRtv0ol7ryTlg+dKCq295ZXz2GivVLwH4Uhro6cX7fpStDcWaHRFnc3mU/
         l6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718502924; x=1719107724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDYKB1w0bo2FQ2U8u3ozHVKFF/ufxd2dL8jVGoWI+BA=;
        b=icNGQ6ey39slEfUymUBFJAaVWolpsf6Mq0ucN3h5BfU/Om1L1X1l+NWrcU1DVXcWHK
         dYG2UjgmJjVDJUofT0bKcGUexa6325yzD7alDX1ymDhFyWtL9a0QekMWNxEfdgm2N+Cp
         GUKEdc1vpoglude8B8RfDJPNYeviq4ni4LGNuhZYL1wjFlEclWdx77H35UocrBF3Unr3
         kih/hvnGse5VehufoqYdy13lzrcPte5fjsXi2MWZv1GhRDZ4BbzRlXIqLETa7wTsnMgV
         YXWAh8ytQkDzAbq4PmMJdlnU3ztpcIYwyeFOYstYcylBOudJKSIxME+nv3Lt0Mcd4zPt
         HApQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3cGLKnHCuddUyyfbcn/bRKPzif/gBh4wv95r8tsqacUPryO1T62lOIuhexaBwIJ23mIijTsUWVkhUsjxgB6uVhrv/69WcsLfj
X-Gm-Message-State: AOJu0Yx8fMWrbTkVn2H897v39qSfnAhhe4VFJWZ1TZEnAS5H856j18kM
	ANAVkVtcmKmFuWcwZykOuG2wtePmkw5WI928SsXbzWnxtPLT7Kl01qaFNbeZsxI=
X-Google-Smtp-Source: AGHT+IG18IlaXbcvZxFz/RZ+ICHg8UHvP2Gwe9eELoWt80m/e4sEKPOrOsJQoQKIkdZ5LiR9EkLBzw==
X-Received: by 2002:a05:6a20:729d:b0:1ad:6c36:ee82 with SMTP id adf61e73a8af0-1bae7d85496mr8941088637.13.1718502924144;
        Sat, 15 Jun 2024 18:55:24 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1cea:28dd:2ee0:e8e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769aedbsm8751201a91.43.2024.06.15.18.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:55:23 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 15 Jun 2024 18:54:33 -0700
Subject: [PATCH 4/6] riscv: dts: thead: change TH1520 uart nodes to use
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240615-th1520-clk-v1-4-3ba4978c4d6b@tenstorrent.com>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
In-Reply-To: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
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
X-Mailer: b4 0.12.3

Change the clock property in TH1520 uart nodes to a clock provided by
AP_SUBSYS clock controller.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 +++++++++++-----------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..164afd18b56c 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,10 +52,6 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..1b7ede570994 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -33,10 +33,6 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 10a38ed55658..66df04ceb3e4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,12 +141,6 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
-	uart_sclk: uart-sclk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "uart_sclk";
-		#clock-cells = <0>;
-	};
-
 	sdhci_clk: sdhci-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <198000000>;
@@ -195,7 +189,8 @@ uart0: serial@ffe7014000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7014000 0x0 0x100>;
 			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART0_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -232,7 +227,8 @@ uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
 			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART1_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -242,7 +238,8 @@ uart3: serial@ffe7f04000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f04000 0x0 0x100>;
 			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART3_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -324,7 +321,8 @@ uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
 			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART2_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -386,7 +384,8 @@ uart4: serial@fff7f08000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f08000 0x0 0x4000>;
 			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART4_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -396,7 +395,8 @@ uart5: serial@fff7f0c000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f0c000 0x0 0x4000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART5_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";

-- 
2.40.1



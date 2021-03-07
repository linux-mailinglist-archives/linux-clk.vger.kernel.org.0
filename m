Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38ED832FF66
	for <lists+linux-clk@lfdr.de>; Sun,  7 Mar 2021 08:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCGHFA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 7 Mar 2021 02:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhCGHEe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 Mar 2021 02:04:34 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA6DC06175F;
        Sat,  6 Mar 2021 23:04:34 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so1814815wmi.3;
        Sat, 06 Mar 2021 23:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Y7ZqJ7aphYkfKg9dEOtdy4V6nKSW7Mz/xYiwcmDq+A=;
        b=TxY5FAVv88lgQE2+LrnZ5LvGh4ZRLQCLkAgXJkl2SuuNdx/uKdRcD1NhyqZ/3a6BiP
         pC0D1tJQ1dKiCj2rdN09OY+d+dpt7X69l5Wzh0Pnp+6+WIwk83h8rvPgK5oz6fqJ5FgX
         K6FmwacK3V686yOe7CKDq6qHWU8tF2/8ruxxjXYh/i9IQCLL0OPTByGWvSMKFWcSsarx
         vUy6/ojES05vlnOa/wBRLUGIhzg3OuFnV76wUmEGA2iBqxA6r5SKxpglruQwcP0K34hl
         gEYjVJ66eUI5u8CQs2CSR8dabWMy4kDHdWFjK28+K2OY3P/CzWLq0LGxKuJZ6cgfo3EW
         OuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Y7ZqJ7aphYkfKg9dEOtdy4V6nKSW7Mz/xYiwcmDq+A=;
        b=H2k+gLnuXbzksGBllWHjwE5FcRz9wxllakRcnRzVyIDZvvO/B20UqAgkXTKD3obIvd
         ye0jUvg3NJy7ZuRkS/FBa2M6Zjn6ydOl6guxZlIWY+by690TS1B6LUGFZ8eZMU5pXtEe
         GNqZpwO7VOMBDoYcmrpQQF9KvgokoBLW1LczYFw9qHfCrVr/P7AjVP2hWp0uXoTl+lES
         P8zlr43/Q8sujAGNLJeeiwKq8/3BePiXEFpCQvelDJG4+Hf8DitF/5mFlXjtG6ovhoUK
         n3QC9tXjPC+8u6o49Y7ylV2HBAcln1/cRx6SXhLboAy0xS3R5/CeP222k23jEuoYLNZn
         0WpA==
X-Gm-Message-State: AOAM531Ec7f+5XoLE44SHLiBvPllqGKqQKovY7cBdNVHgCg/t7/kxMVr
        n9EbQPJbsx54dTFucXKOce8=
X-Google-Smtp-Source: ABdhPJz1kaIGwonywkkzFRP2nJuAjnyRm8GqZdH5T8yOm+CZpFPlNpGaZfiuI3/7n8lRPOLzDwzJXA==
X-Received: by 2002:a7b:cd81:: with SMTP id y1mr16711143wmj.51.1615100672861;
        Sat, 06 Mar 2021 23:04:32 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id j9sm12162533wmi.24.2021.03.06.23.04.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Mar 2021 23:04:32 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] staging: mt7621-dts: make use of new 'mt7621-clk'
Date:   Sun,  7 Mar 2021 08:04:24 +0100
Message-Id: <20210307070426.15933-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
References: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clocks for SoC mt7621 have been properly integrated so there is
no need to declare fixed clocks at all in the device tree. Remove
all of them, add new device tree nodes for mt7621-clk and update
the rest of the nodes to use them.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts   | 11 ----
 drivers/staging/mt7621-dts/mt7621.dtsi | 74 ++++++++++++--------------
 2 files changed, 33 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index a7c0d3115d72..7716d0efe524 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -100,17 +100,6 @@ partition@50000 {
 	};
 };
 
-&sysclock {
-			compatible = "fixed-clock";
-			/* This is normally 1/4 of cpuclock */
-			clock-frequency = <225000000>;
-};
-
-&cpuclock {
-			compatible = "fixed-clock";
-			clock-frequency = <900000000>;
-};
-
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..b68183e7e6ad 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,5 +1,6 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/mt7621-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -27,27 +28,6 @@ aliases {
 		serial0 = &uartlite;
 	};
 
-	cpuclock: cpuclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-
-		/* FIXME: there should be way to detect this */
-		clock-frequency = <880000000>;
-	};
-
-	sysclock: sysclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-
-		/* This is normally 1/4 of cpuclock */
-		clock-frequency = <220000000>;
-	};
-
-	mmc_clock: mmc_clock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <48000000>;
-	};
 
 	mmc_fixed_3v3: fixedregulator@0 {
 		compatible = "regulator-fixed";
@@ -76,8 +56,13 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc";
+			compatible = "mtk,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			ralink,memctl = <&memc>;
+			clock-output-names = "xtal", "cpu", "bus",
+					     "50m", "125m", "150m",
+					     "250m", "270m";
 		};
 
 		wdt: wdt@100 {
@@ -101,8 +86,8 @@ i2c: i2c@900 {
 			compatible = "mediatek,mt7621-i2c";
 			reg = <0x900 0x100>;
 
-			clocks = <&sysclock>;
-
+			clocks = <&sysc MT7621_CLK_I2C>;
+			clock-names = "i2c";
 			resets = <&rstctrl 16>;
 			reset-names = "i2c";
 
@@ -119,8 +104,8 @@ i2s: i2s@a00 {
 			compatible = "mediatek,mt7621-i2s";
 			reg = <0xa00 0x100>;
 
-			clocks = <&sysclock>;
-
+			clocks = <&sysc MT7621_CLK_I2S>;
+			clock-names = "i2s";
 			resets = <&rstctrl 17>;
 			reset-names = "i2s";
 
@@ -138,7 +123,7 @@ i2s: i2s@a00 {
 		};
 
 		memc: memc@5000 {
-			compatible = "mtk,mt7621-memc";
+			compatible = "mtk,mt7621-memc", "syscon";
 			reg = <0x5000 0x1000>;
 		};
 
@@ -156,8 +141,8 @@ uartlite: uartlite@c00 {
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
 
-			clocks = <&sysclock>;
-			clock-frequency = <50000000>;
+			clocks = <&sysc MT7621_CLK_UART1>;
+			clock-names = "uart1";
 
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -173,7 +158,8 @@ spi0: spi@b00 {
 			compatible = "ralink,mt7621-spi";
 			reg = <0xb00 0x100>;
 
-			clocks = <&sysclock>;
+			clocks = <&sysc MT7621_CLK_SPI>;
+			clock-names = "spi";
 
 			resets = <&rstctrl 18>;
 			reset-names = "spi";
@@ -189,6 +175,8 @@ gdma: gdma@2800 {
 			compatible = "ralink,rt3883-gdma";
 			reg = <0x2800 0x800>;
 
+			clocks = <&sysc MT7621_CLK_GDMA>;
+			clock-names = "gdma";
 			resets = <&rstctrl 14>;
 			reset-names = "dma";
 
@@ -206,6 +194,8 @@ hsdma: hsdma@7000 {
 			compatible = "mediatek,mt7621-hsdma";
 			reg = <0x7000 0x1000>;
 
+			clocks = <&sysc MT7621_CLK_HSDMA>;
+			clock-names = "hsdma";
 			resets = <&rstctrl 5>;
 			reset-names = "hsdma";
 
@@ -311,11 +301,6 @@ rstctrl: rstctrl {
 		#reset-cells = <1>;
 	};
 
-	clkctrl: clkctrl {
-		compatible = "ralink,rt2880-clock";
-		#clock-cells = <1>;
-	};
-
 	sdhci: sdhci@1E130000 {
 		status = "disabled";
 
@@ -334,7 +319,8 @@ sdhci: sdhci@1E130000 {
 		pinctrl-0 = <&sdhci_pins>;
 		pinctrl-1 = <&sdhci_pins>;
 
-		clocks = <&mmc_clock &mmc_clock>;
+		clocks = <&sysc MT7621_CLK_SHXC>,
+			 <&sysc MT7621_CLK_50M>;
 		clock-names = "source", "hclk";
 
 		interrupt-parent = <&gic>;
@@ -349,7 +335,7 @@ xhci: xhci@1E1C0000 {
 		       0x1e1d0700 0x0100>;
 		reg-names = "mac", "ippc";
 
-		clocks = <&sysclock>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		clock-names = "sys_ck";
 
 		interrupt-parent = <&gic>;
@@ -368,7 +354,7 @@ gic: interrupt-controller@1fbc0000 {
 		timer {
 			compatible = "mti,gic-timer";
 			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-			clocks = <&cpuclock>;
+			clocks = <&sysc MT7621_CLK_CPU>;
 		};
 	};
 
@@ -381,6 +367,9 @@ nand: nand@1e003000 {
 			0x1e003800 0x800>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+
+		clocks = <&sysc MT7621_CLK_NAND>;
+		clock-names = "nand";
 	};
 
 	ethsys: syscon@1e000000 {
@@ -394,8 +383,9 @@ ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
 
-		clocks = <&sysclock>;
-		clock-names = "ethif";
+		clocks = <&sysc MT7621_CLK_FE>,
+			 <&sysc MT7621_CLK_ETH>;
+		clock-names = "fe", "ethif";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -521,7 +511,9 @@ GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH
 
 		resets = <&rstctrl 24 &rstctrl 25 &rstctrl 26>;
 		reset-names = "pcie0", "pcie1", "pcie2";
-		clocks = <&clkctrl 24 &clkctrl 25 &clkctrl 26>;
+		clocks = <&sysc MT7621_CLK_PCIE0>,
+			 <&sysc MT7621_CLK_PCIE1>,
+			 <&sysc MT7621_CLK_PCIE2>;
 		clock-names = "pcie0", "pcie1", "pcie2";
 		phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
 		phy-names = "pcie-phy0", "pcie-phy2";
-- 
2.25.1


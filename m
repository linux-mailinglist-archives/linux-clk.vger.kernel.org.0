Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA646FBEB0
	for <lists+linux-clk@lfdr.de>; Tue,  9 May 2023 07:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbjEIF2x (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 May 2023 01:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjEIF2o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 01:28:44 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92163AD3A;
        Mon,  8 May 2023 22:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683610113; x=1715146113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZjqOgyYB1rM9n+lVWekEwRaDSBNSqYRERlNV+iLbYn0=;
  b=dV3+xOCiyz+HmV8o/VEK03SlwiwY7Q77mS9pugABteWiKgvJPKiRV9zy
   2DSt23CuWfLEcf6QUuvMInU1uBnYH2kOqbYbn9cefgpiyJQE5yTU23qOF
   XAAA5Mf88vZoLd7b/5g6c5clD/8eP7i0x0iAVO2mnPQfxydJrAQj3Z5rg
   WIN2jtqM0/kS+mTbfNuueXMZkgziYgXMCHdcMzvX7savQMNwdhN0x7Dly
   jQhA8zMz2rw4ErKIrFvme74UvP45XiTv1hd2OTZBJU1HeZ6YNDvxp/5tQ
   uM8AxI5ZuhAHo+UPFyRjR3RCQ8C6QwFZLH4XzWDGlAMBZBgVvmQvgOlq0
   w==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677567600"; 
   d="scan'208";a="212510227"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 22:28:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 22:28:32 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 8 May 2023 22:28:27 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 4/5] ARM: dts: at91: use clock-controller name for sckc nodes
Date:   Tue, 9 May 2023 08:27:56 +0300
Message-ID: <20230509052757.539274-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509052757.539274-1-claudiu.beznea@microchip.com>
References: <20230509052757.539274-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use clock-controller generic name for slow clock controller nodes.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91sam9g45.dtsi | 2 +-
 arch/arm/boot/dts/at91sam9rl.dtsi  | 2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi  | 2 +-
 arch/arm/boot/dts/sam9x60.dtsi     | 2 +-
 arch/arm/boot/dts/sama5d2.dtsi     | 2 +-
 arch/arm/boot/dts/sama5d3.dtsi     | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index 76afeb31b7f5..498cb92b29f9 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -923,7 +923,7 @@ usb2: gadget@fff78000 {
 				status = "disabled";
 			};
 
-			clk32k: sckc@fffffd50 {
+			clk32k: clock-controller@fffffd50 {
 				compatible = "atmel,at91sam9x5-sckc";
 				reg = <0xfffffd50 0x4>;
 				clocks = <&slow_xtal>;
diff --git a/arch/arm/boot/dts/at91sam9rl.dtsi b/arch/arm/boot/dts/at91sam9rl.dtsi
index a12e6c419fe3..d7e8a115c916 100644
--- a/arch/arm/boot/dts/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/at91sam9rl.dtsi
@@ -799,7 +799,7 @@ watchdog@fffffd40 {
 				status = "disabled";
 			};
 
-			clk32k: sckc@fffffd50 {
+			clk32k: clock-controller@fffffd50 {
 				compatible = "atmel,at91sam9x5-sckc";
 				reg = <0xfffffd50 0x4>;
 				clocks = <&slow_xtal>;
diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index af19ef2a875c..0123ee47151c 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -154,7 +154,7 @@ pit: timer@fffffe30 {
 				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
 			};
 
-			clk32k: sckc@fffffe50 {
+			clk32k: clock-controller@fffffe50 {
 				compatible = "atmel,at91sam9x5-sckc";
 				reg = <0xfffffe50 0x4>;
 				clocks = <&slow_xtal>;
diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index 6f5177df01bc..933d73505a8b 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -700,7 +700,7 @@ pit: timer@fffffe40 {
 				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
 			};
 
-			clk32k: sckc@fffffe50 {
+			clk32k: clock-controller@fffffe50 {
 				compatible = "microchip,sam9x60-sckc";
 				reg = <0xfffffe50 0x4>;
 				clocks = <&slow_xtal>;
diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 86009dd28e62..5f632e3f039e 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -704,7 +704,7 @@ watchdog: watchdog@f8048040 {
 				status = "disabled";
 			};
 
-			clk32k: sckc@f8048050 {
+			clk32k: clock-controller@f8048050 {
 				compatible = "atmel,sama5d4-sckc";
 				reg = <0xf8048050 0x4>;
 
diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 4524a16322d1..0eebf6c760b3 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1040,7 +1040,7 @@ watchdog: watchdog@fffffe40 {
 				status = "disabled";
 			};
 
-			clk32k: sckc@fffffe50 {
+			clk32k: clock-controller@fffffe50 {
 				compatible = "atmel,sama5d3-sckc";
 				reg = <0xfffffe50 0x4>;
 				clocks = <&slow_xtal>;
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index e94f3a661f4b..de6c82969232 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -761,7 +761,7 @@ watchdog: watchdog@fc068640 {
 				status = "disabled";
 			};
 
-			clk32k: sckc@fc068650 {
+			clk32k: clock-controller@fc068650 {
 				compatible = "atmel,sama5d4-sckc";
 				reg = <0xfc068650 0x4>;
 				#clock-cells = <0>;
-- 
2.34.1


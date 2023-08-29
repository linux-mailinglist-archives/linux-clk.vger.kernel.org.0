Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DD578CAD9
	for <lists+linux-clk@lfdr.de>; Tue, 29 Aug 2023 19:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbjH2RSt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Aug 2023 13:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbjH2RSR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:18:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB326CEC;
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bcfdadd149so54052331fa.0;
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329459; x=1693934259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74P/6Br6bogbgmaiGn5e0BgB+brvJwEnEsNrYu1BRuY=;
        b=k1j3YWSEaY1ji0H1JjGXGUDrGz6YTCv87XFQy936F/6iUUDyQH/QsEFXoCstDqqMa/
         N7p/VhVsHJZFkPaUT+GzcWlrTTB+zrlktpG9lCHGgZlMbbeGfzpXzPLYY3pIfyRFyTez
         IKe3ppnv7eNUMMHB1EvgrwwoTPQWrTft3FWOn0fcQQ1u6uW3+xRV2hlv7OmzSl7GSZIS
         Sbo1mOA0BPjfmfclIYj4rcGiGiDiwidvKG5g5D04KTLcG2g7LuXTth+a8t8NTTJMNDdl
         5QXncyi5L8fs0wyOVYd0EZzi0GB0y/4XSPLVeZURiqPUNdLD6p/RyzLXhB6ur8RL2LG8
         IG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329459; x=1693934259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74P/6Br6bogbgmaiGn5e0BgB+brvJwEnEsNrYu1BRuY=;
        b=NFjNKn+E23Dxh6+xTId9rctiZnapRmJsZWMjzkkiKbcSI5RvbMvgzQQOayQESkIYXm
         2oZdwxqGzXi5+p1cdrNR9gO+Q2ZYC7V3iJd8GDUvY1WWqMtyhtgJn0Cen8sTaeh6pfGq
         HFNV4J9vf7q+8l3/KhIlSK4qapAU1pprgEqWgPHpuI+t5jEA5H/B5Hs8Q8QPkaTqb7vU
         ZYPaPLONWF0/12fgn108Qj1yCeVi48TK/2mvF5tS8J+i1gIhEYwypLTvFg2gOHXtg6pD
         IepildHdthiLvF04oP+isuM707gjkoTbNNouZ7OfXCCJtCBKpTkKNhFqMiT8vDWlPaGA
         pFtw==
X-Gm-Message-State: AOJu0Yz078yriLHPFsJ1MPB0LpagO7+DZzQ0G4WIEGVfnMijz92FKG9a
        4q3y+3RZ/hJCrX9mcYw58g==
X-Google-Smtp-Source: AGHT+IF30rv56stoUeBbE9X042wMDl8kUJ1tGmSo4Geb7tbGbVGMXZgTS0Bn7SLaTS4hY3fvb7aKvw==
X-Received: by 2002:a05:651c:107b:b0:2bc:ffcd:8556 with SMTP id y27-20020a05651c107b00b002bcffcd8556mr6342570ljm.12.1693329459264;
        Tue, 29 Aug 2023 10:17:39 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:38 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
        Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 15/31] ARM: dts: rockchip: Split RK3128 devictree for RK312x SoC family
Date:   Tue, 29 Aug 2023 19:16:31 +0200
Message-ID: <20230829171647.187787-16-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently there is only a SoC devicetree for RK3128 although RK312x
SoC family consits of (at least) RK3126(C) and RK3128.

This splits up the currently existing rk3128.dtsi in rk312x.dtsi which
contains the common definitions for both SoCs and rk3128.dtsi, rk3126.dtsi
respectivly.

The differentiation between rk3126/rk3128 is already taken into account
in the clock driver and they have their own compatibles.
uart0 and i2c3 exist only in rk3128 SoC, thus they are moved to the new
rk3128.dtsi.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3126.dtsi |   9 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 894 +------------------------
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 893 ++++++++++++++++++++++++
 3 files changed, 909 insertions(+), 887 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3126.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk312x.dtsi

diff --git a/arch/arm/boot/dts/rockchip/rk3126.dtsi b/arch/arm/boot/dts/rockchip/rk3126.dtsi
new file mode 100644
index 000000000000..7345bd95d29d
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3126.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk312x.dtsi"
+
+/ {
+	compatible = "rockchip,rk3126";
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index f3f0788195d2..4c5c9728179e 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -1,360 +1,11 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2017 Rockchip Electronics Co., Ltd
- */
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 
-#include <dt-bindings/clock/rk3128-cru.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/pinctrl/rockchip.h>
+/dts-v1/;
+
+#include "rk312x.dtsi"
 
 / {
 	compatible = "rockchip,rk3128";
-	interrupt-parent = <&gic>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	arm-pmu {
-		compatible = "arm,cortex-a7-pmu";
-		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@f00 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a7";
-			reg = <0xf00>;
-			clock-latency = <40000>;
-			clocks = <&cru ARMCLK>;
-			operating-points = <
-				/* KHz    uV */
-				 816000 1000000
-			>;
-			#cooling-cells = <2>; /* min followed by max */
-		};
-
-		cpu1: cpu@f01 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a7";
-			reg = <0xf01>;
-		};
-
-		cpu2: cpu@f02 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a7";
-			reg = <0xf02>;
-		};
-
-		cpu3: cpu@f03 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a7";
-			reg = <0xf03>;
-		};
-	};
-
-	timer {
-		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
-		arm,cpu-registers-not-fw-configured;
-		clock-frequency = <24000000>;
-	};
-
-	xin24m: oscillator {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xin24m";
-		#clock-cells = <0>;
-	};
-
-	pmu: syscon@100a0000 {
-		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
-		reg = <0x100a0000 0x1000>;
-	};
-
-	gic: interrupt-controller@10139000 {
-		compatible = "arm,cortex-a7-gic";
-		reg = <0x10139000 0x1000>,
-		      <0x1013a000 0x1000>,
-		      <0x1013c000 0x2000>,
-		      <0x1013e000 0x2000>;
-		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		#address-cells = <0>;
-	};
-
-	usb_otg: usb@10180000 {
-		compatible = "rockchip,rk3128-usb", "rockchip,rk3066-usb", "snps,dwc2";
-		reg = <0x10180000 0x40000>;
-		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_OTG>;
-		clock-names = "otg";
-		dr_mode = "otg";
-		phys = <&usb2phy_otg>;
-		phy-names = "usb2-phy";
-		status = "disabled";
-	};
-
-	usb_host_ehci: usb@101c0000 {
-		compatible = "generic-ehci";
-		reg = <0x101c0000 0x20000>;
-		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-		phys = <&usb2phy_host>;
-		phy-names = "usb";
-		status = "disabled";
-	};
-
-	usb_host_ohci: usb@101e0000 {
-		compatible = "generic-ohci";
-		reg = <0x101e0000 0x20000>;
-		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-		phys = <&usb2phy_host>;
-		phy-names = "usb";
-		status = "disabled";
-	};
-
-	sdmmc: mmc@10214000 {
-		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
-		reg = <0x10214000 0x4000>;
-		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
-			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
-		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
-		dmas = <&pdma 10>;
-		dma-names = "rx-tx";
-		fifo-depth = <256>;
-		max-frequency = <150000000>;
-		resets = <&cru SRST_SDMMC>;
-		reset-names = "reset";
-		status = "disabled";
-	};
-
-	sdio: mmc@10218000 {
-		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
-		reg = <0x10218000 0x4000>;
-		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
-			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
-		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
-		dmas = <&pdma 11>;
-		dma-names = "rx-tx";
-		fifo-depth = <256>;
-		max-frequency = <150000000>;
-		resets = <&cru SRST_SDIO>;
-		reset-names = "reset";
-		status = "disabled";
-	};
-
-	emmc: mmc@1021c000 {
-		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
-		reg = <0x1021c000 0x4000>;
-		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
-			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
-		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
-		dmas = <&pdma 12>;
-		dma-names = "rx-tx";
-		fifo-depth = <256>;
-		max-frequency = <150000000>;
-		resets = <&cru SRST_EMMC>;
-		reset-names = "reset";
-		status = "disabled";
-	};
-
-	nfc: nand-controller@10500000 {
-		compatible = "rockchip,rk3128-nfc", "rockchip,rk2928-nfc";
-		reg = <0x10500000 0x4000>;
-		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
-		clock-names = "ahb", "nfc";
-		pinctrl-names = "default";
-		pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_cs0
-			     &flash_dqs &flash_rdn &flash_rdy &flash_wrn>;
-		status = "disabled";
-	};
-
-	cru: clock-controller@20000000 {
-		compatible = "rockchip,rk3128-cru";
-		reg = <0x20000000 0x1000>;
-		clocks = <&xin24m>;
-		clock-names = "xin24m";
-		rockchip,grf = <&grf>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		assigned-clocks = <&cru PLL_GPLL>;
-		assigned-clock-rates = <594000000>;
-	};
-
-	grf: syscon@20008000 {
-		compatible = "rockchip,rk3128-grf", "syscon", "simple-mfd";
-		reg = <0x20008000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		usb2phy: usb2phy@17c {
-			compatible = "rockchip,rk3128-usb2phy";
-			reg = <0x017c 0x0c>;
-			clocks = <&cru SCLK_OTGPHY0>;
-			clock-names = "phyclk";
-			clock-output-names = "usb480m_phy";
-			#clock-cells = <0>;
-			status = "disabled";
-
-			usb2phy_host: host-port {
-				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "linestate";
-				#phy-cells = <0>;
-				status = "disabled";
-			};
-
-			usb2phy_otg: otg-port {
-				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "otg-bvalid", "otg-id",
-						  "linestate";
-				#phy-cells = <0>;
-				status = "disabled";
-			};
-		};
-	};
-
-	timer0: timer@20044000 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x20044000 0x20>;
-		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER0>;
-		clock-names = "pclk", "timer";
-	};
-
-	timer1: timer@20044020 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x20044020 0x20>;
-		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER1>;
-		clock-names = "pclk", "timer";
-	};
-
-	timer2: timer@20044040 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x20044040 0x20>;
-		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER2>;
-		clock-names = "pclk", "timer";
-		status = "disabled";
-	};
-
-	timer3: timer@20044060 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x20044060 0x20>;
-		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER3>;
-		clock-names = "pclk", "timer";
-		status = "disabled";
-	};
-
-	timer4: timer@20044080 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x20044080 0x20>;
-		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER4>;
-		clock-names = "pclk", "timer";
-		status = "disabled";
-	};
-
-	timer5: timer@200440a0 {
-		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
-		reg = <0x200440a0 0x20>;
-		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER5>;
-		clock-names = "pclk", "timer";
-		status = "disabled";
-	};
-
-	watchdog: watchdog@2004c000 {
-		compatible = "rockchip,rk3128-wdt", "snps,dw-wdt";
-		reg = <0x2004c000 0x100>;
-		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_WDT>;
-		status = "disabled";
-	};
-
-	pwm0: pwm@20050000 {
-		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
-		reg = <0x20050000 0x10>;
-		clocks = <&cru PCLK_PWM>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm0_pin>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	pwm1: pwm@20050010 {
-		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
-		reg = <0x20050010 0x10>;
-		clocks = <&cru PCLK_PWM>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm1_pin>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	pwm2: pwm@20050020 {
-		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
-		reg = <0x20050020 0x10>;
-		clocks = <&cru PCLK_PWM>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm2_pin>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	pwm3: pwm@20050030 {
-		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
-		reg = <0x20050030 0x10>;
-		clocks = <&cru PCLK_PWM>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm3_pin>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	i2c1: i2c@20056000 {
-		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
-		reg = <0x20056000 0x1000>;
-		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "i2c";
-		clocks = <&cru PCLK_I2C1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c1_xfer>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
-
-	i2c2: i2c@2005a000 {
-		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
-		reg = <0x2005a000 0x1000>;
-		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "i2c";
-		clocks = <&cru PCLK_I2C2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c2_xfer>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
 
 	i2c3: i2c@2005e000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
@@ -384,539 +35,8 @@ uart0: serial@20060000 {
 		reg-shift = <2>;
 		status = "disabled";
 	};
+};
 
-	uart1: serial@20064000 {
-		compatible = "rockchip,rk3128-uart", "snps,dw-apb-uart";
-		reg = <0x20064000 0x100>;
-		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-		clock-frequency = <24000000>;
-		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
-		clock-names = "baudclk", "apb_pclk";
-		dmas = <&pdma 4>, <&pdma 5>;
-		dma-names = "tx", "rx";
-		pinctrl-names = "default";
-		pinctrl-0 = <&uart1_xfer>;
-		reg-io-width = <4>;
-		reg-shift = <2>;
-		status = "disabled";
-	};
-
-	uart2: serial@20068000 {
-		compatible = "rockchip,rk3128-uart", "snps,dw-apb-uart";
-		reg = <0x20068000 0x100>;
-		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-		clock-frequency = <24000000>;
-		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
-		clock-names = "baudclk", "apb_pclk";
-		dmas = <&pdma 6>, <&pdma 7>;
-		dma-names = "tx", "rx";
-		pinctrl-names = "default";
-		pinctrl-0 = <&uart2_xfer>;
-		reg-io-width = <4>;
-		reg-shift = <2>;
-		status = "disabled";
-	};
-
-	saradc: saradc@2006c000 {
-		compatible = "rockchip,saradc";
-		reg = <0x2006c000 0x100>;
-		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
-		clock-names = "saradc", "apb_pclk";
-		resets = <&cru SRST_SARADC>;
-		reset-names = "saradc-apb";
-		#io-channel-cells = <1>;
-		status = "disabled";
-	};
-
-	i2c0: i2c@20072000 {
-		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
-		reg = <0x20072000 0x1000>;
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "i2c";
-		clocks = <&cru PCLK_I2C0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c0_xfer>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
-
-	spi0: spi@20074000 {
-		compatible = "rockchip,rk3128-spi", "rockchip,rk3066-spi";
-		reg = <0x20074000 0x1000>;
-		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
-		clock-names = "spiclk", "apb_pclk";
-		dmas = <&pdma 8>, <&pdma 9>;
-		dma-names = "tx", "rx";
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi0_tx &spi0_rx &spi0_clk &spi0_cs0 &spi0_cs1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
-
-	pdma: dma-controller@20078000 {
-		compatible = "arm,pl330", "arm,primecell";
-		reg = <0x20078000 0x4000>;
-		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-		arm,pl330-broken-no-flushp;
-		arm,pl330-periph-burst;
-		clocks = <&cru ACLK_DMAC>;
-		clock-names = "apb_pclk";
-		#dma-cells = <1>;
-	};
-
-	pinctrl: pinctrl {
-		compatible = "rockchip,rk3128-pinctrl";
-		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		gpio0: gpio@2007c000 {
-			compatible = "rockchip,gpio-bank";
-			reg = <0x2007c000 0x100>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO0>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio1: gpio@20080000 {
-			compatible = "rockchip,gpio-bank";
-			reg = <0x20080000 0x100>;
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO1>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio2: gpio@20084000 {
-			compatible = "rockchip,gpio-bank";
-			reg = <0x20084000 0x100>;
-			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO2>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio3: gpio@20088000 {
-			compatible = "rockchip,gpio-bank";
-			reg = <0x20088000 0x100>;
-			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO3>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		pcfg_pull_default: pcfg-pull-default {
-			bias-pull-pin-default;
-		};
-
-		pcfg_pull_none: pcfg-pull-none {
-			bias-disable;
-		};
-
-		emmc {
-			emmc_clk: emmc-clk {
-				rockchip,pins = <2 RK_PA7 2 &pcfg_pull_none>;
-			};
-
-			emmc_cmd: emmc-cmd {
-				rockchip,pins = <1 RK_PC6 2 &pcfg_pull_default>;
-			};
-
-			emmc_cmd1: emmc-cmd1 {
-				rockchip,pins = <2 RK_PA4 2 &pcfg_pull_default>;
-			};
-
-			emmc_pwr: emmc-pwr {
-				rockchip,pins = <2 RK_PA5 2 &pcfg_pull_default>;
-			};
-
-			emmc_bus1: emmc-bus1 {
-				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>;
-			};
-
-			emmc_bus4: emmc-bus4 {
-				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>,
-						<1 RK_PD1 2 &pcfg_pull_default>,
-						<1 RK_PD2 2 &pcfg_pull_default>,
-						<1 RK_PD3 2 &pcfg_pull_default>;
-			};
-
-			emmc_bus8: emmc-bus8 {
-				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>,
-						<1 RK_PD1 2 &pcfg_pull_default>,
-						<1 RK_PD2 2 &pcfg_pull_default>,
-						<1 RK_PD3 2 &pcfg_pull_default>,
-						<1 RK_PD4 2 &pcfg_pull_default>,
-						<1 RK_PD5 2 &pcfg_pull_default>,
-						<1 RK_PD6 2 &pcfg_pull_default>,
-						<1 RK_PD7 2 &pcfg_pull_default>;
-			};
-		};
-
-		gmac {
-			rgmii_pins: rgmii-pins {
-				rockchip,pins = <2 RK_PB0 3 &pcfg_pull_default>,
-						<2 RK_PB1 3 &pcfg_pull_default>,
-						<2 RK_PB3 3 &pcfg_pull_default>,
-						<2 RK_PB4 3 &pcfg_pull_default>,
-						<2 RK_PB5 3 &pcfg_pull_default>,
-						<2 RK_PB6 3 &pcfg_pull_default>,
-						<2 RK_PC0 3 &pcfg_pull_default>,
-						<2 RK_PC1 3 &pcfg_pull_default>,
-						<2 RK_PC2 3 &pcfg_pull_default>,
-						<2 RK_PC3 3 &pcfg_pull_default>,
-						<2 RK_PD1 3 &pcfg_pull_default>,
-						<2 RK_PC4 4 &pcfg_pull_default>,
-						<2 RK_PC5 4 &pcfg_pull_default>,
-						<2 RK_PC6 4 &pcfg_pull_default>,
-						<2 RK_PC7 4 &pcfg_pull_default>;
-			};
-
-			rmii_pins: rmii-pins {
-				rockchip,pins = <2 RK_PB0 3 &pcfg_pull_default>,
-						<2 RK_PB4 3 &pcfg_pull_default>,
-						<2 RK_PB5 3 &pcfg_pull_default>,
-						<2 RK_PB6 3 &pcfg_pull_default>,
-						<2 RK_PB7 3 &pcfg_pull_default>,
-						<2 RK_PC0 3 &pcfg_pull_default>,
-						<2 RK_PC1 3 &pcfg_pull_default>,
-						<2 RK_PC2 3 &pcfg_pull_default>,
-						<2 RK_PC3 3 &pcfg_pull_default>,
-						<2 RK_PD1 3 &pcfg_pull_default>;
-			};
-		};
-
-		hdmi {
-			hdmii2c_xfer: hdmii2c-xfer {
-				rockchip,pins = <0 RK_PA6 2 &pcfg_pull_none>,
-						<0 RK_PA7 2 &pcfg_pull_none>;
-			};
-
-			hdmi_hpd: hdmi-hpd {
-				rockchip,pins = <0 RK_PB7 1 &pcfg_pull_none>;
-			};
-
-			hdmi_cec: hdmi-cec {
-				rockchip,pins = <0 RK_PC4 1 &pcfg_pull_none>;
-			};
-		};
-
-		i2c0 {
-			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_none>,
-						<0 RK_PA1 1 &pcfg_pull_none>;
-			};
-		};
-
-		i2c1 {
-			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <0 RK_PA2 1 &pcfg_pull_none>,
-						<0 RK_PA3 1 &pcfg_pull_none>;
-			};
-		};
-
-		i2c2 {
-			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <2 RK_PC4 3 &pcfg_pull_none>,
-						<2 RK_PC5 3 &pcfg_pull_none>;
-			};
-		};
-
-		i2c3 {
-			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <0 RK_PA6 1 &pcfg_pull_none>,
-						<0 RK_PA7 1 &pcfg_pull_none>;
-			};
-		};
-
-		i2s {
-			i2s_bus: i2s-bus {
-				rockchip,pins = <0 RK_PB0 1 &pcfg_pull_none>,
-						<0 RK_PB1 1 &pcfg_pull_none>,
-						<0 RK_PB3 1 &pcfg_pull_none>,
-						<0 RK_PB4 1 &pcfg_pull_none>,
-						<0 RK_PB5 1 &pcfg_pull_none>,
-						<0 RK_PB6 1 &pcfg_pull_none>;
-			};
-
-			i2s1_bus: i2s1-bus {
-				rockchip,pins = <1 RK_PA0 1 &pcfg_pull_none>,
-						<1 RK_PA1 1 &pcfg_pull_none>,
-						<1 RK_PA2 1 &pcfg_pull_none>,
-						<1 RK_PA3 1 &pcfg_pull_none>,
-						<1 RK_PA4 1 &pcfg_pull_none>,
-						<1 RK_PA5 1 &pcfg_pull_none>;
-			};
-		};
-
-		lcdc {
-			lcdc_dclk: lcdc-dclk {
-				rockchip,pins = <2 RK_PB0 1 &pcfg_pull_none>;
-			};
-
-			lcdc_den: lcdc-den {
-				rockchip,pins = <2 RK_PB3 1 &pcfg_pull_none>;
-			};
-
-			lcdc_hsync: lcdc-hsync {
-				rockchip,pins = <2 RK_PB1 1 &pcfg_pull_none>;
-			};
-
-			lcdc_vsync: lcdc-vsync {
-				rockchip,pins = <2 RK_PB2 1 &pcfg_pull_none>;
-			};
-
-			lcdc_rgb24: lcdc-rgb24 {
-				rockchip,pins = <2 RK_PB4 1 &pcfg_pull_none>,
-						<2 RK_PB5 1 &pcfg_pull_none>,
-						<2 RK_PB6 1 &pcfg_pull_none>,
-						<2 RK_PB7 1 &pcfg_pull_none>,
-						<2 RK_PC0 1 &pcfg_pull_none>,
-						<2 RK_PC1 1 &pcfg_pull_none>,
-						<2 RK_PC2 1 &pcfg_pull_none>,
-						<2 RK_PC3 1 &pcfg_pull_none>,
-						<2 RK_PC4 1 &pcfg_pull_none>,
-						<2 RK_PC5 1 &pcfg_pull_none>,
-						<2 RK_PC6 1 &pcfg_pull_none>,
-						<2 RK_PC7 1 &pcfg_pull_none>,
-						<2 RK_PD0 1 &pcfg_pull_none>,
-						<2 RK_PD1 1 &pcfg_pull_none>;
-			};
-		};
-
-		nfc {
-			flash_ale: flash-ale {
-				rockchip,pins = <2 RK_PA0 1 &pcfg_pull_none>;
-			};
-
-			flash_cle: flash-cle {
-				rockchip,pins = <2 RK_PA1 1 &pcfg_pull_none>;
-			};
-
-			flash_wrn: flash-wrn {
-				rockchip,pins = <2 RK_PA2 1 &pcfg_pull_none>;
-			};
-
-			flash_rdn: flash-rdn {
-				rockchip,pins = <2 RK_PA3 1 &pcfg_pull_none>;
-			};
-
-			flash_rdy: flash-rdy {
-				rockchip,pins = <2 RK_PA4 1 &pcfg_pull_none>;
-			};
-
-			flash_cs0: flash-cs0 {
-				rockchip,pins = <2 RK_PA6 1 &pcfg_pull_none>;
-			};
-
-			flash_dqs: flash-dqs {
-				rockchip,pins = <2 RK_PA7 1 &pcfg_pull_none>;
-			};
-
-			flash_bus8: flash-bus8 {
-				rockchip,pins = <1 RK_PD0 1 &pcfg_pull_none>,
-						<1 RK_PD1 1 &pcfg_pull_none>,
-						<1 RK_PD2 1 &pcfg_pull_none>,
-						<1 RK_PD3 1 &pcfg_pull_none>,
-						<1 RK_PD4 1 &pcfg_pull_none>,
-						<1 RK_PD5 1 &pcfg_pull_none>,
-						<1 RK_PD6 1 &pcfg_pull_none>,
-						<1 RK_PD7 1 &pcfg_pull_none>;
-			};
-		};
-
-		pwm0 {
-			pwm0_pin: pwm0-pin {
-				rockchip,pins = <0 RK_PD2 1 &pcfg_pull_none>;
-			};
-		};
-
-		pwm1 {
-			pwm1_pin: pwm1-pin {
-				rockchip,pins = <0 RK_PD3 1 &pcfg_pull_none>;
-			};
-		};
-
-		pwm2 {
-			pwm2_pin: pwm2-pin {
-				rockchip,pins = <0 RK_PD4 1 &pcfg_pull_none>;
-			};
-		};
-
-		pwm3 {
-			pwm3_pin: pwm3-pin {
-				rockchip,pins = <3 RK_PD2 1 &pcfg_pull_none>;
-			};
-		};
-
-		sdio {
-			sdio_clk: sdio-clk {
-				rockchip,pins = <1 RK_PA0 2 &pcfg_pull_none>;
-			};
-
-			sdio_cmd: sdio-cmd {
-				rockchip,pins = <0 RK_PA3 2 &pcfg_pull_default>;
-			};
-
-			sdio_pwren: sdio-pwren {
-				rockchip,pins = <0 RK_PD6 1 &pcfg_pull_default>;
-			};
-
-			sdio_bus4: sdio-bus4 {
-				rockchip,pins = <1 RK_PA1 2 &pcfg_pull_default>,
-						<1 RK_PA2 2 &pcfg_pull_default>,
-						<1 RK_PA4 2 &pcfg_pull_default>,
-						<1 RK_PA5 2 &pcfg_pull_default>;
-			};
-		};
-
-		sdmmc {
-			sdmmc_clk: sdmmc-clk {
-				rockchip,pins = <1 RK_PC0 1 &pcfg_pull_none>;
-			};
-
-			sdmmc_cmd: sdmmc-cmd {
-				rockchip,pins = <1 RK_PB7 1 &pcfg_pull_default>;
-			};
-
-			sdmmc_wp: sdmmc-wp {
-				rockchip,pins = <1 RK_PA7 1 &pcfg_pull_default>;
-			};
-
-			sdmmc_pwren: sdmmc-pwren {
-				rockchip,pins = <1 RK_PB6 1 &pcfg_pull_default>;
-			};
-
-			sdmmc_bus4: sdmmc-bus4 {
-				rockchip,pins = <1 RK_PC2 1 &pcfg_pull_default>,
-						<1 RK_PC3 1 &pcfg_pull_default>,
-						<1 RK_PC4 1 &pcfg_pull_default>,
-						<1 RK_PC5 1 &pcfg_pull_default>;
-			};
-		};
-
-		spdif {
-			spdif_tx: spdif-tx {
-				rockchip,pins = <3 RK_PD3 1 &pcfg_pull_none>;
-			};
-		};
-
-		spi0 {
-			spi0_clk: spi0-clk {
-				rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>;
-			};
-
-			spi0_cs0: spi0-cs0 {
-				rockchip,pins = <1 RK_PB3 1 &pcfg_pull_default>;
-			};
-
-			spi0_tx: spi0-tx {
-				rockchip,pins = <1 RK_PB1 1 &pcfg_pull_default>;
-			};
-
-			spi0_rx: spi0-rx {
-				rockchip,pins = <1 RK_PB2 1 &pcfg_pull_default>;
-			};
-
-			spi0_cs1: spi0-cs1 {
-				rockchip,pins = <1 RK_PB4 1 &pcfg_pull_default>;
-			};
-
-			spi1_clk: spi1-clk {
-				rockchip,pins = <2 RK_PA0 2 &pcfg_pull_default>;
-			};
-
-			spi1_cs0: spi1-cs0 {
-				rockchip,pins = <1 RK_PD6 3 &pcfg_pull_default>;
-			};
-
-			spi1_tx: spi1-tx {
-				rockchip,pins = <1 RK_PD5 3 &pcfg_pull_default>;
-			};
-
-			spi1_rx: spi1-rx {
-				rockchip,pins = <1 RK_PD4 3 &pcfg_pull_default>;
-			};
-
-			spi1_cs1: spi1-cs1 {
-				rockchip,pins = <1 RK_PD7 3 &pcfg_pull_default>;
-			};
-
-			spi2_clk: spi2-clk {
-				rockchip,pins = <0 RK_PB1 2 &pcfg_pull_default>;
-			};
-
-			spi2_cs0: spi2-cs0 {
-				rockchip,pins = <0 RK_PB6 2 &pcfg_pull_default>;
-			};
-
-			spi2_tx: spi2-tx {
-				rockchip,pins = <0 RK_PB3 2 &pcfg_pull_default>;
-			};
-
-			spi2_rx: spi2-rx {
-				rockchip,pins = <0 RK_PB5 2 &pcfg_pull_default>;
-			};
-		};
-
-		uart0 {
-			uart0_xfer: uart0-xfer {
-				rockchip,pins = <2 RK_PD2 2 &pcfg_pull_default>,
-						<2 RK_PD3 2 &pcfg_pull_none>;
-			};
-
-			uart0_cts: uart0-cts {
-				rockchip,pins = <2 RK_PD5 2 &pcfg_pull_none>;
-			};
-
-			uart0_rts: uart0-rts {
-				rockchip,pins = <0 RK_PC1 2 &pcfg_pull_none>;
-			};
-		};
-
-		uart1 {
-			uart1_xfer: uart1-xfer {
-				rockchip,pins = <1 RK_PB1 2 &pcfg_pull_default>,
-						<1 RK_PB2 2 &pcfg_pull_default>;
-			};
-
-			uart1_cts: uart1-cts {
-				rockchip,pins = <1 RK_PB0 2 &pcfg_pull_none>;
-			};
-
-			uart1_rts: uart1-rts {
-				rockchip,pins = <1 RK_PB3 2 &pcfg_pull_none>;
-			};
-		};
-
-		uart2 {
-			uart2_xfer: uart2-xfer {
-				rockchip,pins = <1 RK_PC2 2 &pcfg_pull_default>,
-						<1 RK_PC3 2 &pcfg_pull_none>;
-			};
-
-			uart2_cts: uart2-cts {
-				rockchip,pins = <0 RK_PD1 1 &pcfg_pull_none>;
-			};
-
-			uart2_rts: uart2-rts {
-				rockchip,pins = <0 RK_PD0 1 &pcfg_pull_none>;
-			};
-		};
-	};
+&cru {
+	compatible = "rockchip,rk3128-cru";
 };
diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
new file mode 100644
index 000000000000..4d3422abf008
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -0,0 +1,893 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2017 Rockchip Electronics Co., Ltd
+ */
+
+#include <dt-bindings/clock/rk3128-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+/ {
+	compatible = "rockchip,rk3128";
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@f00 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf00>;
+			clock-latency = <40000>;
+			clocks = <&cru ARMCLK>;
+			operating-points = <
+				/* KHz    uV */
+				 816000 1000000
+			>;
+			#cooling-cells = <2>; /* min followed by max */
+		};
+
+		cpu1: cpu@f01 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf01>;
+		};
+
+		cpu2: cpu@f02 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf02>;
+		};
+
+		cpu3: cpu@f03 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf03>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		arm,cpu-registers-not-fw-configured;
+		clock-frequency = <24000000>;
+	};
+
+	xin24m: oscillator {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xin24m";
+		#clock-cells = <0>;
+	};
+
+	pmu: syscon@100a0000 {
+		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
+		reg = <0x100a0000 0x1000>;
+	};
+
+	gic: interrupt-controller@10139000 {
+		compatible = "arm,cortex-a7-gic";
+		reg = <0x10139000 0x1000>,
+		      <0x1013a000 0x1000>,
+		      <0x1013c000 0x2000>,
+		      <0x1013e000 0x2000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+	};
+
+	usb_otg: usb@10180000 {
+		compatible = "rockchip,rk3128-usb", "rockchip,rk3066-usb", "snps,dwc2";
+		reg = <0x10180000 0x40000>;
+		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_OTG>;
+		clock-names = "otg";
+		dr_mode = "otg";
+		phys = <&usb2phy_otg>;
+		phy-names = "usb2-phy";
+		status = "disabled";
+	};
+
+	usb_host_ehci: usb@101c0000 {
+		compatible = "generic-ehci";
+		reg = <0x101c0000 0x20000>;
+		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usb2phy_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host_ohci: usb@101e0000 {
+		compatible = "generic-ohci";
+		reg = <0x101e0000 0x20000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usb2phy_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	sdmmc: mmc@10214000 {
+		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x10214000 0x4000>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
+			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
+		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+		dmas = <&pdma 10>;
+		dma-names = "rx-tx";
+		fifo-depth = <256>;
+		max-frequency = <150000000>;
+		resets = <&cru SRST_SDMMC>;
+		reset-names = "reset";
+		status = "disabled";
+	};
+
+	sdio: mmc@10218000 {
+		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x10218000 0x4000>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
+			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
+		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+		dmas = <&pdma 11>;
+		dma-names = "rx-tx";
+		fifo-depth = <256>;
+		max-frequency = <150000000>;
+		resets = <&cru SRST_SDIO>;
+		reset-names = "reset";
+		status = "disabled";
+	};
+
+	emmc: mmc@1021c000 {
+		compatible = "rockchip,rk3128-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x1021c000 0x4000>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
+			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
+		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+		dmas = <&pdma 12>;
+		dma-names = "rx-tx";
+		fifo-depth = <256>;
+		max-frequency = <150000000>;
+		resets = <&cru SRST_EMMC>;
+		reset-names = "reset";
+		status = "disabled";
+	};
+
+	nfc: nand-controller@10500000 {
+		compatible = "rockchip,rk3128-nfc", "rockchip,rk2928-nfc";
+		reg = <0x10500000 0x4000>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+		clock-names = "ahb", "nfc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_cs0
+			     &flash_dqs &flash_rdn &flash_rdy &flash_wrn>;
+		status = "disabled";
+	};
+
+	cru: clock-controller@20000000 {
+		compatible = "rockchip,rk3126-cru";
+		reg = <0x20000000 0x1000>;
+		clocks = <&xin24m>;
+		clock-names = "xin24m";
+		rockchip,grf = <&grf>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		assigned-clocks = <&cru PLL_GPLL>;
+		assigned-clock-rates = <594000000>;
+	};
+
+	grf: syscon@20008000 {
+		compatible = "rockchip,rk3128-grf", "syscon", "simple-mfd";
+		reg = <0x20008000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		usb2phy: usb2phy@17c {
+			compatible = "rockchip,rk3128-usb2phy";
+			reg = <0x017c 0x0c>;
+			clocks = <&cru SCLK_OTGPHY0>;
+			clock-names = "phyclk";
+			clock-output-names = "usb480m_phy";
+			#clock-cells = <0>;
+			status = "disabled";
+
+			usb2phy_host: host-port {
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usb2phy_otg: otg-port {
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer0: timer@20044000 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x20044000 0x20>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
+	timer1: timer@20044020 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x20044020 0x20>;
+		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER1>;
+		clock-names = "pclk", "timer";
+	};
+
+	timer2: timer@20044040 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x20044040 0x20>;
+		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER2>;
+		clock-names = "pclk", "timer";
+		status = "disabled";
+	};
+
+	timer3: timer@20044060 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x20044060 0x20>;
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER3>;
+		clock-names = "pclk", "timer";
+		status = "disabled";
+	};
+
+	timer4: timer@20044080 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x20044080 0x20>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER4>;
+		clock-names = "pclk", "timer";
+		status = "disabled";
+	};
+
+	timer5: timer@200440a0 {
+		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
+		reg = <0x200440a0 0x20>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER5>;
+		clock-names = "pclk", "timer";
+		status = "disabled";
+	};
+
+	watchdog: watchdog@2004c000 {
+		compatible = "rockchip,rk3128-wdt", "snps,dw-wdt";
+		reg = <0x2004c000 0x100>;
+		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_WDT>;
+		status = "disabled";
+	};
+
+	pwm0: pwm@20050000 {
+		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
+		reg = <0x20050000 0x10>;
+		clocks = <&cru PCLK_PWM>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm0_pin>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm1: pwm@20050010 {
+		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
+		reg = <0x20050010 0x10>;
+		clocks = <&cru PCLK_PWM>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm2: pwm@20050020 {
+		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
+		reg = <0x20050020 0x10>;
+		clocks = <&cru PCLK_PWM>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm2_pin>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	pwm3: pwm@20050030 {
+		compatible = "rockchip,rk3128-pwm", "rockchip,rk3288-pwm";
+		reg = <0x20050030 0x10>;
+		clocks = <&cru PCLK_PWM>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm3_pin>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	i2c1: i2c@20056000 {
+		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
+		reg = <0x20056000 0x1000>;
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "i2c";
+		clocks = <&cru PCLK_I2C1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c1_xfer>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@2005a000 {
+		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
+		reg = <0x2005a000 0x1000>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "i2c";
+		clocks = <&cru PCLK_I2C2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_xfer>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	uart1: serial@20064000 {
+		compatible = "rockchip,rk3128-uart", "snps,dw-apb-uart";
+		reg = <0x20064000 0x100>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <24000000>;
+		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+		clock-names = "baudclk", "apb_pclk";
+		dmas = <&pdma 4>, <&pdma 5>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart1_xfer>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		status = "disabled";
+	};
+
+	uart2: serial@20068000 {
+		compatible = "rockchip,rk3128-uart", "snps,dw-apb-uart";
+		reg = <0x20068000 0x100>;
+		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <24000000>;
+		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+		clock-names = "baudclk", "apb_pclk";
+		dmas = <&pdma 6>, <&pdma 7>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart2_xfer>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		status = "disabled";
+	};
+
+	saradc: saradc@2006c000 {
+		compatible = "rockchip,saradc";
+		reg = <0x2006c000 0x100>;
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
+		clock-names = "saradc", "apb_pclk";
+		resets = <&cru SRST_SARADC>;
+		reset-names = "saradc-apb";
+		#io-channel-cells = <1>;
+		status = "disabled";
+	};
+
+	i2c0: i2c@20072000 {
+		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
+		reg = <0x20072000 0x1000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "i2c";
+		clocks = <&cru PCLK_I2C0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c0_xfer>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	spi0: spi@20074000 {
+		compatible = "rockchip,rk3128-spi", "rockchip,rk3066-spi";
+		reg = <0x20074000 0x1000>;
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
+		clock-names = "spiclk", "apb_pclk";
+		dmas = <&pdma 8>, <&pdma 9>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi0_tx &spi0_rx &spi0_clk &spi0_cs0 &spi0_cs1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	pdma: dma-controller@20078000 {
+		compatible = "arm,pl330", "arm,primecell";
+		reg = <0x20078000 0x4000>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+		arm,pl330-broken-no-flushp;
+		arm,pl330-periph-burst;
+		clocks = <&cru ACLK_DMAC>;
+		clock-names = "apb_pclk";
+		#dma-cells = <1>;
+	};
+
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3128-pinctrl";
+		rockchip,grf = <&grf>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpio0: gpio@2007c000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x2007c000 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@20080000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20080000 0x100>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@20084000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20084000 0x100>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@20088000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x20088000 0x100>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_GPIO3>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pcfg_pull_default: pcfg-pull-default {
+			bias-pull-pin-default;
+		};
+
+		pcfg_pull_none: pcfg-pull-none {
+			bias-disable;
+		};
+
+		emmc {
+			emmc_clk: emmc-clk {
+				rockchip,pins = <2 RK_PA7 2 &pcfg_pull_none>;
+			};
+
+			emmc_cmd: emmc-cmd {
+				rockchip,pins = <1 RK_PC6 2 &pcfg_pull_default>;
+			};
+
+			emmc_cmd1: emmc-cmd1 {
+				rockchip,pins = <2 RK_PA4 2 &pcfg_pull_default>;
+			};
+
+			emmc_pwr: emmc-pwr {
+				rockchip,pins = <2 RK_PA5 2 &pcfg_pull_default>;
+			};
+
+			emmc_bus1: emmc-bus1 {
+				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>;
+			};
+
+			emmc_bus4: emmc-bus4 {
+				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>,
+						<1 RK_PD1 2 &pcfg_pull_default>,
+						<1 RK_PD2 2 &pcfg_pull_default>,
+						<1 RK_PD3 2 &pcfg_pull_default>;
+			};
+
+			emmc_bus8: emmc-bus8 {
+				rockchip,pins = <1 RK_PD0 2 &pcfg_pull_default>,
+						<1 RK_PD1 2 &pcfg_pull_default>,
+						<1 RK_PD2 2 &pcfg_pull_default>,
+						<1 RK_PD3 2 &pcfg_pull_default>,
+						<1 RK_PD4 2 &pcfg_pull_default>,
+						<1 RK_PD5 2 &pcfg_pull_default>,
+						<1 RK_PD6 2 &pcfg_pull_default>,
+						<1 RK_PD7 2 &pcfg_pull_default>;
+			};
+		};
+
+		gmac {
+			rgmii_pins: rgmii-pins {
+				rockchip,pins = <2 RK_PB0 3 &pcfg_pull_default>,
+						<2 RK_PB1 3 &pcfg_pull_default>,
+						<2 RK_PB3 3 &pcfg_pull_default>,
+						<2 RK_PB4 3 &pcfg_pull_default>,
+						<2 RK_PB5 3 &pcfg_pull_default>,
+						<2 RK_PB6 3 &pcfg_pull_default>,
+						<2 RK_PC0 3 &pcfg_pull_default>,
+						<2 RK_PC1 3 &pcfg_pull_default>,
+						<2 RK_PC2 3 &pcfg_pull_default>,
+						<2 RK_PC3 3 &pcfg_pull_default>,
+						<2 RK_PD1 3 &pcfg_pull_default>,
+						<2 RK_PC4 4 &pcfg_pull_default>,
+						<2 RK_PC5 4 &pcfg_pull_default>,
+						<2 RK_PC6 4 &pcfg_pull_default>,
+						<2 RK_PC7 4 &pcfg_pull_default>;
+			};
+
+			rmii_pins: rmii-pins {
+				rockchip,pins = <2 RK_PB0 3 &pcfg_pull_default>,
+						<2 RK_PB4 3 &pcfg_pull_default>,
+						<2 RK_PB5 3 &pcfg_pull_default>,
+						<2 RK_PB6 3 &pcfg_pull_default>,
+						<2 RK_PB7 3 &pcfg_pull_default>,
+						<2 RK_PC0 3 &pcfg_pull_default>,
+						<2 RK_PC1 3 &pcfg_pull_default>,
+						<2 RK_PC2 3 &pcfg_pull_default>,
+						<2 RK_PC3 3 &pcfg_pull_default>,
+						<2 RK_PD1 3 &pcfg_pull_default>;
+			};
+		};
+
+		hdmi {
+			hdmii2c_xfer: hdmii2c-xfer {
+				rockchip,pins = <0 RK_PA6 2 &pcfg_pull_none>,
+						<0 RK_PA7 2 &pcfg_pull_none>;
+			};
+
+			hdmi_hpd: hdmi-hpd {
+				rockchip,pins = <0 RK_PB7 1 &pcfg_pull_none>;
+			};
+
+			hdmi_cec: hdmi-cec {
+				rockchip,pins = <0 RK_PC4 1 &pcfg_pull_none>;
+			};
+		};
+
+		i2c0 {
+			i2c0_xfer: i2c0-xfer {
+				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_none>,
+						<0 RK_PA1 1 &pcfg_pull_none>;
+			};
+		};
+
+		i2c1 {
+			i2c1_xfer: i2c1-xfer {
+				rockchip,pins = <0 RK_PA2 1 &pcfg_pull_none>,
+						<0 RK_PA3 1 &pcfg_pull_none>;
+			};
+		};
+
+		i2c2 {
+			i2c2_xfer: i2c2-xfer {
+				rockchip,pins = <2 RK_PC4 3 &pcfg_pull_none>,
+						<2 RK_PC5 3 &pcfg_pull_none>;
+			};
+		};
+
+		i2c3 {
+			i2c3_xfer: i2c3-xfer {
+				rockchip,pins = <0 RK_PA6 1 &pcfg_pull_none>,
+						<0 RK_PA7 1 &pcfg_pull_none>;
+			};
+		};
+
+		i2s {
+			i2s_bus: i2s-bus {
+				rockchip,pins = <0 RK_PB0 1 &pcfg_pull_none>,
+						<0 RK_PB1 1 &pcfg_pull_none>,
+						<0 RK_PB3 1 &pcfg_pull_none>,
+						<0 RK_PB4 1 &pcfg_pull_none>,
+						<0 RK_PB5 1 &pcfg_pull_none>,
+						<0 RK_PB6 1 &pcfg_pull_none>;
+			};
+
+			i2s1_bus: i2s1-bus {
+				rockchip,pins = <1 RK_PA0 1 &pcfg_pull_none>,
+						<1 RK_PA1 1 &pcfg_pull_none>,
+						<1 RK_PA2 1 &pcfg_pull_none>,
+						<1 RK_PA3 1 &pcfg_pull_none>,
+						<1 RK_PA4 1 &pcfg_pull_none>,
+						<1 RK_PA5 1 &pcfg_pull_none>;
+			};
+		};
+
+		lcdc {
+			lcdc_dclk: lcdc-dclk {
+				rockchip,pins = <2 RK_PB0 1 &pcfg_pull_none>;
+			};
+
+			lcdc_den: lcdc-den {
+				rockchip,pins = <2 RK_PB3 1 &pcfg_pull_none>;
+			};
+
+			lcdc_hsync: lcdc-hsync {
+				rockchip,pins = <2 RK_PB1 1 &pcfg_pull_none>;
+			};
+
+			lcdc_vsync: lcdc-vsync {
+				rockchip,pins = <2 RK_PB2 1 &pcfg_pull_none>;
+			};
+
+			lcdc_rgb24: lcdc-rgb24 {
+				rockchip,pins = <2 RK_PB4 1 &pcfg_pull_none>,
+						<2 RK_PB5 1 &pcfg_pull_none>,
+						<2 RK_PB6 1 &pcfg_pull_none>,
+						<2 RK_PB7 1 &pcfg_pull_none>,
+						<2 RK_PC0 1 &pcfg_pull_none>,
+						<2 RK_PC1 1 &pcfg_pull_none>,
+						<2 RK_PC2 1 &pcfg_pull_none>,
+						<2 RK_PC3 1 &pcfg_pull_none>,
+						<2 RK_PC4 1 &pcfg_pull_none>,
+						<2 RK_PC5 1 &pcfg_pull_none>,
+						<2 RK_PC6 1 &pcfg_pull_none>,
+						<2 RK_PC7 1 &pcfg_pull_none>,
+						<2 RK_PD0 1 &pcfg_pull_none>,
+						<2 RK_PD1 1 &pcfg_pull_none>;
+			};
+		};
+
+		nfc {
+			flash_ale: flash-ale {
+				rockchip,pins = <2 RK_PA0 1 &pcfg_pull_none>;
+			};
+
+			flash_cle: flash-cle {
+				rockchip,pins = <2 RK_PA1 1 &pcfg_pull_none>;
+			};
+
+			flash_wrn: flash-wrn {
+				rockchip,pins = <2 RK_PA2 1 &pcfg_pull_none>;
+			};
+
+			flash_rdn: flash-rdn {
+				rockchip,pins = <2 RK_PA3 1 &pcfg_pull_none>;
+			};
+
+			flash_rdy: flash-rdy {
+				rockchip,pins = <2 RK_PA4 1 &pcfg_pull_none>;
+			};
+
+			flash_cs0: flash-cs0 {
+				rockchip,pins = <2 RK_PA6 1 &pcfg_pull_none>;
+			};
+
+			flash_dqs: flash-dqs {
+				rockchip,pins = <2 RK_PA7 1 &pcfg_pull_none>;
+			};
+
+			flash_bus8: flash-bus8 {
+				rockchip,pins = <1 RK_PD0 1 &pcfg_pull_none>,
+						<1 RK_PD1 1 &pcfg_pull_none>,
+						<1 RK_PD2 1 &pcfg_pull_none>,
+						<1 RK_PD3 1 &pcfg_pull_none>,
+						<1 RK_PD4 1 &pcfg_pull_none>,
+						<1 RK_PD5 1 &pcfg_pull_none>,
+						<1 RK_PD6 1 &pcfg_pull_none>,
+						<1 RK_PD7 1 &pcfg_pull_none>;
+			};
+		};
+
+		pwm0 {
+			pwm0_pin: pwm0-pin {
+				rockchip,pins = <0 RK_PD2 1 &pcfg_pull_none>;
+			};
+		};
+
+		pwm1 {
+			pwm1_pin: pwm1-pin {
+				rockchip,pins = <0 RK_PD3 1 &pcfg_pull_none>;
+			};
+		};
+
+		pwm2 {
+			pwm2_pin: pwm2-pin {
+				rockchip,pins = <0 RK_PD4 1 &pcfg_pull_none>;
+			};
+		};
+
+		pwm3 {
+			pwm3_pin: pwm3-pin {
+				rockchip,pins = <3 RK_PD2 1 &pcfg_pull_none>;
+			};
+		};
+
+		sdio {
+			sdio_clk: sdio-clk {
+				rockchip,pins = <1 RK_PA0 2 &pcfg_pull_none>;
+			};
+
+			sdio_cmd: sdio-cmd {
+				rockchip,pins = <0 RK_PA3 2 &pcfg_pull_default>;
+			};
+
+			sdio_pwren: sdio-pwren {
+				rockchip,pins = <0 RK_PD6 1 &pcfg_pull_default>;
+			};
+
+			sdio_bus4: sdio-bus4 {
+				rockchip,pins = <1 RK_PA1 2 &pcfg_pull_default>,
+						<1 RK_PA2 2 &pcfg_pull_default>,
+						<1 RK_PA4 2 &pcfg_pull_default>,
+						<1 RK_PA5 2 &pcfg_pull_default>;
+			};
+		};
+
+		sdmmc {
+			sdmmc_clk: sdmmc-clk {
+				rockchip,pins = <1 RK_PC0 1 &pcfg_pull_none>;
+			};
+
+			sdmmc_cmd: sdmmc-cmd {
+				rockchip,pins = <1 RK_PB7 1 &pcfg_pull_default>;
+			};
+
+			sdmmc_wp: sdmmc-wp {
+				rockchip,pins = <1 RK_PA7 1 &pcfg_pull_default>;
+			};
+
+			sdmmc_pwren: sdmmc-pwren {
+				rockchip,pins = <1 RK_PB6 1 &pcfg_pull_default>;
+			};
+
+			sdmmc_bus4: sdmmc-bus4 {
+				rockchip,pins = <1 RK_PC2 1 &pcfg_pull_default>,
+						<1 RK_PC3 1 &pcfg_pull_default>,
+						<1 RK_PC4 1 &pcfg_pull_default>,
+						<1 RK_PC5 1 &pcfg_pull_default>;
+			};
+		};
+
+		spdif {
+			spdif_tx: spdif-tx {
+				rockchip,pins = <3 RK_PD3 1 &pcfg_pull_none>;
+			};
+		};
+
+		spi0 {
+			spi0_clk: spi0-clk {
+				rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>;
+			};
+
+			spi0_cs0: spi0-cs0 {
+				rockchip,pins = <1 RK_PB3 1 &pcfg_pull_default>;
+			};
+
+			spi0_tx: spi0-tx {
+				rockchip,pins = <1 RK_PB1 1 &pcfg_pull_default>;
+			};
+
+			spi0_rx: spi0-rx {
+				rockchip,pins = <1 RK_PB2 1 &pcfg_pull_default>;
+			};
+
+			spi0_cs1: spi0-cs1 {
+				rockchip,pins = <1 RK_PB4 1 &pcfg_pull_default>;
+			};
+
+			spi1_clk: spi1-clk {
+				rockchip,pins = <2 RK_PA0 2 &pcfg_pull_default>;
+			};
+
+			spi1_cs0: spi1-cs0 {
+				rockchip,pins = <1 RK_PD6 3 &pcfg_pull_default>;
+			};
+
+			spi1_tx: spi1-tx {
+				rockchip,pins = <1 RK_PD5 3 &pcfg_pull_default>;
+			};
+
+			spi1_rx: spi1-rx {
+				rockchip,pins = <1 RK_PD4 3 &pcfg_pull_default>;
+			};
+
+			spi1_cs1: spi1-cs1 {
+				rockchip,pins = <1 RK_PD7 3 &pcfg_pull_default>;
+			};
+
+			spi2_clk: spi2-clk {
+				rockchip,pins = <0 RK_PB1 2 &pcfg_pull_default>;
+			};
+
+			spi2_cs0: spi2-cs0 {
+				rockchip,pins = <0 RK_PB6 2 &pcfg_pull_default>;
+			};
+
+			spi2_tx: spi2-tx {
+				rockchip,pins = <0 RK_PB3 2 &pcfg_pull_default>;
+			};
+
+			spi2_rx: spi2-rx {
+				rockchip,pins = <0 RK_PB5 2 &pcfg_pull_default>;
+			};
+		};
+
+		uart0 {
+			uart0_xfer: uart0-xfer {
+				rockchip,pins = <2 RK_PD2 2 &pcfg_pull_default>,
+						<2 RK_PD3 2 &pcfg_pull_none>;
+			};
+
+			uart0_cts: uart0-cts {
+				rockchip,pins = <2 RK_PD5 2 &pcfg_pull_none>;
+			};
+
+			uart0_rts: uart0-rts {
+				rockchip,pins = <0 RK_PC1 2 &pcfg_pull_none>;
+			};
+		};
+
+		uart1 {
+			uart1_xfer: uart1-xfer {
+				rockchip,pins = <1 RK_PB1 2 &pcfg_pull_default>,
+						<1 RK_PB2 2 &pcfg_pull_default>;
+			};
+
+			uart1_cts: uart1-cts {
+				rockchip,pins = <1 RK_PB0 2 &pcfg_pull_none>;
+			};
+
+			uart1_rts: uart1-rts {
+				rockchip,pins = <1 RK_PB3 2 &pcfg_pull_none>;
+			};
+		};
+
+		uart2 {
+			uart2_xfer: uart2-xfer {
+				rockchip,pins = <1 RK_PC2 2 &pcfg_pull_default>,
+						<1 RK_PC3 2 &pcfg_pull_none>;
+			};
+
+			uart2_cts: uart2-cts {
+				rockchip,pins = <0 RK_PD1 1 &pcfg_pull_none>;
+			};
+
+			uart2_rts: uart2-rts {
+				rockchip,pins = <0 RK_PD0 1 &pcfg_pull_none>;
+			};
+		};
+	};
+};
-- 
2.42.0


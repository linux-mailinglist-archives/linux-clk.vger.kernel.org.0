Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFAA54A955F
	for <lists+linux-clk@lfdr.de>; Fri,  4 Feb 2022 09:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357154AbiBDIoC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Feb 2022 03:44:02 -0500
Received: from muru.com ([72.249.23.125]:46450 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357149AbiBDIoC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Feb 2022 03:44:02 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F0ECA818C;
        Fri,  4 Feb 2022 08:43:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: Add clock-output-names for omap5
Date:   Fri,  4 Feb 2022 10:43:37 +0200
Message-Id: <20220204084339.12341-4-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204084339.12341-1-tony@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To stop using the non-standard node name based clock naming, let's
first add the clock-output-names property. This allows us to stop using
the internal legacy clock naming and unify the naming for the TI SoCs in
the following patches.

Note that we must wait on fixing the node naming issues until after the
internal clock names have been updated to avoid adding name translation
unnecessarily.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 152 +++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -8,12 +8,14 @@ &cm_core_aon_clocks {
 	pad_clks_src_ck: pad_clks_src_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "pad_clks_src_ck";
 		clock-frequency = <12000000>;
 	};
 
 	pad_clks_ck: pad_clks_ck@108 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "pad_clks_ck";
 		clocks = <&pad_clks_src_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0108>;
@@ -22,18 +24,21 @@ pad_clks_ck: pad_clks_ck@108 {
 	secure_32k_clk_src_ck: secure_32k_clk_src_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "secure_32k_clk_src_ck";
 		clock-frequency = <32768>;
 	};
 
 	slimbus_src_clk: slimbus_src_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "slimbus_src_clk";
 		clock-frequency = <12000000>;
 	};
 
 	slimbus_clk: slimbus_clk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "slimbus_clk";
 		clocks = <&slimbus_src_clk>;
 		ti,bit-shift = <10>;
 		reg = <0x0108>;
@@ -42,66 +47,77 @@ slimbus_clk: slimbus_clk@108 {
 	sys_32k_ck: sys_32k_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "sys_32k_ck";
 		clock-frequency = <32768>;
 	};
 
 	virt_12000000_ck: virt_12000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_12000000_ck";
 		clock-frequency = <12000000>;
 	};
 
 	virt_13000000_ck: virt_13000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_13000000_ck";
 		clock-frequency = <13000000>;
 	};
 
 	virt_16800000_ck: virt_16800000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_16800000_ck";
 		clock-frequency = <16800000>;
 	};
 
 	virt_19200000_ck: virt_19200000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_19200000_ck";
 		clock-frequency = <19200000>;
 	};
 
 	virt_26000000_ck: virt_26000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_26000000_ck";
 		clock-frequency = <26000000>;
 	};
 
 	virt_27000000_ck: virt_27000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_27000000_ck";
 		clock-frequency = <27000000>;
 	};
 
 	virt_38400000_ck: virt_38400000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_38400000_ck";
 		clock-frequency = <38400000>;
 	};
 
 	xclk60mhsp1_ck: xclk60mhsp1_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "xclk60mhsp1_ck";
 		clock-frequency = <60000000>;
 	};
 
 	xclk60mhsp2_ck: xclk60mhsp2_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "xclk60mhsp2_ck";
 		clock-frequency = <60000000>;
 	};
 
 	dpll_abe_ck: dpll_abe_ck@1e0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-m4xen-clock";
+		clock-output-names = "dpll_abe_ck";
 		clocks = <&abe_dpll_clk_mux>, <&abe_dpll_bypass_clk_mux>;
 		reg = <0x01e0>, <0x01e4>, <0x01ec>, <0x01e8>;
 	};
@@ -109,12 +125,14 @@ dpll_abe_ck: dpll_abe_ck@1e0 {
 	dpll_abe_x2_ck: dpll_abe_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_abe_x2_ck";
 		clocks = <&dpll_abe_ck>;
 	};
 
 	dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_abe_m2x2_ck";
 		clocks = <&dpll_abe_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x01f0>;
@@ -124,6 +142,7 @@ dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
 	abe_24m_fclk: abe_24m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "abe_24m_fclk";
 		clocks = <&dpll_abe_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <8>;
@@ -132,6 +151,7 @@ abe_24m_fclk: abe_24m_fclk {
 	abe_clk: abe_clk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "abe_clk";
 		clocks = <&dpll_abe_m2x2_ck>;
 		ti,max-div = <4>;
 		reg = <0x0108>;
@@ -141,6 +161,7 @@ abe_clk: abe_clk@108 {
 	abe_iclk: abe_iclk@528 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "abe_iclk";
 		clocks = <&aess_fclk>;
 		ti,bit-shift = <24>;
 		reg = <0x0528>;
@@ -150,6 +171,7 @@ abe_iclk: abe_iclk@528 {
 	abe_lp_clk_div: abe_lp_clk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "abe_lp_clk_div";
 		clocks = <&dpll_abe_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <16>;
@@ -158,6 +180,7 @@ abe_lp_clk_div: abe_lp_clk_div {
 	dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_abe_m3x2_ck";
 		clocks = <&dpll_abe_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x01f4>;
@@ -167,6 +190,7 @@ dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
 	dpll_core_byp_mux: dpll_core_byp_mux@12c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "dpll_core_byp_mux";
 		clocks = <&sys_clkin>, <&dpll_abe_m3x2_ck>;
 		ti,bit-shift = <23>;
 		reg = <0x012c>;
@@ -175,6 +199,7 @@ dpll_core_byp_mux: dpll_core_byp_mux@12c {
 	dpll_core_ck: dpll_core_ck@120 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-core-clock";
+		clock-output-names = "dpll_core_ck";
 		clocks = <&sys_clkin>, <&dpll_core_byp_mux>;
 		reg = <0x0120>, <0x0124>, <0x012c>, <0x0128>;
 	};
@@ -182,12 +207,14 @@ dpll_core_ck: dpll_core_ck@120 {
 	dpll_core_x2_ck: dpll_core_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_core_x2_ck";
 		clocks = <&dpll_core_ck>;
 	};
 
 	dpll_core_h21x2_ck: dpll_core_h21x2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h21x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0150>;
@@ -197,6 +224,7 @@ dpll_core_h21x2_ck: dpll_core_h21x2_ck@150 {
 	c2c_fclk: c2c_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "c2c_fclk";
 		clocks = <&dpll_core_h21x2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -205,6 +233,7 @@ c2c_fclk: c2c_fclk {
 	c2c_iclk: c2c_iclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "c2c_iclk";
 		clocks = <&c2c_fclk>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -213,6 +242,7 @@ c2c_iclk: c2c_iclk {
 	dpll_core_h11x2_ck: dpll_core_h11x2_ck@138 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h11x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0138>;
@@ -222,6 +252,7 @@ dpll_core_h11x2_ck: dpll_core_h11x2_ck@138 {
 	dpll_core_h12x2_ck: dpll_core_h12x2_ck@13c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h12x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x013c>;
@@ -231,6 +262,7 @@ dpll_core_h12x2_ck: dpll_core_h12x2_ck@13c {
 	dpll_core_h13x2_ck: dpll_core_h13x2_ck@140 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h13x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0140>;
@@ -240,6 +272,7 @@ dpll_core_h13x2_ck: dpll_core_h13x2_ck@140 {
 	dpll_core_h14x2_ck: dpll_core_h14x2_ck@144 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h14x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0144>;
@@ -249,6 +282,7 @@ dpll_core_h14x2_ck: dpll_core_h14x2_ck@144 {
 	dpll_core_h22x2_ck: dpll_core_h22x2_ck@154 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h22x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0154>;
@@ -258,6 +292,7 @@ dpll_core_h22x2_ck: dpll_core_h22x2_ck@154 {
 	dpll_core_h23x2_ck: dpll_core_h23x2_ck@158 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h23x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0158>;
@@ -267,6 +302,7 @@ dpll_core_h23x2_ck: dpll_core_h23x2_ck@158 {
 	dpll_core_h24x2_ck: dpll_core_h24x2_ck@15c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_h24x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x015c>;
@@ -276,6 +312,7 @@ dpll_core_h24x2_ck: dpll_core_h24x2_ck@15c {
 	dpll_core_m2_ck: dpll_core_m2_ck@130 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m2_ck";
 		clocks = <&dpll_core_ck>;
 		ti,max-div = <31>;
 		reg = <0x0130>;
@@ -285,6 +322,7 @@ dpll_core_m2_ck: dpll_core_m2_ck@130 {
 	dpll_core_m3x2_ck: dpll_core_m3x2_ck@134 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m3x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0134>;
@@ -294,6 +332,7 @@ dpll_core_m3x2_ck: dpll_core_m3x2_ck@134 {
 	iva_dpll_hs_clk_div: iva_dpll_hs_clk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "iva_dpll_hs_clk_div";
 		clocks = <&dpll_core_h12x2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -302,6 +341,7 @@ iva_dpll_hs_clk_div: iva_dpll_hs_clk_div {
 	dpll_iva_byp_mux: dpll_iva_byp_mux@1ac {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "dpll_iva_byp_mux";
 		clocks = <&sys_clkin>, <&iva_dpll_hs_clk_div>;
 		ti,bit-shift = <23>;
 		reg = <0x01ac>;
@@ -310,6 +350,7 @@ dpll_iva_byp_mux: dpll_iva_byp_mux@1ac {
 	dpll_iva_ck: dpll_iva_ck@1a0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_iva_ck";
 		clocks = <&sys_clkin>, <&dpll_iva_byp_mux>;
 		reg = <0x01a0>, <0x01a4>, <0x01ac>, <0x01a8>;
 		assigned-clocks = <&dpll_iva_ck>;
@@ -319,12 +360,14 @@ dpll_iva_ck: dpll_iva_ck@1a0 {
 	dpll_iva_x2_ck: dpll_iva_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_iva_x2_ck";
 		clocks = <&dpll_iva_ck>;
 	};
 
 	dpll_iva_h11x2_ck: dpll_iva_h11x2_ck@1b8 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_iva_h11x2_ck";
 		clocks = <&dpll_iva_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x01b8>;
@@ -336,6 +379,7 @@ dpll_iva_h11x2_ck: dpll_iva_h11x2_ck@1b8 {
 	dpll_iva_h12x2_ck: dpll_iva_h12x2_ck@1bc {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_iva_h12x2_ck";
 		clocks = <&dpll_iva_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x01bc>;
@@ -347,6 +391,7 @@ dpll_iva_h12x2_ck: dpll_iva_h12x2_ck@1bc {
 	mpu_dpll_hs_clk_div: mpu_dpll_hs_clk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mpu_dpll_hs_clk_div";
 		clocks = <&dpll_core_h12x2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -355,6 +400,7 @@ mpu_dpll_hs_clk_div: mpu_dpll_hs_clk_div {
 	dpll_mpu_ck: dpll_mpu_ck@160 {
 		#clock-cells = <0>;
 		compatible = "ti,omap5-mpu-dpll-clock";
+		clock-output-names = "dpll_mpu_ck";
 		clocks = <&sys_clkin>, <&mpu_dpll_hs_clk_div>;
 		reg = <0x0160>, <0x0164>, <0x016c>, <0x0168>;
 	};
@@ -362,6 +408,7 @@ dpll_mpu_ck: dpll_mpu_ck@160 {
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_mpu_m2_ck";
 		clocks = <&dpll_mpu_ck>;
 		ti,max-div = <31>;
 		reg = <0x0170>;
@@ -371,6 +418,7 @@ dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
 	per_dpll_hs_clk_div: per_dpll_hs_clk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "per_dpll_hs_clk_div";
 		clocks = <&dpll_abe_m3x2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -379,6 +427,7 @@ per_dpll_hs_clk_div: per_dpll_hs_clk_div {
 	usb_dpll_hs_clk_div: usb_dpll_hs_clk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "usb_dpll_hs_clk_div";
 		clocks = <&dpll_abe_m3x2_ck>;
 		clock-mult = <1>;
 		clock-div = <3>;
@@ -387,6 +436,7 @@ usb_dpll_hs_clk_div: usb_dpll_hs_clk_div {
 	l3_iclk_div: l3_iclk_div@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "l3_iclk_div";
 		ti,max-div = <2>;
 		ti,bit-shift = <4>;
 		reg = <0x100>;
@@ -397,6 +447,7 @@ l3_iclk_div: l3_iclk_div@100 {
 	gpu_l3_iclk: gpu_l3_iclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "gpu_l3_iclk";
 		clocks = <&l3_iclk_div>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -405,6 +456,7 @@ gpu_l3_iclk: gpu_l3_iclk {
 	l4_root_clk_div: l4_root_clk_div@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "l4_root_clk_div";
 		ti,max-div = <2>;
 		ti,bit-shift = <8>;
 		reg = <0x100>;
@@ -415,6 +467,7 @@ l4_root_clk_div: l4_root_clk_div@100 {
 	slimbus1_slimbus_clk: slimbus1_slimbus_clk@560 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "slimbus1_slimbus_clk";
 		clocks = <&slimbus_clk>;
 		ti,bit-shift = <11>;
 		reg = <0x0560>;
@@ -423,6 +476,7 @@ slimbus1_slimbus_clk: slimbus1_slimbus_clk@560 {
 	aess_fclk: aess_fclk@528 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "aess_fclk";
 		clocks = <&abe_clk>;
 		ti,bit-shift = <24>;
 		ti,max-div = <2>;
@@ -432,6 +486,7 @@ aess_fclk: aess_fclk@528 {
 	mcasp_sync_mux_ck: mcasp_sync_mux_ck@540 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "mcasp_sync_mux_ck";
 		clocks = <&abe_24m_fclk>, <&dss_syc_gfclk_div>, <&func_24m_clk>;
 		ti,bit-shift = <26>;
 		reg = <0x0540>;
@@ -440,6 +495,7 @@ mcasp_sync_mux_ck: mcasp_sync_mux_ck@540 {
 	mcasp_gfclk: mcasp_gfclk@540 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "mcasp_gfclk";
 		clocks = <&mcasp_sync_mux_ck>, <&pad_clks_ck>, <&slimbus_clk>;
 		ti,bit-shift = <24>;
 		reg = <0x0540>;
@@ -448,6 +504,7 @@ mcasp_gfclk: mcasp_gfclk@540 {
 	dummy_ck: dummy_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "dummy_ck";
 		clock-frequency = <0>;
 	};
 };
@@ -455,6 +512,7 @@ &prm_clocks {
 	sys_clkin: sys_clkin@110 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "sys_clkin";
 		clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
 		reg = <0x0110>;
 		ti,index-starts-at-one;
@@ -463,6 +521,7 @@ sys_clkin: sys_clkin@110 {
 	abe_dpll_bypass_clk_mux: abe_dpll_bypass_clk_mux@108 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "abe_dpll_bypass_clk_mux";
 		clocks = <&sys_clkin>, <&sys_32k_ck>;
 		reg = <0x0108>;
 	};
@@ -470,6 +529,7 @@ abe_dpll_bypass_clk_mux: abe_dpll_bypass_clk_mux@108 {
 	abe_dpll_clk_mux: abe_dpll_clk_mux@10c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "abe_dpll_clk_mux";
 		clocks = <&sys_clkin>, <&sys_32k_ck>;
 		reg = <0x010c>;
 	};
@@ -477,6 +537,7 @@ abe_dpll_clk_mux: abe_dpll_clk_mux@10c {
 	custefuse_sys_gfclk_div: custefuse_sys_gfclk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "custefuse_sys_gfclk_div";
 		clocks = <&sys_clkin>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -485,6 +546,7 @@ custefuse_sys_gfclk_div: custefuse_sys_gfclk_div {
 	dss_syc_gfclk_div: dss_syc_gfclk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dss_syc_gfclk_div";
 		clocks = <&sys_clkin>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -493,6 +555,7 @@ dss_syc_gfclk_div: dss_syc_gfclk_div {
 	wkupaon_iclk_mux: wkupaon_iclk_mux@108 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "wkupaon_iclk_mux";
 		clocks = <&sys_clkin>, <&abe_lp_clk_div>;
 		reg = <0x0108>;
 	};
@@ -500,6 +563,7 @@ wkupaon_iclk_mux: wkupaon_iclk_mux@108 {
 	l3instr_ts_gclk_div: l3instr_ts_gclk_div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l3instr_ts_gclk_div";
 		clocks = <&wkupaon_iclk_mux>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -511,6 +575,7 @@ &cm_core_clocks {
 	dpll_per_byp_mux: dpll_per_byp_mux@14c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "dpll_per_byp_mux";
 		clocks = <&sys_clkin>, <&per_dpll_hs_clk_div>;
 		ti,bit-shift = <23>;
 		reg = <0x014c>;
@@ -519,6 +584,7 @@ dpll_per_byp_mux: dpll_per_byp_mux@14c {
 	dpll_per_ck: dpll_per_ck@140 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_per_ck";
 		clocks = <&sys_clkin>, <&dpll_per_byp_mux>;
 		reg = <0x0140>, <0x0144>, <0x014c>, <0x0148>;
 	};
@@ -526,12 +592,14 @@ dpll_per_ck: dpll_per_ck@140 {
 	dpll_per_x2_ck: dpll_per_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_per_x2_ck";
 		clocks = <&dpll_per_ck>;
 	};
 
 	dpll_per_h11x2_ck: dpll_per_h11x2_ck@158 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_h11x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0158>;
@@ -541,6 +609,7 @@ dpll_per_h11x2_ck: dpll_per_h11x2_ck@158 {
 	dpll_per_h12x2_ck: dpll_per_h12x2_ck@15c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_h12x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x015c>;
@@ -550,6 +619,7 @@ dpll_per_h12x2_ck: dpll_per_h12x2_ck@15c {
 	dpll_per_h14x2_ck: dpll_per_h14x2_ck@164 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_h14x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <63>;
 		reg = <0x0164>;
@@ -559,6 +629,7 @@ dpll_per_h14x2_ck: dpll_per_h14x2_ck@164 {
 	dpll_per_m2_ck: dpll_per_m2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2_ck";
 		clocks = <&dpll_per_ck>;
 		ti,max-div = <31>;
 		reg = <0x0150>;
@@ -568,6 +639,7 @@ dpll_per_m2_ck: dpll_per_m2_ck@150 {
 	dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0150>;
@@ -577,6 +649,7 @@ dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
 	dpll_per_m3x2_ck: dpll_per_m3x2_ck@154 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m3x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0154>;
@@ -586,6 +659,7 @@ dpll_per_m3x2_ck: dpll_per_m3x2_ck@154 {
 	dpll_unipro1_ck: dpll_unipro1_ck@200 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_unipro1_ck";
 		clocks = <&sys_clkin>, <&sys_clkin>;
 		reg = <0x0200>, <0x0204>, <0x020c>, <0x0208>;
 	};
@@ -593,6 +667,7 @@ dpll_unipro1_ck: dpll_unipro1_ck@200 {
 	dpll_unipro1_clkdcoldo: dpll_unipro1_clkdcoldo {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_unipro1_clkdcoldo";
 		clocks = <&dpll_unipro1_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -601,6 +676,7 @@ dpll_unipro1_clkdcoldo: dpll_unipro1_clkdcoldo {
 	dpll_unipro1_m2_ck: dpll_unipro1_m2_ck@210 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_unipro1_m2_ck";
 		clocks = <&dpll_unipro1_ck>;
 		ti,max-div = <127>;
 		reg = <0x0210>;
@@ -610,6 +686,7 @@ dpll_unipro1_m2_ck: dpll_unipro1_m2_ck@210 {
 	dpll_unipro2_ck: dpll_unipro2_ck@1c0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_unipro2_ck";
 		clocks = <&sys_clkin>, <&sys_clkin>;
 		reg = <0x01c0>, <0x01c4>, <0x01cc>, <0x01c8>;
 	};
@@ -617,6 +694,7 @@ dpll_unipro2_ck: dpll_unipro2_ck@1c0 {
 	dpll_unipro2_clkdcoldo: dpll_unipro2_clkdcoldo {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_unipro2_clkdcoldo";
 		clocks = <&dpll_unipro2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -625,6 +703,7 @@ dpll_unipro2_clkdcoldo: dpll_unipro2_clkdcoldo {
 	dpll_unipro2_m2_ck: dpll_unipro2_m2_ck@1d0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_unipro2_m2_ck";
 		clocks = <&dpll_unipro2_ck>;
 		ti,max-div = <127>;
 		reg = <0x01d0>;
@@ -634,6 +713,7 @@ dpll_unipro2_m2_ck: dpll_unipro2_m2_ck@1d0 {
 	dpll_usb_byp_mux: dpll_usb_byp_mux@18c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "dpll_usb_byp_mux";
 		clocks = <&sys_clkin>, <&usb_dpll_hs_clk_div>;
 		ti,bit-shift = <23>;
 		reg = <0x018c>;
@@ -642,6 +722,7 @@ dpll_usb_byp_mux: dpll_usb_byp_mux@18c {
 	dpll_usb_ck: dpll_usb_ck@180 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-j-type-clock";
+		clock-output-names = "dpll_usb_ck";
 		clocks = <&sys_clkin>, <&dpll_usb_byp_mux>;
 		reg = <0x0180>, <0x0184>, <0x018c>, <0x0188>;
 	};
@@ -649,6 +730,7 @@ dpll_usb_ck: dpll_usb_ck@180 {
 	dpll_usb_clkdcoldo: dpll_usb_clkdcoldo {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_usb_clkdcoldo";
 		clocks = <&dpll_usb_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -657,6 +739,7 @@ dpll_usb_clkdcoldo: dpll_usb_clkdcoldo {
 	dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_usb_m2_ck";
 		clocks = <&dpll_usb_ck>;
 		ti,max-div = <127>;
 		reg = <0x0190>;
@@ -666,6 +749,7 @@ dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
 	func_128m_clk: func_128m_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_128m_clk";
 		clocks = <&dpll_per_h11x2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -674,6 +758,7 @@ func_128m_clk: func_128m_clk {
 	func_12m_fclk: func_12m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_12m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <16>;
@@ -682,6 +767,7 @@ func_12m_fclk: func_12m_fclk {
 	func_24m_clk: func_24m_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_24m_clk";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
@@ -690,6 +776,7 @@ func_24m_clk: func_24m_clk {
 	func_48m_fclk: func_48m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_48m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
@@ -698,6 +785,7 @@ func_48m_fclk: func_48m_fclk {
 	func_96m_fclk: func_96m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_96m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -706,6 +794,7 @@ func_96m_fclk: func_96m_fclk {
 	l3init_60m_fclk: l3init_60m_fclk@104 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "l3init_60m_fclk";
 		clocks = <&dpll_usb_m2_ck>;
 		reg = <0x0104>;
 		ti,dividers = <1>, <8>;
@@ -714,6 +803,7 @@ l3init_60m_fclk: l3init_60m_fclk@104 {
 	iss_ctrlclk: iss_ctrlclk@1320 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "iss_ctrlclk";
 		clocks = <&func_96m_fclk>;
 		ti,bit-shift = <8>;
 		reg = <0x1320>;
@@ -722,6 +812,7 @@ iss_ctrlclk: iss_ctrlclk@1320 {
 	lli_txphy_clk: lli_txphy_clk@f20 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "lli_txphy_clk";
 		clocks = <&dpll_unipro1_clkdcoldo>;
 		ti,bit-shift = <8>;
 		reg = <0x0f20>;
@@ -730,6 +821,7 @@ lli_txphy_clk: lli_txphy_clk@f20 {
 	lli_txphy_ls_clk: lli_txphy_ls_clk@f20 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "lli_txphy_ls_clk";
 		clocks = <&dpll_unipro1_m2_ck>;
 		ti,bit-shift = <9>;
 		reg = <0x0f20>;
@@ -738,6 +830,7 @@ lli_txphy_ls_clk: lli_txphy_ls_clk@f20 {
 	usb_phy_cm_clk32k: usb_phy_cm_clk32k@640 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usb_phy_cm_clk32k";
 		clocks = <&sys_32k_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0640>;
@@ -746,6 +839,7 @@ usb_phy_cm_clk32k: usb_phy_cm_clk32k@640 {
 	fdif_fclk: fdif_fclk@1328 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "fdif_fclk";
 		clocks = <&dpll_per_h11x2_ck>;
 		ti,bit-shift = <24>;
 		ti,max-div = <2>;
@@ -755,6 +849,7 @@ fdif_fclk: fdif_fclk@1328 {
 	gpu_core_gclk_mux: gpu_core_gclk_mux@1520 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "gpu_core_gclk_mux";
 		clocks = <&dpll_core_h14x2_ck>, <&dpll_per_h14x2_ck>;
 		ti,bit-shift = <24>;
 		reg = <0x1520>;
@@ -763,6 +858,7 @@ gpu_core_gclk_mux: gpu_core_gclk_mux@1520 {
 	gpu_hyd_gclk_mux: gpu_hyd_gclk_mux@1520 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "gpu_hyd_gclk_mux";
 		clocks = <&dpll_core_h14x2_ck>, <&dpll_per_h14x2_ck>;
 		ti,bit-shift = <25>;
 		reg = <0x1520>;
@@ -771,6 +867,7 @@ gpu_hyd_gclk_mux: gpu_hyd_gclk_mux@1520 {
 	hsi_fclk: hsi_fclk@1638 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "hsi_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		ti,bit-shift = <24>;
 		ti,max-div = <2>;
@@ -781,6 +878,7 @@ hsi_fclk: hsi_fclk@1638 {
 &cm_core_clockdomains {
 	l3init_clkdm: l3init_clkdm {
 		compatible = "ti,clockdomain";
+		clock-output-names = "l3init_clkdm";
 		clocks = <&dpll_usb_ck>;
 	};
 };
@@ -789,6 +887,7 @@ &scrm_clocks {
 	auxclk0_src_gate_ck: auxclk0_src_gate_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk0_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0310>;
@@ -797,6 +896,7 @@ auxclk0_src_gate_ck: auxclk0_src_gate_ck@310 {
 	auxclk0_src_mux_ck: auxclk0_src_mux_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk0_src_mux_ck";
 		clocks = <&sys_clkin>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0310>;
@@ -805,12 +905,14 @@ auxclk0_src_mux_ck: auxclk0_src_mux_ck@310 {
 	auxclk0_src_ck: auxclk0_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk0_src_ck";
 		clocks = <&auxclk0_src_gate_ck>, <&auxclk0_src_mux_ck>;
 	};
 
 	auxclk0_ck: auxclk0_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk0_ck";
 		clocks = <&auxclk0_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -820,6 +922,7 @@ auxclk0_ck: auxclk0_ck@310 {
 	auxclk1_src_gate_ck: auxclk1_src_gate_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk1_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0314>;
@@ -828,6 +931,7 @@ auxclk1_src_gate_ck: auxclk1_src_gate_ck@314 {
 	auxclk1_src_mux_ck: auxclk1_src_mux_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk1_src_mux_ck";
 		clocks = <&sys_clkin>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0314>;
@@ -836,12 +940,14 @@ auxclk1_src_mux_ck: auxclk1_src_mux_ck@314 {
 	auxclk1_src_ck: auxclk1_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk1_src_ck";
 		clocks = <&auxclk1_src_gate_ck>, <&auxclk1_src_mux_ck>;
 	};
 
 	auxclk1_ck: auxclk1_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk1_ck";
 		clocks = <&auxclk1_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -851,6 +957,7 @@ auxclk1_ck: auxclk1_ck@314 {
 	auxclk2_src_gate_ck: auxclk2_src_gate_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk2_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0318>;
@@ -859,6 +966,7 @@ auxclk2_src_gate_ck: auxclk2_src_gate_ck@318 {
 	auxclk2_src_mux_ck: auxclk2_src_mux_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk2_src_mux_ck";
 		clocks = <&sys_clkin>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0318>;
@@ -867,12 +975,14 @@ auxclk2_src_mux_ck: auxclk2_src_mux_ck@318 {
 	auxclk2_src_ck: auxclk2_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk2_src_ck";
 		clocks = <&auxclk2_src_gate_ck>, <&auxclk2_src_mux_ck>;
 	};
 
 	auxclk2_ck: auxclk2_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk2_ck";
 		clocks = <&auxclk2_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -882,6 +992,7 @@ auxclk2_ck: auxclk2_ck@318 {
 	auxclk3_src_gate_ck: auxclk3_src_gate_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk3_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x031c>;
@@ -890,6 +1001,7 @@ auxclk3_src_gate_ck: auxclk3_src_gate_ck@31c {
 	auxclk3_src_mux_ck: auxclk3_src_mux_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk3_src_mux_ck";
 		clocks = <&sys_clkin>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x031c>;
@@ -898,12 +1010,14 @@ auxclk3_src_mux_ck: auxclk3_src_mux_ck@31c {
 	auxclk3_src_ck: auxclk3_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk3_src_ck";
 		clocks = <&auxclk3_src_gate_ck>, <&auxclk3_src_mux_ck>;
 	};
 
 	auxclk3_ck: auxclk3_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk3_ck";
 		clocks = <&auxclk3_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -913,6 +1027,7 @@ auxclk3_ck: auxclk3_ck@31c {
 	auxclk4_src_gate_ck: auxclk4_src_gate_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk4_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0320>;
@@ -921,6 +1036,7 @@ auxclk4_src_gate_ck: auxclk4_src_gate_ck@320 {
 	auxclk4_src_mux_ck: auxclk4_src_mux_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk4_src_mux_ck";
 		clocks = <&sys_clkin>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0320>;
@@ -929,12 +1045,14 @@ auxclk4_src_mux_ck: auxclk4_src_mux_ck@320 {
 	auxclk4_src_ck: auxclk4_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk4_src_ck";
 		clocks = <&auxclk4_src_gate_ck>, <&auxclk4_src_mux_ck>;
 	};
 
 	auxclk4_ck: auxclk4_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk4_ck";
 		clocks = <&auxclk4_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -944,6 +1062,7 @@ auxclk4_ck: auxclk4_ck@320 {
 	auxclkreq0_ck: auxclkreq0_ck@210 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq0_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0210>;
@@ -952,6 +1071,7 @@ auxclkreq0_ck: auxclkreq0_ck@210 {
 	auxclkreq1_ck: auxclkreq1_ck@214 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq1_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0214>;
@@ -960,6 +1080,7 @@ auxclkreq1_ck: auxclkreq1_ck@214 {
 	auxclkreq2_ck: auxclkreq2_ck@218 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq2_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0218>;
@@ -968,6 +1089,7 @@ auxclkreq2_ck: auxclkreq2_ck@218 {
 	auxclkreq3_ck: auxclkreq3_ck@21c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq3_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x021c>;
@@ -977,6 +1099,7 @@ auxclkreq3_ck: auxclkreq3_ck@21c {
 &cm_core_aon {
 	mpu_cm: mpu_cm@300 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "mpu_cm";
 		reg = <0x300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -984,6 +1107,7 @@ mpu_cm: mpu_cm@300 {
 
 		mpu_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "mpu_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -991,6 +1115,7 @@ mpu_clkctrl: clk@20 {
 
 	dsp_cm: dsp_cm@400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "dsp_cm";
 		reg = <0x400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -998,6 +1123,7 @@ dsp_cm: dsp_cm@400 {
 
 		dsp_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "dsp_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1005,6 +1131,7 @@ dsp_clkctrl: clk@20 {
 
 	abe_cm: abe_cm@500 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "abe_cm";
 		reg = <0x500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1012,6 +1139,7 @@ abe_cm: abe_cm@500 {
 
 		abe_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "abe_clkctrl";
 			reg = <0x20 0x64>;
 			#clock-cells = <2>;
 		};
@@ -1022,6 +1150,7 @@ abe_clkctrl: clk@20 {
 &cm_core {
 	l3main1_cm: l3main1_cm@700 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3main1_cm";
 		reg = <0x700 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1029,6 +1158,7 @@ l3main1_cm: l3main1_cm@700 {
 
 		l3main1_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3main1_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1036,6 +1166,7 @@ l3main1_clkctrl: clk@20 {
 
 	l3main2_cm: l3main2_cm@800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3main2_cm";
 		reg = <0x800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1043,6 +1174,7 @@ l3main2_cm: l3main2_cm@800 {
 
 		l3main2_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3main2_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1050,6 +1182,7 @@ l3main2_clkctrl: clk@20 {
 
 	ipu_cm: ipu_cm@900 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "ipu_cm";
 		reg = <0x900 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1057,6 +1190,7 @@ ipu_cm: ipu_cm@900 {
 
 		ipu_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "ipu_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1064,6 +1198,7 @@ ipu_clkctrl: clk@20 {
 
 	dma_cm: dma_cm@a00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "dma_cm";
 		reg = <0xa00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1071,6 +1206,7 @@ dma_cm: dma_cm@a00 {
 
 		dma_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "dma_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1078,6 +1214,7 @@ dma_clkctrl: clk@20 {
 
 	emif_cm: emif_cm@b00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "emif_cm";
 		reg = <0xb00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1085,6 +1222,7 @@ emif_cm: emif_cm@b00 {
 
 		emif_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "emif_clkctrl";
 			reg = <0x20 0x1c>;
 			#clock-cells = <2>;
 		};
@@ -1092,6 +1230,7 @@ emif_clkctrl: clk@20 {
 
 	l4cfg_cm: l4cfg_cm@d00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4cfg_cm";
 		reg = <0xd00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1099,6 +1238,7 @@ l4cfg_cm: l4cfg_cm@d00 {
 
 		l4cfg_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4cfg_clkctrl";
 			reg = <0x20 0x14>;
 			#clock-cells = <2>;
 		};
@@ -1106,6 +1246,7 @@ l4cfg_clkctrl: clk@20 {
 
 	l3instr_cm: l3instr_cm@e00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3instr_cm";
 		reg = <0xe00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1113,6 +1254,7 @@ l3instr_cm: l3instr_cm@e00 {
 
 		l3instr_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3instr_clkctrl";
 			reg = <0x20 0xc>;
 			#clock-cells = <2>;
 		};
@@ -1120,6 +1262,7 @@ l3instr_clkctrl: clk@20 {
 
 	l4per_cm: l4per_cm@1000 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4per_cm";
 		reg = <0x1000 0x200>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1140,6 +1283,7 @@ l4sec_clkctrl: clock@1a0 {
 
 	dss_cm: dss_cm@1400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "dss_cm";
 		reg = <0x1400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1147,6 +1291,7 @@ dss_cm: dss_cm@1400 {
 
 		dss_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "dss_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1154,6 +1299,7 @@ dss_clkctrl: clk@20 {
 
 	gpu_cm: gpu_cm@1500 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "gpu_cm";
 		reg = <0x1500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1161,6 +1307,7 @@ gpu_cm: gpu_cm@1500 {
 
 		gpu_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "gpu_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1168,6 +1315,7 @@ gpu_clkctrl: clk@20 {
 
 	l3init_cm: l3init_cm@1600 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3init_cm";
 		reg = <0x1600 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1175,6 +1323,7 @@ l3init_cm: l3init_cm@1600 {
 
 		l3init_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3init_clkctrl";
 			reg = <0x20 0xd4>;
 			#clock-cells = <2>;
 		};
@@ -1184,6 +1333,7 @@ l3init_clkctrl: clk@20 {
 &prm {
 	wkupaon_cm: wkupaon_cm@1900 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "wkupaon_cm";
 		reg = <0x1900 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1191,6 +1341,7 @@ wkupaon_cm: wkupaon_cm@1900 {
 
 		wkupaon_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "wkupaon_clkctrl";
 			reg = <0x20 0x5c>;
 			#clock-cells = <2>;
 		};
@@ -1201,6 +1352,7 @@ &scm_wkup_pad_conf_clocks {
 	fref_xtal_ck: fref_xtal_ck {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "fref_xtal_ck";
 		clocks = <&sys_clkin>;
 		ti,bit-shift = <28>;
 		reg = <0x14>;
-- 
2.35.1

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D88B56527
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jun 2019 11:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfFZJHJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jun 2019 05:07:09 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:55857 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbfFZJGx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:53 -0400
Received: by mail-wm1-f45.google.com with SMTP id a15so1245127wmj.5
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
        b=J0NS7bRqNS0ZD9B+lSRFe4le6yXmNDFrR2upnXhCDY5C4V5LEnqtg1cGQuQwS/EfnD
         JfBSP+JFXSv+TxAihAgDuOJ02RCAacyf9xthx/r/0gVK7VHp1Q04mqoWqz115l6wz4Tg
         5GGeO1VgatZQvjZPxf+PVdabu+FbJrVvSUBdqNy9zrDeawHHyO/pVOI5wRdj/WLlb52Z
         vGA4sx71G+qwn4y8vzoNOair6gePijN4Ipj26Q7+3GBKbpugvF352+RtX/+yEKIix+aR
         njX6Hbjb2DLxusCypboZqfZLYqU3j5VNpolmTezfmqzgcp1IoFoBjpPc8cvBUIS9n3Cz
         sUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
        b=VP8OBCI/TFzM1JTILklzmrkSHzxr8M0goC8WSpPVqXl3joqVlWIWpXyVfvNn0gtr62
         18oSvusSAhmtE25kibj9ETJC3JGRJPEqpFYvQy5FStDD0X6a5v5EMo5CI1xqjZBUCYaV
         nDd6czTZoyPhW2XUfjjMXUvqj+wygtXbkrAKW6n+PFHmhdPGt82A43pZ5zgy7Imc8VXB
         GxZhQv/44WptIL7alVZOX0GugbCn31osAtqf9UYzzrUAJCWv0ASDvAcaTTGeYymX+vdZ
         Zk9iOHOUL8Hu7t8w67gWrwbZU0TyO1Ka5mMxRxthw9m7Oo9MMedFi/OgBZHF1BVVIN/Q
         xh/w==
X-Gm-Message-State: APjAAAU+UyEkVbeuuPMS4fxlxju5326aSuCf9NS+Iu/xwavSZN9tG/uL
        yGaljrQjLKQHH1APCYTNrQDVJQ==
X-Google-Smtp-Source: APXvYqwxDozI/FKA1vAkTzJa0CO5JhJdf4H6DJgUxSxrWePq7VprAaD6psUV7Ud7fw3drOIzxbfu8g==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr1887295wme.12.1561540011512;
        Wed, 26 Jun 2019 02:06:51 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:50 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
Date:   Wed, 26 Jun 2019 11:06:32 +0200
Message-Id: <20190626090632.7540-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DVFS for the Odroid-N2 by setting the clock, OPP and supply
for each cores of each CPU clusters.

The first cluster uses the "VDDCPU_B" power supply, and the second
cluster uses the "VDDCPU_A" power supply.

Each power supply can achieve 0.73V to 1.01V using 2 distinct PWM
outputs clocked at 800KHz with an inverse duty-cycle.

DVFS has been tested by running the arm64 cpuburn at [1] and cycling
between all the possible cpufreq translations of each cluster and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index c3e0735e6d9f..0db1547bfb5a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -114,6 +114,44 @@
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_ab 0 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * Silergy SY8120B1ABC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	hub_5v: regulator-hub_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HUB_5V";
@@ -245,6 +283,48 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu100 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu101 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu102 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu103 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */	
@@ -308,6 +388,22 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ab {
+	pinctrl-0 = <&pwm_a_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.21.0


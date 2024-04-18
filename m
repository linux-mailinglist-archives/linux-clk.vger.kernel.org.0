Return-Path: <linux-clk+bounces-6135-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11428A9CD6
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 16:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0465B26D7D
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 14:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657D7172BCA;
	Thu, 18 Apr 2024 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t77N9LHx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD19171E5A
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449861; cv=none; b=FzH3wo7AHsZWYX+P5coHmsd4DTCQLRQlwAQvrbGGeANl/rtONn54rkxn0/PFVdjh+WYcx1pVCpIBL+u05mwarNJ/ztCPNKG0bCkRik34iXf3bjWb4KNlmGyEIpkTsfv7EYMO32p8QWI9Mn2VfdgEFiyOkGDcSRFUz5eiHyvIRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449861; c=relaxed/simple;
	bh=7BtbvWn/1WLef8Gz6HxaX5K+etTb0ncuoq9W1NCXqak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MawdMKk0fEbY7lqQ+NJUhoLmn+LmeEFMYfQrD0wSkhSmJNBew4a0NJsVgTW94CqMP34PagaMAbD2O47KNtJ7sipYfMC6P7FVLGdUyqhGkqGMjMddu5hrwIjHnZGK0G9kJ5AiIBb75SDqJ6F48T2BnRCwKQxEb86lp1FR00YC9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t77N9LHx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-346406a5fb9so702204f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449858; x=1714054658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=;
        b=t77N9LHxdYW1KjAj54HNZ54Loing92ykGfYsrKJ3QNsVqPEg8rpvaSVRJlUwSIXQZ6
         nK4fE5Itf0Hk73KmNdnqgBeH/WhKx2sE3gC6G9Q/QrcwoL6hRBNDZt5wwaPrhOzZtxLp
         WlGWeYskIikj3pL9BrbbpjO6R4R6VnyxZmodXIjZIxKXG5yJSZ0QzbDVh3rr4khF4N87
         41lltGhtSV8CDfKKqRjwBGsnrCwplXm55XwPGSoLRoY5fBbcfZ96jR1FeZOLwhjD1Er0
         ZDkUW84knNlawWd3Tw2iP7UT+7SxhfFr1AesE4MEboobc4YwqhBeO8WX+mL+LnuQ82Xk
         /7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449858; x=1714054658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=;
        b=IRmoxG9tKtbNK74FZ+NpIV/Jzz6gf2qovHdL/H0TTpqWug5P7ShCsH+2Md+kKa7HSV
         UawhuyQuAohIwuYyZPcK6G55wkMWlqcbI54UsIS/xQZLxAG3bQtwu6mUBEVHB2wJJ9dZ
         XkWLIPYoi19gMyTQFfgqXV2SQM2qH9rGa16PhaWFFtrwlfRoxKz2a3vx6xAbyXxAQ8hx
         lzm3nwDRR/GuLutfekIp2E8x1LNkpxlDpa2oJvsB9DTqolOxqMLktSpcwT1OTwZq3jJh
         7PVRGMYTamsdxF7YqQtsCPneeAZUNVDYqP3xoHnkqKL5sQ7q5kvbD6oSvQYl02QndpEB
         J5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWaRGgj3pW92tL/54k+OTkj46YIONRJTsxthQHe5bTkE3RgOnhJ7nZWt6bOeHVT+3M2Vwnu/7ZpRdHYJBeH5II01EcPHEJzlgxq
X-Gm-Message-State: AOJu0YxrfCcX+F0mkqkQyqw0bKMYrCtiR1LZZjf9uG0mfYqvbmoIytA6
	7MJzuIbUhgX/Na/DvJlyQ6GingEyQNe9HYSqUEBREij6ODXbJCHete8HEeF8n2g=
X-Google-Smtp-Source: AGHT+IEU/vGe7iKZX75StE6zV/YVZi9beeEUMWK/cihBcPSqLnKclRzqeY7lx/4gLXX5NVON66alWw==
X-Received: by 2002:a5d:560e:0:b0:34a:6be:6565 with SMTP id l14-20020a5d560e000000b0034a06be6565mr1567571wrv.64.1713449857877;
        Thu, 18 Apr 2024 07:17:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:05 +0200
Subject: [PATCH v3 17/17] arm64: dts: mediatek: add display support for
 mt8365-evk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-17-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5974; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7BtbvWn/1WLef8Gz6HxaX5K+etTb0ncuoq9W1NCXqak=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjLgW3EAk32znYUVI1ZaO0Xua5lmE2DEFI+Qdh
 8LCDdASJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURSngEA
 Ch/ENx3t4Ig79YfihJ3EREr6shdqqEyaJN/2srC67mJJOLMNsqAE6RVsiENe/Yv/xh6QKuRwpbZmOs
 kB64M2L/9cYH1TdjKz0nCzouFeg31PFSNyW/CIpLctTSgqnpoV9yLQgUj1hDn3QRxvVmdZYjxePTAS
 qd/m0yDFqJxV58o0+WPSUx4af/If+zvo9jQF0ouC30IVzXAbsZ+98uiqpUb0kfHT5zey4mbL9SRW/O
 bTs5UxtgZCBs/4I/gZwqFoLQfWBjDL18Qhjg39RyXRi9PnumSIn0TvxDV76EWvvE1xU5Y16RBebxVr
 vSK1Sk7gc6K8WiIU/2I8TyUJUS4wLQyGuZbvqcmg0sBwJnVcOBObz4e3WscNROfpZpnTKPxaMT+k4y
 NVenlRTtisW7id6oH9jwt0y7MHbdqqzmSQEc3RPpKbdsk2ETLaIqQIGlp1e81HxAsQBwR1MLeg3OQW
 2S+ymgH4RyjSeL/1BQTt1OOCK6MPHaizS6W8ZaBcHG7PID6ec0K+8o3EDtHf1ZV08kIUHQEqQgyvJM
 Hg81/kyHax7kmUIY0dxKwV/66aoLXkw2rjFQqm+D5job+Ijra0/OyoDEVHYZZ5n7xXRgh9z30HP2y8
 bqnayBKJ6L/pgZoZv3Qlqb0CFswo2bv5WGGho08yodYcr20GP1pKqqFf3cCw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 180 ++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..1aa3426f561b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -26,6 +26,18 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -86,6 +98,55 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	port {
+		dsi_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &cpu0 {
@@ -138,6 +199,50 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		#sound-dai-cells = <0>;
+		compatible = "ite,it66121";
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reg = <0x4c>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				it66121_in: endpoint {
+					bus-width = <12>;
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -180,7 +285,55 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -222,6 +375,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;

-- 
2.25.1



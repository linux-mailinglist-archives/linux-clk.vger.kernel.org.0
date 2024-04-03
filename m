Return-Path: <linux-clk+bounces-5365-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B4896710
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 09:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 984A9B27F8E
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 07:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00205C90F;
	Wed,  3 Apr 2024 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTcp9PdT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56396CDBA
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712130410; cv=none; b=g/VUBXlzAu/7G+2rKk27/ZaRsDwvdt3biizw99mPe4Tway+4QbBLpCyhn7wB8AyaxTeAtVyT8KKbwLbXdsOuP7z1mu8E03xTve2iyUNHh2itcLE2AAL036imHAu7k8vxrAwkbTt8n6hamvKE0niwISk9xFSMuF/SP0iJUjF1Da0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712130410; c=relaxed/simple;
	bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwDPsOkdsJjAFQaCt5iwXEWy2bwigm7FLqlxAxBRT9sFmiNlDpqMKZKMr1AOmlqm6N0CAxyCbmW48md4r5UGYSMNGOXkIbnAQwKqhrOfLc8f/jMmr4ESHTyCHkRo7hfjDiB5z3D2Y1yNYyKCqgNE6AfPdveUy+sm21COnHbubFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTcp9PdT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3416a975840so4576825f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130407; x=1712735207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=iTcp9PdTpPtI6MCPDbtOwsWjg9FrHeVCmMDRC7DPhWGvtKKQwbnWkUNsFZU2EaZX0f
         6CCTXbDX+kunD8qyovqM87pyGwnCA3uNz9sY1f6GFIUjqmuPgfGLQySMYSPzl4CZ5+If
         kWohxGGDBNznv9dftSbEz9HVv9IGiDLI5NjUoSfY2Hf66lAxxBPW7MUfMU/iNamzjC7v
         Wmea+N7Qc5igyTyagSxFWuUPb9Q4ZI1w2K0gmpNpMbsAw3PyZPPyNbVo0z+PIWjRRLon
         D4WqWFOCaUYduCDg5SLcjt32iqrxrVxBlfzWbLRyDDxbdv7A8OErbEeqZqAZXzRNU8fr
         fBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130407; x=1712735207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=ueGJb/uFlki1BHhp+cmiL8lAxRjoc/MbnLXpAom1PIPGUKaGMnrjkBC19zlBbnESdn
         9L36GlUpmmVRkgX2NLYKXaiCrudr31yJlEm9JMZ/s5GNyMD2/+ZSK/JcKH7hs/3il3hD
         pyE53RoJAZXETsP3X8hQI5fCkV7zlbrDaN2UQOd5/p2mOeGvqXGqEJ1WgZ/0W2/YVXRB
         JgMZip610ZZCCkEUlIOWs21WfQ1zgjeliBRSzfYs+WkQSLHvXjJUsb2kUD3EXjZ5oQd0
         rCB84o62ENXiV/XFtHJQ9rh8Vn+TJY4Et70FY9B9DBT+tSmJlAp1s8lgMcdksStqiZbB
         d5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVw90Zz4J48YYEINKUloOSqTIIB4UKkguYseCED4ohjOQbBBUbKvNjj0w7Gsfxio20+KALp/AdoXbd/RfNsVEBGaO6blw31mxB2
X-Gm-Message-State: AOJu0YxxsOjwRd9a+kiY4TRx9pzrsWOS+Epu3Y31IFxiQ7NF2GJW8L/K
	3FOjcIvkZz/7e8vwnVzrqMqoXerjmJePVza59jLsXWAgZw17+hiRxg6f0UA9BeM=
X-Google-Smtp-Source: AGHT+IGjU+lZi926IGYs70wrtPeJ0AhqDJygL7VcXx4pKvMiavGn02G8DNEATWdaZ39B2zUBl42zVw==
X-Received: by 2002:a5d:4ac6:0:b0:343:9884:2fe1 with SMTP id y6-20020a5d4ac6000000b0034398842fe1mr531968wrs.68.1712130407112;
        Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:36 +0200
Subject: [PATCH v12 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-5-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQleCJepZTdvsH5P04FFdj5scoQuo3RrkBu/7LtR
 ovFVFJKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXgAKCRB33NvayMhJ0awCD/
 4lGsqK7ZBrrsYwndwe68AzeslZJrfHIBwgArd/EZLEm4uE0Mimp8KnfGmCjHpv2dh53lDPDO4OyUXW
 TyjZKDngAKfl3cik04pPAisgFPXN1rt4snRJjOwmP6Qdrw00FM3DMJF56wcmsSarNKGCJuP5zEaxrx
 WTxsLsw39sem9jlgmn9lQP3NBr894+saWYaNnihjRjbD28uTZV63ixGtqRZAX0Uv+dr0G60tvufHXx
 aM+lm6S6v/T89y5euV7BUzGniPrwT3gbjnKvtTIZqJDC/V/wdJ2mb+SfXY0M4w5qgjduBycvJGoGVH
 DVEhJrncCQ1+d8MWAg41VRTzaLGhgfAu1bzWlrOTnP6LWtGAOUVGAWv/da/PYg1HvgvFWQBUPfCHsz
 5aGscOZ8fAPd9DbkEdpW/Hzh2o1TZ3lBJtD/8q0I1TWwEar+co7t25cHPCrcwK1+UoKTaKGwXzbZ7L
 a87Eosy6L3qVChDGjEc5phAj+kTuVae4lVMjJIQiqAZvZsu+6uTZWY49N6g+jYg5n/Z/OsYnNHH5Qy
 oIM/jTwrHykmI9Ay1BR4RRMyk8yciDWmwpwiQxhuaEyRgBXlLkB3C218gFvjV+38kwRb0e81xonfox
 Vl/6+llHRMSy5eR48w4NWI9EDM96hxPfPJyDqbo17HxPpInbEPQUiLqFfLXQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9d5eab6595d0..b058ed78faf0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1663,9 +1663,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2152,6 +2171,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2189,6 +2217,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit", "px";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1



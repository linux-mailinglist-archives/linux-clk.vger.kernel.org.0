Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C62F743FC7
	for <lists+linux-clk@lfdr.de>; Fri, 30 Jun 2023 18:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbjF3Q3n (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Jun 2023 12:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbjF3Q3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 12:29:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E137C3C29
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:27 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so12737615e9.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142566; x=1690734566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=FMMaaVIczRbZN8SKA6J+30ZFKoazIu5NC0oiq3Q0ClUKAvEoWt9mMIZiOdmwBajbOu
         307ahCyBT5fn3fYQ07vMbq0vz2qyRKHYnzzmRhoM06KNXLx9FzgEmOAOfd8ApeGNLkeG
         8gHgMyhYf+28qDgn4ekUQNSHFZOlPUismy15ZpvHNTiMHSKeqXtHPuVi4cpwFk6dVWcg
         zFsGZhuQ/gb0mHxFx40KSN5OGO9WemmZXGHPIRoQKVpA6sjLSYLBddN61I3dKDIaGsbz
         2xp85rygEzhhcpHeIxJKEHTzfs+cgcRT0ayifZZ3D28A7X9NuFxoxhar5GLyRrt4Trst
         rjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142566; x=1690734566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=knFDmOcATnfVUtD7Te5xocxs9pD2idmIXD8WcN3bVN9hVsvxEBtfuUYsSPVr4WjMCY
         uheDPh7XrQH/06iUPvpINfKqpGkm6KYUNZH4N3YcwmZUnVw5tqqpxTyq6oWLn5Oj2X2+
         SREDwXzEWo6CkuSa3HDQkOFjnFW2LAMCG9GwuOYfRCxJaeS3bdNNqjxkubz5p/x7qdtf
         8aJtLf63swEbT50ehfxQxxDJwtNT4zcByCsmij9+34x2Vzme4bQjryMBLklSWD0rXjVO
         Ixc4ZZyTloxs/C+OxJZI0q3TuoXIXyQPftTKujxiVVnv7JbvhrgrwD0pTz6WE1h297OV
         rAzQ==
X-Gm-Message-State: ABy/qLZsIgpGDgL0Luw2byygG8kHyAqmLiJ/ceNAyO93wTCZmtNguA2u
        Hu+r1HoC1E/fW/uZLp85U+db/w==
X-Google-Smtp-Source: APBJJlG3GF1tCE6KG+x4wKIY6bVSokF/lpnQ2jIzxeOEbArYnqL4o525ZbGRuw0e0jhFRVd2PQVTUA==
X-Received: by 2002:a5d:6305:0:b0:314:1e86:e75d with SMTP id i5-20020a5d6305000000b003141e86e75dmr2395645wru.34.1688142566368;
        Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:29:13 +0200
Subject: [PATCH v6 6/9] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-6-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLcsgk052mDMf07RozlmP66QINWAsClClpnlhPk
 T2Rz2FeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3AAKCRB33NvayMhJ0U3yEA
 CXIKNEzyskErTqAdrVua2iL6TY2Dk7FV7/gCiPutuOzDx74zBLEYlYDBuYYv3fK/7nCb9F8+p2JlKt
 0Hecw1k/oaijFIwkYhjvjzcLlqFeGNFL/19V+bX0K5O6QBz4Gcqprb98BhFO8gXpZ0FitFjBvSCSVT
 dFezRKQcdHQBMOG7/UuIhi9tBG1YA7ao1JjcMBhjBwVF7gO7csys6t3nqR3DtkFivDvaEFr5JFuRjF
 dG7SduVaEWSftMqI3vspv4MATtRdGOmOOQ1H5eBlg9b04KROtt4DRgbq/ktLzWLvQLZN/bPhb6TxBH
 DtaiCl1kpqyboH2h/KEwyzqfyi6dwdBdk8VW5YLqVfXRG3ECYuxCm5SxitXFdc17uKIU2m5A7zQgKM
 Ag9nAR8Rd6Zh2MOvsgIb5K9BwONDuDtFx0sWp9uLOps7j9WqVCPXcR6lPHiKSIZxVlYh4ezpQPmsNU
 u8A8h34UAHGpTtl+Mzj4AM1lX4l96BNcmBLpgedZULLOwuFWG/VJYJIR4eciOunxbY2gM+0apP5Ku1
 nErGm0MiQ0k43/cdtiq3QItMsqlhyILnaraJrhm8OViStzEHV5l2PYGCuPU3+CVWFhJvzZ6uWyZnOg
 ECi8OLjsnWZmZQnwjxnNfPN/7BZGOoure0hEIzDoDFKKhUDG6aTgZbNNQXXA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..e2d890e72940 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1662,9 +1662,28 @@ pwrc: power-controller {
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
@@ -2151,6 +2170,15 @@ hdmi_tx_out: endpoint {
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
@@ -2188,6 +2216,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: mipi-dsi@7000 {
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


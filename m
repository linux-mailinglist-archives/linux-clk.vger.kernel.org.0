Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDDE6FAE65
	for <lists+linux-clk@lfdr.de>; Mon,  8 May 2023 13:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbjEHLo0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 May 2023 07:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbjEHLoB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 07:44:01 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8C510A24;
        Mon,  8 May 2023 04:43:25 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AB65181FA8;
        Mon,  8 May 2023 13:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683546172;
        bh=iV3u7olB6VR6agwRXP/DQKsprbkuEkf9h04/6Pr7Vzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vkFrpUb3v5WqijoyKnzMw8hK3ODU9k/oX4lKdYJCqWTCyOec0jn85f6T/9XKPcymb
         sOMULrq6hqBqqi7gS2Demm6VRqBLNacS3MIvqaXeD7GVIopMO7EKIZJnECuDojVrCG
         OG/vd7gpXiwhA4nKSvMh606foqfFUOmzfqH0QsfcB8mRJkB5uInjkPvzeXlyrLFXTz
         z9XNZXyyqiJQkQMSjkAe090M38/xQ38Q+5jq+BNG88aFB/seqWi5oGBT894nAHpzQH
         9PYZ0XK/+rje8lRFO/UxmEUj2MWLFG52ZzFYtMsnOT5vmcKnal5SZFOuByQz3D4J5e
         WylObxD54MpBA==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 2/2] arm64: dts: imx8mp: Add analog audio output on i.MX8MP EVK
Date:   Mon,  8 May 2023 13:42:36 +0200
Message-Id: <20230508114236.8444-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508114236.8444-1-marex@denx.de>
References: <20230508114236.8444-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
This is all that is needed to get analog audio output operational
on i.MX8MP EVK.

Acked-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: No change
V3: No change
V4: - Update codec node name and phandle label
    - Use just sound for the sound node name
    - Rebase on next 20230223
V5: - Drop regulator-always-on from codec regulator
    - Add RB from Fabio
    - TB by Alexander added and removed again, since the patch was reworked
    - Switch to simple-audio-card
    - Add sound-dai-cells to codec node
V6: - Split off separate pinctrl for regulator
    - Drop unused SAI3_RXFS pinmux
V7: - Add AB from Peng
    - Add RB from Marco
V8: No change
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 7816853162b3f..fa37ce89f8d3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -40,6 +40,17 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_audio_pwr_reg>;
+		regulator-name = "audio-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_can1_stby: regulator-can1-stby {
 		compatible = "regulator-fixed";
 		regulator-name = "can1-stby";
@@ -83,6 +94,37 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm8960-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Speaker", "External Speaker",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"External Speaker", "SPK_LP",
+			"External Speaker", "SPK_LN",
+			"External Speaker", "SPK_RP",
+			"External Speaker", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"LINPUT3", "Mic Jack",
+			"Mic Jack", "MICB";
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8960>;
+		};
+
+	};
 };
 
 &flexspi {
@@ -344,6 +386,18 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		wlf,shared-lrclk;
+		wlf,hp-cfg = <3 2 3>;
+		wlf,gpio-cfg = <1 3>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+	};
+
 	pca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
@@ -422,6 +476,16 @@ &pwm4 {
 	status = "okay";
 };
 
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -499,6 +563,12 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_audio_pwr_reg: audiopwrreggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -668,6 +738,16 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
-- 
2.39.2


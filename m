Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95A68C0B4
	for <lists+linux-clk@lfdr.de>; Mon,  6 Feb 2023 15:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBFO50 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Feb 2023 09:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjBFO5Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:25 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F257522A22
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw12so34989832ejc.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHHImyTUUG5AOg2zl1Dd9dG+etYVgqZwQRAfmMTJSHE=;
        b=cGXj3+kPZ4iwlYEyJ9zWY+enLr2KzqqZjDRwOxD+kMGvhUp3I0s2Rwc1IpLFE8LK2x
         FRAs35+b5+9fV6dETsQYBFbgbqu1z89vuggoW+P75D/J9WFumIA1L2vJXH3XrTIkoufS
         Z0dLFTMl1t+BWgd1w5W4R/UMQsq7DTlZa24fzAFz9lwJTgR7ndXinb46f/quSD3sacSq
         ZNYxDzeF6Di6TJa3+3c/o2WiB6gy+sWBupxan5JVulLOg7m/tswJz8MgeyYvEmHQNNHQ
         TRa/Xn0/CLMK3febfFTF6io/lIFoqKgllyVmRBroAaK0Xb4xovnwgbZ0fPx0VJImXXQk
         ZpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHHImyTUUG5AOg2zl1Dd9dG+etYVgqZwQRAfmMTJSHE=;
        b=pICrNtuYkcpavqUl5dhHTwaK5+vvevUJFaj0Bx3iOkduBogNaSfgtEcCxOs0emclWR
         EoRnurpHnnoCBZjbA4AszZN5N0ZibnaNP2NhNFWFBT6xBtEhcGxnh4ePq5nYpJDRX+Hk
         2xuPbNeEFQOCTGsCfFl6UaRYy+vqOGx7cLyftOP68YvPKre705euPAly7x+N9aGEEfzp
         eDEiliYsWtVpXHLDMZMwbrrZfd84uLNsgsrcF27wDbDoUVbIkwQgTL6Yq4uRQG1+1S0D
         ThnXmFincqB17Lm9GBPHRlam58C69JumKBuqKsZCZVT7GHARCmzW18imxPHelGS34PMw
         a9AQ==
X-Gm-Message-State: AO0yUKV9uXI/eGwOBRogf3nYLY6mGmOgf9bkv7EOhyRv1JRzhARgjhre
        rPxLYPfXKGfCdoGJpXiVPwdCqw==
X-Google-Smtp-Source: AK7set8rKDYw1aUz7JfYgIaxB4lTEL+QHtaL5Pvdd3FW8St3EKZVr+E4AV2lyTjKyRBAZVzPOgFO/w==
X-Received: by 2002:a17:906:194e:b0:87f:d17:66db with SMTP id b14-20020a170906194e00b0087f0d1766dbmr21049405eje.52.1675695436500;
        Mon, 06 Feb 2023 06:57:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8350: finish reordering nodes
Date:   Mon,  6 Feb 2023 16:57:05 +0200
Message-Id: <20230206145707.122937-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Finish reordering DT nodes. Move PDC, tsens, AOSS, SRAM, SPMI and TLMM
nodes to the proper position.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 764 +++++++++++++--------------
 1 file changed, 382 insertions(+), 382 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c327dc925793..e5b308957f88 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1884,276 +1884,6 @@ compute-cb@3 {
 			};
 		};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
-			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
-					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
-					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-					  <156 716 12>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
-
-		tsens0: thermal-sensor@c263000 {
-			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c263000 0 0x1ff>, /* TM */
-			      <0 0x0c222000 0 0x8>; /* SROT */
-			#qcom,sensors = <15>;
-			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
-				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow", "critical";
-			#thermal-sensor-cells = <1>;
-		};
-
-		tsens1: thermal-sensor@c265000 {
-			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c265000 0 0x1ff>, /* TM */
-			      <0 0x0c223000 0 0x8>; /* SROT */
-			#qcom,sensors = <14>;
-			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
-				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow", "critical";
-			#thermal-sensor-cells = <1>;
-		};
-
-		aoss_qmp: power-management@c300000 {
-			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
-			reg = <0 0x0c300000 0 0x400>;
-			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
-						     IRQ_TYPE_EDGE_RISING>;
-			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-			#clock-cells = <0>;
-		};
-
-		sram@c3f0000 {
-			compatible = "qcom,rpmh-stats";
-			reg = <0 0x0c3f0000 0 0x400>;
-		};
-
-		spmi_bus: spmi@c440000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x0 0x0c440000 0x0 0x1100>,
-			      <0x0 0x0c600000 0x0 0x2000000>,
-			      <0x0 0x0e600000 0x0 0x100000>,
-			      <0x0 0x0e700000 0x0 0xa0000>,
-			      <0x0 0x0c40a000 0x0 0x26000>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-		};
-
-		tlmm: pinctrl@f100000 {
-			compatible = "qcom,sm8350-tlmm";
-			reg = <0 0x0f100000 0 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 204>;
-			wakeup-parent = <&pdc>;
-
-			sdc2_default_state: sdc2-default-state {
-				clk-pins {
-					pins = "sdc2_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc2_cmd";
-					drive-strength = <16>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc2_data";
-					drive-strength = <16>;
-					bias-pull-up;
-				};
-			};
-
-			sdc2_sleep_state: sdc2-sleep-state {
-				clk-pins {
-					pins = "sdc2_clk";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc2_cmd";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc2_data";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-			};
-
-			qup_uart3_default_state: qup-uart3-default-state {
-				rx-pins {
-					pins = "gpio18";
-					function = "qup3";
-				};
-				tx-pins {
-					pins = "gpio19";
-					function = "qup3";
-				};
-			};
-
-			qup_uart6_default: qup-uart6-default-state {
-				pins = "gpio30", "gpio31";
-				function = "qup6";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio58", "gpio59";
-				function = "qup18";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c0_default: qup-i2c0-default-state {
-				pins = "gpio4", "gpio5";
-				function = "qup0";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c1_default: qup-i2c1-default-state {
-				pins = "gpio8", "gpio9";
-				function = "qup1";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c2_default: qup-i2c2-default-state {
-				pins = "gpio12", "gpio13";
-				function = "qup2";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c4_default: qup-i2c4-default-state {
-				pins = "gpio20", "gpio21";
-				function = "qup4";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c5_default: qup-i2c5-default-state {
-				pins = "gpio24", "gpio25";
-				function = "qup5";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c6_default: qup-i2c6-default-state {
-				pins = "gpio28", "gpio29";
-				function = "qup6";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c7_default: qup-i2c7-default-state {
-				pins = "gpio32", "gpio33";
-				function = "qup7";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c8_default: qup-i2c8-default-state {
-				pins = "gpio36", "gpio37";
-				function = "qup8";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c9_default: qup-i2c9-default-state {
-				pins = "gpio40", "gpio41";
-				function = "qup9";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c10_default: qup-i2c10-default-state {
-				pins = "gpio44", "gpio45";
-				function = "qup10";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c11_default: qup-i2c11-default-state {
-				pins = "gpio48", "gpio49";
-				function = "qup11";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c12_default: qup-i2c12-default-state {
-				pins = "gpio52", "gpio53";
-				function = "qup12";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c13_default: qup-i2c13-default-state {
-				pins = "gpio0", "gpio1";
-				function = "qup13";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c14_default: qup-i2c14-default-state {
-				pins = "gpio56", "gpio57";
-				function = "qup14";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c15_default: qup-i2c15-default-state {
-				pins = "gpio60", "gpio61";
-				function = "qup15";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c16_default: qup-i2c16-default-state {
-				pins = "gpio64", "gpio65";
-				function = "qup16";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c17_default: qup-i2c17-default-state {
-				pins = "gpio72", "gpio73";
-				function = "qup17";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c19_default: qup-i2c19-default-state {
-				pins = "gpio76", "gpio77";
-				function = "qup19";
-				drive-strength = <2>;
-				bias-disable;
-			};
-		};
-
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2593,144 +2323,414 @@ mdss_dsi0_out: endpoint {
 				};
 			};
 
-			mdss_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,sm8350-dsi-phy-5nm";
-				reg = <0 0x0ae94400 0 0x200>,
-				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94900 0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sm8350-dsi-phy-5nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94900 0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				operating-points-v2 = <&dsi1_opp_table>;
+				power-domains = <&rpmhpd SM8350_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					/* TODO: opp-187500000 should work with
+					 * &rpmhpd_opp_low_svs, but one some of
+					 * sm8350_hdk boards reboot using this
+					 * opp.
+					 */
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sm8350-dsi-phy-5nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm8350-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
+					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
+					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
+					  <156 716 12>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+			      <0 0x0c222000 0 0x8>; /* SROT */
+			#qcom,sensors = <15>;
+			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+			      <0 0x0c223000 0 0x8>; /* SROT */
+			#qcom,sensors = <14>;
+			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0 0x0c3f0000 0 0x400>;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sm8350-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 204>;
+			wakeup-parent = <&pdc>;
+
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 
-				status = "disabled";
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 
-			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
-				reg = <0 0x0ae96000 0 0x400>;
-				reg-names = "dsi_ctrl";
+			qup_uart3_default_state: qup-uart3-default-state {
+				rx-pins {
+					pins = "gpio18";
+					function = "qup3";
+				};
+				tx-pins {
+					pins = "gpio19";
+					function = "qup3";
+				};
+			};
 
-				interrupt-parent = <&mdss>;
-				interrupts = <5>;
+			qup_uart6_default: qup-uart6-default-state {
+				pins = "gpio30", "gpio31";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
-					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
-					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
-					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
+			qup_uart18_default: qup-uart18-default-state {
+				pins = "gpio58", "gpio59";
+				function = "qup18";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				operating-points-v2 = <&dsi1_opp_table>;
-				power-domains = <&rpmhpd SM8350_MMCX>;
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio8", "gpio9";
+				function = "qup1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				phys = <&mdss_dsi1_phy>;
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio12", "gpio13";
+				function = "qup2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				#address-cells = <1>;
-				#size-cells = <0>;
+			qup_i2c4_default: qup-i2c4-default-state {
+				pins = "gpio20", "gpio21";
+				function = "qup4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				status = "disabled";
+			qup_i2c5_default: qup-i2c5-default-state {
+				pins = "gpio24", "gpio25";
+				function = "qup5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				dsi1_opp_table: opp-table {
-					compatible = "operating-points-v2";
+			qup_i2c6_default: qup-i2c6-default-state {
+				pins = "gpio28", "gpio29";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					/* TODO: opp-187500000 should work with
-					 * &rpmhpd_opp_low_svs, but one some of
-					 * sm8350_hdk boards reboot using this
-					 * opp.
-					 */
-					opp-187500000 {
-						opp-hz = /bits/ 64 <187500000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
+			qup_i2c7_default: qup-i2c7-default-state {
+				pins = "gpio32", "gpio33";
+				function = "qup7";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-					opp-300000000 {
-						opp-hz = /bits/ 64 <300000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio36", "gpio37";
+				function = "qup8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-				};
+			qup_i2c9_default: qup-i2c9-default-state {
+				pins = "gpio40", "gpio41";
+				function = "qup9";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio44", "gpio45";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					port@0 {
-						reg = <0>;
-						mdss_dsi1_in: endpoint {
-							remote-endpoint = <&dpu_intf2_out>;
-						};
-					};
+			qup_i2c11_default: qup-i2c11-default-state {
+				pins = "gpio48", "gpio49";
+				function = "qup11";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					port@1 {
-						reg = <1>;
-						mdss_dsi1_out: endpoint {
-						};
-					};
-				};
+			qup_i2c12_default: qup-i2c12-default-state {
+				pins = "gpio52", "gpio53";
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
 			};
 
-			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,sm8350-dsi-phy-5nm";
-				reg = <0 0x0ae96400 0 0x200>,
-				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
+			qup_i2c13_default: qup-i2c13-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup13";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				#clock-cells = <1>;
-				#phy-cells = <0>;
+			qup_i2c14_default: qup-i2c14-default-state {
+				pins = "gpio56", "gpio57";
+				function = "qup14";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
+			qup_i2c15_default: qup-i2c15-default-state {
+				pins = "gpio60", "gpio61";
+				function = "qup15";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				status = "disabled";
+			qup_i2c16_default: qup-i2c16-default-state {
+				pins = "gpio64", "gpio65";
+				function = "qup16";
+				drive-strength = <2>;
+				bias-disable;
 			};
-		};
 
-		dispcc: clock-controller@af00000 {
-			compatible = "qcom,sm8350-dispcc";
-			reg = <0 0x0af00000 0 0x10000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
-			clock-names = "bi_tcxo",
-				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk",
-				      "dsi1_phy_pll_out_byteclk",
-				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_phy_pll_link_clk",
-				      "dp_phy_pll_vco_div_clk";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
+			qup_i2c17_default: qup-i2c17-default-state {
+				pins = "gpio72", "gpio73";
+				function = "qup17";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-			power-domains = <&rpmhpd SM8350_MMCX>;
+			qup_i2c19_default: qup-i2c19-default-state {
+				pins = "gpio76", "gpio77";
+				function = "qup19";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.39.1


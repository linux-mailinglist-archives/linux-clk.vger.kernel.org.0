Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7140673C591
	for <lists+linux-clk@lfdr.de>; Sat, 24 Jun 2023 02:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjFXAtB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 23 Jun 2023 20:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjFXAs5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 20:48:57 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560232964
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 17:48:49 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E36E73F85B;
        Sat, 24 Jun 2023 02:41:17 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Sat, 24 Jun 2023 02:41:12 +0200
Subject: [PATCH 14/15] arm64: dts: qcom: sm6125: Add display hardware nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230624-sm6125-dpu-v1-14-1d5a638cebf2@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
In-Reply-To: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the DT nodes that describe the MDSS hardware on SM6125, containing
one MDP (display controller) together with a single DSI and DSI PHY.  No
DisplayPort support is added for now.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 190 ++++++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 7d78b4e48ebe..6852dacf54e6 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1204,16 +1204,198 @@ sram@4690000 {
 			reg = <0x04690000 0x10000>;
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,sm6125-mdss";
+			reg = <0x05e00000 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface", "ahb", "core";
+
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdss_mdp: display-controller@5e01000 {
+				compatible = "qcom,sm6125-dpu";
+				reg = <0x05e01000 0x83208>,
+				      <0x05eb0000 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "rot",
+					      "lut",
+					      "core",
+					      "vsync";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd SM6125_VDDCX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,sm6125-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x05e94000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd SM6125_VDDMX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-6125";
+				reg = <0x05e94400 0x100>,
+				      <0x05e94500 0x300>,
+				      <0x05e94800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,sm6125-dispcc";
 			reg = <0x05f00000 0x20000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+				 <0>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",

-- 
2.41.0


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C541155A5E4
	for <lists+linux-clk@lfdr.de>; Sat, 25 Jun 2022 03:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiFYBc4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jun 2022 21:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiFYBcy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 21:32:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411F545AFF
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 18:32:51 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 42C9D84474;
        Sat, 25 Jun 2022 03:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656120769;
        bh=MblMOuaUCh11HjLSMBc/R4WTDd4fI65OAYifJB01rfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xVnOApa1z+tf+NoCLNnjk1AM7007oCfWmWw91nZzZHzCAbNoxvEQifwzwE5ZjUjYQ
         +ocI6zcqA6+SnI6GTXENCdvxQ2nvnzXrI8fNXISQrdtSxFvrC7R5Y5fb5ziTiKsFz0
         fci2H6EUjvlVVWGPo2haWf5tBpThYK7LyH4DZBky7oeJhRKL7U5Pv7Ea3tCdSc5BCW
         MpAgzMHkcbe68UEpfu/YnZlZRUm9wyuT1iM5E8tdCsX8GAZI55xKMfpuvaFoGsMMOe
         Cbj+0Bl6BzFcRPLLsar7tTl+uWlZCj/BntI9IVllHXyndIdXb6Nas+QxEKxp832wfp
         g36UBlpjJ5e4w==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Date:   Sat, 25 Jun 2022 03:32:34 +0200
Message-Id: <20220625013235.710346-5-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625013235.710346-1-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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

Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
needed to get audio operational on i.MX8MP .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V2: - Add AUDIO_AXI clock to audio gpc
    - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
V3: Rename audio_ahb to plain ahb
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 153 ++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 8c76725e3d20d..9bf60a1863757 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -551,6 +551,13 @@ pgc_usb2_phy: power-domain@3 {
 						reg = <IMX8MP_POWER_DOMAIN_USB2_PHY>;
 					};
 
+					pgc_audio: power-domain@5 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
+						clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+							 <&clk IMX8MP_CLK_AUDIO_AXI>;
+					};
+
 					pgc_gpu2d: power-domain@6 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_GPU2D>;
@@ -1044,6 +1051,152 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
+		aips5: bus@30c00000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x30c00000 0x400000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			spba-bus@30c00000 {
+				compatible = "fsl,spba-bus", "simple-bus";
+				reg = <0x30c00000 0x100000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				sai1: sai@30c10000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c10000 0x10000>;
+					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai2: sai@30c20000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c20000 0x10000>;
+					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai3: sai@30c30000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c30000 0x10000>;
+					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai5: sai@30c50000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c50000 0x10000>;
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai6: sai@30c60000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c60000 0x10000>;
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai7: sai@30c80000 {
+					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
+					reg = <0x30c80000 0x10000>;
+					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
+						 <&clk IMX8MP_CLK_DUMMY>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma2 12 2 0>, <&sdma2 13 2 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+			};
+
+			sdma3: dma-controller@30e00000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e00000 0x10000>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			sdma2: dma-controller@30e10000 {
+				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+				reg = <0x30e10000 0x10000>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
+					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+			};
+
+			audio_blk_ctrl: blk-ctrl@30e20000 {
+				#clock-cells = <1>;
+				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
+					 <&clk IMX8MP_CLK_SAI1>,
+					 <&clk IMX8MP_CLK_SAI2>,
+					 <&clk IMX8MP_CLK_SAI3>,
+					 <&clk IMX8MP_CLK_SAI5>,
+					 <&clk IMX8MP_CLK_SAI6>,
+					 <&clk IMX8MP_CLK_SAI7>;
+				clock-names = "ahb",
+					      "sai1", "sai2", "sai3",
+					      "sai5", "sai6", "sai7";
+				power-domains = <&pgc_audio>;
+				power-domain-names = "audio";
+				reg = <0x30e20000 0x10000>;
+			};
+		};
+
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x32c00000 0x400000>;
-- 
2.35.1


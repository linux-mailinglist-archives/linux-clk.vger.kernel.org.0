Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E2C66D60E
	for <lists+linux-clk@lfdr.de>; Tue, 17 Jan 2023 07:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbjAQGPw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Jan 2023 01:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235685AbjAQGPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 01:15:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9146223311
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 22:15:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFb-0002TD-Dr; Tue, 17 Jan 2023 07:15:15 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFY-006bzo-Mp; Tue, 17 Jan 2023 07:15:12 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pHfFX-00Fcka-4W; Tue, 17 Jan 2023 07:15:11 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 17/19] ARM: dts: imx6ul: set enet_clk_ref to CLK_ENETx_REF_SEL
Date:   Tue, 17 Jan 2023 07:14:51 +0100
Message-Id: <20230117061453.3723649-18-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230117061453.3723649-1-o.rempel@pengutronix.de>
References: <20230117061453.3723649-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IMX6UL_CLK_ENETx_REF is behind of CLK_ENETx_REF_SEL:

FEC MAC <---------- CLK_ENETx_REF_SEL <--------- CLK_ENETx_REF
		       \
		        ^------<-> CLK_ENETx_REF_PAD

We should point to the clock selector instead. So, we will be able to
use external clock source from CLK_ENETx_REF_PAD as well.

At same time, remove enet_out clk. It is using always the same clock as
enet_clk_ref and do not help to solve any challenges of this HW.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 2b5996395701..fa9afedb6549 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -532,10 +532,9 @@ fec2: ethernet@20b4000 {
 				clocks = <&clks IMX6UL_CLK_ENET>,
 					 <&clks IMX6UL_CLK_ENET_AHB>,
 					 <&clks IMX6UL_CLK_ENET_PTP>,
-					 <&clks IMX6UL_CLK_ENET2_REF_125M>,
-					 <&clks IMX6UL_CLK_ENET2_REF_125M>;
+					 <&clks IMX6UL_CLK_ENET2_REF_SEL>;
 				clock-names = "ipg", "ahb", "ptp",
-					      "enet_clk_ref", "enet_out";
+					      "enet_clk_ref";
 				fsl,num-tx-queues = <1>;
 				fsl,num-rx-queues = <1>;
 				fsl,stop-mode = <&gpr 0x10 4>;
@@ -880,10 +879,9 @@ fec1: ethernet@2188000 {
 				clocks = <&clks IMX6UL_CLK_ENET>,
 					 <&clks IMX6UL_CLK_ENET_AHB>,
 					 <&clks IMX6UL_CLK_ENET_PTP>,
-					 <&clks IMX6UL_CLK_ENET_REF>,
-					 <&clks IMX6UL_CLK_ENET_REF>;
+					 <&clks IMX6UL_CLK_ENET1_REF_SEL>;
 				clock-names = "ipg", "ahb", "ptp",
-					      "enet_clk_ref", "enet_out";
+					      "enet_clk_ref";
 				fsl,num-tx-queues = <1>;
 				fsl,num-rx-queues = <1>;
 				fsl,stop-mode = <&gpr 0x10 3>;
-- 
2.30.2


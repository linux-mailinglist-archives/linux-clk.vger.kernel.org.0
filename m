Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA157669A8F
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jan 2023 15:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjAMOfo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 Jan 2023 09:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjAMOdh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:33:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2AB50050
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:28:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1e-0006Dx-R6; Fri, 13 Jan 2023 15:27:22 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1d-005myh-VM; Fri, 13 Jan 2023 15:27:21 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1pGL1b-00CkRo-Je; Fri, 13 Jan 2023 15:27:19 +0100
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
        Lee Jones <lee@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v1 16/20] clk: imx6ul: fix enet1 gate configuration
Date:   Fri, 13 Jan 2023 15:27:14 +0100
Message-Id: <20230113142718.3038265-17-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113142718.3038265-1-o.rempel@pengutronix.de>
References: <20230113142718.3038265-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to the "i.MX 6UltraLite Applications Processor Reference Manual,
Rev. 2, 03/2017", BIT(13) is ENET1_125M_EN which is not controlling root
of PLL6. It is controlling ENET1 separately.

So, instead of this picture (implementation before this patch):
fec1 <- enet_ref (divider) <---------------------------,
                                                       |- pll6_enet (gate)
fec2 <- enet2_ref_125m (gate) <- enet2_ref (divider) <-´

we should have this one (after this patch):
fec1 <- enet1_ref_125m (gate) <- enet1_ref (divider) <-,
                                                       |- pll6_enet
fec2 <- enet2_ref_125m (gate) <- enet2_ref (divider) <-´

With this fix, the RMII reference clock will be turned off, after
setting network interface down on each separate interface
(ip l s dev eth0 down). Which was not working before, on system with both
FECs enabled.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/clk/imx/clk-imx6ul.c             | 7 ++++---
 include/dt-bindings/clock/imx6ul-clock.h | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 67a7a77ca540..c3c465c1b0e7 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -176,7 +176,7 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	hws[IMX6UL_CLK_PLL3_USB_OTG]	= imx_clk_hw_gate("pll3_usb_otg",	"pll3_bypass", base + 0x10, 13);
 	hws[IMX6UL_CLK_PLL4_AUDIO]	= imx_clk_hw_gate("pll4_audio",	"pll4_bypass", base + 0x70, 13);
 	hws[IMX6UL_CLK_PLL5_VIDEO]	= imx_clk_hw_gate("pll5_video",	"pll5_bypass", base + 0xa0, 13);
-	hws[IMX6UL_CLK_PLL6_ENET]	= imx_clk_hw_gate("pll6_enet",	"pll6_bypass", base + 0xe0, 13);
+	hws[IMX6UL_CLK_PLL6_ENET]	= imx_clk_hw_fixed_factor("pll6_enet",	"pll6_bypass", 1, 1);
 	hws[IMX6UL_CLK_PLL7_USB_HOST]	= imx_clk_hw_gate("pll7_usb_host",	"pll7_bypass", base + 0x20, 13);
 
 	/*
@@ -205,12 +205,13 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	hws[IMX6UL_CLK_PLL3_PFD2] = imx_clk_hw_pfd("pll3_pfd2_508m", "pll3_usb_otg", base + 0xf0,	 2);
 	hws[IMX6UL_CLK_PLL3_PFD3] = imx_clk_hw_pfd("pll3_pfd3_454m", "pll3_usb_otg", base + 0xf0,	 3);
 
-	hws[IMX6UL_CLK_ENET_REF] = clk_hw_register_divider_table(NULL, "enet_ref", "pll6_enet", 0,
+	hws[IMX6UL_CLK_ENET_REF] = clk_hw_register_divider_table(NULL, "enet1_ref", "pll6_enet", 0,
 			base + 0xe0, 0, 2, 0, clk_enet_ref_table, &imx_ccm_lock);
 	hws[IMX6UL_CLK_ENET2_REF] = clk_hw_register_divider_table(NULL, "enet2_ref", "pll6_enet", 0,
 			base + 0xe0, 2, 2, 0, clk_enet_ref_table, &imx_ccm_lock);
 
-	hws[IMX6UL_CLK_ENET2_REF_125M] = imx_clk_hw_gate("enet_ref_125m", "enet2_ref", base + 0xe0, 20);
+	hws[IMX6UL_CLK_ENET1_REF_125M] = imx_clk_hw_gate("enet1_ref_125m", "enet1_ref", base + 0xe0, 13);
+	hws[IMX6UL_CLK_ENET2_REF_125M] = imx_clk_hw_gate("enet2_ref_125m", "enet2_ref", base + 0xe0, 20);
 	hws[IMX6UL_CLK_ENET_PTP_REF]	= imx_clk_hw_fixed_factor("enet_ptp_ref", "pll6_enet", 1, 20);
 	hws[IMX6UL_CLK_ENET_PTP]	= imx_clk_hw_gate("enet_ptp", "enet_ptp_ref", base + 0xe0, 21);
 
diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bindings/clock/imx6ul-clock.h
index 79094338e6f1..b44920f1edb0 100644
--- a/include/dt-bindings/clock/imx6ul-clock.h
+++ b/include/dt-bindings/clock/imx6ul-clock.h
@@ -256,7 +256,8 @@
 #define IMX6UL_CLK_GPIO4		247
 #define IMX6UL_CLK_GPIO5		248
 #define IMX6UL_CLK_MMDC_P1_IPG		249
+#define IMX6UL_CLK_ENET1_REF_125M	250
 
-#define IMX6UL_CLK_END			250
+#define IMX6UL_CLK_END			251
 
 #endif /* __DT_BINDINGS_CLOCK_IMX6UL_H */
-- 
2.30.2


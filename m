Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28011769963
	for <lists+linux-clk@lfdr.de>; Mon, 31 Jul 2023 16:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjGaOWK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Jul 2023 10:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbjGaOWG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 10:22:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C95419A
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 07:22:04 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.felsch@pengutronix.de>)
        id 1qQTmS-00041i-E0; Mon, 31 Jul 2023 16:21:52 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Anson.Huang@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 2/2] dt-bindings: clocks: imx8mp: make sai4 a dummy clock
Date:   Mon, 31 Jul 2023 16:21:50 +0200
Message-Id: <20230731142150.3186650-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731142150.3186650-1-m.felsch@pengutronix.de>
References: <20230731142150.3186650-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The hardware don't have a SAI4 instance so remove the define. Use a
comment to keep it as reference and to avoid confusion.

Fixes: 108869144739 ("dt-bindings: imx: Add clock binding doc for i.MX8MP")
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v2:
- rebase to v6.5-rc1

 include/dt-bindings/clock/imx8mp-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 3f28ce685f412..11cb0a4fe999b 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -130,7 +130,7 @@
 #define IMX8MP_CLK_SAI1				123
 #define IMX8MP_CLK_SAI2				124
 #define IMX8MP_CLK_SAI3				125
-#define IMX8MP_CLK_SAI4				126
+/* #define IMX8MP_CLK_SAI4				126 */
 #define IMX8MP_CLK_SAI5				127
 #define IMX8MP_CLK_SAI6				128
 #define IMX8MP_CLK_ENET_QOS			129
-- 
2.39.2


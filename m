Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5192460EDA1
	for <lists+linux-clk@lfdr.de>; Thu, 27 Oct 2022 03:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbiJ0Byp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Oct 2022 21:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJ0Byk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 21:54:40 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBFC402D3;
        Wed, 26 Oct 2022 18:54:38 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B28751AB23A;
        Thu, 27 Oct 2022 03:54:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7CE4F1AB237;
        Thu, 27 Oct 2022 03:54:36 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 08353183486C;
        Thu, 27 Oct 2022 09:54:34 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     shengjiu.wang@gmail.com, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
Subject: [PATCH v2 1/2] dt-bindings: clock: imx8mp: Add ids for the audio shared gate
Date:   Thu, 27 Oct 2022 09:34:01 +0800
Message-Id: <1666834442-5609-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Abel Vesa <abel.vesa@nxp.com>

All these IDs are for one single HW gate (CCGR101) that is shared
between these root clocks.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- split dt-binding to separate patch

 include/dt-bindings/clock/imx8mp-clock.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 9d5cc2ddde89..2f6fec299662 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -324,8 +324,17 @@
 #define IMX8MP_CLK_CLKOUT2_SEL			317
 #define IMX8MP_CLK_CLKOUT2_DIV			318
 #define IMX8MP_CLK_CLKOUT2			319
+#define IMX8MP_CLK_AUDIO_AHB_ROOT		320
+#define IMX8MP_CLK_AUDIO_AXI_ROOT		321
+#define IMX8MP_CLK_SAI1_ROOT			322
+#define IMX8MP_CLK_SAI2_ROOT			323
+#define IMX8MP_CLK_SAI3_ROOT			324
+#define IMX8MP_CLK_SAI5_ROOT			325
+#define IMX8MP_CLK_SAI6_ROOT			326
+#define IMX8MP_CLK_SAI7_ROOT			327
+#define IMX8MP_CLK_PDM_ROOT			328
 
-#define IMX8MP_CLK_END				320
+#define IMX8MP_CLK_END				329
 
 #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
 #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
-- 
2.34.1


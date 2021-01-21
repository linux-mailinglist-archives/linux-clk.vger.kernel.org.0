Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45312FE3C0
	for <lists+linux-clk@lfdr.de>; Thu, 21 Jan 2021 08:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbhAUHT0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Jan 2021 02:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbhAUHSe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:18:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADCFC061796
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:03 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UH-GE; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-005981-85; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 06/15] soc: xilinx: vcu: implement PLL disable
Date:   Thu, 21 Jan 2021 08:16:50 +0100
Message-Id: <20210121071659.1226489-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121071659.1226489-1-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The disabling of the PLL is not fully implemented, because according to
the ZynqMP register reference the RESET, POR_IN and PWR_POR bits have to
be set to bring the PLL into reset.

Set the bits to disable the PLL.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3: none
v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index ff66551a5966..34f3299afc0d 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -329,6 +329,10 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 		return ret;
 	}
 
+	xvcu_write_field_reg(base, VCU_PLL_CTRL,
+			     1, VCU_PLL_CTRL_BYPASS_MASK,
+			     VCU_PLL_CTRL_BYPASS_SHIFT);
+
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
 	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
 			  VCU_PLL_CTRL_POR_IN_SHIFT);
@@ -340,15 +344,9 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 			 VCU_PLL_CTRL_PWR_POR_SHIFT;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     0, VCU_PLL_CTRL_RESET_MASK,
-			     VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl |= (0 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
 	ret = xvcu_pll_wait_for_lock(xvcu);
 	if (ret) {
@@ -368,6 +366,18 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
 
 static void xvcu_pll_disable(struct xvcu_device *xvcu)
 {
+	void __iomem *base = xvcu->vcu_slcr_ba;
+	u32 vcu_pll_ctrl;
+
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK << VCU_PLL_CTRL_POR_IN_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_POR_IN_MASK) << VCU_PLL_CTRL_POR_IN_SHIFT;
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK << VCU_PLL_CTRL_PWR_POR_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_PWR_POR_MASK) << VCU_PLL_CTRL_PWR_POR_SHIFT;
+	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
+	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
+
 	clk_disable_unprepare(xvcu->pll_ref);
 }
 
-- 
2.20.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D014189486
	for <lists+linux-clk@lfdr.de>; Wed, 18 Mar 2020 04:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgCRDdm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Mar 2020 23:33:42 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37626 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbgCRDdm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Mar 2020 23:33:42 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 772C71A104F;
        Wed, 18 Mar 2020 04:33:40 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E95E61A1050;
        Wed, 18 Mar 2020 04:33:32 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8E1A5402C1;
        Wed, 18 Mar 2020 11:33:23 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        allison@lohutok.net, gustavo@embeddedor.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        abel.vesa@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] clk: imx: clk-pllv3: Use readl_poll_timeout() for PLL lock wait
Date:   Wed, 18 Mar 2020 11:26:44 +0800
Message-Id: <1584502004-11349-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use readl_poll_timeout() for PLL lock wait which can simplify the
code a lot.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-pllv3.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index df91a82..3dfa9c3 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/err.h>
@@ -25,6 +26,8 @@
 #define IMX7_ENET_PLL_POWER	(0x1 << 5)
 #define IMX7_DDR_PLL_POWER	(0x1 << 20)
 
+#define PLL_LOCK_TIMEOUT	10000
+
 /**
  * struct clk_pllv3 - IMX PLL clock version 3
  * @clk_hw:	 clock source
@@ -53,23 +56,14 @@ struct clk_pllv3 {
 
 static int clk_pllv3_wait_lock(struct clk_pllv3 *pll)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(10);
 	u32 val = readl_relaxed(pll->base) & pll->power_bit;
 
 	/* No need to wait for lock when pll is not powered up */
 	if ((pll->powerup_set && !val) || (!pll->powerup_set && val))
 		return 0;
 
-	/* Wait for PLL to lock */
-	do {
-		if (readl_relaxed(pll->base) & BM_PLL_LOCK)
-			break;
-		if (time_after(jiffies, timeout))
-			break;
-		usleep_range(50, 500);
-	} while (1);
-
-	return readl_relaxed(pll->base) & BM_PLL_LOCK ? 0 : -ETIMEDOUT;
+	return readl_poll_timeout(pll->base, val, val & BM_PLL_LOCK, 500,
+				  PLL_LOCK_TIMEOUT);
 }
 
 static int clk_pllv3_prepare(struct clk_hw *hw)
-- 
2.7.4


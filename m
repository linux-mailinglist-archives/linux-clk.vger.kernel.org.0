Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248E7185D39
	for <lists+linux-clk@lfdr.de>; Sun, 15 Mar 2020 14:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgCONuw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 15 Mar 2020 09:50:52 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57552 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727778AbgCONuw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 09:50:52 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3649E2005A7;
        Sun, 15 Mar 2020 14:50:50 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6573620058A;
        Sun, 15 Mar 2020 14:50:45 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F34CE40302;
        Sun, 15 Mar 2020 21:50:35 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V6 06/12] clk: imx: scu: add runtime pm support
Date:   Sun, 15 Mar 2020 21:43:50 +0800
Message-Id: <1584279836-29825-7-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add runtime pm support

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5: no changes
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index d474753712f7..7c7a839a3569 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -450,15 +451,32 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct imx_scu_clk_node *clk = dev_get_platdata(dev);
 	struct clk_hw *hw;
+	int ret;
+
+	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, 50);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret) {
+		pm_runtime_disable(dev);
+		return ret;
+	}
 
-	hw = __imx_clk_scu(NULL, clk->name, clk->parents, clk->num_parents,
+	hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
 			   clk->rsrc, clk->clk_type);
-	if (IS_ERR(hw))
+	if (IS_ERR(hw)) {
+		pm_runtime_disable(dev);
 		return PTR_ERR(hw);
+	}
 
 	clk->hw = hw;
 	list_add_tail(&clk->node, &imx_scu_clks[clk->rsrc]);
 
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
 	dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
 		clk->clk_type);
 
-- 
2.23.0


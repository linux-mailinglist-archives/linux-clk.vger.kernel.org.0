Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A494ADAD3
	for <lists+linux-clk@lfdr.de>; Mon,  9 Sep 2019 16:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405243AbfIIOLh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Sep 2019 10:11:37 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40740 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405230AbfIIOLg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 10:11:36 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 25B452001B4;
        Mon,  9 Sep 2019 16:11:34 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EB5792003F4;
        Mon,  9 Sep 2019 16:11:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 867244031C;
        Mon,  9 Sep 2019 22:11:22 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V5 07/11] clk: imx: scu: add suspend/resume support
Date:   Mon,  9 Sep 2019 22:10:04 -0400
Message-Id: <1568081408-26800-8-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clock state will be lost when its power domain is completely off
during system suspend/resume. So we save and restore the state
accordingly in suspend/resume callback.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5:
 * make suspend/resume function static
v4: no changes
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 04a0514..000ce6e 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -46,6 +46,10 @@ struct clk_scu {
 	struct clk_hw hw;
 	u16 rsrc_id;
 	u8 clk_type;
+
+	/* for state save&restore */
+	bool is_enabled;
+	u32 rate;
 };
 
 /*
@@ -427,6 +431,9 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 		hw = ERR_PTR(ret);
 	}
 
+	if (dev)
+		dev_set_drvdata(dev, clk);
+
 	return hw;
 }
 
@@ -483,10 +490,52 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
+{
+	struct clk_scu *clk = dev_get_drvdata(dev);
+
+	clk->rate = clk_hw_get_rate(&clk->hw);
+	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
+
+	if (clk->rate)
+		dev_dbg(dev, "save rate %d\n", clk->rate);
+
+	if (clk->is_enabled)
+		dev_dbg(dev, "save enabled state\n");
+
+	return 0;
+}
+
+static int __maybe_unused imx_clk_scu_resume(struct device *dev)
+{
+	struct clk_scu *clk = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (clk->rate) {
+		ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
+		dev_dbg(dev, "restore rate %d %s\n", clk->rate,
+			!ret ? "success" : "failed");
+	}
+
+	if (clk->is_enabled) {
+		ret = clk_scu_prepare(&clk->hw);
+		dev_dbg(dev, "restore enabled state %s\n",
+			!ret ? "success" : "failed");
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx_clk_scu_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_clk_scu_suspend,
+				      imx_clk_scu_resume)
+};
+
 static struct platform_driver imx_clk_scu_driver = {
 	.driver = {
 		.name = "imx-scu-clk",
 		.suppress_bind_attrs = true,
+		.pm = &imx_clk_scu_pm_ops,
 	},
 	.probe = imx_clk_scu_probe,
 };
-- 
2.7.4


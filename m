Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25D6EBE4A
	for <lists+linux-clk@lfdr.de>; Fri,  1 Nov 2019 08:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbfKAHDN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Nov 2019 03:03:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:50866 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728933AbfKAHDN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Nov 2019 03:03:13 -0400
X-IronPort-AV: E=Sophos;i="5.68,254,1569250800"; 
   d="scan'208";a="30391609"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Nov 2019 16:03:11 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CE9BE419B441;
        Fri,  1 Nov 2019 16:03:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
Date:   Fri,  1 Nov 2019 16:03:10 +0900
Message-Id: <1572591791-11280-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This hardware needs to enable clocks of both host and peripheral.
So, this patch adds multiple clocks management.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index b97f5f9..4096506 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -26,9 +26,16 @@
 #define CLKSET0_PRIVATE		BIT(0)
 #define CLKSET0_EXTAL_ONLY	(CLKSET0_INTCLK_EN | CLKSET0_PRIVATE)
 
+enum {
+	CLK_INDEX_EHCI_OHCI,
+	CLK_INDEX_HS_USB,
+	CLK_NUM
+};
+
 struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
+	struct clk_bulk_data clks[CLK_NUM];
 	bool extal;
 	bool xtal;
 };
@@ -53,14 +60,25 @@ static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
 
 static int usb2_clock_sel_enable(struct clk_hw *hw)
 {
-	usb2_clock_sel_enable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(CLK_NUM, priv->clks);
+	if (ret)
+		return ret;
+
+	usb2_clock_sel_enable_extal_only(priv);
 
 	return 0;
 }
 
 static void usb2_clock_sel_disable(struct clk_hw *hw)
 {
-	usb2_clock_sel_disable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+
+	usb2_clock_sel_disable_extal_only(priv);
+
+	clk_bulk_disable_unprepare(CLK_NUM, priv->clks);
 }
 
 /*
@@ -128,6 +146,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	priv->clks[CLK_INDEX_EHCI_OHCI].clk = devm_clk_get(dev, "ehci_ohci");
+	if (IS_ERR(priv->clks[CLK_INDEX_EHCI_OHCI].clk))
+		return PTR_ERR(priv->clks[CLK_INDEX_EHCI_OHCI].clk);
+
+	priv->clks[CLK_INDEX_HS_USB].clk = devm_clk_get(dev, "hs-usb-if");
+	if (IS_ERR(priv->clks[CLK_INDEX_HS_USB].clk))
+		return PTR_ERR(priv->clks[CLK_INDEX_HS_USB].clk);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.7.4


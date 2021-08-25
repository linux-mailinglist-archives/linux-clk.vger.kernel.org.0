Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FB23F78BF
	for <lists+linux-clk@lfdr.de>; Wed, 25 Aug 2021 17:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241824AbhHYPfD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Aug 2021 11:35:03 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:38701 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235663AbhHYPfC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 11:35:02 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 62756C9850;
        Wed, 25 Aug 2021 15:26:25 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8C39C0015;
        Wed, 25 Aug 2021 15:26:01 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, bcousson@baylibre.com,
        Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "Ryan J . Barnett" <ryan.barnett@collins.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 20/40] mfd: ti_am335x_tscadc: Gather the ctrl register logic at one place
Date:   Wed, 25 Aug 2021 17:24:58 +0200
Message-Id: <20210825152518.379386-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210825152518.379386-1-miquel.raynal@bootlin.com>
References: <20210825152518.379386-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of deriving in the probe and in the resume path the value of the
ctrl register, let's do it only once in the probe, save the value of
this register in the driver's structure and use it from the resume
callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mfd/ti_am335x_tscadc.c       | 31 ++++++++--------------------
 include/linux/mfd/ti_am335x_tscadc.h |  2 +-
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 7071344ad18e..d661e8ae66c9 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -122,7 +122,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	struct clk *clk;
 	u32 val;
 	int tsc_wires = 0, adc_channels = 0, readouts = 0, cell_idx = 0;
-	int total_channels, ctrl, err;
+	int total_channels, err;
 
 	/* Allocate memory for device */
 	tscadc = devm_kzalloc(&pdev->dev, sizeof(*tscadc), GFP_KERNEL);
@@ -215,22 +215,21 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	regmap_write(tscadc->regmap, REG_CLKDIV, tscadc->clk_div);
 
 	/* Set the control register bits */
-	ctrl = CNTRLREG_STEPCONFIGWRT |	CNTRLREG_STEPID;
-	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
+	tscadc->ctrl = CNTRLREG_STEPCONFIGWRT | CNTRLREG_STEPID;
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl);
 
 	if (tsc_wires > 0) {
-		tscadc->tsc_wires = tsc_wires;
+		tscadc->ctrl |= CNTRLREG_TSCENB;
 		if (tsc_wires == 5)
-			ctrl |= CNTRLREG_5WIRE | CNTRLREG_TSCENB;
+			tscadc->ctrl |= CNTRLREG_5WIRE;
 		else
-			ctrl |= CNTRLREG_4WIRE | CNTRLREG_TSCENB;
+			tscadc->ctrl |= CNTRLREG_4WIRE;
 	}
 
 	tscadc_idle_config(tscadc);
 
 	/* Enable the TSC module enable bit */
-	ctrl |= CNTRLREG_TSCSSENB;
-	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_TSCSSENB);
 
 	/* TSC Cell */
 	if (tsc_wires > 0) {
@@ -305,25 +304,13 @@ static int __maybe_unused tscadc_suspend(struct device *dev)
 static int __maybe_unused tscadc_resume(struct device *dev)
 {
 	struct ti_tscadc_dev *tscadc = dev_get_drvdata(dev);
-	u32 ctrl;
 
 	pm_runtime_get_sync(dev);
 
-	/* context restore */
-	ctrl = CNTRLREG_STEPCONFIGWRT |	CNTRLREG_STEPID;
-	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
-
-	if (tscadc->tsc_wires > 0) {
-		if (tscadc->tsc_wires == 5)
-			ctrl |= CNTRLREG_5WIRE | CNTRLREG_TSCENB;
-		else
-			ctrl |= CNTRLREG_4WIRE | CNTRLREG_TSCENB;
-	}
-	ctrl |= CNTRLREG_TSCSSENB;
-	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
-
 	regmap_write(tscadc->regmap, REG_CLKDIV, tscadc->clk_div);
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl);
 	tscadc_idle_config(tscadc);
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_TSCSSENB);
 
 	return 0;
 }
diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index e734fb97dff8..02963b6ebbac 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -177,8 +177,8 @@ struct ti_tscadc_dev {
 	phys_addr_t tscadc_phys_base;
 	const struct ti_tscadc_data *data;
 	int irq;
-	int tsc_wires;
 	struct mfd_cell cells[TSCADC_CELLS];
+	u32 ctrl;
 	u32 reg_se_cache;
 	bool adc_waiting;
 	bool adc_in_use;
-- 
2.27.0


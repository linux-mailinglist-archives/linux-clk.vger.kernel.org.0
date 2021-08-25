Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EBE3F78C6
	for <lists+linux-clk@lfdr.de>; Wed, 25 Aug 2021 17:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241835AbhHYPfP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Aug 2021 11:35:15 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:45617 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240895AbhHYPfP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 11:35:15 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 60BACC00B0;
        Wed, 25 Aug 2021 15:26:27 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0A7B9C0006;
        Wed, 25 Aug 2021 15:26:03 +0000 (UTC)
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
Subject: [PATCH 21/40] mfd: ti_am335x_tscadc: Rename the subsystem enable macro
Date:   Wed, 25 Aug 2021 17:24:59 +0200
Message-Id: <20210825152518.379386-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210825152518.379386-1-miquel.raynal@bootlin.com>
References: <20210825152518.379386-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This bit is common to all devices (ADC, Touchscreen, Magnetic reader) so
make it clear that it can be used from any location by operating a
mechanical rename:
s/CNTRLREG_TSCSSENB/CNTRLREG_SSENB/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/iio/adc/ti_am335x_adc.c      | 6 +++---
 drivers/mfd/ti_am335x_tscadc.c       | 6 +++---
 include/linux/mfd/ti_am335x_tscadc.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index 855cc2d64ac8..f748d49f10f4 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -184,7 +184,7 @@ static irqreturn_t tiadc_irq_h(int irq, void *private)
 	if (status & IRQENB_FIFO1OVRRUN) {
 		/* FIFO Overrun. Clear flag. Disable/Enable ADC to recover */
 		config = tiadc_readl(adc_dev, REG_CTRL);
-		config &= ~(CNTRLREG_TSCSSENB);
+		config &= ~(CNTRLREG_SSENB);
 		tiadc_writel(adc_dev, REG_CTRL, config);
 		tiadc_writel(adc_dev, REG_IRQSTATUS, IRQENB_FIFO1OVRRUN
 				| IRQENB_FIFO1UNDRFLW | IRQENB_FIFO1THRES);
@@ -197,7 +197,7 @@ static irqreturn_t tiadc_irq_h(int irq, void *private)
 			adc_fsm = tiadc_readl(adc_dev, REG_ADCFSM);
 		} while (adc_fsm != 0x10 && count++ < 100);
 
-		tiadc_writel(adc_dev, REG_CTRL, (config | CNTRLREG_TSCSSENB));
+		tiadc_writel(adc_dev, REG_CTRL, (config | CNTRLREG_SSENB));
 		return IRQ_HANDLED;
 	} else if (status & IRQENB_FIFO1THRES) {
 		/* Disable irq and wake worker thread */
@@ -671,7 +671,7 @@ static int __maybe_unused tiadc_suspend(struct device *dev)
 	unsigned int idle;
 
 	idle = tiadc_readl(adc_dev, REG_CTRL);
-	idle &= ~(CNTRLREG_TSCSSENB);
+	idle &= ~(CNTRLREG_SSENB);
 	tiadc_writel(adc_dev, REG_CTRL, (idle |
 			CNTRLREG_POWERDOWN));
 
diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index d661e8ae66c9..dd303523f9a3 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -229,7 +229,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	tscadc_idle_config(tscadc);
 
 	/* Enable the TSC module enable bit */
-	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_TSCSSENB);
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_SSENB);
 
 	/* TSC Cell */
 	if (tsc_wires > 0) {
@@ -293,7 +293,7 @@ static int __maybe_unused tscadc_suspend(struct device *dev)
 
 		regmap_read(tscadc->regmap, REG_CTRL, &ctrl);
 		ctrl &= ~(CNTRLREG_POWERDOWN);
-		ctrl |= CNTRLREG_TSCSSENB;
+		ctrl |= CNTRLREG_SSENB;
 		regmap_write(tscadc->regmap, REG_CTRL, ctrl);
 	}
 	pm_runtime_put_sync(dev);
@@ -310,7 +310,7 @@ static int __maybe_unused tscadc_resume(struct device *dev)
 	regmap_write(tscadc->regmap, REG_CLKDIV, tscadc->clk_div);
 	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl);
 	tscadc_idle_config(tscadc);
-	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_TSCSSENB);
+	regmap_write(tscadc->regmap, REG_CTRL, tscadc->ctrl | CNTRLREG_SSENB);
 
 	return 0;
 }
diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index 02963b6ebbac..a900fae8354c 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -118,7 +118,7 @@
 #define CHARGEDLY_OPENDLY	CHARGEDLY_OPEN(0x400)
 
 /* Control register */
-#define CNTRLREG_TSCSSENB	BIT(0)
+#define CNTRLREG_SSENB		BIT(0)
 #define CNTRLREG_STEPID		BIT(1)
 #define CNTRLREG_STEPCONFIGWRT	BIT(2)
 #define CNTRLREG_POWERDOWN	BIT(4)
-- 
2.27.0


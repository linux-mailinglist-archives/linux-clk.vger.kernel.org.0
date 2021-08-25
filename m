Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C8A3F78B8
	for <lists+linux-clk@lfdr.de>; Wed, 25 Aug 2021 17:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240903AbhHYPey (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Aug 2021 11:34:54 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:58719 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhHYPey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 11:34:54 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 441B8C024E;
        Wed, 25 Aug 2021 15:26:23 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C6DECC000B;
        Wed, 25 Aug 2021 15:25:59 +0000 (UTC)
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
Subject: [PATCH 19/40] mfd: ti_am335x_tscadc: Always provide an idle configuration
Date:   Wed, 25 Aug 2021 17:24:57 +0200
Message-Id: <20210825152518.379386-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210825152518.379386-1-miquel.raynal@bootlin.com>
References: <20210825152518.379386-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The idle register is valid no matter if the touchscreen is used or not,
let's always configure it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mfd/ti_am335x_tscadc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 258199be4c6a..7071344ad18e 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -218,16 +218,16 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	ctrl = CNTRLREG_STEPCONFIGWRT |	CNTRLREG_STEPID;
 	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
 
-	/* Set register bits for Idle Config Mode */
 	if (tsc_wires > 0) {
 		tscadc->tsc_wires = tsc_wires;
 		if (tsc_wires == 5)
 			ctrl |= CNTRLREG_5WIRE | CNTRLREG_TSCENB;
 		else
 			ctrl |= CNTRLREG_4WIRE | CNTRLREG_TSCENB;
-		tscadc_idle_config(tscadc);
 	}
 
+	tscadc_idle_config(tscadc);
+
 	/* Enable the TSC module enable bit */
 	ctrl |= CNTRLREG_TSCSSENB;
 	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
@@ -318,12 +318,12 @@ static int __maybe_unused tscadc_resume(struct device *dev)
 			ctrl |= CNTRLREG_5WIRE | CNTRLREG_TSCENB;
 		else
 			ctrl |= CNTRLREG_4WIRE | CNTRLREG_TSCENB;
-		tscadc_idle_config(tscadc);
 	}
 	ctrl |= CNTRLREG_TSCSSENB;
 	regmap_write(tscadc->regmap, REG_CTRL, ctrl);
 
 	regmap_write(tscadc->regmap, REG_CLKDIV, tscadc->clk_div);
+	tscadc_idle_config(tscadc);
 
 	return 0;
 }
-- 
2.27.0


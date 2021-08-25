Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6944C3F7922
	for <lists+linux-clk@lfdr.de>; Wed, 25 Aug 2021 17:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242018AbhHYPfs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Aug 2021 11:35:48 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:50401 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241890AbhHYPfj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 11:35:39 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id D2181CE097;
        Wed, 25 Aug 2021 15:26:53 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54FE7C0006;
        Wed, 25 Aug 2021 15:26:30 +0000 (UTC)
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
Subject: [PATCH 34/40] iio: adc: ti_am335x_adc: Add a unit to the timeout delay
Date:   Wed, 25 Aug 2021 17:25:12 +0200
Message-Id: <20210825152518.379386-35-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210825152518.379386-1-miquel.raynal@bootlin.com>
References: <20210825152518.379386-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The lack of unit in the macro name kind of tricked me when I was
troubleshooting an issue. Physical constants should always get a unit.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/iio/adc/ti_am335x_adc.c      | 2 +-
 include/linux/mfd/ti_am335x_tscadc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index 4eaf5b031707..ebf6326af60d 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -441,7 +441,7 @@ static int tiadc_read_raw(struct iio_dev *indio_dev,
 	am335x_tsc_se_set_once(adc_dev->mfd_tscadc, step_en);
 
 	/* Wait for Fifo threshold interrupt */
-	timeout = jiffies + msecs_to_jiffies(IDLE_TIMEOUT * adc_dev->channels);
+	timeout = jiffies + msecs_to_jiffies(IDLE_TIMEOUT_MS * adc_dev->channels);
 	while (1) {
 		fifo1count = tiadc_readl(adc_dev, REG_FIFO1CNT);
 		if (fifo1count)
diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index 31b22ec567e7..177ab2499200 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -164,7 +164,7 @@
  *
  * max processing time: 266431 * 308ns = 83ms(approx)
  */
-#define IDLE_TIMEOUT 83 /* milliseconds */
+#define IDLE_TIMEOUT_MS 83 /* milliseconds */
 
 #define TSCADC_CELLS		2
 
-- 
2.27.0


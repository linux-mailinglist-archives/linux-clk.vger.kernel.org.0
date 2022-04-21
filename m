Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BFE509B9B
	for <lists+linux-clk@lfdr.de>; Thu, 21 Apr 2022 11:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387209AbiDUJDi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Apr 2022 05:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387151AbiDUJD2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 05:03:28 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7B522284;
        Thu, 21 Apr 2022 02:00:31 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9810F60004;
        Thu, 21 Apr 2022 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650531630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=24sVVKbc9ENk+PbrPQ2gCfe5XhtnOjDLbk36zBZqiFM=;
        b=B+rVTceSFnPdaymfjN/cj2EQlgJQZl6TWOy3YzRBPhdUNnnCl9yEsEi5h8Or4Q9x5dcq/t
        rLZXpqH6hxCVtbqr6oAN0iNje0DlMuzQPfnMRm9GxldVjfEOKyuu22pvH04sI0gIOBiL1p
        hM/xM3On1hxSliCla5J5A8G1TAlL8ujru5jZPznm4Yb7svdagDS0Y/u49/lHNT0LCozZ5v
        Jo3vjCE8H2mzrcaVxcg5/DheH4sv2bjHr6f585pwPG8VubU3hdaIJ4vr+SnGFqEz0zLkJ0
        M0Cqs3FWwfjiIWlRkoq5g/PZ+qK9p1x850HRzEW7fT6uou8Xp7yNPnJoybU6eg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v2 3/7] rtc: rzn1: Add new RTC driver
Date:   Thu, 21 Apr 2022 11:00:12 +0200
Message-Id: <20220421090016.79517-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421090016.79517-1-miquel.raynal@bootlin.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michel Pollet <michel.pollet@bp.renesas.com>

Add a basic RTC driver for the RZ/N1.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/Kconfig    |   7 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-rzn1.c | 250 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/rtc/rtc-rzn1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 41c65b4d2baf..f4d72c5b99ea 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1548,6 +1548,13 @@ config RTC_DRV_RS5C313
 	help
 	  If you say yes here you get support for the Ricoh RS5C313 RTC chips.
 
+config RTC_DRV_RZN1
+	tristate "Renesas RZN1 RTC"
+	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
 	# Please consider writing a new RTC driver instead of using the generic
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 2d827d8261d5..fb04467b652d 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_RTC_DRV_RX6110)	+= rtc-rx6110.o
 obj-$(CONFIG_RTC_DRV_RX8010)	+= rtc-rx8010.o
 obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
+obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
new file mode 100644
index 000000000000..a5dfb5bb163c
--- /dev/null
+++ b/drivers/rtc/rtc-rzn1.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Renesas RZN1 Real Time Clock interface for Linux
+ *
+ * Copyright:
+ * - 2014 Renesas Electronics Europe Limited
+ * - 2022 Schneider Electric
+ *
+ * Authors:
+ * - Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
+ * - Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+#include <linux/bcd.h>
+#include <linux/clk.h>
+#include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/soc/renesas/r9a06g032-sysctrl.h>
+
+#define RZN1_RTC_CTL0 0x00
+#define   RZN1_RTC_CTL0_SLSB_SUBU 0
+#define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
+#define   RZN1_RTC_CTL0_AMPM BIT(5)
+#define   RZN1_RTC_CTL0_CE BIT(7)
+
+#define RZN1_RTC_CTL1 0x04
+#define   RZN1_RTC_CTL1_ALME BIT(4)
+
+#define RZN1_RTC_CTL2 0x08
+#define   RZN1_RTC_CTL2_WAIT BIT(0)
+#define   RZN1_RTC_CTL2_WST BIT(1)
+#define   RZN1_RTC_CTL2_WUST BIT(5)
+#define   RZN1_RTC_CTL2_STOPPED (RZN1_RTC_CTL2_WAIT | RZN1_RTC_CTL2_WST)
+
+#define RZN1_RTC_SEC 0x14
+#define RZN1_RTC_MIN 0x18
+#define RZN1_RTC_HOUR 0x1c
+#define RZN1_RTC_WEEK 0x20
+#define RZN1_RTC_DAY 0x24
+#define RZN1_RTC_MONTH 0x28
+#define RZN1_RTC_YEAR 0x2c
+
+#define RZN1_RTC_SUBU 0x38
+#define   RZN1_RTC_SUBU_DEV BIT(7)
+#define   RZN1_RTC_SUBU_DECR BIT(6)
+
+#define RZN1_RTC_ALM 0x40
+#define RZN1_RTC_ALH 0x44
+#define RZN1_RTC_ALW 0x48
+
+#define RZN1_RTC_SECC 0x4c
+#define RZN1_RTC_MINC 0x50
+#define RZN1_RTC_HOURC 0x54
+#define RZN1_RTC_WEEKC 0x58
+#define RZN1_RTC_DAYC 0x5c
+#define RZN1_RTC_MONTHC 0x60
+#define RZN1_RTC_YEARC 0x64
+
+struct rzn1_rtc {
+	struct rtc_device *rtcdev;
+	void __iomem *base;
+	struct clk *clk;
+};
+
+static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
+{
+	tm->tm_sec = readl(rtc->base + RZN1_RTC_SECC);
+	tm->tm_min = readl(rtc->base + RZN1_RTC_MINC);
+	tm->tm_hour = readl(rtc->base + RZN1_RTC_HOURC);
+	tm->tm_wday = readl(rtc->base + RZN1_RTC_WEEKC);
+	tm->tm_mday = readl(rtc->base + RZN1_RTC_DAYC);
+	tm->tm_mon = readl(rtc->base + RZN1_RTC_MONTHC);
+	tm->tm_year = readl(rtc->base + RZN1_RTC_YEARC);
+}
+
+static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
+{
+	time64_t time;
+	unsigned int days;
+	u32 secs;
+
+	time = rtc_tm_to_time64(tm);
+	days = div_s64_rem(time, 86400, &secs);
+
+	/* day of the week, 1970-01-01 was a Thursday */
+	return (days + 4) % 7;
+}
+
+static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	u32 val, secs;
+
+	/*
+	 * The RTC was not started or is stopped and thus does not carry the
+	 * proper time/date.
+	 */
+	val = readl(rtc->base + RZN1_RTC_CTL2);
+	if (val & RZN1_RTC_CTL2_STOPPED)
+		return -EINVAL;
+
+	rzn1_rtc_get_time_snapshot(rtc, tm);
+	secs = readl(rtc->base + RZN1_RTC_SECC);
+	if (tm->tm_sec != secs)
+		rzn1_rtc_get_time_snapshot(rtc, tm);
+
+	tm->tm_sec = bcd2bin(tm->tm_sec);
+	tm->tm_min = bcd2bin(tm->tm_min);
+	tm->tm_hour = bcd2bin(tm->tm_hour);
+	tm->tm_wday = bcd2bin(tm->tm_wday);
+	tm->tm_mday = bcd2bin(tm->tm_mday);
+	tm->tm_mon = bcd2bin(tm->tm_mon);
+	tm->tm_year = bcd2bin(tm->tm_year);
+
+	return 0;
+}
+
+static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	tm->tm_sec = bin2bcd(tm->tm_sec);
+	tm->tm_min = bin2bcd(tm->tm_min);
+	tm->tm_hour = bin2bcd(tm->tm_hour);
+	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
+	tm->tm_mday = bin2bcd(tm->tm_mday);
+	tm->tm_mon = bin2bcd(tm->tm_mon);
+	tm->tm_year = bin2bcd(tm->tm_year);
+
+	val = readl(rtc->base + RZN1_RTC_CTL2);
+	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
+		/* Hold the counter if it was counting up */
+		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
+
+		/* Wait for the counter to stop: two 32k clock cycles */
+		usleep_range(61, 100);
+		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
+					 val & RZN1_RTC_CTL2_WST, 0, 100);
+		if (ret)
+			return ret;
+	}
+
+	writel(tm->tm_sec, rtc->base + RZN1_RTC_SEC);
+	writel(tm->tm_min, rtc->base + RZN1_RTC_MIN);
+	writel(tm->tm_hour, rtc->base + RZN1_RTC_HOUR);
+	writel(tm->tm_wday, rtc->base + RZN1_RTC_WEEK);
+	writel(tm->tm_mday, rtc->base + RZN1_RTC_DAY);
+	writel(tm->tm_mon, rtc->base + RZN1_RTC_MONTH);
+	writel(tm->tm_year, rtc->base + RZN1_RTC_YEAR);
+	writel(0, rtc->base + RZN1_RTC_CTL2);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rzn1_rtc_ops = {
+	.read_time = rzn1_rtc_read_time,
+	.set_time = rzn1_rtc_set_time,
+};
+
+static int rzn1_rtc_probe(struct platform_device *pdev)
+{
+	struct rzn1_rtc *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->clk = devm_clk_get(&pdev->dev, "hclk");
+	if (IS_ERR(rtc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n");
+
+	rtc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rtc->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+
+	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtcdev))
+		return PTR_ERR(rtc);
+
+	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->rtcdev->ops = &rzn1_rtc_ops;
+	clear_bit(RTC_FEATURE_ALARM, rtc->rtcdev->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
+
+	ret = clk_prepare_enable(rtc->clk);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure the clock counter is enabled.
+	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
+	 */
+	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
+	       rtc->base + RZN1_RTC_CTL0);
+
+	/* Disable all interrupts */
+	writel(0, rtc->base + RZN1_RTC_CTL1);
+
+	ret = devm_rtc_register_device(rtc->rtcdev);
+	if (ret)
+		goto disable_clk;
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(rtc->clk);
+
+	return ret;
+}
+
+static int rzn1_rtc_remove(struct platform_device *pdev)
+{
+	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(rtc->clk);
+
+	return 0;
+}
+
+static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,rzn1-rtc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
+
+static struct platform_driver rzn1_rtc_driver = {
+	.probe = rzn1_rtc_probe,
+	.remove = rzn1_rtc_remove,
+	.driver = {
+		.name	= "rzn1-rtc",
+		.owner	= THIS_MODULE,
+		.of_match_table = rzn1_rtc_of_match,
+	},
+};
+module_platform_driver(rzn1_rtc_driver);
+
+MODULE_AUTHOR("Michel Pollet <Michel.Pollet@bp.renesas.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_DESCRIPTION("RZ/N1 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0


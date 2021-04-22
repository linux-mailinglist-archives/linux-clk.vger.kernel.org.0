Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4257F367A67
	for <lists+linux-clk@lfdr.de>; Thu, 22 Apr 2021 08:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhDVG6T (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Apr 2021 02:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbhDVG6T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Apr 2021 02:58:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CFDC06174A
        for <linux-clk@vger.kernel.org>; Wed, 21 Apr 2021 23:57:44 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZTHJ-0006Td-VU; Thu, 22 Apr 2021 08:57:33 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZTHJ-0003OH-9w; Thu, 22 Apr 2021 08:57:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-rtc@vger.kernel.org
Subject: [PATCH v5 4/6] rtc: at91sma9: Simplify using devm_clk_get_enabled()
Date:   Thu, 22 Apr 2021 08:57:24 +0200
Message-Id: <20210422065726.1646742-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422065726.1646742-1-u.kleine-koenig@pengutronix.de>
References: <20210422065726.1646742-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-at91sam9.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 2216be429ab7..b52e7bd26303 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -374,21 +374,14 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
+	rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(rtc->sclk))
 		return PTR_ERR(rtc->sclk);
 
-	ret = clk_prepare_enable(rtc->sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
-	}
-
 	sclk_rate = clk_get_rate(rtc->sclk);
 	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
 		dev_err(&pdev->dev, "Invalid slow clock rate\n");
-		ret = -EINVAL;
-		goto err_clk;
+		return -EINVAL;
 	}
 
 	mr = rtt_readl(rtc, MR);
@@ -406,7 +399,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev)) {
 		ret = PTR_ERR(rtc->rtcdev);
-		goto err_clk;
+		return ret;
 	}
 
 	rtc->rtcdev->ops = &at91_rtc_ops;
@@ -418,7 +411,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			       dev_name(&rtc->rtcdev->dev), rtc);
 	if (ret) {
 		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
@@ -432,11 +425,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			 dev_name(&rtc->rtcdev->dev));
 
 	return devm_rtc_register_device(rtc->rtcdev);
-
-err_clk:
-	clk_disable_unprepare(rtc->sclk);
-
-	return ret;
 }
 
 /*
@@ -450,8 +438,6 @@ static int at91_rtc_remove(struct platform_device *pdev)
 	/* disable all interrupts */
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
 
-	clk_disable_unprepare(rtc->sclk);
-
 	return 0;
 }
 
-- 
2.30.2


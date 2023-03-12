Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD1C6B680E
	for <lists+linux-clk@lfdr.de>; Sun, 12 Mar 2023 17:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjCLQQC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 12 Mar 2023 12:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjCLQPv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Mar 2023 12:15:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212454D2B5
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:15:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLz-0007q3-CF; Sun, 12 Mar 2023 17:15:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLy-003f2i-Oh; Sun, 12 Mar 2023 17:15:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLy-004K98-0D; Sun, 12 Mar 2023 17:15:22 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 18/30] clk: keystone: Convert to platform remove callback returning void
Date:   Sun, 12 Mar 2023 17:15:00 +0100
Message-Id: <20230312161512.2715500-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EdxpF9B3WevfLOCMcjAbOLN0OKWfDkQVotXJZRfvPU8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDfpdmGxBzJ7rYzLX8wC5RQFJSkGcMuClwg3yA dBWvUrN1waJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA36XQAKCRDB/BR4rcrs Ce6zCACAc5Dsu8CfbYeza6I0tWh8Pvi239Ywn32eZEcBLa/U12ZcdegfxZaZ9x7i6L+NkxW0lhj fx7skQVtNlhSbxawvIMUE6oPRT//UZJGEFo5LcL2WypYFfFwAt3X+a1ve6vH8O3sGFY5LLarJ4u iGslA6xK0d2rcXjW8WDDjkQMiFqUZ45YpLo1o0BjVNXKPJ0cE7qW/s2mcex6dfr7M0F3Udjk/t+ uA39pWbhe9Xpy+71ntFva3IPVzXwcJvZRIm6EVf9g8hMVHpZmN1NZR1BdKbxv8CupGmdap00eGp uHIdAqmAM/tLYv7VJQVs7SUiY/oNRtOEuoCFNSITpo6Yg/hU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/keystone/sci-clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index d4b4e74e22da..910ecd58c4ca 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -689,16 +689,14 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
  * via common clock framework. Any memory allocated for the device will
  * be free'd silently via the devm framework. Returns 0 always.
  */
-static int ti_sci_clk_remove(struct platform_device *pdev)
+static void ti_sci_clk_remove(struct platform_device *pdev)
 {
 	of_clk_del_provider(pdev->dev.of_node);
-
-	return 0;
 }
 
 static struct platform_driver ti_sci_clk_driver = {
 	.probe = ti_sci_clk_probe,
-	.remove = ti_sci_clk_remove,
+	.remove_new = ti_sci_clk_remove,
 	.driver = {
 		.name = "ti-sci-clk",
 		.of_match_table = of_match_ptr(ti_sci_clk_of_match),
-- 
2.39.1


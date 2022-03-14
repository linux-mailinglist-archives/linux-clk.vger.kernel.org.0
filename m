Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0114D8692
	for <lists+linux-clk@lfdr.de>; Mon, 14 Mar 2022 15:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242218AbiCNOSU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 14 Mar 2022 10:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242222AbiCNOST (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 10:18:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E480819C2B
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 07:17:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-0004zV-JM; Mon, 14 Mar 2022 15:16:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-000f35-Nf; Mon, 14 Mar 2022 15:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVJ-0097ay-KN; Mon, 14 Mar 2022 15:16:57 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 08/16] drm/meson: dw-hdmi: Don't open code devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:35 +0100
Message-Id: <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666; i=uwe@kleine-koenig.org; h=from:subject; bh=YhET4fR0Omj8gJ/JCkSwUJxwvBYawy9/DlBkkMAAnOI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04EyEHJOItayKHmew1fSM2xmrHq4+SWHnqUOQnS kKp0Dr2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OBAAKCRDB/BR4rcrsCddkCA CAisftWSdUNCnYOFUA6r4wIsgWzLZYQ396YWYMZkQQBC6DXAThdrh1a/WIy8BEpr3wbFQNBL2loko5 kJ2p6cWyeNYDVeKT7iRuClSG8JnvWw55qDtphq6pz4SQXK2Un3STKZc26NxmIoln93Yg+qfevK5WnG ydjVSz0wApZ769rEmeP45xTHd7rRYDiXWw4GeEeTvBR/alJGPVrpp2K6QqWMdJpae2GsFFRpULtrJe fSHYK6Yo5jEbhgaIu47FXZkBYBWfygDwv/BVwA3xd5S5kHHm+RAjQ0dodEJ8I/Rr9LbHYit2s4f5Je H3fc37FLniTUu0zu464M9/qguAsgrO
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_clk_get_enabled() returns a clock prepared and enabled and already
registers a devm exit handler to disable (and unprepare) the clock.

There is slight change in behavior as a failure to enable the clock
now results in an error message, too. Also the actual error code is added
to the message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++++++------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cd2b2ebbbd3..6034e80c5b2e 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -670,29 +670,6 @@ static void meson_disable_regulator(void *data)
 	regulator_disable(data);
 }
 
-static void meson_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int meson_enable_clk(struct device *dev, char *name)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, name);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Unable to get %s pclk\n", name);
-		return PTR_ERR(clk);
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (!ret)
-		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
-
-	return ret;
-}
-
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -702,6 +679,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
+	struct clk *clk;
 	int irq;
 	int ret;
 
@@ -763,17 +741,23 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	ret = meson_enable_clk(dev, "isfr");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "isfr");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get enabled isfr pclk (%pe)\n", clk);
+		return PTR_ERR(clk);
+	}
 
-	ret = meson_enable_clk(dev, "iahb");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "iahb");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get enabled iahb pclk (%pe)\n", clk);
+		return PTR_ERR(clk);
+	}
 
-	ret = meson_enable_clk(dev, "venci");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "venci");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Failed to get enabled venci pclk (%pe)\n", clk);
+		return PTR_ERR(clk);
+	}
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.35.1


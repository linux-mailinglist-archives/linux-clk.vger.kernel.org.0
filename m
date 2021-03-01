Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C257327CD8
	for <lists+linux-clk@lfdr.de>; Mon,  1 Mar 2021 12:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbhCALJX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 1 Mar 2021 06:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhCALJV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Mar 2021 06:09:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF539C061788
        for <linux-clk@vger.kernel.org>; Mon,  1 Mar 2021 03:08:40 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGgPk-0001Im-VC; Mon, 01 Mar 2021 12:08:36 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lGgPj-0002yR-Fy; Mon, 01 Mar 2021 12:08:35 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 1/3] clk: generalize devm_clk_get() a bit
Date:   Mon,  1 Mar 2021 12:08:19 +0100
Message-Id: <20210301110821.1445756-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301110821.1445756-1-uwe@kleine-koenig.org>
References: <20210301110821.1445756-1-uwe@kleine-koenig.org>
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

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Allow to add an exit hook to devm managed clocks. Also use
clk_get_optional() in devm_clk_get_optional instead of open coding it.
The generalisation will be used in the next commit to add some more
devm_clk helpers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-devres.c | 75 +++++++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index be160764911b..7ba8670deeb6 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -4,39 +4,72 @@
 #include <linux/export.h>
 #include <linux/gfp.h>
 
+struct devm_clk_state {
+	struct clk *clk;
+	void (*exit)(struct clk *clk);
+};
+
 static void devm_clk_release(struct device *dev, void *res)
 {
-	clk_put(*(struct clk **)res);
+	struct devm_clk_state *state = *(struct devm_clk_state **)res;
+
+	if (state->exit)
+		state->exit(state->clk);
+
+	clk_put(state->clk);
+}
+
+struct clk *__devm_clk_get(struct device *dev, const char *id,
+			   struct clk *(*get)(struct device *dev, const char *id),
+			   int (*init)(struct clk *clk),
+			   void (*exit)(struct clk *clk))
+{
+	struct devm_clk_state *state;
+	struct clk *clk;
+	int ret;
+
+	state = devres_alloc(devm_clk_release, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	clk = get(dev, id);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		goto err_clk_get;
+	}
+
+	if (init) {
+		ret = init(clk);
+		if (ret)
+			goto err_clk_init;
+	}
+
+	state->clk = clk;
+	state->exit = exit;
+
+	devres_add(dev, state);
+
+	return clk;
+
+err_clk_init:
+
+	clk_put(clk);
+err_clk_get:
+
+	devres_free(state);
+	return ERR_PTR(ret);
 }
 
 struct clk *devm_clk_get(struct device *dev, const char *id)
 {
-	struct clk **ptr, *clk;
+	return __devm_clk_get(dev, id, clk_get, NULL, NULL);
 
-	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
-
-	clk = clk_get(dev, id);
-	if (!IS_ERR(clk)) {
-		*ptr = clk;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return clk;
 }
 EXPORT_SYMBOL(devm_clk_get);
 
 struct clk *devm_clk_get_optional(struct device *dev, const char *id)
 {
-	struct clk *clk = devm_clk_get(dev, id);
-
-	if (clk == ERR_PTR(-ENOENT))
-		return NULL;
-
-	return clk;
+	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
 }
 EXPORT_SYMBOL(devm_clk_get_optional);
 
-- 
2.30.0


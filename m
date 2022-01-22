Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E09496B43
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jan 2022 10:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbiAVJS2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 22 Jan 2022 04:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbiAVJSS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:18 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DA7C06173D
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:18 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id c5so10236700pgk.12
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=09dDye5BTCvVOx6QTdRmbLqERJKxycNqJsPrVtKKxIE=;
        b=X3nIg5syolDA5HTdP7//AqfI4DJhbQGH46eWBgE4YrqJbpegvuy5ySZCOWf+X4wydK
         PNoitdzRr/Dmxm9+e3Den/5btX1k/CCClXLx7nT9PJ0XmJCJfRhD9wzIfRps3y2eGcp4
         tsPfpIzu5etmcDeibSN0H6wmhO6CcAKJ6YS94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09dDye5BTCvVOx6QTdRmbLqERJKxycNqJsPrVtKKxIE=;
        b=PESNXSZwCR+FaBLxSDOvihbkF97WzumDQrhDIYi1nmUzyLs5RDtzArMadxISqrlZ3G
         tdzHpwwHES2NE0pSkSDnhoYyaKgyXFjeDWpsYVKUv5XXhb7lH/t5sZbvMjePyU1k1w5T
         ZVtw7mjU9Ke+OabdjDfl6GPtXnoH26fHrFe+F5oJvEwRvcJrQZwymRAacSfPwbJKNFhH
         LrA3YL0+rITZSVksOwErOZLZuRsS+/maAmBvi8/7HB5gGFuiKW13cGJSKBCHphAB+iiE
         zxbL75CHTlmqPCifz0v0Lwbgi59JZknfw7AUVLHmdJmzDtzuWnu1FVpRXsd8T+hYQ+zq
         MYeQ==
X-Gm-Message-State: AOAM532/jJlZTouHpmttauG5thCiaRlZ5orIxv/fez3hPv3HieA31vuW
        h+lqYeIA37ci68W6AEB24o4s4x/oYeZvzQ==
X-Google-Smtp-Source: ABdhPJxMWFtklW2XRMgutkF5dkiCv5I5Xs1QlLxCtE78BQzj9qwRiqQ5OKon4OfL+/Wvz2V100nLCA==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr5515957pgn.414.1642843097972;
        Sat, 22 Jan 2022 01:18:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:17 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 15/31] clk: mediatek: Implement mtk_clk_unregister_fixed_clks() API
Date:   Sat, 22 Jan 2022 17:17:15 +0800
Message-Id: <20220122091731.283592-16-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_fixed_clks(), as the name suggests, is used to register
a given list of fixed rate clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0c5db3c71fdd..7c0d5706eed7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_clk *rc = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+			continue;
+
+		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
+		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
+
 void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 168220f85489..cc7f920eabb4 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -34,8 +34,10 @@ struct mtk_fixed_clk {
 		.rate = _rate,				\
 	}
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				 struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_fixed_factor {
 	int id;
-- 
2.35.0.rc0.227.g00780c9af4-goog


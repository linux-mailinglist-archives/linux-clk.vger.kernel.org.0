Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F244A722B
	for <lists+linux-clk@lfdr.de>; Wed,  2 Feb 2022 14:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344704AbiBBNu4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Feb 2022 08:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344756AbiBBNum (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:42 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3003EC061765
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:29 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id s6so12750662plg.12
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/X1xbqtIcStarTs4c2+W6s0YHf8t7yF3UKC31OhAY/I=;
        b=aF+d4V20wz3PCFjPHAZuLztiRKZsart1Aj14opdzWw7+9yapzvxbwicJNonkhZRjO3
         PKJ+VB7NjzujZClFOs2I16KAAF/iDFkmMkYoSgH5knW+pPKb/GTJIdTYbRJsQNRh9JTz
         CUlwLMNOUQ1rUEEcGWFjJLSUiz30l+rEAd/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/X1xbqtIcStarTs4c2+W6s0YHf8t7yF3UKC31OhAY/I=;
        b=0iwOIfRaJC3Wh3J2AVP3psxaSxZXSZN0w1N5flTNUA0Q5yBj1uYK3hyc2tl2Dv8asU
         2tGbK9OjFbdKZq4Wi+Ks7ovQ9ktXLEY7w0M/Fp3yuQ/B/QK4/RJ7z7f9DFO+cvFYMlE3
         OaVigpHGehwzhaF9MGa3yuKyc7v0xxaO1DBwrU7zAmB1Nn+CYIdA3Po+vrAlvuZmDiN3
         rMctqv9ddafkHFNoYqouCy3Pu0G4mfVhWDRbe3Q78DzX4K+6wBRJ7G83q5zeDz0bcgM0
         4oGvUmoWX8ggbIY3N+Tm4Y/goYwuy9kuv+x11VTBm3a8/4uewp/PM3BrSnRNuDNMYqee
         exww==
X-Gm-Message-State: AOAM533TW6fZyEn7nbLPJc4AK4ygTUyHWfutrWAGbMM1Uc9u4HG6jX/p
        E3Z1dpY16Cp2BJcB0YUq1jjLzQ==
X-Google-Smtp-Source: ABdhPJxlPoarr0PYhm4khqpH/LZy+sL3IANoFaQkok7/pMhWzxpEt8o+PM6/CSoMpKaNSmyBZ4leCw==
X-Received: by 2002:a17:903:124e:: with SMTP id u14mr30286128plh.146.1643809828752;
        Wed, 02 Feb 2022 05:50:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:28 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/31] clk: mediatek: pll: Implement error handling in register API
Date:   Wed,  2 Feb 2022 21:48:28 +0800
Message-Id: <20220202134834.690675-26-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pll clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, and unmap the I/O space, is done in the new
error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 +++---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 8439d37e354d..817a80293bfc 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -377,8 +377,9 @@ static void mtk_clk_unregister_pll(struct clk *clk)
 	kfree(pll);
 }
 
-void mtk_clk_register_plls(struct device_node *node,
-		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data)
 {
 	void __iomem *base;
 	int i;
@@ -387,7 +388,7 @@ void mtk_clk_register_plls(struct device_node *node,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < num_plls; i++) {
@@ -397,11 +398,25 @@ void mtk_clk_register_plls(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[pll->id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_pll_data *pll = &plls[i];
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	iounmap(base);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index a889b1e472e7..bf06e44caef9 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -48,9 +48,9 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
-void mtk_clk_register_plls(struct device_node *node,
-			   const struct mtk_pll_data *plls, int num_plls,
-			   struct clk_onecell_data *clk_data);
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_onecell_data *clk_data);
 
-- 
2.35.0.rc2.247.g8bbb082509-goog


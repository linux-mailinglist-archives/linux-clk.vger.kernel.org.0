Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DB6496B41
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jan 2022 10:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbiAVJS0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 22 Jan 2022 04:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbiAVJSO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:14 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0C4C06173B
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:13 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id c9so10869864plg.11
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MgVxYLqn7e5CbtxyDunniYd0pM9V2lFEkskjcE0RgkM=;
        b=Uoy5LPBTFoU2mLPls+lvhUkx952hkxqIoO9usG6HBvsf5PK45trlJ0cDer4J2/ruQk
         YeehYSwjMVpGOqkFHMSSV0qnghdbQP4B5f4R6C/O/pqag9DE5V9+z6qm/82kghl7gcyC
         fNTL245NESs6ROe+n/GD7AHbl6KxLkUBSESIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgVxYLqn7e5CbtxyDunniYd0pM9V2lFEkskjcE0RgkM=;
        b=sK0lbEQqc2i0OqdaCNzRQF9L/gli7Vt6cHn1WQdlvvgZdorGw7urNsRZq5IAp9KeLt
         TCb/DFxi3ZL4Apwx4iSE63JqQY44e7+XNPU4Y8XSGes27/Q0g1J3I+rXcFuTf3ESsNnh
         y5IFIg+rKeWyP9ZmYu44SfToZkWC8LHULyo6fok2WMLlLemQ8Zqe98u3gLnafqvRriju
         xXDWKXv7ihqoEiZl/dm2dh0ia1i7zNFkYpFclqOo7QJ1dAFVx4Gtf/klVlRLKx6Z1xqf
         dRpDGYk6IVaiAsXCwcVDLeetLQdOPwyUXnyxbGzcmGWyeTv2P+s5R71mmMzqrMrXBb4T
         cvSA==
X-Gm-Message-State: AOAM533OPa09GPXy2qT7EFRHc9nORagXO5hfDuV+aWUuy7GWIQGgtUvb
        kG2v9X2iipwVmBCfHE8JIaA2+Q==
X-Google-Smtp-Source: ABdhPJz5s0TxxuEXSon71jmhisUSFx3ph6WF8cavJgqsrEAxrQRzhkraOlOofKfWPWSYHQ/+KjByhQ==
X-Received: by 2002:a17:90a:b702:: with SMTP id l2mr4405014pjr.126.1642843093546;
        Sat, 22 Jan 2022 01:18:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:13 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/31] clk: mediatek: pll: Implement unregister API
Date:   Sat, 22 Jan 2022 17:17:13 +0800
Message-Id: <20220122091731.283592-14-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the PLL type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 49 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-pll.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 64f59554bc9b..081e0df8203e 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -360,6 +360,15 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	return clk;
 }
 
+static void mtk_clk_unregister_pll(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	clk_unregister(clk);
+	kfree(pll);
+}
+
 void mtk_clk_register_plls(struct device_node *node,
 		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
 {
@@ -388,4 +397,44 @@ void mtk_clk_register_plls(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
+static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
+					  const struct mtk_pll_data *data)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	return pll->base_addr - data->reg;
+}
+
+void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
+			     struct clk_onecell_data *clk_data)
+{
+	__iomem void *base = NULL;
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num_plls; i > 0; i--) {
+		const struct mtk_pll_data *pll = &plls[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
+			continue;
+
+		/*
+		 * This is quite ugly but unfortunately the clks don't have
+		 * any device tied to them, so there's no place to store the
+		 * pointer to the I/O region base address. We have to fetch
+		 * it from one of the registered clks.
+		 */
+		base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	iounmap(base);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_plls);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index d01b0c38311d..a889b1e472e7 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -51,5 +51,7 @@ struct mtk_pll_data {
 void mtk_clk_register_plls(struct device_node *node,
 			   const struct mtk_pll_data *plls, int num_plls,
 			   struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
+			     struct clk_onecell_data *clk_data);
 
 #endif /* __DRV_CLK_MTK_PLL_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


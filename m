Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907D3496B32
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jan 2022 10:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbiAVJR7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 22 Jan 2022 04:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiAVJRy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:17:54 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC112C06173D
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:17:53 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y27so6925524pfa.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KtrISZzE0fyOiFLPSAi2/kMw442HF+9pfy36Pe4/Xf0=;
        b=bUHYjg5d8+RE7Oyrz0Th/IjTPVsgQp2fMYyOe5ITkpZpEeY4GipFThT3+0QJ7LNrcu
         34HmkNTRZoTJFGRqdT6ovcQM8cU6kCz2PYRdlNTTNlHzzLxIGWMCQji9Z+O34mxUVtff
         t1A4FVOMxPgLnnUFmmbL/JDBeS/rEneWjbL9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KtrISZzE0fyOiFLPSAi2/kMw442HF+9pfy36Pe4/Xf0=;
        b=hb4HINTXDLVApZTBsuYkPLJwGtVYjaB7BdVQ2mNKfvynzRN1KrE4OIIf/+qlHKS+Jd
         FzlblWywVnHAuRO16HxVWYWghDMo98IiIIg4S+V4isL5sTl8jMB5m+pIwVIxoSB/eBvP
         MRTCqxUMKgs94BNslASjU0aeFywalpBa7J5YJLfztEYxHkanSN8xlOSrUgpKIdoueYML
         YXjf5QKUsapG0TcgR9J7tsVIKEheouuMR5y9jGXpEQ+6xkwjnzap5PVm/lyoph+4+r09
         ccDLjwcGNfPPexx+RcFNzvB3e6ipkR8LwehZ14Uq6Zwn2tcd+BPiY9ssDua7cNsFJ/y0
         8fpQ==
X-Gm-Message-State: AOAM530dLfNPXP+Gw5LBP53WYIegf0I07x5MmaFc7lXtWRb5YsRzA1n+
        gabtLTlXCySOwlQDs5KSmQMEAw==
X-Google-Smtp-Source: ABdhPJwgCHh5xfiilxhfkgh1LfEmERpWQwhEXhLaMwqsDpTCywBsx/lh+zUVqR5UyUh1HPRGDEAjbw==
X-Received: by 2002:a63:3808:: with SMTP id f8mr5460004pga.186.1642843073546;
        Sat, 22 Jan 2022 01:17:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:17:53 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/31] clk: mediatek: gate: Implement unregister API
Date:   Sat, 22 Jan 2022 17:17:04 +0800
Message-Id: <20220122091731.283592-5-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gate clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the gate type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-gate.c | 35 +++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-gate.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e51cfd8c653c..ed1ad5535d41 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -193,6 +193,21 @@ static struct clk *mtk_clk_register_gate(const char *name,
 	return clk;
 }
 
+static void mtk_clk_unregister_gate(struct clk *clk)
+{
+	struct mtk_clk_gate *cg;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	cg = to_mtk_clk_gate(hw);
+
+	clk_unregister(clk);
+	kfree(cg);
+}
+
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    const struct mtk_gate *clks, int num,
 				    struct clk_onecell_data *clk_data,
@@ -244,4 +259,24 @@ int mtk_clk_register_gates(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_gate *gate = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_gates);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 3d75521ba20c..344adffb6578 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -55,4 +55,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    struct clk_onecell_data *clk_data,
 				    struct device *dev);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_GATE_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


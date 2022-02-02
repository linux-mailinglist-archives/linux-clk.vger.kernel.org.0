Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C7A4A7219
	for <lists+linux-clk@lfdr.de>; Wed,  2 Feb 2022 14:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344508AbiBBNuZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Feb 2022 08:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbiBBNuN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:13 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F7CC061744
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:12 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id h23so18330068pgk.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdqER8KY39o0M6o27IczZWTaw020kfn22yTWl5kyALY=;
        b=n2JpvMVhjjJwqFphVfrI15VQG+1JJMJYetDB/WjD2E8sp8Ij+mxAKVC47NL1bh9cxy
         OmLwDMeOBZkgOzmt2C6eXbDqkA2Lxf814gH361WFKjl84b+IxJSHBW75t/fkNG/o5c9J
         COqyZj7X+WUmh75irkthHjmowhyJYhq9S2Z4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdqER8KY39o0M6o27IczZWTaw020kfn22yTWl5kyALY=;
        b=6DgPu0soVGT6f5u/CYRMgIjfu3dkmhdAYh8MUWZt58MS7gWwBE+KFNPFGTtUepDo9C
         5ryVP5O+MONkHKZ/OFUDjl5el3B8iAmFjt7e/0c8NkQsKakNceFYByhBCTvyhMr3nwRk
         KJuVyTPckYG1bu5KfvMjFdt9KppcfAmiyJuGPmIzvBtWxE4FkJKL6r90leLFpwy8K+p4
         vaH5tz+y3nMfU67TBKVGeF8ofMj+WJCvwkGBwNfexd8sJwzSzVO3tLfg91ccSot8+gVm
         Y08YrO2Ovu/UQEmaf+pMdrojLdyAqu0xoBB7vynRPE15KMB3VgDizSKPX9mde8VERggE
         iAiA==
X-Gm-Message-State: AOAM530DExsIVSPs7IS8uzirR8ZPg+AFgGJd1xU+2ZJBiBFGIbuLKSmw
        Ibey4j3aS29pLPXkbah2NVU5yA==
X-Google-Smtp-Source: ABdhPJwCruA99cnWXBiBLPDrFAMecZSCJ1O6DvdO/JNkZf58An/l4/zDvP7K+QHNRULGEqTyKmJi3Q==
X-Received: by 2002:a63:6c87:: with SMTP id h129mr24978840pgc.530.1643809812274;
        Wed, 02 Feb 2022 05:50:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:12 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/31] clk: mediatek: Implement mtk_clk_unregister_divider_clks() API
Date:   Wed,  2 Feb 2022 21:48:20 +0800
Message-Id: <20220202134834.690675-18-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_divider_clks(), as the name suggests, is used to register
a given list of divider clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  8 +++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b267b2f04b84..3a6dfe445e63 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -286,6 +286,25 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 	}
 }
 
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_clk_divider *mcd = &mcds[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+			continue;
+
+		clk_unregister_divider(clk_data->clks[mcd->id]);
+		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
+	}
+}
+
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4db1a97c1250..e3ae22fb0334 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,9 +176,11 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
-			int num, void __iomem *base, spinlock_t *lock,
-				struct clk_onecell_data *clk_data);
+void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			       void __iomem *base, spinlock_t *lock,
+			       struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
+				 struct clk_onecell_data *clk_data);
 
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
 void mtk_free_clk_data(struct clk_onecell_data *clk_data);
-- 
2.35.0.rc2.247.g8bbb082509-goog


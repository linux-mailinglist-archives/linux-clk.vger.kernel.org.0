Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810175066A5
	for <lists+linux-clk@lfdr.de>; Tue, 19 Apr 2022 10:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349750AbiDSIQE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Apr 2022 04:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349781AbiDSIQD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 04:16:03 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89202C122
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c12so14685461plr.6
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Weku3tK3QsQmvTCERbGIwfFGvzqht9p9BZS1XmEvotY=;
        b=iRJI5ml7K6kAK/onoLxDchA/ArVyOYamxU90RxXYOx6Pzg5aap3PFpRYnG/cbfGJd6
         /8vrlTiPABYe8GgWO2TOGciYVdjVpO0SLmFzLsJr3BBnNqQEkPxM1VOG9DPREEwn/MrS
         O3LSWUbVGUtObFi/zzy3ca9FJZ+wGXv0Cvj08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Weku3tK3QsQmvTCERbGIwfFGvzqht9p9BZS1XmEvotY=;
        b=xzODFpcl9Mpphd5Cqmwm8sOWXdAespJWM7pKXWyWoNW41q3DsqhFrfpxy8jHw5oi6E
         SsGMCHcmguMXOzI8Vd4uw/4nao364zEMlDSWBJ7Yi58e/eh6E8CJamRmd9ZUAAsmEfvE
         BKOMZg7bMUEYeauodmFrx0gli6doKJHUCUrF07aX/X32b9vEvoJLjI9OPQuqxnv6Qg18
         bQMl1NqAKa0QpMJd5XRTMQ3LgS0P9R2/5u7ro/kzNswf6dAfzLorpy9ikZxVdb/jzeOv
         M5iPlYeRjFd6+SHivyyGvUGNawqm8ayN1usAPZN6z7r9b5mb3+aPVZErWowFmqcGj6lz
         lkFw==
X-Gm-Message-State: AOAM531SDwFqvsmyCMkf051BBT/MztgJI70N4gyri3+6yH7KoU0QRWvs
        Dc4KFRgPPbVI8av1Me3VT0W/UQ==
X-Google-Smtp-Source: ABdhPJy2WKrXlaqCJkZtZm2wuCrjHhcU/3L6VkQg+6FopUOE3aGjPtuoWuBKFt+ExdfC73sGUt8/vg==
X-Received: by 2002:a17:902:e74f:b0:158:e890:2ed4 with SMTP id p15-20020a170902e74f00b00158e8902ed4mr14598622plf.32.1650355993497;
        Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
        by smtp.gmail.com with ESMTPSA id n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 01:13:13 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] clk: mediatek: mt8173: Fix usage of mtk_clk_register_ref2usb_tx()
Date:   Tue, 19 Apr 2022 16:12:45 +0800
Message-Id: <20220419081246.2546159-7-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The apmixed clk library contains one special clk type that doesn't fit
any of the generic clk types. This type is currently used only on the
MT8173 SoC. The code for this clk type was converted by the coccinelle
script from the previous patch, but the call site was not.

Fix the return variable type for mtk_clk_register_ref2usb_tx() in the
MT8173 clk driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 511b4da9e727..68d3a9749316 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -993,6 +993,7 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 {
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
+	struct clk_hw *hw;
 	struct clk *clk;
 	int r, i;
 
@@ -1013,16 +1014,13 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	for (i = 0; i < ARRAY_SIZE(apmixed_usb); i++) {
 		const struct mtk_clk_usb *cku = &apmixed_usb[i];
 
-		clk = mtk_clk_register_ref2usb_tx(cku->name, cku->parent,
-					base + cku->reg_ofs);
-
-		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n", cku->name,
-					PTR_ERR(clk));
+		hw = mtk_clk_register_ref2usb_tx(cku->name, cku->parent, base + cku->reg_ofs);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n", cku->name, PTR_ERR(hw));
 			continue;
 		}
 
-		clk_data->hws[cku->id] = __clk_get_hw(clk);
+		clk_data->hws[cku->id] = hw;
 	}
 
 	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-- 
2.36.0.rc0.470.gd361397f0d-goog


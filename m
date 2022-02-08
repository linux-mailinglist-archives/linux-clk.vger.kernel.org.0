Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831934AD910
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350388AbiBHNQQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358771AbiBHMlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:37 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1918EC03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:37 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id z17so3741457plb.9
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4j0R3HNeSGc+g80776sCkQCAjbvK19KbOBB/hGRldNk=;
        b=acB1/7BjmdHubG8NFsy4k7UA6MfRRMn4I+NVgkiU8wubRqG3ZE/NU9WNV3bqc/gc74
         f7yUl7C2eXS9BMC73EIc0+SXkB9SG9YhdoTVoZBgR1zXx+yMoe3c93OhwzqC8A+U2INA
         xrjNY7XBULuhL4YJPxoFrfx4sT02hLUb1ds6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4j0R3HNeSGc+g80776sCkQCAjbvK19KbOBB/hGRldNk=;
        b=c91w/xVlGLpj+MAPBGp9a+vi0OVbtOvArnB2R/Q0UuMfQFpKYIFGL6rlXsLNlrOVU/
         UEz58/dYB78PezAcRXqhGB2Xit3jzA+xbffPwCEGbxgcsuPZUY61ZQ/pHz+Ia7SAn2pW
         A1GYLauhLwtmrKNOkfmZS5CyCkRsZsWjOpy/8Pa6xgyJIojNmDiHDIBFY5xon0SY1CSX
         NWjPrWqif5LwoHMavRXDlbUOsfFs0s9RXttEWW4CYml1pPtXFHbO04S3PQEUr+fX5ry1
         T/g3qlaBkB33W5l4snqXzTjnr6kC7jw2dPf0w7xefx1coYh2Tf5wfYb/MrddlsSr09dy
         7rwQ==
X-Gm-Message-State: AOAM531/+YfyZnItNC0RzsKsvR8KkVQTRG1bCbuuVYcA8vLWoz2O1v6p
        A4df/6XagyMW4ioQTYVhqKZ4cA==
X-Google-Smtp-Source: ABdhPJzeLyoZfZy0zfpCnekQyWJxm9Sx4ZNhG5yQw9XmEnf8kxkhVQqUSq9kr4wYr+yQxWqGmBAj1Q==
X-Received: by 2002:a17:902:f651:: with SMTP id m17mr4253231plg.106.1644324096651;
        Tue, 08 Feb 2022 04:41:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:36 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/31] clk: mediatek: gate: Implement error handling in register API
Date:   Tue,  8 Feb 2022 20:40:25 +0800
Message-Id: <20220208124034.414635-23-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gate clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e8881ae1489a..631ff170b7b9 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -237,13 +237,26 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[gate->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_gate *gate = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 int mtk_clk_register_gates(struct device_node *node,
-- 
2.35.0.263.gb82422642f-goog


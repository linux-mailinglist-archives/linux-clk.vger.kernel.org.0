Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891424AD907
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349864AbiBHNQN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358427AbiBHMlY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:24 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2549DC03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:24 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id r19so2895768pfh.6
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0jvgrG3Dmpy1I6S7Dz5gEHIA3LIp2Xa/xR1uXh6G5dU=;
        b=OO1r4dxadJOGLUSOKAN0tmHzPQa1/FnX57PE28Fw2+knHtrP1i77Wg2a5G/AUHfj7F
         XJe4SgQaXUtNYtLJaaI40p7JgRIe15fGPHDGLYG3xHdNTVULkjQ59t51I+2PyOThCt2P
         5n4cgfYK6ehEyeCRKJw4xyfPqumGi9TgdpYyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0jvgrG3Dmpy1I6S7Dz5gEHIA3LIp2Xa/xR1uXh6G5dU=;
        b=B7rOUKVCEsdmvDXP+v/4uccFS1R1Dj9ID4rzGrVag3gITwkxVk6zAYYiO4E3j27SiM
         mmvmStnZoIXxPaYVkak8Y4EvOHCevePg5Upz5EaUHrpFeUFj/TD0sgurx3V82QtJ946K
         ZXPFJBMqXiVg6Z5XeoAvpGmTLZiYaz8FbKGwj0rHnM0Lh+ins+KOVKgsuKIbny/fmKMv
         3T6A8Ea4iPXZW9RK62e4MfMPGl9ERQc7AYnYkEosG9wVbfPXIrBtf40Nvm0jnPS6X63X
         UedmxVtkcJMm42kuAH1DD51beqgmvSH/o9QIrNTDwmp6hQH5r5ShCaitmzwYYB7AHkdU
         pO6g==
X-Gm-Message-State: AOAM532Gf8Oz0NhimYwhW1OM1SlaDUuggRc1IfTcVkefD27ysSJerhZt
        0fYCRB5Lel+LG8MpMfoFKZL43Q==
X-Google-Smtp-Source: ABdhPJxlQ6xRfe3jgexdVmS/BecwJ0yJF53+WUSqv5aNmcGH8QFSxeRwNVd6B/u1PMoMOp5zWvGwTA==
X-Received: by 2002:a63:9307:: with SMTP id b7mr3353508pge.291.1644324083669;
        Tue, 08 Feb 2022 04:41:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:23 -0800 (PST)
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
Subject: [PATCH v3 16/31] clk: mediatek: Implement mtk_clk_unregister_factors() API
Date:   Tue,  8 Feb 2022 20:40:19 +0800
Message-Id: <20220208124034.414635-17-wenst@chromium.org>
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

mtk_clk_register_factors(), as the name suggests, is used to register
a given list of fixed factor clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7c0d5706eed7..b267b2f04b84 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -126,6 +126,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_factor *ff = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+			continue;
+
+		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
+		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index cc7f920eabb4..4db1a97c1250 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -55,8 +55,10 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			      struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data);
 
 struct mtk_composite {
 	int id;
-- 
2.35.0.263.gb82422642f-goog


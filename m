Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642FE4AD93A
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245679AbiBHNQO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358410AbiBHMlW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:22 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049FCC03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:22 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x4so6143731plb.4
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hPoHx0MxVy2mprDlmk7WfXEAU5PM2SDXULV3Mk0XUS0=;
        b=OfHhLbHzk0vts8tueG1EzqqelkQHhva27fwdv4krb3Fqvz8/E1nF+x19VySsFkliJS
         QWpDJWRJFXUmL6Vs+5UTz8L/HVVxgqR7JTPnT6sc5tF+oL15DU1X5WddfafuoaVI61Bn
         UoAL6xF9lxyN/QfNm6ivb7WFoGU109XuRiHx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hPoHx0MxVy2mprDlmk7WfXEAU5PM2SDXULV3Mk0XUS0=;
        b=IF2Ulxhzpsc/0CQGy7oAqedY2yBf1r8bdyhilazWhDFsTaA1+oAoRQkcLrUhhd++7a
         4taNc0MTdjryoItNhvOBAjyr6kxMFvgxHEt5P1LjjWIV2lSWmnRwppxFnqnfsfZMxSsB
         ZjiNbktO2FwZtUTvPhi/Jgx++ZiZEHyP+V3YCBCdVwkT3R/g0M93u1EIez7zQMxP33fF
         B2PTn00d52LGLxMOXKNCQwmyxJ89fsoPcvqVnZMoiTm/iz0s/F96qr8XHHywTBO02zK2
         1cB6fybdOYbBvyRxI8sQBGQsmhNmVTQdaCigx04ndAgeO6t8PI3RSXhGFKPS5kVLZY0m
         +zNA==
X-Gm-Message-State: AOAM532WvCWsR99izObs4HM8hN3iIep8X4mma3U8Ud4btgrqGyL6Cb7F
        6AumpYKv8RzkZ72r9k4nPKzoEQ==
X-Google-Smtp-Source: ABdhPJymp3eMV72+HQHSFM6knL5LU/F4l+dnd3TBAdTXc+SFrQG9SpNis495KvAMIpZm6L+mhFZQBQ==
X-Received: by 2002:a17:90a:c283:: with SMTP id f3mr1171840pjt.138.1644324081530;
        Tue, 08 Feb 2022 04:41:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:21 -0800 (PST)
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
Subject: [PATCH v3 15/31] clk: mediatek: Implement mtk_clk_unregister_fixed_clks() API
Date:   Tue,  8 Feb 2022 20:40:18 +0800
Message-Id: <20220208124034.414635-16-wenst@chromium.org>
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

mtk_clk_register_fixed_clks(), as the name suggests, is used to register
a given list of fixed rate clks. However it is lacking a counterpart
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
2.35.0.263.gb82422642f-goog


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269374AD91F
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347993AbiBHNQ1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358145AbiBHMlF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:05 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C8BC03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:04 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k17so13779370plk.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iNXCz8EKk1VR4agv1nk/pR4RM+PZmf+e9yRG2bvKFuM=;
        b=FaLgS8JBXSx2rVQXT64+Rqa2xv8iXnhXcaxplMpKSmYnFH93Ujylq6y4Cl6nyd/sAH
         WQfwAS1n/fUwhgBYIe1KmVkTBNXyXUHhRiExOGRjWRVg/4G87sHy17Rcuz1/8y4EO++T
         6VK2V+jUdpukhI1bpN+MT9dUVWszTMuJ5z9NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iNXCz8EKk1VR4agv1nk/pR4RM+PZmf+e9yRG2bvKFuM=;
        b=w7le4sLccqRGPxHAQyUnpQlQjf0LT/zXHfbYlTQD8cMT5RMqt2zMhdIVcOCGH3187p
         62NxktC1eh2wcMa9TZJaBCbyBdpDL6qEibmHXHAVMDMpXFuH0Ix/hUHaQO0Ti6RosGmd
         Jy7+b52jXiXYGqnWVf1GyULk7VUWhJulr3nBzqgTK8vBH+aeptevPjLGkCMtKmwDhxlk
         lLvPQ2WjkLyF0y8qO3Ckmo6yqVitDhKv6iN1cXpQcoc5Do7rTmg3fOWkrpKggc/M+2Ir
         SCEJBYP9IGnDYiz33+rBNXzLBdYOcG5mEDIkPl4pVejnVJa5hhzUqchWrSYRw21CPeKD
         3xRQ==
X-Gm-Message-State: AOAM531PfptqxKEoW8Foc1nva9pmEsxKTpHyZPQI4MNZgl26v/D/CvcU
        0durpfPTwLlbDl/q9lZoyZ+GSg==
X-Google-Smtp-Source: ABdhPJxCsDQjhQfSgwvXF6h1UuMsst6PTHnyW2BLFIfU9v0XAu5TwkzHqYQzzLVcalU0yaSD5TQ4Og==
X-Received: by 2002:a17:902:f651:: with SMTP id m17mr4251259plg.106.1644324064142;
        Tue, 08 Feb 2022 04:41:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:03 -0800 (PST)
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
Subject: [PATCH v3 07/31] clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
Date:   Tue,  8 Feb 2022 20:40:10 +0800
Message-Id: <20220208124034.414635-8-wenst@chromium.org>
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

struct mtk_clk_cpumux is an implementation detail of the cpumux clk
type, and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
 drivers/clk/mediatek/clk-cpumux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 99a819e3673f..344c6399b22f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -12,6 +12,14 @@
 #include "clk-mtk.h"
 #include "clk-cpumux.h"
 
+struct mtk_clk_cpumux {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	u32		reg;
+	u32		mask;
+	u8		shift;
+};
+
 static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct mtk_clk_cpumux, hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index fda7770fd803..a538f2bbef0d 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,14 +7,6 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
-struct mtk_clk_cpumux {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	u32		reg;
-	u32		mask;
-	u8		shift;
-};
-
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.263.gb82422642f-goog


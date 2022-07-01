Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F8056362B
	for <lists+linux-clk@lfdr.de>; Fri,  1 Jul 2022 16:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbiGAOvt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Jul 2022 10:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbiGAOvs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 10:51:48 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32751396BD
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 07:51:47 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x138so2688649pfc.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Jul 2022 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZ3+Bck9CdXc48N2tcvwnMfepyRrmJsNT3BHHA0ynmw=;
        b=YnrGgqbg/4gNKd22gWIv7j8U6S1n+vomvkRInLzCjH1SphTbCWlZIr9IqjUEyBg+TP
         gwPqLwnFV1J+c+8ipFwtbJQ1wp8mVdHR2CzHjcepnzKYavtoyP1t2X9F319qsaL+yvln
         q/Fl5k320kUEnSwsN7O8SAS0LQ/Q0el9nM16g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZ3+Bck9CdXc48N2tcvwnMfepyRrmJsNT3BHHA0ynmw=;
        b=7SGDsylSFh/qGOcoy5k2C0m2e+0IQoZpgsGqy8G3E4M1vUc5SL3zjloTu+2a6c/kfo
         ZfiUTLCXTH/ND8Q3JnFW053w43dkYH8qBOHalqO/dv0PFu8opBMhS+Q5yiYBckgR1x+Z
         DlT5t1YkSdmUYV2Qqshk7cMD/E270+vtvB0nx8OI9FNwS95Y7bjyiJDAutFc68d7YKJ5
         pHkfM1PjLdNAb1dbgJjeyjtoOj8KKRFdC8zI8FYkeALGNneV9p/AbT1A4MaaO3MIEvpw
         ek2Vne1IXo3RQe451RqJb6ETQmPgCbtQP0bf/ztaCT3Wqb7yoZSYg/+T6AfJLN09zhZf
         rCeg==
X-Gm-Message-State: AJIora8gGAs4JvKhUZKuPxIYgUmPLM7O2mELmk+UZefA2Jg3uJHZG45B
        NMja1ICt759jCQXIuk7L4nK82A==
X-Google-Smtp-Source: AGRyM1ti6dDLLmN4VHYASn13hEQLd6Lj+xpLHhnpmLhsbZQx47SR/6ELsciEy4txopZlULG/rZJxWQ==
X-Received: by 2002:a63:3184:0:b0:40d:7801:e7e with SMTP id x126-20020a633184000000b0040d78010e7emr12640506pgx.333.1656687106684;
        Fri, 01 Jul 2022 07:51:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:46 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: mediatek: mt8183-mfgcfg: Simplify with mtk_clk_simple_*()
Date:   Fri,  1 Jul 2022 22:51:33 +0800
Message-Id: <20220701145133.1152387-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701145133.1152387-1-wenst@chromium.org>
References: <20220701145133.1152387-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_simple_*() was added after the MT8183 clock drivers were merged.
They provide shared boiler plate for clock providers that only have
clock gates.

Since the MFGCFG block needs its power domain enabled, it can't be
completely converted to using the functions.

Simplify the MT8183 mfgcfg clock driver using mtk_clk_simple_*(),
enabling runtime PM at the same time as before. This also adds proper
driver removal support.

Since the mtk_clk_simple_probe() function allocates the clk_hw pointer
array based on .num_clks given, it effectively requires there are no
holes in the clock ID map. Check that the size of the array matches
the number of clocks with a static assertion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..61a3d02e44f5 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -26,28 +26,31 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
 };
 
-static int clk_mt8183_mfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(mfg_clks) == CLK_MFG_NR_CLK);
 
-	pm_runtime_enable(&pdev->dev);
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
 
-	clk_data = mtk_alloc_clk_data(CLK_MFG_NR_CLK);
+static int clk_mt8183_mfg_probe(struct platform_device *pdev)
+{
+	int ret = devm_pm_runtime_enable(&pdev->dev);
 
-	mtk_clk_register_gates_with_dev(node, mfg_clks, ARRAY_SIZE(mfg_clks),
-			clk_data, &pdev->dev);
+	if (ret)
+		return ret;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	return mtk_clk_simple_probe(pdev);
 }
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-	{ .compatible = "mediatek,mt8183-mfgcfg", },
+	{ .compatible = "mediatek,mt8183-mfgcfg", .data = &mfg_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_mfg_drv = {
 	.probe = clk_mt8183_mfg_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-mfg",
 		.of_match_table = of_match_clk_mt8183_mfg,
-- 
2.37.0.rc0.161.g10f37bed90-goog


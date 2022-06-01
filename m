Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A388C53AF0F
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jun 2022 00:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbiFAWIP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Jun 2022 18:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiFAWIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 18:08:09 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6AC22870C
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 15:08:05 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 853D420603;
        Thu,  2 Jun 2022 00:08:03 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 06/11] drm/msm/dsi/phy: Replace hardcoded char-array length with sizeof()
Date:   Thu,  2 Jun 2022 00:07:42 +0200
Message-Id: <20220601220747.1145095-7-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601220747.1145095-1-marijn.suijten@somainline.org>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the last DSI PHY PLL driver (dsi_phy_28nm_8960) has been
converted to use a simple stack-local char-array instead of a
devm_kzalloc heap allocation we can safely call sizeof() on every string
variable (that's now a sized array instead of a pointer) passed into
snprintf instead of hardcoding the size.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 36 +++++++++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 18 +++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 24 ++++++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  8 ++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 34 +++++++++---------
 5 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 56892036e419..8bd7b97b1b9b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -591,15 +591,15 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 
 	DBG("DSI%d", pll_10nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->phy->id);
+	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_10nm->phy->id);
 	pll_10nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_10nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
 			CLK_SET_RATE_PARENT, pll_10nm->phy->pll_base +
@@ -610,8 +610,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -623,8 +623,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -636,8 +636,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					       0, 1, 2);
@@ -646,8 +646,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					       0, 1, 4);
@@ -656,11 +656,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(parent2, sizeof(parent2), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
+	snprintf(parent3, sizeof(parent3), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent4, sizeof(parent4), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
@@ -673,8 +673,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 055b48cf8008..e10ba1b09b2f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -816,15 +816,15 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 
 	DBG("DSI%d", pll_14nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->phy->id);
+	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_14nm->phy->id);
 	pll_14nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_14nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_14nm->phy->id);
 
 	/* N1 postdiv, bits 0-3 in REG_DSI_14nm_PHY_CMN_CLK_CFG0 */
 	hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent,
@@ -832,8 +832,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->phy->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_14nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / N1 / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -843,8 +843,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/*
 	 * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
@@ -854,8 +854,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->phy->id);
-	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_14nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
 
 	/* DSI pixel clock = VCO_CLK / N1 / 2 / N2
 	 * This is the output of N2 post-divider, bits 4-7 in
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ef04bb630c5d..7d3cabeca743 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -539,14 +539,14 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	else
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_28nm->phy->id);
 	pll_28nm->clk_hw.init = &vco_init;
 	ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
+	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent1,
 			CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
@@ -554,15 +554,15 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
+	snprintf(parent1, sizeof(parent1), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
 			CLK_SET_RATE_PARENT, 1, 2);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_28nm->phy->id);
+	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent1, 0,
 			pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
@@ -571,9 +571,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return PTR_ERR(hw);
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dbyte_mux", pll_28nm->phy->id);
+	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(parent2, sizeof(parent2), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
 				parent1, parent2,
@@ -582,8 +582,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_28nm->phy->id);
+	snprintf(parent1, sizeof(parent1), "dsi%dbyte_mux", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
 			CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 24bac401b210..3deb306f4cc4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -404,7 +404,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!bytediv)
 		return -ENOMEM;
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_28nm->phy->id);
 	vco_init.name = vco_name;
 
 	pll_28nm->clk_hw.init = &vco_init;
@@ -417,8 +417,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	bytediv->hw.init = &bytediv_init;
 	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
-	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id + 1);
+	snprintf(parent_name, sizeof(parent_name), "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_28nm->phy->id + 1);
 
 	bytediv_init.name = clk_name;
 	bytediv_init.ops = &clk_bytediv_ops;
@@ -432,7 +432,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return ret;
 	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_28nm->phy->id + 1);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent_name, 0,
 			pll_28nm->phy->pll_base +
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 36f1e6a40d9c..6a58dd62bac5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -605,15 +605,15 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 
 	DBG("DSI%d", pll_7nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->phy->id);
+	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_7nm->phy->id);
 	pll_7nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_7nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
 			CLK_SET_RATE_PARENT, pll_7nm->phy->pll_base +
@@ -624,8 +624,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -637,8 +637,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_byteclk", pll_7nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -651,8 +651,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					       0, 1, 2);
@@ -661,8 +661,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	if (pll_7nm->phy->cphy_mode)
 		hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 2, 7);
@@ -682,11 +682,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		data = dsi_phy_read(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 		dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data | 3);
 
-		snprintf(parent, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
+		snprintf(parent, sizeof(parent), "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
 	} else {
-		snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
-		snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
-		snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
+		snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_7nm->phy->id);
+		snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+		snprintf(parent2, sizeof(parent2), "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
 
 		hw = devm_clk_hw_register_mux(dev, clk_name,
 				((const char *[]){
@@ -699,10 +699,10 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 			goto fail;
 		}
 
-		snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
+		snprintf(parent, sizeof(parent), "dsi%d_pclk_mux", pll_7nm->phy->id);
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
-- 
2.36.1


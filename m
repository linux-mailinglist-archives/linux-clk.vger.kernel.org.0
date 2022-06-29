Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DF3560CAA
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jun 2022 00:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiF2Wxv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jun 2022 18:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiF2Wxs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 18:53:48 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF63C24F38
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 15:53:42 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3D3893F762;
        Thu, 30 Jun 2022 00:53:40 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
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
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 04/11] drm/msm/dsi/phy: Reindent and reflow multiline function calls
Date:   Thu, 30 Jun 2022 00:53:24 +0200
Message-Id: <20220629225331.357308-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629225331.357308-1-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Patch 613cbd1da3c9 ("drm/msm/dsi: use devm_clk_*register to registe DSI
PHY clocks") introduced the devm_ prefix to clk_hw registration calls,
without updating the indentation of the arguments on the following
lines.

Similarly e55b3fbbbbc8 ("drm/msm/dsi: drop PLL accessor functions")
moved from pll_write to dsi_phy_write without updating the indentation
of followup arguments either.

Preparing for a series that heavily touches the clk calls, reflow and
reindent function calls that are adhering to an 80-char column limit by
spanning multiple lines.  Where function names are very long the
arguments are indented with a fixed number of two tab characters instead
of aligning with the opening parenthesis of the function call.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 96 +++++++++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  9 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 73 +++++++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 63 ++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 84 ++++++++--------
 5 files changed, 161 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 08b015ea1b1e..56892036e419 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -188,19 +188,19 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  config->ssc_stepsize & 0xff);
+			      config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  config->ssc_stepsize >> 8);
+			      config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  config->ssc_div_per & 0xff);
+			      config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  config->ssc_div_per >> 8);
+			      config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
-			  config->ssc_adj_per & 0xff);
+			      config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
-			  config->ssc_adj_per >> 8);
+			      config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
+			      SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -215,16 +215,19 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE,
-		  0xba);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
+		      0xba);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE,
+		      0x0c);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_OUTDIV, 0x00);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE, 0x00);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO,
+		      0x08);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x08);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1, 0xc0);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0xfa);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1,
+		      0xfa);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1,
-		  0x4c);
+		      0x4c);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PFILT, 0x29);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
@@ -236,18 +239,18 @@ static void dsi_pll_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *conf
 
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
-		  config->decimal_div_start);
+		      config->decimal_div_start);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		  config->frac_div_start & 0xff);
+		      config->frac_div_start & 0xff);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		  (config->frac_div_start & 0xff00) >> 8);
+		      (config->frac_div_start & 0xff00) >> 8);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		  (config->frac_div_start & 0x30000) >> 16);
+		      (config->frac_div_start & 0x30000) >> 16);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 64);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
 	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-		  config->pll_clock_inverters);
+		      config->pll_clock_inverters);
 }
 
 static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -306,7 +309,7 @@ static void dsi_pll_disable_pll_bias(struct dsi_pll_10nm *pll)
 
 	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
 	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
-		  data & ~BIT(5));
+		      data & ~BIT(5));
 	ndelay(250);
 }
 
@@ -315,7 +318,7 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_10nm *pll)
 	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
 	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
-		  data | BIT(5));
+		      data | BIT(5));
 	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
 	ndelay(250);
 }
@@ -326,7 +329,7 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_10nm *pll)
 
 	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-		  data & ~BIT(5));
+		      data & ~BIT(5));
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
@@ -335,7 +338,7 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 
 	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-		  data | BIT(5));
+		      data | BIT(5));
 }
 
 static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
@@ -356,7 +359,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 	/* Start PLL */
 	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
-		  0x01);
+		      0x01);
 
 	/*
 	 * ensure all PLL configurations are written prior to checking
@@ -378,10 +381,10 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 		dsi_pll_enable_global_clk(pll_10nm->slave);
 
 	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
-		  0x01);
+		      0x01);
 	if (pll_10nm->slave)
 		dsi_phy_write(pll_10nm->slave->phy->base +
-			  REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
+			      REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
 
 error:
 	return rc;
@@ -486,7 +489,7 @@ static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
 	cached->pll_out_div = dsi_phy_read(pll_10nm->phy->pll_base +
-				       REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
+			REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
@@ -515,7 +518,7 @@ static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_phy_write(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
 	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-		  cached->bit_clk_div | (cached->pix_clk_div << 4));
+		      cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
@@ -598,11 +601,10 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				     parent, CLK_SET_RATE_PARENT,
-				     pll_10nm->phy->pll_base +
-				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
-				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
+			CLK_SET_RATE_PARENT, pll_10nm->phy->pll_base +
+				REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
+			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -613,11 +615,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     CLK_SET_RATE_PARENT,
-				     pll_10nm->phy->base +
-				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-				     0, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_10nm->postdiv_lock);
+			CLK_SET_RATE_PARENT,
+			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+			0, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -628,7 +628,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  CLK_SET_RATE_PARENT, 1, 8);
+					       CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -640,7 +640,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  0, 1, 2);
+					       0, 1, 2);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -650,7 +650,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  0, 1, 4);
+					       0, 1, 4);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -663,11 +663,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_mux(dev, clk_name,
-				 ((const char *[]){
-				 parent, parent2, parent3, parent4
-				 }), 4, 0, pll_10nm->phy->base +
-				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-				 0, 2, 0, NULL);
+			((const char *[]){
+				parent, parent2, parent3, parent4,
+			}), 4, 0, pll_10nm->phy->base +
+				REG_DSI_10nm_PHY_CMN_CLK_CFG1,
+			0, 2, 0, NULL);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -677,11 +677,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     0, pll_10nm->phy->base +
-					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-				     4, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_10nm->postdiv_lock);
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
+			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+			4, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8199c53567f4..055b48cf8008 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -711,7 +711,7 @@ static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev,
-			"restore vco rate failed. ret=%d\n", ret);
+			      "restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
 
@@ -837,7 +837,7 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 
 	/* DSI Byte clock = VCO_CLK / N1 / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  CLK_SET_RATE_PARENT, 1, 8);
+					       CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
@@ -952,7 +952,8 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 
 	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
+			      "%s: D-PHY timing calculation failed\n",
+			      __func__);
 		return -EINVAL;
 	}
 
@@ -1005,7 +1006,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	ret = dsi_14nm_set_usecase(phy);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
-			__func__, ret);
+			      __func__, ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 48eab80b548e..ef04bb630c5d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -104,7 +104,7 @@ static void pll_28nm_software_reset(struct dsi_pll_28nm *pll_28nm)
 	 * reset bit off and back on.
 	 */
 	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG,
-			DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET, 1);
+			     DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET, 1);
 	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG, 0x00, 1);
 }
 
@@ -201,9 +201,9 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1, sdm_cfg1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2,
-		DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(sdm_cfg2));
+		      DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(sdm_cfg2));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3,
-		DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(sdm_cfg3));
+		      DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(sdm_cfg3));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
@@ -316,12 +316,12 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 	for (i = 0; i < 2; i++) {
 		/* DSI Uniphy lock detect setting */
 		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
-				0x0c, 100);
+				     0x0c, 100);
 		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
 
 		/* poll for PLL ready status */
-		locked = pll_28nm_poll_for_ready(pll_28nm,
-						max_reads, timeout_us);
+		locked = pll_28nm_poll_for_ready(pll_28nm, max_reads,
+						 timeout_us);
 		if (locked)
 			break;
 
@@ -508,11 +508,11 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 	}
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
-			cached_state->postdiv3);
+		      cached_state->postdiv3);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
-			cached_state->postdiv1);
+		      cached_state->postdiv1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_VREG_CFG,
-			cached_state->byte_mux);
+		      cached_state->byte_mux);
 
 	return 0;
 }
@@ -547,28 +547,26 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-			parent1, CLK_SET_RATE_PARENT,
-			pll_28nm->phy->pll_base +
-			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent1,
+			CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
+				REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
 			0, 4, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
 	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
 	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
-			parent1, CLK_SET_RATE_PARENT,
-			1, 2);
+	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
+			CLK_SET_RATE_PARENT, 1, 2);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				parent1, 0, pll_28nm->phy->pll_base +
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent1, 0,
+			pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
-				0, 8, 0, NULL);
+			0, 8, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
@@ -578,16 +576,16 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
-				parent1, parent2
+				parent1, parent2,
 			}), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
-			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
+				REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
 	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
-				parent1, CLK_SET_RATE_PARENT, 1, 4);
+	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
+			CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
@@ -627,31 +625,31 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
 	void __iomem *base = phy->base;
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_0,
-		DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
+		      DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_1,
-		DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
+		      DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_2,
-		DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
+		      DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
 	if (timing->clk_zero & BIT(8))
 		dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_3,
-			DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8);
+			      DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_4,
-		DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
+		      DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_5,
-		DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
+		      DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_6,
-		DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
+		      DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_7,
-		DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
+		      DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_8,
-		DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
+		      DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_9,
-		DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
+		      DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+		      DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_10,
-		DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
+		      DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
 	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_11,
-		DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
+		      DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
 }
 
 static void dsi_28nm_phy_regulator_enable_dcdc(struct msm_dsi_phy *phy)
@@ -713,7 +711,8 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
+			      "%s: D-PHY timing calculation failed\n",
+			      __func__);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index fc56cdcc9ad6..af630b8eb9f3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -104,29 +104,29 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	fb_divider = (temp * VCO_PREF_DIV_RATIO) / val;
 	fb_divider = fb_divider / 2 - 1;
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1,
-			fb_divider & 0xff);
+		      fb_divider & 0xff);
 
 	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
 
 	val |= (fb_divider >> 8) & 0x07;
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2,
-			val);
+		      val);
 
 	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 
 	val |= (VCO_PREF_DIV_RATIO - 1) & 0x3f;
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3,
-			val);
+		      val);
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_6,
-			0xf);
+		      0xf);
 
 	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 	val |= 0x7 << 4;
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
-			val);
+		      val);
 
 	return 0;
 }
@@ -206,7 +206,7 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 
 	/* enable the PLL */
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
-			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
+		      DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
@@ -367,16 +367,16 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
-			"restore vco rate failed. ret=%d\n", ret);
+			      "restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
-			cached_state->postdiv3);
+		      cached_state->postdiv3);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9,
-			cached_state->postdiv2);
+		      cached_state->postdiv2);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
-			cached_state->postdiv1);
+		      cached_state->postdiv1);
 
 	return 0;
 }
@@ -446,10 +446,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
 	/* DIV3 */
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				parent_name, 0, pll_28nm->phy->pll_base +
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent_name, 0,
+			pll_28nm->phy->pll_base +
 				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
-				0, 8, 0, NULL);
+			0, 8, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
@@ -489,29 +489,29 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
 	void __iomem *base = phy->base;
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_0,
-		DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_1,
-		DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_2,
-		DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_3, 0x0);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_4,
-		DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_5,
-		DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_6,
-		DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_7,
-		DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_8,
-		DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_9,
-		DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+		      DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_10,
-		DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_11,
-		DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
+		      DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
 }
 
 static void dsi_28nm_phy_regulator_init(struct msm_dsi_phy *phy)
@@ -523,7 +523,7 @@ static void dsi_28nm_phy_regulator_init(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2, 1);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3, 0);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4,
-		0x100);
+		      0x100);
 }
 
 static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy)
@@ -544,7 +544,7 @@ static void dsi_28nm_phy_calibration(struct msm_dsi_phy *phy)
 	int i = 5000;
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CAL_PWR_CFG,
-			0x3);
+		      0x3);
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_2, 0x0);
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_1, 0x5a);
@@ -577,11 +577,11 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_CFG_1(i), 0x45);
 		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_CFG_2(i), 0x00);
 		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_DATAPATH(i),
-			0x00);
+			      0x00);
 		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_0(i),
-			0x01);
+			      0x01);
 		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_1(i),
-			0x66);
+			      0x66);
 	}
 
 	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_CFG_0, 0x40);
@@ -602,7 +602,8 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 	if (msm_dsi_dphy_timing_calc(timing, clk_req)) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: D-PHY timing calculation failed\n", __func__);
+			      "%s: D-PHY timing calculation failed\n",
+			      __func__);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 66ed1919a1db..36f1e6a40d9c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -176,19 +176,19 @@ static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *c
 		pr_debug("SSC is enabled\n");
 
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			  config->ssc_stepsize & 0xff);
+			      config->ssc_stepsize & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			  config->ssc_stepsize >> 8);
+			      config->ssc_stepsize >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			  config->ssc_div_per & 0xff);
+			      config->ssc_div_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			  config->ssc_div_per >> 8);
+			      config->ssc_div_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
-			  config->ssc_adj_per & 0xff);
+			      config->ssc_adj_per & 0xff);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
-			  config->ssc_adj_per >> 8);
+			      config->ssc_adj_per >> 8);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
-			  SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
+			      SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
 	}
 }
 
@@ -208,7 +208,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	}
 
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
-		  analog_controls_five_1);
+		      analog_controls_five_1);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE, 0x01);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
@@ -245,17 +245,20 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
 	void __iomem *base = pll->phy->pll_base;
 
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, config->decimal_div_start);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1,
+		      config->decimal_div_start);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		  config->frac_div_start & 0xff);
+		      config->frac_div_start & 0xff);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		  (config->frac_div_start & 0xff00) >> 8);
+		      (config->frac_div_start & 0xff00) >> 8);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		  (config->frac_div_start & 0x30000) >> 16);
+		      (config->frac_div_start & 0x30000) >> 16);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, pll->phy->cphy_mode ? 0x00 : 0x10);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, config->pll_clock_inverters);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1,
+		      pll->phy->cphy_mode ? 0x00 : 0x10);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS,
+		      config->pll_clock_inverters);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -341,7 +344,7 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 
 	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-		  data | BIT(5) | BIT(4));
+		      data | BIT(5) | BIT(4));
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -500,7 +503,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
 	cached->pll_out_div = dsi_phy_read(pll_7nm->phy->pll_base +
-				       REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
@@ -529,7 +532,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_phy_write(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
 	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
-		  cached->bit_clk_div | (cached->pix_clk_div << 4));
+		      cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
@@ -612,11 +615,10 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->phy->id);
 
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				     parent, CLK_SET_RATE_PARENT,
-				     pll_7nm->phy->pll_base +
-				     REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
-				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
+			CLK_SET_RATE_PARENT, pll_7nm->phy->pll_base +
+				REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
+			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -627,11 +629,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     CLK_SET_RATE_PARENT,
-				     pll_7nm->phy->base +
-				     REG_DSI_7nm_PHY_CMN_CLK_CFG0,
-				     0, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_7nm->postdiv_lock);
+			CLK_SET_RATE_PARENT,
+			pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+			0, 4, CLK_DIVIDER_ONE_BASED, &pll_7nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -642,8 +642,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  CLK_SET_RATE_PARENT, 1,
-					  pll_7nm->phy->cphy_mode ? 7 : 8);
+			CLK_SET_RATE_PARENT, 1,
+			pll_7nm->phy->cphy_mode ? 7 : 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -655,7 +655,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  0, 1, 2);
+					       0, 1, 2);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -689,11 +689,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
 
 		hw = devm_clk_hw_register_mux(dev, clk_name,
-					((const char *[]){
+				((const char *[]){
 					parent, parent2,
-					}), 2, 0, pll_7nm->phy->base +
+				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-					0, 1, 0, NULL);
+				0, 1, 0, NULL);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -705,11 +705,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     0, pll_7nm->phy->base +
-					REG_DSI_7nm_PHY_CMN_CLK_CFG0,
-				     4, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_7nm->postdiv_lock);
+	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
+			pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+			4, 4, CLK_DIVIDER_ONE_BASED, &pll_7nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -841,7 +839,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		ret = msm_dsi_dphy_timing_calc_v4(timing, clk_req);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
-			"%s: PHY timing calculation failed\n", __func__);
+			      "%s: PHY timing calculation failed\n", __func__);
 		return -EINVAL;
 	}
 
@@ -960,10 +958,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5,
-			timing->shared_timings.clk_pre);
+			      timing->shared_timings.clk_pre);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->clk_prepare);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7,
-			timing->shared_timings.clk_post);
+			      timing->shared_timings.clk_post);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
@@ -982,9 +980,9 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
-			timing->shared_timings.clk_pre);
+			      timing->shared_timings.clk_pre);
 		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
-			timing->shared_timings.clk_post);
+			      timing->shared_timings.clk_post);
 	}
 
 	/* DSI lane settings */
-- 
2.37.0


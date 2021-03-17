Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF3933F37A
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 15:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhCQOlg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 10:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhCQOlA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:41:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FCFC061762
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x4so3326842lfu.7
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZtWpiA0N6mLENR8OsqbDY2s7jj35BZo3ZeP6DEuRDgI=;
        b=nXkM1NThU2uUPL6Rggy8irvLiLNt4PEWS15rbbOxdeLaEFT6vx3EV0NSCc82sb3lpX
         4Qs6ZJfUyFXiGz0zgDCVFjQaFHs8yBpwYYiAz0p++ya4hwY9rzaEzYqNGsTp237bGo4G
         RBTmXWd5Yg9cbIUwVms6UqCTwT8wy1zu9S2XouuHo1lhdfQW2BCvv7Xmwht5tX6cOwNf
         EcVjrWKbTz+wQE40xLAPRp/9Aude093Ng36InUpZrJo1o60IVztGOatLetX0x2qfD763
         ef/m44QnqTY2/iO6aonOOzzQuGwC58v3xHtA6zgw6M5TVMlgqFS6VhHLt1+mDM4BpXds
         KdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZtWpiA0N6mLENR8OsqbDY2s7jj35BZo3ZeP6DEuRDgI=;
        b=uVrX9nZetWBZWMvh6HkO8LYr/ayuSw+vQWO5qdRua0u2L0d73OLxFabK6m9wsgCwr2
         icyYrCsvTuyun8fU0ca/ZnyNYOWu7sBY1eh7D+iL3zrqMxtn6idXakJmMoar4w2wdNJV
         WnqlqRo9CHh7aKNctKWfNCPJdIhr3B9n+0zsyoKqyYHxawHUn4iGheeFxmJY+2wUk3Gu
         lgnm68LycB+QPN2hCIKvT7Hf9xRzJlu8FThnDDEJbWOZIWF5eUuUfcI8+j1abrDX3ESz
         eU0JygrCjE/g53iqxA3u0Fwu3vsLxRGYHx1UuccPixBZI8jpzu7pLPFe4hnrkNKGZtqO
         q8Dg==
X-Gm-Message-State: AOAM530R0s8y9PAx1hdYJvv1CEM2dZv1WjedA0U12grRnhQrvzrnU8cr
        UkHFYFyRKkX6KKnOnwgsC1ywpQ==
X-Google-Smtp-Source: ABdhPJxp5FIgJTNeyy4QTbgltZeZskwf2dtvH5bJrqq8BsclAf3l/akM1badnlbCObHU4SEGl4IHfg==
X-Received: by 2002:a05:6512:3771:: with SMTP id z17mr2606319lft.481.1615992058255;
        Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 17/26] drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
Date:   Wed, 17 Mar 2021 17:40:30 +0300
Message-Id: <20210317144039.556409-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10nm and 7nm already do not use these helpers, as they handle setting
slave DSI clocks after enabling VCO. Modify the rest of PHY drivers to
remove unnecessary indirection and drop enable_seq/disable_seq PLL
callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  87 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  88 ++++++++-----
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 120 ++++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  35 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |   2 -
 6 files changed, 170 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 75fc24f9f013..0fff9e3afb53 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -35,8 +35,6 @@ struct msm_dsi_phy_ops {
 };
 
 struct msm_dsi_pll_ops {
-	int (*enable_seq)(struct msm_dsi_pll *pll);
-	void (*disable_seq)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 023727623847..23f198164c0e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -652,12 +652,58 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
+static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	void __iomem *base = pll_14nm->mmio;
+	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+	bool locked;
+
+	DBG("");
+
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
+	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
+
+	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
+					 POLL_TIMEOUT_US);
+
+	if (unlikely(!locked)) {
+		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
+		return -EINVAL;
+	}
+
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
+}
+
+static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
+
+	DBG("");
+
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+
+	pll->pll_on = false;
+}
+
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
 	.round_rate = msm_dsi_pll_helper_clk_round_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
+	.prepare = dsi_pll_14nm_vco_prepare,
+	.unprepare = dsi_pll_14nm_vco_unprepare,
 };
 
 /*
@@ -749,39 +795,6 @@ static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
  * PLL Callbacks
  */
 
-static int dsi_pll_14nm_enable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	void __iomem *base = pll_14nm->mmio;
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
-	bool locked;
-
-	DBG("");
-
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
-
-	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
-					 POLL_TIMEOUT_US);
-
-	if (unlikely(!locked))
-		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
-
-	return locked ? 0 : -EINVAL;
-}
-
-static void dsi_pll_14nm_disable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
-
-	DBG("");
-
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
-}
-
 static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
@@ -1158,8 +1171,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1185,8 +1196,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index e77b21f0d3bf..5188ba21afa7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -286,19 +286,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	return vco_rate;
 }
 
-static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = msm_dsi_pll_helper_clk_round_rate,
-	.set_rate = dsi_pll_28nm_clk_set_rate,
-	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
-	.is_enabled = dsi_pll_28nm_clk_is_enabled,
-};
-
-/*
- * PLL Callbacks
- */
-static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int _dsi_pll_28nm_vco_prepare_hpm(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
@@ -373,21 +361,28 @@ static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 	return locked ? 0 : -EINVAL;
 }
 
-static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	int i, ret;
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	for (i = 0; i < 3; i++) {
-		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
-		if (!ret)
+		ret = _dsi_pll_28nm_vco_prepare_hpm(pll);
+		if (!ret) {
+			pll->pll_on = true;
 			return 0;
+		}
 	}
 
 	return ret;
 }
 
-static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
+static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
 	void __iomem *base = pll_28nm->mmio;
@@ -397,6 +392,9 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	DBG("id=%d", pll_28nm->id);
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	pll_28nm_software_reset(pll_28nm);
 
 	/*
@@ -421,22 +419,54 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
-	if (unlikely(!locked))
+	if (unlikely(!locked)) {
 		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
+		return -EINVAL;
+	}
 
-	return locked ? 0 : -EINVAL;
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
 }
 
-static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
+static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 {
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 
 	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(!pll->pll_on))
+		return;
+
 	pll_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
+
+	pll->pll_on = false;
 }
 
+static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
+	.round_rate = msm_dsi_pll_helper_clk_round_rate,
+	.set_rate = dsi_pll_28nm_clk_set_rate,
+	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
+	.prepare = dsi_pll_28nm_vco_prepare_hpm,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
+	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+};
+
+static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
+	.round_rate = msm_dsi_pll_helper_clk_round_rate,
+	.set_rate = dsi_pll_28nm_clk_set_rate,
+	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
+	.prepare = dsi_pll_28nm_vco_prepare_lp,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
+	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+};
+
+/*
+ * PLL Callbacks
+ */
+
 static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -479,7 +509,7 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks, const struct clk_ops *vco_ops)
 {
 	char clk_name[32], parent1[32], parent2[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -487,7 +517,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
-		.ops = &clk_ops_dsi_pll_28nm_vco,
+		.ops = vco_ops,
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk_hw *hw;
@@ -579,7 +609,7 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_hpm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
@@ -618,7 +648,7 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_lp);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
@@ -792,8 +822,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -819,8 +847,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -846,8 +872,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 558d311b13a9..15b05ae554a0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -178,12 +178,76 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	return vco_rate;
 }
 
+static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct device *dev = &pll_28nm->pdev->dev;
+	void __iomem *base = pll_28nm->mmio;
+	bool locked;
+	unsigned int bit_div, byte_div;
+	int max_reads = 1000, timeout_us = 100;
+	u32 val;
+
+	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	/*
+	 * before enabling the PLL, configure the bit clock divider since we
+	 * don't expose it as a clock to the outside world
+	 * 1: read back the byte clock divider that should already be set
+	 * 2: divide by 8 to get bit clock divider
+	 * 3: write it to POSTDIV1
+	 */
+	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+	byte_div = val + 1;
+	bit_div = byte_div / 8;
+
+	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val &= ~0xf;
+	val |= (bit_div - 1);
+	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
+
+	/* enable the PLL */
+	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
+			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
+
+	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
+
+	if (unlikely(!locked)) {
+		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+		return -EINVAL;
+	}
+
+	DBG("DSI PLL lock success");
+	pll->pll_on = true;
+
+	return 0;
+}
+
+static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+
+	DBG("id=%d", pll_28nm->id);
+
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
+
+	pll->pll_on = false;
+}
+
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 	.round_rate = msm_dsi_pll_helper_clk_round_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
-	.prepare = msm_dsi_pll_helper_clk_prepare,
-	.unprepare = msm_dsi_pll_helper_clk_unprepare,
+	.prepare = dsi_pll_28nm_vco_prepare,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
 	.is_enabled = dsi_pll_28nm_clk_is_enabled,
 };
 
@@ -270,56 +334,6 @@ static const struct clk_ops clk_bytediv_ops = {
 /*
  * PLL Callbacks
  */
-static int dsi_pll_28nm_enable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-	struct device *dev = &pll_28nm->pdev->dev;
-	void __iomem *base = pll_28nm->mmio;
-	bool locked;
-	unsigned int bit_div, byte_div;
-	int max_reads = 1000, timeout_us = 100;
-	u32 val;
-
-	DBG("id=%d", pll_28nm->id);
-
-	/*
-	 * before enabling the PLL, configure the bit clock divider since we
-	 * don't expose it as a clock to the outside world
-	 * 1: read back the byte clock divider that should already be set
-	 * 2: divide by 8 to get bit clock divider
-	 * 3: write it to POSTDIV1
-	 */
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
-	byte_div = val + 1;
-	bit_div = byte_div / 8;
-
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
-	val &= ~0xf;
-	val |= (bit_div - 1);
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
-
-	/* enable the PLL */
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
-			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
-
-	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
-
-	if (unlikely(!locked))
-		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
-	else
-		DBG("DSI PLL lock success");
-
-	return locked ? 0 : -EINVAL;
-}
-
-static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	DBG("id=%d", pll_28nm->id);
-	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
-}
-
 static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -653,8 +667,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 652c2d6bfeec..cae668b669a4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -21,38 +21,3 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 	else
 		return rate;
 }
-
-int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
-{
-	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
-	int ret = 0;
-
-	/*
-	 * Certain PLLs do not allow VCO rate update when it is on.
-	 * Keep track of their status to turn on/off after set rate success.
-	 */
-	if (unlikely(pll->pll_on))
-		return 0;
-
-	ret = pll->cfg->pll_ops.enable_seq(pll);
-	if (ret) {
-		DRM_ERROR("DSI PLL failed to lock\n");
-		return ret;
-	}
-
-	pll->pll_on = true;
-
-	return 0;
-}
-
-void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
-{
-	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
-
-	if (unlikely(!pll->pll_on))
-		return;
-
-	pll->cfg->pll_ops.disable_seq(pll);
-
-	pll->pll_on = false;
-}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index eca13cf67c21..da83e4c11f4f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -39,8 +39,6 @@ static inline void pll_write_ndelay(void __iomem *reg, u32 data, u32 delay_ns)
 /* clock callbacks */
 long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 		unsigned long rate, unsigned long *parent_rate);
-int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
-void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
 
 #endif /* __DSI_PLL_H__ */
 
-- 
2.30.2


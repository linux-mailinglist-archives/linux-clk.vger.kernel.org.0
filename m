Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741EC33F377
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 15:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbhCQOlb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 10:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhCQOlB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:41:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232F1C061764
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:41:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n16so3345904lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pIjZ5Ls/IncOsjYOuJOfzzUbt2X2EF7KpLMSUaApi+8=;
        b=c4xQBSqwwg5cAo7j9c+XjR25KfNNHAFKt+9dPG51T10GBzgXng9IiNEH7mU+qWtMBk
         oxtrleXkfQV4euXjP3skifBHdf0oRDvq/qMFZh/hKPNJPLnJj/C6IerjTp3nhPKIk30M
         IEeHaWkOF/PeowOX7nCd0H87oN7IBd4bmx0YCUrqGt17wIOiB8RBDRjq4R4yDylPwBn9
         uZNGh/kNoQ5fpdSMHYcB1AABVZSiVdJtRSs8U9Oq6IUbs/Hm5LqlpC5BRSqTeLEOJDOg
         vtRkI7l2EF9x7XsAObfHnr/PF/BNJZKz4wu1lKqXv2JACxuiqMSmdUuN1jKsyb8G0cxL
         4GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pIjZ5Ls/IncOsjYOuJOfzzUbt2X2EF7KpLMSUaApi+8=;
        b=EfvsJw3HDdkhpLUWh3WHRKcG21nvk3XXpJCTV57hnMP57HF3czOyIExMgAbPRbFE+u
         VU63TjwyPEuxbvWFfFzYxfS1JolknVe4oBCH9Qd8iEAxcH0WAzBHMSb/gSxZaTjDvJzH
         NUXcAcDuP7snM1tVba3pm3tviMt5++qqaU4uVWCMrvS3mJQRjzpLz0AJcmrOo/i30bRD
         JTMaRFYhIYjxvCZ6Eml49Odp8t3a+ovRuUlzggBRviXNXLa+22tXKNiGceZ0lLg9NcAD
         GqSc9YRH/wUvTCZK4UybYEj8bXkv2AC0JwHH0YWPFOBDIdwfY2qdTPTdRHwt5ZUIak9N
         bT2Q==
X-Gm-Message-State: AOAM53307a3qt/9XkN4dnV3m2iHStq+vTF5aK9Ggua7O6Y93DEnRe22N
        Drr1O2LCM9OpnK2y98Y3U8t46Q==
X-Google-Smtp-Source: ABdhPJyKYQaL7n0/69580vcnh1flp5yFc5GK187OIi185Wr/O2PVX71NQHAwBq6QQ/SBfgM5qiD68Q==
X-Received: by 2002:a19:e85:: with SMTP id 127mr2699767lfo.77.1615992059618;
        Wed, 17 Mar 2021 07:40:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 18/26] drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
Date:   Wed, 17 Mar 2021 17:40:31 +0300
Message-Id: <20210317144039.556409-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make save_state/restore callbacks accept struct msm_dsi_phy rather than
struct msm_dsi_pll. This moves them to struct msm_dsi_phy_ops, allowing
us to drop struct msm_dsi_pll_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 12 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 11 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 22 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 24 ++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 32 ++++++++-----------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 18 +++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 22 ++++++-------
 7 files changed, 59 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index e9424a4c636e..2ef9abaf052d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -847,9 +847,9 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 
 void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
 {
-	if (phy->cfg->pll_ops.save_state) {
-		phy->cfg->pll_ops.save_state(phy->pll);
-		phy->pll->state_saved = true;
+	if (phy->cfg->ops.save_state) {
+		phy->cfg->ops.save_state(phy);
+		phy->state_saved = true;
 	}
 }
 
@@ -857,12 +857,12 @@ int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy)
 {
 	int ret;
 
-	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
-		ret = phy->cfg->pll_ops.restore_state(phy->pll);
+	if (phy->cfg->ops.restore_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_state(phy);
 		if (ret)
 			return ret;
 
-		phy->pll->state_saved = false;
+		phy->state_saved = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 0fff9e3afb53..179027b2c4e3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -20,7 +20,6 @@
 struct msm_dsi_pll {
 	struct clk_hw	clk_hw;
 	bool		pll_on;
-	bool		state_saved;
 
 	const struct msm_dsi_phy_cfg *cfg;
 };
@@ -32,18 +31,14 @@ struct msm_dsi_phy_ops {
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
-};
-
-struct msm_dsi_pll_ops {
-	void (*save_state)(struct msm_dsi_pll *pll);
-	int (*restore_state)(struct msm_dsi_pll *pll);
+	void (*save_state)(struct msm_dsi_phy *phy);
+	int (*restore_state)(struct msm_dsi_phy *phy);
 };
 
 struct msm_dsi_phy_cfg {
 	enum msm_dsi_phy_type type;
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
-	const struct msm_dsi_pll_ops pll_ops;
 
 	unsigned long	min_pll_rate;
 	unsigned long	max_pll_rate;
@@ -119,6 +114,8 @@ struct msm_dsi_phy {
 	struct msm_dsi_pll *pll;
 
 	struct clk_hw_onecell_data *provided_clocks;
+
+	bool state_saved;
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 7533db8955a5..1a470c7356ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -515,9 +515,9 @@ static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -538,9 +538,9 @@ static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
+	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 val;
@@ -559,7 +559,7 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1003,10 +1003,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_state = dsi_10nm_save_state,
+		.restore_state = dsi_10nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1028,10 +1026,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.pll_init = dsi_pll_10nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_10nm_save_state,
-		.restore_state = dsi_pll_10nm_restore_state,
+		.save_state = dsi_10nm_save_state,
+		.restore_state = dsi_10nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 23f198164c0e..61e482b2ddd7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -795,9 +795,9 @@ static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
  * PLL Callbacks
  */
 
-static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
@@ -810,18 +810,18 @@ static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
 	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_14nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
+	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
 	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
 	int ret;
 
-	ret = dsi_pll_14nm_vco_set_rate(&pll->clk_hw,
+	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
@@ -1167,10 +1167,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_state = dsi_14nm_save_state,
+		.restore_state = dsi_14nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1192,10 +1190,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.pll_init = dsi_pll_14nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_14nm_save_state,
-		.restore_state = dsi_pll_14nm_restore_state,
+		.save_state = dsi_14nm_save_state,
+		.restore_state = dsi_14nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 5188ba21afa7..df078e8c593c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -467,9 +467,9 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
  * PLL Callbacks
  */
 
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -478,20 +478,20 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
-		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
+		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 	else
 		cached_state->vco_rate = 0;
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -818,10 +818,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_hpm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -843,10 +841,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_hpm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -868,10 +864,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_lp_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 15b05ae554a0..fa2e0702ce25 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -334,9 +334,9 @@ static const struct clk_ops clk_bytediv_ops = {
 /*
  * PLL Callbacks
  */
-static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 
@@ -347,17 +347,17 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
 }
 
-static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
 	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
 	void __iomem *base = pll_28nm->mmio;
 	int ret;
 
-	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
+	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
@@ -663,10 +663,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.pll_init = dsi_pll_28nm_8960_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_28nm_save_state,
-		.restore_state = dsi_pll_28nm_restore_state,
+		.save_state = dsi_28nm_save_state,
+		.restore_state = dsi_28nm_restore_state,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index d3fea4a2b498..e9a52e7b7411 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -540,9 +540,9 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
  * PLL Callbacks
  */
 
-static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
+static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
@@ -563,9 +563,9 @@ static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
-static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
+static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
@@ -584,7 +584,7 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
-	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
 	if (ret) {
 		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
@@ -1036,10 +1036,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_state = dsi_7nm_save_state,
+		.restore_state = dsi_7nm_restore_state,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1061,10 +1059,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.pll_init = dsi_pll_7nm_init,
-	},
-	.pll_ops = {
-		.save_state = dsi_pll_7nm_save_state,
-		.restore_state = dsi_pll_7nm_restore_state,
+		.save_state = dsi_7nm_save_state,
+		.restore_state = dsi_7nm_restore_state,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
-- 
2.30.2


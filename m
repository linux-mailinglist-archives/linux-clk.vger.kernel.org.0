Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BB2347C5A
	for <lists+linux-clk@lfdr.de>; Wed, 24 Mar 2021 16:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbhCXPUW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 24 Mar 2021 11:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236600AbhCXPTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8F4C0613E2
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v15so2361405lfq.5
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2p4oL96Pew8x1y5rAyDAueBp+j2sBp7UMdeXoZ4vvl4=;
        b=d8sJpXgwe9DJ1tCXbTxqlGFJRNc/qZ8qcDgD38y5+D2CHrlV8nYcAzHhTkMXRPLWnI
         sN+XyUgluLaV0X0FUMjy2CU8nPwS8Z2SMDp7KpnDo5NrSCTg5RLec4O3NUMlKakOv6bR
         +KJdmNUSfu9BepDgLzfipBVz+2kif1B4doJiaIhfY/+CGVoJNW2WqdS2Kd59NqrCbWNC
         51AopBb/vHgz4A5jJ1lBXYfUP+YsQ04d/0roOwQciclyIvM0NLyn/IYA3gnvSkVoAlxj
         PeS+fpeC3/NbuYmXwkpU1hOuebg8SfY9mva3mXXNQ7rmHzwBWAAixfxtn3TS4rXfWiZs
         s5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2p4oL96Pew8x1y5rAyDAueBp+j2sBp7UMdeXoZ4vvl4=;
        b=kxBb1d8puF0KPRCj7RfpLfgbgTjNgxeqmEswCbzuN7uCkY/CHi3CVy+n+4fsBjkh6i
         8F/G7CC7//LAqKZ6yLxVVgWCyoSVF4bkPb4mPyhGkrMaCu9utvuM0p+Saz18pxRFGSei
         a5+tjoSzLM8LgBY6SIwZBzl0giaRgsNJmcSIy7/SBip5/kIy2fdD+pM+EHCbVwL3MPSv
         m7Kfr1IKDYPKcoDxIE2VnTINMQ48Ym0s+X84OQ90bEhc6zJk3LSYKXTfoRKX/5MpCuqa
         hL0v1qIEW7cLKvrIreeQKMAcJGZ3HeebwXS2xT89dzGTyXmWFWyaYuMjtypvkNV/w9lg
         0o2Q==
X-Gm-Message-State: AOAM533hEzJoQr6gTsNYrrcMsrwbeVkWzR/foTHluK1ADfiOmRWJxiQJ
        vCawVmhJP0f3LtVMJPwyfzSv5Q==
X-Google-Smtp-Source: ABdhPJxlVNikKcVyKSy3W8slUiZrfHdKCa7RBBJsDiV2YYQ4cTwzCzOUGSXeGoyYhYx5zwOTyTbi1Q==
X-Received: by 2002:ac2:4857:: with SMTP id 23mr2286025lfy.136.1616599173229;
        Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 20/28] drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
Date:   Wed, 24 Mar 2021 18:18:38 +0300
Message-Id: <20210324151846.2774204-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  86 ++++++++-----
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 120 ++++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  35 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |   2 -
 6 files changed, 171 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 8133732e0c7f..b477d21804c8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -32,8 +32,6 @@ struct msm_dsi_phy_ops {
 };
 
 struct msm_dsi_pll_ops {
-	int (*enable_seq)(struct msm_dsi_pll *pll);
-	void (*disable_seq)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 434d02ffa7fe..91c5bb2fd169 100644
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
@@ -1157,8 +1170,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -1183,8 +1194,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.disable_seq = dsi_pll_14nm_disable_seq,
-		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 87d1aa4114e4..53e225934f9e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -289,19 +289,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
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
@@ -376,21 +364,28 @@ static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
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
@@ -400,6 +395,9 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
 	DBG("id=%d", pll_28nm->id);
 
+	if (unlikely(pll->pll_on))
+		return 0;
+
 	pll_28nm_software_reset(pll_28nm);
 
 	/*
@@ -424,22 +422,54 @@ static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 
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
@@ -490,7 +520,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
-		.ops = &clk_ops_dsi_pll_28nm_vco,
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk_hw *hw;
@@ -498,6 +527,11 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	DBG("%d", pll_28nm->id);
 
+	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
+		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
+	else
+		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
+
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
 	pll_28nm->base.clk_hw.init = &vco_init;
 	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
@@ -753,8 +787,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -779,8 +811,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
@@ -805,8 +835,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.pll_ops = {
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
-		.disable_seq = dsi_pll_28nm_disable_seq,
-		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 45b2bf482392..952444e3e8f0 100644
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
@@ -652,8 +666,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
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


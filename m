Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377D734FE92
	for <lists+linux-clk@lfdr.de>; Wed, 31 Mar 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbhCaK6A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 Mar 2021 06:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbhCaK5m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF945C061574
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g8so28497432lfv.12
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EonruqiADhd6wFRlOBVZ0FDfq5rb+cr1lNaexLrxNy4=;
        b=dggWK1k2bfL7NGCRzmOzn3qwDljDsUWqDztWmrWQEpWDvm2MGHTd6IYhd11hA4vNYn
         UXio2WkohuI6j6bcenpfejeObwfI6V2jTT7z1bHK1OEfv2Tn2Hz4t15gdfmX3Smqcy/W
         k0F205X7FnlqQc+GoKhciE0j0hj13NMsBgk2kuCIYy2WGC5WIqLF9GOe5p40TmjeRwGF
         tA52kEvHN0oInWvr6XYT0TZoYJDH1j29yjx6wciIn/DDZ9NT9jMQ6/rQuC+cBP4T9PlF
         ugMLMtiRfbTmBNnfKR5M3lkA3byTtt4BzUgk21srz5aqcXhDzi2NvPPte5i/5GCuUKyz
         BD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EonruqiADhd6wFRlOBVZ0FDfq5rb+cr1lNaexLrxNy4=;
        b=YryFC2fiadGQclajUp6L1Om1t9baj75PBi9MO9leUvwyeNQcBCpJnNtAgZa3Rj1YxK
         hw9Q2mHJ0VOyavPqvsMNGHRgLcGHCkLmILoAB87+B2EOoAZ5yn4y5/3/CTkIFfV8ZRad
         NjMp7mMOQTnwGdn7EMCCK8q+DPB8heA02CqgIs+Fziu8EphdpCqHOWGyDV8TkrIokh45
         qHDDju0PHp4FC/28lSucIlaoBWkb4XzTezTbWTNIBQcG4NOvq8A3v9VHDF9S3SjEPxGQ
         9ATxNvRlFrL+LPdGzbpQNHK94FWkYLQDLzkalm/nm4tHfD4YV35SE2P3pXhnAVhdKIpY
         J4Og==
X-Gm-Message-State: AOAM531aPD8FPfIueD4Jqtz4r7Mh+QTHI0Sl+V5db8VYxl/39fhDsHYH
        myCxsPpB8mWAs9Xai/B6EOdKHQ==
X-Google-Smtp-Source: ABdhPJypxCzjBaBFZn4tjOFu4bjiIX9LEMWsGIpyGt6rz6LnVhaTZQCP2XAgUf7rzByHBDbVvqP4hg==
X-Received: by 2002:a05:6512:b0d:: with SMTP id w13mr1893508lfu.16.1617188259248;
        Wed, 31 Mar 2021 03:57:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 03/24] drm/msm/dsi: replace PHY's init callback with configurable data
Date:   Wed, 31 Mar 2021 13:57:14 +0300
Message-Id: <20210331105735.3690009-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DSI PHY init callback would either map dsi_phy_regulator or dsi_phy_lane
depending on the PHY type. Replace those callbacks with configuration
options governing mapping those regions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 42 ++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 +--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 19 +--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  6 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 +--------
 8 files changed, 31 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index e8c1a727179c..83eb0a630443 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -637,24 +637,6 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
 	return -EINVAL;
 }
 
-int msm_dsi_phy_init_common(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-	int ret = 0;
-
-	phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator",
-				"DSI_PHY_REG");
-	if (IS_ERR(phy->reg_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n",
-			__func__);
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-fail:
-	return ret;
-}
-
 static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
@@ -691,6 +673,24 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (phy->cfg->has_phy_lane) {
+		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
+		if (IS_ERR(phy->lane_base)) {
+			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
+			ret = -ENOMEM;
+			goto fail;
+		}
+	}
+
+	if (phy->cfg->has_phy_regulator) {
+		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", "DSI_PHY_REG");
+		if (IS_ERR(phy->reg_base)) {
+			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
+			ret = -ENOMEM;
+			goto fail;
+		}
+	}
+
 	ret = dsi_phy_regulator_init(phy);
 	if (ret)
 		goto fail;
@@ -702,12 +702,6 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	if (phy->cfg->ops.init) {
-		ret = phy->cfg->ops.init(phy);
-		if (ret)
-			goto fail;
-	}
-
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index d2bd74b6f357..03dfb08e7128 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,7 +17,6 @@
 #define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
 
 struct msm_dsi_phy_ops {
-	int (*init) (struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
@@ -37,6 +36,8 @@ struct msm_dsi_phy_cfg {
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
 	const int quirks;
+	bool has_phy_regulator;
+	bool has_phy_lane;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
@@ -106,7 +107,6 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask);
-int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_PHY_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d1b92d4dc197..655fa17a0452 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -216,24 +216,10 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 	DBG("DSI%d PHY disabled", phy->id);
 }
 
-static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				     "DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -243,7 +229,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.ops = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
-		.init = dsi_10nm_phy_init,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
@@ -252,6 +237,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -261,7 +247,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.ops = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
-		.init = dsi_10nm_phy_init,
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 519400501bcd..6989730b5fbd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -129,24 +129,10 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 	wmb();
 }
 
-static int dsi_14nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				"DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -156,7 +142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.ops = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
-		.init = dsi_14nm_phy_init,
 	},
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
@@ -165,6 +150,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -174,7 +160,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.ops = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
-		.init = dsi_14nm_phy_init,
 	},
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index eca86bf448f7..b752636f7f21 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -127,6 +127,7 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 	.type = MSM_DSI_PHY_20NM,
 	.src_pll_truthtable = { {false, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
@@ -137,7 +138,6 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
 	.ops = {
 		.enable = dsi_20nm_phy_enable,
 		.disable = dsi_20nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0xfd998500, 0xfd9a0500 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index c3c580cfd8b1..5bf79de0da67 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -153,6 +153,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -162,7 +163,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0xfd922b00, 0xfd923100 },
 	.num_dsi_phy = 2,
@@ -171,6 +171,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -180,7 +181,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
@@ -189,6 +189,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -198,7 +199,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f22583353957..5d33de27a0f4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -176,6 +176,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.type = MSM_DSI_PHY_28NM_8960,
 	.src_pll_truthtable = { {true, true}, {false, true} },
+	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -185,7 +186,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 	.ops = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
-		.init = msm_dsi_phy_init_common,
 	},
 	.io_start = { 0x4700300, 0x5800300 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 79c034ae075d..cbfeec860e69 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -224,24 +224,10 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	DBG("DSI%d PHY disabled", phy->id);
 }
 
-static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
-{
-	struct platform_device *pdev = phy->pdev;
-
-	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
-				     "DSI_PHY_LANE");
-	if (IS_ERR(phy->lane_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
-			__func__);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.type = MSM_DSI_PHY_7NM_V4_1,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -251,7 +237,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.ops = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
-		.init = dsi_7nm_phy_init,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
@@ -260,6 +245,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.type = MSM_DSI_PHY_7NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
+	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
@@ -269,7 +255,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.ops = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
-		.init = dsi_7nm_phy_init,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
-- 
2.30.2


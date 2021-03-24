Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1B1347C62
	for <lists+linux-clk@lfdr.de>; Wed, 24 Mar 2021 16:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236612AbhCXPUY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 24 Mar 2021 11:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236580AbhCXPTz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:55 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480FFC0613B4
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a198so32536884lfd.7
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OoyKU1h/oJDC00eudzBASZPAkR4D3lrK9KAbb6lplKk=;
        b=cHM6frftyuBwYpTJSGuZP7c26UtCzMSfFvwRCp7/SrfuqZmjcggjZ9qJPJuaJA6egA
         Tp99G38yvdjKsoMKCshAz4dTTOneqrD1durNaD0nswm8SAe0ElSeBDgmVc/3U/kBuUd2
         Ozd9g2Qu9acq6vF1bUbp93f6ROhj/uRbAQYIu4MqRzzOBCqIYGFO3DUQH0zGEFuxV5kM
         iXt8qJ19gQg9yuccciYLcR0BU8k7UR0Y8nxB7gGOnSDOSIvI+NeZ+8QhX+Jb0IazVAZb
         sN8JlpS03/zz9pMw40tflg9Hre49ZafXZRNljB334aoJpLXsof+ZWfUvf25xE2sPNTRG
         L5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OoyKU1h/oJDC00eudzBASZPAkR4D3lrK9KAbb6lplKk=;
        b=f0rSXiGVampda3/mJHSfNkIFdJM0mhAmc00QVClXaMT78hpnoDhJ1PP8wFWZD9+9Y3
         Baq8xQFC/hQCE+Wpcxl5LyzSO/bAl7G5FfslbZxa7oGsFr1lDQjBuW9oCiZ6K7/4Z8HC
         0KJ3RbVpe97SsJd96KblxkxochfbGsUc097TLoSB9/fvkuOzcih0/J3MsuC/mbv92DwW
         Qu7HxGu2FYHkpX19KaX7vv0Zq4KC7qmvLkRHeRb0dW1QBnOTwp8GgNtYfXaS/1GbDefe
         Y+AucnJOfnbTtCuqNdx/pRGQUJ+8MXtNbeOOm+QzIXbGV4Ii7X4zjuOCGUPja/1hcO9y
         80QA==
X-Gm-Message-State: AOAM5319U4y8TNQIsfn1wHiLkU4ykeTLURB7N5zRvOCGu39NzSzrnvdo
        kFX6vTRKbagApR/q3xGyXFkXTQ==
X-Google-Smtp-Source: ABdhPJyEuyQTNfylgOLyg9TWYe1tI8iha+g40dzd2kXPT62uOQTpq1lgsIGN4yg5I1dzOa4gdRvGVg==
X-Received: by 2002:a05:6512:2097:: with SMTP id t23mr2109899lfr.21.1616599181748;
        Wed, 24 Mar 2021 08:19:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 27/28] drm/msm/dsi: inline msm_dsi_phy_set_src_pll
Date:   Wed, 24 Mar 2021 18:18:45 +0300
Message-Id: <20210324151846.2774204-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The src_truthtable config is not used for some of phys, which use other
means of configuring the master/slave usecases. Inline this function
with the goal of removing src_pll_id argument in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 17 -----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  8 --------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 13 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 11 +++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 13 +++++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 --
 8 files changed, 21 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4aeedcbbda32..8f7726bb598c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -461,23 +461,6 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
-void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
-				u32 bit_mask)
-{
-	int phy_id = phy->id;
-	u32 val;
-
-	if ((phy_id >= DSI_MAX) || (pll_id >= DSI_MAX))
-		return;
-
-	val = dsi_phy_read(phy->base + reg);
-
-	if (phy->cfg->src_pll_truthtable[phy_id][pll_id])
-		dsi_phy_write(phy->base + reg, val | bit_mask);
-	else
-		dsi_phy_write(phy->base + reg, val & (~bit_mask));
-}
-
 static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 {
 	struct regulator_bulk_data *s = phy->supplies;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 8e828c5ca8f4..3b207cf9f6b4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -33,12 +33,6 @@ struct msm_dsi_phy_cfg {
 	unsigned long	min_pll_rate;
 	unsigned long	max_pll_rate;
 
-	/*
-	 * Each cell {phy_id, pll_id} of the truth table indicates
-	 * if the source PLL selection bit should be set for each PHY.
-	 * Fill default H/W values in illegal cells, eg. cell {0, 1}.
-	 */
-	bool src_pll_truthtable[DSI_MAX][DSI_MAX];
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
 	const int quirks;
@@ -121,7 +115,5 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
-void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
-				u32 bit_mask);
 
 #endif /* __DSI_PHY_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 1fbb54f4df98..04535ccd11ef 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -919,7 +919,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -941,7 +940,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d08ad0c632b4..7a87bed71e36 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -947,6 +947,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	int ret;
 	void __iomem *base = phy->base;
 	void __iomem *lane_base = phy->lane_base;
+	u32 glbl_test_ctrl;
 
 	if (msm_dsi_dphy_timing_calc_v2(timing, clk_req)) {
 		DRM_DEV_ERROR(&phy->pdev->dev,
@@ -994,10 +995,12 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	udelay(100);
 	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
-				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
-
+	glbl_test_ctrl = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
+	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, glbl_test_ctrl);
 	ret = dsi_14nm_set_usecase(phy);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
@@ -1021,7 +1024,6 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -1043,7 +1045,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index 5e73f811d645..f5b88c85a8fc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -70,6 +70,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	int i;
 	void __iomem *base = phy->base;
 	u32 cfg_4[4] = {0x20, 0x40, 0x20, 0x00};
+	u32 val;
 
 	DBG("");
 
@@ -83,9 +84,12 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_20nm_PHY_GLBL_TEST_CTRL,
-				DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
+	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
+	if (src_pll_id == DSI_1)
+		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL, val);
 
 	for (i = 0; i < 4; i++) {
 		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_3(i),
@@ -125,7 +129,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
-	.src_pll_truthtable = { {false, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 8c973775cfb0..4aa100bb1659 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -704,6 +704,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
 	int i;
 	void __iomem *base = phy->base;
+	u32 val;
 
 	DBG("");
 
@@ -743,9 +744,12 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
 
-	msm_dsi_phy_set_src_pll(phy, src_pll_id,
-				REG_DSI_28nm_PHY_GLBL_TEST_CTRL,
-				DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL);
+	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
+	if (phy->id == DSI_1 && src_pll_id == DSI_0)
+		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	else
+		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
+	dsi_phy_write(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL, val);
 
 	return 0;
 }
@@ -763,7 +767,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -785,7 +788,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
@@ -807,7 +809,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 9ddd0adccce3..d2bfe43c9ef1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -642,7 +642,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
-	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
 		.num = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ce6ae2fba993..619998506b78 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -955,7 +955,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
@@ -978,7 +977,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
-	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
 		.num = 1,
-- 
2.30.2


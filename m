Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A2533F385
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 15:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbhCQOlj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 10:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhCQOlH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:41:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75C5C06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:41:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id f26so3462221ljp.8
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nP3iOBLM5ZoU4QmpwHMaEerumnNqXyVrKcIMHPiRyvY=;
        b=vXINXGezd16NvLEurZ0oNmR4aAe9/hKNo7nJ6AOwIZoxJ3jyxlxrQx6OA1UH9riGag
         F3yprPV0YrC4cS0Swt15sILo9p+zO/Cvso9F/tOUIsqwd8wN1A06SRDtB3hzC6Yz+kXK
         rAetYTtE/Kk/mZeDuW3aO+YLAwD6lX6596S5cycgBq2psbhhRROVlW13xsmL2ombTjwr
         sq0YvIS9M80byVaqbHenpBq2BKwYOdqwsQ6t3trioP+yMNrvsqz0bKItVAhYxBM4giHP
         jGFOnMrJ7J1AnAVFWBdluaT1qtirzKOUbvOWHE32k5Y8XqTqnB6ueuaDH28l5ye3biVB
         kAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nP3iOBLM5ZoU4QmpwHMaEerumnNqXyVrKcIMHPiRyvY=;
        b=U1SWxhrDIUyzTu8RgO5tiEVVpVDhKBw7rWLhAE8lK7DO283zFLC2oJFeiA9wx/TacC
         MXdbeX/Z6ND14RECSmxIk3MqIW7YOYm1Sw5kptnnfCTGVB75+wnG1FbEPlikVDq2MFRs
         mzLeMesg/6epQplW4jB4E/AVNz6JJJXhrHwx6jyq8x15ooAv0Y1g+Ppmzn2iY3DJJPKs
         WlX/xTtC9uaUReMIhbBnto6K3yXc94JwdJXGqyt0U7RLo1lXIXVYQi4f2J34Bb0XzS0j
         lYTYx9ay7PZZjUoQSv3qB6eZmEHqr+PIJGbtBrnKOZTxfmTdQBhfuneMsDIe0iBAE9Em
         cQHA==
X-Gm-Message-State: AOAM532Tc88356K32yRWqLCkBwWedU70CZBuacgSXF+egssGz0dacwez
        6G+paS8Z/j2BbCprW1v/x4KlrA==
X-Google-Smtp-Source: ABdhPJxBMufC0eJRqfossH8WhoVXcTKzaLNhm70/Ox8eF+oJWJoYX+yFgbbquGaMsSbah6BxdlFDmw==
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr2617073ljk.384.1615992065390;
        Wed, 17 Mar 2021 07:41:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:41:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 24/26] drm/msm/dsi: drop global msm_dsi_phy_type enumaration
Date:   Wed, 17 Mar 2021 17:40:37 +0300
Message-Id: <20210317144039.556409-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With the current upstream driver the msm_dsi_phy_type enum does not make
much sense: all DSI PHYs are probed using the dt bindings, the phy type
is not passed between drivers. Use quirks in phy individual PHY drivers
to differentiate minor harware differences and drop the enum.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                  | 12 ------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c     | 11 ++++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     |  2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c     |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c     | 15 ++++++++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++++++++++--------
 8 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 351bfbeb53bd..5c32ee2b3605 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -23,18 +23,6 @@
 struct msm_dsi_phy_shared_timings;
 struct msm_dsi_phy_clk_request;
 
-enum msm_dsi_phy_type {
-	MSM_DSI_PHY_28NM_HPM,
-	MSM_DSI_PHY_28NM_LP,
-	MSM_DSI_PHY_20NM,
-	MSM_DSI_PHY_28NM_8960,
-	MSM_DSI_PHY_14NM,
-	MSM_DSI_PHY_10NM,
-	MSM_DSI_PHY_7NM,
-	MSM_DSI_PHY_7NM_V4_1,
-	MSM_DSI_PHY_MAX
-};
-
 enum msm_dsi_phy_usecase {
 	MSM_DSI_PHY_STANDALONE,
 	MSM_DSI_PHY_MASTER,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 0aa2729ed4b5..8e828c5ca8f4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -17,9 +17,6 @@
 #define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
 #define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
 
-/* v3.0.0 10nm implementation that requires the old timings settings */
-#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
-
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
@@ -30,7 +27,6 @@ struct msm_dsi_phy_ops {
 };
 
 struct msm_dsi_phy_cfg {
-	enum msm_dsi_phy_type type;
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d402a2fa487c..e7039486c3af 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -38,6 +38,9 @@
 #define VCO_REF_CLK_RATE		19200000
 #define FRAC_BITS 18
 
+/* v3.0.0 10nm implementation that requires the old timings settings */
+#define DSI_PHY_10NM_QUIRK_OLD_TIMINGS	BIT(0)
+
 struct dsi_pll_config {
 	bool enable_ssc;
 	bool ssc_center;
@@ -741,7 +744,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
+	if (phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)
 		tx_dctrl[3] = 0x02;
 
 	/* Strength ctrl settings */
@@ -776,7 +779,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
+	if (!(phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)) {
 		/* Toggle BIT 0 to release freeze I/0 */
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
@@ -916,7 +919,6 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -939,7 +941,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
-	.type = MSM_DSI_PHY_10NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -959,5 +960,5 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
-	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
+	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 1459aff3d979..fe7ec4cd6f92 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1021,7 +1021,6 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -1044,7 +1043,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
-	.type = MSM_DSI_PHY_14NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index b752636f7f21..5e73f811d645 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -125,7 +125,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
-	.type = MSM_DSI_PHY_20NM,
 	.src_pll_truthtable = { {false, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 6e391f0d3ffb..d859a39c69b2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -34,6 +34,9 @@
 #define VCO_MIN_RATE			350000000
 #define VCO_MAX_RATE			750000000
 
+/* v2.0.0 28nm LP implementation */
+#define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
+
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
 	unsigned long vco_rate;
@@ -203,10 +206,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->phy->cfg->type == MSM_DSI_PHY_28NM_HPM)
-		udelay(1);
-	else /* LP */
+	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		udelay(1000);
+	else
+		udelay(1);
 
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -698,7 +701,7 @@ static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
 	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
 
-	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
+	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
 	else
 		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
@@ -783,7 +786,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -806,7 +808,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
-	.type = MSM_DSI_PHY_28NM_HPM,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -829,7 +830,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
-	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
@@ -849,5 +849,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index e3a6148e1d3b..33aabddeeb1f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -642,7 +642,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
-	.type = MSM_DSI_PHY_28NM_8960,
 	.src_pll_truthtable = { {true, true}, {false, true} },
 	.has_phy_regulator = true,
 	.reg_cfg = {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 1ea11fd7a3b5..ecd514ac5787 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -38,6 +38,9 @@
 #define VCO_REF_CLK_RATE		19200000
 #define FRAC_BITS 18
 
+/* Hardware is V4.1 */
+#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
+
 struct dsi_pll_config {
 	bool enable_ssc;
 	bool ssc_center;
@@ -114,7 +117,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 
 	dec = div_u64(dec_multiple, multiplier);
 
-	if (pll->phy->cfg->type != MSM_DSI_PHY_7NM_V4_1)
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
 		config->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
 		config->pll_clock_inverters = 0xa0;
@@ -195,7 +198,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->phy->pll_base;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (pll->phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -229,9 +232,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
 	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  pll->phy->cfg->type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
+		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
 
-	if (pll->phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
 			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
@@ -772,7 +775,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1)
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -836,7 +839,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
 		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
 		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
@@ -953,7 +956,6 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 }
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
-	.type = MSM_DSI_PHY_7NM_V4_1,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -973,10 +975,10 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
-	.type = MSM_DSI_PHY_7NM,
 	.src_pll_truthtable = { {false, false}, {true, false} },
 	.has_phy_lane = true,
 	.reg_cfg = {
-- 
2.30.2


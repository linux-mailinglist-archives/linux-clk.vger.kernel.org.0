Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA02E34FEB5
	for <lists+linux-clk@lfdr.de>; Wed, 31 Mar 2021 12:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhCaK6J (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 Mar 2021 06:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbhCaK55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:57 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE7FC06175F
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id f26so23299490ljp.8
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4kK4jyf8iX9jLruEwYryjpYkcBWyHg61rgAtKP/czE=;
        b=uHFZrLpk7yYO+CMaMBxaA3G2T24Oi7VM0Y2F50nXFT3Ry7m1lePd19F9rgG0DJiLr+
         rTL64EQdnncZ5OByqNJ9R8cbSupHQfwE/Om/Fu12SlRaCMwSUt/lbo7sNtQirYxSucEh
         2nOnCUvHPJfL2LvCfSbcMe5ihyztUkS1/cD5OeBZdrhEWCzx1tZ3vHS5iwin4S7f2bnC
         /cGRY/kzAryOYk935/vtqLWy0+liCQ6DWIriknHlcuOikR3sSxPy9tbdIGSJPG9x+X28
         wFIaGJmJeOk54GFsuiZ3+UsEt4ukoOka2XW5Cru/U+KWtmKC/Qkp3h9nNznwNY0aZhBL
         wNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4kK4jyf8iX9jLruEwYryjpYkcBWyHg61rgAtKP/czE=;
        b=lbY4SLrs+HvQ3kqdD6U/+/RJ1C4zlyn/C/6OM5jnvdQ+hrdLf211WDnuxCphMeY1Hy
         ifzNp2QJsiw5oxO02O3+nwF/QZq0L4RcDWvTCvVmKui4t+S44KCAYAhQ+ahR8D8LfG3v
         l+TSVUkhoT9kTfhTYx910XAJ+NIwyz5HhaP4sYAejYgKhYwC98IWrN29HanTgy3CpNDP
         vtHaURacpWbuK6B2aZZdR1nzOXrUEfuzEEqMl2gKaxXYeOLvVJwmjVkjg1KkdvwWXmbU
         obYjYNKkQWhyJ+p8nArvCUs4Ej1WyZP+ZeOu0rF3F7GYlAC6xIegkutYKaV2jW0ojRT+
         GBKA==
X-Gm-Message-State: AOAM533MwsEnQ358tvXsutycjiNXUU3X1ucZlrmaJGkwvP9aXTFCiQf3
        o7j9zZML54jm62ElHRtU5X6jJw==
X-Google-Smtp-Source: ABdhPJyUYyGbJy78cUvmGkoJ+R4TpRgL9FmQAGYB+K9Oz9gtiuHCK6zxV29JX5XDkLvxlTwy+sErTA==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr1668745lji.509.1617188274369;
        Wed, 31 Mar 2021 03:57:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 19/24] drm/msm/dsi: drop PLL accessor functions
Date:   Wed, 31 Mar 2021 13:57:30 +0300
Message-Id: <20210331105735.3690009-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace PLL accessor functions (pll_read/pll_write*) with the DSI PHY
accessors, reducing duplication.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  24 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 124 ++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 126 ++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 118 +++++++--------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  54 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 140 +++++++++---------
 6 files changed, 283 insertions(+), 303 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index e80560f38d80..5a72b030376b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -14,6 +14,8 @@
 
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
+#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
+#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
 
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
@@ -120,27 +122,5 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask);
-/* PLL accessors */
-static inline void pll_write(void __iomem *reg, u32 data)
-{
-	msm_writel(data, reg);
-}
-
-static inline u32 pll_read(const void __iomem *reg)
-{
-	return msm_readl(reg);
-}
-
-static inline void pll_write_udelay(void __iomem *reg, u32 data, u32 delay_us)
-{
-	pll_write(reg, data);
-	udelay(delay_us);
-}
-
-static inline void pll_write_ndelay(void __iomem *reg, u32 data, u32 delay_ns)
-{
-	pll_write((reg), data);
-	ndelay(delay_ns);
-}
 
 #endif /* __DSI_PHY_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index cbf3d64d5efb..2b188c6a0a7a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -234,19 +234,19 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
 	if (pll->pll_configuration.enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
 			  regs->ssc_stepsize_low);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
 			  regs->ssc_stepsize_high);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
 			  regs->ssc_div_per_low);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
 			  regs->ssc_div_per_high);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
 			  regs->ssc_adjper_low);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
 			  regs->ssc_adjper_high);
-		pll_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
+		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
 			  SSC_EN | regs->ssc_control);
 	}
 }
@@ -255,26 +255,26 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 {
 	void __iomem *base = pll->mmio;
 
-	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE,
 		  0xba);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_OUTDIV, 0x00);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE, 0x00);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x08);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1, 0xc0);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0xfa);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_OUTDIV, 0x00);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE, 0x00);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x08);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1, 0xc0);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0xfa);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1,
 		  0x4c);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PFILT, 0x29);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PFILT, 0x29);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
 }
 
 static void dsi_pll_commit(struct dsi_pll_10nm *pll)
@@ -282,20 +282,20 @@ static void dsi_pll_commit(struct dsi_pll_10nm *pll)
 	void __iomem *base = pll->mmio;
 	struct dsi_pll_regs *reg = &pll->reg_setup;
 
-	pll_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
 		  reg->decimal_div_start);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
 		  reg->frac_div_start_low);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
 		  reg->frac_div_start_mid);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
 		  reg->frac_div_start_high);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
 		  reg->pll_lockdet_rate);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
 		  reg->pll_clock_inverters);
 }
 
@@ -351,21 +351,21 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	pll_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
+	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
 		  data & ~BIT(5));
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	pll_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CTRL_0,
 		  data | BIT(5));
-	pll_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	dsi_phy_write(pll->mmio + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
 	ndelay(250);
 }
 
@@ -373,8 +373,8 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = pll_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 		  data & ~BIT(5));
 }
 
@@ -382,8 +382,8 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = pll_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 		  data | BIT(5));
 }
 
@@ -404,7 +404,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	}
 
 	/* Start PLL */
-	pll_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
+	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
 		  0x01);
 
 	/*
@@ -426,10 +426,10 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	if (pll_10nm->slave)
 		dsi_pll_enable_global_clk(pll_10nm->slave);
 
-	pll_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
+	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
 		  0x01);
 	if (pll_10nm->slave)
-		pll_write(pll_10nm->slave->phy_cmn_mmio +
+		dsi_phy_write(pll_10nm->slave->phy_cmn_mmio +
 			  REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
 
 error:
@@ -438,7 +438,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_10nm *pll)
 {
-	pll_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -452,7 +452,7 @@ static void dsi_pll_10nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_10nm);
-	pll_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(pll_10nm->phy_cmn_mmio + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
 	dsi_pll_disable_sub(pll_10nm);
 	if (pll_10nm->slave) {
 		dsi_pll_disable_global_clk(pll_10nm->slave);
@@ -476,13 +476,13 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
-	dec = pll_read(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1);
+	dec = dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
-	frac = pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1);
-	frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1) &
+	frac = dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	frac |= ((dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1) &
 		  0xff) << 8);
-	frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
+	frac |= ((dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
 		  0x3) << 16);
 
 	/*
@@ -534,15 +534,15 @@ static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = pll_read(pll_10nm->mmio +
+	cached->pll_out_div = dsi_phy_read(pll_10nm->mmio +
 				       REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
-	cmn_clk_cfg0 = pll_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
+	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
 	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
 	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
 
-	cmn_clk_cfg1 = pll_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	cmn_clk_cfg1 = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
@@ -558,18 +558,18 @@ static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 	u32 val;
 	int ret;
 
-	val = pll_read(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = dsi_phy_read(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	pll_write(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	dsi_phy_write(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
-	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 		  cached->bit_clk_div | (cached->pix_clk_div << 4));
 
-	val = pll_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	val = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
 	val |= cached->pll_mux;
-	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
+	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
 	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw,
 			pll_10nm->vco_current_rate,
@@ -607,7 +607,7 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	pll_write(base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, (data << 2));
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, (data << 2));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index fd9ce68ec3be..9b4d7c5617a2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -172,7 +172,7 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 
 	tries = nb_tries;
 	while (tries--) {
-		val = pll_read(base +
+		val = dsi_phy_read(base +
 			       REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 		pll_locked = !!(val & BIT(5));
 
@@ -185,7 +185,7 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 	if (!pll_locked) {
 		tries = nb_tries;
 		while (tries--) {
-			val = pll_read(base +
+			val = dsi_phy_read(base +
 				REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 			pll_locked = !!(val & BIT(0));
 
@@ -387,29 +387,29 @@ static void pll_db_commit_ssc(struct dsi_pll_14nm *pll)
 
 	data = pin->ssc_adj_period;
 	data &= 0x0ff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1, data);
 	data = (pin->ssc_adj_period >> 8);
 	data &= 0x03;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2, data);
 
 	data = pout->ssc_period;
 	data &= 0x0ff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER1, data);
 	data = (pout->ssc_period >> 8);
 	data &= 0x0ff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER2, data);
 
 	data = pout->ssc_step_size;
 	data &= 0x0ff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1, data);
 	data = (pout->ssc_step_size >> 8);
 	data &= 0x0ff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2, data);
 
 	data = (pin->ssc_center & 0x01);
 	data <<= 1;
 	data |= 0x01; /* enable */
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER, data);
 
 	wmb();	/* make sure register committed */
 }
@@ -423,57 +423,57 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 
 	/* confgiure the non frequency dependent pll registers */
 	data = 0;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET, data);
 
 	data = pout->pll_txclk_en;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, data);
 
 	data = pout->pll_resetsm_cntrl;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, data);
 	data = pout->pll_resetsm_cntrl2;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, data);
 	data = pout->pll_resetsm_cntrl5;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, data);
 
 	data = pout->pll_vco_div_ref & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1, data);
 	data = (pout->pll_vco_div_ref >> 8) & 0x3;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2, data);
 
 	data = pout->pll_kvco_div_ref & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1, data);
 	data = (pout->pll_kvco_div_ref >> 8) & 0x3;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2, data);
 
 	data = pout->pll_misc1;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, data);
 
 	data = pin->pll_ie_trim;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, data);
 
 	data = pin->pll_ip_trim;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, data);
 
 	data = pin->pll_cpmset_cur << 3 | pin->pll_cpcset_cur;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, data);
 
 	data = pin->pll_icpcset_p << 3 | pin->pll_icpcset_m;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, data);
 
 	data = pin->pll_icpmset_p << 3 | pin->pll_icpcset_m;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, data);
 
 	data = pin->pll_icpmset << 3 | pin->pll_icpcset;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, data);
 
 	data = pin->pll_lpf_cap2 << 4 | pin->pll_lpf_cap1;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, data);
 
 	data = pin->pll_iptat_trim;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, data);
 
 	data = pin->pll_c3ctrl | pin->pll_r3ctrl << 4;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, data);
 }
 
 static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
@@ -483,13 +483,13 @@ static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 	/* de assert pll start and apply pll sw reset */
 
 	/* stop pll */
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
 
 	/* pll sw reset */
-	pll_write_udelay(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x20, 10);
+	dsi_phy_write_udelay(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x20, 10);
 	wmb();	/* make sure register committed */
 
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0);
 	wmb();	/* make sure register committed */
 }
 
@@ -504,53 +504,53 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 	DBG("DSI%d PLL", pll->id);
 
 	data = pout->cmn_ldo_cntrl;
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
 
 	pll_db_commit_common(pll, pin, pout);
 
 	pll_14nm_software_reset(pll);
 
 	data = pin->dsiclk_sel; /* set dsiclk_sel = 1  */
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, data);
 
 	data = 0xff; /* data, clk, pll normal operation */
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0, data);
 
 	/* configure the frequency dependent pll registers */
 	data = pout->dec_start;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_DEC_START, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DEC_START, data);
 
 	data = pout->div_frac_start & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1, data);
 	data = (pout->div_frac_start >> 8) & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2, data);
 	data = (pout->div_frac_start >> 16) & 0xf;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3, data);
 
 	data = pout->plllock_cmp & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1, data);
 
 	data = (pout->plllock_cmp >> 8) & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2, data);
 
 	data = (pout->plllock_cmp >> 16) & 0x3;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3, data);
 
 	data = pin->plllock_cnt << 1 | pin->plllock_rng << 3;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN, data);
 
 	data = pout->pll_vco_count & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1, data);
 	data = (pout->pll_vco_count >> 8) & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2, data);
 
 	data = pout->pll_kvco_count & 0xff;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1, data);
 	data = (pout->pll_kvco_count >> 8) & 0x3;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2, data);
 
 	data = (pout->pll_postdiv - 1) << 4 | pin->pll_lpf_res1;
-	pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, data);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, data);
 
 	if (pin->ssc_en)
 		pll_db_commit_ssc(pll);
@@ -620,16 +620,16 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec_start;
 	u64 ref_clk = parent_rate;
 
-	dec_start = pll_read(base + REG_DSI_14nm_PHY_PLL_DEC_START);
+	dec_start = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DEC_START);
 	dec_start &= 0x0ff;
 
 	DBG("dec_start = %x", dec_start);
 
-	div_frac_start = (pll_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3)
+	div_frac_start = (dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3)
 				& 0xf) << 16;
-	div_frac_start |= (pll_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2)
+	div_frac_start |= (dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2)
 				& 0xff) << 8;
-	div_frac_start |= pll_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1)
+	div_frac_start |= dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1)
 				& 0xff;
 
 	DBG("div_frac_start = %x", div_frac_start);
@@ -662,8 +662,8 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 	if (unlikely(pll_14nm->phy->pll_on))
 		return 0;
 
-	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
 
 	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
 					 POLL_TIMEOUT_US);
@@ -689,7 +689,7 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_14nm->phy->pll_on))
 		return;
 
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
 
 	pll_14nm->phy->pll_on = false;
 }
@@ -731,7 +731,7 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 
 	DBG("DSI%d PLL parent rate=%lu", pll_14nm->id, parent_rate);
 
-	val = pll_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
+	val = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
 	val &= div_mask(width);
 
 	return divider_recalc_rate(hw, parent_rate, val, NULL,
@@ -773,11 +773,11 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(lock, flags);
 
-	val = pll_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
+	val = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 	val &= ~(div_mask(width) << shift);
 
 	val |= value << shift;
-	pll_write(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
 
 	/* If we're master in dual DSI mode, then the slave PLL's post-dividers
 	 * follow the master's post dividers
@@ -786,7 +786,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
 
-		pll_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
+		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
 	}
 
 	spin_unlock_irqrestore(lock, flags);
@@ -811,7 +811,7 @@ static void dsi_14nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
 	u32 data;
 
-	data = pll_read(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
+	data = dsi_phy_read(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 
 	cached_state->n1postdiv = data & 0xf;
 	cached_state->n2postdiv = (data >> 4) & 0xf;
@@ -843,14 +843,14 @@ static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 	DBG("DSI%d PLL restore state %x %x", pll_14nm->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
-	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
+	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
 
 	/* also restore post-dividers for slave DSI PLL */
 	if (phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
 
-		pll_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
+		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
 	}
 
 	return 0;
@@ -878,9 +878,9 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 		return -EINVAL;
 	}
 
-	pll_write(base + REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN, clkbuflr_en);
+	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN, clkbuflr_en);
 	if (bandgap)
-		pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP, bandgap);
+		dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP, bandgap);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b6b169ea27ae..731dc0a20ff5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -86,7 +86,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = pll_read(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_STATUS);
+		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_STATUS);
 		pll_locked = !!(val & DSI_28nm_PHY_PLL_STATUS_PLL_RDY);
 
 		if (pll_locked)
@@ -107,9 +107,9 @@ static void pll_28nm_software_reset(struct dsi_pll_28nm *pll_28nm)
 	 * Add HW recommended delays after toggling the software
 	 * reset bit off and back on.
 	 */
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG,
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG,
 			DSI_28nm_PHY_PLL_TEST_CFG_PLL_SW_RESET, 1);
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG, 0x00, 1);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_TEST_CFG, 0x00, 1);
 }
 
 /*
@@ -131,7 +131,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	VERB("rate=%lu, parent's=%lu", rate, parent_rate);
 
 	/* Force postdiv2 to be div-4 */
-	pll_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG, 3);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG, 3);
 
 	/* Configure the Loop filter resistance */
 	for (i = 0; i < LPFR_LUT_SIZE; i++)
@@ -142,11 +142,11 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				rate);
 		return -EINVAL;
 	}
-	pll_write(base + REG_DSI_28nm_PHY_PLL_LPFR_CFG, lpfr_lut[i].resistance);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFR_CFG, lpfr_lut[i].resistance);
 
 	/* Loop filter capacitance values : c1 and c2 */
-	pll_write(base + REG_DSI_28nm_PHY_PLL_LPFC1_CFG, 0x70);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_LPFC2_CFG, 0x15);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFC1_CFG, 0x70);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFC2_CFG, 0x15);
 
 	rem = rate % VCO_REF_CLK_RATE;
 	if (rem) {
@@ -171,7 +171,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	DBG("Generated VCO Clock: %lu", gen_vco_clk);
 	rem = 0;
-	sdm_cfg1 = pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
+	sdm_cfg1 = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
 	sdm_cfg1 &= ~DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK;
 	if (frac_n_mode) {
 		sdm_cfg0 = 0x0;
@@ -198,17 +198,17 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	cal_cfg10 = (u32)((gen_vco_clk % (256 * 1000000)) / 1000000);
 	DBG("cal_cfg10=%d, cal_cfg11=%d", cal_cfg10, cal_cfg11);
 
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG, 0x02);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG3,    0x2b);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG4,    0x06);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,  0x0d);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG, 0x02);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG3,    0x2b);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG4,    0x06);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,  0x0d);
 
-	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1, sdm_cfg1);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2,
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1, sdm_cfg1);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2,
 		DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(sdm_cfg2));
-	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3,
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3,
 		DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(sdm_cfg3));
-	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
 	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
@@ -216,18 +216,18 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		udelay(1);
 
-	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_VCOLPF_CFG, 0x31);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0,   sdm_cfg0);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG0,   0x12);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG6,   0x30);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG7,   0x00);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG8,   0x60);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG9,   0x00);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG10,  cal_cfg10 & 0xff);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG11,  cal_cfg11 & 0xff);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_EFUSE_CFG,  0x20);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_VCOLPF_CFG, 0x31);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0,   sdm_cfg0);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG0,   0x12);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG6,   0x30);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG7,   0x00);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG8,   0x60);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG9,   0x00);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG10,  cal_cfg10 & 0xff);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG11,  cal_cfg11 & 0xff);
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_EFUSE_CFG,  0x20);
 
 	return 0;
 }
@@ -253,27 +253,27 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	VERB("parent_rate=%lu", parent_rate);
 
 	/* Check to see if the ref clk doubler is enabled */
-	doubler = pll_read(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG) &
+	doubler = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG) &
 			DSI_28nm_PHY_PLL_REFCLK_CFG_DBLR;
 	ref_clk += (doubler * VCO_REF_CLK_RATE);
 
 	/* see if it is integer mode or sdm mode */
-	sdm0 = pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0);
+	sdm0 = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0);
 	if (sdm0 & DSI_28nm_PHY_PLL_SDM_CFG0_BYP) {
 		/* integer mode */
 		sdm_byp_div = FIELD(
-				pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
+				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
 				DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV) + 1;
 		vco_rate = ref_clk * sdm_byp_div;
 	} else {
 		/* sdm mode */
 		sdm_dc_off = FIELD(
-				pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1),
+				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1),
 				DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET);
 		DBG("sdm_dc_off = %d", sdm_dc_off);
-		sdm2 = FIELD(pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2),
+		sdm2 = FIELD(dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2),
 				DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0);
-		sdm3 = FIELD(pll_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3),
+		sdm3 = FIELD(dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3),
 				DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8);
 		sdm_freq_seed = (sdm3 << 8) | sdm2;
 		DBG("sdm_freq_seed = %d", sdm_freq_seed);
@@ -306,22 +306,22 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 	 * Add necessary delays recommended by hardware.
 	 */
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
 
 	for (i = 0; i < 2; i++) {
 		/* DSI Uniphy lock detect setting */
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
 				0x0c, 100);
-		pll_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
 
 		/* poll for PLL ready status */
 		locked = pll_28nm_poll_for_ready(pll_28nm,
@@ -336,22 +336,22 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 		 * Add necessary delays recommended by hardware.
 		 */
 		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 1);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 250);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 250);
 
 		val &= ~DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
 
 		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-		pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
 	}
 
 	if (unlikely(!locked))
@@ -401,21 +401,21 @@ static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 	 * PLL power up sequence.
 	 * Add necessary delays recommended by hardware.
 	 */
-	pll_write_ndelay(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34, 500);
+	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34, 500);
 
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
-	pll_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
-	pll_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
 
 	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B |
 		DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
-	pll_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
+	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 500);
 
 	/* DSI PLL toggle lock detect setting */
-	pll_write_ndelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x04, 500);
-	pll_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x05, 512);
+	dsi_phy_write_ndelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x04, 500);
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x05, 512);
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
@@ -439,7 +439,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	pll_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
+	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -486,10 +486,10 @@ static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *base = pll_28nm->mmio;
 
 	cached_state->postdiv3 =
-			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
+			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
 	cached_state->postdiv1 =
-			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
-	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
+			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
+	cached_state->byte_mux = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
 	if (dsi_pll_28nm_clk_is_enabled(phy->vco_hw))
 		cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
 	else
@@ -511,11 +511,11 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	pll_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
 			cached_state->postdiv3);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
 			cached_state->postdiv1);
-	pll_write(base + REG_DSI_28nm_PHY_PLL_VREG_CFG,
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_VREG_CFG,
 			cached_state->byte_mux);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 94d4a196e1b9..4bc6fab3a9aa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -78,7 +78,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = pll_read(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_RDY);
+		val = dsi_phy_read(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_RDY);
 		pll_locked = !!(val & DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY);
 
 		if (pll_locked)
@@ -107,29 +107,29 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	val = VCO_REF_CLK_RATE / 10;
 	fb_divider = (temp * VCO_PREF_DIV_RATIO) / val;
 	fb_divider = fb_divider / 2 - 1;
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1,
 			fb_divider & 0xff);
 
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
+	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
 
 	val |= (fb_divider >> 8) & 0x07;
 
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2,
 			val);
 
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
+	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 
 	val |= (VCO_PREF_DIV_RATIO - 1) & 0x3f;
 
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3,
 			val);
 
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_6,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_6,
 			0xf);
 
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 	val |= 0x7 << 4;
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
 			val);
 
 	return 0;
@@ -153,16 +153,16 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 
 	VERB("parent_rate=%lu", parent_rate);
 
-	status = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
+	status = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
 
 	if (status & DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE) {
-		fb_divider = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1);
+		fb_divider = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1);
 		fb_divider &= 0xff;
-		temp = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2) & 0x07;
+		temp = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2) & 0x07;
 		fb_divider = (temp << 8) | fb_divider;
 		fb_divider += 1;
 
-		ref_divider = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
+		ref_divider = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 		ref_divider &= 0x3f;
 		ref_divider += 1;
 
@@ -199,17 +199,17 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 	 * 2: divide by 8 to get bit clock divider
 	 * 3: write it to POSTDIV1
 	 */
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
 	byte_div = val + 1;
 	bit_div = byte_div / 8;
 
-	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 	val &= ~0xf;
 	val |= (bit_div - 1);
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
 
 	/* enable the PLL */
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
 			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
@@ -234,7 +234,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
+	dsi_phy_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -281,7 +281,7 @@ static unsigned long clk_bytediv_recalc_rate(struct clk_hw *hw,
 	struct clk_bytediv *bytediv = to_clk_bytediv(hw);
 	unsigned int div;
 
-	div = pll_read(bytediv->reg) & 0xff;
+	div = dsi_phy_read(bytediv->reg) & 0xff;
 
 	return parent_rate / (div + 1);
 }
@@ -327,9 +327,9 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	factor = get_vco_mul_factor(rate);
 
-	val = pll_read(bytediv->reg);
+	val = dsi_phy_read(bytediv->reg);
 	val |= (factor - 1) & 0xff;
-	pll_write(bytediv->reg, val);
+	dsi_phy_write(bytediv->reg, val);
 
 	return 0;
 }
@@ -351,11 +351,11 @@ static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *base = pll_28nm->mmio;
 
 	cached_state->postdiv3 =
-			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
+			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
 	cached_state->postdiv2 =
-			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
 	cached_state->postdiv1 =
-			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
 	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
 }
@@ -375,11 +375,11 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
 			cached_state->postdiv3);
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9,
 			cached_state->postdiv2);
-	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
+	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
 			cached_state->postdiv1);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7b219532d38e..6c863e685ea7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -237,19 +237,19 @@ static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
 	if (pll->pll_configuration.enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
 			  regs->ssc_stepsize_low);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
 			  regs->ssc_stepsize_high);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
 			  regs->ssc_div_per_low);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
 			  regs->ssc_div_per_high);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
 			  regs->ssc_adjper_low);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
 			  regs->ssc_adjper_high);
-		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
 			  SSC_EN | regs->ssc_control);
 	}
 }
@@ -269,36 +269,36 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 			vco_config_1 = 0x01;
 	}
 
-	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
 		  analog_controls_five_1);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE, 0x01);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_DSM_DIVIDER, 0x00);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE, 0xba);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_OUTDIV, 0x00);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE, 0x00);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x0a);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1, 0xc0);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x84);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x82);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1, 0x4c);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x29);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE, 0x01);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DSM_DIVIDER, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE, 0xba);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_OUTDIV, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x0a);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1, 0xc0);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x84);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x82);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1, 0x4c);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x29);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
 		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
 
 	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
-			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+			dsi_phy_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 	}
 }
 
@@ -307,15 +307,15 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->mmio;
 	struct dsi_pll_regs *reg = &pll->reg_setup;
 
-	pll_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, reg->decimal_div_start);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
-	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, reg->decimal_div_start);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -369,19 +369,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	pll_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
+	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
-	pll_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
+	dsi_phy_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
 	ndelay(250);
 }
 
@@ -389,18 +389,18 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
+	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
 
-	data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
+	data = dsi_phy_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
 		  data | BIT(5) | BIT(4));
 }
 
@@ -411,9 +411,9 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
 	 * coming out of a CX or analog rail power collapse while
 	 * ensuring that the pads maintain LP00 or LP11 state
 	 */
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
 	wmb(); /* Ensure that the reset is deasserted */
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
 	wmb(); /* Ensure that the reset is deasserted */
 }
 
@@ -427,7 +427,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 		dsi_pll_enable_pll_bias(pll_7nm->slave);
 
 	/* Start PLL */
-	pll_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
+	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
 
 	/*
 	 * ensure all PLL configurations are written prior to checking
@@ -463,7 +463,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_7nm *pll)
 {
-	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
+	dsi_phy_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -477,7 +477,7 @@ static void dsi_pll_7nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_7nm);
-	pll_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_phy_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
 	dsi_pll_disable_sub(pll_7nm);
 	if (pll_7nm->slave) {
 		dsi_pll_disable_global_clk(pll_7nm->slave);
@@ -501,13 +501,13 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
-	dec = pll_read(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
+	dec = dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
-	frac = pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
-	frac |= ((pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1) &
+	frac = dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	frac |= ((dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1) &
 		  0xff) << 8);
-	frac |= ((pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
+	frac |= ((dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
 		  0x3) << 16);
 
 	/*
@@ -559,15 +559,15 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = pll_read(pll_7nm->mmio +
+	cached->pll_out_div = dsi_phy_read(pll_7nm->mmio +
 				       REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
-	cmn_clk_cfg0 = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
 	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
 	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
 
-	cmn_clk_cfg1 = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	cmn_clk_cfg1 = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
@@ -583,18 +583,18 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	u32 val;
 	int ret;
 
-	val = pll_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = dsi_phy_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	pll_write(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	dsi_phy_write(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
 
-	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 		  cached->bit_clk_div | (cached->pix_clk_div << 4));
 
-	val = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	val = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
 	val |= cached->pll_mux;
-	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
+	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -632,7 +632,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	pll_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, (data << 2));
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, (data << 2));
 
 	return 0;
 }
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E502D33F366
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 15:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhCQOlD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 10:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbhCQOkz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6792C06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id l1so2735679lfk.10
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=si+IIguyp6aPiyg+oq4kC2Fdlw1wGuASWjlum7nkcPw=;
        b=Cx/uCZ3sjnnRxj3T72+gZcZYAKmVU8DeXJML8ZnbItDjGdmZHuRzjT6jdtgk9+9464
         wdqCq+2/IVpo8ZsqFViYaPQRY2bp8SLakNkFt3a+wwCBm7bzQOQCNqy/21tp+y84MrXl
         apjDZxCLtIW4LKxuLpLlEbPcKXt4kLRBsctun2qAGnadHicMejSPpejUoPUR03t54LbZ
         mfb18esiDFLo0dOatz4nvBrz23OAI0rjatiEWtX6QxUXtn2hoxs03etE/fMmLauXu7Ec
         E18mTwDrYchgvl0gRD2meZ7EdrwyVVcS8yNIQDnxGdz8eQ+TwzallgoWQslfx18laqrb
         C3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=si+IIguyp6aPiyg+oq4kC2Fdlw1wGuASWjlum7nkcPw=;
        b=Fa760u8izLPlDr1ctKIllaITzvd7mp3Z7oOd/WbG1PmWHtqGbZV70x2p2MTiqKUfiD
         +SG4OmLCKiaCOPQZdJyciVpG2oLMlCibDmhHP31o2N+WibI8evBFuxDomOV39zyDkCAt
         1W+W+V2KpWZGU2lsL5qXi0wIXlBXxrZbUL6JW6vXol5aOGPAjtsLJa19x2YHF8RPWgcv
         Xwr+hJjxx+SXN5x9hiZCymL3nrHU+Dh+nQNKSCQejwF/+EyK1TjmW1cwrEMr6W9liDLZ
         XAeTkJgcI0qcpZQqpbUn5DNg++2614qoOuj2SjMke5BOzfGs4L5Ian9jCQfW93Z1EDA1
         NJbA==
X-Gm-Message-State: AOAM5337LS35GwSsqbWw433kcEN3cXIqkRNBjnCK0vAM56iZU9ElMSik
        Ex81nwJCaepyVBRdpA/PLwlbAA==
X-Google-Smtp-Source: ABdhPJxszuhLALPx3K8fU1qRiO5tqijdW/GTQ77ECOGgVyEgQxjjIcGxUevTXA9+aR764+Sbieq1qg==
X-Received: by 2002:a19:7ec5:: with SMTP id z188mr2555182lfc.439.1615992053189;
        Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 11/26] drm/msm/dsi: push provided clocks handling into a generic code
Date:   Wed, 17 Mar 2021 17:40:24 +0300
Message-Id: <20210317144039.556409-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All MSM DSI PHYs provide two clocks: byte and pixel ones.
Register/unregister provided clocks from the generic place, removing
boilerplate code from all MSM DSI PHY drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 23 ++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  6 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 44 ++++---------------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 41 ++++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 36 ++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  5 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  3 +-
 9 files changed, 59 insertions(+), 171 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 33abeff16a6f..2742b18168b7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
 #include "dsi_phy.h"
@@ -670,6 +671,14 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (!match)
 		return -ENODEV;
 
+	phy->provided_clocks = devm_kzalloc(dev, sizeof(*phy->provided_clocks) +
+			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
+			       GFP_KERNEL);
+	if (!phy->provided_clocks)
+		return -ENOMEM;
+
+	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
+
 	phy->cfg = match->data;
 	phy->pdev = pdev;
 
@@ -725,6 +734,13 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     phy->provided_clocks);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		goto fail;
+	}
+
 	dsi_phy_disable_resource(phy);
 
 	platform_set_drvdata(pdev, phy);
@@ -732,6 +748,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
+	if (phy->pll) {
+		of_clk_del_provider(dev->of_node);
+		msm_dsi_pll_destroy(phy->pll);
+		phy->pll = NULL;
+	}
+
 	return ret;
 }
 
@@ -740,6 +762,7 @@ static int dsi_phy_driver_remove(struct platform_device *pdev)
 	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
 
 	if (phy && phy->pll) {
+		of_clk_del_provider(pdev->dev.of_node);
 		msm_dsi_pll_destroy(phy->pll);
 		phy->pll = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index ea1bd375b9ff..cb461c39c204 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -87,6 +87,10 @@ struct msm_dsi_dphy_timing {
 	u8 hs_halfbyte_en_ckln;
 };
 
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+#define NUM_PROVIDED_CLKS		2
+
 struct msm_dsi_phy {
 	struct platform_device *pdev;
 	void __iomem *base;
@@ -104,6 +108,8 @@ struct msm_dsi_phy {
 	bool regulator_ldo_mode;
 
 	struct msm_dsi_pll *pll;
+
+	struct clk_hw_onecell_data *provided_clocks;
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index fee080677c36..6dc1c104d2f6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -36,10 +36,6 @@
  *                                                  dsi0_pll_post_out_div_clk
  */
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 
 struct dsi_pll_regs {
@@ -113,9 +109,6 @@ struct dsi_pll_10nm {
 	struct clk_hw *pclk_mux_hw;
 	struct clk_hw *out_dsiclk_hw;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_10nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -621,10 +614,8 @@ static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
-	struct device *dev = &pll_10nm->pdev->dev;
 
 	DBG("DSI PLL%d", pll_10nm->id);
-	of_clk_del_provider(dev->of_node);
 
 	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
 	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
@@ -642,7 +633,7 @@ static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
  * state to follow the master PLL's divider/mux state. Therefore, we don't
  * require special clock ops that also configure the slave PLL registers
  */
-static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
+static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecell_data *provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
@@ -654,18 +645,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->pdev->dev;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int ret;
 
 	DBG("DSI%d", pll_10nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
 	pll_10nm->base.clk_hw.init = &vco_init;
 
@@ -717,7 +701,7 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	}
 
 	pll_10nm->byte_clk_hw = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
@@ -777,22 +761,10 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	}
 
 	pll_10nm->out_dsiclk_hw = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_10nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_10nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		goto err_dsiclk_hw;
-	}
+	provided_clocks->hws[DSI_PIXEL_PLL_CLK] = hw;
 
 	return 0;
 
-err_dsiclk_hw:
-	clk_hw_unregister_divider(pll_10nm->out_dsiclk_hw);
 err_pclk_mux_hw:
 	clk_hw_unregister_mux(pll_10nm->pclk_mux_hw);
 err_post_out_div_clk_hw:
@@ -848,7 +820,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	pll_10nm->vco_delay = 1;
 
-	ret = pll_10nm_register(pll_10nm);
+	ret = pll_10nm_register(pll_10nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index f43099ffa827..643c4a588f3c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -34,15 +34,10 @@
 #define POLL_MAX_READS			15
 #define POLL_TIMEOUT_US			1000
 
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 #define VCO_MIN_RATE			1300000000UL
 #define VCO_MAX_RATE			2600000000UL
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-
 #define DSI_PLL_DEFAULT_VCO_POSTDIV	1
 
 struct dsi_pll_input {
@@ -142,9 +137,6 @@ struct dsi_pll_14nm {
 	struct clk_hw *hws[NUM_DSI_CLOCKS_MAX];
 	u32 num_hws;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_14nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -883,11 +875,8 @@ static int dsi_pll_14nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	struct platform_device *pdev = pll_14nm->pdev;
 	int num_hws = pll_14nm->num_hws;
 
-	of_clk_del_provider(pdev->dev.of_node);
-
 	while (num_hws--)
 		clk_hw_unregister(pll_14nm->hws[num_hws]);
 }
@@ -928,7 +917,7 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 	return &pll_postdiv->hw;
 }
 
-static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
+static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecell_data *provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -940,19 +929,12 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 	};
 	struct device *dev = &pll_14nm->pdev->dev;
 	struct clk_hw **hws = pll_14nm->hws;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int num = 0;
 	int ret;
 
 	DBG("DSI%d", pll_14nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
 	pll_14nm->base.clk_hw.init = &vco_init;
 
@@ -983,7 +965,7 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 		return PTR_ERR(hw);
 
 	hws[num++] = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
 	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
@@ -1010,20 +992,10 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 		return PTR_ERR(hw);
 
 	hws[num++] = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK]	= hw;
+	provided_clocks->hws[DSI_PIXEL_PLL_CLK]	= hw;
 
 	pll_14nm->num_hws = num;
 
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_14nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_14nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1067,7 +1039,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 
 	pll_14nm->vco_delay = 1;
 
-	ret = pll_14nm_register(pll_14nm);
+	ret = pll_14nm_register(pll_14nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 353b91de7106..844ed39c984b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -31,15 +31,10 @@
 #define POLL_MAX_READS			10
 #define POLL_TIMEOUT_US		50
 
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 #define VCO_MIN_RATE			350000000
 #define VCO_MAX_RATE			750000000
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
 	unsigned long vco_rate;
@@ -80,10 +75,6 @@ struct dsi_pll_28nm {
 	struct clk *clks[NUM_DSI_CLOCKS_MAX];
 	u32 num_clks;
 
-	/* clock-provider: */
-	struct clk *provided_clks[NUM_PROVIDED_CLKS];
-	struct clk_onecell_data clk_data;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -495,20 +486,13 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-	int i;
 
-	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
-					pll_28nm->clks, pll_28nm->num_clks);
-
-	for (i = 0; i < NUM_PROVIDED_CLKS; i++)
-		pll_28nm->provided_clks[i] = NULL;
+	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, pll_28nm->num_clks);
 
 	pll_28nm->num_clks = 0;
-	pll_28nm->clk_data.clks = NULL;
-	pll_28nm->clk_data.clk_num = 0;
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks)
 {
 	char clk_name[32], parent1[32], parent2[32], vco_name[32];
 	struct clk_init_data vco_init = {
@@ -520,9 +504,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk **clks = pll_28nm->clks;
-	struct clk **provided_clks = pll_28nm->provided_clks;
 	int num = 0;
-	int ret;
 
 	DBG("%d", pll_28nm->id);
 
@@ -546,11 +528,11 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
-	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
-			clk_register_divider(dev, clk_name,
+	clks[num++] = clk_register_divider(dev, clk_name,
 				parent1, 0, pll_28nm->mmio +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
 				0, 8, 0, NULL);
+	provided_clocks->hws[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
@@ -563,22 +545,12 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 
 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
 	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
-	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
-			clk_register_fixed_factor(dev, clk_name,
+	clks[num++] = clk_register_fixed_factor(dev, clk_name,
 				parent1, CLK_SET_RATE_PARENT, 1, 4);
+	provided_clocks->hws[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	pll_28nm->num_clks = num;
 
-	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
-	pll_28nm->clk_data.clks = provided_clks;
-
-	ret = of_clk_add_provider(dev->of_node,
-			of_clk_src_onecell_get, &pll_28nm->clk_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -611,7 +583,7 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
@@ -651,7 +623,7 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 8af50c7ad2f9..33bb0167e035 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -39,15 +39,10 @@
 #define POLL_MAX_READS		8000
 #define POLL_TIMEOUT_US		1
 
-#define NUM_PROVIDED_CLKS	2
-
 #define VCO_REF_CLK_RATE	27000000
 #define VCO_MIN_RATE		600000000
 #define VCO_MAX_RATE		1200000000
 
-#define DSI_BYTE_PLL_CLK	0
-#define DSI_PIXEL_PLL_CLK	1
-
 #define VCO_PREF_DIV_RATIO	27
 
 struct pll_28nm_cached_state {
@@ -76,10 +71,6 @@ struct dsi_pll_28nm {
 	struct clk *clks[NUM_DSI_CLOCKS_MAX];
 	u32 num_clks;
 
-	/* clock-provider: */
-	struct clk *provided_clks[NUM_PROVIDED_CLKS];
-	struct clk_onecell_data clk_data;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -381,11 +372,10 @@ static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 
-	msm_dsi_pll_helper_unregister_clks(pll_28nm->pdev,
-					pll_28nm->clks, pll_28nm->num_clks);
+	msm_dsi_pll_helper_unregister_clks(pll_28nm->clks, pll_28nm->num_clks);
 }
 
-static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
+static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecell_data *provided_clocks)
 {
 	char *clk_name, *parent_name, *vco_name;
 	struct clk_init_data vco_init = {
@@ -396,10 +386,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	};
 	struct device *dev = &pll_28nm->pdev->dev;
 	struct clk **clks = pll_28nm->clks;
-	struct clk **provided_clks = pll_28nm->provided_clks;
 	struct clk_bytediv *bytediv;
 	struct clk_init_data bytediv_init = { };
-	int ret, num = 0;
+	int num = 0;
 
 	DBG("%d", pll_28nm->id);
 
@@ -411,10 +400,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	if (!vco_name)
 		return -ENOMEM;
 
-	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!parent_name)
-		return -ENOMEM;
-
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
@@ -442,29 +427,19 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	bytediv_init.num_parents = 1;
 
 	/* DIV2 */
-	clks[num++] = provided_clks[DSI_BYTE_PLL_CLK] =
-			clk_register(dev, &bytediv->hw);
+	clks[num++] = clk_register(dev, &bytediv->hw);
+	provided_clocks->hws[DSI_BYTE_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
 	/* DIV3 */
-	clks[num++] = provided_clks[DSI_PIXEL_PLL_CLK] =
-			clk_register_divider(dev, clk_name,
+	clks[num++] = clk_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->mmio +
 				REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
 				0, 8, 0, NULL);
+	provided_clocks->hws[DSI_PIXEL_PLL_CLK] = __clk_get_hw(clks[num - 1]);
 
 	pll_28nm->num_clks = num;
 
-	pll_28nm->clk_data.clk_num = NUM_PROVIDED_CLKS;
-	pll_28nm->clk_data.clks = provided_clks;
-
-	ret = of_clk_add_provider(dev->of_node,
-			of_clk_src_onecell_get, &pll_28nm->clk_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -496,7 +471,7 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 
 	pll->cfg = phy->cfg;
 
-	ret = pll_28nm_register(pll_28nm);
+	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 542526949347..02ad3879d267 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -36,10 +36,6 @@
  *                                                  dsi0_pll_post_out_div_clk
  */
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
-
 #define VCO_REF_CLK_RATE		19200000
 
 struct dsi_pll_regs {
@@ -113,9 +109,6 @@ struct dsi_pll_7nm {
 	struct clk_hw *pclk_mux_hw;
 	struct clk_hw *out_dsiclk_hw;
 
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
 	struct pll_7nm_cached_state cached_state;
 
 	enum msm_dsi_phy_usecase uc;
@@ -646,10 +639,8 @@ static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
 static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
-	struct device *dev = &pll_7nm->pdev->dev;
 
 	DBG("DSI PLL%d", pll_7nm->id);
-	of_clk_del_provider(dev->of_node);
 
 	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
 	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
@@ -667,7 +658,7 @@ static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
  * state to follow the master PLL's divider/mux state. Therefore, we don't
  * require special clock ops that also configure the slave PLL registers
  */
-static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
+static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_data *provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
@@ -679,18 +670,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 		.ops = &clk_ops_dsi_pll_7nm_vco,
 	};
 	struct device *dev = &pll_7nm->pdev->dev;
-	struct clk_hw_onecell_data *hw_data;
 	struct clk_hw *hw;
 	int ret;
 
 	DBG("DSI%d", pll_7nm->id);
 
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
 	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
 	pll_7nm->base.clk_hw.init = &vco_init;
 
@@ -742,7 +726,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	}
 
 	pll_7nm->byte_clk_hw = hw;
-	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
 	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
@@ -802,22 +786,10 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	}
 
 	pll_7nm->out_dsiclk_hw = hw;
-	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_7nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_7nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
-		goto err_dsiclk_hw;
-	}
+	provided_clocks->hws[DSI_PIXEL_PLL_CLK] = hw;
 
 	return 0;
 
-err_dsiclk_hw:
-	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
 err_pclk_mux_hw:
 	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
 err_post_out_div_clk_hw:
@@ -873,7 +845,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	pll_7nm->vco_delay = 1;
 
-	ret = pll_7nm_register(pll_7nm);
+	ret = pll_7nm_register(pll_7nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 5768e8d225fc..914e95435dcb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -57,11 +57,8 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 	pll->pll_on = false;
 }
 
-void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
-					struct clk **clks, u32 num_clks)
+void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 num_clks)
 {
-	of_clk_del_provider(pdev->dev.of_node);
-
 	if (!num_clks || !clks)
 		return;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 8306911f8318..d819a886beb8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -55,8 +55,7 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
 void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
 /* misc */
-void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
-					struct clk **clks, u32 num_clks);
+void msm_dsi_pll_helper_unregister_clks(struct clk **clks, u32 num_clks);
 
 #endif /* __DSI_PLL_H__ */
 
-- 
2.30.2


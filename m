Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7578D33F353
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 15:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhCQOk7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Mar 2021 10:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbhCQOkt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C9BC061760
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z8so3428347ljm.12
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFZVa6HGI/O88ZUgfUov8HuKEcnGrUuN40ZsgYvKZ8E=;
        b=yJKFLXylJgTiiGfat8SAUQxex0ed3xhpCjSJX6I8MTzJkaRNdABNP5U4OG6DtyeDWl
         tpnKG+YIwYVnjqDcCRCun/eInDaAPTETTeJgpv2ZLEvMH8rU3giBxbqunJhmBC64ojT9
         ugkU2sgDdhaFDelpBLSAG4CnLu4qD8Cdld516sEDIvsfxxaTha+E3VfmARmL9oWT0rzY
         hfsw9PyrV5u9fiiiqwji4Jrhq+TVYun7jxSETIPfVWySdRZS8ZBti9nxN8k9qCEaRLOQ
         GkHw0+fg0pdkWhdIdX0PH0YT5ZXHrwZBc+7N6uImrk/CQPv1lRMwLFbkkKT+Pzi5XQzo
         fLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFZVa6HGI/O88ZUgfUov8HuKEcnGrUuN40ZsgYvKZ8E=;
        b=YE1X1o26P8in41Opppo0R1eje8t/7MI8pJ0fY2F4eOx/gMamp5yLTJp2Co2uGcyCFH
         13YUWK6HlGrZB0x2zY+rvOPBxMlKGdVBpPc+UqL/ElU3+21BIp+lmMQD6v1LrwLxntmA
         4fhwRzBm25h4JGNgEcN3cqHjFKYElAsWmlDl4vQ97dyNwMMgJkiScF9VM9C5ZGIDcIlr
         taZXnuOeRGQ+OjSppf//ua4S2IIkKiyaHriTTNxzRcnWksktNZBIU6cr66VSeNKWWC4i
         IArsu+aQfjD1KZDEzH/gRMLiUG3P3WY8OkEmGGxSXrXSNJiZwnPTVgiZpRRDYF3NDhXc
         zDCA==
X-Gm-Message-State: AOAM530dg4eMauMFWhN7ROHmXIgPze0morRBo8han0w2C+uKRUWVcH9b
        7ZDHZfU32zpHVfqMbpsoNrkcBQ==
X-Google-Smtp-Source: ABdhPJySiGuT+pbOUCKCstTaMp8NlQW8BR1B63/TwzedQe8rvkiY9mZ2VVXbkbMND0pQ7RGYu/rOqw==
X-Received: by 2002:a2e:7610:: with SMTP id r16mr2664063ljc.472.1615992046724;
        Wed, 17 Mar 2021 07:40:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 05/26] drm/msm/dsi: move all PLL callbacks into PHY config struct
Date:   Wed, 17 Mar 2021 17:40:18 +0300
Message-Id: <20210317144039.556409-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move all PLL-related callbacks into struct msm_dsi_phy_cfg. This limits
the amount of data in the struct msm_dsi_pll.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                 |  6 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 14 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 15 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 38 ++++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 47 ++++++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 99 +++++++++++++++----
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 33 ++++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 48 ++++++---
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 67 +++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         | 65 +-----------
 10 files changed, 226 insertions(+), 206 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 78ef5d4ed922..21cf883fb6f1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -107,8 +107,6 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 /* dsi pll */
 struct msm_dsi_pll;
 #ifdef CONFIG_DRM_MSM_DSI_PLL
-struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
-			enum msm_dsi_phy_type type, int dsi_id);
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
 int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
@@ -117,10 +115,6 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
 			    enum msm_dsi_phy_usecase uc);
 #else
-static inline struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
-			 enum msm_dsi_phy_type type, int id) {
-	return ERR_PTR(-ENODEV);
-}
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index e8c1a727179c..33abeff16a6f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -715,12 +715,14 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	phy->pll = msm_dsi_pll_init(pdev, phy->cfg->type, phy->id);
-	if (IS_ERR_OR_NULL(phy->pll)) {
-		DRM_DEV_INFO(dev,
-			"%s: pll init failed: %ld, need separate pll clk driver\n",
-			__func__, PTR_ERR(phy->pll));
-		phy->pll = NULL;
+	if (phy->cfg->ops.pll_init) {
+		ret = phy->cfg->ops.pll_init(phy);
+		if (ret) {
+			DRM_DEV_INFO(dev,
+				"%s: pll init failed: %d, need separate pll clk driver\n",
+				__func__, ret);
+			goto fail;
+		}
 	}
 
 	dsi_phy_disable_resource(phy);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index d2bd74b6f357..45ab2f23ac5b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -18,15 +18,30 @@
 
 struct msm_dsi_phy_ops {
 	int (*init) (struct msm_dsi_phy *phy);
+	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
 			struct msm_dsi_phy_clk_request *clk_req);
 	void (*disable)(struct msm_dsi_phy *phy);
 };
 
+struct msm_dsi_pll_ops {
+	int (*enable_seq)(struct msm_dsi_pll *pll);
+	void (*disable_seq)(struct msm_dsi_pll *pll);
+	int (*get_provider)(struct msm_dsi_pll *pll,
+			struct clk **byte_clk_provider,
+			struct clk **pixel_clk_provider);
+	void (*destroy)(struct msm_dsi_pll *pll);
+	void (*save_state)(struct msm_dsi_pll *pll);
+	int (*restore_state)(struct msm_dsi_pll *pll);
+	int (*set_usecase)(struct msm_dsi_pll *pll,
+			   enum msm_dsi_phy_usecase uc);
+};
+
 struct msm_dsi_phy_cfg {
 	enum msm_dsi_phy_type type;
 	struct dsi_reg_config reg_cfg;
 	struct msm_dsi_phy_ops ops;
+	const struct msm_dsi_pll_ops pll_ops;
 
 	/*
 	 * Each cell {phy_id, pll_id} of the truth table indicates
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 535d7e2393ae..49eb1440a269 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -828,15 +828,17 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	return ret;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
+static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 {
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
 	struct dsi_pll_10nm *pll_10nm;
 	struct msm_dsi_pll *pll;
 	int ret;
 
 	pll_10nm = devm_kzalloc(&pdev->dev, sizeof(*pll_10nm), GFP_KERNEL);
 	if (!pll_10nm)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	DBG("DSI PLL%d", id);
 
@@ -847,13 +849,13 @@ struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 	pll_10nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
 	if (IS_ERR_OR_NULL(pll_10nm->phy_cmn_mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pll_10nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
 	if (IS_ERR_OR_NULL(pll_10nm->mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	spin_lock_init(&pll_10nm->postdiv_lock);
@@ -861,24 +863,22 @@ struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 	pll = &pll_10nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	pll->get_provider = dsi_pll_10nm_get_provider;
-	pll->destroy = dsi_pll_10nm_destroy;
-	pll->save_state = dsi_pll_10nm_save_state;
-	pll->restore_state = dsi_pll_10nm_restore_state;
-	pll->set_usecase = dsi_pll_10nm_set_usecase;
+	pll->cfg = phy->cfg;
 
 	pll_10nm->vco_delay = 1;
 
 	ret = pll_10nm_register(pll_10nm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
+	phy->pll = pll;
+
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_pll_save_state(pll);
 
-	return pll;
+	return 0;
 }
 
 static int dsi_phy_hw_v3_0_is_pll_on(struct msm_dsi_phy *phy)
@@ -1117,6 +1117,14 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.init = dsi_10nm_phy_init,
+		.pll_init = dsi_pll_10nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_10nm_get_provider,
+		.destroy = dsi_pll_10nm_destroy,
+		.save_state = dsi_pll_10nm_save_state,
+		.restore_state = dsi_pll_10nm_restore_state,
+		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
@@ -1135,6 +1143,14 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.enable = dsi_10nm_phy_enable,
 		.disable = dsi_10nm_phy_disable,
 		.init = dsi_10nm_phy_init,
+		.pll_init = dsi_pll_10nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_10nm_get_provider,
+		.destroy = dsi_pll_10nm_destroy,
+		.save_state = dsi_pll_10nm_save_state,
+		.restore_state = dsi_pll_10nm_restore_state,
+		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index bd73aa612e76..82e5d225d83e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1042,18 +1042,20 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm)
 	return 0;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
+static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 {
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
 	struct dsi_pll_14nm *pll_14nm;
 	struct msm_dsi_pll *pll;
 	int ret;
 
 	if (!pdev)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	pll_14nm = devm_kzalloc(&pdev->dev, sizeof(*pll_14nm), GFP_KERNEL);
 	if (!pll_14nm)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	DBG("PLL%d", id);
 
@@ -1064,13 +1066,13 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 	pll_14nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
 	if (IS_ERR_OR_NULL(pll_14nm->phy_cmn_mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pll_14nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
 	if (IS_ERR_OR_NULL(pll_14nm->mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	spin_lock_init(&pll_14nm->postdiv_lock);
@@ -1078,24 +1080,19 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 	pll = &pll_14nm->base;
 	pll->min_rate = VCO_MIN_RATE;
 	pll->max_rate = VCO_MAX_RATE;
-	pll->get_provider = dsi_pll_14nm_get_provider;
-	pll->destroy = dsi_pll_14nm_destroy;
-	pll->disable_seq = dsi_pll_14nm_disable_seq;
-	pll->save_state = dsi_pll_14nm_save_state;
-	pll->restore_state = dsi_pll_14nm_restore_state;
-	pll->set_usecase = dsi_pll_14nm_set_usecase;
+	pll->cfg = phy->cfg;
 
 	pll_14nm->vco_delay = 1;
 
-	pll->enable_seq = dsi_pll_14nm_enable_seq;
-
 	ret = pll_14nm_register(pll_14nm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return pll;
+	phy->pll = pll;
+
+	return 0;
 }
 
 static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
@@ -1245,6 +1242,16 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.init = dsi_14nm_phy_init,
+		.pll_init = dsi_pll_14nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_14nm_get_provider,
+		.destroy = dsi_pll_14nm_destroy,
+		.save_state = dsi_pll_14nm_save_state,
+		.restore_state = dsi_pll_14nm_restore_state,
+		.set_usecase = dsi_pll_14nm_set_usecase,
+		.disable_seq = dsi_pll_14nm_disable_seq,
+		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
@@ -1263,6 +1270,16 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.enable = dsi_14nm_phy_enable,
 		.disable = dsi_14nm_phy_disable,
 		.init = dsi_14nm_phy_init,
+		.pll_init = dsi_pll_14nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_14nm_get_provider,
+		.destroy = dsi_pll_14nm_destroy,
+		.save_state = dsi_pll_14nm_save_state,
+		.restore_state = dsi_pll_14nm_restore_state,
+		.set_usecase = dsi_pll_14nm_set_usecase,
+		.disable_seq = dsi_pll_14nm_disable_seq,
+		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index e92070633b5f..7330672d95c0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -597,19 +597,20 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	return 0;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
-					enum msm_dsi_phy_type type, int id)
+static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 {
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	struct msm_dsi_pll *pll;
 	int ret;
 
 	if (!pdev)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	pll_28nm = devm_kzalloc(&pdev->dev, sizeof(*pll_28nm), GFP_KERNEL);
 	if (!pll_28nm)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	pll_28nm->pdev = pdev;
 	pll_28nm->id = id;
@@ -617,38 +618,67 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
 	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
 	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pll = &pll_28nm->base;
 	pll->min_rate = VCO_MIN_RATE;
 	pll->max_rate = VCO_MAX_RATE;
-	pll->get_provider = dsi_pll_28nm_get_provider;
-	pll->destroy = dsi_pll_28nm_destroy;
-	pll->disable_seq = dsi_pll_28nm_disable_seq;
-	pll->save_state = dsi_pll_28nm_save_state;
-	pll->restore_state = dsi_pll_28nm_restore_state;
+	pll_28nm->vco_delay = 1;
 
-	if (type == MSM_DSI_PHY_28NM_HPM) {
-		pll_28nm->vco_delay = 1;
+	pll->cfg = phy->cfg;
 
-		pll->enable_seq = dsi_pll_28nm_enable_seq_hpm;
-	} else if (type == MSM_DSI_PHY_28NM_LP) {
-		pll_28nm->vco_delay = 1000;
+	ret = pll_28nm_register(pll_28nm);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		return ret;
+	}
 
-		pll->enable_seq = dsi_pll_28nm_enable_seq_lp;
-	} else {
-		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", type);
-		return ERR_PTR(-EINVAL);
+	phy->pll = pll;
+
+	return 0;
+}
+
+static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
+{
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
+	struct dsi_pll_28nm *pll_28nm;
+	struct msm_dsi_pll *pll;
+	int ret;
+
+	if (!pdev)
+		return -ENODEV;
+
+	pll_28nm = devm_kzalloc(&pdev->dev, sizeof(*pll_28nm), GFP_KERNEL);
+	if (!pll_28nm)
+		return -ENOMEM;
+
+	pll_28nm->pdev = pdev;
+	pll_28nm->id = id;
+
+	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
+	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
+		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
+		return -ENOMEM;
 	}
 
+	pll = &pll_28nm->base;
+	pll->min_rate = VCO_MIN_RATE;
+	pll->max_rate = VCO_MAX_RATE;
+	pll_28nm->vco_delay = 1000;
+
+	pll->cfg = phy->cfg;
+
 	ret = pll_28nm_register(pll_28nm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return pll;
+	phy->pll = pll;
+
+	return 0;
 }
 
 
@@ -809,6 +839,15 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.init = msm_dsi_phy_init_common,
+		.pll_init = dsi_pll_28nm_hpm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_28nm_get_provider,
+		.destroy = dsi_pll_28nm_destroy,
+		.save_state = dsi_pll_28nm_save_state,
+		.restore_state = dsi_pll_28nm_restore_state,
+		.disable_seq = dsi_pll_28nm_disable_seq,
+		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.io_start = { 0xfd922b00, 0xfd923100 },
 	.num_dsi_phy = 2,
@@ -827,6 +866,15 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.init = msm_dsi_phy_init_common,
+		.pll_init = dsi_pll_28nm_hpm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_28nm_get_provider,
+		.destroy = dsi_pll_28nm_destroy,
+		.save_state = dsi_pll_28nm_save_state,
+		.restore_state = dsi_pll_28nm_restore_state,
+		.disable_seq = dsi_pll_28nm_disable_seq,
+		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
@@ -845,6 +893,15 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.init = msm_dsi_phy_init_common,
+		.pll_init = dsi_pll_28nm_lp_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_28nm_get_provider,
+		.destroy = dsi_pll_28nm_destroy,
+		.save_state = dsi_pll_28nm_save_state,
+		.restore_state = dsi_pll_28nm_restore_state,
+		.disable_seq = dsi_pll_28nm_disable_seq,
+		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 1b9a5abc9275..d6f8b1ee868b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -483,19 +483,20 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	return 0;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
-					       int id)
+static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 {
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	struct msm_dsi_pll *pll;
 	int ret;
 
 	if (!pdev)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	pll_28nm = devm_kzalloc(&pdev->dev, sizeof(*pll_28nm), GFP_KERNEL);
 	if (!pll_28nm)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	pll_28nm->pdev = pdev;
 	pll_28nm->id = id + 1;
@@ -503,27 +504,24 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
 	pll_28nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
 	if (IS_ERR_OR_NULL(pll_28nm->mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pll = &pll_28nm->base;
 	pll->min_rate = VCO_MIN_RATE;
 	pll->max_rate = VCO_MAX_RATE;
-	pll->get_provider = dsi_pll_28nm_get_provider;
-	pll->destroy = dsi_pll_28nm_destroy;
-	pll->disable_seq = dsi_pll_28nm_disable_seq;
-	pll->save_state = dsi_pll_28nm_save_state;
-	pll->restore_state = dsi_pll_28nm_restore_state;
 
-	pll->enable_seq = dsi_pll_28nm_enable_seq;
+	pll->cfg = phy->cfg;
 
 	ret = pll_28nm_register(pll_28nm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	return pll;
+	phy->pll = pll;
+
+	return 0;
 }
 
 static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
@@ -704,6 +702,15 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.enable = dsi_28nm_phy_enable,
 		.disable = dsi_28nm_phy_disable,
 		.init = msm_dsi_phy_init_common,
+		.pll_init = dsi_pll_28nm_8960_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_28nm_get_provider,
+		.destroy = dsi_pll_28nm_destroy,
+		.save_state = dsi_pll_28nm_save_state,
+		.restore_state = dsi_pll_28nm_restore_state,
+		.disable_seq = dsi_pll_28nm_disable_seq,
+		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
 	.io_start = { 0x4700300, 0x5800300 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e85de26744b7..e12f2f7a54ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -178,7 +178,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
 
 	dec = div_u64(dec_multiple, multiplier);
 
-	if (pll->base.type != MSM_DSI_PHY_7NM_V4_1)
+	if (pll->base.cfg->type != MSM_DSI_PHY_7NM_V4_1)
 		regs->pll_clock_inverters = 0x28;
 	else if (pll_freq <= 1000000000ULL)
 		regs->pll_clock_inverters = 0xa0;
@@ -273,7 +273,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->mmio;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (pll->base.type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -307,9 +307,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  pll->base.type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
+		  pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
 
-	if (pll->base.type == MSM_DSI_PHY_7NM_V4_1) {
+	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
 		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
 		if (pll->slave)
 			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
@@ -853,15 +853,17 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	return ret;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 {
+	struct platform_device *pdev = phy->pdev;
+	int id = phy->id;
 	struct dsi_pll_7nm *pll_7nm;
 	struct msm_dsi_pll *pll;
 	int ret;
 
 	pll_7nm = devm_kzalloc(&pdev->dev, sizeof(*pll_7nm), GFP_KERNEL);
 	if (!pll_7nm)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	DBG("DSI PLL%d", id);
 
@@ -872,13 +874,13 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll_7nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
 	if (IS_ERR_OR_NULL(pll_7nm->phy_cmn_mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pll_7nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
 	if (IS_ERR_OR_NULL(pll_7nm->mmio)) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
@@ -886,30 +888,28 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll = &pll_7nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
 		pll->min_rate = 600000000UL;
 		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
 		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
 	}
-	pll->get_provider = dsi_pll_7nm_get_provider;
-	pll->destroy = dsi_pll_7nm_destroy;
-	pll->save_state = dsi_pll_7nm_save_state;
-	pll->restore_state = dsi_pll_7nm_restore_state;
-	pll->set_usecase = dsi_pll_7nm_set_usecase;
+	pll->cfg = phy->cfg;
 
 	pll_7nm->vco_delay = 1;
 
 	ret = pll_7nm_register(pll_7nm);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
+	phy->pll = pll;
+
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_pll_save_state(pll);
 
-	return pll;
+	return 0;
 }
 
 static int dsi_phy_hw_v4_0_is_pll_on(struct msm_dsi_phy *phy)
@@ -1156,6 +1156,14 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.init = dsi_7nm_phy_init,
+		.pll_init = dsi_pll_7nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_7nm_get_provider,
+		.destroy = dsi_pll_7nm_destroy,
+		.save_state = dsi_pll_7nm_save_state,
+		.restore_state = dsi_pll_7nm_restore_state,
+		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
@@ -1174,6 +1182,14 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.enable = dsi_7nm_phy_enable,
 		.disable = dsi_7nm_phy_disable,
 		.init = dsi_7nm_phy_init,
+		.pll_init = dsi_pll_7nm_init,
+	},
+	.pll_ops = {
+		.get_provider = dsi_pll_7nm_get_provider,
+		.destroy = dsi_pll_7nm_destroy,
+		.save_state = dsi_pll_7nm_save_state,
+		.restore_state = dsi_pll_7nm_restore_state,
+		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index b409ae2874b4..c7ff0eba0e8b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
  */
 
+#include "dsi_phy.h"
 #include "dsi_pll.h"
 
 /*
@@ -33,7 +34,7 @@ int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
 	if (unlikely(pll->pll_on))
 		return 0;
 
-	ret = pll->enable_seq(pll);
+	ret = pll->cfg->pll_ops.enable_seq(pll);
 	if (ret) {
 		DRM_ERROR("DSI PLL failed to lock\n");
 		return ret;
@@ -51,7 +52,7 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll->pll_on))
 		return;
 
-	pll->disable_seq(pll);
+	pll->cfg->pll_ops.disable_seq(pll);
 
 	pll->pll_on = false;
 }
@@ -76,8 +77,8 @@ void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
 int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
 {
-	if (pll->get_provider)
-		return pll->get_provider(pll,
+	if (pll->cfg->pll_ops.get_provider)
+		return pll->cfg->pll_ops.get_provider(pll,
 					byte_clk_provider,
 					pixel_clk_provider);
 
@@ -86,14 +87,14 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
-	if (pll->destroy)
-		pll->destroy(pll);
+	if (pll->cfg->pll_ops.destroy)
+		pll->cfg->pll_ops.destroy(pll);
 }
 
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
 {
-	if (pll->save_state) {
-		pll->save_state(pll);
+	if (pll->cfg->pll_ops.save_state) {
+		pll->cfg->pll_ops.save_state(pll);
 		pll->state_saved = true;
 	}
 }
@@ -102,8 +103,8 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 {
 	int ret;
 
-	if (pll->restore_state && pll->state_saved) {
-		ret = pll->restore_state(pll);
+	if (pll->cfg->pll_ops.restore_state && pll->state_saved) {
+		ret = pll->cfg->pll_ops.restore_state(pll);
 		if (ret)
 			return ret;
 
@@ -116,50 +117,8 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
 			    enum msm_dsi_phy_usecase uc)
 {
-	if (pll->set_usecase)
-		return pll->set_usecase(pll, uc);
+	if (pll->cfg->pll_ops.set_usecase)
+		return pll->cfg->pll_ops.set_usecase(pll, uc);
 
 	return 0;
 }
-
-struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
-			enum msm_dsi_phy_type type, int id)
-{
-	struct device *dev = &pdev->dev;
-	struct msm_dsi_pll *pll;
-
-	switch (type) {
-	case MSM_DSI_PHY_28NM_HPM:
-	case MSM_DSI_PHY_28NM_LP:
-		pll = msm_dsi_pll_28nm_init(pdev, type, id);
-		break;
-	case MSM_DSI_PHY_28NM_8960:
-		pll = msm_dsi_pll_28nm_8960_init(pdev, id);
-		break;
-	case MSM_DSI_PHY_14NM:
-		pll = msm_dsi_pll_14nm_init(pdev, id);
-		break;
-	case MSM_DSI_PHY_10NM:
-		pll = msm_dsi_pll_10nm_init(pdev, id);
-		break;
-	case MSM_DSI_PHY_7NM:
-	case MSM_DSI_PHY_7NM_V4_1:
-		pll = msm_dsi_pll_7nm_init(pdev, id);
-		break;
-	default:
-		pll = ERR_PTR(-ENXIO);
-		break;
-	}
-
-	if (IS_ERR(pll)) {
-		DRM_DEV_ERROR(dev, "%s: failed to init DSI PLL\n", __func__);
-		return pll;
-	}
-
-	pll->type = type;
-
-	DBG("DSI:%d PLL registered", id);
-
-	return pll;
-}
-
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 3eedb79d8939..4fa73fbcba52 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -14,8 +14,6 @@
 #define NUM_DSI_CLOCKS_MAX	6
 
 struct msm_dsi_pll {
-	enum msm_dsi_phy_type type;
-
 	struct clk_hw	clk_hw;
 	bool		pll_on;
 	bool		state_saved;
@@ -23,16 +21,7 @@ struct msm_dsi_pll {
 	unsigned long	min_rate;
 	unsigned long	max_rate;
 
-	int (*enable_seq)(struct msm_dsi_pll *pll);
-	void (*disable_seq)(struct msm_dsi_pll *pll);
-	int (*get_provider)(struct msm_dsi_pll *pll,
-			struct clk **byte_clk_provider,
-			struct clk **pixel_clk_provider);
-	void (*destroy)(struct msm_dsi_pll *pll);
-	void (*save_state)(struct msm_dsi_pll *pll);
-	int (*restore_state)(struct msm_dsi_pll *pll);
-	int (*set_usecase)(struct msm_dsi_pll *pll,
-			   enum msm_dsi_phy_usecase uc);
+	const struct msm_dsi_phy_cfg *cfg;
 };
 
 #define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
@@ -72,57 +61,5 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
 void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
 					struct clk **clks, u32 num_clks);
 
-/*
- * Initialization for Each PLL Type
- */
-#ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
-					enum msm_dsi_phy_type type, int id);
-#else
-static inline struct msm_dsi_pll *msm_dsi_pll_28nm_init(
-	struct platform_device *pdev, enum msm_dsi_phy_type type, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_28NM_8960_PHY
-struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
-					       int id);
-#else
-static inline struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(
-	struct platform_device *pdev, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-
-#ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id);
-#else
-static inline struct msm_dsi_pll *
-msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id);
-#else
-static inline struct msm_dsi_pll *
-msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-#ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
-#else
-static inline struct msm_dsi_pll *
-msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-
 #endif /* __DSI_PLL_H__ */
 
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8328246DA72
	for <lists+linux-clk@lfdr.de>; Wed,  8 Dec 2021 18:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbhLHR6I (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Dec 2021 12:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhLHR6H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 12:58:07 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DAFC0617A1
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 09:54:35 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id k37so7172399lfv.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7m+tTe4kWyfkdnMQJxlDuyTu4Xp4TYvidxjiUA9rInY=;
        b=gqJGHMSRNI/yeGmt7MUZ2uXo2PqmVMu+QPanttUBdXQ+QjHsigPFHKjtbfsotRZRr3
         9Z2itZWMc8dTABol4pbRNuoZCCPCV7CSKfRnogO1aGxg21SC6G3A17KGWOKUE2mtFoRk
         BVCd5XGq+QGlYHkXsRl7TUbfhJ2p8uuvaZ6DMRjzJTXE1GR9dqiX51V6Lfbuya95TTYp
         XRPGBOD1e1VEE+ggKr+i7DjVElHM84fkj+MvMLiW2Q8MxIJ9ujzWmuA4rgsXdxyinCaW
         rZ9H/LMtCE3uoiX1klLpxzljHWue/qM1nuZnHub2I4T0rLqj2Qf/KiEZPeOS59acs/F/
         WWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7m+tTe4kWyfkdnMQJxlDuyTu4Xp4TYvidxjiUA9rInY=;
        b=Ps/61r2y53kENn4frmMv3bwQ9ZM7qLuM4Uxd+AYIxVpk3UlledNsp2KZIhb+sGDrVS
         cRGENQ8d1UncaUhe9zNgTXV7Bz+Z2la/dw362I7DKnxRkzCa8WD8bo1ggOhLn6Czca80
         UtE6aXzxV0LxiLqgGKswN1nxfAChm1IjeeFJlh1Ki/6XsysyBHe1TKzeZNmtbQoH3omz
         f0jlOGvtOaHOE2yq0LdjIeABGwTX2ok37iIjjYXg8qNxNXE5cMVAF3USSYaAMokBjWd0
         4So3XwOD3ZovWnfYK5tsYcRfwnMhX22hrUnaS9R1iPzoLdno8ZSxjH9lOatCyetUCnro
         7nmw==
X-Gm-Message-State: AOAM531e+YO3Lr93t75EZ4gMxjA/YfogxPlj4yKLeu0xaPIq/1kB30oY
        Shkj+uhbY32N44LrTKp3brx5UQ==
X-Google-Smtp-Source: ABdhPJxbvRAd/kALkdmGJJr8IdJE0Aw7A8z2OMUzzbk+HeMlW3H3CP5bTfIusWpnD2NsSYYRcfWPQg==
X-Received: by 2002:a05:6512:6d3:: with SMTP id u19mr853106lff.453.1638986073862;
        Wed, 08 Dec 2021 09:54:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 02/11] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
Date:   Wed,  8 Dec 2021 20:54:21 +0300
Message-Id: <20211208175430.1333594-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 26e17f349a77..27a506a78a25 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -65,8 +65,8 @@ static struct clk_alpha_pll gpu_pll0_pll_out_main = {
 	.num_vco = ARRAY_SIZE(gpu_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_pll0_pll_out_main",
-		.parent_data =  &(const struct clk_parent_data){
-			.hw = &gpucc_cxo_clk.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpucc_cxo_clk.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
@@ -80,8 +80,8 @@ static struct clk_alpha_pll gpu_pll1_pll_out_main = {
 	.num_vco = ARRAY_SIZE(gpu_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_pll1_pll_out_main",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpucc_cxo_clk.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpucc_cxo_clk.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
@@ -134,8 +134,8 @@ static struct clk_branch gpucc_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gfx3d_clk_src.rcg.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
-- 
2.33.0


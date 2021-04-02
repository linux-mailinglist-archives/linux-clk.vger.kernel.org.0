Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D2D352579
	for <lists+linux-clk@lfdr.de>; Fri,  2 Apr 2021 04:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhDBCV2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Apr 2021 22:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbhDBCV1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD5DC0613E6
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d12so5624735lfv.11
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oD24D/NHNTgtv3QYd7/t2oeh57K22Anyb+KS67fLkXQ=;
        b=vQjAiLg3FR6Gc6m8qomo4wl6pgJxaaaLYAcFThz7c93SnB14wEmgujbnlwl8ZY0KTC
         AOcR5wWWV0mbh44+zCMzpC9ioaI04EpeOjxZmXpp7jeQ1GW2TB27G2g1/4J6s7bdMzt2
         MsqIuTGjfCrdt3BpWm8B3cFPD1vDnpAojr5XpKCgegVsQ9F9VhgcMNz/XJANhbZWWSo5
         Ccg5ijyeVjuXWLQe85a03sFVXFTuCO6xPv/pzyblF364LCVC2R+P9BdCL/FYZD8vnOx1
         p8pDlCBKSnba97GU1Xxh2/lWG8BrFY+/geYKSFihthmw4RScYHtM9tBlSpVXmypZJ8Su
         Ve+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oD24D/NHNTgtv3QYd7/t2oeh57K22Anyb+KS67fLkXQ=;
        b=ucfHRjtnGUGW+fTs96S7teAiAj88jvNpq1bLs/z2icXRqaNip5zny1ZqD9oNJPhX/E
         +HcuqRJmx5z516lxfTF+/0jW49dpg54OjpS6K2G0A3IGPvwRl02UWMbueRiNDZsVyILi
         am4RH+PmiSHeeGDT0hW6F5EWSyBVj70IgBft7+VUbo/5ruNyLt9zXtwRg3pCvUW8nrKL
         Gk6tAFiuP6X4JOWzILCREjuicF/45V1yyd5zczg2LZ7S1I/mrrNCgAcLRq737bvDFQEr
         aI4RguYr5gjrxbBul7cjMsViI2lJguT7ppnnxLplIuK8HaSci23dr/DrwEEgNpkklN0Z
         gAuQ==
X-Gm-Message-State: AOAM533yZX2RkNNNRXOSkudvU/syJl0YJKf1JNXlYcNI8+K8irMAefsO
        31BMrMusMXDOYD0afhDkVHQ9ig==
X-Google-Smtp-Source: ABdhPJxA6UPfshOAbvjDVsfFNIqckHnc117QmDRdInGqNZmJCBmbt4IE+jXXWkhfXUe6K3MwR80A1w==
X-Received: by 2002:a05:6512:21cb:: with SMTP id d11mr7096045lft.177.1617330079889;
        Thu, 01 Apr 2021 19:21:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 12/16] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 05:21:04 +0300
Message-Id: <20210402022108.4183114-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 2d7dc89915e8..44039fd2abf2 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -33,22 +33,6 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static const struct parent_map gpu_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
-	{ P_GPLL0_OUT_MAIN, 5 },
-	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gpu_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"gpu_cc_pll1",
-	"gcc_gpu_gpll0_clk_src",
-	"gcc_gpu_gpll0_div_clk_src",
-	"core_bi_pll_test_se",
-};
-
 static const struct alpha_pll_config gpu_cc_pll1_config = {
 	.l = 0x1a,
 	.alpha = 0xaab,
@@ -60,13 +44,31 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
 	},
 };
 
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
@@ -82,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
+		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -96,8 +98,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_names = (const char *[]){
-				"gpu_cc_gmu_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2


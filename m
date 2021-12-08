Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78C546DA7A
	for <lists+linux-clk@lfdr.de>; Wed,  8 Dec 2021 18:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238359AbhLHR6M (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Dec 2021 12:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbhLHR6L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 12:58:11 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A353C061A32
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 09:54:39 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id i63so5109626lji.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZknelNYUkKtTFQI9CFhDrijN+jLDM52OQLog0Ixm6p0=;
        b=GjB10mQQt2bxba17GfuWuIXZH8BRRIGXT2cUphUq7aP7AFoywNLgBBCztUhW6bEtUL
         aKpMQFfFfAhVFizBbYli1/2xncDBYS3NoXIj1tVMBxlXUiYaZ83LlO5/djau+PS6bVpJ
         HNVFrDqBfXnH21Rdqx5hH9pdCJsHawxLcKcK32wWr++6gz0HiHeV5+qMVAw8sANKe4EU
         pfEnuDN3vSivb5cUE5ibOBsbwIn7weLmwLKuy+j3fwcgfJf9OhNmf5oL/qPnDGJhdrLR
         F1i5k/3526EtAz/X3FFQn/lPe2Z6JyLcRqAffQG3da5Snm2bZ7AsIpTSlzHl/Ca0CnYV
         sXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZknelNYUkKtTFQI9CFhDrijN+jLDM52OQLog0Ixm6p0=;
        b=4EGXjB85DDd56t7Ehu7Z40c2LULIKssvnu2Um9ROxerbYhgB9bxy6c6IH8lxI9vZTO
         OGu/huCEaqMB8dzyAq4DMaydfLJFX6szYplydsoAtCEu8pghteHcd3RZpuMofUgtpysj
         yJIFTG2+l9JwYBL+PAECBjg3iptfuwMT+KtiibgxTJ+ywUmERvUN0aUE6si3tsOThHpX
         00MUV8Qisc5xNmKvA5P0Po8vK+yLUaG9IMDlsXVNq2PmADs6jG23Mv9i1jVoy981BRHT
         4onl8H2SRlI3ddwxyDTbSR432vr6lfxalLZvDaxIyXH3h0bn4Nr92HUDUm2q20mzP8vL
         d+uA==
X-Gm-Message-State: AOAM532yay4grzmuxT9Xol/GfFfjfHPVj/jY47Prg5wkKYiCQfpkIqI8
        2PnHoxm0xsucN/Zyqul54JoxNQ==
X-Google-Smtp-Source: ABdhPJze3hXP9zsstpA3qxBtkZ/yjHaLIivU4D/9OJWB4VuXoQVrZJOOMoFenwZigNtkmgh2NLjy1A==
X-Received: by 2002:a2e:e09:: with SMTP id 9mr944300ljo.172.1638986077130;
        Wed, 08 Dec 2021 09:54:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 05/11] clk: qcom: camcc-sdm845: convert to parent data
Date:   Wed,  8 Dec 2021 20:54:24 +0300
Message-Id: <20211208175430.1333594-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/camcc-sdm845.c | 320 +++++++++++++++++---------------
 1 file changed, 168 insertions(+), 152 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 545c288a7f98..be3f95326965 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -25,29 +25,15 @@ enum {
 	P_CAM_CC_PLL3_OUT_EVEN,
 };
 
-static const struct parent_map cam_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
-	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
-	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
-	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-};
-
-static const char * const cam_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"cam_cc_pll2_out_even",
-	"cam_cc_pll1_out_even",
-	"cam_cc_pll3_out_even",
-	"cam_cc_pll0_out_even",
-};
-
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll0",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -69,7 +55,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll0_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -81,7 +69,9 @@ static struct clk_alpha_pll cam_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll1",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -97,7 +87,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll1_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll1" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -109,7 +101,9 @@ static struct clk_alpha_pll cam_cc_pll2 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll2",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -125,7 +119,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll2" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -137,7 +133,9 @@ static struct clk_alpha_pll cam_cc_pll3 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll3",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -153,12 +151,30 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll3_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll3" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
 
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
@@ -186,8 +202,8 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -209,8 +225,8 @@ static struct clk_rcg2 cam_cc_cci_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cci_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -229,8 +245,8 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -250,8 +266,8 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -265,8 +281,8 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -280,8 +296,8 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -295,8 +311,8 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -320,8 +336,8 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -343,8 +359,8 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fd_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fd_core_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -366,8 +382,8 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.freq_tbl = ftbl_cam_cc_icp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -390,8 +406,8 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -413,8 +429,8 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -427,8 +443,8 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -442,8 +458,8 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -456,8 +472,8 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -471,8 +487,8 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -496,8 +512,8 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -511,8 +527,8 @@ static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -526,8 +542,8 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -551,8 +567,8 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.freq_tbl = ftbl_cam_cc_lrme_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -574,8 +590,8 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -589,8 +605,8 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -604,8 +620,8 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -619,8 +635,8 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -643,8 +659,8 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -658,8 +674,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -676,8 +692,8 @@ static struct clk_branch cam_cc_bps_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -707,8 +723,8 @@ static struct clk_branch cam_cc_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_bps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -751,8 +767,8 @@ static struct clk_branch cam_cc_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cci_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cci_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -769,8 +785,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cpas_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -787,8 +803,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi0phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi0phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -805,8 +821,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi1phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi1phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -823,8 +839,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi2phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi2phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -841,8 +857,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi3phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi3phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -859,8 +875,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -877,8 +893,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -895,8 +911,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy2_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -913,8 +929,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy3_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -931,8 +947,8 @@ static struct clk_branch cam_cc_fd_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_fd_core_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fd_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fd_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -949,8 +965,8 @@ static struct clk_branch cam_cc_fd_core_uar_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_fd_core_uar_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fd_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fd_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -992,8 +1008,8 @@ static struct clk_branch cam_cc_icp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_icp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_icp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_icp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1049,8 +1065,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1067,8 +1083,8 @@ static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1085,8 +1101,8 @@ static struct clk_branch cam_cc_ife_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1103,8 +1119,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_dsp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1133,8 +1149,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1151,8 +1167,8 @@ static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1169,8 +1185,8 @@ static struct clk_branch cam_cc_ife_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1187,8 +1203,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_dsp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1204,8 +1220,8 @@ static struct clk_branch cam_cc_ife_lite_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_lite_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1222,8 +1238,8 @@ static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1240,8 +1256,8 @@ static struct clk_branch cam_cc_ife_lite_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_lite_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1258,8 +1274,8 @@ static struct clk_branch cam_cc_ipe_0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1276,8 +1292,8 @@ static struct clk_branch cam_cc_ipe_0_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1307,8 +1323,8 @@ static struct clk_branch cam_cc_ipe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ipe_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ipe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1325,8 +1341,8 @@ static struct clk_branch cam_cc_ipe_1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1343,8 +1359,8 @@ static struct clk_branch cam_cc_ipe_1_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1374,8 +1390,8 @@ static struct clk_branch cam_cc_ipe_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ipe_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ipe_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1392,8 +1408,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_jpeg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_jpeg_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_jpeg_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1410,8 +1426,8 @@ static struct clk_branch cam_cc_lrme_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_lrme_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_lrme_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_lrme_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1428,8 +1444,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1446,8 +1462,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1464,8 +1480,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk2_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1482,8 +1498,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk3_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0


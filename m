Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9839F3D19ED
	for <lists+linux-clk@lfdr.de>; Thu, 22 Jul 2021 00:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhGUWHT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 21 Jul 2021 18:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhGUWHT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jul 2021 18:07:19 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C01FC061575
        for <linux-clk@vger.kernel.org>; Wed, 21 Jul 2021 15:47:54 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id b18-20020a0568303112b02904cf73f54f4bso598925ots.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Jul 2021 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y/tOk8U0jrASAGEK+93nkWtyMESJk9ZYst/jFkgGIMQ=;
        b=Ea62cusS2TrJJCKaUzdjeybGkwYhB84LN6BztgQ5ZTLJ7x9mRKkBLUZsdwZf9wII3o
         4lPTt3HpAD/g9XHkxOQm4ngLZ3SYU+CC1/7NvtBAgdtS2Ba0SYYrjItBTshttnVIQWQK
         6yPQEegfK3M77RIjQOy7C/Asvgg1HXutBRbY8TY5RKKtTAxU+00b4FSK8lON6ZA1cBwV
         GIk0/8ctcS1XvHkVsrmzzDEsF5ytihPns9ug1odnQScyGNIKh8nA/aeoZ/vLL2hPQhH5
         gblBO9m1EpTaUgtIdZBuCv5n9eEgT8LU0Dwb0RygTuCyBBIW9rpERhSbSyRwdtY6K2ar
         pr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y/tOk8U0jrASAGEK+93nkWtyMESJk9ZYst/jFkgGIMQ=;
        b=ocH34qGZ6dqJZsjy7ONdkKnF93eUC0aI0gIhOJLF1TrUFwZPUhifWyR58mAatBjad3
         Bkg/cVw8feSVk+GYYrNJeK+5M4dCXrTCW/oCjiD8i+y1Yo7bER/l5JjGWOYAG8KkGVkQ
         ov9Zqd56NfyQvOC6zm/tGZyo8NM+GapEnkX+DXJKacVf48tlx4eHRbUa3XJUoNAqfsJh
         rIz9vRx3hD4HiKYSASowZjeytFpMVBx+jujBthPT5V5A4rJAxibY4TDFsOhAc2fU5NRb
         uGaxdYMPKXB/rGoeik0nDd3TMDb5d+GwUpqz/pUsOG9YX2wZaW7dQ9yk5Elc6eXawjBA
         uutw==
X-Gm-Message-State: AOAM531/wBYjBJGFsC68uMVCDhxiMSBV7keUzskAbOGPwfxsa7cdJZdb
        sQiRbep71If4B2gPy1IwvVQpFg==
X-Google-Smtp-Source: ABdhPJwSpsIM+rEO3X4EUjzCyZXWQwxq1piIX/oVkzZ9lBngmsF5xYfccCPRFMH9QGAn+rSV97wYJw==
X-Received: by 2002:a05:6830:1c2f:: with SMTP id f15mr17380471ote.23.1626907673472;
        Wed, 21 Jul 2021 15:47:53 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16sm4707720oom.44.2021.07.21.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 15:47:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm8250: Add additional parent clocks for DP
Date:   Wed, 21 Jul 2021 15:46:10 -0700
Message-Id: <20210721224610.3035258-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock controller has two additional clock source pairs, in order to
support more than a single DisplayPort PHY. List these, so it's possible
to describe them all.

Also drop the unnecessary freq_tbl for the link clock sources, to allow
these parents to be used.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 601c7c0ba483..bf9ffe1a1cf4 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -26,6 +26,10 @@ enum {
 	P_DISP_CC_PLL1_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
 	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_DPTX1_PHY_PLL_LINK_CLK,
+	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
+	P_DPTX2_PHY_PLL_LINK_CLK,
+	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
 	P_EDP_PHY_PLL_LINK_CLK,
 	P_EDP_PHY_PLL_VCO_DIV_CLK,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
@@ -98,12 +102,20 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP_PHY_PLL_LINK_CLK, 1 },
 	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DPTX1_PHY_PLL_LINK_CLK, 3 },
+	{ P_DPTX1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DPTX2_PHY_PLL_LINK_CLK, 5 },
+	{ P_DPTX2_PHY_PLL_VCO_DIV_CLK, 6 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dp_phy_pll_link_clk" },
 	{ .fw_name = "dp_phy_pll_vco_div_clk" },
+	{ .fw_name = "dptx1_phy_pll_link_clk" },
+	{ .fw_name = "dptx1_phy_pll_vco_div_clk" },
+	{ .fw_name = "dptx2_phy_pll_link_clk" },
+	{ .fw_name = "dptx2_phy_pll_vco_div_clk" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -269,20 +281,11 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] = {
-	F(162000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
 	.cmd_rcgr = 0x220c,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
@@ -296,7 +299,6 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-- 
2.29.2


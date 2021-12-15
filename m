Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027204761F6
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 20:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhLOThg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 14:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOThf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 14:37:35 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C3AC061401
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:34 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id b19so33119306ljr.12
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ED+CvZZdmTnzliZC6CUsqBsJW1sq3Ne4IvgOnWZDhLA=;
        b=ZW8BJ3OxVYAJKE0pwFAlSs/GIyo6ypWidQ+8z24WIJJsAvp2m9GoaKT16P2ab2UR7t
         nkzKp/q3Rjz60aL9tAq61HCiNNty7WqvZAOTqnaN/sQZCQjE1iIVWHBzIAWDE/X4RAvO
         Wa333qo1CXEt4zaSB+aELfU0UxfnTVl8NFheRtCi6pGpeKPzZA96OBfKM1lEQXpoOCoB
         hMpw7zmhE5a+3v04WgGgTOZUwUma+ZT1vmrhkBOXN0Lx0mC1wgntk+H6rogdb86wRVRk
         1xa1/dxcx9mMaPl1gS8qx1/Q33uYZ0XB60ByLaSYLjm2cPYHmXzxYRWhZNvMmz4gViY+
         IfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ED+CvZZdmTnzliZC6CUsqBsJW1sq3Ne4IvgOnWZDhLA=;
        b=5xZ/dd4WyxUnXmIZCSe4zU9Xl8uEX5dPGMLv5UpDTPisgVbVMEiWO7rxefNFkbla5H
         f6petR2RcGt/S0VhWjy/fJU17fSzfdygR/fYkBK51HFQyTLpd3lJOzxwFUtT8SQImTop
         6f/rTI0nfKk+YAq67YTKIz3YQ2tfixFLKSsTvz0pTUVMQj6hEF8r6nVG22kU3s5x4rDU
         uAjA16ioMOCBUWw24HMZlVs/7rYpa1CqNq9cCSQOqMyL+hnKgFQ8fF/Gbv+hFFUjZArz
         TYPz+7shRNxauMGbd6OO60XZ1Vo6LxHFb7hi2OrrZGFAbSJGzLM5o/QnbGVytRsbG3B5
         TKxw==
X-Gm-Message-State: AOAM533KGtZcBkmzV37jQTq4sA45aQnu6bfopkGnzWIW7INtDGFPepIg
        NFesLjrsPlZlZWQDIo7LNFpBuXDB9YVI8FzL
X-Google-Smtp-Source: ABdhPJzqVfcFG7u431vmgXnWeciKV9pImYGNaFtv1WvIy6yeHmG0ru15q3J+Zv/Aj60aIyw3Zq8asQ==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr11625290ljn.72.1639597052825;
        Wed, 15 Dec 2021 11:37:32 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 16/16] clk: qcom: gcc-msm8996: start getting rid of xo clk
Date:   Wed, 15 Dec 2021 22:37:04 +0300
Message-Id: <20211215193704.2821775-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The "xo" fixed_factor clock is a leftover/hack from a time when we
couldn't make rpmhcc the root of all clocks. It is going to be removed
once all users of this clock are converted to use clocks specified
through the DTS. Replace internal usage of the xo clock with the cxo
(RPM_SMD_BB_CLK1) parent, specifying xo_board as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 204c1f4c68c4..8da5ad2ad563 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -54,8 +54,8 @@ static struct clk_alpha_pll gpll0_early = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_early",
-			.parent_hws = (const struct clk_hw*[]){
-				&xo.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo", .name = "xo_board",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -131,8 +131,8 @@ static struct clk_alpha_pll gpll4_early = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_early",
-			.parent_hws = (const struct clk_hw*[]){
-				&xo.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo", .name = "xo_board",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -167,7 +167,7 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw }
 };
 
@@ -177,7 +177,7 @@ static const struct parent_map gcc_xo_sleep_clk_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_sleep_clk[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" }
 };
 
@@ -188,7 +188,7 @@ static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_early_div.hw }
 };
@@ -200,7 +200,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw }
 };
@@ -212,7 +212,7 @@ static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_aud_ref_clk[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" }
 };
@@ -225,7 +225,7 @@ static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_early_div.hw }
@@ -239,7 +239,7 @@ static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
 };
 
 static const struct clk_parent_data gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
-	{ .hw = &xo.hw },
+	{ .fw_name = "cxo", .name = "xo_board" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_early_div.hw }
-- 
2.33.0


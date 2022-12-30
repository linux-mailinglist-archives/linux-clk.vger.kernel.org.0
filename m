Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6116585FD
	for <lists+linux-clk@lfdr.de>; Wed, 28 Dec 2022 19:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbiL1Sw4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Dec 2022 13:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbiL1Swv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:51 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED2416588
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:49 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id i19so4394976ljg.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVX8yY/UWuCJj4kUbeEr6PivKhM30gbBjbhgDlyDL0c=;
        b=gcBSPutzpcGb7hDE8reraZLgvYi3gCZndZ0nrqIIRsGWziYWZzop9uW+twO29dOPs3
         GPSU1eX5tMD/BFflemsfuJ9aWn4QUP8kSzigZR1TbKiLnuJE2LUav4koDnAt7iLan4O2
         aMZfvGY2QLAkQ7pzqm4hCfunBwAPFadsJMjCYj+DqKyQlBiMao5vI73Ne+R7RyTBjHAV
         bGPV9z5lIXjs5Cc0zIysIJsakbldRKKZxS0jdoHRm3VbjpTka0avH3ZqljW0KAbL0Jpa
         LCWxlNwBHyhn/mjWVqnX3zyKR8zI4APmWpj4j99tWgJbgac/Yvj8/kYW/btbhk/d00qW
         zg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVX8yY/UWuCJj4kUbeEr6PivKhM30gbBjbhgDlyDL0c=;
        b=tTlZpgHkRxapg3fLqnB4hD6P+wB6N4iI9mt126z6a9zmdQ8jsdSQGP8Up5R/D+jHBa
         jIUpsxEK8l8rLmqr3F5dxRqsPzzIqh9mbmZLfi9/4qzc3u5CnRaxipkBJ6ReKuay19d4
         f9UFTdqircrcvAnjWQiDKRy+t07PKtu2lD902YY5ir0GxXaXeCcwwFLPn8kuZD1oeg9O
         TY0hFsGDG/4rX263qglAiK/fA6fMJZ3vWyaPPYtQaXe0k3uex0lqa4dOoe5jqsO15TwQ
         gf8+gO7NrzqsGjK1QURDWS9CM7aD4eQVesjyAtVGi6IOI4zIojILdqyPU4dZgqIOggww
         1yMg==
X-Gm-Message-State: AFqh2koom3dgZj+3LPZIZCqt6NaY+FueKwDPzGEitWj9gAjjYDJ1+XlI
        52FTsQXfRsXtp5wMsF98ptgBQg==
X-Google-Smtp-Source: AMrXdXsKYDqPdmxbWTYbDjwxu6W+OMEbv9IqHM3e9j9XgJfjHky7pun9sdeT+r0El2jlIMBt/Hez3w==
X-Received: by 2002:a2e:8602:0:b0:27f:c669:6b06 with SMTP id a2-20020a2e8602000000b0027fc6696b06mr2238624lji.3.1672253568169;
        Wed, 28 Dec 2022 10:52:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 09/16] clk: qcom: gcc-msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:30 +0200
Message-Id: <20221228185237.3111988-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 33473c52eb90..908e996841c2 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -387,7 +387,6 @@ static struct clk_alpha_pll_postdiv gpll4_out_test = {
 
 enum {
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
 	P_PLL0_EARLY_DIV_CLK_SRC,
@@ -399,26 +398,22 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -426,7 +421,6 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
@@ -434,47 +428,40 @@ static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .fw_name = "sleep_clk" },
 	{ .hw = &gpll0_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_XO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll4_out_main.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_AUD_REF_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_5[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .fw_name = "aud_ref_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] = {
-- 
2.39.0


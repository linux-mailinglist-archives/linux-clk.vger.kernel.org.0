Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A34C64F616
	for <lists+linux-clk@lfdr.de>; Sat, 17 Dec 2022 01:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiLQAXe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 16 Dec 2022 19:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiLQAXE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:04 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3981F7C3C7
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id c1so5876797lfi.7
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNEPONWFMBruQnee+APHuJo/Zl1rzM8Br1Tby3omEos=;
        b=nWWsRzcRq8/Vx8+74jS/tvFmTyutpKQGriHhBJDwdFj9HvW4FrriSOVEoe8zEOFl0N
         emOF4ThnyyiexO02fnU/5eECh+yhKLaw1kMS6edNbkEAxTHg9sfs/25TzlBFRGZoO3Vy
         jLWMC94k1GU2iRRXQzCV7o/TMdN/zp+PzjjQyMzgMMZNvXkk1ihDv3Tf6hc6Xx7jmhDe
         aBbLjqb9AVuM6Fw11THXJZdC4auBQEGvECz3DPK5yx2mMhgG99dtMsu6Xelk0L9tRyhD
         klbeDbe5VzxD8As+yLTfR/uR9fJ3MbUl/6h92OfqNi5mbB0YU4CKTS0kVanjqlpldDCR
         kDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNEPONWFMBruQnee+APHuJo/Zl1rzM8Br1Tby3omEos=;
        b=pFq1hUxz826bRCVs9Pl+yxJM6bJPdWRkxq68z8TJT6iOAuP0JaFh85RRJE1kWTVsIs
         toTOjh4RbBdW+lKlg6io5PV6LIIsHuK4bB1tSmGCz5cWZX3CR+iiULdTfg6jj3s3Nl8o
         zSvtQu7vVKmdlmxVQXeH/wkQmmbTcUEWeAxvsRPJFP1pfFPTn++kTLe+gRjcpTOWWIQb
         hTkOVKe5KVV6MXGoKtDJZDurSQa0dfUOK0H4UOhrC/N13xUugBljUhAyyPbxrfrEmdCl
         EnO4/ZQt2CeOjdU05HZvFObHzOBOdMdQf+w6wK9CW+vJkJ6RUZ2CBr8VYJPFlVWLMdHp
         ZPRA==
X-Gm-Message-State: ANoB5pnAzx13LoszLAcrlwhExSG8mfUCYIj9Fgtp6DnJ1ng9wP4yg5P6
        ao+RFYoxhnT1pxiaLyXxqNg57A==
X-Google-Smtp-Source: AA0mqf6V1Ya+qRbNkEL4R+4qw4T1RzZGjMvOBDn3H0uwg2LyeB+2u0X56U6FrtVe0C4fILlUg1/T1g==
X-Received: by 2002:a05:6512:282b:b0:4b6:fdbe:773d with SMTP id cf43-20020a056512282b00b004b6fdbe773dmr6458550lfb.43.1671236254753;
        Fri, 16 Dec 2022 16:17:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:34 -0800 (PST)
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
Subject: [PATCH 04/15] clk: qcom: gcc-qcs404: use ARRAY_SIZE instead of specifying num_parents
Date:   Sat, 17 Dec 2022 02:17:19 +0200
Message-Id: <20221217001730.540502-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data/names/hws easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 86 +++++++++++++++++------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 46d314d69250..f60a0ab42da1 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -440,7 +440,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_ahb_clk_src",
 		.parent_names = gcc_parent_names_ao_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_ao_0),
 		.flags = CLK_IS_CRITICAL,
 		.ops = &clk_rcg2_ops,
 	},
@@ -461,7 +461,7 @@ static struct clk_rcg2 blsp1_qup0_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup0_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -486,7 +486,7 @@ static struct clk_rcg2 blsp1_qup0_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup0_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -500,7 +500,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -525,7 +525,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -539,7 +539,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -565,7 +565,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -579,7 +579,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -593,7 +593,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -607,7 +607,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -621,7 +621,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -655,7 +655,7 @@ static struct clk_rcg2 blsp1_uart0_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart0_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -669,7 +669,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -683,7 +683,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -698,7 +698,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -712,7 +712,7 @@ static struct clk_rcg2 blsp2_qup0_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup0_i2c_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -726,7 +726,7 @@ static struct clk_rcg2 blsp2_qup0_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup0_spi_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -740,7 +740,7 @@ static struct clk_rcg2 blsp2_uart0_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart0_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -753,7 +753,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = gcc_parent_names_5,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_5),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -776,7 +776,7 @@ static struct clk_rcg2 emac_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "emac_clk_src",
 		.parent_names = gcc_parent_names_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -797,7 +797,7 @@ static struct clk_rcg2 emac_ptp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "emac_ptp_clk_src",
 		.parent_names = gcc_parent_names_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -816,7 +816,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = gcc_parent_names_6,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_6),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -850,7 +850,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_names = gcc_parent_names_7,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -871,7 +871,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_names = gcc_parent_names_2,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -885,7 +885,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_names = gcc_parent_names_2,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -899,7 +899,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_names = gcc_parent_names_2,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -913,7 +913,7 @@ static struct clk_rcg2 hdmi_app_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_app_clk_src",
 		.parent_names = gcc_parent_names_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -927,7 +927,7 @@ static struct clk_rcg2 hdmi_pclk_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pclk_clk_src",
 		.parent_names = gcc_parent_names_8,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -954,7 +954,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = gcc_parent_names_9,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_9),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -973,7 +973,7 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
 		.parent_names = gcc_parent_names_10,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_10),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -994,7 +994,7 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
 		.parent_names = gcc_parent_names_11,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_11),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1007,7 +1007,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = gcc_parent_names_12,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_12),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -1028,7 +1028,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1056,7 +1056,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_parent_names_13,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_13),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1076,7 +1076,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
 		.parent_names = gcc_parent_names_3,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1102,7 +1102,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_14,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_14),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1116,7 +1116,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
 		.parent_names = gcc_parent_names_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1138,7 +1138,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
 		.parent_names = gcc_parent_names_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1152,7 +1152,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
 		.parent_names = gcc_parent_names_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1166,7 +1166,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
 		.parent_names = gcc_parent_names_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1189,7 +1189,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
 		.parent_names = gcc_parent_names_3,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1203,7 +1203,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = gcc_parent_names_15,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_15),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1225,7 +1225,7 @@ static struct clk_rcg2 cdsp_bimc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "cdsp_bimc_clk_src",
 		.parent_names = gcc_parent_names_16,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_16),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5EA875475
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2019 18:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390869AbfGYQn2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Jul 2019 12:43:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40727 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390845AbfGYQnH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jul 2019 12:43:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so45359712wmj.5
        for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2019 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1wGKAePKAFTeNSmNH2FMiVPZ29EzDjAmvdBS4e21f8g=;
        b=fkR0QaanLnYpRs9ESyrM8QTZFwFfPdszdR3qyvamUjIFrR0wJCF4PZ+6AzXX7logRk
         hNXHsIVSVi2JosOBOjQ0ZL7J0p0i1A7gI/h6zbytmj/ELzB4Jx6UnMngcRflRnKbU2Yb
         PVJIW5YnPFIzff99DsC0Bc+q7zZwTGOV+lG1WT/ieVXxAqsqPq8PHzMs4hRL3Ylz0KaY
         BjuzyWq0MW4WNzLU9ccP1WG27P4J6zBs3ynsisXUZS5h67MlhwI5XGaB7/xGqudonc3m
         nD1zUafurByvaU59V74WfzCejQR5AgqrrHj0rqVXaL3zrdh0jGxViLriNg+e5l1Hh4HO
         ZSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1wGKAePKAFTeNSmNH2FMiVPZ29EzDjAmvdBS4e21f8g=;
        b=bNc8udiI/LIgQDeZ5LP94euE81YRng806aNEaDHkqPrNVrL0P2tooYfpbLVKpE+n6s
         zLJp6qWVogDepff+MABOql3gkxYfpO9RijiKlT+m3qQhevhPL/dJ8ArtBgrAtGfNRMse
         2xLTe2Nh7K2uZPHKljR6/vTunbMB6h8f3FySAWbBV4m+Q4Hfsmstsy9NAxctHvvL99iY
         Z+dhYqfXFciX36gI2/bP56TDn0sqAMJl406gJ2JkBFP+YVcUXnBDYepkwj1VVWFqlNey
         7asYlUSl9DH+tX2iUVz2S4N3iZ3b6/infU+EcGpCtzn4cF1sVej+9tkkewaWinyRTsGB
         qIaA==
X-Gm-Message-State: APjAAAWGwuwqpQrv28CQP8xd2lBqWaU72AohqiGikZDvuvOyDbMfhcqO
        EPyp/dBoFulp2AZrSw5SL5yiaA==
X-Google-Smtp-Source: APXvYqw3VKLPntELi8NaRl6lmSyDIPAW1ADhfzdEVgrwphWE+bfCMX/t8aiMrL4oM9Xm7zHnludQ5w==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr83003270wmh.16.1564072983720;
        Thu, 25 Jul 2019 09:43:03 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
        by smtp.googlemail.com with ESMTPSA id 91sm103031727wrp.3.2019.07.25.09.43.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 09:43:03 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 5/8] clk: meson: meson8b: migrate to the new parent description method
Date:   Thu, 25 Jul 2019 18:42:35 +0200
Message-Id: <20190725164238.27991-6-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725164238.27991-1-amergnat@baylibre.com>
References: <20190725164238.27991-1-amergnat@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock controller use the string comparison method to describe parent
relation between the clocks, which is not optimized.

Migrate to the new way by using .parent_hws where possible (ie. when
all clocks are local to the controller) and use .parent_data otherwise.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 707 +++++++++++++++++++++++++-----------
 1 file changed, 496 insertions(+), 211 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 537219fa573e..b30279a5bfcc 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -97,7 +97,9 @@ static struct clk_regmap meson8b_fixed_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -112,7 +114,9 @@ static struct clk_regmap meson8b_fixed_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "fixed_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll_dco.hw
+		},
 		.num_parents = 1,
 		/*
 		 * This clock won't ever change at runtime so
@@ -158,7 +162,9 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 		/* sometimes also called "HPLL" or "HPLL PLL" */
 		.name = "hdmi_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -173,7 +179,9 @@ static struct clk_regmap meson8b_hdmi_pll_lvds_out = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_lvds_out",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -189,7 +197,9 @@ static struct clk_regmap meson8b_hdmi_pll_hdmi_out = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_hdmi_out",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -227,7 +237,9 @@ static struct clk_regmap meson8b_sys_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -242,7 +254,9 @@ static struct clk_regmap meson8b_sys_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "sys_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_sys_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -254,7 +268,9 @@ static struct clk_fixed_factor meson8b_fclk_div2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -267,7 +283,9 @@ static struct clk_regmap meson8b_fclk_div2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div2_div.hw
+		},
 		.num_parents = 1,
 		/*
 		 * FIXME: Ethernet with a RGMII PHYs is not working if
@@ -285,7 +303,9 @@ static struct clk_fixed_factor meson8b_fclk_div3_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -298,7 +318,9 @@ static struct clk_regmap meson8b_fclk_div3 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div3_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div3_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -309,7 +331,9 @@ static struct clk_fixed_factor meson8b_fclk_div4_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div4_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -322,7 +346,9 @@ static struct clk_regmap meson8b_fclk_div4 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div4",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div4_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div4_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -333,7 +359,9 @@ static struct clk_fixed_factor meson8b_fclk_div5_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -346,7 +374,9 @@ static struct clk_regmap meson8b_fclk_div5 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div5_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div5_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -357,7 +387,9 @@ static struct clk_fixed_factor meson8b_fclk_div7_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -370,7 +402,9 @@ static struct clk_regmap meson8b_fclk_div7 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div7_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div7_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -384,7 +418,9 @@ static struct clk_regmap meson8b_mpll_prediv = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll_prediv",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -416,7 +452,9 @@ static struct clk_regmap meson8b_mpll0_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -429,7 +467,9 @@ static struct clk_regmap meson8b_mpll0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -457,7 +497,9 @@ static struct clk_regmap meson8b_mpll1_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -470,7 +512,9 @@ static struct clk_regmap meson8b_mpll1 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll1_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll1_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -498,7 +542,9 @@ static struct clk_regmap meson8b_mpll2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -511,7 +557,9 @@ static struct clk_regmap meson8b_mpll2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpll2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -533,8 +581,11 @@ static struct clk_regmap meson8b_mpeg_clk_sel = {
 		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
 		 * fclk_div4, fclk_div3, fclk_div5
 		 */
-		.parent_names = (const char *[]){ "fclk_div3", "fclk_div4",
-			"fclk_div5" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div3.hw,
+			&meson8b_fclk_div4.hw,
+			&meson8b_fclk_div5.hw,
+		},
 		.num_parents = 3,
 	},
 };
@@ -548,7 +599,9 @@ static struct clk_regmap meson8b_mpeg_clk_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpeg_clk_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "mpeg_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpeg_clk_sel.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -561,7 +614,9 @@ static struct clk_regmap meson8b_clk81 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpeg_clk_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mpeg_clk_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_IS_CRITICAL,
 	},
@@ -576,7 +631,10 @@ static struct clk_regmap meson8b_cpu_in_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_in_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "xtal", "sys_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw,
+			&meson8b_sys_pll.hw,
+		},
 		.num_parents = 2,
 		.flags = (CLK_SET_RATE_PARENT |
 			  CLK_SET_RATE_NO_REPARENT),
@@ -589,7 +647,9 @@ static struct clk_fixed_factor meson8b_cpu_in_div2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_in_div2",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -601,7 +661,9 @@ static struct clk_fixed_factor meson8b_cpu_in_div3 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_in_div3",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -630,7 +692,9 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_scale_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "cpu_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -649,13 +713,15 @@ static struct clk_regmap meson8b_cpu_scale_out_sel = {
 		.ops = &clk_regmap_mux_ops,
 		/*
 		 * NOTE: We are skipping the parent with value 0x2 (which is
-		 * "cpu_in_div3") because it results in a duty cycle of 33%
-		 * which makes the system unstable and can result in a lockup
-		 * of the whole system.
+		 * meson8b_cpu_in_div3) because it results in a duty cycle of
+		 * 33% which makes the system unstable and can result in a
+		 * lockup of the whole system.
 		 */
-		.parent_names = (const char *[]) { "cpu_in_sel",
-						   "cpu_in_div2",
-						   "cpu_scale_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_in_sel.hw,
+			&meson8b_cpu_in_div2.hw,
+			&meson8b_cpu_scale_div.hw,
+		},
 		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -670,8 +736,10 @@ static struct clk_regmap meson8b_cpu_clk = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "xtal",
-						  "cpu_scale_out_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw,
+			&meson8b_cpu_scale_out_sel.hw,
+		},
 		.num_parents = 2,
 		.flags = (CLK_SET_RATE_PARENT |
 			  CLK_SET_RATE_NO_REPARENT |
@@ -690,8 +758,13 @@ static struct clk_regmap meson8b_nand_clk_sel = {
 		.name = "nand_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		/* FIXME all other parents are unknown: */
-		.parent_names = (const char *[]){ "fclk_div4", "fclk_div3",
-			"fclk_div5", "fclk_div7", "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_fclk_div4.hw,
+			&meson8b_fclk_div3.hw,
+			&meson8b_fclk_div5.hw,
+			&meson8b_fclk_div7.hw,
+			&meson8b_xtal.hw,
+		},
 		.num_parents = 5,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -707,7 +780,9 @@ static struct clk_regmap meson8b_nand_clk_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "nand_clk_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "nand_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_nand_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -721,7 +796,9 @@ static struct clk_regmap meson8b_nand_clk_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "nand_clk_gate",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "nand_clk_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_nand_clk_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -733,7 +810,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div2",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -744,7 +823,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div3 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div3",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -755,7 +836,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div4 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div4",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -766,7 +849,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div5 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div5",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -777,7 +862,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div6 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div6",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -788,7 +875,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div7 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div7",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -799,7 +888,9 @@ static struct clk_fixed_factor meson8b_cpu_clk_div8 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_div8",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "cpu_clk" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -815,13 +906,15 @@ static struct clk_regmap meson8b_apb_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "apb_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "cpu_clk_div2",
-						  "cpu_clk_div3",
-						  "cpu_clk_div4",
-						  "cpu_clk_div5",
-						  "cpu_clk_div6",
-						  "cpu_clk_div7",
-						  "cpu_clk_div8", },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk_div2.hw,
+			&meson8b_cpu_clk_div3.hw,
+			&meson8b_cpu_clk_div4.hw,
+			&meson8b_cpu_clk_div5.hw,
+			&meson8b_cpu_clk_div6.hw,
+			&meson8b_cpu_clk_div7.hw,
+			&meson8b_cpu_clk_div8.hw,
+		},
 		.num_parents = 7,
 	},
 };
@@ -835,7 +928,9 @@ static struct clk_regmap meson8b_apb_clk_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "apb_clk_dis",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "apb_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_apb_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -850,13 +945,15 @@ static struct clk_regmap meson8b_periph_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "periph_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "cpu_clk_div2",
-						  "cpu_clk_div3",
-						  "cpu_clk_div4",
-						  "cpu_clk_div5",
-						  "cpu_clk_div6",
-						  "cpu_clk_div7",
-						  "cpu_clk_div8", },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk_div2.hw,
+			&meson8b_cpu_clk_div3.hw,
+			&meson8b_cpu_clk_div4.hw,
+			&meson8b_cpu_clk_div5.hw,
+			&meson8b_cpu_clk_div6.hw,
+			&meson8b_cpu_clk_div7.hw,
+			&meson8b_cpu_clk_div8.hw,
+		},
 		.num_parents = 7,
 	},
 };
@@ -870,7 +967,9 @@ static struct clk_regmap meson8b_periph_clk_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "periph_clk_dis",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "periph_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_periph_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -887,13 +986,15 @@ static struct clk_regmap meson8b_axi_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "cpu_clk_div2",
-						  "cpu_clk_div3",
-						  "cpu_clk_div4",
-						  "cpu_clk_div5",
-						  "cpu_clk_div6",
-						  "cpu_clk_div7",
-						  "cpu_clk_div8", },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk_div2.hw,
+			&meson8b_cpu_clk_div3.hw,
+			&meson8b_cpu_clk_div4.hw,
+			&meson8b_cpu_clk_div5.hw,
+			&meson8b_cpu_clk_div6.hw,
+			&meson8b_cpu_clk_div7.hw,
+			&meson8b_cpu_clk_div8.hw,
+		},
 		.num_parents = 7,
 	},
 };
@@ -907,7 +1008,9 @@ static struct clk_regmap meson8b_axi_clk_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_dis",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "axi_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_axi_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -922,13 +1025,15 @@ static struct clk_regmap meson8b_l2_dram_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "l2_dram_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "cpu_clk_div2",
-						  "cpu_clk_div3",
-						  "cpu_clk_div4",
-						  "cpu_clk_div5",
-						  "cpu_clk_div6",
-						  "cpu_clk_div7",
-						  "cpu_clk_div8", },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cpu_clk_div2.hw,
+			&meson8b_cpu_clk_div3.hw,
+			&meson8b_cpu_clk_div4.hw,
+			&meson8b_cpu_clk_div5.hw,
+			&meson8b_cpu_clk_div6.hw,
+			&meson8b_cpu_clk_div7.hw,
+			&meson8b_cpu_clk_div8.hw,
+		},
 		.num_parents = 7,
 	},
 };
@@ -942,7 +1047,9 @@ static struct clk_regmap meson8b_l2_dram_clk_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "l2_dram_clk_dis",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "l2_dram_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_l2_dram_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -963,7 +1070,9 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
 		 * Meson8b: hdmi_pll_dco
 		 * Meson8m2: vid2_pll
 		 */
-		.parent_names = (const char *[]){ "hdmi_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -977,7 +1086,9 @@ static struct clk_regmap meson8b_vid_pll_in_en = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_in_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vid_pll_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vid_pll_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -992,7 +1103,9 @@ static struct clk_regmap meson8b_vid_pll_pre_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_pre_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "vid_pll_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vid_pll_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1007,7 +1120,9 @@ static struct clk_regmap meson8b_vid_pll_post_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_post_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "vid_pll_pre_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vid_pll_pre_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1023,8 +1138,10 @@ static struct clk_regmap meson8b_vid_pll = {
 		.name = "vid_pll",
 		.ops = &clk_regmap_mux_ro_ops,
 		/* TODO: parent 0x2 is vid_pll_pre_div_mult7_div2 */
-		.parent_names = (const char *[]){ "vid_pll_pre_div",
-						  "vid_pll_post_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vid_pll_pre_div.hw,
+			&meson8b_vid_pll_post_div.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1039,15 +1156,22 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_final_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "vid_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vid_pll.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const char * const meson8b_vclk_mux_parents[] = {
-	"vid_pll_final_div", "fclk_div4", "fclk_div3", "fclk_div5",
-	"vid_pll_final_div", "fclk_div7", "mpll1"
+static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
+	&meson8b_vid_pll_final_div.hw,
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
+	&meson8b_vid_pll_final_div.hw,
+	&meson8b_fclk_div7.hw,
+	&meson8b_mpll1.hw,
 };
 
 static struct clk_regmap meson8b_vclk_in_sel = {
@@ -1059,8 +1183,8 @@ static struct clk_regmap meson8b_vclk_in_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_in_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parents),
+		.parent_hws = meson8b_vclk_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1073,7 +1197,9 @@ static struct clk_regmap meson8b_vclk_in_en = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_in_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1087,7 +1213,9 @@ static struct clk_regmap meson8b_vclk_div1_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div1_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1099,7 +1227,9 @@ static struct clk_fixed_factor meson8b_vclk_div2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div2",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1113,7 +1243,9 @@ static struct clk_regmap meson8b_vclk_div2_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div2_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_div2" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_div2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1125,7 +1257,9 @@ static struct clk_fixed_factor meson8b_vclk_div4_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div4",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1139,7 +1273,9 @@ static struct clk_regmap meson8b_vclk_div4_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div4_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_div4" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_div4_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1151,7 +1287,9 @@ static struct clk_fixed_factor meson8b_vclk_div6_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div6",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1165,7 +1303,9 @@ static struct clk_regmap meson8b_vclk_div6_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div6_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_div6" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_div6_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1177,7 +1317,9 @@ static struct clk_fixed_factor meson8b_vclk_div12_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div12",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1191,7 +1333,9 @@ static struct clk_regmap meson8b_vclk_div12_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div12_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk_div12" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_div12_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1206,8 +1350,8 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_in_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parents),
+		.parent_hws = meson8b_vclk_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1220,7 +1364,9 @@ static struct clk_regmap meson8b_vclk2_clk_in_en = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_in_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_in_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_in_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1234,7 +1380,9 @@ static struct clk_regmap meson8b_vclk2_div1_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div1_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1246,7 +1394,9 @@ static struct clk_fixed_factor meson8b_vclk2_div2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div2",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk2_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1260,7 +1410,9 @@ static struct clk_regmap meson8b_vclk2_div2_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div2_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_div2" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_div2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1272,7 +1424,9 @@ static struct clk_fixed_factor meson8b_vclk2_div4_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div4",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk2_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1286,7 +1440,9 @@ static struct clk_regmap meson8b_vclk2_div4_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div4_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_div4" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_div4_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1298,7 +1454,9 @@ static struct clk_fixed_factor meson8b_vclk2_div6_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div6",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk2_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1312,7 +1470,9 @@ static struct clk_regmap meson8b_vclk2_div6_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div6_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_div6" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_div6_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1324,7 +1484,9 @@ static struct clk_fixed_factor meson8b_vclk2_div12_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div12",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "vclk2_in_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
@@ -1338,15 +1500,20 @@ static struct clk_regmap meson8b_vclk2_div12_div_gate = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div12_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "vclk2_div12" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_div12_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const char * const meson8b_vclk_enc_mux_parents[] = {
-	"vclk_div1_en", "vclk_div2_en", "vclk_div4_en", "vclk_div6_en",
-	"vclk_div12_en",
+static const struct clk_hw *meson8b_vclk_enc_mux_parent_hws[] = {
+	&meson8b_vclk_div1_gate.hw,
+	&meson8b_vclk_div2_div_gate.hw,
+	&meson8b_vclk_div4_div_gate.hw,
+	&meson8b_vclk_div6_div_gate.hw,
+	&meson8b_vclk_div12_div_gate.hw,
 };
 
 static struct clk_regmap meson8b_cts_enct_sel = {
@@ -1358,8 +1525,8 @@ static struct clk_regmap meson8b_cts_enct_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enct_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1372,7 +1539,9 @@ static struct clk_regmap meson8b_cts_enct = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enct",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "cts_enct_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_enct_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1387,8 +1556,8 @@ static struct clk_regmap meson8b_cts_encp_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1401,7 +1570,9 @@ static struct clk_regmap meson8b_cts_encp = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "cts_encp_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_encp_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1416,8 +1587,8 @@ static struct clk_regmap meson8b_cts_enci_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1430,7 +1601,9 @@ static struct clk_regmap meson8b_cts_enci = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "cts_enci_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_enci_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1445,8 +1618,8 @@ static struct clk_regmap meson8b_hdmi_tx_pixel_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_pixel_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1459,15 +1632,20 @@ static struct clk_regmap meson8b_hdmi_tx_pixel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_pixel",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_tx_pixel_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_tx_pixel_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const char * const meson8b_vclk2_enc_mux_parents[] = {
-	"vclk2_div1_en", "vclk2_div2_en", "vclk2_div4_en", "vclk2_div6_en",
-	"vclk2_div12_en",
+static const struct clk_hw *meson8b_vclk2_enc_mux_parent_hws[] = {
+	&meson8b_vclk2_div1_gate.hw,
+	&meson8b_vclk2_div2_div_gate.hw,
+	&meson8b_vclk2_div4_div_gate.hw,
+	&meson8b_vclk2_div6_div_gate.hw,
+	&meson8b_vclk2_div12_div_gate.hw,
 };
 
 static struct clk_regmap meson8b_cts_encl_sel = {
@@ -1479,8 +1657,8 @@ static struct clk_regmap meson8b_cts_encl_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk2_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parents),
+		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1493,7 +1671,9 @@ static struct clk_regmap meson8b_cts_encl = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "cts_encl_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_encl_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1508,8 +1688,8 @@ static struct clk_regmap meson8b_cts_vdac0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac0_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = meson8b_vclk2_enc_mux_parents,
-		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parents),
+		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1522,7 +1702,9 @@ static struct clk_regmap meson8b_cts_vdac0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac0",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "cts_vdac0_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_vdac0_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1539,7 +1721,9 @@ static struct clk_regmap meson8b_hdmi_sys_sel = {
 		.name = "hdmi_sys_sel",
 		.ops = &clk_regmap_mux_ro_ops,
 		/* FIXME: all other parents are unknown */
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
@@ -1554,7 +1738,9 @@ static struct clk_regmap meson8b_hdmi_sys_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sys_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_sys_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_sys_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1568,7 +1754,9 @@ static struct clk_regmap meson8b_hdmi_sys = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "hdmi_sys",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_sys_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_sys_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1579,9 +1767,14 @@ static struct clk_regmap meson8b_hdmi_sys = {
  * muxed by a glitch-free switch on Meson8b and Meson8m2. Meson8 only
  * has mali_0 and no glitch-free mux.
  */
-static const char * const meson8b_mali_0_1_parent_names[] = {
-	"xtal", "mpll2", "mpll1", "fclk_div7", "fclk_div4", "fclk_div3",
-	"fclk_div5"
+static const struct clk_hw *meson8b_mali_0_1_parent_hws[] = {
+	&meson8b_xtal.hw,
+	&meson8b_mpll2.hw,
+	&meson8b_mpll1.hw,
+	&meson8b_fclk_div7.hw,
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
 };
 
 static u32 meson8b_mali_0_1_mux_table[] = { 0, 2, 3, 4, 5, 6, 7 };
@@ -1596,8 +1789,8 @@ static struct clk_regmap meson8b_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_mali_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_names),
+		.parent_hws = meson8b_mali_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_hws),
 		/*
 		 * Don't propagate rate changes up because the only changeable
 		 * parents are mpll1 and mpll2 but we need those for audio and
@@ -1617,7 +1810,9 @@ static struct clk_regmap meson8b_mali_0_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "mali_0_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mali_0_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1631,7 +1826,9 @@ static struct clk_regmap meson8b_mali_0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mali_0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mali_0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1647,8 +1844,8 @@ static struct clk_regmap meson8b_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_mali_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_names),
+		.parent_hws = meson8b_mali_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_hws),
 		/*
 		 * Don't propagate rate changes up because the only changeable
 		 * parents are mpll1 and mpll2 but we need those for audio and
@@ -1668,7 +1865,9 @@ static struct clk_regmap meson8b_mali_1_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "mali_1_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mali_1_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1682,7 +1881,9 @@ static struct clk_regmap meson8b_mali_1 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mali_1_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mali_1_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1697,7 +1898,10 @@ static struct clk_regmap meson8b_mali = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "mali_0", "mali_1" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_mali_0.hw,
+			&meson8b_mali_1.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1740,7 +1944,9 @@ static struct clk_regmap meson8m2_gp_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_xtal.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -1755,18 +1961,26 @@ static struct clk_regmap meson8m2_gp_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp_pll",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "gp_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8m2_gp_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const char * const meson8b_vpu_0_1_parent_names[] = {
-	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
+static const struct clk_hw *meson8b_vpu_0_1_parent_hws[] = {
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
+	&meson8b_fclk_div7.hw,
 };
 
-static const char * const mmeson8m2_vpu_0_1_parent_names[] = {
-	"fclk_div4", "fclk_div3", "fclk_div5", "gp_pll"
+static const struct clk_hw *mmeson8m2_vpu_0_1_parent_hws[] = {
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
+	&meson8m2_gp_pll.hw,
 };
 
 static struct clk_regmap meson8b_vpu_0_sel = {
@@ -1778,8 +1992,8 @@ static struct clk_regmap meson8b_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_names),
+		.parent_hws = meson8b_vpu_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1793,8 +2007,8 @@ static struct clk_regmap meson8m2_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = mmeson8m2_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_names),
+		.parent_hws = mmeson8m2_vpu_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1808,7 +2022,17 @@ static struct clk_regmap meson8b_vpu_0_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vpu_0_sel" },
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * meson8b and meson8m2 have different vpu_0_sels (with
+			 * different struct clk_hw). We fallback to the global
+			 * naming string mechanism so vpu_0_div picks up the
+			 * appropriate one.
+			 */
+			.name = "vpu_0_sel",
+			.index = -1,
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1822,7 +2046,9 @@ static struct clk_regmap meson8b_vpu_0 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vpu_0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vpu_0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vpu_0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1837,8 +2063,8 @@ static struct clk_regmap meson8b_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_names),
+		.parent_hws = meson8b_vpu_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1852,8 +2078,8 @@ static struct clk_regmap meson8m2_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = mmeson8m2_vpu_0_1_parent_names,
-		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_names),
+		.parent_hws = mmeson8m2_vpu_0_1_parent_hws,
+		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1867,7 +2093,17 @@ static struct clk_regmap meson8b_vpu_1_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vpu_1_sel" },
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * meson8b and meson8m2 have different vpu_1_sels (with
+			 * different struct clk_hw). We fallback to the global
+			 * naming string mechanism so vpu_1_div picks up the
+			 * appropriate one.
+			 */
+			.name = "vpu_1_sel",
+			.index = -1,
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1881,7 +2117,9 @@ static struct clk_regmap meson8b_vpu_1 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vpu_1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vpu_1_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vpu_1_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1896,14 +2134,22 @@ static struct clk_regmap meson8b_vpu = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "vpu_0", "vpu_1" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vpu_0.hw,
+			&meson8b_vpu_1.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-static const char * const meson8b_vdec_parent_names[] = {
-	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "mpll2", "mpll1"
+static const struct clk_hw *meson8b_vdec_parent_hws[] = {
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
+	&meson8b_fclk_div7.hw,
+	&meson8b_mpll2.hw,
+	&meson8b_mpll1.hw,
 };
 
 static struct clk_regmap meson8b_vdec_1_sel = {
@@ -1916,8 +2162,8 @@ static struct clk_regmap meson8b_vdec_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vdec_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.parent_hws = meson8b_vdec_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1932,7 +2178,9 @@ static struct clk_regmap meson8b_vdec_1_1_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_1_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vdec_1_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_1_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1946,7 +2194,9 @@ static struct clk_regmap meson8b_vdec_1_1 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vdec_1_1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vdec_1_1_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_1_1_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1962,7 +2212,9 @@ static struct clk_regmap meson8b_vdec_1_2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_2_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vdec_1_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_1_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1976,7 +2228,9 @@ static struct clk_regmap meson8b_vdec_1_2 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vdec_1_2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vdec_1_2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_1_2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1992,7 +2246,10 @@ static struct clk_regmap meson8b_vdec_1 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "vdec_1_1", "vdec_1_2" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_1_1.hw,
+			&meson8b_vdec_1_2.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2008,8 +2265,8 @@ static struct clk_regmap meson8b_vdec_hcodec_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hcodec_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vdec_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.parent_hws = meson8b_vdec_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2024,7 +2281,9 @@ static struct clk_regmap meson8b_vdec_hcodec_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hcodec_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vdec_hcodec_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_hcodec_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2038,7 +2297,9 @@ static struct clk_regmap meson8b_vdec_hcodec = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vdec_hcodec",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vdec_hcodec_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_hcodec_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2054,8 +2315,8 @@ static struct clk_regmap meson8b_vdec_2_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_2_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vdec_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.parent_hws = meson8b_vdec_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2070,7 +2331,9 @@ static struct clk_regmap meson8b_vdec_2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_2_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vdec_2_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_2_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2084,7 +2347,9 @@ static struct clk_regmap meson8b_vdec_2 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vdec_2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vdec_2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2100,8 +2365,8 @@ static struct clk_regmap meson8b_vdec_hevc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_vdec_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
+		.parent_hws = meson8b_vdec_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2116,7 +2381,9 @@ static struct clk_regmap meson8b_vdec_hevc_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "vdec_hevc_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_hevc_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2130,7 +2397,9 @@ static struct clk_regmap meson8b_vdec_hevc_en = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vdec_hevc_en",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vdec_hevc_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_hevc_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2147,15 +2416,19 @@ static struct clk_regmap meson8b_vdec_hevc = {
 		.name = "vdec_hevc",
 		.ops = &clk_regmap_mux_ops,
 		/* TODO: The second parent is currently unknown */
-		.parent_names = (const char *[]){ "vdec_hevc_en" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vdec_hevc_en.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const char * const meson8b_cts_amclk_parent_names[] = {
-	"mpll0", "mpll1", "mpll2"
+static const struct clk_hw *meson8b_cts_amclk_parent_hws[] = {
+	&meson8b_mpll0.hw,
+	&meson8b_mpll1.hw,
+	&meson8b_mpll2.hw
 };
 
 static u32 meson8b_cts_amclk_mux_table[] = { 1, 2, 3 };
@@ -2171,8 +2444,8 @@ static struct clk_regmap meson8b_cts_amclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_cts_amclk_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_names),
+		.parent_hws = meson8b_cts_amclk_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_hws),
 	},
 };
 
@@ -2186,7 +2459,9 @@ static struct clk_regmap meson8b_cts_amclk_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "cts_amclk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_amclk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2200,15 +2475,19 @@ static struct clk_regmap meson8b_cts_amclk = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "cts_amclk_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_amclk_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const char * const meson8b_cts_mclk_i958_parent_names[] = {
-	"mpll0", "mpll1", "mpll2"
+static const struct clk_hw *meson8b_cts_mclk_i958_parent_hws[] = {
+	&meson8b_mpll0.hw,
+	&meson8b_mpll1.hw,
+	&meson8b_mpll2.hw
 };
 
 static u32 meson8b_cts_mclk_i958_mux_table[] = { 1, 2, 3 };
@@ -2224,8 +2503,8 @@ static struct clk_regmap meson8b_cts_mclk_i958_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = meson8b_cts_mclk_i958_parent_names,
-		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_names),
+		.parent_hws = meson8b_cts_mclk_i958_parent_hws,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_hws),
 	},
 };
 
@@ -2239,7 +2518,9 @@ static struct clk_regmap meson8b_cts_mclk_i958_div = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "cts_mclk_i958_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_mclk_i958_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2253,7 +2534,9 @@ static struct clk_regmap meson8b_cts_mclk_i958 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_mclk_i958",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "cts_mclk_i958_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_mclk_i958_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -2268,8 +2551,10 @@ static struct clk_regmap meson8b_cts_i958 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_i958",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "cts_amclk",
-						  "cts_mclk_i958" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_cts_amclk.hw,
+			&meson8b_cts_mclk_i958.hw
+		},
 		.num_parents = 2,
 		/*
 		 * The parent is specific to origin of the audio data. Let the
-- 
2.17.1


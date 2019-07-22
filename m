Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD136FCC5
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2019 11:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfGVJuO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jul 2019 05:50:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52699 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfGVJuN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 05:50:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so34473189wms.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2019 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=hKm+JnXWXXuV7trgotmUC1XIGpONOP5h0963i0bTdew=;
        b=DQBpWeMP76gef9u3FmEa4dVGE14vsxX+islaXCYSJHE59o5WAkX/DAJD5D0geYOcQp
         b6XKChn1XSh9H0gbrRQoRda34L3dtq/v2rzOR9E8bR3UMHNplGrm1wgHAdMGbAe9R6XY
         RRbtXcchA/IWHlZl9DvZtl53WdBy1hrLW4nvaM0M2Hg46jaXxJtUmZPtpl1ilkmMqGbc
         YLkBdH2ZcPZ9zCXSbZ8mVVFT1aR0eSvw+5BySRo6qEoCYklmynWjtHkL7iL76RrQPJrC
         EfyeQ3DP+LMCy5qEF/Mplq225nFwuMm0c8mfNcvrjPPrY+SI5mOSqvEtx19W2RwWoH3M
         6Ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hKm+JnXWXXuV7trgotmUC1XIGpONOP5h0963i0bTdew=;
        b=n+KaQDxb+gz/NvPEeCULI1ULh+BikirJQxhUJ2NccbJetm4Te9tjWO1+4R5KLlOwK7
         GpN8AJt1n91DW8e+VKC2PlEGUzxinncwdOlmU4fb7nA/BPGpJrkqJMeQO5vTl1olwgnB
         6BXoYvF7R4JQVtKY0L4Xdz8KGUPD0IfxKnRWkXw6VUxylBhzMnImw7PS07UUEyRYtP2M
         g4VITPq+iY9GTrZyHXIHiyM2fupXraOdKAt8Mj70t4NHsf/gI29RIBdjNLcin1tJuh2d
         xzzAdaGNser7+qgwEtTFXmhzbNh+12aJYDbVT9APS3zqQu1GmGmcQxoEE+l55k7nZ08A
         wpMA==
X-Gm-Message-State: APjAAAXk5azpbqbKKcC5LlSkTWYFPiV89U2uiatjXZW4YMvKA4DDnDq1
        5MnfS1CskLuXyA3e5Snr4yrscA==
X-Google-Smtp-Source: APXvYqzZejCbxUUJoz+ci6zOgcDamgzn4M220kLVWYRh0TK31P/EYFTXN3mvUgfwK4TH9R/YQalm9Q==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr61734341wme.172.1563789009588;
        Mon, 22 Jul 2019 02:50:09 -0700 (PDT)
Received: from pop-os.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i12sm40494917wrx.61.2019.07.22.02.50.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:50:08 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH] clk: meson: axg-audio: migrate to the new parent description method
Date:   Mon, 22 Jul 2019 11:49:54 +0200
Message-Id: <20190722094954.14040-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock controller use the string comparison method to describe parent
relation between the clocks, which is not optimized. A recent patch [0]
allows parents to be specified without string names or with device-tree
clock name by using a new assignment structure.

Migrate to the new way by using .parent_hws where possible (when parent
clocks are localy declared in the controller) and use .parent_data
otherwise.

Remove clk input helper and all bypass clocks (declared in probe function)
which are no longer used since we are able to use device-tree clock name
directly.

[0] commit fc0c209c147f ("clk: Allow parents to be specified without string names")

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   1 -
 drivers/clk/meson/axg-audio.c | 253 ++++++++++++++++------------------
 2 files changed, 116 insertions(+), 138 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index a6b20e123e0c..ee0b84b6b329 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -86,7 +86,6 @@ config COMMON_CLK_AXG
 config COMMON_CLK_AXG_AUDIO
 	tristate "Meson AXG Audio Clock Controller Driver"
 	depends on ARCH_MESON
-	select COMMON_CLK_MESON_INPUT
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PHASE
 	select COMMON_CLK_MESON_SCLK_DIV
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 8028ff6f6610..4253a466eae8 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 
 #include "axg-audio.h"
-#include "clk-input.h"
 #include "clk-regmap.h"
 #include "clk-phase.h"
 #include "sclk-div.h"
@@ -24,7 +23,7 @@
 #define AUD_SLV_SCLK_COUNT	10
 #define AUD_SLV_LRCLK_COUNT	10
 
-#define AUD_GATE(_name, _reg, _bit, _pname, _iflags)			\
+#define AUD_GATE(_name, _reg, _bit, _phws, _iflags)			\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
@@ -33,13 +32,13 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_names = (const char *[]){ _pname },		\
+		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \
 		.num_parents = 1,					\
 		.flags = CLK_DUTY_CYCLE_PARENT | (_iflags),		\
 	},								\
 }
 
-#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pnames, _iflags)	\
+#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags)	\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct clk_regmap_mux_data){				\
 		.offset = (_reg),					\
@@ -50,13 +49,13 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data){				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_mux_ops,				\
-		.parent_names = (_pnames),				\
-		.num_parents = ARRAY_SIZE(_pnames),			\
+		.parent_data = _pdata,					\
+		.num_parents = ARRAY_SIZE(_pdata),			\
 		.flags = CLK_DUTY_CYCLE_PARENT | (_iflags),		\
 	},								\
 }
 
-#define AUD_DIV(_name, _reg, _shift, _width, _dflags, _pname, _iflags)	\
+#define AUD_DIV(_name, _reg, _shift, _width, _dflags, _phws, _iflags)	\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct clk_regmap_div_data){				\
 		.offset = (_reg),					\
@@ -67,15 +66,27 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data){				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_divider_ops,				\
-		.parent_names = (const char *[]) { _pname },		\
+		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \
 		.num_parents = 1,					\
 		.flags = (_iflags),					\
 	},								\
 }
 
 #define AUD_PCLK_GATE(_name, _bit)				\
-	AUD_GATE(_name, AUDIO_CLK_GATE_EN, _bit, "audio_pclk", 0)
-
+struct clk_regmap aud_##_name = {					\
+	.data = &(struct clk_regmap_gate_data){				\
+		.offset = (AUDIO_CLK_GATE_EN),				\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = "aud_"#_name,					\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = "pclk",				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
 /* Audio peripheral clocks */
 static AUD_PCLK_GATE(ddr_arb,	   0);
 static AUD_PCLK_GATE(pdm,	   1);
@@ -100,14 +111,20 @@ static AUD_PCLK_GATE(power_detect, 19);
 static AUD_PCLK_GATE(spdifout_b,   21);
 
 /* Audio Master Clocks */
-static const char * const mst_mux_parent_names[] = {
-	"aud_mst_in0", "aud_mst_in1", "aud_mst_in2", "aud_mst_in3",
-	"aud_mst_in4", "aud_mst_in5", "aud_mst_in6", "aud_mst_in7",
+static const struct clk_parent_data mst_mux_parent_data[] = {
+	{ .fw_name = "mst_in0", },
+	{ .fw_name = "mst_in1", },
+	{ .fw_name = "mst_in2", },
+	{ .fw_name = "mst_in3", },
+	{ .fw_name = "mst_in4", },
+	{ .fw_name = "mst_in5", },
+	{ .fw_name = "mst_in6", },
+	{ .fw_name = "mst_in7", },
 };
 
 #define AUD_MST_MUX(_name, _reg, _flag)				\
 	AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,		\
-		mst_mux_parent_names, CLK_SET_RATE_PARENT)
+		mst_mux_parent_data, CLK_SET_RATE_PARENT)
 
 #define AUD_MST_MCLK_MUX(_name, _reg)				\
 	AUD_MST_MUX(_name, _reg, CLK_MUX_ROUND_CLOSEST)
@@ -129,7 +146,7 @@ static AUD_MST_MCLK_MUX(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
 
 #define AUD_MST_DIV(_name, _reg, _flag)				\
 	AUD_DIV(_name##_div, _reg, 0, 16, _flag,		\
-		    "aud_"#_name"_sel", CLK_SET_RATE_PARENT)	\
+		    aud_##_name##_sel, CLK_SET_RATE_PARENT)	\
 
 #define AUD_MST_MCLK_DIV(_name, _reg)				\
 	AUD_MST_DIV(_name, _reg, CLK_DIVIDER_ROUND_CLOSEST)
@@ -150,7 +167,7 @@ static AUD_MST_SYS_DIV(pdm_sysclk,    AUDIO_CLK_PDMIN_CTRL1);
 static AUD_MST_MCLK_DIV(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
 
 #define AUD_MST_MCLK_GATE(_name, _reg)				\
-	AUD_GATE(_name, _reg, 31,  "aud_"#_name"_div",	\
+	AUD_GATE(_name, _reg, 31,  aud_##_name##_div,		\
 		 CLK_SET_RATE_PARENT)
 
 static AUD_MST_MCLK_GATE(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
@@ -168,7 +185,7 @@ static AUD_MST_MCLK_GATE(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
 /* Sample Clocks */
 #define AUD_MST_SCLK_PRE_EN(_name, _reg)			\
 	AUD_GATE(mst_##_name##_sclk_pre_en, _reg, 31,		\
-		 "aud_mst_"#_name"_mclk", 0)
+		 aud_mst_##_name##_mclk, 0)
 
 static AUD_MST_SCLK_PRE_EN(a, AUDIO_MST_A_SCLK_CTRL0);
 static AUD_MST_SCLK_PRE_EN(b, AUDIO_MST_B_SCLK_CTRL0);
@@ -178,7 +195,7 @@ static AUD_MST_SCLK_PRE_EN(e, AUDIO_MST_E_SCLK_CTRL0);
 static AUD_MST_SCLK_PRE_EN(f, AUDIO_MST_F_SCLK_CTRL0);
 
 #define AUD_SCLK_DIV(_name, _reg, _div_shift, _div_width,		\
-			 _hi_shift, _hi_width, _pname, _iflags)		\
+			 _hi_shift, _hi_width, _phws, _iflags)		\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct meson_sclk_div_data) {				\
 		.div = {						\
@@ -195,7 +212,7 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &meson_sclk_div_ops,				\
-		.parent_names = (const char *[]) { _pname },		\
+		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \
 		.num_parents = 1,					\
 		.flags = (_iflags),					\
 	},								\
@@ -203,7 +220,7 @@ struct clk_regmap aud_##_name = {					\
 
 #define AUD_MST_SCLK_DIV(_name, _reg)					\
 	AUD_SCLK_DIV(mst_##_name##_sclk_div, _reg, 20, 10, 0, 0,	\
-		     "aud_mst_"#_name"_sclk_pre_en",			\
+		     aud_mst_##_name##_sclk_pre_en,			\
 		     CLK_SET_RATE_PARENT)
 
 static AUD_MST_SCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
@@ -214,8 +231,8 @@ static AUD_MST_SCLK_DIV(e, AUDIO_MST_E_SCLK_CTRL0);
 static AUD_MST_SCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
 
 #define AUD_MST_SCLK_POST_EN(_name, _reg)				\
-	AUD_GATE(mst_##_name##_sclk_post_en, _reg, 30,		\
-		 "aud_mst_"#_name"_sclk_div", CLK_SET_RATE_PARENT)
+	AUD_GATE(mst_##_name##_sclk_post_en, _reg, 30,			\
+		 aud_mst_##_name##_sclk_div, CLK_SET_RATE_PARENT)
 
 static AUD_MST_SCLK_POST_EN(a, AUDIO_MST_A_SCLK_CTRL0);
 static AUD_MST_SCLK_POST_EN(b, AUDIO_MST_B_SCLK_CTRL0);
@@ -225,7 +242,7 @@ static AUD_MST_SCLK_POST_EN(e, AUDIO_MST_E_SCLK_CTRL0);
 static AUD_MST_SCLK_POST_EN(f, AUDIO_MST_F_SCLK_CTRL0);
 
 #define AUD_TRIPHASE(_name, _reg, _width, _shift0, _shift1, _shift2, \
-			 _pname, _iflags)				\
+			 _phws, _iflags)				\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct meson_clk_triphase_data) {			\
 		.ph0 = {						\
@@ -247,7 +264,7 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &meson_clk_triphase_ops,				\
-		.parent_names = (const char *[]) { _pname },		\
+		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \
 		.num_parents = 1,					\
 		.flags = CLK_DUTY_CYCLE_PARENT | (_iflags),		\
 	},								\
@@ -255,7 +272,7 @@ struct clk_regmap aud_##_name = {					\
 
 #define AUD_MST_SCLK(_name, _reg)					\
 	AUD_TRIPHASE(mst_##_name##_sclk, _reg, 1, 0, 2, 4,		\
-		     "aud_mst_"#_name"_sclk_post_en", CLK_SET_RATE_PARENT)
+		     aud_mst_##_name##_sclk_post_en, CLK_SET_RATE_PARENT)
 
 static AUD_MST_SCLK(a, AUDIO_MST_A_SCLK_CTRL1);
 static AUD_MST_SCLK(b, AUDIO_MST_B_SCLK_CTRL1);
@@ -266,7 +283,7 @@ static AUD_MST_SCLK(f, AUDIO_MST_F_SCLK_CTRL1);
 
 #define AUD_MST_LRCLK_DIV(_name, _reg)					\
 	AUD_SCLK_DIV(mst_##_name##_lrclk_div, _reg, 0, 10, 10, 10,	\
-		     "aud_mst_"#_name"_sclk_post_en", 0)		\
+		     aud_mst_##_name##_sclk_post_en, 0)			\
 
 static AUD_MST_LRCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
 static AUD_MST_LRCLK_DIV(b, AUDIO_MST_B_SCLK_CTRL0);
@@ -277,7 +294,7 @@ static AUD_MST_LRCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
 
 #define AUD_MST_LRCLK(_name, _reg)					\
 	AUD_TRIPHASE(mst_##_name##_lrclk, _reg, 1, 1, 3, 5,		\
-		     "aud_mst_"#_name"_lrclk_div", CLK_SET_RATE_PARENT)
+		     aud_mst_##_name##_lrclk_div, CLK_SET_RATE_PARENT)
 
 static AUD_MST_LRCLK(a, AUDIO_MST_A_SCLK_CTRL1);
 static AUD_MST_LRCLK(b, AUDIO_MST_B_SCLK_CTRL1);
@@ -286,19 +303,29 @@ static AUD_MST_LRCLK(d, AUDIO_MST_D_SCLK_CTRL1);
 static AUD_MST_LRCLK(e, AUDIO_MST_E_SCLK_CTRL1);
 static AUD_MST_LRCLK(f, AUDIO_MST_F_SCLK_CTRL1);
 
-static const char * const tdm_sclk_parent_names[] = {
-	"aud_mst_a_sclk", "aud_mst_b_sclk", "aud_mst_c_sclk",
-	"aud_mst_d_sclk", "aud_mst_e_sclk", "aud_mst_f_sclk",
-	"aud_slv_sclk0", "aud_slv_sclk1", "aud_slv_sclk2",
-	"aud_slv_sclk3", "aud_slv_sclk4", "aud_slv_sclk5",
-	"aud_slv_sclk6", "aud_slv_sclk7", "aud_slv_sclk8",
-	"aud_slv_sclk9"
+static const struct clk_parent_data tdm_sclk_parent_data[] = {
+	{ .hw = &aud_mst_a_sclk.hw, },
+	{ .hw = &aud_mst_b_sclk.hw, },
+	{ .hw = &aud_mst_c_sclk.hw, },
+	{ .hw = &aud_mst_d_sclk.hw, },
+	{ .hw = &aud_mst_e_sclk.hw, },
+	{ .hw = &aud_mst_f_sclk.hw, },
+	{ .fw_name = "slv_sclk0", },
+	{ .fw_name = "slv_sclk1", },
+	{ .fw_name = "slv_sclk2", },
+	{ .fw_name = "slv_sclk3", },
+	{ .fw_name = "slv_sclk4", },
+	{ .fw_name = "slv_sclk5", },
+	{ .fw_name = "slv_sclk6", },
+	{ .fw_name = "slv_sclk7", },
+	{ .fw_name = "slv_sclk8", },
+	{ .fw_name = "slv_sclk9", },
 };
 
 #define AUD_TDM_SCLK_MUX(_name, _reg)				\
 	AUD_MUX(tdm##_name##_sclk_sel, _reg, 0xf, 24,		\
 		    CLK_MUX_ROUND_CLOSEST,			\
-		    tdm_sclk_parent_names, 0)
+		    tdm_sclk_parent_data, 0)
 
 static AUD_TDM_SCLK_MUX(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
 static AUD_TDM_SCLK_MUX(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
@@ -310,7 +337,7 @@ static AUD_TDM_SCLK_MUX(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 #define AUD_TDM_SCLK_PRE_EN(_name, _reg)				\
 	AUD_GATE(tdm##_name##_sclk_pre_en, _reg, 31,			\
-		 "aud_tdm"#_name"_sclk_sel", CLK_SET_RATE_PARENT)
+		 aud_tdm##_name##_sclk_sel, CLK_SET_RATE_PARENT)
 
 static AUD_TDM_SCLK_PRE_EN(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
 static AUD_TDM_SCLK_PRE_EN(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
@@ -322,7 +349,7 @@ static AUD_TDM_SCLK_PRE_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 #define AUD_TDM_SCLK_POST_EN(_name, _reg)				\
 	AUD_GATE(tdm##_name##_sclk_post_en, _reg, 30,			\
-		 "aud_tdm"#_name"_sclk_pre_en", CLK_SET_RATE_PARENT)
+		 aud_tdm##_name##_sclk_pre_en, CLK_SET_RATE_PARENT)
 
 static AUD_TDM_SCLK_POST_EN(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
 static AUD_TDM_SCLK_POST_EN(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
@@ -344,8 +371,9 @@ static AUD_TDM_SCLK_POST_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_tdm"#_name"_sclk",				\
 		.ops = &meson_clk_phase_ops,				\
-		.parent_names = (const char *[])			\
-		{ "aud_tdm"#_name"_sclk_post_en" },			\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&aud_tdm##_name##_sclk_post_en.hw		\
+		},							\
 		.num_parents = 1,					\
 		.flags = CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT,	\
 	},								\
@@ -359,19 +387,29 @@ static AUD_TDM_SCLK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
 static AUD_TDM_SCLK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
 static AUD_TDM_SCLK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
-static const char * const tdm_lrclk_parent_names[] = {
-	"aud_mst_a_lrclk", "aud_mst_b_lrclk", "aud_mst_c_lrclk",
-	"aud_mst_d_lrclk", "aud_mst_e_lrclk", "aud_mst_f_lrclk",
-	"aud_slv_lrclk0", "aud_slv_lrclk1", "aud_slv_lrclk2",
-	"aud_slv_lrclk3", "aud_slv_lrclk4", "aud_slv_lrclk5",
-	"aud_slv_lrclk6", "aud_slv_lrclk7", "aud_slv_lrclk8",
-	"aud_slv_lrclk9"
+static const struct clk_parent_data tdm_lrclk_parent_data[] = {
+	{ .hw = &aud_mst_a_lrclk.hw, },
+	{ .hw = &aud_mst_b_lrclk.hw, },
+	{ .hw = &aud_mst_c_lrclk.hw, },
+	{ .hw = &aud_mst_d_lrclk.hw, },
+	{ .hw = &aud_mst_e_lrclk.hw, },
+	{ .hw = &aud_mst_f_lrclk.hw, },
+	{ .fw_name = "slv_lrclk0", },
+	{ .fw_name = "slv_lrclk1", },
+	{ .fw_name = "slv_lrclk2", },
+	{ .fw_name = "slv_lrclk3", },
+	{ .fw_name = "slv_lrclk4", },
+	{ .fw_name = "slv_lrclk5", },
+	{ .fw_name = "slv_lrclk6", },
+	{ .fw_name = "slv_lrclk7", },
+	{ .fw_name = "slv_lrclk8", },
+	{ .fw_name = "slv_lrclk9", },
 };
 
 #define AUD_TDM_LRLCK(_name, _reg)		       \
 	AUD_MUX(tdm##_name##_lrclk, _reg, 0xf, 20,     \
 		CLK_MUX_ROUND_CLOSEST,		       \
-		tdm_lrclk_parent_names, 0)
+		tdm_lrclk_parent_data, 0)
 
 static AUD_TDM_LRLCK(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
 static AUD_TDM_LRLCK(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
@@ -386,39 +424,51 @@ static AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 	AUD_MUX(tdm_##_name, _reg, 0x7, _shift, 0, _parents,	\
 		CLK_SET_RATE_NO_REPARENT)
 
-static const char * const mclk_pad_ctrl_parent_names[] = {
-	"aud_mst_a_mclk", "aud_mst_b_mclk", "aud_mst_c_mclk",
-	"aud_mst_d_mclk", "aud_mst_e_mclk", "aud_mst_f_mclk",
+static const struct clk_parent_data mclk_pad_ctrl_parent_data[] = {
+	{ .hw = &aud_mst_a_mclk.hw },
+	{ .hw = &aud_mst_b_mclk.hw },
+	{ .hw = &aud_mst_c_mclk.hw },
+	{ .hw = &aud_mst_d_mclk.hw },
+	{ .hw = &aud_mst_e_mclk.hw },
+	{ .hw = &aud_mst_f_mclk.hw },
 };
 
 static AUD_TDM_PAD_CTRL(mclk_pad_0, AUDIO_MST_PAD_CTRL0, 0,
-			mclk_pad_ctrl_parent_names);
+			mclk_pad_ctrl_parent_data);
 static AUD_TDM_PAD_CTRL(mclk_pad_1, AUDIO_MST_PAD_CTRL0, 4,
-			mclk_pad_ctrl_parent_names);
-
-static const char * const lrclk_pad_ctrl_parent_names[] = {
-	"aud_mst_a_lrclk", "aud_mst_b_lrclk", "aud_mst_c_lrclk",
-	"aud_mst_d_lrclk", "aud_mst_e_lrclk", "aud_mst_f_lrclk",
+			mclk_pad_ctrl_parent_data);
+
+static const struct clk_parent_data lrclk_pad_ctrl_parent_data[] = {
+	{ .hw = &aud_mst_a_lrclk.hw },
+	{ .hw = &aud_mst_b_lrclk.hw },
+	{ .hw = &aud_mst_c_lrclk.hw },
+	{ .hw = &aud_mst_d_lrclk.hw },
+	{ .hw = &aud_mst_e_lrclk.hw },
+	{ .hw = &aud_mst_f_lrclk.hw },
 };
 
 static AUD_TDM_PAD_CTRL(lrclk_pad_0, AUDIO_MST_PAD_CTRL1, 16,
-			lrclk_pad_ctrl_parent_names);
+			lrclk_pad_ctrl_parent_data);
 static AUD_TDM_PAD_CTRL(lrclk_pad_1, AUDIO_MST_PAD_CTRL1, 20,
-			lrclk_pad_ctrl_parent_names);
+			lrclk_pad_ctrl_parent_data);
 static AUD_TDM_PAD_CTRL(lrclk_pad_2, AUDIO_MST_PAD_CTRL1, 24,
-			lrclk_pad_ctrl_parent_names);
-
-static const char * const sclk_pad_ctrl_parent_names[] = {
-	"aud_mst_a_sclk", "aud_mst_b_sclk", "aud_mst_c_sclk",
-	"aud_mst_d_sclk", "aud_mst_e_sclk", "aud_mst_f_sclk",
+			lrclk_pad_ctrl_parent_data);
+
+static const struct clk_parent_data sclk_pad_ctrl_parent_data[] = {
+	{ .hw = &aud_mst_a_sclk.hw },
+	{ .hw = &aud_mst_b_sclk.hw },
+	{ .hw = &aud_mst_c_sclk.hw },
+	{ .hw = &aud_mst_d_sclk.hw },
+	{ .hw = &aud_mst_e_sclk.hw },
+	{ .hw = &aud_mst_f_sclk.hw },
 };
 
 static AUD_TDM_PAD_CTRL(sclk_pad_0, AUDIO_MST_PAD_CTRL1, 0,
-			sclk_pad_ctrl_parent_names);
+			sclk_pad_ctrl_parent_data);
 static AUD_TDM_PAD_CTRL(sclk_pad_1, AUDIO_MST_PAD_CTRL1, 4,
-			sclk_pad_ctrl_parent_names);
+			sclk_pad_ctrl_parent_data);
 static AUD_TDM_PAD_CTRL(sclk_pad_2, AUDIO_MST_PAD_CTRL1, 8,
-			sclk_pad_ctrl_parent_names);
+			sclk_pad_ctrl_parent_data);
 
 /*
  * Array of all clocks provided by this provider
@@ -868,54 +918,6 @@ static int devm_clk_get_enable(struct device *dev, char *id)
 	return 0;
 }
 
-static int axg_register_clk_hw_input(struct device *dev,
-				     const char *name)
-{
-	char *clk_name;
-	struct clk_hw *hw;
-	int err = 0;
-
-	clk_name = kasprintf(GFP_KERNEL, "aud_%s", name);
-	if (!clk_name)
-		return -ENOMEM;
-
-	hw = meson_clk_hw_register_input(dev, name, clk_name, 0);
-	if (IS_ERR(hw)) {
-		/* It is ok if an input clock is missing */
-		if (PTR_ERR(hw) == -ENOENT) {
-			dev_dbg(dev, "%s not provided", name);
-		} else {
-			err = PTR_ERR(hw);
-			if (err != -EPROBE_DEFER)
-				dev_err(dev, "failed to get %s clock", name);
-		}
-	}
-
-	kfree(clk_name);
-	return err;
-}
-
-static int axg_register_clk_hw_inputs(struct device *dev,
-				      const char *basename,
-				      unsigned int count)
-{
-	char *name;
-	int i, ret;
-
-	for (i = 0; i < count; i++) {
-		name = kasprintf(GFP_KERNEL, "%s%d", basename, i);
-		if (!name)
-			return -ENOMEM;
-
-		ret = axg_register_clk_hw_input(dev, name);
-		kfree(name);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -963,29 +965,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Register the peripheral input clock */
-	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	/* Register optional input master clocks */
-	ret = axg_register_clk_hw_inputs(dev, "mst_in",
-					 AUD_MST_IN_COUNT);
-	if (ret)
-		return ret;
-
-	/* Register optional input slave sclks */
-	ret = axg_register_clk_hw_inputs(dev, "slv_sclk",
-					 AUD_SLV_SCLK_COUNT);
-	if (ret)
-		return ret;
-
-	/* Register optional input slave lrclks */
-	ret = axg_register_clk_hw_inputs(dev, "slv_lrclk",
-					 AUD_SLV_LRCLK_COUNT);
-	if (ret)
-		return ret;
-
 	/* Populate regmap for the regmap backed clocks */
 	for (i = 0; i < ARRAY_SIZE(aud_clk_regmaps); i++)
 		aud_clk_regmaps[i]->map = map;
-- 
2.17.1


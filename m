Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE71C4A56
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2019 11:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfJBJPo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Oct 2019 05:15:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33445 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbfJBJPm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 05:15:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so18750444wrs.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2019 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MgsmOC4nEcThQdBTIChTw54KnYFVA9q6ApDvh2Xu4ek=;
        b=Lw8WRGtbTG50lqfgWsnLKuVEgtn8MQdlF0Cy6XuoZh7PKyQHeE0jRHHYcN1Yg0AsNp
         byotfUN5rpdZFhFb97bHrOt6x9QhJv/z84gbebeOE2EAr60vvO60cVD5JzHPwp1NEECX
         AJzxUvKZC2vG2JZMEXdD04WHco85T9Kc3KI0/VxXa4XgdsEOAJtFd84WRnfxFC0Yp2h3
         ctQlWeBz/MRbgLZDPvb1u4FB3W16UCPFZzi3Rp1Pz2tipt2OHr1KY+PpYBbCKVigKc2a
         0yb9wTpsZuL2kEUYStK7KluoLCDZ1TjbyT8ePOLLIWvFnRbcLpZVSpsWSyq2tW0o3x0x
         bpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgsmOC4nEcThQdBTIChTw54KnYFVA9q6ApDvh2Xu4ek=;
        b=WLd0NdTbRGmTMS8ongjNFL2WKxYjI088b/BVQPsp7bV2+EXG36/78UYc4I6gH18PLd
         PImZOPkTMZwzZRMnkPNThfOrTwzj2JzUxr8oRiLjC4vyPyKZufL7MBxqbgp4aEMFzmI2
         kQrrvB3X7g9vIBrwjp4zrkWGysnUk5dAPUc4uxHuxnUu1uZ9v9R5CHLOC41Br/45UC6p
         XRvhWuPI9bIhm/RN2ISkQ8Hk1dRknnzbvM9y0KVRKtmv4MU3tuL30cOyS/LfHVBWZbgs
         8BHWKmEC3qvKDbpaVAkbJKBWhcd3joJFuUiqVxhi7mpCI5o4nPCedPEuuX4cQF5tUeN+
         cupw==
X-Gm-Message-State: APjAAAUcT51F+IW03Z6ksuqfjtl4XYdj8GTDJyOiAwsxeH8JB7iIaIUl
        T/H52we33/lNfqpG3Xn9l5pgfw==
X-Google-Smtp-Source: APXvYqyfIlXnk1j456dAIlng5DCvOjfcYhEAVcPt3s+NUiTj3negi+2jqaD76yY3YeNJa9j6gye1Gg==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr1964857wro.288.1570007737635;
        Wed, 02 Oct 2019 02:15:37 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r13sm32913737wrn.0.2019.10.02.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:15:37 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: meson: axg-audio: prepare sm1 addition
Date:   Wed,  2 Oct 2019 11:15:27 +0200
Message-Id: <20191002091529.17112-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002091529.17112-1-jbrunet@baylibre.com>
References: <20191002091529.17112-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rearrange the macro definition of the clocks of the axg-audio
controller. Also, the sm1 variant will feature tiny modification
of different blocks in this controller. Because of that, we need
to fallback to the old way of defining parent for some of the
clocks, using signal name.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 1467 ++++++++++++++++++---------------
 1 file changed, 782 insertions(+), 685 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 4b34601342bb..ce8836776d1c 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -20,8 +20,7 @@
 #include "clk-phase.h"
 #include "sclk-div.h"
 
-#define AUD_GATE(_name, _reg, _bit, _phws, _iflags)			\
-struct clk_regmap aud_##_name = {					\
+#define AUD_GATE(_name, _reg, _bit, _pname, _iflags) {			\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
 		.bit_idx = (_bit),					\
@@ -29,14 +28,13 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_hws = (const struct clk_hw *[]) { &_phws.hw },	\
+		.parent_names = (const char *[]){ #_pname },		\
 		.num_parents = 1,					\
 		.flags = CLK_DUTY_CYCLE_PARENT | (_iflags),		\
 	},								\
 }
 
-#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags)	\
-struct clk_regmap aud_##_name = {					\
+#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags) {	\
 	.data = &(struct clk_regmap_mux_data){				\
 		.offset = (_reg),					\
 		.mask = (_mask),					\
@@ -52,8 +50,7 @@ struct clk_regmap aud_##_name = {					\
 	},								\
 }
 
-#define AUD_DIV(_name, _reg, _shift, _width, _dflags, _phws, _iflags)	\
-struct clk_regmap aud_##_name = {					\
+#define AUD_DIV(_name, _reg, _shift, _width, _dflags, _pname, _iflags) { \
 	.data = &(struct clk_regmap_div_data){				\
 		.offset = (_reg),					\
 		.shift = (_shift),					\
@@ -63,14 +60,13 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data){				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_divider_ops,				\
-		.parent_hws = (const struct clk_hw *[]) { &_phws.hw },	\
+		.parent_names = (const char *[]){ #_pname },		\
 		.num_parents = 1,					\
 		.flags = (_iflags),					\
 	},								\
 }
 
-#define AUD_PCLK_GATE(_name, _bit)				\
-struct clk_regmap aud_##_name = {					\
+#define AUD_PCLK_GATE(_name, _bit) {					\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (AUDIO_CLK_GATE_EN),				\
 		.bit_idx = (_bit),					\
@@ -84,116 +80,9 @@ struct clk_regmap aud_##_name = {					\
 		.num_parents = 1,					\
 	},								\
 }
-/* Audio peripheral clocks */
-static AUD_PCLK_GATE(ddr_arb,	   0);
-static AUD_PCLK_GATE(pdm,	   1);
-static AUD_PCLK_GATE(tdmin_a,	   2);
-static AUD_PCLK_GATE(tdmin_b,	   3);
-static AUD_PCLK_GATE(tdmin_c,	   4);
-static AUD_PCLK_GATE(tdmin_lb,	   5);
-static AUD_PCLK_GATE(tdmout_a,	   6);
-static AUD_PCLK_GATE(tdmout_b,	   7);
-static AUD_PCLK_GATE(tdmout_c,	   8);
-static AUD_PCLK_GATE(frddr_a,	   9);
-static AUD_PCLK_GATE(frddr_b,	   10);
-static AUD_PCLK_GATE(frddr_c,	   11);
-static AUD_PCLK_GATE(toddr_a,	   12);
-static AUD_PCLK_GATE(toddr_b,	   13);
-static AUD_PCLK_GATE(toddr_c,	   14);
-static AUD_PCLK_GATE(loopback,	   15);
-static AUD_PCLK_GATE(spdifin,	   16);
-static AUD_PCLK_GATE(spdifout,	   17);
-static AUD_PCLK_GATE(resample,	   18);
-static AUD_PCLK_GATE(power_detect, 19);
-static AUD_PCLK_GATE(spdifout_b,   21);
-
-/* Audio Master Clocks */
-static const struct clk_parent_data mst_mux_parent_data[] = {
-	{ .fw_name = "mst_in0", },
-	{ .fw_name = "mst_in1", },
-	{ .fw_name = "mst_in2", },
-	{ .fw_name = "mst_in3", },
-	{ .fw_name = "mst_in4", },
-	{ .fw_name = "mst_in5", },
-	{ .fw_name = "mst_in6", },
-	{ .fw_name = "mst_in7", },
-};
-
-#define AUD_MST_MUX(_name, _reg, _flag)				\
-	AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,		\
-		mst_mux_parent_data, 0)
-
-#define AUD_MST_MCLK_MUX(_name, _reg)				\
-	AUD_MST_MUX(_name, _reg, CLK_MUX_ROUND_CLOSEST)
-
-#define AUD_MST_SYS_MUX(_name, _reg)				\
-	AUD_MST_MUX(_name, _reg, 0)
-
-static AUD_MST_MCLK_MUX(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
-static AUD_MST_MCLK_MUX(mst_b_mclk,   AUDIO_MCLK_B_CTRL);
-static AUD_MST_MCLK_MUX(mst_c_mclk,   AUDIO_MCLK_C_CTRL);
-static AUD_MST_MCLK_MUX(mst_d_mclk,   AUDIO_MCLK_D_CTRL);
-static AUD_MST_MCLK_MUX(mst_e_mclk,   AUDIO_MCLK_E_CTRL);
-static AUD_MST_MCLK_MUX(mst_f_mclk,   AUDIO_MCLK_F_CTRL);
-static AUD_MST_MCLK_MUX(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
-static AUD_MST_MCLK_MUX(pdm_dclk,     AUDIO_CLK_PDMIN_CTRL0);
-static AUD_MST_SYS_MUX(spdifin_clk,   AUDIO_CLK_SPDIFIN_CTRL);
-static AUD_MST_SYS_MUX(pdm_sysclk,    AUDIO_CLK_PDMIN_CTRL1);
-static AUD_MST_MCLK_MUX(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
-
-#define AUD_MST_DIV(_name, _reg, _flag)				\
-	AUD_DIV(_name##_div, _reg, 0, 16, _flag,		\
-		    aud_##_name##_sel, CLK_SET_RATE_PARENT)	\
-
-#define AUD_MST_MCLK_DIV(_name, _reg)				\
-	AUD_MST_DIV(_name, _reg, CLK_DIVIDER_ROUND_CLOSEST)
-
-#define AUD_MST_SYS_DIV(_name, _reg)				\
-	AUD_MST_DIV(_name, _reg, 0)
-
-static AUD_MST_MCLK_DIV(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
-static AUD_MST_MCLK_DIV(mst_b_mclk,   AUDIO_MCLK_B_CTRL);
-static AUD_MST_MCLK_DIV(mst_c_mclk,   AUDIO_MCLK_C_CTRL);
-static AUD_MST_MCLK_DIV(mst_d_mclk,   AUDIO_MCLK_D_CTRL);
-static AUD_MST_MCLK_DIV(mst_e_mclk,   AUDIO_MCLK_E_CTRL);
-static AUD_MST_MCLK_DIV(mst_f_mclk,   AUDIO_MCLK_F_CTRL);
-static AUD_MST_MCLK_DIV(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
-static AUD_MST_MCLK_DIV(pdm_dclk,     AUDIO_CLK_PDMIN_CTRL0);
-static AUD_MST_SYS_DIV(spdifin_clk,   AUDIO_CLK_SPDIFIN_CTRL);
-static AUD_MST_SYS_DIV(pdm_sysclk,    AUDIO_CLK_PDMIN_CTRL1);
-static AUD_MST_MCLK_DIV(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
-
-#define AUD_MST_MCLK_GATE(_name, _reg)				\
-	AUD_GATE(_name, _reg, 31,  aud_##_name##_div,		\
-		 CLK_SET_RATE_PARENT)
-
-static AUD_MST_MCLK_GATE(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
-static AUD_MST_MCLK_GATE(mst_b_mclk,   AUDIO_MCLK_B_CTRL);
-static AUD_MST_MCLK_GATE(mst_c_mclk,   AUDIO_MCLK_C_CTRL);
-static AUD_MST_MCLK_GATE(mst_d_mclk,   AUDIO_MCLK_D_CTRL);
-static AUD_MST_MCLK_GATE(mst_e_mclk,   AUDIO_MCLK_E_CTRL);
-static AUD_MST_MCLK_GATE(mst_f_mclk,   AUDIO_MCLK_F_CTRL);
-static AUD_MST_MCLK_GATE(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
-static AUD_MST_MCLK_GATE(spdifin_clk,  AUDIO_CLK_SPDIFIN_CTRL);
-static AUD_MST_MCLK_GATE(pdm_dclk,     AUDIO_CLK_PDMIN_CTRL0);
-static AUD_MST_MCLK_GATE(pdm_sysclk,   AUDIO_CLK_PDMIN_CTRL1);
-static AUD_MST_MCLK_GATE(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
-
-/* Sample Clocks */
-#define AUD_MST_SCLK_PRE_EN(_name, _reg)			\
-	AUD_GATE(mst_##_name##_sclk_pre_en, _reg, 31,		\
-		 aud_mst_##_name##_mclk, 0)
-
-static AUD_MST_SCLK_PRE_EN(a, AUDIO_MST_A_SCLK_CTRL0);
-static AUD_MST_SCLK_PRE_EN(b, AUDIO_MST_B_SCLK_CTRL0);
-static AUD_MST_SCLK_PRE_EN(c, AUDIO_MST_C_SCLK_CTRL0);
-static AUD_MST_SCLK_PRE_EN(d, AUDIO_MST_D_SCLK_CTRL0);
-static AUD_MST_SCLK_PRE_EN(e, AUDIO_MST_E_SCLK_CTRL0);
-static AUD_MST_SCLK_PRE_EN(f, AUDIO_MST_F_SCLK_CTRL0);
 
 #define AUD_SCLK_DIV(_name, _reg, _div_shift, _div_width,		\
-			 _hi_shift, _hi_width, _phws, _iflags)		\
-struct clk_regmap aud_##_name = {					\
+		     _hi_shift, _hi_width, _pname, _iflags) {		\
 	.data = &(struct meson_sclk_div_data) {				\
 		.div = {						\
 			.reg_off = (_reg),				\
@@ -209,38 +98,14 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &meson_sclk_div_ops,				\
-		.parent_hws = (const struct clk_hw *[]) { &_phws.hw },	\
+		.parent_names = (const char *[]){ #_pname },		\
 		.num_parents = 1,					\
 		.flags = (_iflags),					\
 	},								\
 }
 
-#define AUD_MST_SCLK_DIV(_name, _reg)					\
-	AUD_SCLK_DIV(mst_##_name##_sclk_div, _reg, 20, 10, 0, 0,	\
-		     aud_mst_##_name##_sclk_pre_en,			\
-		     CLK_SET_RATE_PARENT)
-
-static AUD_MST_SCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
-static AUD_MST_SCLK_DIV(b, AUDIO_MST_B_SCLK_CTRL0);
-static AUD_MST_SCLK_DIV(c, AUDIO_MST_C_SCLK_CTRL0);
-static AUD_MST_SCLK_DIV(d, AUDIO_MST_D_SCLK_CTRL0);
-static AUD_MST_SCLK_DIV(e, AUDIO_MST_E_SCLK_CTRL0);
-static AUD_MST_SCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
-
-#define AUD_MST_SCLK_POST_EN(_name, _reg)				\
-	AUD_GATE(mst_##_name##_sclk_post_en, _reg, 30,			\
-		 aud_mst_##_name##_sclk_div, CLK_SET_RATE_PARENT)
-
-static AUD_MST_SCLK_POST_EN(a, AUDIO_MST_A_SCLK_CTRL0);
-static AUD_MST_SCLK_POST_EN(b, AUDIO_MST_B_SCLK_CTRL0);
-static AUD_MST_SCLK_POST_EN(c, AUDIO_MST_C_SCLK_CTRL0);
-static AUD_MST_SCLK_POST_EN(d, AUDIO_MST_D_SCLK_CTRL0);
-static AUD_MST_SCLK_POST_EN(e, AUDIO_MST_E_SCLK_CTRL0);
-static AUD_MST_SCLK_POST_EN(f, AUDIO_MST_F_SCLK_CTRL0);
-
 #define AUD_TRIPHASE(_name, _reg, _width, _shift0, _shift1, _shift2,	\
-			 _phws, _iflags)				\
-struct clk_regmap aud_##_name = {					\
+		     _pname, _iflags) {					\
 	.data = &(struct meson_clk_triphase_data) {			\
 		.ph0 = {						\
 			.reg_off = (_reg),				\
@@ -261,52 +126,91 @@ struct clk_regmap aud_##_name = {					\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &meson_clk_triphase_ops,				\
-		.parent_hws = (const struct clk_hw *[]) { &_phws.hw },	\
+		.parent_names = (const char *[]){ #_pname },		\
 		.num_parents = 1,					\
 		.flags = CLK_DUTY_CYCLE_PARENT | (_iflags),		\
 	},								\
 }
 
+#define AUD_PHASE(_name, _reg, _width, _shift, _pname, _iflags) {	\
+	.data = &(struct meson_clk_phase_data) {			\
+		.ph = {							\
+			.reg_off = (_reg),				\
+			.shift   = (_shift),				\
+			.width   = (_width),				\
+		},							\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = "aud_"#_name,					\
+		.ops = &meson_clk_phase_ops,				\
+		.parent_names = (const char *[]){ #_pname },		\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
+/* Audio Master Clocks */
+static const struct clk_parent_data mst_mux_parent_data[] = {
+	{ .fw_name = "mst_in0", },
+	{ .fw_name = "mst_in1", },
+	{ .fw_name = "mst_in2", },
+	{ .fw_name = "mst_in3", },
+	{ .fw_name = "mst_in4", },
+	{ .fw_name = "mst_in5", },
+	{ .fw_name = "mst_in6", },
+	{ .fw_name = "mst_in7", },
+};
+
+#define AUD_MST_MUX(_name, _reg, _flag)					\
+	AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,			\
+		mst_mux_parent_data, 0)
+#define AUD_MST_DIV(_name, _reg, _flag)					\
+	AUD_DIV(_name##_div, _reg, 0, 16, _flag,			\
+		aud_##_name##_sel, CLK_SET_RATE_PARENT)
+#define AUD_MST_MCLK_GATE(_name, _reg)					\
+	AUD_GATE(_name, _reg, 31, aud_##_name##_div,			\
+		 CLK_SET_RATE_PARENT)
+
+#define AUD_MST_MCLK_MUX(_name, _reg)					\
+	AUD_MST_MUX(_name, _reg, CLK_MUX_ROUND_CLOSEST)
+#define AUD_MST_MCLK_DIV(_name, _reg)					\
+	AUD_MST_DIV(_name, _reg, CLK_DIVIDER_ROUND_CLOSEST)
+
+#define AUD_MST_SYS_MUX(_name, _reg)					\
+	AUD_MST_MUX(_name, _reg, 0)
+#define AUD_MST_SYS_DIV(_name, _reg)					\
+	AUD_MST_DIV(_name, _reg, 0)
+
+/* Sample Clocks */
+#define AUD_MST_SCLK_PRE_EN(_name, _reg)				\
+	AUD_GATE(mst_##_name##_sclk_pre_en, _reg, 31,			\
+		 aud_mst_##_name##_mclk, 0)
+#define AUD_MST_SCLK_DIV(_name, _reg)					\
+	AUD_SCLK_DIV(mst_##_name##_sclk_div, _reg, 20, 10, 0, 0,	\
+		     aud_mst_##_name##_sclk_pre_en,			\
+		     CLK_SET_RATE_PARENT)
+#define AUD_MST_SCLK_POST_EN(_name, _reg)				\
+	AUD_GATE(mst_##_name##_sclk_post_en, _reg, 30,			\
+		 aud_mst_##_name##_sclk_div, CLK_SET_RATE_PARENT)
 #define AUD_MST_SCLK(_name, _reg)					\
 	AUD_TRIPHASE(mst_##_name##_sclk, _reg, 1, 0, 2, 4,		\
 		     aud_mst_##_name##_sclk_post_en, CLK_SET_RATE_PARENT)
 
-static AUD_MST_SCLK(a, AUDIO_MST_A_SCLK_CTRL1);
-static AUD_MST_SCLK(b, AUDIO_MST_B_SCLK_CTRL1);
-static AUD_MST_SCLK(c, AUDIO_MST_C_SCLK_CTRL1);
-static AUD_MST_SCLK(d, AUDIO_MST_D_SCLK_CTRL1);
-static AUD_MST_SCLK(e, AUDIO_MST_E_SCLK_CTRL1);
-static AUD_MST_SCLK(f, AUDIO_MST_F_SCLK_CTRL1);
-
 #define AUD_MST_LRCLK_DIV(_name, _reg)					\
 	AUD_SCLK_DIV(mst_##_name##_lrclk_div, _reg, 0, 10, 10, 10,	\
-		     aud_mst_##_name##_sclk_post_en, 0)			\
-
-static AUD_MST_LRCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
-static AUD_MST_LRCLK_DIV(b, AUDIO_MST_B_SCLK_CTRL0);
-static AUD_MST_LRCLK_DIV(c, AUDIO_MST_C_SCLK_CTRL0);
-static AUD_MST_LRCLK_DIV(d, AUDIO_MST_D_SCLK_CTRL0);
-static AUD_MST_LRCLK_DIV(e, AUDIO_MST_E_SCLK_CTRL0);
-static AUD_MST_LRCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
-
+		     aud_mst_##_name##_sclk_post_en, 0)
 #define AUD_MST_LRCLK(_name, _reg)					\
 	AUD_TRIPHASE(mst_##_name##_lrclk, _reg, 1, 1, 3, 5,		\
 		     aud_mst_##_name##_lrclk_div, CLK_SET_RATE_PARENT)
 
-static AUD_MST_LRCLK(a, AUDIO_MST_A_SCLK_CTRL1);
-static AUD_MST_LRCLK(b, AUDIO_MST_B_SCLK_CTRL1);
-static AUD_MST_LRCLK(c, AUDIO_MST_C_SCLK_CTRL1);
-static AUD_MST_LRCLK(d, AUDIO_MST_D_SCLK_CTRL1);
-static AUD_MST_LRCLK(e, AUDIO_MST_E_SCLK_CTRL1);
-static AUD_MST_LRCLK(f, AUDIO_MST_F_SCLK_CTRL1);
-
+/* TDM bit clock sources */
 static const struct clk_parent_data tdm_sclk_parent_data[] = {
-	{ .hw = &aud_mst_a_sclk.hw, },
-	{ .hw = &aud_mst_b_sclk.hw, },
-	{ .hw = &aud_mst_c_sclk.hw, },
-	{ .hw = &aud_mst_d_sclk.hw, },
-	{ .hw = &aud_mst_e_sclk.hw, },
-	{ .hw = &aud_mst_f_sclk.hw, },
+	{ .name = "aud_mst_a_sclk", .index = -1, },
+	{ .name = "aud_mst_b_sclk", .index = -1, },
+	{ .name = "aud_mst_c_sclk", .index = -1, },
+	{ .name = "aud_mst_d_sclk", .index = -1, },
+	{ .name = "aud_mst_e_sclk", .index = -1, },
+	{ .name = "aud_mst_f_sclk", .index = -1, },
 	{ .fw_name = "slv_sclk0", },
 	{ .fw_name = "slv_sclk1", },
 	{ .fw_name = "slv_sclk2", },
@@ -319,78 +223,14 @@ static const struct clk_parent_data tdm_sclk_parent_data[] = {
 	{ .fw_name = "slv_sclk9", },
 };
 
-#define AUD_TDM_SCLK_MUX(_name, _reg)				\
-	AUD_MUX(tdm##_name##_sclk_sel, _reg, 0xf, 24,		\
-		    CLK_MUX_ROUND_CLOSEST,			\
-		    tdm_sclk_parent_data, 0)
-
-static AUD_TDM_SCLK_MUX(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
-static AUD_TDM_SCLK_MUX(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
-static AUD_TDM_SCLK_MUX(in_c,  AUDIO_CLK_TDMIN_C_CTRL);
-static AUD_TDM_SCLK_MUX(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static AUD_TDM_SCLK_MUX(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static AUD_TDM_SCLK_MUX(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static AUD_TDM_SCLK_MUX(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
-
-#define AUD_TDM_SCLK_PRE_EN(_name, _reg)				\
-	AUD_GATE(tdm##_name##_sclk_pre_en, _reg, 31,			\
-		 aud_tdm##_name##_sclk_sel, CLK_SET_RATE_PARENT)
-
-static AUD_TDM_SCLK_PRE_EN(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
-static AUD_TDM_SCLK_PRE_EN(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
-static AUD_TDM_SCLK_PRE_EN(in_c,  AUDIO_CLK_TDMIN_C_CTRL);
-static AUD_TDM_SCLK_PRE_EN(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static AUD_TDM_SCLK_PRE_EN(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static AUD_TDM_SCLK_PRE_EN(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static AUD_TDM_SCLK_PRE_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
-
-#define AUD_TDM_SCLK_POST_EN(_name, _reg)				\
-	AUD_GATE(tdm##_name##_sclk_post_en, _reg, 30,			\
-		 aud_tdm##_name##_sclk_pre_en, CLK_SET_RATE_PARENT)
-
-static AUD_TDM_SCLK_POST_EN(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
-static AUD_TDM_SCLK_POST_EN(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
-static AUD_TDM_SCLK_POST_EN(in_c,  AUDIO_CLK_TDMIN_C_CTRL);
-static AUD_TDM_SCLK_POST_EN(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static AUD_TDM_SCLK_POST_EN(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static AUD_TDM_SCLK_POST_EN(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static AUD_TDM_SCLK_POST_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
-
-#define AUD_TDM_SCLK(_name, _reg)					\
-	struct clk_regmap aud_tdm##_name##_sclk = {			\
-	.data = &(struct meson_clk_phase_data) {			\
-		.ph = {							\
-			.reg_off = (_reg),				\
-			.shift   = 29,					\
-			.width   = 1,					\
-		},							\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = "aud_tdm"#_name"_sclk",				\
-		.ops = &meson_clk_phase_ops,				\
-		.parent_hws = (const struct clk_hw *[]) {		\
-			&aud_tdm##_name##_sclk_post_en.hw		\
-		},							\
-		.num_parents = 1,					\
-		.flags = CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT,	\
-	},								\
-}
-
-static AUD_TDM_SCLK(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
-static AUD_TDM_SCLK(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
-static AUD_TDM_SCLK(in_c,  AUDIO_CLK_TDMIN_C_CTRL);
-static AUD_TDM_SCLK(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static AUD_TDM_SCLK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static AUD_TDM_SCLK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static AUD_TDM_SCLK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
-
+/* TDM sample clock sources */
 static const struct clk_parent_data tdm_lrclk_parent_data[] = {
-	{ .hw = &aud_mst_a_lrclk.hw, },
-	{ .hw = &aud_mst_b_lrclk.hw, },
-	{ .hw = &aud_mst_c_lrclk.hw, },
-	{ .hw = &aud_mst_d_lrclk.hw, },
-	{ .hw = &aud_mst_e_lrclk.hw, },
-	{ .hw = &aud_mst_f_lrclk.hw, },
+	{ .name = "aud_mst_a_lrclk", .index = -1, },
+	{ .name = "aud_mst_b_lrclk", .index = -1, },
+	{ .name = "aud_mst_c_lrclk", .index = -1, },
+	{ .name = "aud_mst_d_lrclk", .index = -1, },
+	{ .name = "aud_mst_e_lrclk", .index = -1, },
+	{ .name = "aud_mst_f_lrclk", .index = -1, },
 	{ .fw_name = "slv_lrclk0", },
 	{ .fw_name = "slv_lrclk1", },
 	{ .fw_name = "slv_lrclk2", },
@@ -403,69 +243,326 @@ static const struct clk_parent_data tdm_lrclk_parent_data[] = {
 	{ .fw_name = "slv_lrclk9", },
 };
 
-#define AUD_TDM_LRLCK(_name, _reg)			\
-	AUD_MUX(tdm##_name##_lrclk, _reg, 0xf, 20,	\
-		CLK_MUX_ROUND_CLOSEST,			\
-		tdm_lrclk_parent_data, 0)
-
-static AUD_TDM_LRLCK(in_a,  AUDIO_CLK_TDMIN_A_CTRL);
-static AUD_TDM_LRLCK(in_b,  AUDIO_CLK_TDMIN_B_CTRL);
-static AUD_TDM_LRLCK(in_c,  AUDIO_CLK_TDMIN_C_CTRL);
-static AUD_TDM_LRLCK(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static AUD_TDM_LRLCK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static AUD_TDM_LRLCK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+#define AUD_TDM_SCLK_MUX(_name, _reg)					\
+	AUD_MUX(tdm##_name##_sclk_sel, _reg, 0xf, 24,			\
+		CLK_MUX_ROUND_CLOSEST, tdm_sclk_parent_data, 0)
+#define AUD_TDM_SCLK_PRE_EN(_name, _reg)				\
+	AUD_GATE(tdm##_name##_sclk_pre_en, _reg, 31,			\
+		 aud_tdm##_name##_sclk_sel, CLK_SET_RATE_PARENT)
+#define AUD_TDM_SCLK_POST_EN(_name, _reg)				\
+	AUD_GATE(tdm##_name##_sclk_post_en, _reg, 30,			\
+		 aud_tdm##_name##_sclk_pre_en, CLK_SET_RATE_PARENT)
+#define AUD_TDM_SCLK(_name, _reg)					\
+	AUD_PHASE(tdm##_name##_sclk, _reg, 1, 29,			\
+		  aud_tdm##_name##_sclk_post_en,			\
+		  CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)
 
-/* G12a Pad control */
-#define AUD_TDM_PAD_CTRL(_name, _reg, _shift, _parents)		\
-	AUD_MUX(tdm_##_name, _reg, 0x7, _shift, 0, _parents,	\
-		CLK_SET_RATE_NO_REPARENT)
+#define AUD_TDM_LRLCK(_name, _reg)					\
+	AUD_MUX(tdm##_name##_lrclk, _reg, 0xf, 20,			\
+		CLK_MUX_ROUND_CLOSEST, tdm_lrclk_parent_data, 0)
 
+/* Pad master clock sources */
 static const struct clk_parent_data mclk_pad_ctrl_parent_data[] = {
-	{ .hw = &aud_mst_a_mclk.hw },
-	{ .hw = &aud_mst_b_mclk.hw },
-	{ .hw = &aud_mst_c_mclk.hw },
-	{ .hw = &aud_mst_d_mclk.hw },
-	{ .hw = &aud_mst_e_mclk.hw },
-	{ .hw = &aud_mst_f_mclk.hw },
+	{ .name = "aud_mst_a_mclk", .index = -1,  },
+	{ .name = "aud_mst_b_mclk", .index = -1,  },
+	{ .name = "aud_mst_c_mclk", .index = -1,  },
+	{ .name = "aud_mst_d_mclk", .index = -1,  },
+	{ .name = "aud_mst_e_mclk", .index = -1,  },
+	{ .name = "aud_mst_f_mclk", .index = -1,  },
 };
 
-static AUD_TDM_PAD_CTRL(mclk_pad_0, AUDIO_MST_PAD_CTRL0, 0,
-			mclk_pad_ctrl_parent_data);
-static AUD_TDM_PAD_CTRL(mclk_pad_1, AUDIO_MST_PAD_CTRL0, 4,
-			mclk_pad_ctrl_parent_data);
+/* Pad bit clock sources */
+static const struct clk_parent_data sclk_pad_ctrl_parent_data[] = {
+	{ .name = "aud_mst_a_sclk", .index = -1, },
+	{ .name = "aud_mst_b_sclk", .index = -1, },
+	{ .name = "aud_mst_c_sclk", .index = -1, },
+	{ .name = "aud_mst_d_sclk", .index = -1, },
+	{ .name = "aud_mst_e_sclk", .index = -1, },
+	{ .name = "aud_mst_f_sclk", .index = -1, },
+};
 
+/* Pad sample clock sources */
 static const struct clk_parent_data lrclk_pad_ctrl_parent_data[] = {
-	{ .hw = &aud_mst_a_lrclk.hw },
-	{ .hw = &aud_mst_b_lrclk.hw },
-	{ .hw = &aud_mst_c_lrclk.hw },
-	{ .hw = &aud_mst_d_lrclk.hw },
-	{ .hw = &aud_mst_e_lrclk.hw },
-	{ .hw = &aud_mst_f_lrclk.hw },
+	{ .name = "aud_mst_a_lrclk", .index = -1, },
+	{ .name = "aud_mst_b_lrclk", .index = -1, },
+	{ .name = "aud_mst_c_lrclk", .index = -1, },
+	{ .name = "aud_mst_d_lrclk", .index = -1, },
+	{ .name = "aud_mst_e_lrclk", .index = -1, },
+	{ .name = "aud_mst_f_lrclk", .index = -1, },
 };
 
-static AUD_TDM_PAD_CTRL(lrclk_pad_0, AUDIO_MST_PAD_CTRL1, 16,
-			lrclk_pad_ctrl_parent_data);
-static AUD_TDM_PAD_CTRL(lrclk_pad_1, AUDIO_MST_PAD_CTRL1, 20,
-			lrclk_pad_ctrl_parent_data);
-static AUD_TDM_PAD_CTRL(lrclk_pad_2, AUDIO_MST_PAD_CTRL1, 24,
-			lrclk_pad_ctrl_parent_data);
-
-static const struct clk_parent_data sclk_pad_ctrl_parent_data[] = {
-	{ .hw = &aud_mst_a_sclk.hw },
-	{ .hw = &aud_mst_b_sclk.hw },
-	{ .hw = &aud_mst_c_sclk.hw },
-	{ .hw = &aud_mst_d_sclk.hw },
-	{ .hw = &aud_mst_e_sclk.hw },
-	{ .hw = &aud_mst_f_sclk.hw },
-};
+#define AUD_TDM_PAD_CTRL(_name, _reg, _shift, _parents)		\
+	AUD_MUX(tdm_##_name, _reg, 0x7, _shift, 0, _parents,	\
+		CLK_SET_RATE_NO_REPARENT)
 
-static AUD_TDM_PAD_CTRL(sclk_pad_0, AUDIO_MST_PAD_CTRL1, 0,
-			sclk_pad_ctrl_parent_data);
-static AUD_TDM_PAD_CTRL(sclk_pad_1, AUDIO_MST_PAD_CTRL1, 4,
-			sclk_pad_ctrl_parent_data);
-static AUD_TDM_PAD_CTRL(sclk_pad_2, AUDIO_MST_PAD_CTRL1, 8,
-			sclk_pad_ctrl_parent_data);
+/* Common Clocks */
+static struct clk_regmap ddr_arb	= AUD_PCLK_GATE(ddr_arb, 0);
+static struct clk_regmap pdm		= AUD_PCLK_GATE(pdm, 1);
+static struct clk_regmap tdmin_a	= AUD_PCLK_GATE(tdmin_a, 2);
+static struct clk_regmap tdmin_b	= AUD_PCLK_GATE(tdmin_b, 3);
+static struct clk_regmap tdmin_c	= AUD_PCLK_GATE(tdmin_c, 4);
+static struct clk_regmap tdmin_lb	= AUD_PCLK_GATE(tdmin_lb, 5);
+static struct clk_regmap tdmout_a	= AUD_PCLK_GATE(tdmout_a, 6);
+static struct clk_regmap tdmout_b	= AUD_PCLK_GATE(tdmout_b, 7);
+static struct clk_regmap tdmout_c	= AUD_PCLK_GATE(tdmout_c, 8);
+static struct clk_regmap frddr_a	= AUD_PCLK_GATE(frddr_a, 9);
+static struct clk_regmap frddr_b	= AUD_PCLK_GATE(frddr_b, 10);
+static struct clk_regmap frddr_c	= AUD_PCLK_GATE(frddr_c, 11);
+static struct clk_regmap toddr_a	= AUD_PCLK_GATE(toddr_a, 12);
+static struct clk_regmap toddr_b	= AUD_PCLK_GATE(toddr_b, 13);
+static struct clk_regmap toddr_c	= AUD_PCLK_GATE(toddr_c, 14);
+static struct clk_regmap loopback	= AUD_PCLK_GATE(loopback, 15);
+static struct clk_regmap spdifin	= AUD_PCLK_GATE(spdifin, 16);
+static struct clk_regmap spdifout	= AUD_PCLK_GATE(spdifout, 17);
+static struct clk_regmap resample	= AUD_PCLK_GATE(resample, 18);
+static struct clk_regmap power_detect	= AUD_PCLK_GATE(power_detect, 19);
+
+static struct clk_regmap spdifout_clk_sel =
+	AUD_MST_MCLK_MUX(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
+static struct clk_regmap pdm_dclk_sel =
+	AUD_MST_MCLK_MUX(pdm_dclk, AUDIO_CLK_PDMIN_CTRL0);
+static struct clk_regmap spdifin_clk_sel =
+	AUD_MST_SYS_MUX(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+static struct clk_regmap pdm_sysclk_sel =
+	AUD_MST_SYS_MUX(pdm_sysclk, AUDIO_CLK_PDMIN_CTRL1);
+static struct clk_regmap spdifout_b_clk_sel =
+	AUD_MST_MCLK_MUX(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
+
+static struct clk_regmap spdifout_clk_div =
+	AUD_MST_MCLK_DIV(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
+static struct clk_regmap pdm_dclk_div =
+	AUD_MST_MCLK_DIV(pdm_dclk, AUDIO_CLK_PDMIN_CTRL0);
+static struct clk_regmap spdifin_clk_div =
+	AUD_MST_SYS_DIV(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+static struct clk_regmap pdm_sysclk_div =
+	AUD_MST_SYS_DIV(pdm_sysclk, AUDIO_CLK_PDMIN_CTRL1);
+static struct clk_regmap spdifout_b_clk_div =
+	AUD_MST_MCLK_DIV(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
+
+static struct clk_regmap spdifout_clk =
+	AUD_MST_MCLK_GATE(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
+static struct clk_regmap spdifin_clk =
+	AUD_MST_MCLK_GATE(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
+static struct clk_regmap pdm_dclk =
+	AUD_MST_MCLK_GATE(pdm_dclk, AUDIO_CLK_PDMIN_CTRL0);
+static struct clk_regmap pdm_sysclk =
+	AUD_MST_MCLK_GATE(pdm_sysclk, AUDIO_CLK_PDMIN_CTRL1);
+static struct clk_regmap spdifout_b_clk =
+	AUD_MST_MCLK_GATE(spdifout_b_clk, AUDIO_CLK_SPDIFOUT_B_CTRL);
+
+static struct clk_regmap mst_a_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(a, AUDIO_MST_A_SCLK_CTRL0);
+static struct clk_regmap mst_b_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(b, AUDIO_MST_B_SCLK_CTRL0);
+static struct clk_regmap mst_c_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(c, AUDIO_MST_C_SCLK_CTRL0);
+static struct clk_regmap mst_d_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(d, AUDIO_MST_D_SCLK_CTRL0);
+static struct clk_regmap mst_e_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(e, AUDIO_MST_E_SCLK_CTRL0);
+static struct clk_regmap mst_f_sclk_pre_en =
+	AUD_MST_SCLK_PRE_EN(f, AUDIO_MST_F_SCLK_CTRL0);
+
+static struct clk_regmap mst_a_sclk_div =
+	AUD_MST_SCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
+static struct clk_regmap mst_b_sclk_div =
+	AUD_MST_SCLK_DIV(b, AUDIO_MST_B_SCLK_CTRL0);
+static struct clk_regmap mst_c_sclk_div =
+	AUD_MST_SCLK_DIV(c, AUDIO_MST_C_SCLK_CTRL0);
+static struct clk_regmap mst_d_sclk_div =
+	AUD_MST_SCLK_DIV(d, AUDIO_MST_D_SCLK_CTRL0);
+static struct clk_regmap mst_e_sclk_div =
+	AUD_MST_SCLK_DIV(e, AUDIO_MST_E_SCLK_CTRL0);
+static struct clk_regmap mst_f_sclk_div =
+	AUD_MST_SCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
+
+static struct clk_regmap mst_a_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(a, AUDIO_MST_A_SCLK_CTRL0);
+static struct clk_regmap mst_b_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(b, AUDIO_MST_B_SCLK_CTRL0);
+static struct clk_regmap mst_c_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(c, AUDIO_MST_C_SCLK_CTRL0);
+static struct clk_regmap mst_d_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(d, AUDIO_MST_D_SCLK_CTRL0);
+static struct clk_regmap mst_e_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(e, AUDIO_MST_E_SCLK_CTRL0);
+static struct clk_regmap mst_f_sclk_post_en =
+	AUD_MST_SCLK_POST_EN(f, AUDIO_MST_F_SCLK_CTRL0);
+
+static struct clk_regmap mst_a_sclk =
+	AUD_MST_SCLK(a, AUDIO_MST_A_SCLK_CTRL1);
+static struct clk_regmap mst_b_sclk =
+	AUD_MST_SCLK(b, AUDIO_MST_B_SCLK_CTRL1);
+static struct clk_regmap mst_c_sclk =
+	AUD_MST_SCLK(c, AUDIO_MST_C_SCLK_CTRL1);
+static struct clk_regmap mst_d_sclk =
+	AUD_MST_SCLK(d, AUDIO_MST_D_SCLK_CTRL1);
+static struct clk_regmap mst_e_sclk =
+	AUD_MST_SCLK(e, AUDIO_MST_E_SCLK_CTRL1);
+static struct clk_regmap mst_f_sclk =
+	AUD_MST_SCLK(f, AUDIO_MST_F_SCLK_CTRL1);
+
+static struct clk_regmap mst_a_lrclk_div =
+	AUD_MST_LRCLK_DIV(a, AUDIO_MST_A_SCLK_CTRL0);
+static struct clk_regmap mst_b_lrclk_div =
+	AUD_MST_LRCLK_DIV(b, AUDIO_MST_B_SCLK_CTRL0);
+static struct clk_regmap mst_c_lrclk_div =
+	AUD_MST_LRCLK_DIV(c, AUDIO_MST_C_SCLK_CTRL0);
+static struct clk_regmap mst_d_lrclk_div =
+	AUD_MST_LRCLK_DIV(d, AUDIO_MST_D_SCLK_CTRL0);
+static struct clk_regmap mst_e_lrclk_div =
+	AUD_MST_LRCLK_DIV(e, AUDIO_MST_E_SCLK_CTRL0);
+static struct clk_regmap mst_f_lrclk_div =
+	AUD_MST_LRCLK_DIV(f, AUDIO_MST_F_SCLK_CTRL0);
+
+static struct clk_regmap mst_a_lrclk =
+	AUD_MST_LRCLK(a, AUDIO_MST_A_SCLK_CTRL1);
+static struct clk_regmap mst_b_lrclk =
+	AUD_MST_LRCLK(b, AUDIO_MST_B_SCLK_CTRL1);
+static struct clk_regmap mst_c_lrclk =
+	AUD_MST_LRCLK(c, AUDIO_MST_C_SCLK_CTRL1);
+static struct clk_regmap mst_d_lrclk =
+	AUD_MST_LRCLK(d, AUDIO_MST_D_SCLK_CTRL1);
+static struct clk_regmap mst_e_lrclk =
+	AUD_MST_LRCLK(e, AUDIO_MST_E_SCLK_CTRL1);
+static struct clk_regmap mst_f_lrclk =
+	AUD_MST_LRCLK(f, AUDIO_MST_F_SCLK_CTRL1);
+
+static struct clk_regmap tdmin_a_sclk_sel =
+	AUD_TDM_SCLK_MUX(in_a, AUDIO_CLK_TDMIN_A_CTRL);
+static struct clk_regmap tdmin_b_sclk_sel =
+	AUD_TDM_SCLK_MUX(in_b, AUDIO_CLK_TDMIN_B_CTRL);
+static struct clk_regmap tdmin_c_sclk_sel =
+	AUD_TDM_SCLK_MUX(in_c, AUDIO_CLK_TDMIN_C_CTRL);
+static struct clk_regmap tdmin_lb_sclk_sel =
+	AUD_TDM_SCLK_MUX(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
+static struct clk_regmap tdmout_a_sclk_sel =
+	AUD_TDM_SCLK_MUX(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap tdmout_b_sclk_sel =
+	AUD_TDM_SCLK_MUX(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap tdmout_c_sclk_sel =
+	AUD_TDM_SCLK_MUX(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
+static struct clk_regmap tdmin_a_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(in_a, AUDIO_CLK_TDMIN_A_CTRL);
+static struct clk_regmap tdmin_b_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(in_b, AUDIO_CLK_TDMIN_B_CTRL);
+static struct clk_regmap tdmin_c_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(in_c, AUDIO_CLK_TDMIN_C_CTRL);
+static struct clk_regmap tdmin_lb_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
+static struct clk_regmap tdmout_a_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap tdmout_b_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap tdmout_c_sclk_pre_en =
+	AUD_TDM_SCLK_PRE_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
+static struct clk_regmap tdmin_a_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(in_a, AUDIO_CLK_TDMIN_A_CTRL);
+static struct clk_regmap tdmin_b_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(in_b, AUDIO_CLK_TDMIN_B_CTRL);
+static struct clk_regmap tdmin_c_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(in_c, AUDIO_CLK_TDMIN_C_CTRL);
+static struct clk_regmap tdmin_lb_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
+static struct clk_regmap tdmout_a_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap tdmout_b_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap tdmout_c_sclk_post_en =
+	AUD_TDM_SCLK_POST_EN(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
+static struct clk_regmap tdmin_a_sclk =
+	AUD_TDM_SCLK(in_a, AUDIO_CLK_TDMIN_A_CTRL);
+static struct clk_regmap tdmin_b_sclk =
+	AUD_TDM_SCLK(in_b, AUDIO_CLK_TDMIN_B_CTRL);
+static struct clk_regmap tdmin_c_sclk =
+	AUD_TDM_SCLK(in_c, AUDIO_CLK_TDMIN_C_CTRL);
+static struct clk_regmap tdmin_lb_sclk =
+	AUD_TDM_SCLK(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
+static struct clk_regmap tdmout_a_sclk =
+	AUD_TDM_SCLK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap tdmout_b_sclk =
+	AUD_TDM_SCLK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap tdmout_c_sclk =
+	AUD_TDM_SCLK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
+static struct clk_regmap tdmin_a_lrclk =
+	AUD_TDM_LRLCK(in_a, AUDIO_CLK_TDMIN_A_CTRL);
+static struct clk_regmap tdmin_b_lrclk =
+	AUD_TDM_LRLCK(in_b, AUDIO_CLK_TDMIN_B_CTRL);
+static struct clk_regmap tdmin_c_lrclk =
+	AUD_TDM_LRLCK(in_c, AUDIO_CLK_TDMIN_C_CTRL);
+static struct clk_regmap tdmin_lb_lrclk =
+	AUD_TDM_LRLCK(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
+static struct clk_regmap tdmout_a_lrclk =
+	AUD_TDM_LRLCK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap tdmout_b_lrclk =
+	AUD_TDM_LRLCK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap tdmout_c_lrclk =
+	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
+/* AXG/G12A Clocks */
+static struct clk_regmap mst_a_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+static struct clk_regmap mst_b_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+static struct clk_regmap mst_c_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+static struct clk_regmap mst_d_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+static struct clk_regmap mst_e_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_e_mclk, AUDIO_MCLK_E_CTRL);
+static struct clk_regmap mst_f_mclk_sel =
+	AUD_MST_MCLK_MUX(mst_f_mclk, AUDIO_MCLK_F_CTRL);
+
+static struct clk_regmap mst_a_mclk_div =
+	AUD_MST_MCLK_DIV(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+static struct clk_regmap mst_b_mclk_div =
+	AUD_MST_MCLK_DIV(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+static struct clk_regmap mst_c_mclk_div =
+	AUD_MST_MCLK_DIV(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+static struct clk_regmap mst_d_mclk_div =
+	AUD_MST_MCLK_DIV(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+static struct clk_regmap mst_e_mclk_div =
+	AUD_MST_MCLK_DIV(mst_e_mclk, AUDIO_MCLK_E_CTRL);
+static struct clk_regmap mst_f_mclk_div =
+	AUD_MST_MCLK_DIV(mst_f_mclk, AUDIO_MCLK_F_CTRL);
+
+static struct clk_regmap mst_a_mclk =
+	AUD_MST_MCLK_GATE(mst_a_mclk, AUDIO_MCLK_A_CTRL);
+static struct clk_regmap mst_b_mclk =
+	AUD_MST_MCLK_GATE(mst_b_mclk, AUDIO_MCLK_B_CTRL);
+static struct clk_regmap mst_c_mclk =
+	AUD_MST_MCLK_GATE(mst_c_mclk, AUDIO_MCLK_C_CTRL);
+static struct clk_regmap mst_d_mclk =
+	AUD_MST_MCLK_GATE(mst_d_mclk, AUDIO_MCLK_D_CTRL);
+static struct clk_regmap mst_e_mclk =
+	AUD_MST_MCLK_GATE(mst_e_mclk, AUDIO_MCLK_E_CTRL);
+static struct clk_regmap mst_f_mclk =
+	AUD_MST_MCLK_GATE(mst_f_mclk, AUDIO_MCLK_F_CTRL);
+
+/* G12a clocks */
+static struct clk_regmap g12a_tdm_mclk_pad_0 = AUD_TDM_PAD_CTRL(
+	mclk_pad_0, AUDIO_MST_PAD_CTRL0, 0, mclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_mclk_pad_1 = AUD_TDM_PAD_CTRL(
+	mclk_pad_1, AUDIO_MST_PAD_CTRL0, 4, mclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_lrclk_pad_0 = AUD_TDM_PAD_CTRL(
+	lrclk_pad_0, AUDIO_MST_PAD_CTRL1, 16, lrclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_lrclk_pad_1 = AUD_TDM_PAD_CTRL(
+	lrclk_pad_1, AUDIO_MST_PAD_CTRL1, 20, lrclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_lrclk_pad_2 = AUD_TDM_PAD_CTRL(
+	lrclk_pad_2, AUDIO_MST_PAD_CTRL1, 24, lrclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_sclk_pad_0 = AUD_TDM_PAD_CTRL(
+	sclk_pad_0, AUDIO_MST_PAD_CTRL1, 0, sclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_sclk_pad_1 = AUD_TDM_PAD_CTRL(
+	sclk_pad_1, AUDIO_MST_PAD_CTRL1, 4, sclk_pad_ctrl_parent_data);
+static struct clk_regmap g12a_tdm_sclk_pad_2 = AUD_TDM_PAD_CTRL(
+	sclk_pad_2, AUDIO_MST_PAD_CTRL1, 8, sclk_pad_ctrl_parent_data);
+
+/* G12a/SM1 clocks */
+static struct clk_regmap spdifout_b = AUD_PCLK_GATE(spdifout_b,   21);
 
 /*
  * Array of all clocks provided by this provider
@@ -473,127 +570,127 @@ static AUD_TDM_PAD_CTRL(sclk_pad_2, AUDIO_MST_PAD_CTRL1, 8,
  */
 static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
 	.hws = {
-		[AUD_CLKID_DDR_ARB]		= &aud_ddr_arb.hw,
-		[AUD_CLKID_PDM]			= &aud_pdm.hw,
-		[AUD_CLKID_TDMIN_A]		= &aud_tdmin_a.hw,
-		[AUD_CLKID_TDMIN_B]		= &aud_tdmin_b.hw,
-		[AUD_CLKID_TDMIN_C]		= &aud_tdmin_c.hw,
-		[AUD_CLKID_TDMIN_LB]		= &aud_tdmin_lb.hw,
-		[AUD_CLKID_TDMOUT_A]		= &aud_tdmout_a.hw,
-		[AUD_CLKID_TDMOUT_B]		= &aud_tdmout_b.hw,
-		[AUD_CLKID_TDMOUT_C]		= &aud_tdmout_c.hw,
-		[AUD_CLKID_FRDDR_A]		= &aud_frddr_a.hw,
-		[AUD_CLKID_FRDDR_B]		= &aud_frddr_b.hw,
-		[AUD_CLKID_FRDDR_C]		= &aud_frddr_c.hw,
-		[AUD_CLKID_TODDR_A]		= &aud_toddr_a.hw,
-		[AUD_CLKID_TODDR_B]		= &aud_toddr_b.hw,
-		[AUD_CLKID_TODDR_C]		= &aud_toddr_c.hw,
-		[AUD_CLKID_LOOPBACK]		= &aud_loopback.hw,
-		[AUD_CLKID_SPDIFIN]		= &aud_spdifin.hw,
-		[AUD_CLKID_SPDIFOUT]		= &aud_spdifout.hw,
-		[AUD_CLKID_RESAMPLE]		= &aud_resample.hw,
-		[AUD_CLKID_POWER_DETECT]	= &aud_power_detect.hw,
-		[AUD_CLKID_MST_A_MCLK_SEL]	= &aud_mst_a_mclk_sel.hw,
-		[AUD_CLKID_MST_B_MCLK_SEL]	= &aud_mst_b_mclk_sel.hw,
-		[AUD_CLKID_MST_C_MCLK_SEL]	= &aud_mst_c_mclk_sel.hw,
-		[AUD_CLKID_MST_D_MCLK_SEL]	= &aud_mst_d_mclk_sel.hw,
-		[AUD_CLKID_MST_E_MCLK_SEL]	= &aud_mst_e_mclk_sel.hw,
-		[AUD_CLKID_MST_F_MCLK_SEL]	= &aud_mst_f_mclk_sel.hw,
-		[AUD_CLKID_MST_A_MCLK_DIV]	= &aud_mst_a_mclk_div.hw,
-		[AUD_CLKID_MST_B_MCLK_DIV]	= &aud_mst_b_mclk_div.hw,
-		[AUD_CLKID_MST_C_MCLK_DIV]	= &aud_mst_c_mclk_div.hw,
-		[AUD_CLKID_MST_D_MCLK_DIV]	= &aud_mst_d_mclk_div.hw,
-		[AUD_CLKID_MST_E_MCLK_DIV]	= &aud_mst_e_mclk_div.hw,
-		[AUD_CLKID_MST_F_MCLK_DIV]	= &aud_mst_f_mclk_div.hw,
-		[AUD_CLKID_MST_A_MCLK]		= &aud_mst_a_mclk.hw,
-		[AUD_CLKID_MST_B_MCLK]		= &aud_mst_b_mclk.hw,
-		[AUD_CLKID_MST_C_MCLK]		= &aud_mst_c_mclk.hw,
-		[AUD_CLKID_MST_D_MCLK]		= &aud_mst_d_mclk.hw,
-		[AUD_CLKID_MST_E_MCLK]		= &aud_mst_e_mclk.hw,
-		[AUD_CLKID_MST_F_MCLK]		= &aud_mst_f_mclk.hw,
-		[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &aud_spdifout_clk_sel.hw,
-		[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &aud_spdifout_clk_div.hw,
-		[AUD_CLKID_SPDIFOUT_CLK]	= &aud_spdifout_clk.hw,
-		[AUD_CLKID_SPDIFIN_CLK_SEL]	= &aud_spdifin_clk_sel.hw,
-		[AUD_CLKID_SPDIFIN_CLK_DIV]	= &aud_spdifin_clk_div.hw,
-		[AUD_CLKID_SPDIFIN_CLK]		= &aud_spdifin_clk.hw,
-		[AUD_CLKID_PDM_DCLK_SEL]	= &aud_pdm_dclk_sel.hw,
-		[AUD_CLKID_PDM_DCLK_DIV]	= &aud_pdm_dclk_div.hw,
-		[AUD_CLKID_PDM_DCLK]		= &aud_pdm_dclk.hw,
-		[AUD_CLKID_PDM_SYSCLK_SEL]	= &aud_pdm_sysclk_sel.hw,
-		[AUD_CLKID_PDM_SYSCLK_DIV]	= &aud_pdm_sysclk_div.hw,
-		[AUD_CLKID_PDM_SYSCLK]		= &aud_pdm_sysclk.hw,
-		[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &aud_mst_a_sclk_pre_en.hw,
-		[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &aud_mst_b_sclk_pre_en.hw,
-		[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &aud_mst_c_sclk_pre_en.hw,
-		[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &aud_mst_d_sclk_pre_en.hw,
-		[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &aud_mst_e_sclk_pre_en.hw,
-		[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &aud_mst_f_sclk_pre_en.hw,
-		[AUD_CLKID_MST_A_SCLK_DIV]	= &aud_mst_a_sclk_div.hw,
-		[AUD_CLKID_MST_B_SCLK_DIV]	= &aud_mst_b_sclk_div.hw,
-		[AUD_CLKID_MST_C_SCLK_DIV]	= &aud_mst_c_sclk_div.hw,
-		[AUD_CLKID_MST_D_SCLK_DIV]	= &aud_mst_d_sclk_div.hw,
-		[AUD_CLKID_MST_E_SCLK_DIV]	= &aud_mst_e_sclk_div.hw,
-		[AUD_CLKID_MST_F_SCLK_DIV]	= &aud_mst_f_sclk_div.hw,
-		[AUD_CLKID_MST_A_SCLK_POST_EN]	= &aud_mst_a_sclk_post_en.hw,
-		[AUD_CLKID_MST_B_SCLK_POST_EN]	= &aud_mst_b_sclk_post_en.hw,
-		[AUD_CLKID_MST_C_SCLK_POST_EN]	= &aud_mst_c_sclk_post_en.hw,
-		[AUD_CLKID_MST_D_SCLK_POST_EN]	= &aud_mst_d_sclk_post_en.hw,
-		[AUD_CLKID_MST_E_SCLK_POST_EN]	= &aud_mst_e_sclk_post_en.hw,
-		[AUD_CLKID_MST_F_SCLK_POST_EN]	= &aud_mst_f_sclk_post_en.hw,
-		[AUD_CLKID_MST_A_SCLK]		= &aud_mst_a_sclk.hw,
-		[AUD_CLKID_MST_B_SCLK]		= &aud_mst_b_sclk.hw,
-		[AUD_CLKID_MST_C_SCLK]		= &aud_mst_c_sclk.hw,
-		[AUD_CLKID_MST_D_SCLK]		= &aud_mst_d_sclk.hw,
-		[AUD_CLKID_MST_E_SCLK]		= &aud_mst_e_sclk.hw,
-		[AUD_CLKID_MST_F_SCLK]		= &aud_mst_f_sclk.hw,
-		[AUD_CLKID_MST_A_LRCLK_DIV]	= &aud_mst_a_lrclk_div.hw,
-		[AUD_CLKID_MST_B_LRCLK_DIV]	= &aud_mst_b_lrclk_div.hw,
-		[AUD_CLKID_MST_C_LRCLK_DIV]	= &aud_mst_c_lrclk_div.hw,
-		[AUD_CLKID_MST_D_LRCLK_DIV]	= &aud_mst_d_lrclk_div.hw,
-		[AUD_CLKID_MST_E_LRCLK_DIV]	= &aud_mst_e_lrclk_div.hw,
-		[AUD_CLKID_MST_F_LRCLK_DIV]	= &aud_mst_f_lrclk_div.hw,
-		[AUD_CLKID_MST_A_LRCLK]		= &aud_mst_a_lrclk.hw,
-		[AUD_CLKID_MST_B_LRCLK]		= &aud_mst_b_lrclk.hw,
-		[AUD_CLKID_MST_C_LRCLK]		= &aud_mst_c_lrclk.hw,
-		[AUD_CLKID_MST_D_LRCLK]		= &aud_mst_d_lrclk.hw,
-		[AUD_CLKID_MST_E_LRCLK]		= &aud_mst_e_lrclk.hw,
-		[AUD_CLKID_MST_F_LRCLK]		= &aud_mst_f_lrclk.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &aud_tdmin_a_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &aud_tdmin_b_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &aud_tdmin_c_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &aud_tdmin_lb_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &aud_tdmout_a_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &aud_tdmout_b_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &aud_tdmout_c_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &aud_tdmin_a_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &aud_tdmin_b_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &aud_tdmin_c_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &aud_tdmin_lb_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &aud_tdmout_a_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &aud_tdmout_b_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &aud_tdmout_c_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &aud_tdmin_a_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &aud_tdmin_b_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &aud_tdmin_c_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &aud_tdmin_lb_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &aud_tdmout_a_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &aud_tdmout_b_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &aud_tdmout_c_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_A_SCLK]	= &aud_tdmin_a_sclk.hw,
-		[AUD_CLKID_TDMIN_B_SCLK]	= &aud_tdmin_b_sclk.hw,
-		[AUD_CLKID_TDMIN_C_SCLK]	= &aud_tdmin_c_sclk.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK]	= &aud_tdmin_lb_sclk.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK]	= &aud_tdmout_a_sclk.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK]	= &aud_tdmout_b_sclk.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK]	= &aud_tdmout_c_sclk.hw,
-		[AUD_CLKID_TDMIN_A_LRCLK]	= &aud_tdmin_a_lrclk.hw,
-		[AUD_CLKID_TDMIN_B_LRCLK]	= &aud_tdmin_b_lrclk.hw,
-		[AUD_CLKID_TDMIN_C_LRCLK]	= &aud_tdmin_c_lrclk.hw,
-		[AUD_CLKID_TDMIN_LB_LRCLK]	= &aud_tdmin_lb_lrclk.hw,
-		[AUD_CLKID_TDMOUT_A_LRCLK]	= &aud_tdmout_a_lrclk.hw,
-		[AUD_CLKID_TDMOUT_B_LRCLK]	= &aud_tdmout_b_lrclk.hw,
-		[AUD_CLKID_TDMOUT_C_LRCLK]	= &aud_tdmout_c_lrclk.hw,
+		[AUD_CLKID_DDR_ARB]		= &ddr_arb.hw,
+		[AUD_CLKID_PDM]			= &pdm.hw,
+		[AUD_CLKID_TDMIN_A]		= &tdmin_a.hw,
+		[AUD_CLKID_TDMIN_B]		= &tdmin_b.hw,
+		[AUD_CLKID_TDMIN_C]		= &tdmin_c.hw,
+		[AUD_CLKID_TDMIN_LB]		= &tdmin_lb.hw,
+		[AUD_CLKID_TDMOUT_A]		= &tdmout_a.hw,
+		[AUD_CLKID_TDMOUT_B]		= &tdmout_b.hw,
+		[AUD_CLKID_TDMOUT_C]		= &tdmout_c.hw,
+		[AUD_CLKID_FRDDR_A]		= &frddr_a.hw,
+		[AUD_CLKID_FRDDR_B]		= &frddr_b.hw,
+		[AUD_CLKID_FRDDR_C]		= &frddr_c.hw,
+		[AUD_CLKID_TODDR_A]		= &toddr_a.hw,
+		[AUD_CLKID_TODDR_B]		= &toddr_b.hw,
+		[AUD_CLKID_TODDR_C]		= &toddr_c.hw,
+		[AUD_CLKID_LOOPBACK]		= &loopback.hw,
+		[AUD_CLKID_SPDIFIN]		= &spdifin.hw,
+		[AUD_CLKID_SPDIFOUT]		= &spdifout.hw,
+		[AUD_CLKID_RESAMPLE]		= &resample.hw,
+		[AUD_CLKID_POWER_DETECT]	= &power_detect.hw,
+		[AUD_CLKID_MST_A_MCLK_SEL]	= &mst_a_mclk_sel.hw,
+		[AUD_CLKID_MST_B_MCLK_SEL]	= &mst_b_mclk_sel.hw,
+		[AUD_CLKID_MST_C_MCLK_SEL]	= &mst_c_mclk_sel.hw,
+		[AUD_CLKID_MST_D_MCLK_SEL]	= &mst_d_mclk_sel.hw,
+		[AUD_CLKID_MST_E_MCLK_SEL]	= &mst_e_mclk_sel.hw,
+		[AUD_CLKID_MST_F_MCLK_SEL]	= &mst_f_mclk_sel.hw,
+		[AUD_CLKID_MST_A_MCLK_DIV]	= &mst_a_mclk_div.hw,
+		[AUD_CLKID_MST_B_MCLK_DIV]	= &mst_b_mclk_div.hw,
+		[AUD_CLKID_MST_C_MCLK_DIV]	= &mst_c_mclk_div.hw,
+		[AUD_CLKID_MST_D_MCLK_DIV]	= &mst_d_mclk_div.hw,
+		[AUD_CLKID_MST_E_MCLK_DIV]	= &mst_e_mclk_div.hw,
+		[AUD_CLKID_MST_F_MCLK_DIV]	= &mst_f_mclk_div.hw,
+		[AUD_CLKID_MST_A_MCLK]		= &mst_a_mclk.hw,
+		[AUD_CLKID_MST_B_MCLK]		= &mst_b_mclk.hw,
+		[AUD_CLKID_MST_C_MCLK]		= &mst_c_mclk.hw,
+		[AUD_CLKID_MST_D_MCLK]		= &mst_d_mclk.hw,
+		[AUD_CLKID_MST_E_MCLK]		= &mst_e_mclk.hw,
+		[AUD_CLKID_MST_F_MCLK]		= &mst_f_mclk.hw,
+		[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &spdifout_clk_sel.hw,
+		[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &spdifout_clk_div.hw,
+		[AUD_CLKID_SPDIFOUT_CLK]	= &spdifout_clk.hw,
+		[AUD_CLKID_SPDIFIN_CLK_SEL]	= &spdifin_clk_sel.hw,
+		[AUD_CLKID_SPDIFIN_CLK_DIV]	= &spdifin_clk_div.hw,
+		[AUD_CLKID_SPDIFIN_CLK]		= &spdifin_clk.hw,
+		[AUD_CLKID_PDM_DCLK_SEL]	= &pdm_dclk_sel.hw,
+		[AUD_CLKID_PDM_DCLK_DIV]	= &pdm_dclk_div.hw,
+		[AUD_CLKID_PDM_DCLK]		= &pdm_dclk.hw,
+		[AUD_CLKID_PDM_SYSCLK_SEL]	= &pdm_sysclk_sel.hw,
+		[AUD_CLKID_PDM_SYSCLK_DIV]	= &pdm_sysclk_div.hw,
+		[AUD_CLKID_PDM_SYSCLK]		= &pdm_sysclk.hw,
+		[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &mst_a_sclk_pre_en.hw,
+		[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &mst_b_sclk_pre_en.hw,
+		[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &mst_c_sclk_pre_en.hw,
+		[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &mst_d_sclk_pre_en.hw,
+		[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &mst_e_sclk_pre_en.hw,
+		[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &mst_f_sclk_pre_en.hw,
+		[AUD_CLKID_MST_A_SCLK_DIV]	= &mst_a_sclk_div.hw,
+		[AUD_CLKID_MST_B_SCLK_DIV]	= &mst_b_sclk_div.hw,
+		[AUD_CLKID_MST_C_SCLK_DIV]	= &mst_c_sclk_div.hw,
+		[AUD_CLKID_MST_D_SCLK_DIV]	= &mst_d_sclk_div.hw,
+		[AUD_CLKID_MST_E_SCLK_DIV]	= &mst_e_sclk_div.hw,
+		[AUD_CLKID_MST_F_SCLK_DIV]	= &mst_f_sclk_div.hw,
+		[AUD_CLKID_MST_A_SCLK_POST_EN]	= &mst_a_sclk_post_en.hw,
+		[AUD_CLKID_MST_B_SCLK_POST_EN]	= &mst_b_sclk_post_en.hw,
+		[AUD_CLKID_MST_C_SCLK_POST_EN]	= &mst_c_sclk_post_en.hw,
+		[AUD_CLKID_MST_D_SCLK_POST_EN]	= &mst_d_sclk_post_en.hw,
+		[AUD_CLKID_MST_E_SCLK_POST_EN]	= &mst_e_sclk_post_en.hw,
+		[AUD_CLKID_MST_F_SCLK_POST_EN]	= &mst_f_sclk_post_en.hw,
+		[AUD_CLKID_MST_A_SCLK]		= &mst_a_sclk.hw,
+		[AUD_CLKID_MST_B_SCLK]		= &mst_b_sclk.hw,
+		[AUD_CLKID_MST_C_SCLK]		= &mst_c_sclk.hw,
+		[AUD_CLKID_MST_D_SCLK]		= &mst_d_sclk.hw,
+		[AUD_CLKID_MST_E_SCLK]		= &mst_e_sclk.hw,
+		[AUD_CLKID_MST_F_SCLK]		= &mst_f_sclk.hw,
+		[AUD_CLKID_MST_A_LRCLK_DIV]	= &mst_a_lrclk_div.hw,
+		[AUD_CLKID_MST_B_LRCLK_DIV]	= &mst_b_lrclk_div.hw,
+		[AUD_CLKID_MST_C_LRCLK_DIV]	= &mst_c_lrclk_div.hw,
+		[AUD_CLKID_MST_D_LRCLK_DIV]	= &mst_d_lrclk_div.hw,
+		[AUD_CLKID_MST_E_LRCLK_DIV]	= &mst_e_lrclk_div.hw,
+		[AUD_CLKID_MST_F_LRCLK_DIV]	= &mst_f_lrclk_div.hw,
+		[AUD_CLKID_MST_A_LRCLK]		= &mst_a_lrclk.hw,
+		[AUD_CLKID_MST_B_LRCLK]		= &mst_b_lrclk.hw,
+		[AUD_CLKID_MST_C_LRCLK]		= &mst_c_lrclk.hw,
+		[AUD_CLKID_MST_D_LRCLK]		= &mst_d_lrclk.hw,
+		[AUD_CLKID_MST_E_LRCLK]		= &mst_e_lrclk.hw,
+		[AUD_CLKID_MST_F_LRCLK]		= &mst_f_lrclk.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &tdmin_a_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &tdmin_b_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &tdmin_c_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &tdmin_lb_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &tdmout_a_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &tdmout_b_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &tdmout_c_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &tdmin_a_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &tdmin_b_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &tdmin_c_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &tdmin_lb_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &tdmout_a_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &tdmout_b_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &tdmout_c_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &tdmin_a_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &tdmin_b_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &tdmin_c_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &tdmin_lb_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &tdmout_a_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &tdmout_b_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &tdmout_c_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_A_SCLK]	= &tdmin_a_sclk.hw,
+		[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
+		[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK]	= &tdmout_a_sclk.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK]	= &tdmout_b_sclk.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK]	= &tdmout_c_sclk.hw,
+		[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
+		[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
+		[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
+		[AUD_CLKID_TDMIN_LB_LRCLK]	= &tdmin_lb_lrclk.hw,
+		[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
+		[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
+		[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
@@ -605,139 +702,139 @@ static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
  */
 static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
 	.hws = {
-		[AUD_CLKID_DDR_ARB]		= &aud_ddr_arb.hw,
-		[AUD_CLKID_PDM]			= &aud_pdm.hw,
-		[AUD_CLKID_TDMIN_A]		= &aud_tdmin_a.hw,
-		[AUD_CLKID_TDMIN_B]		= &aud_tdmin_b.hw,
-		[AUD_CLKID_TDMIN_C]		= &aud_tdmin_c.hw,
-		[AUD_CLKID_TDMIN_LB]		= &aud_tdmin_lb.hw,
-		[AUD_CLKID_TDMOUT_A]		= &aud_tdmout_a.hw,
-		[AUD_CLKID_TDMOUT_B]		= &aud_tdmout_b.hw,
-		[AUD_CLKID_TDMOUT_C]		= &aud_tdmout_c.hw,
-		[AUD_CLKID_FRDDR_A]		= &aud_frddr_a.hw,
-		[AUD_CLKID_FRDDR_B]		= &aud_frddr_b.hw,
-		[AUD_CLKID_FRDDR_C]		= &aud_frddr_c.hw,
-		[AUD_CLKID_TODDR_A]		= &aud_toddr_a.hw,
-		[AUD_CLKID_TODDR_B]		= &aud_toddr_b.hw,
-		[AUD_CLKID_TODDR_C]		= &aud_toddr_c.hw,
-		[AUD_CLKID_LOOPBACK]		= &aud_loopback.hw,
-		[AUD_CLKID_SPDIFIN]		= &aud_spdifin.hw,
-		[AUD_CLKID_SPDIFOUT]		= &aud_spdifout.hw,
-		[AUD_CLKID_RESAMPLE]		= &aud_resample.hw,
-		[AUD_CLKID_POWER_DETECT]	= &aud_power_detect.hw,
-		[AUD_CLKID_SPDIFOUT_B]		= &aud_spdifout_b.hw,
-		[AUD_CLKID_MST_A_MCLK_SEL]	= &aud_mst_a_mclk_sel.hw,
-		[AUD_CLKID_MST_B_MCLK_SEL]	= &aud_mst_b_mclk_sel.hw,
-		[AUD_CLKID_MST_C_MCLK_SEL]	= &aud_mst_c_mclk_sel.hw,
-		[AUD_CLKID_MST_D_MCLK_SEL]	= &aud_mst_d_mclk_sel.hw,
-		[AUD_CLKID_MST_E_MCLK_SEL]	= &aud_mst_e_mclk_sel.hw,
-		[AUD_CLKID_MST_F_MCLK_SEL]	= &aud_mst_f_mclk_sel.hw,
-		[AUD_CLKID_MST_A_MCLK_DIV]	= &aud_mst_a_mclk_div.hw,
-		[AUD_CLKID_MST_B_MCLK_DIV]	= &aud_mst_b_mclk_div.hw,
-		[AUD_CLKID_MST_C_MCLK_DIV]	= &aud_mst_c_mclk_div.hw,
-		[AUD_CLKID_MST_D_MCLK_DIV]	= &aud_mst_d_mclk_div.hw,
-		[AUD_CLKID_MST_E_MCLK_DIV]	= &aud_mst_e_mclk_div.hw,
-		[AUD_CLKID_MST_F_MCLK_DIV]	= &aud_mst_f_mclk_div.hw,
-		[AUD_CLKID_MST_A_MCLK]		= &aud_mst_a_mclk.hw,
-		[AUD_CLKID_MST_B_MCLK]		= &aud_mst_b_mclk.hw,
-		[AUD_CLKID_MST_C_MCLK]		= &aud_mst_c_mclk.hw,
-		[AUD_CLKID_MST_D_MCLK]		= &aud_mst_d_mclk.hw,
-		[AUD_CLKID_MST_E_MCLK]		= &aud_mst_e_mclk.hw,
-		[AUD_CLKID_MST_F_MCLK]		= &aud_mst_f_mclk.hw,
-		[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &aud_spdifout_clk_sel.hw,
-		[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &aud_spdifout_clk_div.hw,
-		[AUD_CLKID_SPDIFOUT_CLK]	= &aud_spdifout_clk.hw,
-		[AUD_CLKID_SPDIFOUT_B_CLK_SEL]	= &aud_spdifout_b_clk_sel.hw,
-		[AUD_CLKID_SPDIFOUT_B_CLK_DIV]	= &aud_spdifout_b_clk_div.hw,
-		[AUD_CLKID_SPDIFOUT_B_CLK]	= &aud_spdifout_b_clk.hw,
-		[AUD_CLKID_SPDIFIN_CLK_SEL]	= &aud_spdifin_clk_sel.hw,
-		[AUD_CLKID_SPDIFIN_CLK_DIV]	= &aud_spdifin_clk_div.hw,
-		[AUD_CLKID_SPDIFIN_CLK]		= &aud_spdifin_clk.hw,
-		[AUD_CLKID_PDM_DCLK_SEL]	= &aud_pdm_dclk_sel.hw,
-		[AUD_CLKID_PDM_DCLK_DIV]	= &aud_pdm_dclk_div.hw,
-		[AUD_CLKID_PDM_DCLK]		= &aud_pdm_dclk.hw,
-		[AUD_CLKID_PDM_SYSCLK_SEL]	= &aud_pdm_sysclk_sel.hw,
-		[AUD_CLKID_PDM_SYSCLK_DIV]	= &aud_pdm_sysclk_div.hw,
-		[AUD_CLKID_PDM_SYSCLK]		= &aud_pdm_sysclk.hw,
-		[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &aud_mst_a_sclk_pre_en.hw,
-		[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &aud_mst_b_sclk_pre_en.hw,
-		[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &aud_mst_c_sclk_pre_en.hw,
-		[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &aud_mst_d_sclk_pre_en.hw,
-		[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &aud_mst_e_sclk_pre_en.hw,
-		[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &aud_mst_f_sclk_pre_en.hw,
-		[AUD_CLKID_MST_A_SCLK_DIV]	= &aud_mst_a_sclk_div.hw,
-		[AUD_CLKID_MST_B_SCLK_DIV]	= &aud_mst_b_sclk_div.hw,
-		[AUD_CLKID_MST_C_SCLK_DIV]	= &aud_mst_c_sclk_div.hw,
-		[AUD_CLKID_MST_D_SCLK_DIV]	= &aud_mst_d_sclk_div.hw,
-		[AUD_CLKID_MST_E_SCLK_DIV]	= &aud_mst_e_sclk_div.hw,
-		[AUD_CLKID_MST_F_SCLK_DIV]	= &aud_mst_f_sclk_div.hw,
-		[AUD_CLKID_MST_A_SCLK_POST_EN]	= &aud_mst_a_sclk_post_en.hw,
-		[AUD_CLKID_MST_B_SCLK_POST_EN]	= &aud_mst_b_sclk_post_en.hw,
-		[AUD_CLKID_MST_C_SCLK_POST_EN]	= &aud_mst_c_sclk_post_en.hw,
-		[AUD_CLKID_MST_D_SCLK_POST_EN]	= &aud_mst_d_sclk_post_en.hw,
-		[AUD_CLKID_MST_E_SCLK_POST_EN]	= &aud_mst_e_sclk_post_en.hw,
-		[AUD_CLKID_MST_F_SCLK_POST_EN]	= &aud_mst_f_sclk_post_en.hw,
-		[AUD_CLKID_MST_A_SCLK]		= &aud_mst_a_sclk.hw,
-		[AUD_CLKID_MST_B_SCLK]		= &aud_mst_b_sclk.hw,
-		[AUD_CLKID_MST_C_SCLK]		= &aud_mst_c_sclk.hw,
-		[AUD_CLKID_MST_D_SCLK]		= &aud_mst_d_sclk.hw,
-		[AUD_CLKID_MST_E_SCLK]		= &aud_mst_e_sclk.hw,
-		[AUD_CLKID_MST_F_SCLK]		= &aud_mst_f_sclk.hw,
-		[AUD_CLKID_MST_A_LRCLK_DIV]	= &aud_mst_a_lrclk_div.hw,
-		[AUD_CLKID_MST_B_LRCLK_DIV]	= &aud_mst_b_lrclk_div.hw,
-		[AUD_CLKID_MST_C_LRCLK_DIV]	= &aud_mst_c_lrclk_div.hw,
-		[AUD_CLKID_MST_D_LRCLK_DIV]	= &aud_mst_d_lrclk_div.hw,
-		[AUD_CLKID_MST_E_LRCLK_DIV]	= &aud_mst_e_lrclk_div.hw,
-		[AUD_CLKID_MST_F_LRCLK_DIV]	= &aud_mst_f_lrclk_div.hw,
-		[AUD_CLKID_MST_A_LRCLK]		= &aud_mst_a_lrclk.hw,
-		[AUD_CLKID_MST_B_LRCLK]		= &aud_mst_b_lrclk.hw,
-		[AUD_CLKID_MST_C_LRCLK]		= &aud_mst_c_lrclk.hw,
-		[AUD_CLKID_MST_D_LRCLK]		= &aud_mst_d_lrclk.hw,
-		[AUD_CLKID_MST_E_LRCLK]		= &aud_mst_e_lrclk.hw,
-		[AUD_CLKID_MST_F_LRCLK]		= &aud_mst_f_lrclk.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &aud_tdmin_a_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &aud_tdmin_b_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &aud_tdmin_c_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &aud_tdmin_lb_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &aud_tdmout_a_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &aud_tdmout_b_sclk_sel.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &aud_tdmout_c_sclk_sel.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &aud_tdmin_a_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &aud_tdmin_b_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &aud_tdmin_c_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &aud_tdmin_lb_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &aud_tdmout_a_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &aud_tdmout_b_sclk_pre_en.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &aud_tdmout_c_sclk_pre_en.hw,
-		[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &aud_tdmin_a_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &aud_tdmin_b_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &aud_tdmin_c_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &aud_tdmin_lb_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &aud_tdmout_a_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &aud_tdmout_b_sclk_post_en.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &aud_tdmout_c_sclk_post_en.hw,
-		[AUD_CLKID_TDMIN_A_SCLK]	= &aud_tdmin_a_sclk.hw,
-		[AUD_CLKID_TDMIN_B_SCLK]	= &aud_tdmin_b_sclk.hw,
-		[AUD_CLKID_TDMIN_C_SCLK]	= &aud_tdmin_c_sclk.hw,
-		[AUD_CLKID_TDMIN_LB_SCLK]	= &aud_tdmin_lb_sclk.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK]	= &aud_tdmout_a_sclk.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK]	= &aud_tdmout_b_sclk.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK]	= &aud_tdmout_c_sclk.hw,
-		[AUD_CLKID_TDMIN_A_LRCLK]	= &aud_tdmin_a_lrclk.hw,
-		[AUD_CLKID_TDMIN_B_LRCLK]	= &aud_tdmin_b_lrclk.hw,
-		[AUD_CLKID_TDMIN_C_LRCLK]	= &aud_tdmin_c_lrclk.hw,
-		[AUD_CLKID_TDMIN_LB_LRCLK]	= &aud_tdmin_lb_lrclk.hw,
-		[AUD_CLKID_TDMOUT_A_LRCLK]	= &aud_tdmout_a_lrclk.hw,
-		[AUD_CLKID_TDMOUT_B_LRCLK]	= &aud_tdmout_b_lrclk.hw,
-		[AUD_CLKID_TDMOUT_C_LRCLK]	= &aud_tdmout_c_lrclk.hw,
-		[AUD_CLKID_TDM_MCLK_PAD0]	= &aud_tdm_mclk_pad_0.hw,
-		[AUD_CLKID_TDM_MCLK_PAD1]	= &aud_tdm_mclk_pad_1.hw,
-		[AUD_CLKID_TDM_LRCLK_PAD0]	= &aud_tdm_lrclk_pad_0.hw,
-		[AUD_CLKID_TDM_LRCLK_PAD1]	= &aud_tdm_lrclk_pad_1.hw,
-		[AUD_CLKID_TDM_LRCLK_PAD2]	= &aud_tdm_lrclk_pad_2.hw,
-		[AUD_CLKID_TDM_SCLK_PAD0]	= &aud_tdm_sclk_pad_0.hw,
-		[AUD_CLKID_TDM_SCLK_PAD1]	= &aud_tdm_sclk_pad_1.hw,
-		[AUD_CLKID_TDM_SCLK_PAD2]	= &aud_tdm_sclk_pad_2.hw,
+		[AUD_CLKID_DDR_ARB]		= &ddr_arb.hw,
+		[AUD_CLKID_PDM]			= &pdm.hw,
+		[AUD_CLKID_TDMIN_A]		= &tdmin_a.hw,
+		[AUD_CLKID_TDMIN_B]		= &tdmin_b.hw,
+		[AUD_CLKID_TDMIN_C]		= &tdmin_c.hw,
+		[AUD_CLKID_TDMIN_LB]		= &tdmin_lb.hw,
+		[AUD_CLKID_TDMOUT_A]		= &tdmout_a.hw,
+		[AUD_CLKID_TDMOUT_B]		= &tdmout_b.hw,
+		[AUD_CLKID_TDMOUT_C]		= &tdmout_c.hw,
+		[AUD_CLKID_FRDDR_A]		= &frddr_a.hw,
+		[AUD_CLKID_FRDDR_B]		= &frddr_b.hw,
+		[AUD_CLKID_FRDDR_C]		= &frddr_c.hw,
+		[AUD_CLKID_TODDR_A]		= &toddr_a.hw,
+		[AUD_CLKID_TODDR_B]		= &toddr_b.hw,
+		[AUD_CLKID_TODDR_C]		= &toddr_c.hw,
+		[AUD_CLKID_LOOPBACK]		= &loopback.hw,
+		[AUD_CLKID_SPDIFIN]		= &spdifin.hw,
+		[AUD_CLKID_SPDIFOUT]		= &spdifout.hw,
+		[AUD_CLKID_RESAMPLE]		= &resample.hw,
+		[AUD_CLKID_POWER_DETECT]	= &power_detect.hw,
+		[AUD_CLKID_SPDIFOUT_B]		= &spdifout_b.hw,
+		[AUD_CLKID_MST_A_MCLK_SEL]	= &mst_a_mclk_sel.hw,
+		[AUD_CLKID_MST_B_MCLK_SEL]	= &mst_b_mclk_sel.hw,
+		[AUD_CLKID_MST_C_MCLK_SEL]	= &mst_c_mclk_sel.hw,
+		[AUD_CLKID_MST_D_MCLK_SEL]	= &mst_d_mclk_sel.hw,
+		[AUD_CLKID_MST_E_MCLK_SEL]	= &mst_e_mclk_sel.hw,
+		[AUD_CLKID_MST_F_MCLK_SEL]	= &mst_f_mclk_sel.hw,
+		[AUD_CLKID_MST_A_MCLK_DIV]	= &mst_a_mclk_div.hw,
+		[AUD_CLKID_MST_B_MCLK_DIV]	= &mst_b_mclk_div.hw,
+		[AUD_CLKID_MST_C_MCLK_DIV]	= &mst_c_mclk_div.hw,
+		[AUD_CLKID_MST_D_MCLK_DIV]	= &mst_d_mclk_div.hw,
+		[AUD_CLKID_MST_E_MCLK_DIV]	= &mst_e_mclk_div.hw,
+		[AUD_CLKID_MST_F_MCLK_DIV]	= &mst_f_mclk_div.hw,
+		[AUD_CLKID_MST_A_MCLK]		= &mst_a_mclk.hw,
+		[AUD_CLKID_MST_B_MCLK]		= &mst_b_mclk.hw,
+		[AUD_CLKID_MST_C_MCLK]		= &mst_c_mclk.hw,
+		[AUD_CLKID_MST_D_MCLK]		= &mst_d_mclk.hw,
+		[AUD_CLKID_MST_E_MCLK]		= &mst_e_mclk.hw,
+		[AUD_CLKID_MST_F_MCLK]		= &mst_f_mclk.hw,
+		[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &spdifout_clk_sel.hw,
+		[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &spdifout_clk_div.hw,
+		[AUD_CLKID_SPDIFOUT_CLK]	= &spdifout_clk.hw,
+		[AUD_CLKID_SPDIFOUT_B_CLK_SEL]	= &spdifout_b_clk_sel.hw,
+		[AUD_CLKID_SPDIFOUT_B_CLK_DIV]	= &spdifout_b_clk_div.hw,
+		[AUD_CLKID_SPDIFOUT_B_CLK]	= &spdifout_b_clk.hw,
+		[AUD_CLKID_SPDIFIN_CLK_SEL]	= &spdifin_clk_sel.hw,
+		[AUD_CLKID_SPDIFIN_CLK_DIV]	= &spdifin_clk_div.hw,
+		[AUD_CLKID_SPDIFIN_CLK]		= &spdifin_clk.hw,
+		[AUD_CLKID_PDM_DCLK_SEL]	= &pdm_dclk_sel.hw,
+		[AUD_CLKID_PDM_DCLK_DIV]	= &pdm_dclk_div.hw,
+		[AUD_CLKID_PDM_DCLK]		= &pdm_dclk.hw,
+		[AUD_CLKID_PDM_SYSCLK_SEL]	= &pdm_sysclk_sel.hw,
+		[AUD_CLKID_PDM_SYSCLK_DIV]	= &pdm_sysclk_div.hw,
+		[AUD_CLKID_PDM_SYSCLK]		= &pdm_sysclk.hw,
+		[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &mst_a_sclk_pre_en.hw,
+		[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &mst_b_sclk_pre_en.hw,
+		[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &mst_c_sclk_pre_en.hw,
+		[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &mst_d_sclk_pre_en.hw,
+		[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &mst_e_sclk_pre_en.hw,
+		[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &mst_f_sclk_pre_en.hw,
+		[AUD_CLKID_MST_A_SCLK_DIV]	= &mst_a_sclk_div.hw,
+		[AUD_CLKID_MST_B_SCLK_DIV]	= &mst_b_sclk_div.hw,
+		[AUD_CLKID_MST_C_SCLK_DIV]	= &mst_c_sclk_div.hw,
+		[AUD_CLKID_MST_D_SCLK_DIV]	= &mst_d_sclk_div.hw,
+		[AUD_CLKID_MST_E_SCLK_DIV]	= &mst_e_sclk_div.hw,
+		[AUD_CLKID_MST_F_SCLK_DIV]	= &mst_f_sclk_div.hw,
+		[AUD_CLKID_MST_A_SCLK_POST_EN]	= &mst_a_sclk_post_en.hw,
+		[AUD_CLKID_MST_B_SCLK_POST_EN]	= &mst_b_sclk_post_en.hw,
+		[AUD_CLKID_MST_C_SCLK_POST_EN]	= &mst_c_sclk_post_en.hw,
+		[AUD_CLKID_MST_D_SCLK_POST_EN]	= &mst_d_sclk_post_en.hw,
+		[AUD_CLKID_MST_E_SCLK_POST_EN]	= &mst_e_sclk_post_en.hw,
+		[AUD_CLKID_MST_F_SCLK_POST_EN]	= &mst_f_sclk_post_en.hw,
+		[AUD_CLKID_MST_A_SCLK]		= &mst_a_sclk.hw,
+		[AUD_CLKID_MST_B_SCLK]		= &mst_b_sclk.hw,
+		[AUD_CLKID_MST_C_SCLK]		= &mst_c_sclk.hw,
+		[AUD_CLKID_MST_D_SCLK]		= &mst_d_sclk.hw,
+		[AUD_CLKID_MST_E_SCLK]		= &mst_e_sclk.hw,
+		[AUD_CLKID_MST_F_SCLK]		= &mst_f_sclk.hw,
+		[AUD_CLKID_MST_A_LRCLK_DIV]	= &mst_a_lrclk_div.hw,
+		[AUD_CLKID_MST_B_LRCLK_DIV]	= &mst_b_lrclk_div.hw,
+		[AUD_CLKID_MST_C_LRCLK_DIV]	= &mst_c_lrclk_div.hw,
+		[AUD_CLKID_MST_D_LRCLK_DIV]	= &mst_d_lrclk_div.hw,
+		[AUD_CLKID_MST_E_LRCLK_DIV]	= &mst_e_lrclk_div.hw,
+		[AUD_CLKID_MST_F_LRCLK_DIV]	= &mst_f_lrclk_div.hw,
+		[AUD_CLKID_MST_A_LRCLK]		= &mst_a_lrclk.hw,
+		[AUD_CLKID_MST_B_LRCLK]		= &mst_b_lrclk.hw,
+		[AUD_CLKID_MST_C_LRCLK]		= &mst_c_lrclk.hw,
+		[AUD_CLKID_MST_D_LRCLK]		= &mst_d_lrclk.hw,
+		[AUD_CLKID_MST_E_LRCLK]		= &mst_e_lrclk.hw,
+		[AUD_CLKID_MST_F_LRCLK]		= &mst_f_lrclk.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &tdmin_a_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &tdmin_b_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &tdmin_c_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &tdmin_lb_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &tdmout_a_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &tdmout_b_sclk_sel.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &tdmout_c_sclk_sel.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &tdmin_a_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &tdmin_b_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &tdmin_c_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &tdmin_lb_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &tdmout_a_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &tdmout_b_sclk_pre_en.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &tdmout_c_sclk_pre_en.hw,
+		[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &tdmin_a_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &tdmin_b_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &tdmin_c_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &tdmin_lb_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &tdmout_a_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &tdmout_b_sclk_post_en.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &tdmout_c_sclk_post_en.hw,
+		[AUD_CLKID_TDMIN_A_SCLK]	= &tdmin_a_sclk.hw,
+		[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
+		[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
+		[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK]	= &tdmout_a_sclk.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK]	= &tdmout_b_sclk.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK]	= &tdmout_c_sclk.hw,
+		[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
+		[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
+		[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
+		[AUD_CLKID_TDMIN_LB_LRCLK]	= &tdmin_lb_lrclk.hw,
+		[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
+		[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
+		[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
+		[AUD_CLKID_TDM_MCLK_PAD0]	= &g12a_tdm_mclk_pad_0.hw,
+		[AUD_CLKID_TDM_MCLK_PAD1]	= &g12a_tdm_mclk_pad_1.hw,
+		[AUD_CLKID_TDM_LRCLK_PAD0]	= &g12a_tdm_lrclk_pad_0.hw,
+		[AUD_CLKID_TDM_LRCLK_PAD1]	= &g12a_tdm_lrclk_pad_1.hw,
+		[AUD_CLKID_TDM_LRCLK_PAD2]	= &g12a_tdm_lrclk_pad_2.hw,
+		[AUD_CLKID_TDM_SCLK_PAD0]	= &g12a_tdm_sclk_pad_0.hw,
+		[AUD_CLKID_TDM_SCLK_PAD1]	= &g12a_tdm_sclk_pad_1.hw,
+		[AUD_CLKID_TDM_SCLK_PAD2]	= &g12a_tdm_sclk_pad_2.hw,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
@@ -750,139 +847,139 @@ static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
  * feel the need to have separate AXG/G12A regmap tables.
  */
 static struct clk_regmap *const aud_clk_regmaps[] = {
-	&aud_ddr_arb,
-	&aud_pdm,
-	&aud_tdmin_a,
-	&aud_tdmin_b,
-	&aud_tdmin_c,
-	&aud_tdmin_lb,
-	&aud_tdmout_a,
-	&aud_tdmout_b,
-	&aud_tdmout_c,
-	&aud_frddr_a,
-	&aud_frddr_b,
-	&aud_frddr_c,
-	&aud_toddr_a,
-	&aud_toddr_b,
-	&aud_toddr_c,
-	&aud_loopback,
-	&aud_spdifin,
-	&aud_spdifout,
-	&aud_resample,
-	&aud_power_detect,
-	&aud_spdifout_b,
-	&aud_mst_a_mclk_sel,
-	&aud_mst_b_mclk_sel,
-	&aud_mst_c_mclk_sel,
-	&aud_mst_d_mclk_sel,
-	&aud_mst_e_mclk_sel,
-	&aud_mst_f_mclk_sel,
-	&aud_mst_a_mclk_div,
-	&aud_mst_b_mclk_div,
-	&aud_mst_c_mclk_div,
-	&aud_mst_d_mclk_div,
-	&aud_mst_e_mclk_div,
-	&aud_mst_f_mclk_div,
-	&aud_mst_a_mclk,
-	&aud_mst_b_mclk,
-	&aud_mst_c_mclk,
-	&aud_mst_d_mclk,
-	&aud_mst_e_mclk,
-	&aud_mst_f_mclk,
-	&aud_spdifout_clk_sel,
-	&aud_spdifout_clk_div,
-	&aud_spdifout_clk,
-	&aud_spdifin_clk_sel,
-	&aud_spdifin_clk_div,
-	&aud_spdifin_clk,
-	&aud_pdm_dclk_sel,
-	&aud_pdm_dclk_div,
-	&aud_pdm_dclk,
-	&aud_pdm_sysclk_sel,
-	&aud_pdm_sysclk_div,
-	&aud_pdm_sysclk,
-	&aud_mst_a_sclk_pre_en,
-	&aud_mst_b_sclk_pre_en,
-	&aud_mst_c_sclk_pre_en,
-	&aud_mst_d_sclk_pre_en,
-	&aud_mst_e_sclk_pre_en,
-	&aud_mst_f_sclk_pre_en,
-	&aud_mst_a_sclk_div,
-	&aud_mst_b_sclk_div,
-	&aud_mst_c_sclk_div,
-	&aud_mst_d_sclk_div,
-	&aud_mst_e_sclk_div,
-	&aud_mst_f_sclk_div,
-	&aud_mst_a_sclk_post_en,
-	&aud_mst_b_sclk_post_en,
-	&aud_mst_c_sclk_post_en,
-	&aud_mst_d_sclk_post_en,
-	&aud_mst_e_sclk_post_en,
-	&aud_mst_f_sclk_post_en,
-	&aud_mst_a_sclk,
-	&aud_mst_b_sclk,
-	&aud_mst_c_sclk,
-	&aud_mst_d_sclk,
-	&aud_mst_e_sclk,
-	&aud_mst_f_sclk,
-	&aud_mst_a_lrclk_div,
-	&aud_mst_b_lrclk_div,
-	&aud_mst_c_lrclk_div,
-	&aud_mst_d_lrclk_div,
-	&aud_mst_e_lrclk_div,
-	&aud_mst_f_lrclk_div,
-	&aud_mst_a_lrclk,
-	&aud_mst_b_lrclk,
-	&aud_mst_c_lrclk,
-	&aud_mst_d_lrclk,
-	&aud_mst_e_lrclk,
-	&aud_mst_f_lrclk,
-	&aud_tdmin_a_sclk_sel,
-	&aud_tdmin_b_sclk_sel,
-	&aud_tdmin_c_sclk_sel,
-	&aud_tdmin_lb_sclk_sel,
-	&aud_tdmout_a_sclk_sel,
-	&aud_tdmout_b_sclk_sel,
-	&aud_tdmout_c_sclk_sel,
-	&aud_tdmin_a_sclk_pre_en,
-	&aud_tdmin_b_sclk_pre_en,
-	&aud_tdmin_c_sclk_pre_en,
-	&aud_tdmin_lb_sclk_pre_en,
-	&aud_tdmout_a_sclk_pre_en,
-	&aud_tdmout_b_sclk_pre_en,
-	&aud_tdmout_c_sclk_pre_en,
-	&aud_tdmin_a_sclk_post_en,
-	&aud_tdmin_b_sclk_post_en,
-	&aud_tdmin_c_sclk_post_en,
-	&aud_tdmin_lb_sclk_post_en,
-	&aud_tdmout_a_sclk_post_en,
-	&aud_tdmout_b_sclk_post_en,
-	&aud_tdmout_c_sclk_post_en,
-	&aud_tdmin_a_sclk,
-	&aud_tdmin_b_sclk,
-	&aud_tdmin_c_sclk,
-	&aud_tdmin_lb_sclk,
-	&aud_tdmout_a_sclk,
-	&aud_tdmout_b_sclk,
-	&aud_tdmout_c_sclk,
-	&aud_tdmin_a_lrclk,
-	&aud_tdmin_b_lrclk,
-	&aud_tdmin_c_lrclk,
-	&aud_tdmin_lb_lrclk,
-	&aud_tdmout_a_lrclk,
-	&aud_tdmout_b_lrclk,
-	&aud_tdmout_c_lrclk,
-	&aud_spdifout_b_clk_sel,
-	&aud_spdifout_b_clk_div,
-	&aud_spdifout_b_clk,
-	&aud_tdm_mclk_pad_0,
-	&aud_tdm_mclk_pad_1,
-	&aud_tdm_lrclk_pad_0,
-	&aud_tdm_lrclk_pad_1,
-	&aud_tdm_lrclk_pad_2,
-	&aud_tdm_sclk_pad_0,
-	&aud_tdm_sclk_pad_1,
-	&aud_tdm_sclk_pad_2,
+	&ddr_arb,
+	&pdm,
+	&tdmin_a,
+	&tdmin_b,
+	&tdmin_c,
+	&tdmin_lb,
+	&tdmout_a,
+	&tdmout_b,
+	&tdmout_c,
+	&frddr_a,
+	&frddr_b,
+	&frddr_c,
+	&toddr_a,
+	&toddr_b,
+	&toddr_c,
+	&loopback,
+	&spdifin,
+	&spdifout,
+	&resample,
+	&power_detect,
+	&spdifout_b,
+	&mst_a_mclk_sel,
+	&mst_b_mclk_sel,
+	&mst_c_mclk_sel,
+	&mst_d_mclk_sel,
+	&mst_e_mclk_sel,
+	&mst_f_mclk_sel,
+	&mst_a_mclk_div,
+	&mst_b_mclk_div,
+	&mst_c_mclk_div,
+	&mst_d_mclk_div,
+	&mst_e_mclk_div,
+	&mst_f_mclk_div,
+	&mst_a_mclk,
+	&mst_b_mclk,
+	&mst_c_mclk,
+	&mst_d_mclk,
+	&mst_e_mclk,
+	&mst_f_mclk,
+	&spdifout_clk_sel,
+	&spdifout_clk_div,
+	&spdifout_clk,
+	&spdifin_clk_sel,
+	&spdifin_clk_div,
+	&spdifin_clk,
+	&pdm_dclk_sel,
+	&pdm_dclk_div,
+	&pdm_dclk,
+	&pdm_sysclk_sel,
+	&pdm_sysclk_div,
+	&pdm_sysclk,
+	&mst_a_sclk_pre_en,
+	&mst_b_sclk_pre_en,
+	&mst_c_sclk_pre_en,
+	&mst_d_sclk_pre_en,
+	&mst_e_sclk_pre_en,
+	&mst_f_sclk_pre_en,
+	&mst_a_sclk_div,
+	&mst_b_sclk_div,
+	&mst_c_sclk_div,
+	&mst_d_sclk_div,
+	&mst_e_sclk_div,
+	&mst_f_sclk_div,
+	&mst_a_sclk_post_en,
+	&mst_b_sclk_post_en,
+	&mst_c_sclk_post_en,
+	&mst_d_sclk_post_en,
+	&mst_e_sclk_post_en,
+	&mst_f_sclk_post_en,
+	&mst_a_sclk,
+	&mst_b_sclk,
+	&mst_c_sclk,
+	&mst_d_sclk,
+	&mst_e_sclk,
+	&mst_f_sclk,
+	&mst_a_lrclk_div,
+	&mst_b_lrclk_div,
+	&mst_c_lrclk_div,
+	&mst_d_lrclk_div,
+	&mst_e_lrclk_div,
+	&mst_f_lrclk_div,
+	&mst_a_lrclk,
+	&mst_b_lrclk,
+	&mst_c_lrclk,
+	&mst_d_lrclk,
+	&mst_e_lrclk,
+	&mst_f_lrclk,
+	&tdmin_a_sclk_sel,
+	&tdmin_b_sclk_sel,
+	&tdmin_c_sclk_sel,
+	&tdmin_lb_sclk_sel,
+	&tdmout_a_sclk_sel,
+	&tdmout_b_sclk_sel,
+	&tdmout_c_sclk_sel,
+	&tdmin_a_sclk_pre_en,
+	&tdmin_b_sclk_pre_en,
+	&tdmin_c_sclk_pre_en,
+	&tdmin_lb_sclk_pre_en,
+	&tdmout_a_sclk_pre_en,
+	&tdmout_b_sclk_pre_en,
+	&tdmout_c_sclk_pre_en,
+	&tdmin_a_sclk_post_en,
+	&tdmin_b_sclk_post_en,
+	&tdmin_c_sclk_post_en,
+	&tdmin_lb_sclk_post_en,
+	&tdmout_a_sclk_post_en,
+	&tdmout_b_sclk_post_en,
+	&tdmout_c_sclk_post_en,
+	&tdmin_a_sclk,
+	&tdmin_b_sclk,
+	&tdmin_c_sclk,
+	&tdmin_lb_sclk,
+	&tdmout_a_sclk,
+	&tdmout_b_sclk,
+	&tdmout_c_sclk,
+	&tdmin_a_lrclk,
+	&tdmin_b_lrclk,
+	&tdmin_c_lrclk,
+	&tdmin_lb_lrclk,
+	&tdmout_a_lrclk,
+	&tdmout_b_lrclk,
+	&tdmout_c_lrclk,
+	&spdifout_b_clk_sel,
+	&spdifout_b_clk_div,
+	&spdifout_b_clk,
+	&g12a_tdm_mclk_pad_0,
+	&g12a_tdm_mclk_pad_1,
+	&g12a_tdm_lrclk_pad_0,
+	&g12a_tdm_lrclk_pad_1,
+	&g12a_tdm_lrclk_pad_2,
+	&g12a_tdm_sclk_pad_0,
+	&g12a_tdm_sclk_pad_1,
+	&g12a_tdm_sclk_pad_2,
 };
 
 static int devm_clk_get_enable(struct device *dev, char *id)
-- 
2.21.0


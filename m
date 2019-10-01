Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0002C3377
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 13:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733045AbfJALzW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 07:55:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33033 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732891AbfJALzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 07:55:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so15165949wrs.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=79/6tSnPTRZJSx7l9IqqNNwN+2xwDedu3PFaTFq6EtI=;
        b=lHX5hII/HavOBp9PR/x6k1xIe5WOZuin7rWRrFy66/GQBQS1RCbjdXY2d3zqSzLOTH
         tHhEFans8qI/lDcrzLs6QhgqeEgAnnspDzFOab2LnMetS57O2jZhELMMwSOAGb1uiTly
         ySBXPTM4qeye0bBLiNo7tA8WDtzaJUqNNNFD0HE1/SQUPxfEhwq6VpLLbJFeKftf+TP8
         5/WL6e+GDUe5zePozG/LqQCxDwTJmo8DGJyxBQjd/naBIrmhzgQG/cEVGRLn5e7KI4D6
         Zxf5PT0Kq0K0B5dhUP1ijF7i4hoRLO3EkF6xt0BAgNm6xds1ZhacCWj6WFLkRd64KONj
         hf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=79/6tSnPTRZJSx7l9IqqNNwN+2xwDedu3PFaTFq6EtI=;
        b=qQn70EjM+4JGtY5YM/v87lFgRfyYAff7cCzbFZRCizLqILyqHw9MVCGLSF2sxvyRYm
         Tjfj/mEH4+tQoFQX/QBUUAZufqxFqEbzkOX0MSxEwe82zcC6hSHlisEn7EtukH/g7nIm
         2KYCFaZ9XcbuP0Ha7GLEtLvsZxOTuPPZ7IziK+2LDzjxEjSowJWkjbEJ4oIoFSB6EfuV
         MFHI6v+c/7VccMg7xRRyfVL3rLbX365nnhoAnTLuw7o7fntckeWcGxIHchYpd7mgJH5B
         3N+e8X0+z+a5BTf7xXiBoT+UXljecU3bKmkvMpVZAPb8oQSoLpQFHkLRzwf1wvdUGf2L
         gtcA==
X-Gm-Message-State: APjAAAUaV8lwBY0l95d1zU97QgWTiaTYba1To91+hZCux6N15tdLByiJ
        T7HW1DWUgPZCYxh9AtQYdCJKlA==
X-Google-Smtp-Source: APXvYqwM4rW0g5tDCknEL/a7c4Qsmfn9MeIadCvt7DY4Cna7Ma6Px7o6YSRRurJKiIssbKjEmIeUxw==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr18860966wrg.74.1569930920794;
        Tue, 01 Oct 2019 04:55:20 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:55:20 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] clk: meson: axg-audio: provide clk top signal name
Date:   Tue,  1 Oct 2019 13:55:09 +0200
Message-Id: <20191001115511.17357-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The peripheral clock on the sm1 goes through some muxes
and dividers before reaching the audio gates. To model that,
without repeating our self too much, the "top" clock signal
is introduced and will serve as a the parent of the gates.

On the axg and g12a, the top clock is just a pass-through to
the audio peripheral clock provided by the main controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 18 +++++++++++++++---
 drivers/clk/meson/axg-audio.h |  3 ++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index ce8836776d1c..1a4c50a29ad7 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -74,9 +74,7 @@
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "pclk",				\
-		},							\
+		.parent_names = (const char *[]){ "aud_top" },		\
 		.num_parents = 1,					\
 	},								\
 }
@@ -504,6 +502,18 @@ static struct clk_regmap tdmout_c_lrclk =
 	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 /* AXG/G12A Clocks */
+static struct clk_hw axg_aud_top = {
+	.init = &(struct clk_init_data) {
+		/* Provide aud_top signal name on axg and g12a */
+		.name = "aud_top",
+		.ops = &(const struct clk_ops) {},
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "pclk",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap mst_a_mclk_sel =
 	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_MCLK_A_CTRL);
 static struct clk_regmap mst_b_mclk_sel =
@@ -691,6 +701,7 @@ static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
 		[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
 		[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
+		[AUD_CLKID_TOP]			= &axg_aud_top,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
@@ -835,6 +846,7 @@ static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
 		[AUD_CLKID_TDM_SCLK_PAD0]	= &g12a_tdm_sclk_pad_0.hw,
 		[AUD_CLKID_TDM_SCLK_PAD1]	= &g12a_tdm_sclk_pad_1.hw,
 		[AUD_CLKID_TDM_SCLK_PAD2]	= &g12a_tdm_sclk_pad_2.hw,
+		[AUD_CLKID_TOP]			= &axg_aud_top,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index c00e28b2e1a9..a4956837f597 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -116,9 +116,10 @@
 #define AUD_CLKID_SPDIFOUT_B_CLK_SEL	153
 #define AUD_CLKID_SPDIFOUT_B_CLK_DIV	154
 
+
 /* include the CLKIDs which are part of the DT bindings */
 #include <dt-bindings/clock/axg-audio-clkc.h>
 
-#define NR_CLKS	163
+#define NR_CLKS	164
 
 #endif /*__AXG_AUDIO_CLKC_H */
-- 
2.21.0


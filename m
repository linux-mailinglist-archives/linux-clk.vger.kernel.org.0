Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D266DBCB93
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 17:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389844AbfIXPec (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 11:34:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40252 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390153AbfIXPeP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 11:34:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id l3so2469163wru.7
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ks76Xrr9nKNePqaLMRUF1ZkG2fudOj170M7fieae2vM=;
        b=a3SrpT7YOFcb6RqQISZy0OBn0LLXJPlaadQLpRvpPfAUu9OF99EtqZ+iZDWCKSQKfm
         /PY+tEdZw0J+mqtUsu8JTg9ppjXjwcjBySMg3nAb7aTIT34K3m+8Jl1VBj3eHuBXUQSO
         uLUSHgPIZsBoU52AdQr9pOAs/DihLV4NGltOP/2jIei9uDmFRnWZm6kYKX8kc0h0cLR6
         kBw+tYPK4W+ch/jJ+JJCcdK5aJ253psq4G4gU9PT4eeraMoiODcud/IylmvIW8/nS+IO
         g3Ks9unobl885EMsBOy9VUtuEuBNXttCtqdE5aV5vexAXh+JtYnUaE5KtFiuYlG+MZ+4
         q7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ks76Xrr9nKNePqaLMRUF1ZkG2fudOj170M7fieae2vM=;
        b=OKc+4cqeZqQ4MTsh8FVM9OgRMBTFetsTQ5iOtmnjCy4MhY+pevYQtwsmh94NIMTm6E
         a9cBmEcvDscgcZwAJtn2PtefuHhITfJ9UJ11iN7ttvkSfiQDNCsnOXt6fbBUdDh6Xnif
         M2qaxjrRipW8YiwkpCgoUwLp79Bqvlh8sWvzOuuUWZzRLadQq51vBIgaLnP3zshgyQ9I
         A2s3l2USV0eAtz5SZJiBcQE73uiTJ2wgccAhThlZNS9bcxNyUzZ9LhzJIfSIhlzZNEEf
         6VNMzu2cly+fasN2v/3rweVm8YB2pa1RuYPz2n/v9ZbchCjFnz6s/e2PhOTFUnmzN5eJ
         w+iA==
X-Gm-Message-State: APjAAAVbunpPCgshviEGLDunDvW9Pf8KdVtaj0/lrPU90JPBAgQ8IRIM
        3mrgDwwx/WReOqJqgaqcY4gDHA==
X-Google-Smtp-Source: APXvYqwENWiw/6oEckacIFl28j6UnFFsq1VIO9Hk+y2r2bmjzF5Kz7jabrwCicvxYGqr/mVqilsnVw==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr3117861wro.329.1569339253138;
        Tue, 24 Sep 2019 08:34:13 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 08:34:11 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] clk: meson: axg-audio: provide clk top signal name
Date:   Tue, 24 Sep 2019 17:33:55 +0200
Message-Id: <20190924153356.24103-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924153356.24103-1-jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
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
 drivers/clk/meson/axg-audio.c | 19 ++++++++++++++++---
 drivers/clk/meson/axg-audio.h |  3 ++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index ce8836776d1c..a8ccdbaecae2 100644
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
@@ -504,6 +502,19 @@ static struct clk_regmap tdmout_c_lrclk =
 	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 /* AXG/G12A Clocks */
+
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
@@ -691,6 +702,7 @@ static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
 		[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
 		[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
+		[AUD_CLKID_TOP]			= &axg_aud_top,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
@@ -835,6 +847,7 @@ static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
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


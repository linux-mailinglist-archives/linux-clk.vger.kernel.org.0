Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D7B163FA5
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2020 09:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgBSItk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Feb 2020 03:49:40 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44634 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgBSItk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 03:49:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id m16so27124598wrx.11
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 00:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5GSg/xDxPp49oDbA6vFdut+q4shLY3Pk8HEGAuRFez0=;
        b=eluEgFKOncyKAGdAwn5OlTiyk2CNzP5MLYoMHFNmglRELyDY5Bk6FrEAlgWD7RuyYp
         cIRQuyIF/z2xm2TY2HA0ExnS0Px90I2YnFFe2YaEp8nRZe8AWjSJ+yXWyGKS+FtSe+i3
         SM4nfyn/zK9JP5yPnX1DcQrdxrAVI3xGW2dO320+301upQ6idUmjL64+5RLLV+F7l+R2
         EHQNCCqP7FZ8UpTmLCXdGOj9Ec6wfsrNuyRGOwNJQOc2+ezeoKKUbgZ5NW+eB1kiJz4X
         Xy/0uw/WlS0qq3ibJmSnCialEob3fLbK8sgqebp6PoO2HlZbIlAWjvIkZr4G71U1auup
         hNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5GSg/xDxPp49oDbA6vFdut+q4shLY3Pk8HEGAuRFez0=;
        b=Fp/Xhgu3eROa7TnBKziaNdkNrBKcWqsmqICz2jXbf6ls1QTqbK4FRzzENElZXoYlV/
         S7DI6MRioFNF651B5B9X1Q5CZkRr98t1wZqCBuUzsyT40ie5u2ydbI9RQOGNBmUEv7HH
         m9nzLtbLNDUBv67Oxn1qFsw6PXQow3yZ/aJitmV4+XcXcmPW8KAWe8GETbSo+m0VGWau
         VV3AxiWNAVcvpAM+jZs/tl7GoM0j3hGImEUGvOqDaDKkrNzMipnWwraIWiQLUi+E5qGz
         iQpX3+3sI0hZdIDVzDMmk/ncCv3AneB/DC+3nopqGxriuSK+G1ditB06tPpb9dck7pLw
         TAPQ==
X-Gm-Message-State: APjAAAWADozlLXbgJ8yNt9lOTwc9A6pea1pyynOdITxQSj/A8xtfzOWV
        NOJXyFbPydSmG5/YPMiIT5AXuw==
X-Google-Smtp-Source: APXvYqzIWUthaSqh0c9Ww016Eg2GCgQn8e5Ju2qinfSCQh/Y6SpPyxGTiNTOn47XES0XFKoKalCppg==
X-Received: by 2002:a05:6000:1187:: with SMTP id g7mr34747098wrx.109.1582102178017;
        Wed, 19 Feb 2020 00:49:38 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t13sm2021673wrw.19.2020.02.19.00.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 00:49:37 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: meson: g12a: add support for the SPICC SCLK Source clocks
Date:   Wed, 19 Feb 2020 09:49:28 +0100
Message-Id: <20200219084928.28707-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219084928.28707-1-narmstrong@baylibre.com>
References: <20200219084928.28707-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the clocks used for the Amlogic G12A and compatible SoCs SPICC
controller to provide a more complete range of frequencies instead of the
SPICC internal divider over Xtal.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 129 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   6 +-
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d2760a021301..fad616cac01e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3862,6 +3862,111 @@ static struct clk_regmap g12a_ts = {
 	},
 };
 
+/* SPICC SCLK source clock */
+
+static const struct clk_parent_data spicc_sclk_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &g12a_clk81.hw },
+	{ .hw = &g12a_fclk_div4.hw },
+	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div5.hw },
+	{ .hw = &g12a_fclk_div7.hw },
+};
+
+static struct clk_regmap g12a_spicc0_sclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.mask = 7,
+		.shift = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = spicc_sclk_parent_data,
+		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+	},
+};
+
+static struct clk_regmap g12a_spicc0_sclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.shift = 0,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc0_sclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc0_sclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.bit_idx = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc0_sclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.mask = 7,
+		.shift = 23,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = spicc_sclk_parent_data,
+		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.shift = 16,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc1_sclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.bit_idx = 22,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc1_sclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw)
 
@@ -4159,6 +4264,12 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
 		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
 		[CLKID_TS]			= &g12a_ts.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4408,6 +4519,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_CPUB_CLK_AXI]		= &g12b_cpub_clk_axi.hw,
 		[CLKID_CPUB_CLK_TRACE_SEL]	= &g12b_cpub_clk_trace_sel.hw,
 		[CLKID_CPUB_CLK_TRACE]		= &g12b_cpub_clk_trace.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4642,6 +4759,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_CPU1_CLK]		= &sm1_cpu1_clk.hw,
 		[CLKID_CPU2_CLK]		= &sm1_cpu2_clk.hw,
 		[CLKID_CPU3_CLK]		= &sm1_cpu3_clk.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4877,6 +5000,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&sm1_cpu1_clk,
 	&sm1_cpu2_clk,
 	&sm1_cpu3_clk,
+	&g12a_spicc0_sclk_sel,
+	&g12a_spicc0_sclk_div,
+	&g12a_spicc0_sclk,
+	&g12a_spicc1_sclk_sel,
+	&g12a_spicc1_sclk_div,
+	&g12a_spicc1_sclk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 9df4068aced1..a8852556836e 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -255,8 +255,12 @@
 #define CLKID_DSU_CLK_DYN1			249
 #define CLKID_DSU_CLK_DYN			250
 #define CLKID_DSU_CLK_FINAL			251
+#define CLKID_SPICC0_SCLK_SEL			256
+#define CLKID_SPICC0_SCLK_DIV			257
+#define CLKID_SPICC1_SCLK_SEL			259
+#define CLKID_SPICC1_SCLK_DIV			260
 
-#define NR_CLKS					256
+#define NR_CLKS					262
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.22.0


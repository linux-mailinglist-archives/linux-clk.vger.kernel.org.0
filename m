Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5FC6FD2F
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2019 11:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbfGVJy7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jul 2019 05:54:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37935 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbfGVJyf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 05:54:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so13296353wmj.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2019 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6R0NWQlnIAwKuRysvv9K9RxgnaCJkMi344ya2fVJ/bE=;
        b=EP7xmpwQa+pMsg60cBfzQGZdkBSFE4e3VYfMX3Q0KjSFL37nrGw7C+h4EKhfka6ugX
         bRqxKmDZk4inuzD+gytrSU718DMilO4jq6xL8EDDu+cZd2Ym6zh8au7n1OD5L/akx87P
         VWp2mRSUvXT3joI73u6pTz5322LjhoH1eWIM9AjmzIAoZymIsGTiAb5wNauKCoY0b/Sq
         MKTWkA6u5Lu0wsc5NxaTqcSozElZr807vvNhHVqLd9v66cp/gJwIT8TKBVL5zMJnQqWa
         9gwXR1ODTxuCQWWFniHNHcFn5dU7+P7g1peCbyTiJWzPBQlX4EcI5ucfyfY3QaG0qvLm
         0voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6R0NWQlnIAwKuRysvv9K9RxgnaCJkMi344ya2fVJ/bE=;
        b=axwK2K/E/dCehboqBTfvS9w62G5/7eeTQrv2rKjm5P5H+c0zXMhF4mk7/eNxBqKOuY
         2X6rlN/CC7jWMI7I1gN5AtU81CPb9GMKTlfRw2c4uhuCNAnoR5cVs2sN1CLpjACfNMWd
         GaKZSTCr8TG90jxJ4Qo8AXdRwnu9CEkCM/IhbSBvZ78HJtrUAN9TNBMtQUoi1/MJ/52w
         7PKPSVVEC4+XaI5GL5MVlvtQ4bIFvSq+3QDvmfj1LpiSCkfkg5+oQ8rS9vKpuU8OF5z4
         ZFMG6chCw2RxFQRnhMlnUT9TCo+oLL0rGsm4dPxejWX4D3fepIIpvLsP8nKq+SnLnXa4
         dK4Q==
X-Gm-Message-State: APjAAAXLIyJ0etFzhZ7cqpnTn/LA63xhM7tb28KdYTKOWSZCCMEqZyPx
        uE8oOqfaV8xGZpFunbrbXerWmA==
X-Google-Smtp-Source: APXvYqxL3STbC40DMe9t+4KCNQq9KW7UxaHv2lTgd+0ZzeAHSksvcDXsOVc7DbV3tAvrIZfo979exg==
X-Received: by 2002:a1c:107:: with SMTP id 7mr63169406wmb.84.1563789272237;
        Mon, 22 Jul 2019 02:54:32 -0700 (PDT)
Received: from pop-os.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id 91sm83158469wrp.3.2019.07.22.02.54.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:54:31 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 4/8] clk: meson: axg: migrate to the new parent description method
Date:   Mon, 22 Jul 2019 11:54:21 +0200
Message-Id: <20190722095425.14193-5-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722095425.14193-1-amergnat@baylibre.com>
References: <20190722095425.14193-1-amergnat@baylibre.com>
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
 drivers/clk/meson/axg.c | 204 ++++++++++++++++++++++++++++------------
 1 file changed, 144 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 3ddd0efc9ee0..7a3d795cc614 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -14,7 +14,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-input.h"
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
@@ -59,7 +58,9 @@ static struct clk_regmap axg_fixed_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -74,7 +75,9 @@ static struct clk_regmap axg_fixed_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "fixed_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fixed_pll_dco.hw
+		},
 		.num_parents = 1,
 		/*
 		 * This clock won't ever change at runtime so
@@ -114,7 +117,9 @@ static struct clk_regmap axg_sys_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -129,7 +134,9 @@ static struct clk_regmap axg_sys_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "sys_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_sys_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -215,7 +222,9 @@ static struct clk_regmap axg_gp0_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -230,7 +239,9 @@ static struct clk_regmap axg_gp0_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "gp0_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_gp0_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -284,7 +295,9 @@ static struct clk_regmap axg_hifi_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -299,7 +312,9 @@ static struct clk_regmap axg_hifi_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "hifi_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_hifi_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -311,7 +326,7 @@ static struct clk_fixed_factor axg_fclk_div2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_fixed_pll.hw },
 		.num_parents = 1,
 	},
 };
@@ -324,7 +339,9 @@ static struct clk_regmap axg_fclk_div2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fclk_div2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_IS_CRITICAL,
 	},
@@ -336,7 +353,7 @@ static struct clk_fixed_factor axg_fclk_div3_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_fixed_pll.hw },
 		.num_parents = 1,
 	},
 };
@@ -349,7 +366,9 @@ static struct clk_regmap axg_fclk_div3 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div3_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fclk_div3_div.hw
+		},
 		.num_parents = 1,
 		/*
 		 * FIXME:
@@ -372,7 +391,7 @@ static struct clk_fixed_factor axg_fclk_div4_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div4_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_fixed_pll.hw },
 		.num_parents = 1,
 	},
 };
@@ -385,7 +404,9 @@ static struct clk_regmap axg_fclk_div4 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div4",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div4_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fclk_div4_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -396,7 +417,7 @@ static struct clk_fixed_factor axg_fclk_div5_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_fixed_pll.hw },
 		.num_parents = 1,
 	},
 };
@@ -409,7 +430,9 @@ static struct clk_regmap axg_fclk_div5 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div5_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fclk_div5_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -420,7 +443,9 @@ static struct clk_fixed_factor axg_fclk_div7_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -433,7 +458,9 @@ static struct clk_regmap axg_fclk_div7 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div7_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fclk_div7_div.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -447,7 +474,9 @@ static struct clk_regmap axg_mpll_prediv = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll_prediv",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_fixed_pll.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -480,7 +509,9 @@ static struct clk_regmap axg_mpll0_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -493,7 +524,9 @@ static struct clk_regmap axg_mpll0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -527,7 +560,9 @@ static struct clk_regmap axg_mpll1_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -540,7 +575,9 @@ static struct clk_regmap axg_mpll1 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll1_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll1_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -579,7 +616,9 @@ static struct clk_regmap axg_mpll2_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -592,7 +631,9 @@ static struct clk_regmap axg_mpll2 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll2_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll2_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -626,7 +667,9 @@ static struct clk_regmap axg_mpll3_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll3_div",
 		.ops = &meson_clk_mpll_ops,
-		.parent_names = (const char *[]){ "mpll_prediv" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll_prediv.hw
+		},
 		.num_parents = 1,
 	},
 };
@@ -639,7 +682,9 @@ static struct clk_regmap axg_mpll3 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll3",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpll3_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpll3_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -702,7 +747,9 @@ static struct clk_regmap axg_pcie_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
@@ -717,7 +764,9 @@ static struct clk_regmap axg_pcie_pll_od = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll_od",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "pcie_pll_dco" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_pcie_pll_dco.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -733,7 +782,9 @@ static struct clk_regmap axg_pcie_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "pcie_pll_od" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_pcie_pll_od.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -750,7 +801,7 @@ static struct clk_regmap axg_pcie_mux = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_mux",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "pcie_pll" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_pcie_pll.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -767,7 +818,7 @@ static struct clk_regmap axg_pcie_ref = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_ref",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "pcie_mux" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_pcie_mux.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -781,7 +832,7 @@ static struct clk_regmap axg_pcie_cml_en0 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "pcie_cml_en0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "pcie_ref" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_pcie_ref.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 
@@ -796,16 +847,21 @@ static struct clk_regmap axg_pcie_cml_en1 = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "pcie_cml_en1",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "pcie_ref" },
+		.parent_hws = (const struct clk_hw *[]) { &axg_pcie_ref.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
-static const char * const clk81_parent_names[] = {
-	IN_PREFIX "xtal", "fclk_div7", "mpll1", "mpll2", "fclk_div4",
-	"fclk_div3", "fclk_div5"
+static const struct clk_parent_data clk81_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_fclk_div7.hw },
+	{ .hw = &axg_mpll1.hw },
+	{ .hw = &axg_mpll2.hw },
+	{ .hw = &axg_fclk_div4.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
 };
 
 static struct clk_regmap axg_mpeg_clk_sel = {
@@ -818,8 +874,8 @@ static struct clk_regmap axg_mpeg_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpeg_clk_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = clk81_parent_names,
-		.num_parents = ARRAY_SIZE(clk81_parent_names),
+		.parent_data = clk81_parent_data,
+		.num_parents = ARRAY_SIZE(clk81_parent_data),
 	},
 };
 
@@ -832,7 +888,9 @@ static struct clk_regmap axg_mpeg_clk_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpeg_clk_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "mpeg_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpeg_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -846,15 +904,20 @@ static struct clk_regmap axg_clk81 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "mpeg_clk_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_mpeg_clk_div.hw
+		},
 		.num_parents = 1,
 		.flags = (CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	},
 };
 
-static const char * const axg_sd_emmc_clk0_parent_names[] = {
-	IN_PREFIX "xtal", "fclk_div2", "fclk_div3", "fclk_div5", "fclk_div7",
-
+static const struct clk_parent_data axg_sd_emmc_clk0_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_fclk_div2.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
+	{ .hw = &axg_fclk_div7.hw },
 	/*
 	 * Following these parent clocks, we should also have had mpll2, mpll3
 	 * and gp0_pll but these clocks are too precious to be used here. All
@@ -873,8 +936,8 @@ static struct clk_regmap axg_sd_emmc_b_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = axg_sd_emmc_clk0_parent_names,
-		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_names),
+		.parent_data = axg_sd_emmc_clk0_parent_data,
+		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_data),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -889,7 +952,9 @@ static struct clk_regmap axg_sd_emmc_b_clk0_div = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "sd_emmc_b_clk0_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_sd_emmc_b_clk0_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -903,7 +968,9 @@ static struct clk_regmap axg_sd_emmc_b_clk0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sd_emmc_b_clk0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "sd_emmc_b_clk0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_sd_emmc_b_clk0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -919,8 +986,8 @@ static struct clk_regmap axg_sd_emmc_c_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = axg_sd_emmc_clk0_parent_names,
-		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_names),
+		.parent_data = axg_sd_emmc_clk0_parent_data,
+		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_data),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -935,7 +1002,9 @@ static struct clk_regmap axg_sd_emmc_c_clk0_div = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "sd_emmc_c_clk0_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_sd_emmc_c_clk0_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -949,7 +1018,9 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sd_emmc_c_clk0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "sd_emmc_c_clk0_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_sd_emmc_c_clk0_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -957,9 +1028,18 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 
 static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
 				    9, 10, 11, 13, 14, };
-static const char * const gen_clk_parent_names[] = {
-	IN_PREFIX "xtal", "hifi_pll", "mpll0", "mpll1", "mpll2", "mpll3",
-	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "gp0_pll",
+static const struct clk_parent_data gen_clk_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_hifi_pll.hw },
+	{ .hw = &axg_mpll0.hw },
+	{ .hw = &axg_mpll1.hw },
+	{ .hw = &axg_mpll2.hw },
+	{ .hw = &axg_mpll3.hw },
+	{ .hw = &axg_fclk_div4.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
+	{ .hw = &axg_fclk_div7.hw },
+	{ .hw = &axg_gp0_pll.hw },
 };
 
 static struct clk_regmap axg_gen_clk_sel = {
@@ -978,8 +1058,8 @@ static struct clk_regmap axg_gen_clk_sel = {
 		 * hifi_pll, mpll0, mpll1, mpll2, mpll3, fdiv4,
 		 * fdiv3, fdiv5, [cts_msr_clk], fdiv7, gp0_pll
 		 */
-		.parent_names = gen_clk_parent_names,
-		.num_parents = ARRAY_SIZE(gen_clk_parent_names),
+		.parent_data = gen_clk_parent_data,
+		.num_parents = ARRAY_SIZE(gen_clk_parent_data),
 	},
 };
 
@@ -992,7 +1072,9 @@ static struct clk_regmap axg_gen_clk_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_clk_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_names = (const char *[]){ "gen_clk_sel" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_gen_clk_sel.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1006,7 +1088,9 @@ static struct clk_regmap axg_gen_clk = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_clk",
 		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "gen_clk_div" },
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_gen_clk_div.hw
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
-- 
2.17.1


Return-Path: <linux-clk+bounces-63-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF277E65EA
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 10:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA56E1C20CBD
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 09:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3539710A0A;
	Thu,  9 Nov 2023 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u25k79J4"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769E10A11
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:27 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE192D6A
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:25 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so7328251fa.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520423; x=1700125223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUtE9u6Ed6gm/A0AX82UWipGrZqGgwbiXFrn6U39T+8=;
        b=u25k79J4rlrVOhXScBoFL7fzfjmVyLmUtzqHw6ep7thTeYv++O0NqmHLFQsmzuts3r
         eYf9OeHCsu0IbUe3x/vJyEpIN0U9KJEpg9PSbHNzi+rR18i68Ww6AtwmrjMkgeve4x5h
         iTmGME39A/paxAIMv2WbzE+slR/OhY1O8kt4g2x8BFtILQ4xebkPMZqAs/LyyBXELQV6
         GOLL886NHYe5aa7zKfPFRLdYJp0ikUqicUcTJIYhVMV04VKOXvdSBFVCnJN/INZZR5Bd
         ZmGZyIL2Pouv34sD/TsTf/on1e+Az3YmjxCbqsKHYXA4SS1J+0zf2Nwwrgl93lErGomC
         MznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520423; x=1700125223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUtE9u6Ed6gm/A0AX82UWipGrZqGgwbiXFrn6U39T+8=;
        b=qO/5KYeYaUSBp3M2O9wLjSWO3VCFlwb6ZEhkB+RRqQ6Y0eUz173vTTpklxU4J1xIBr
         emu5JWeB+Fuu3SxzRsRH1W76xtlUb2pQrYSLSL1JUfQk6uDMYumMF5G+uV0VYHIf4NwX
         UTCOixNeb0W0S/zM5pIiNRuQi6CnrASPS+lgNBYSyDHS1oNjpJFwVwFAsGpC8OhdpCgR
         QrNbHiJWgNDN7ICAvRpkUE7uxR+KcJss9okYVAfL4uXQhCULG1Oxnwn48cW5GUTqgUHT
         imE6AsOxComxJ/GhSzOQ9b2xGrLMhRDHvVCo6zoC0AKKVduMgHJMCxPsWT3yDADfqpr3
         xnHQ==
X-Gm-Message-State: AOJu0YzmqlIWExAjcGN8lKNXaAwT0I4BZwePCCCZcvTcrnVxgRah+nlQ
	96joqB6gNjEThXDB61QYcPBOqDWarOASrLE5yalCrk4n
X-Google-Smtp-Source: AGHT+IGKLTMSbImiAf3qo87etGplLkfh1f4q+IeCMIzjH3sJHuA7bSiBo8Gg8eyhME4xs0RwmGnPQA==
X-Received: by 2002:a2e:b707:0:b0:2c5:b39e:c259 with SMTP id j7-20020a2eb707000000b002c5b39ec259mr3388456ljo.40.1699520423510;
        Thu, 09 Nov 2023 01:00:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:09 +0100
Subject: [PATCH v8 08/12] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-8-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7313;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=E1ITnrCeOZZwla8XsvarlWmq+y6flAzoa91IegwwCKM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+YmnJcOPI70mikchffeuqfLe2h8L0Oy5sB1nEI
 9EajeJSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmAAKCRB33NvayMhJ0YL1EA
 DKPiZSG/cVh3aV0Vqf5Kxwrp4tGGNlKkqAVYmvmklY1VlEriJPbQ0ln9KioU15sELYjnsuOZ6dTEq8
 1wrGDKdhJ0E5S7AvubkS5Rt1fTjhSOsHKgJzRRNEpjdCemoTYvBkVGVOYIWQ61d4kltS5q5yyVjac1
 zoMVmBbpsMmuhRZKK9uWl6c3l5GrB21nUO2x8R+1IpttwCmzCAQX2bastZ0/oAbXVHxuObrRIJfiY6
 AHyF6CDgEA7AchGx38nNynRecbbEcM2Offi/+OLsVijVUnNEND5HCKnT1lvo5aeRWj3yVxt0u9n5XO
 z9AEmPvHTWUw3+WgC/0IpaqkYaqx7iioeY0GnKSpYw30ax5fV3q6y25iN6hp7w8X579YiUqLu3q7Zj
 w9s5fZedbIxnlTN5NXRBcLRokLryIiYXAlDluDAyYAQZqtgtTewYXRqcsEmcng7oQqbqpi61EthBzS
 uYStVgiCvRh/pvnR2DyCmjbJcRBSRzR2NSorRpUvXGwM/BOZflqRbL3xZz+0DGDQsFdhi0Kv39tQ9b
 MuQ18814yoWy69C1/djaMAn4sviw7GLKkrCq4di56BSPbEYSjeaRjSGXTrcaQChPA14DcAZVFIz8RR
 /Q7i0YxGku6jn2m1Pvcg5Ur4MNAedRLmo/++sRmlTXyydWYO+zDtx1cDLtSw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to setup the DSI clock, let's make the unused VCLK2 clock path
configuration via CCF.

The nocache option is removed from following clocks:
- vclk2_sel
- vclk2_input
- vclk2_div
- vclk2
- vclk_div1
- vclk2_div2_en
- vclk2_div4_en
- vclk2_div6_en
- vclk2_div12_en
- vclk2_div2
- vclk2_div4
- vclk2_div6
- vclk2_div12
- cts_encl_sel

vclk2 and vclk2_div uses the newly introduced vclk regmap driver
to handle the enable and reset bits.

In order to set a rate on cts_encl via the vclk2 clock path,
the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
to keep CCF from selection a parent.
The parents of cts_encl_sel & vclk2_sel are expected to be defined
in DT.

The following clock scheme is to be used for DSI:

xtal
\_ gp0_pll_dco
   \_ gp0_pll
      |- vclk2_sel
      |  \_ vclk2_input
      |     \_ vclk2_div
      |        \_ vclk2
      |           \_ vclk2_div1
      |              \_ cts_encl_sel
      |                 \_ cts_encl	-> to VPU LCD Encoder
      |- mipi_dsi_pxclk_sel
      \_ mipi_dsi_pxclk_div
         \_ mipi_dsi_pxclk		-> to DSI controller

The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
for mipi_dsi_pxclk and vclk2_input.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 68 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index cadd824336ad..fb3d9196a1fd 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -22,6 +22,7 @@
 #include "clk-regmap.h"
 #include "clk-cpu-dyndiv.h"
 #include "vid-pll-div.h"
+#include "vclk.h"
 #include "meson-eeclk.h"
 #include "g12a.h"
 
@@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_vclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3193,7 +3194,7 @@ static struct clk_regmap g12a_vclk2_input = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3215,19 +3216,32 @@ static struct clk_regmap g12a_vclk_div = {
 };
 
 static struct clk_regmap g12a_vclk2_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_VIID_CLK_DIV,
-		.shift = 0,
-		.width = 8,
+	.data = &(struct clk_regmap_vclk_div_data){
+		.div = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.enable = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 16,
+			.width   = 1,
+		},
+		.reset = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 17,
+			.width   = 1,
+		},
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div",
-		.ops = &clk_regmap_divider_ops,
+		.ops = &clk_regmap_vclk_div_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&g12a_vclk2_input.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -3246,16 +3260,24 @@ static struct clk_regmap g12a_vclk = {
 };
 
 static struct clk_regmap g12a_vclk2 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VIID_CLK_CNTL,
-		.bit_idx = 19,
+	.data = &(struct clk_regmap_vclk_data){
+		.enable = {
+			.reg_off = HHI_VIID_CLK_CNTL,
+			.shift   = 19,
+			.width   = 1,
+		},
+		.reset = {
+			.reg_off = HHI_VIID_CLK_CNTL,
+			.shift   = 15,
+			.width   = 1,
+		},
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "vclk2",
-		.ops = &clk_regmap_gate_ops,
+		.ops = &clk_regmap_vclk_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -3339,7 +3361,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3353,7 +3375,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3367,7 +3389,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3381,7 +3403,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3395,7 +3417,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3461,6 +3483,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
 			&g12a_vclk2_div2_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3474,6 +3497,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
 			&g12a_vclk2_div4_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3487,6 +3511,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
 			&g12a_vclk2_div6_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3500,6 +3525,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
 			&g12a_vclk2_div12_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3561,7 +3587,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_cts_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3717,7 +3743,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3729,7 +3755,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mipi_dsi_pxclk_div",
-		.ops = &clk_regmap_divider_ops,
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&g12a_mipi_dsi_pxclk_sel.hw
 		},

-- 
2.34.1



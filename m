Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E328E76E7AF
	for <lists+linux-clk@lfdr.de>; Thu,  3 Aug 2023 14:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbjHCMEV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Aug 2023 08:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235738AbjHCMEM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 08:04:12 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D30826BA
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 05:04:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so783309f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064250; x=1691669050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgsDtF5O/s9PBjYfSivHAHvjRzma3FocfhBcV/z81+E=;
        b=kOJ2nefIv+DGc4gPDRUHqNpFurhW4YoFa+epkK7zyVprNuveUWD/2z38X4aegkm6pp
         F2YvvzsGo3xybXOycZNcFLsPGDdudE5kFsye8Miamsf+j7W7Yo30LrV/ZQ4x8j7RgRPU
         SZanU8YFg437GAkbVJvp++kTV4lakyeRltTjpXci3QoiBTNnnYFwNp1iC6qap6+LXVt4
         d4PlxpeIgbRSK/C/BLs5ZoJ1I0WEKZRV6hC+9XhSbgPz++ba0IsJTM+lGZyD3lWjoBUR
         yiMXsdUCfi/FOr/E4yrNtv+zSezRLKr/Ns92SFvjfPFkdcrf8v0fYqLgAkP4Yncl5zqs
         1g/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064250; x=1691669050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgsDtF5O/s9PBjYfSivHAHvjRzma3FocfhBcV/z81+E=;
        b=SifZUkKnsu8+c1aMleSM2ME5P24zxF63+AaxsSUIWofJYywRCBl91Po92fo/VptOpJ
         ySZTYhW+t65Htjq1qsaRORp0Dtiv3fwAAwMCRc1SIl3EujOXkF6RMhKUjzXxqq/1QE9Z
         ggrs9ezgtRJuZGfeB2IQQD03sCFzMXm3I1IY6QY40jiARdU+/pnA2/hsFVszXHv13Sjv
         /npUbPYga7wgEPp0SevY+uY2GQGWT8I6Rp4pxtDSQ3hWxcg6N9uEyMqNnFuGYgesKwGJ
         AbCBnHYeFy0O+Pwe3gb/Vz/4f447eWHDTA+MmASIwg6PpuApHIRBY+rzd09JvT9ywaVq
         awDQ==
X-Gm-Message-State: ABy/qLaiKhaCuVal1jQGkJMREA0Rzt1/POFN9TcYIRApfbJKESyIs763
        vh7Ka9FQpSero5RqLCipgWVHdQ==
X-Google-Smtp-Source: APBJJlEERylyCoIfpqbNZkNZa6qNLhicWfKwDO7/R1PxvRKbJ92p6jH0w0dl7JH0CozJjbU8xXdA5g==
X-Received: by 2002:a5d:6905:0:b0:315:9fb7:bd9 with SMTP id t5-20020a5d6905000000b003159fb70bd9mr7179883wru.69.1691064249738;
        Thu, 03 Aug 2023 05:04:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:08 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 14:03:58 +0200
Subject: [PATCH v7 4/9] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-4-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6934;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TK47wN9qNcDXKejya/LAaw6P47MGsBz5Ae0PgRcGuY8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5ewuZM2zifQrlEtoIW8ZZxNdZEGYwJ6lyOyzsTi
 HiLCwt2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsAAKCRB33NvayMhJ0SayEA
 Chgi+PGEs5GmdgnQoadHuDLQC7YeGh41x+FQl41hdn65DMlZtofLDfSjr6NBdJfzpk8gSDvx+RFrd5
 0gSxXiRW0vUCVBha39CXLUUNla/kOF4DtVrhBqVdqBsk4CooHM1QEhrFdNwkc5DLBfz7tJYNPA/tIW
 FhiJaFYPRGiD+bsTiyQsZWQ52YSqTRyJB3DBKO5yvYoTmomGQrgxnHYv+VHqDySYjvqERwTwFO+0KB
 5MlLhcWPxZnuIl8nCappm7hAMwE0EkpHMXoK09hGu/mJcKaApqL8tu6Bjv41NiY/Mj5XVaKG5c1a34
 0TYDQErcScOSVFMSlL7GFk/B6F/fTA/6C6VowM92V6rvJfU/LaCD2ISPNpvVISCduMaltfE9SkYIxf
 lVUcgA9wc/iycftKhzC3qtbRTnblye312ZbhMOTdALCNrxSf2L1JvWt1eQbLFzBFYqJsFH5kyiswRU
 5kMHGuEIWunowQqtZ9sWI0Fjy2UiXRrgkwKsnbu5KNJstnUHfyXTk1wIhZcmVYC0kEemcRRTwqwfYP
 x7U/EG+8LrM5CtEG3V2ZcnYwqHo37EBUccSb/8tZUKpHPdWtZdgi5xrTHU/yLiIueqTe8TuuK7S418
 jUAJvOou8wwN+Tk4ztLdbjfp1oVkcwHn8Lxol9uQMlJu7fQaOlna5KJnzhNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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
 drivers/clk/meson/g12a.c | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 5d62134335c1..552c8efb1ad8 100644
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
 
@@ -3215,19 +3216,22 @@ static struct clk_regmap g12a_vclk_div = {
 };
 
 static struct clk_regmap g12a_vclk2_div = {
-	.data = &(struct clk_regmap_div_data){
+	.data = &(struct clk_regmap_vclk_div_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.shift = 0,
 		.width = 8,
+		.enable_bit_idx = 16,
+		.reset_bit_idx = 17,
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
 
@@ -3246,16 +3250,17 @@ static struct clk_regmap g12a_vclk = {
 };
 
 static struct clk_regmap g12a_vclk2 = {
-	.data = &(struct clk_regmap_gate_data){
+	.data = &(struct clk_regmap_vclk_data){
 		.offset = HHI_VIID_CLK_CNTL,
-		.bit_idx = 19,
+		.enable_bit_idx = 19,
+		.reset_bit_idx = 15,
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
 
@@ -3339,7 +3344,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3353,7 +3358,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3367,7 +3372,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3381,7 +3386,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3395,7 +3400,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3461,6 +3466,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
 			&g12a_vclk2_div2_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3474,6 +3480,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
 			&g12a_vclk2_div4_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3487,6 +3494,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
 			&g12a_vclk2_div6_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3500,6 +3508,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
 			&g12a_vclk2_div12_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3561,7 +3570,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_cts_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3717,7 +3726,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3729,7 +3738,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
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


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB807156F1
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 09:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjE3HiV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 03:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjE3HiU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:38:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F46DEC
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30ae141785bso3118268f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432296; x=1688024296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/Rzsy455UWJxoydYIeagZhdFB/pfUgTfB7t2+UiAU4=;
        b=C6RCwuEb1eYa1ttEsUpZLRkJuPdxKNyRPnwbV1b/TV7SucFU8GuJZOYZmKYupVqUh4
         fBLXDuP8C7sMxhzaLU2/NDLjmk6nH69VrMxFOgVJ924qnsksvGYBgn3ntLZszcOguI68
         00N+iSk3cNqJw8qfc4mUJBnmg8Mx2nVt5y4uH9uoxchS6erzYC2j7vsf0LKnf00BCJ1R
         Zu3ggqcYXtEoNm1ZrJJQqzs/iJ4d51Cmc2zg+rwqrkI3yyF6lCck9fdckPvw6Y/Ey/7x
         DmdUW0RxmhUG5IUYsxllNiZRucLw39WN61gU60R73GIQsCpyONoguV6+h1pswdVY0xq8
         jHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432296; x=1688024296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/Rzsy455UWJxoydYIeagZhdFB/pfUgTfB7t2+UiAU4=;
        b=S6+yfQrLBQALUzbZIfmmoVKiAp1bQWiRyDnaFwETk/8F/8PmkBLX9wwICDGHH2iluN
         Gsl2yf0D4qnStG858xov64SZ62wI0KdLhll+bdBuW1B46ImqBN1KlhXVc0B+Pipi7Cjr
         LNQwYUIVqMn4h6DBH+d5/Hl+FT0g84FeQxCHpgM5F7dfpzKAHEoOoUswS8av+20JLvNN
         5OzEt63nNjgPeKBHtF1GSGgqL4803PQQ6yf6m8JCMuKjwPUUdmpLN+6R6sLY2ok+aNve
         SjPMfMlC8k3VivmmSh1H14Gjlyz21zWlcK/WtnYXWBne7maGioUssk9efWgi7+RXCATb
         M/2w==
X-Gm-Message-State: AC+VfDwkMxk5WVOXMpKDLvghmiVwLRYfQUccyK1HQD4iJEQvOZYE804v
        Ha6nWZpCnYe2XOZnLd5Et2v5jg==
X-Google-Smtp-Source: ACHHUZ6kHAz1oiPKEQXK33denrSn5kXBLF1cckfBI8jkzp4y43WjxLeKORl/3ABRzZa9UKhLM60xZQ==
X-Received: by 2002:a5d:5508:0:b0:307:a5d1:dbae with SMTP id b8-20020a5d5508000000b00307a5d1dbaemr755726wrv.71.1685432295998;
        Tue, 30 May 2023 00:38:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:15 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:03 +0200
Subject: [PATCH v5 02/17] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-2-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4770;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YshimAv78sTusx5XlbLyLaKmvGYFuT/Nlues9OXV98A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafdZGnB9zL+CgnVBMve1Z9B0LfgNI/N9xYPM8bx
 JoupRWiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3QAKCRB33NvayMhJ0Rl7EA
 CJucqpVwIaz1WC0N5elAKMHy0ZF1CnPdHViDAjTl5eMgn20LIrKiWHzVEJCQYdpHUDvPsdsUjLbPol
 hIXuZOUC4KyTS/dVAwlapVMxSOTolFQQwFBSnc7u98i18ElJu9ONLburHqKdNdtdkvFMi7Q41+Uqu0
 wkMxecsNgWxUJlN12Zgd0EoynpJEwy8Useyf8fSc5/XqIF96HpITRB4uPQIMVB7ONHwaLhY8vJD+Oe
 RsASCAup7UujZWZQor7gksEW4VRWO/EUNGzTIadFkHr6CfutBp0InSQtKXe52FIzLHaKXObS2LnvIM
 nWvRMq4HhG6zqQdY4sfxGJHJ31dkZUgSVxMW2yMejHhGENvttn/7pdaiiqvubrFyStRJK3+OEcFpMV
 stKm6BJpLUMogz21ysc7PNwmeqdFTiE0mI6ojBV5Gq8b/1rsFvD9L9T9qfNgCNDKtoWa5adCt5YTHe
 /3Pmva1VUIDOjHRRh4kfZi5bZPjcv3FZrG/AuogP0jux1bLPfg8FLnw2KVfEtZrMb+SjJYa3y/oYba
 kbqrXFMLJeiazu7xfDNoCkEc58zpXyWZXT2l2UB5ilAjGF+zMWQoo4Px5oZVxCsSo3w4ccC9A8LtB+
 0V9N6+2VgBCBU2zUhmOk9XGJomDJsx3sE2uErEJ0p5MhZZYOrP8Nz3r8QlHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  4 +++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d2e481ae2429..a132aad2aac9 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3547,6 +3547,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_cts_sel,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_cts_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -3626,6 +3642,22 @@ static struct clk_regmap g12a_cts_encp = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL2,
@@ -4406,10 +4438,12 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
+		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4635,10 +4669,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
+		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4899,10 +4935,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
+		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -5133,10 +5171,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vclk2_div12_en,
 	&g12a_cts_enci_sel,
 	&g12a_cts_encp_sel,
+	&g12a_cts_encl_sel,
 	&g12a_cts_vdac_sel,
 	&g12a_hdmi_tx_sel,
 	&g12a_cts_enci,
 	&g12a_cts_encp,
+	&g12a_cts_encl,
 	&g12a_cts_vdac,
 	&g12a_hdmi_tx,
 	&g12a_hdmi_sel,
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index a57f4a9717db..9a3091fcaa41 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -265,8 +265,10 @@
 #define CLKID_PRIV_NNA_CORE_CLK_SEL		265
 #define CLKID_PRIV_NNA_CORE_CLK_DIV		266
 #define CLKID_PRIV_MIPI_DSI_PXCLK_DIV		268
+#define CLKID_PRIV_CTS_ENCL			271
+#define CLKID_PRIV_CTS_ENCL_SEL			272
 
-#define NR_CLKS					271
+#define NR_CLKS					273
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>

-- 
2.34.1


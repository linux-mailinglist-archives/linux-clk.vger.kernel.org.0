Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BABB576459B
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jul 2023 07:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjG0FfN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jul 2023 01:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbjG0Fep (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:34:45 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781082D78
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:20 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b9e9765f2cso3290055ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436058; x=1691040858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv/BMVL/ZNeEbINcL/4raUcc3c4bebGIY3s5gcWMzMg=;
        b=AwhaRTb2XGZ8++zthKDFi0GoOgt4+AVSjoTKSwiALiQQfTPGrPlFN+zCC8OWvcLTbq
         MfvVbI0dWwjGzIUIpdfqUWOoDD7RfOuW1jr4X0z1bxyzLoZp+QhMiemlaWzsQ92tzTDl
         HWr1XP4mnBkJMuq8q5Mdow078dYC7uM8hw4ZEqpNUfi17JkcwscH3UuKakFdKk9soN45
         uowuT5dCIe0i391ceDEtUOH4lCXXGgwceVzTOCS31daBC+Mfz8N42/z8HsQ8hh9RMKu3
         D/EsXHz2kOh9f0k48Wi93ky423/BsO7uWgWKY/S76mc+QuPCTTwelVeweANl3HkRimjS
         /c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436058; x=1691040858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv/BMVL/ZNeEbINcL/4raUcc3c4bebGIY3s5gcWMzMg=;
        b=kntGQXtDqhATCjE86WcFkMdf9x3tWeX5hE7/CGwLKcZifG1CymL2ZASgf2tUs2JntT
         xkSNk7sDrslF++gOA40LGjI4+paF2Gz/pzzh1vbA21RkunOnlZ0A2F0Mq9+xu0b4BjhB
         fvyKuw6DVfjHXTk6vkeToz15sXR6t2I6XhJMCgMCXcbfIckbG5PGyGjeopsmKbaGniY9
         +Wltwxe4QteXcw+FU4Er6G+OJ6jPcg5PLcGoETIHnAd3Sfq/sTsnpAnA2qxc8RD6j6fa
         Y24F/OYcNdJmM2rQyP1LXCzA00UR0FrLVhdxTSWEL2nWZLodi5oBWuLYXbOsVYX1QS6q
         1Y2g==
X-Gm-Message-State: ABy/qLaJSxNpH+48mqKt/Ox+lPfTXg8ZkDuPM2qibxBNnEhLDCDi7ryv
        GC1lHO6ZT1gK5jLtcTwtLfa2sg==
X-Google-Smtp-Source: APBJJlELQG6oURUodMw1YgwQCG0dIqzVNWhe4qROJGNFhczx0pxHNp2MdbJMh+cQ5ErPIWttcG8Dug==
X-Received: by 2002:a17:902:8210:b0:1b8:9552:2249 with SMTP id x16-20020a170902821000b001b895522249mr3216329pln.43.1690436058098;
        Wed, 26 Jul 2023 22:34:18 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:34:17 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 15/42] clk: at91: at91sam9x5: switch to parent_hw and parent_data
Date:   Thu, 27 Jul 2023 08:31:29 +0300
Message-Id: <20230727053156.13587-16-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9x5.c | 123 +++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 13331e015dd7..8b2747091b03 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
@@ -38,9 +39,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.out = plla_out,
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } at91sam9x5_systemck[] = {
@@ -48,12 +49,12 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "smdck", .p = "smdclk",   .id = 4 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "smdck", .id = 4 },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
@@ -133,25 +134,29 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 					const struct pck *extra_pcks,
 					bool has_lcdck)
 {
+	struct clk_hw *slow_clk_hw, *main_xtal_hw, *main_rc_hw, *main_osc_hw;
+	struct clk_hw *parent_hws[6], *smdck_hw, *usbck_hw, *hw;
+	static struct clk_parent_data parent_data;
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *slck_name, *mainxtal_name;
+	const char *main_xtal_name = "main_xtal";
 	struct pmc_data *at91sam9x5_pmc;
-	const char *parent_names[6];
 	struct regmap *regmap;
-	struct clk_hw *hw;
+	struct clk *clk;
 	int i;
 	bool bypass;
 
-	i = of_property_match_string(np, "clock-names", "slow_clk");
-	if (i < 0)
+	clk = of_clk_get_by_name(np, "slow_clk");
+	if (IS_ERR(clk))
 		return;
-
-	slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
+	slow_clk_hw = __clk_get_hw(clk);
+	if (!slow_clk_hw)
+		return;
+	clk = of_clk_get_by_name(np, main_xtal_name);
+	if (IS_ERR(clk))
+		return;
+	main_xtal_hw = __clk_get_hw(clk);
+	if (!main_xtal_hw)
 		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -162,56 +167,57 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (!at91sam9x5_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	parent_data.name = main_xtal_name;
+	parent_data.fw_name = main_xtal_name;
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &parent_data,
+						 bypass);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_hws[0] = main_rc_hw;
+	parent_hws[1] = main_osc_hw;
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9x5_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, at91sam9x5_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9x5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_hws[0] = slow_clk_hw;
+	parent_hws[1] = at91sam9x5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = at91sam9x5_pmc->chws[PMC_PLLACK];
+	parent_hws[3] = at91sam9x5_pmc->chws[PMC_UTMI];
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_hws,
 					   &at91sam9x5_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL, hw,
 					  &at91sam9x5_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
@@ -220,28 +226,28 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 
 	at91sam9x5_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_hws[0] = at91sam9x5_pmc->chws[PMC_PLLACK];
+	parent_hws[1] = at91sam9x5_pmc->chws[PMC_UTMI];
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_hws, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_hws, 2);
+	if (IS_ERR(smdck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_hws[0] = slow_clk_hw;
+	parent_hws[1] = at91sam9x5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = at91sam9x5_pmc->chws[PMC_PLLACK];
+	parent_hws[3] = at91sam9x5_pmc->chws[PMC_UTMI];
+	parent_hws[4] = at91sam9x5_pmc->chws[PMC_MCK];
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_hws, 5, i,
 						    &at91sam9x5_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -250,9 +256,16 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		at91sam9x5_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	at91sam9x5_systemck[0].parent_hw = at91sam9x5_pmc->chws[PMC_MCK];
+	at91sam9x5_systemck[1].parent_hw = smdck_hw;
+	at91sam9x5_systemck[2].parent_hw = usbck_hw;
+	at91sam9x5_systemck[3].parent_hw = usbck_hw;
+	at91sam9x5_systemck[4].parent_hw = at91sam9x5_pmc->pchws[0];
+	at91sam9x5_systemck[5].parent_hw = at91sam9x5_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9x5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9x5_systemck[i].n,
-					      at91sam9x5_systemck[i].p, NULL,
+					      NULL, at91sam9x5_systemck[i].parent_hw,
 					      at91sam9x5_systemck[i].id,
 					      at91sam9x5_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -262,8 +275,8 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	}
 
 	if (has_lcdck) {
-		hw = at91_clk_register_system(regmap, "lcdck", "masterck_div",
-					      NULL, 3, 0);
+		hw = at91_clk_register_system(regmap, "lcdck", NULL,
+					      at91sam9x5_pmc->chws[PMC_MCK], 3, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -274,7 +287,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 at91sam9x5_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL, at91sam9x5_pmc->chws[PMC_MCK],
 							 at91sam9x5_periphck[i].id,
 							 &range, INT_MIN, 0);
 		if (IS_ERR(hw))
@@ -287,7 +300,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 extra_pcks[i].n,
-							 "masterck_div", NULL,
+							 NULL, at91sam9x5_pmc->chws[PMC_MCK],
 							 extra_pcks[i].id,
 							 &range, INT_MIN, 0);
 		if (IS_ERR(hw))
-- 
2.39.2


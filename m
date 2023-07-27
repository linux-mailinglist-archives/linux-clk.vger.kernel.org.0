Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AF57645AF
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jul 2023 07:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbjG0Fgd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jul 2023 01:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjG0Ff6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:35:58 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA803588
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:20 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bbc64f9a91so4641005ad.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436102; x=1691040902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPc4xkfMOnwN3v1hN3TZE1CkBeQhVeO0+VXhvPhtWPg=;
        b=GMmp5BcXZd9dB3f7uXMLXzpogGD0Qvb2qTdk7XviCAzh1sJjgA89Cm7hs9GVw/wu29
         JA7HMRoKd0Tymzjq9Z6A8mdPmDjBh9EVesGrYmnKFbL20CMdb9u+57njwBKvMYwtCa7a
         SZb+sW4OYK+YrdDxEL/983P9ZSl/KXoNkl4VqRdUhW108Tj+NVgjKVckbKKeXM0isDn4
         dDJa0roLpUO76vhPH+sy4a8XQupAh5CAuRPXUq4TpaYrE6lZjIvejCbBdNnsOzj9yKId
         i4joV5DpVrJIJ2PxJkXxqTvDT+EiKBtSxkT1baX/p/wzzEkydmJ1eNIu/3EiXSVyW9ol
         Pw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436102; x=1691040902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPc4xkfMOnwN3v1hN3TZE1CkBeQhVeO0+VXhvPhtWPg=;
        b=kQGXJUf0sxDL8x6OxVzwdcKP95aaqEk7+OF6qTU2pIj99Udb5ZSXEmzPbGvYxrdJds
         8NOb2s+fbsLo+OdFP1ldvCcA51NIzpxOm72W3L5YzSGqePX0XgyqirkhLkYMqU2OZKGR
         Stv4hJxmd1vVc274BGkibV8ZrOhqjGnx8yaOt5Ik4kuY/wujX/vfy1iAHkg+MpJkzi1M
         ay8r7j7Bx1BQG4powwn3XBVpNtn48l96O+D8j3mCiQ+M5DrQSDqNDTDrWnEXirm386KX
         sZGaTbtGl2OgysANzAL5Lj9UUH9QAV4dxYvwT4j/UmflaGoaomOsN//olJxM4Ngch+T0
         Yjog==
X-Gm-Message-State: ABy/qLb35K4242yrPlSOTAnE3x7F+t3bnZSzKITlm7Xyc6KauNMBTchi
        yx5faJIaKfIs60AWSuCFj4TnGA==
X-Google-Smtp-Source: APBJJlGvsyYVwugQYrfhrhzSrbO30GTHiLg6TStd308FuhX3YzF02NHK7qv4MWcydZg/iiIMBpj80Q==
X-Received: by 2002:a17:902:830c:b0:1bb:83cd:ad83 with SMTP id bd12-20020a170902830c00b001bb83cdad83mr3513348plb.28.1690436101995;
        Wed, 26 Jul 2023 22:35:01 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:01 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 21/42] clk: at91: at91sam9g45: switch to parent_hw and parent_data
Date:   Thu, 27 Jul 2023 08:31:35 +0300
Message-Id: <20230727053156.13587-22-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch AT91SAM9G45 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9g45.c | 92 +++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index cb98d22c2e30..684ce0f79d3b 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
@@ -37,9 +38,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.out = plla_out,
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } at91sam9g45_systemck[] = {
@@ -47,10 +48,10 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck", .p = "usbck",        .id = 6 },
-	{ .n = "pck0",  .p = "prog0",        .id = 8 },
-	{ .n = "pck1",  .p = "prog1",        .id = 9 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 struct pck {
@@ -92,24 +93,28 @@ static const struct pck at91sam9g45_periphck[] = {
 
 static void __init at91sam9g45_pmc_setup(struct device_node *np)
 {
-	const char *slck_name, *mainxtal_name;
+	struct clk_hw *parent_hws[5], *usbck_hw, *hw;
+	struct clk_hw *slow_clk_hw, *main_xtal_hw;
+	static struct clk_parent_data parent_data;
+	const char *main_xtal_name = "main_xtal";
 	struct pmc_data *at91sam9g45_pmc;
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
@@ -123,40 +128,42 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
+	parent_data.name = main_xtal_name;
+	parent_data.fw_name = main_xtal_name;
+	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &parent_data,
 					bypass);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9g45_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, at91sam9g45_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_hws[0] = slow_clk_hw;
+	parent_hws[1] = at91sam9g45_pmc->chws[PMC_MAIN];
+	parent_hws[2] = at91sam9g45_pmc->chws[PMC_PLLACK];
+	parent_hws[3] = at91sam9g45_pmc->chws[PMC_UTMI];
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_hws,
 					   &at91rm9200_master_layout,
 					   &mck_characteristics,
 					   &at91sam9g45_mck_lock);
@@ -164,7 +171,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, hw,
 					  &at91rm9200_master_layout,
 					  &mck_characteristics,
 					  &at91sam9g45_mck_lock,
@@ -174,24 +181,24 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	at91sam9g45_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_hws[0] = at91sam9g45_pmc->chws[PMC_PLLACK];
+	parent_hws[1] = at91sam9g45_pmc->chws[PMC_UTMI];
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_hws, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_hws[0] = slow_clk_hw;
+	parent_hws[1] = at91sam9g45_pmc->chws[PMC_MAIN];
+	parent_hws[2] = at91sam9g45_pmc->chws[PMC_PLLACK];
+	parent_hws[3] = at91sam9g45_pmc->chws[PMC_UTMI];
+	parent_hws[4] = at91sam9g45_pmc->chws[PMC_MCK];
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_hws, 5, i,
 						    &at91sam9g45_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -200,9 +207,14 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 		at91sam9g45_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	at91sam9g45_systemck[0].parent_hw = at91sam9g45_pmc->chws[PMC_MCK];
+	at91sam9g45_systemck[1].parent_hw = usbck_hw;
+	at91sam9g45_systemck[2].parent_hw = at91sam9g45_pmc->pchws[0];
+	at91sam9g45_systemck[3].parent_hw = at91sam9g45_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9g45_systemck[i].n,
-					      at91sam9g45_systemck[i].p, NULL,
+					      NULL, at91sam9g45_systemck[i].parent_hw,
 					      at91sam9g45_systemck[i].id,
 					      at91sam9g45_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -214,7 +226,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91sam9g45_periphck[i].n,
-						  "masterck_div", NULL,
+						  NULL, at91sam9g45_pmc->chws[PMC_MCK],
 						  at91sam9g45_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.39.2


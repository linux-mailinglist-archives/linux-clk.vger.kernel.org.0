Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231582A92B1
	for <lists+linux-clk@lfdr.de>; Fri,  6 Nov 2020 10:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgKFJ3P (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Nov 2020 04:29:15 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:35823 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgKFJ3N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Nov 2020 04:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604654952; x=1636190952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jRySOwngjZXetLWtyCkZ3n2Rb4qk8st7rZKktQp9ai4=;
  b=NP6fAx2K5aQOQmPpLGDDW8suTagoVod7IWlCILEouvvTweb4hbM28j0f
   C8Sl0SLhEQz39OcJZuXtMuEpKTcJ33BMIKz650FGaUkl8+57FWLPai/er
   98ea3gi3ufzW8r/0/C3AHe4BPWq7GDY9U/HpUk5cmznW9BQnNnUyRF5Ws
   0FENveOiuyLmROid07ajcOsuyoc+e1qc3PR6rNI/NdpJ44o9Ta/86jiWV
   huLLI6QFJaNeS6z2u1CKUDoVEF1uK9sFkvvC+synHuNoZh8B+l6+ZaN63
   br1oKd4ppTPSJPbO1vIhopRCif1vErgwcbvOzclHbDekqDCln3+7Pesvf
   w==;
IronPort-SDR: MaGgyc6S4wd+Js00sejIIvK7TLgA3+8nXdO9s/SzoT2vjvzdJFtUUxLrPljfhlnIPG5oxvOdab
 F5XtKvJqueztZOF8uqBWCLpTzsOCgyYqfbOcnuc1eRnwqArYeHbpr0vQqf6wZ4LZydGSuVn+ob
 tgF6GbktHhj5BqoPATdw46C/hT9DqEXTj0TxQTDFvJTI7SofDQSfFyPS92YDdHBK7xSIBY1LgF
 /532vyl97uOFmWaykMGtbeo7AvUKGLDfIobO/+l7SB909zq0a+QyeEnxvyIh5QnYPmycoMusac
 +vw=
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="32677812"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Nov 2020 02:29:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 6 Nov 2020 02:29:05 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 6 Nov 2020 02:29:00 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <eugen.hristev@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 10/11] clk: at91: clk-master: re-factor master clock
Date:   Fri, 6 Nov 2020 11:28:03 +0200
Message-ID: <1604654884-30339-11-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604654884-30339-1-git-send-email-claudiu.beznea@microchip.com>
References: <1604654884-30339-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Re-factor master clock driver by splitting it into 2 clocks: prescaller
and divider clocks. Based on registered clock flags the prescaler's rate
could be changed at runtime. This is necessary for platforms supporting
DVFS (e.g. SAMA7G5) where master clock could be changed at run-time.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/at91rm9200.c  |  21 ++-
 drivers/clk/at91/at91sam9260.c |  26 +++-
 drivers/clk/at91/at91sam9g45.c |  32 ++--
 drivers/clk/at91/at91sam9n12.c |  36 +++--
 drivers/clk/at91/at91sam9rl.c  |  23 ++-
 drivers/clk/at91/at91sam9x5.c  |  28 +++-
 drivers/clk/at91/clk-master.c  | 326 +++++++++++++++++++++++++++++++++++------
 drivers/clk/at91/dt-compat.c   |  15 +-
 drivers/clk/at91/pmc.h         |  16 +-
 drivers/clk/at91/sam9x60.c     |  23 ++-
 drivers/clk/at91/sama5d2.c     |  42 ++++--
 drivers/clk/at91/sama5d3.c     |  38 +++--
 drivers/clk/at91/sama5d4.c     |  40 +++--
 drivers/clk/at91/sama7g5.c     |  13 +-
 14 files changed, 531 insertions(+), 148 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 2c3d8e6ca63c..0fad1009f315 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(rm9200_mck_lock);
+
 struct sck {
 	char *n;
 	char *p;
@@ -137,9 +139,20 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "pllack";
 	parent_names[3] = "pllbck";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91rm9200_master_layout,
-				      &rm9200_mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91rm9200_master_layout,
+					   &rm9200_mck_characteristics,
+					   &rm9200_mck_lock, CLK_SET_RATE_GATE,
+					   INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91rm9200_master_layout,
+					  &rm9200_mck_characteristics,
+					  &rm9200_mck_lock, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -181,7 +194,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91rm9200_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91rm9200_periphck[i].n,
-						  "masterck",
+						  "masterck_div",
 						  at91rm9200_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index bb81ff731ad8..ceb5495f723a 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -32,6 +32,8 @@ struct at91sam926x_data {
 	bool has_slck;
 };
 
+static DEFINE_SPINLOCK(at91sam9260_mck_lock);
+
 static const struct clk_master_characteristics sam9260_mck_characteristics = {
 	.output = { .min = 0, .max = 105000000 },
 	.divisors = { 1, 2, 4, 0 },
@@ -218,8 +220,8 @@ static const struct sck at91sam9261_systemck[] = {
 	{ .n = "pck1",  .p = "prog1",    .id = 9 },
 	{ .n = "pck2",  .p = "prog2",    .id = 10 },
 	{ .n = "pck3",  .p = "prog3",    .id = 11 },
-	{ .n = "hclk0", .p = "masterck", .id = 16 },
-	{ .n = "hclk1", .p = "masterck", .id = 17 },
+	{ .n = "hclk0", .p = "masterck_div", .id = 16 },
+	{ .n = "hclk1", .p = "masterck_div", .id = 17 },
 };
 
 static const struct pck at91sam9261_periphck[] = {
@@ -413,9 +415,21 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	parent_names[1] = "mainck";
 	parent_names[2] = "pllack";
 	parent_names[3] = "pllbck";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91rm9200_master_layout,
-				      data->mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91rm9200_master_layout,
+					   data->mck_characteristics,
+					   &at91sam9260_mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91rm9200_master_layout,
+					  data->mck_characteristics,
+					  &at91sam9260_mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -457,7 +471,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	for (i = 0; i < data->num_pck; i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  data->pck[i].n,
-						  "masterck",
+						  "masterck_div",
 						  data->pck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index cb4a406ed15d..0214333dedd3 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(at91sam9g45_mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 0, .max = 133333333 },
 	.divisors = { 1, 2, 4, 3 },
@@ -40,10 +42,10 @@ static const struct {
 	char *p;
 	u8 id;
 } at91sam9g45_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
+	{ .n = "uhpck", .p = "usbck",        .id = 6 },
+	{ .n = "pck0",  .p = "prog0",        .id = 8 },
+	{ .n = "pck1",  .p = "prog1",        .id = 9 },
 };
 
 struct pck {
@@ -148,9 +150,21 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91rm9200_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91rm9200_master_layout,
+					   &mck_characteristics,
+					   &at91sam9g45_mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91rm9200_master_layout,
+					  &mck_characteristics,
+					  &at91sam9g45_mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -166,7 +180,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
@@ -195,7 +209,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91sam9g45_periphck[i].n,
-						  "masterck",
+						  "masterck_div",
 						  at91sam9g45_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index 93f7eb216122..f9db5316a7f1 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(at91sam9n12_mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 0, .max = 133333333 },
 	.divisors = { 1, 2, 4, 3 },
@@ -54,12 +56,12 @@ static const struct {
 	char *p;
 	u8 id;
 } at91sam9n12_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
-	{ .n = "lcdck", .p = "masterck", .id = 3 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
+	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
+	{ .n = "uhpck", .p = "usbck",        .id = 6 },
+	{ .n = "udpck", .p = "usbck",        .id = 7 },
+	{ .n = "pck0",  .p = "prog0",        .id = 8 },
+	{ .n = "pck1",  .p = "prog1",        .id = 9 },
 };
 
 static const struct clk_pcr_layout at91sam9n12_pcr_layout = {
@@ -175,9 +177,21 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "pllbck";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91sam9x5_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91sam9x5_master_layout,
+					   &mck_characteristics,
+					   &at91sam9n12_mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91sam9x5_master_layout,
+					  &mck_characteristics,
+					  &at91sam9n12_mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -191,7 +205,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "pllbck";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
@@ -221,7 +235,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9n12_pcr_layout,
 							 at91sam9n12_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 at91sam9n12_periphck[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index a343eb69bb35..66736e03cfef 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(sam9rl_mck_lock);
+
 static const struct clk_master_characteristics sam9rl_mck_characteristics = {
 	.output = { .min = 0, .max = 94000000 },
 	.divisors = { 1, 2, 4, 0 },
@@ -117,9 +119,20 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "pllack";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91rm9200_master_layout,
-				      &sam9rl_mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91rm9200_master_layout,
+					   &sam9rl_mck_characteristics,
+					   &sam9rl_mck_lock, CLK_SET_RATE_GATE,
+					   INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91rm9200_master_layout,
+					  &sam9rl_mck_characteristics,
+					  &sam9rl_mck_lock, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -129,7 +142,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "pllack";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
@@ -158,7 +171,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91sam9rl_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91sam9rl_periphck[i].n,
-						  "masterck",
+						  "masterck_div",
 						  at91sam9rl_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 22b9aad9efb8..79b9d3667228 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 0, .max = 133333333 },
 	.divisors = { 1, 2, 4, 3 },
@@ -41,7 +43,7 @@ static const struct {
 	char *p;
 	u8 id;
 } at91sam9x5_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
 	{ .n = "smdck", .p = "smdclk",   .id = 4 },
 	{ .n = "uhpck", .p = "usbck",    .id = 6 },
 	{ .n = "udpck", .p = "usbck",    .id = 7 },
@@ -196,9 +198,19 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91sam9x5_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91sam9x5_master_layout,
+					   &mck_characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91sam9x5_master_layout,
+					  &mck_characteristics, &mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -218,7 +230,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
@@ -245,7 +257,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	}
 
 	if (has_lcdck) {
-		hw = at91_clk_register_system(regmap, "lcdck", "masterck", 3);
+		hw = at91_clk_register_system(regmap, "lcdck", "masterck_div", 3);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -256,7 +268,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 at91sam9x5_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 at91sam9x5_periphck[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
@@ -269,7 +281,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 extra_pcks[i].n,
-							 "masterck",
+							 "masterck_div",
 							 extra_pcks[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index aafd003b30cf..32af4f65bb23 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -58,83 +58,308 @@ static inline bool clk_master_ready(struct clk_master *master)
 static int clk_master_prepare(struct clk_hw *hw)
 {
 	struct clk_master *master = to_clk_master(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(master->lock, flags);
 
 	while (!clk_master_ready(master))
 		cpu_relax();
 
+	spin_unlock_irqrestore(master->lock, flags);
+
 	return 0;
 }
 
 static int clk_master_is_prepared(struct clk_hw *hw)
 {
 	struct clk_master *master = to_clk_master(hw);
+	unsigned long flags;
+	bool status;
 
-	return clk_master_ready(master);
+	spin_lock_irqsave(master->lock, flags);
+	status = clk_master_ready(master);
+	spin_unlock_irqrestore(master->lock, flags);
+
+	return status;
 }
 
-static unsigned long clk_master_recalc_rate(struct clk_hw *hw,
-					    unsigned long parent_rate)
+static unsigned long clk_master_div_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
 {
-	u8 pres;
 	u8 div;
-	unsigned long rate = parent_rate;
+	unsigned long flags, rate = parent_rate;
 	struct clk_master *master = to_clk_master(hw);
 	const struct clk_master_layout *layout = master->layout;
 	const struct clk_master_characteristics *characteristics =
 						master->characteristics;
 	unsigned int mckr;
 
+	spin_lock_irqsave(master->lock, flags);
 	regmap_read(master->regmap, master->layout->offset, &mckr);
+	spin_unlock_irqrestore(master->lock, flags);
+
 	mckr &= layout->mask;
 
-	pres = (mckr >> layout->pres_shift) & MASTER_PRES_MASK;
 	div = (mckr >> MASTER_DIV_SHIFT) & MASTER_DIV_MASK;
 
-	if (characteristics->have_div3_pres && pres == MASTER_PRES_MAX)
-		rate /= 3;
-	else
-		rate >>= pres;
-
 	rate /= characteristics->divisors[div];
 
 	if (rate < characteristics->output.min)
-		pr_warn("master clk is underclocked");
+		pr_warn("master clk div is underclocked");
 	else if (rate > characteristics->output.max)
-		pr_warn("master clk is overclocked");
+		pr_warn("master clk div is overclocked");
 
 	return rate;
 }
 
-static u8 clk_master_get_parent(struct clk_hw *hw)
+static int clk_master_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
 {
 	struct clk_master *master = to_clk_master(hw);
+	const struct clk_master_characteristics *characteristics =
+						master->characteristics;
+	unsigned long flags;
+	int div, i;
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_GATE)
+		return 0;
+
+	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	if (div > ARRAY_SIZE(characteristics->divisors))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(characteristics->divisors); i++) {
+		if (!characteristics->divisors[i])
+			break;
+
+		if (div == characteristics->divisors[i]) {
+			div = i;
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(characteristics->divisors))
+		return -EINVAL;
+
+	spin_lock_irqsave(master->lock, flags);
+	regmap_update_bits(master->regmap, master->layout->offset,
+			   (MASTER_DIV_MASK << MASTER_DIV_SHIFT),
+			   (div << MASTER_DIV_SHIFT));
+	while (!clk_master_ready(master))
+		cpu_relax();
+	spin_unlock_irqrestore(master->lock, flags);
+
+	return 0;
+}
+
+static int clk_master_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_master *master = to_clk_master(hw);
+	const struct clk_master_characteristics *characteristics =
+						master->characteristics;
+	struct clk_hw *parent;
+	unsigned long parent_rate, tmp_rate, best_rate = 0;
+	int i, best_diff = INT_MIN, tmp_diff;
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_GATE)
+		return -EOPNOTSUPP;
+
+	parent = clk_hw_get_parent(hw);
+	if (!parent)
+		return -EINVAL;
+
+	parent_rate = clk_hw_get_rate(parent);
+	if (!parent_rate)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(characteristics->divisors); i++) {
+		if (!characteristics->divisors[i])
+			break;
+
+		tmp_rate = DIV_ROUND_CLOSEST_ULL(parent_rate,
+						 characteristics->divisors[i]);
+		tmp_diff = abs(tmp_rate - req->rate);
+
+		if (!best_rate || best_diff > tmp_diff) {
+			best_diff = tmp_diff;
+			best_rate = tmp_rate;
+		}
+
+		if (!best_diff)
+			break;
+	}
+
+	req->best_parent_rate = best_rate;
+	req->best_parent_hw = parent;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static const struct clk_ops master_div_ops = {
+	.prepare = clk_master_prepare,
+	.is_prepared = clk_master_is_prepared,
+	.recalc_rate = clk_master_div_recalc_rate,
+	.determine_rate = clk_master_div_determine_rate,
+	.set_rate = clk_master_div_set_rate,
+};
+
+static void clk_sama7g5_master_best_diff(struct clk_rate_request *req,
+					 struct clk_hw *parent,
+					 unsigned long parent_rate,
+					 long *best_rate,
+					 long *best_diff,
+					 u32 div)
+{
+	unsigned long tmp_rate, tmp_diff;
+
+	if (div == MASTER_PRES_MAX)
+		tmp_rate = parent_rate / 3;
+	else
+		tmp_rate = parent_rate >> div;
+
+	tmp_diff = abs(req->rate - tmp_rate);
+
+	if (*best_diff < 0 || *best_diff >= tmp_diff) {
+		*best_rate = tmp_rate;
+		*best_diff = tmp_diff;
+		req->best_parent_rate = parent_rate;
+		req->best_parent_hw = parent;
+	}
+}
+
+static int clk_master_pres_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
+{
+	struct clk_master *master = to_clk_master(hw);
+	struct clk_rate_request req_parent = *req;
+	const struct clk_master_characteristics *characteristics =
+							master->characteristics;
+	struct clk_hw *parent;
+	long best_rate = LONG_MIN, best_diff = LONG_MIN;
+	u32 pres;
+	int i;
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_GATE)
+		return 0;
+
+	if (master->chg_pid < 0)
+		return -EOPNOTSUPP;
+
+	parent = clk_hw_get_parent_by_index(hw, master->chg_pid);
+	if (!parent)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i <= MASTER_PRES_MAX; i++) {
+		if (characteristics->have_div3_pres && i == MASTER_PRES_MAX)
+			pres = 3;
+		else
+			pres = 1 << i;
+
+		req_parent.rate = req->rate * pres;
+		if (__clk_determine_rate(parent, &req_parent))
+			continue;
+
+		clk_sama7g5_master_best_diff(req, parent, req_parent.rate,
+					     &best_diff, &best_rate, pres);
+		if (!best_diff)
+			break;
+	}
+
+	return 0;
+}
+
+static int clk_master_pres_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_master *master = to_clk_master(hw);
+	unsigned long flags;
+	unsigned int pres;
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_GATE)
+		return 0;
+
+	pres = DIV_ROUND_CLOSEST(parent_rate, rate);
+	if (pres > MASTER_PRES_MAX)
+		return -EINVAL;
+
+	else if (pres == 3)
+		pres = MASTER_PRES_MAX;
+	else
+		pres = ffs(pres) - 1;
+
+	spin_lock_irqsave(master->lock, flags);
+	regmap_update_bits(master->regmap, master->layout->offset,
+			   (MASTER_PRES_MASK << master->layout->pres_shift),
+			   (pres << master->layout->pres_shift));
+
+	while (!clk_master_ready(master))
+		cpu_relax();
+	spin_unlock_irqrestore(master->lock, flags);
+
+	return 0;
+}
+
+static unsigned long clk_master_pres_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct clk_master *master = to_clk_master(hw);
+	const struct clk_master_characteristics *characteristics =
+						master->characteristics;
+	unsigned long flags;
+	unsigned int val, pres;
+
+	spin_lock_irqsave(master->lock, flags);
+	regmap_read(master->regmap, master->layout->offset, &val);
+	spin_unlock_irqrestore(master->lock, flags);
+
+	pres = (val >> master->layout->pres_shift) & MASTER_PRES_MASK;
+	if (pres == 3 && characteristics->have_div3_pres)
+		pres = 3;
+	else
+		pres = (1 << pres);
+
+	return DIV_ROUND_CLOSEST_ULL(parent_rate, pres);
+}
+
+static u8 clk_master_pres_get_parent(struct clk_hw *hw)
+{
+	struct clk_master *master = to_clk_master(hw);
+	unsigned long flags;
 	unsigned int mckr;
 
+	spin_lock_irqsave(master->lock, flags);
 	regmap_read(master->regmap, master->layout->offset, &mckr);
+	spin_unlock_irqrestore(master->lock, flags);
 
 	return mckr & AT91_PMC_CSS;
 }
 
-static const struct clk_ops master_ops = {
+static const struct clk_ops master_pres_ops = {
 	.prepare = clk_master_prepare,
 	.is_prepared = clk_master_is_prepared,
-	.recalc_rate = clk_master_recalc_rate,
-	.get_parent = clk_master_get_parent,
+	.determine_rate = clk_master_pres_determine_rate,
+	.recalc_rate = clk_master_pres_recalc_rate,
+	.get_parent = clk_master_pres_get_parent,
+	.set_rate = clk_master_pres_set_rate,
 };
 
-struct clk_hw * __init
-at91_clk_register_master(struct regmap *regmap,
+static struct clk_hw * __init
+at91_clk_register_master_internal(struct regmap *regmap,
 		const char *name, int num_parents,
 		const char **parent_names,
 		const struct clk_master_layout *layout,
-		const struct clk_master_characteristics *characteristics)
+		const struct clk_master_characteristics *characteristics,
+		const struct clk_ops *ops, spinlock_t *lock, u32 flags,
+		int chg_pid)
 {
 	struct clk_master *master;
 	struct clk_init_data init;
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !num_parents || !parent_names)
+	if (!name || !num_parents || !parent_names || !lock)
 		return ERR_PTR(-EINVAL);
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
@@ -142,15 +367,17 @@ at91_clk_register_master(struct regmap *regmap,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &master_ops;
+	init.ops = ops;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
-	init.flags = 0;
+	init.flags = flags;
 
 	master->hw.init = &init;
 	master->layout = layout;
 	master->characteristics = characteristics;
 	master->regmap = regmap;
+	master->chg_pid = chg_pid;
+	master->lock = lock;
 
 	hw = &master->hw;
 	ret = clk_hw_register(NULL, &master->hw);
@@ -162,6 +389,35 @@ at91_clk_register_master(struct regmap *regmap,
 	return hw;
 }
 
+struct clk_hw * __init
+at91_clk_register_master_pres(struct regmap *regmap,
+		const char *name, int num_parents,
+		const char **parent_names,
+		const struct clk_master_layout *layout,
+		const struct clk_master_characteristics *characteristics,
+		spinlock_t *lock, u32 flags, int chg_pid)
+{
+	return at91_clk_register_master_internal(regmap, name, num_parents,
+						 parent_names, layout,
+						 characteristics,
+						 &master_pres_ops,
+						 lock, flags, chg_pid);
+}
+
+struct clk_hw * __init
+at91_clk_register_master_div(struct regmap *regmap,
+		const char *name, const char *parent_name,
+		const struct clk_master_layout *layout,
+		const struct clk_master_characteristics *characteristics,
+		spinlock_t *lock, u32 flags)
+{
+	return at91_clk_register_master_internal(regmap, name, 1,
+						 &parent_name, layout,
+						 characteristics,
+						 &master_div_ops,
+						 lock, flags, -EINVAL);
+}
+
 static unsigned long
 clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
 			       unsigned long parent_rate)
@@ -171,30 +427,6 @@ clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST_ULL(parent_rate, (1 << master->div));
 }
 
-static void clk_sama7g5_master_best_diff(struct clk_rate_request *req,
-					 struct clk_hw *parent,
-					 unsigned long parent_rate,
-					 long *best_rate,
-					 long *best_diff,
-					 u32 div)
-{
-	unsigned long tmp_rate, tmp_diff;
-
-	if (div == MASTER_PRES_MAX)
-		tmp_rate = parent_rate / 3;
-	else
-		tmp_rate = parent_rate >> div;
-
-	tmp_diff = abs(req->rate - tmp_rate);
-
-	if (*best_diff < 0 || *best_diff >= tmp_diff) {
-		*best_rate = tmp_rate;
-		*best_diff = tmp_diff;
-		req->best_parent_rate = parent_rate;
-		req->best_parent_hw = parent;
-	}
-}
-
 static int clk_sama7g5_master_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index a50084de97d4..a97b99c2dc12 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -24,6 +24,8 @@
 
 #define GCK_INDEX_DT_AUDIO_PLL	5
 
+static DEFINE_SPINLOCK(mck_lock);
+
 #ifdef CONFIG_HAVE_AT91_AUDIO_PLL
 static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 {
@@ -388,9 +390,16 @@ of_at91_clk_master_setup(struct device_node *np,
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_master(regmap, name, num_parents,
-				      parent_names, layout,
-				      characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
+					   parent_names, layout,
+					   characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto out_free_characteristics;
+
+	hw = at91_clk_register_master_div(regmap, name, "masterck_pres",
+					  layout, characteristics,
+					  &mck_lock, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto out_free_characteristics;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index bedcd85ad750..a49076c804a9 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -155,10 +155,18 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
 			      const char **parent_names, int num_parents);
 
 struct clk_hw * __init
-at91_clk_register_master(struct regmap *regmap, const char *name,
-			 int num_parents, const char **parent_names,
-			 const struct clk_master_layout *layout,
-			 const struct clk_master_characteristics *characteristics);
+at91_clk_register_master_pres(struct regmap *regmap, const char *name,
+			      int num_parents, const char **parent_names,
+			      const struct clk_master_layout *layout,
+			      const struct clk_master_characteristics *characteristics,
+			      spinlock_t *lock, u32 flags, int chg_pid);
+
+struct clk_hw * __init
+at91_clk_register_master_div(struct regmap *regmap, const char *name,
+			     const char *parent_names,
+			     const struct clk_master_layout *layout,
+			     const struct clk_master_characteristics *characteristics,
+			     spinlock_t *lock, u32 flags);
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_master(struct regmap *regmap,
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index e5094c69e606..dc88b752530b 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -8,6 +8,7 @@
 #include "pmc.h"
 
 static DEFINE_SPINLOCK(pmc_pll_lock);
+static DEFINE_SPINLOCK(mck_lock);
 
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 140000000, .max = 200000000 },
@@ -76,11 +77,11 @@ static const struct {
 	char *p;
 	u8 id;
 } sam9x60_systemck[] = {
-	{ .n = "ddrck",  .p = "masterck", .id = 2 },
+	{ .n = "ddrck",  .p = "masterck_div", .id = 2 },
 	{ .n = "uhpck",  .p = "usbck",    .id = 6 },
 	{ .n = "pck0",   .p = "prog0",    .id = 8 },
 	{ .n = "pck1",   .p = "prog1",    .id = 9 },
-	{ .n = "qspick", .p = "masterck", .id = 19 },
+	{ .n = "qspick", .p = "masterck_div", .id = 19 },
 };
 
 static const struct {
@@ -263,9 +264,17 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	parent_names[0] = md_slck_name;
 	parent_names[1] = "mainck";
 	parent_names[2] = "pllack_divck";
-	hw = at91_clk_register_master(regmap, "masterck", 3, parent_names,
-				      &sam9x60_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 3,
+					   parent_names, &sam9x60_master_layout,
+					   &mck_characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres", &sam9x60_master_layout,
+					  &mck_characteristics, &mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -281,7 +290,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	parent_names[0] = md_slck_name;
 	parent_names[1] = td_slck_name;
 	parent_names[2] = "mainck";
-	parent_names[3] = "masterck";
+	parent_names[3] = "masterck_div";
 	parent_names[4] = "pllack_divck";
 	parent_names[5] = "upllck_divck";
 	for (i = 0; i < 2; i++) {
@@ -313,7 +322,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x60_pcr_layout,
 							 sam9x60_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 sam9x60_periphck[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 8b220762941a..9a5cbc7cd55a 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 124000000, .max = 166000000 },
 	.divisors = { 1, 2, 4, 3 },
@@ -40,14 +42,14 @@ static const struct {
 	char *p;
 	u8 id;
 } sama5d2_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
-	{ .n = "lcdck", .p = "masterck", .id = 3 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "iscck", .p = "masterck", .id = 18 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
+	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
+	{ .n = "uhpck", .p = "usbck",        .id = 6 },
+	{ .n = "udpck", .p = "usbck",        .id = 7 },
+	{ .n = "pck0",  .p = "prog0",        .id = 8 },
+	{ .n = "pck1",  .p = "prog1",        .id = 9 },
+	{ .n = "pck2",  .p = "prog2",        .id = 10 },
+	{ .n = "iscck", .p = "masterck_div", .id = 18 },
 };
 
 static const struct {
@@ -235,15 +237,25 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91sam9x5_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91sam9x5_master_layout,
+					   &mck_characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91sam9x5_master_layout,
+					  &mck_characteristics, &mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -259,7 +271,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	parent_names[5] = "audiopll_pmcck";
 	for (i = 0; i < 3; i++) {
 		char name[6];
@@ -290,7 +302,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d2_pcr_layout,
 							 sama5d2_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 sama5d2_periphck[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
@@ -317,7 +329,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	parent_names[5] = "audiopll_pmcck";
 	for (i = 0; i < ARRAY_SIZE(sama5d2_gck); i++) {
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 7c6e0a5b9dc8..87009ee8effc 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 0, .max = 166000000 },
 	.divisors = { 1, 2, 4, 3 },
@@ -40,14 +42,14 @@ static const struct {
 	char *p;
 	u8 id;
 } sama5d3_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
-	{ .n = "lcdck", .p = "masterck", .id = 3 },
-	{ .n = "smdck", .p = "smdclk",   .id = 4 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
+	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
+	{ .n = "smdck", .p = "smdclk",       .id = 4 },
+	{ .n = "uhpck", .p = "usbck",        .id = 6 },
+	{ .n = "udpck", .p = "usbck",        .id = 7 },
+	{ .n = "pck0",  .p = "prog0",        .id = 8 },
+	{ .n = "pck1",  .p = "prog1",        .id = 9 },
+	{ .n = "pck2",  .p = "prog2",        .id = 10 },
 };
 
 static const struct {
@@ -170,9 +172,19 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91sam9x5_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91sam9x5_master_layout,
+					   &mck_characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91sam9x5_master_layout,
+					  &mck_characteristics, &mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -192,7 +204,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
@@ -222,7 +234,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d3_pcr_layout,
 							 sama5d3_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 sama5d3_periphck[i].id,
 							 &sama5d3_periphck[i].r,
 							 INT_MIN);
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 92d8d4141b43..57fff790188b 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -7,6 +7,8 @@
 
 #include "pmc.h"
 
+static DEFINE_SPINLOCK(mck_lock);
+
 static const struct clk_master_characteristics mck_characteristics = {
 	.output = { .min = 125000000, .max = 200000000 },
 	.divisors = { 1, 2, 4, 3 },
@@ -39,14 +41,14 @@ static const struct {
 	char *p;
 	u8 id;
 } sama5d4_systemck[] = {
-	{ .n = "ddrck", .p = "masterck", .id = 2 },
-	{ .n = "lcdck", .p = "masterck", .id = 3 },
-	{ .n = "smdck", .p = "smdclk",   .id = 4 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
+	{ .n = "ddrck", .p = "masterck_div", .id = 2 },
+	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
+	{ .n = "smdck", .p = "smdclk",       .id = 4 },
+	{ .n = "uhpck", .p = "usbck",        .id = 6 },
+	{ .n = "udpck", .p = "usbck",        .id = 7 },
+	{ .n = "pck0",  .p = "prog0",        .id = 8 },
+	{ .n = "pck1",  .p = "prog1",        .id = 9 },
+	{ .n = "pck2",  .p = "prog2",        .id = 10 },
 };
 
 static const struct {
@@ -185,15 +187,25 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
-				      &at91sam9x5_master_layout,
-				      &mck_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
+					   parent_names,
+					   &at91sam9x5_master_layout,
+					   &mck_characteristics, &mck_lock,
+					   CLK_SET_RATE_GATE, INT_MIN);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "masterck_div",
+					  "masterck_pres",
+					  &at91sam9x5_master_layout,
+					  &mck_characteristics, &mck_lock,
+					  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d4_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -215,7 +227,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "plladivck";
 	parent_names[3] = "utmick";
-	parent_names[4] = "masterck";
+	parent_names[4] = "masterck_div";
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
@@ -245,7 +257,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d4_pcr_layout,
 							 sama5d4_periphck[i].n,
-							 "masterck",
+							 "masterck_div",
 							 sama5d4_periphck[i].id,
 							 &range, INT_MIN);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 3924f256da67..be32d9b88d89 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -32,6 +32,7 @@
 	} while (0)
 
 static DEFINE_SPINLOCK(pmc_pll_lock);
+static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
 
 /**
@@ -965,8 +966,16 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	parent_names[1] = "mainck";
 	parent_names[2] = "cpupll_divpmcck";
 	parent_names[3] = "syspll_divpmcck";
-	hw = at91_clk_register_master(regmap, "mck0", 4, parent_names,
-				      &mck0_layout, &mck0_characteristics);
+	hw = at91_clk_register_master_pres(regmap, "mck0_pres", 4, parent_names,
+					   &mck0_layout, &mck0_characteristics,
+					   &pmc_mck0_lock,
+					   CLK_SET_RATE_PARENT, 0);
+	if (IS_ERR(hw))
+		goto err_free;
+
+	hw = at91_clk_register_master_div(regmap, "mck0_div", "mck0_pres",
+					  &mck0_layout, &mck0_characteristics,
+					  &pmc_mck0_lock, 0);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.7.4


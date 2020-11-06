Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D112A9333
	for <lists+linux-clk@lfdr.de>; Fri,  6 Nov 2020 10:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgKFJr2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Nov 2020 04:47:28 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:60469 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgKFJr2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Nov 2020 04:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604656047; x=1636192047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LpIGdMXUlYBgp05KdV0472lXFhdS6mqxCl5tVnVr47M=;
  b=jMnGjRwEJ17YifiCXaLd2MD8S7wTa/Qbi7UOIz/pwsB4UpYs1BoalfIy
   AOP+Wbb+rIKLtZtQt9AsAP9nzGvfDdl2fqo4VpbsUYe1GOcHKGKQ+gpVB
   BSwlvJrie0+ddZb/xfnA9ZjBJi1dcPNDNM6qed4RTSuPfrHvBqjlIX2Xp
   IdKxtrvnCv3gRF6iCb5AyvMbL17oRS/O112Rf841Pbi5QCJc6LMSxasrK
   MLDhQ/at++x7IUnfkhu6TCFjr10aEMKOAxI9Hg6VpcpOGoP1cUSIy47TS
   B4woPvdDnpvjqdiaZiYtOkAMfOnxlh61qCO0lsAO62gmSOAgxOxcacST5
   w==;
IronPort-SDR: Vpwt11CpJLVDX8QPgwqQ6eee5bSFhHffLKA0x11T0SrP0UHBD85Ub88boEsRLv0XJvzt/YiKD8
 MSrJdYQfxX9h3CAKVMJ4fHHPIGvxsg7EwdAHUTuJUG6tWPdgYoQdPY3cL7XbLhh2Ls4EAQc+/f
 0e3ShMSZkpVH4dl059YLUeM2qzljI0s2lwtw0aQicCtVRm828M3FXEVpd2iZJJqZfm355+EMZf
 UiplEofE6X9UbgFTUMORAI3//12ihsKoq+WnTOEF0/6m6pZLI+CkRr2EnxH5J1qdyceTXFI0aV
 /mM=
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="32680504"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Nov 2020 02:47:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 6 Nov 2020 02:47:26 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 6 Nov 2020 02:47:21 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <eugen.hristev@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v4 09/11] clk: at91: sama7g5: do not allow cpu pll to go higher than 1GHz
Date:   Fri, 6 Nov 2020 11:46:26 +0200
Message-ID: <1604655988-353-10-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604655988-353-1-git-send-email-claudiu.beznea@microchip.com>
References: <1604655988-353-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since CPU PLL feeds both CPU clock and MCK0, MCK0 cannot go higher
than 200MHz and MCK0 maximum prescaller is 5 limit the CPU PLL at
1GHz to avoid MCK0 overclocking while CPU PLL is changed by DVFS.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 61 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 662e667d1098..3924f256da67 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -89,11 +89,40 @@ static const struct clk_pll_layout pll_layout_divio = {
 	.endiv_shift	= 30,
 };
 
+/*
+ * CPU PLL output range.
+ * Notice: The upper limit has been setup to 1000000002 due to hardware
+ * block which cannot output exactly 1GHz.
+ */
+static const struct clk_range cpu_pll_outputs[] = {
+	{ .min = 2343750, .max = 1000000002 },
+};
+
+/* PLL output range. */
+static const struct clk_range pll_outputs[] = {
+	{ .min = 2343750, .max = 1200000000 },
+};
+
+/* CPU PLL characteristics. */
+static const struct clk_pll_characteristics cpu_pll_characteristics = {
+	.input = { .min = 12000000, .max = 50000000 },
+	.num_output = ARRAY_SIZE(cpu_pll_outputs),
+	.output = cpu_pll_outputs,
+};
+
+/* PLL characteristics. */
+static const struct clk_pll_characteristics pll_characteristics = {
+	.input = { .min = 12000000, .max = 50000000 },
+	.num_output = ARRAY_SIZE(pll_outputs),
+	.output = pll_outputs,
+};
+
 /**
  * PLL clocks description
  * @n:		clock name
  * @p:		clock parent
  * @l:		clock layout
+ * @c:		clock characteristics
  * @t:		clock type
  * @f:		clock flags
  * @eid:	export index in sama7g5->chws[] array
@@ -102,6 +131,7 @@ static const struct {
 	const char *n;
 	const char *p;
 	const struct clk_pll_layout *l;
+	const struct clk_pll_characteristics *c;
 	u32 f;
 	u8 t;
 	u8 eid;
@@ -110,12 +140,14 @@ static const struct {
 		{ .n = "cpupll_fracck",
 		  .p = "mainck",
 		  .l = &pll_layout_frac,
+		  .c = &cpu_pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_IS_CRITICAL, },
 
 		{ .n = "cpupll_divpmcck",
 		  .p = "cpupll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &cpu_pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
 		  .eid = PMC_CPUPLL, },
@@ -125,12 +157,14 @@ static const struct {
 		{ .n = "syspll_fracck",
 		  .p = "mainck",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE, },
 
 		{ .n = "syspll_divpmcck",
 		  .p = "syspll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
 		  .eid = PMC_SYSPLL, },
@@ -140,12 +174,14 @@ static const struct {
 		{ .n = "ddrpll_fracck",
 		  .p = "mainck",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE, },
 
 		{ .n = "ddrpll_divpmcck",
 		  .p = "ddrpll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE, },
 	},
@@ -154,12 +190,14 @@ static const struct {
 		{ .n = "imgpll_fracck",
 		  .p = "mainck",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_SET_RATE_GATE, },
 
 		{ .n = "imgpll_divpmcck",
 		  .p = "imgpll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		       CLK_SET_RATE_PARENT, },
@@ -169,12 +207,14 @@ static const struct {
 		{ .n = "baudpll_fracck",
 		  .p = "mainck",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_SET_RATE_GATE, },
 
 		{ .n = "baudpll_divpmcck",
 		  .p = "baudpll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		       CLK_SET_RATE_PARENT, },
@@ -184,12 +224,14 @@ static const struct {
 		{ .n = "audiopll_fracck",
 		  .p = "main_xtal",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_SET_RATE_GATE, },
 
 		{ .n = "audiopll_divpmcck",
 		  .p = "audiopll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		       CLK_SET_RATE_PARENT,
@@ -198,6 +240,7 @@ static const struct {
 		{ .n = "audiopll_diviock",
 		  .p = "audiopll_fracck",
 		  .l = &pll_layout_divio,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		       CLK_SET_RATE_PARENT,
@@ -208,12 +251,14 @@ static const struct {
 		{ .n = "ethpll_fracck",
 		  .p = "main_xtal",
 		  .l = &pll_layout_frac,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_FRAC,
 		  .f = CLK_SET_RATE_GATE, },
 
 		{ .n = "ethpll_divpmcck",
 		  .p = "ethpll_fracck",
 		  .l = &pll_layout_divpmc,
+		  .c = &pll_characteristics,
 		  .t = PLL_TYPE_DIV,
 		  .f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		       CLK_SET_RATE_PARENT, },
@@ -774,18 +819,6 @@ static const struct {
 	  .pp_chg_id = INT_MIN, },
 };
 
-/* PLL output range. */
-static const struct clk_range pll_outputs[] = {
-	{ .min = 2343750, .max = 1200000000 },
-};
-
-/* PLL characteristics. */
-static const struct clk_pll_characteristics pll_characteristics = {
-	.input = { .min = 12000000, .max = 50000000 },
-	.num_output = ARRAY_SIZE(pll_outputs),
-	.output = pll_outputs,
-};
-
 /* MCK0 characteristics. */
 static const struct clk_master_characteristics mck0_characteristics = {
 	.output = { .min = 50000000, .max = 200000000 },
@@ -902,7 +935,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
 					sama7g5_plls[i][j].p, parent_hw, i,
-					&pll_characteristics,
+					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
 				break;
@@ -911,7 +944,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 				hw = sam9x60_clk_register_div_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
 					sama7g5_plls[i][j].p, i,
-					&pll_characteristics,
+					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
 				break;
-- 
2.7.4


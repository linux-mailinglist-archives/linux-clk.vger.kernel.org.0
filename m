Return-Path: <linux-clk+bounces-14429-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C39C1B24
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA93281949
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C8F1E5705;
	Fri,  8 Nov 2024 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GCuvI9vj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9211E493C
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063017; cv=none; b=rEC1BiYC1NSGjMyQLwSL0VVq1jXxvYyOrwcV3Pwd9nWxXFFDbf0E32L1VSs7WDqjE0Cg2ZAT8t1yQJYMBOdw5rt11dybGz2zX5fq0s7ybWL9k22Yc161uv+zFjkar27cJlayBqe7F39aCkiOHYzMvE0aTQzhpf0zhIsVqoN36JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063017; c=relaxed/simple;
	bh=uewkcNd95ZHlKgRh9s9BjLOQ9p1PfnXZBXKYFxUQs+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcPMO+EImxmlv4nOlxXHyJj1nD8Fr2A1t8FrGv+TleybA3QDo8IUep/iNb9M9eINHOj1QauunQ6o3N/l16zgGdYkC6MAdA2WZ/fnbLWtQUVRx+5xbIWkR5FU+eL/RkEvuqXnOAk1XDqboQkUKssLGKJmIZZOtvl2yMN8m7H9Cyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GCuvI9vj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so229214966b.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063013; x=1731667813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbiN9IGyg41tRnn+qhaJfXa1IbZUMrZmq8kxPEzHJls=;
        b=GCuvI9vjYVOfD4WtDw5L8OND+pAqnmtDxo8KRmGjhx2grWFar6nAA7qlcmr2gKSF2C
         UGrZeV+e9Uw5QDRDl7KH4YSh50dKmwVaLRucN/or8dewRFEYuCPPMwaSITe1Dqa4ebYZ
         6cUCHjoU6mq8GSvT0n4ANDrk4qSvg8lFJX1pciSXIwRjMdlDx9+059Qj3o4YJhpjWG0f
         nIHoIjaT0ulH3mVybGiQqKQ+O9umZJWIYhOMnl+6W5ePU3M4QYlRAGtJryL6sJ0obqRP
         rmNb92p9ct0UwpWIzAQPwfp6fQDlOtDjiIQ+bVwiXAWMjPT3TuSvdMwFar8cs+joia1a
         Y5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063013; x=1731667813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbiN9IGyg41tRnn+qhaJfXa1IbZUMrZmq8kxPEzHJls=;
        b=MTYL2os1r8aTTkhIXvZQvmYMPFsBB+Lq138szKbA7jgmGhI4TXcdwCJo2HMN0KTcRF
         3H71lnM/ZL0nTR83xWIPcbu2eW2m1vSpC2oR/5fQX75ktIBLf3nT1hLHHBeyI7Ts0UiS
         jwlRY2w2dQxvmh/C+smhNb64mZns4txuN3R57oFcGlsNmWchsjPJp99FQPrdyTjnwzUs
         /hbd7W47dQi3JCG4zsMdn71lUjTTMwSxPyTfFEuJ1fT6r0pUsXbi2VE9M3RxgK7xzkA2
         m1J9WPPbZ8+qFFSOvml0GpBUP47PSBBr3jIg9chUrblQ8brOpUdXOA4vQ8Z4TB9AqvEq
         lUPA==
X-Forwarded-Encrypted: i=1; AJvYcCWmjqYgNQsrRS57MF7Jud6Qoqhfx4Mb5jR/l9nlp7IIu6Swsc4MRioQLb6yp1yCtdGKCTM7jOS5Deg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykGzjO1hrsRbSOYRfJZVAO0QUdfUKSTV9od+nqP6nP84VNTlhl
	FpBwfY76L89Paj1EbwR7jMzFY5FLvp5HfjiNIGI0kKYxEAXHojyBLWClGF8RYfw=
X-Google-Smtp-Source: AGHT+IFLIeQzzWSczltoBsjuUXERtW5ISfzTQIM6FdmX0Cy78vMrbXT7qlwdEcL+pljT0Msk1Ps1ww==
X-Received: by 2002:a17:906:6a01:b0:a9a:5b78:d7d8 with SMTP id a640c23a62f3a-a9eefee9493mr217734366b.17.1731063013363;
        Fri, 08 Nov 2024 02:50:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:12 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/25] clk: versaclock3: Prepare for the addition of 5L35023 device
Date: Fri,  8 Nov 2024 12:49:35 +0200
Message-Id: <20241108104958.2931943-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The 5P35023 and 5L35035 Versa 3 clock generator variants are different but
the versaclock3 driver could be used with small adjustments. The features
that are implemented in driver and differs b/w variants are the PLL2 Fvco
and clock sel bit for SE2 clock. Adjust the driver to prepare for the
addition of 5L35023 device.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 61 ++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 76d7ea1964c3..1398d16df5d0 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -78,9 +78,6 @@
 #define VC3_PLL1_VCO_MIN		300000000UL
 #define VC3_PLL1_VCO_MAX		600000000UL
 
-#define VC3_PLL2_VCO_MIN		400000000UL
-#define VC3_PLL2_VCO_MAX		1200000000UL
-
 #define VC3_PLL3_VCO_MIN		300000000UL
 #define VC3_PLL3_VCO_MAX		800000000UL
 
@@ -147,9 +144,13 @@ struct vc3_pfd_data {
 	u8 mdiv2_bitmsk;
 };
 
+struct vc3_vco {
+	unsigned long min;
+	unsigned long max;
+};
+
 struct vc3_pll_data {
-	unsigned long vco_min;
-	unsigned long vco_max;
+	struct vc3_vco vco;
 	u8 num;
 	u8 int_div_msb_offs;
 	u8 int_div_lsb_offs;
@@ -166,12 +167,17 @@ struct vc3_div_data {
 struct vc3_hw_data {
 	struct clk_hw hw;
 	struct regmap *regmap;
-	const void *data;
+	void *data;
 
 	u32 div_int;
 	u32 div_frc;
 };
 
+struct vc3_hw_cfg {
+	struct vc3_vco pll2_vco;
+	u32 se2_clk_sel_msk;
+};
+
 static const struct clk_div_table div1_divs[] = {
 	{ .val = 0, .div = 1, }, { .val = 1, .div = 4, },
 	{ .val = 2, .div = 5, }, { .val = 3, .div = 6, },
@@ -386,10 +392,10 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct vc3_pll_data *pll = vc3->data;
 	u64 div_frc;
 
-	if (rate < pll->vco_min)
-		rate = pll->vco_min;
-	if (rate > pll->vco_max)
-		rate = pll->vco_max;
+	if (rate < pll->vco.min)
+		rate = pll->vco.min;
+	if (rate > pll->vco.max)
+		rate = pll->vco.max;
 
 	vc3->div_int = rate / *parent_rate;
 
@@ -680,8 +686,10 @@ static struct vc3_hw_data clk_pll[] = {
 			.num = VC3_PLL1,
 			.int_div_msb_offs = VC3_PLL1_LOOP_FILTER_N_DIV_MSB,
 			.int_div_lsb_offs = VC3_PLL1_VCO_N_DIVIDER,
-			.vco_min = VC3_PLL1_VCO_MIN,
-			.vco_max = VC3_PLL1_VCO_MAX
+			.vco = {
+				.min = VC3_PLL1_VCO_MIN,
+				.max = VC3_PLL1_VCO_MAX
+			}
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll1",
@@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] = {
 			.num = VC3_PLL2,
 			.int_div_msb_offs = VC3_PLL2_FB_INT_DIV_MSB,
 			.int_div_lsb_offs = VC3_PLL2_FB_INT_DIV_LSB,
-			.vco_min = VC3_PLL2_VCO_MIN,
-			.vco_max = VC3_PLL2_VCO_MAX
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll2",
@@ -716,8 +722,10 @@ static struct vc3_hw_data clk_pll[] = {
 			.num = VC3_PLL3,
 			.int_div_msb_offs = VC3_PLL3_LOOP_FILTER_N_DIV_MSB,
 			.int_div_lsb_offs = VC3_PLL3_N_DIVIDER,
-			.vco_min = VC3_PLL3_VCO_MIN,
-			.vco_max = VC3_PLL3_VCO_MAX
+			.vco = {
+				.min = VC3_PLL3_VCO_MIN,
+				.max = VC3_PLL3_VCO_MAX
+			}
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll3",
@@ -901,7 +909,6 @@ static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE2_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE2_CTRL_REG0,
-			.bitmsk = VC3_SE2_CTRL_REG0_SE2_CLK_SEL
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
@@ -982,6 +989,7 @@ static int vc3_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 settings[NUM_CONFIG_REGISTERS];
+	const struct vc3_hw_cfg *data;
 	struct regmap *regmap;
 	const char *name;
 	int ret, i;
@@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *client)
 					     clk_pfd[i].hw.init->name);
 	}
 
+	data = i2c_get_match_data(client);
+
 	/* Register pll's */
 	for (i = 0; i < ARRAY_SIZE(clk_pll); i++) {
 		clk_pll[i].regmap = regmap;
+		if (i == VC3_PLL2) {
+			struct vc3_pll_data *pll_data = clk_pll[i].data;
+
+			pll_data->vco = data->pll2_vco;
+		}
 		ret = devm_clk_hw_register(dev, &clk_pll[i].hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "%s failed\n",
@@ -1059,6 +1074,11 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register clk muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_mux); i++) {
 		clk_mux[i].regmap = regmap;
+		if (i == VC3_SE2_MUX) {
+			struct vc3_clk_data *clk_data = clk_mux[i].data;
+
+			clk_data->bitmsk = data->se2_clk_sel_msk;
+		}
 		ret = devm_clk_hw_register(dev, &clk_mux[i].hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "%s failed\n",
@@ -1108,8 +1128,13 @@ static int vc3_probe(struct i2c_client *client)
 	return ret;
 }
 
+static const struct vc3_hw_cfg vc3_5p = {
+	.pll2_vco = { .min = 400000000UL, .max = 1200000000UL },
+	.se2_clk_sel_msk = BIT(6),
+};
+
 static const struct of_device_id dev_ids[] = {
-	{ .compatible = "renesas,5p35023" },
+	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2



Return-Path: <linux-clk+bounces-17954-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09080A33054
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 21:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 886B7164DEC
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 20:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BDA201022;
	Wed, 12 Feb 2025 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYSggrqc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB898200119
	for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390513; cv=none; b=AJhnF4tIC9sCJyvpp7ykmcL3Pi33f7Hv51eX4S3oaNf0crVEZ8ZDvOgxO0BHAi0F3VD8IAm1PNSt5bCoDeEz6zbJdyvaA1zlXQ896pW5Ok/16S029RGonwnSsDFrIzF8U4tKq+2gvA0J8fl+Ff0+yfJQafeMQbStNRSkB8mYmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390513; c=relaxed/simple;
	bh=y5h75cbURq+QFYroNTwHW0qeM75W82wRrh1mTp5vUw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmwURGda25WGHRVU4B/oPl5DVT3peeU/UPB/NcaABIEjAtlxsnBOiLqWEddZA/kBIiIOz0aIr4PM+YsKgTC55YdAIHjp3iLEt/aev1NnuLFkPZuzx4NjVZ/Zx0BThalk0I0OrR1AzYIcMj0IJ1BXqBwleKyvF5kdjTjqf7Zm1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYSggrqc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so7303a12.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 12:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390510; x=1739995310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=og53lkxft6Cw9SOu+fSVtcrVp1LfxilP6rODB9GjWWo=;
        b=OYSggrqcVKSyzsUVSCrrzU+nQUakqMu2NY1MG+UPc0SH02r9ZKz7o/2SrADGCuA6sq
         QAJOU9sVyklexJHaaWKPNo1eRkmDqsl1GIbo+TaKx0QWaZal0sGIiAsY1Dwn5EVkjPhY
         6e/0N1A8nMbksjIL3T4Bv3ZyGfQkOIsN3LDOzeGw/AWxWm90f3xNBEoGmqvkZtU+rXLg
         LpWmLRnMQZitLam4E+9Jd4lzmQ9dxyQy89OPuWB4oCF7gZGJHSPv5Z9aW2Jx8w1yOvea
         +y56Ph45s+iBbya3f1OWGHxYJCnkL9c8/01xO5FhAGooYRw21XQhI1wGVB32ZKfja28s
         6gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390510; x=1739995310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og53lkxft6Cw9SOu+fSVtcrVp1LfxilP6rODB9GjWWo=;
        b=lKXdmcg6+GeQ7+WQIulUrD1sYEyZZGFK0FAbdOya5Xiz8yobfvrVI7RVN6hCclzwsP
         ze+sa3sclPkRj2QhCg6zLO+iDoWEuCfX43Kn26VUmenGoRu0bfH55KUkKXfLZxCVHx+l
         nL4jxA/WTtD4L0ZaYHWiourKhsj+dsP73+V66hU95lktxgyKJg4XU3y3z8AdkLOvXjPj
         bJx/9rKgt6qwaa7ztmXJ3XoMqS4v7AQyBZ8rOVIT1P+5TSI/QtiRNxdKrHxqLT9DUxyC
         ryDIV0Z3cpG3YV4IV14SwV3o6raP8Sbc2BztnamCas0Nvh2lPIQBTQHWB9g5+XqeLF5G
         Bd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlFnKGLOzSHTwDMLu/vaSgxJgZzPXocs6pFNjd+RdlDQgsEY+3JG+/Mg1l1yvqKqJHLNn/lqLb8pE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2DqrS3GC3kKYkfb6CdOb5M/WHLYj31MkTuiT81/Q1IubuygX
	l1TtT5lRg6AiEorga6KUTSD6Vlw4yyKbMeN/S2/6GWyXt9uzAFr34jUlwgy/HGw=
X-Gm-Gg: ASbGnctDf2pIyZAL1yAj1KeG9LmTeLnZmhReT2pedmAJwhfZ184YtRIqONbviNBVmIV
	P76DWtAF+e1dRJMNKU/5c8ZX+QssQcKEXizKCsm3TGEXJQ9sLqITBZQ9wmSSbxjPsptM7FKvvfK
	CI4BCAAwi9AG+QvDLItXYVKBDo5qXflswQL4867oyCwTsFAN6+oCF3zvQ9IeDDvJUPmJJ1LNxAT
	DJuvuuC2gis2cET8oe8oTBAm/eVJCKOMSNJ82sQ2DgNyrTfCxSWw8JxHwPc38h3iBheaS5713xr
	F9HMnGfVs5L2qQXtD+SnHoNp6GqzYF8=
X-Google-Smtp-Source: AGHT+IHq9PhGjIrCokOrbT3WcuYrA7+Gcw6tdzPVbLWXUZAeFDUaP6P9fjZXwPJtK2GCEApPfUgigQ==
X-Received: by 2002:a05:6402:5111:b0:5dc:58ad:b8c9 with SMTP id 4fb4d7f45d1cf-5deade126b9mr1672088a12.10.1739390510082;
        Wed, 12 Feb 2025 12:01:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deca41378fsm144527a12.74.2025.02.12.12.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:01:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Feb 2025 21:01:35 +0100
Subject: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Do not use random stack
 value for recalc rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-b4-clk-qcom-clean-v3-1-499f37444f5d@linaro.org>
References: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
In-Reply-To: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4980;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y5h75cbURq+QFYroNTwHW0qeM75W82wRrh1mTp5vUw0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnrP4m+rYGhwatCfcI9FCaxPhhQYy19YjkXgf77
 RE8KAMxgyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6z+JgAKCRDBN2bmhouD
 1xEyD/9kvHXg4erJmX81rC0iPH6WNVUEuLd7kW/FB9nJUp68/qvzrtcrpTqZ3UgiD6DjB+oMXhT
 iHg1cynqHnHbKEaN3Twdn2+SFj0kku4Lr/oeSRRA5Ch/VszfU1fmah7Tm2N9nMOvUeFZ3dSLcpA
 vG+mkbPwHhbfH1e9hhMb4P2rbenrPorL82w9rX8N3H/CdOiI2Lc3YrnNKJJEpSt5R0GIjWvQFNS
 Kqr5MBs9EDOF8XsyKpfxUp3atyB/8GXaaYM3D4Brvxsdx5YhKmdNcETJAfpDIRqYqBLeRe//Omu
 G8ruE90Zmq7C3/8tpImDfyCIGoizesStNA8N5uMIcgN5BUDAL3tlmKqed/wKgHZdzJcRC2/Lai6
 PcWZhQGNoPSwiheSqNe85ujFq4fCAPkAwwSPivMDZDuYEc9OHSuZOl8L6HGBsLoJaLUPyH5SfXK
 fek3JD5HgAgAYwm7PRO4945c/aTpZNn+spcsGFtJwtChCgN4lfpFHp+I7CX8OmQ+IkYMGKshoBN
 hPQkpBShw6dmsr0ruu4uTGzOkOWjmONX/d5LQIOqQdTBhcFadELT+NJbcMmFsjecw3uZtCP2QEF
 HfhZgG6Xd0IsdmIo3cOs56AdxidK5b14AR6xBUc16C+Rf0JVeZcUL9WL9bug6VmJCB/OfzrUdxO
 hYj+zPv7y49Ewxw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

If regmap_read() fails, random stack value was used in calculating new
frequency in recalc_rate() callbacks.  Such failure is really not
expected as these are all MMIO reads, however code should be here
correct and bail out.  This also avoids possible warning on
uninitialized value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Three more regmap_read() failure checks (Stephen)
---
 drivers/clk/qcom/clk-alpha-pll.c | 52 +++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9a65d14acf71c97912664be4f6f78891cab4afa3..cec0afea8e446010f0d4140d4ef63121706dde47 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -709,14 +709,19 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);
+		if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low))
+			return 0;
 		if (alpha_width > 32) {
-			regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
-				    &high);
+			if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
+					&high))
+				return 0;
 			a = (u64)high << 32 | low;
 		} else {
 			a = low & GENMASK(alpha_width - 1, 0);
@@ -942,8 +947,11 @@ alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha = 0, ctl, alpha_m, alpha_n;
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
 	if (ctl & PLL_ALPHA_EN) {
 		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &alpha);
@@ -1137,8 +1145,11 @@ clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
@@ -1196,7 +1207,8 @@ clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl;
 
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
 	ctl >>= PLL_POST_DIV_SHIFT;
 	ctl &= PLL_POST_DIV_MASK(pll);
@@ -1412,8 +1424,11 @@ static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_FRAC(pll), &frac);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_FRAC(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
@@ -1563,7 +1578,8 @@ clk_trion_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct regmap *regmap = pll->clkr.regmap;
 	u32 i, div = 1, val;
 
-	regmap_read(regmap, PLL_USER_CTL(pll), &val);
+	if (regmap_read(regmap, PLL_USER_CTL(pll), &val))
+		return 0;
 
 	val >>= pll->post_div_shift;
 	val &= PLL_POST_DIV_MASK(pll);
@@ -2484,9 +2500,12 @@ static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 	struct regmap *regmap = pll->clkr.regmap;
 	u32 l, frac;
 
-	regmap_read(regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(regmap, PLL_L_VAL(pll), &l))
+		return 0;
 	l &= LUCID_EVO_PLL_L_VAL_MASK;
-	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
+
+	if (regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, pll_alpha_width(pll));
 }
@@ -2699,7 +2718,8 @@ static unsigned long clk_rivian_evo_pll_recalc_rate(struct clk_hw *hw,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l;
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
 
 	return parent_rate * l;
 }

-- 
2.43.0



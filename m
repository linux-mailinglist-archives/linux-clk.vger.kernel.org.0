Return-Path: <linux-clk+bounces-17067-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E018FA10FEC
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2025 19:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F833A6CE2
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2025 18:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A371820AF61;
	Tue, 14 Jan 2025 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nhl9i+Mk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6252040BD
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878835; cv=none; b=jl9zs7GUVmDJmYKx8Ys1xZmqL0J1qGsQM7FyUTDQFEPOj5efnR06vkIs0ARMK0xlbgDxiWZvLCnekzRZZZ40WANJjxp7P9CCw4HJnlQpGX3N5pMtHa7gSj48SYeH5DzRqi1Kdk4n6DXhWAvweYIkZT4Vo86BYLpiW38DLfKabDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878835; c=relaxed/simple;
	bh=YEgm9CBcngqM2lvhZoThnrk7EAinCX1sVHlbZ+5CiF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0otv09F6pMKDax+oyLbg76VNvQSE1ATkV5VgLg4xRyPDA/d2wy+OfdYpZzkwdIeMDR2OHejbiKcFPmCeJBvPisFeNbFKM44rtMgjjB4IRAqBf4yOmhkqf94BIcUBjamrT5/0lY0v+EE7M9qalSXgT3FMiKHYSvoO+1juEkT56E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nhl9i+Mk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2873485f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878832; x=1737483632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkVJ9sQJb2vv3dExk46APkrSl3qRZZR081phjk5hrNg=;
        b=nhl9i+MkpZUC5YvT0XuDto170aesOPPyNnKlJESDr/LEX5wyHb8SRZFDo/oB9cZlN1
         44qkac566/oo/Gh6ED/U5z859qCOliu1iGCXOGsDT7T/ZlHfWrjW4eIGySe9r0lma30b
         0LAnT37KyndG8fCHFAzypDsZ5sltjDSf4v1Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878832; x=1737483632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkVJ9sQJb2vv3dExk46APkrSl3qRZZR081phjk5hrNg=;
        b=d6zIVawZgnDv5qUXY3YJWkNMhdXsY79LNxbQ2qHRLt/04kZ0Kcs6hblK4D3qmBQd6a
         DRYqmKyiVaTi0Zky9/zY/m+Vu77BPsTiDPeRMEmgA56df2nU/Lm3+Jf0HRFd80t6VlIw
         mCfZ67eoQ4Bay0uI0EJ4ZndaRnQQ1Ss3/kfFk4fektSgxL65qFj/V50dzj56VniMWuWj
         ZpOc2pWlLYNoKasQtUctqLVnzS/zx8H9gmLByjikIXGQ8B3QS2kAw+b8hQ2D1NQxyuqc
         bTV8EXQBh9SSDArAdG1cuyZJv6iJUKuDvKARbLtQ8jV7MepBaxMzDlKNuxV0L9Xq6PqN
         l7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUop7OOWHEuiFws/8Z5lfBUjvGMWcW1MF3ysm9DNtup/0sCtwV5Pfab31wqpp/BDCprUwSWEHYb9kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuGgGPEQpeGHe2373eMvtjQoUEURbeJ3I8kqyfjkrK/1jjV0x
	0k/v30qL883fPxN5e9WFT/dVNwHYxl3b8g1Pla+iP4xN8Tt4PFSbabSxqTOx17o=
X-Gm-Gg: ASbGncu/xtGjis+SYUPznrlSXqby0a2UtoJRXYo+SNZipjCJDAiILMuFWTd37aPgkWA
	1FKWtV7JSys2dsEmf2RXozFiXrvSuJbJXvFoR/tbLzoWK/Gz0HCGebhISbwWxtPfYGL0A2Yx+nI
	0iBDQrkc5Xvf2p4lBCWvAYRHBEIBi3qTaZKcvB7RDBQdyuD0JwNHEwxE3hv7aGsPoYwqILa9Wn0
	cpMpRpPHwoKDehcblahQIfxxAszpUu7R16lCsYcNrF2zZYLbKaOilfwHNnUEIha9IO3Ge6bO5Q0
	CjKH0oHDxKHFTS+e1PnHLw==
X-Google-Smtp-Source: AGHT+IFTHsaO4pRWj/ycSK7tK4wq2QnfEdwhDWA14Pe+guQjbbmIcKTGCb6cXgJjyJ8q3PXu6BJlEQ==
X-Received: by 2002:a5d:6c68:0:b0:385:fd07:85f8 with SMTP id ffacd0b85a97d-38a872ebfbdmr20001278f8f.29.1736878831746;
        Tue, 14 Jan 2025 10:20:31 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 4/4] clk: stm32f4: support spread spectrum clock generation
Date: Tue, 14 Jan 2025 19:19:49 +0100
Message-ID: <20250114182021.670435-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support spread spectrum clock generation for the main PLL, the only one
for which this functionality is available.

Tested on the STM32F469I-DISCO board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Improve the compatible property in patch 1/4 "dt-bindings: clock:
  convert stm32 rcc bindings to json-schema"

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.
- Drop pr_debug() from stm32f4_pll_set_ssc()
- Add __init to stm32f4_pll_init_ssc() and stm32f4_pll_ssc_parse_dt().
- Add const to conf parameter of stm32f4_pll_init_ssc().
- Use fwnode_property_match_property_string() to parse the
  st,ssc-modmethod dts property.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

 drivers/clk/clk-stm32f4.c | 143 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index db1c56c8d54f..f476883bc93b 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -35,6 +35,7 @@
 #define STM32F4_RCC_APB2ENR		0x44
 #define STM32F4_RCC_BDCR		0x70
 #define STM32F4_RCC_CSR			0x74
+#define STM32F4_RCC_SSCGR		0x80
 #define STM32F4_RCC_PLLI2SCFGR		0x84
 #define STM32F4_RCC_PLLSAICFGR		0x88
 #define STM32F4_RCC_DCKCFGR		0x8c
@@ -42,6 +43,12 @@
 
 #define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
 
+#define STM32F4_RCC_SSCGR_SSCGEN	BIT(31)
+#define STM32F4_RCC_SSCGR_SPREADSEL	BIT(30)
+#define STM32F4_RCC_SSCGR_RESERVED_MASK	GENMASK(29, 28)
+#define STM32F4_RCC_SSCGR_INCSTEP_MASK	GENMASK(27, 13)
+#define STM32F4_RCC_SSCGR_MODPER_MASK	GENMASK(12, 0)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -367,6 +374,16 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
+enum stm32f4_pll_ssc_mod_type {
+	STM32F4_PLL_SSC_CENTER_SPREAD,
+	STM32F4_PLL_SSC_DOWN_SPREAD,
+};
+
+static const char * const stm32f4_ssc_mod_methods[] __initconst = {
+	[STM32F4_PLL_SSC_DOWN_SPREAD] = "down-spread",
+	[STM32F4_PLL_SSC_CENTER_SPREAD] = "center-spread",
+};
+
 /*
  * This bitmask tells us which bit offsets (0..192) on STM32F4[23]xxx
  * have gate bits associated with them. Its combined hweight is 71.
@@ -512,6 +529,12 @@ static const struct clk_div_table pll_divr_table[] = {
 	{ 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
 };
 
+struct stm32f4_pll_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_depth;
+	enum stm32f4_pll_ssc_mod_type mod_type;
+};
+
 struct stm32f4_pll {
 	spinlock_t *lock;
 	struct	clk_gate gate;
@@ -519,6 +542,8 @@ struct stm32f4_pll {
 	u8 bit_rdy_idx;
 	u8 status;
 	u8 n_start;
+	bool ssc_enable;
+	struct stm32f4_pll_ssc ssc_conf;
 };
 
 #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, gate)
@@ -541,6 +566,7 @@ struct stm32f4_vco_data {
 	u8 offset;
 	u8 bit_idx;
 	u8 bit_rdy_idx;
+	bool sscg;
 };
 
 static const struct stm32f4_vco_data  vco_data[] = {
@@ -661,6 +687,32 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate * n;
 }
 
+static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				unsigned int ndiv)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct stm32f4_pll_ssc *ssc = &pll->ssc_conf;
+	u32 modeper, incstep;
+	u32 sscgr;
+
+	sscgr = readl(base + STM32F4_RCC_SSCGR);
+	/* reserved field must be kept at reset value */
+	sscgr &= STM32F4_RCC_SSCGR_RESERVED_MASK;
+
+	modeper = DIV_ROUND_CLOSEST(parent_rate, 4 * ssc->mod_freq);
+	incstep = DIV_ROUND_CLOSEST(((1 << 15) - 1) * ssc->mod_depth * ndiv,
+				    5 * 10000 * modeper);
+	sscgr |= STM32F4_RCC_SSCGR_SSCGEN |
+		FIELD_PREP(STM32F4_RCC_SSCGR_INCSTEP_MASK, incstep) |
+		FIELD_PREP(STM32F4_RCC_SSCGR_MODPER_MASK, modeper);
+
+	if (ssc->mod_type)
+		sscgr |= STM32F4_RCC_SSCGR_SPREADSEL;
+
+	writel(sscgr, base + STM32F4_RCC_SSCGR);
+}
+
 static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -683,6 +735,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	writel(val, base + pll->offset);
 
+	if (pll->ssc_enable)
+		stm32f4_pll_set_ssc(hw, parent_rate, n);
+
 	if (pll_state)
 		stm32f4_pll_enable(hw);
 
@@ -788,6 +843,84 @@ static struct clk_hw *clk_register_pll_div(const char *name,
 	return hw;
 }
 
+static int __init stm32f4_pll_init_ssc(struct clk_hw *hw,
+				       const struct stm32f4_pll_ssc *conf)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct clk_hw *parent;
+	unsigned long parent_rate;
+	int pll_state;
+	unsigned long n, val;
+
+	parent = clk_hw_get_parent(hw);
+	if (!parent) {
+		pr_err("%s: failed to get clock parent\n", __func__);
+		return -ENODEV;
+	}
+
+	parent_rate = clk_hw_get_rate(parent);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+
+	pll_state = stm32f4_pll_is_enabled(hw);
+
+	if (pll_state)
+		stm32f4_pll_disable(hw);
+
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
+
+	pr_debug("%s: pll: %s, parent: %s, parent-rate: %lu, n: %lu\n",
+		 __func__, clk_hw_get_name(hw), clk_hw_get_name(parent),
+		 parent_rate, n);
+
+	stm32f4_pll_set_ssc(hw, parent_rate, n);
+
+	if (pll_state)
+		stm32f4_pll_enable(hw);
+
+	return 0;
+}
+
+static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
+					   struct stm32f4_pll_ssc *conf)
+{
+	int ret;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_freq);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "st,ssc-moddepth-permyriad",
+				   &conf->mod_depth);
+	if (ret) {
+		pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
+		return ret;
+	}
+
+	ret = fwnode_property_match_property_string(of_fwnode_handle(np),
+						    "st,ssc-modmethod",
+						    stm32f4_ssc_mod_methods,
+						    ARRAY_SIZE(stm32f4_ssc_mod_methods));
+	if (ret < 0) {
+		pr_err("%pOF: failed to get st,ssc-modmethod\n", np);
+		return ret;
+	}
+
+	conf->mod_type = ret;
+
+	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
+		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+
+	return 0;
+}
+
 static struct clk_hw *stm32f4_rcc_register_pll(const char *pllsrc,
 		const struct stm32f4_pll_data *data,  spinlock_t *lock)
 {
@@ -1695,7 +1828,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	const struct of_device_id *match;
 	const struct stm32f4_clk_data *data;
 	unsigned long pllm;
-	struct clk_hw *pll_src_hw;
+	struct clk_hw *pll_src_hw, *pll_vco_hw;
+	struct stm32f4_pll_ssc ssc_conf;
 
 	base = of_iomap(np, 0);
 	if (!base) {
@@ -1754,8 +1888,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clk_hw_register_fixed_factor(NULL, "vco_in", pll_src,
 				     0, 1, pllm);
 
-	stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
-			&stm32f4_clk_lock);
+	pll_vco_hw = stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
+					      &stm32f4_clk_lock);
 
 	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[1], &stm32f4_clk_lock);
@@ -1900,6 +2034,9 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
 
+	if (!stm32f4_pll_ssc_parse_dt(np, &ssc_conf))
+		stm32f4_pll_init_ssc(pll_vco_hw, &ssc_conf);
+
 	return;
 fail:
 	kfree(clks);
-- 
2.43.0



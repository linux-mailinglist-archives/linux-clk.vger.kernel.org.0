Return-Path: <linux-clk+bounces-20467-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B593BA84D42
	for <lists+linux-clk@lfdr.de>; Thu, 10 Apr 2025 21:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811A9447E30
	for <lists+linux-clk@lfdr.de>; Thu, 10 Apr 2025 19:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1874A2900A8;
	Thu, 10 Apr 2025 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OHVMM9xo"
X-Original-To: linux-clk@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAC28FFF6;
	Thu, 10 Apr 2025 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314066; cv=pass; b=SR178DpwENmXAlH+DxM82cl/2NAFIhWIo7yFTDw2R2KnJu/IQgKMGi1tNvb4C/53ySl/4Wbr9ZNbBj63UuD5zS1sA0fh7pHDaZHWRcsZ3fLRzkA3B9LZq9cqLXUe9gtXSCY1HvIvhWtBjeIHC4mzYCBpReScfGEDKpSe+pSE+kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314066; c=relaxed/simple;
	bh=OXlutorYELImle+IQgnhLU0WY6cs8UCQXePXlPfegiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcGSU06/ClFO0jNPunvNOitTmTLwIJRw9NSOMk7wUnYER/mT1+jPR7wVcCvdddxOmKKJFLU8wjIBkaKBthDeAzsShL1VbfbN2yCvSoeJmW2/RuNXKwpmVp1uSeZ+jzIiTNAyhalTeKBNzlzKX9xClIPXjElUris69zfsFBBMDz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=OHVMM9xo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744314025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lQuKxCgiJVs0cfobfCyXn5N+UwJaiAaMACYEZv9IWNbwIGRdbmUuCKpGt+8NRkV/Ub+G0NMBsZetaWeXdNPROnc8OrW+H0tMUO+HrtiSQ/M0Xz127FRsd8oC7NRoxZwOIQhgx14Mc54AiGNjsg+vFR3m1vKsB4frYYuoR6Km/b0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cBaD7TwdKZDd/dl/ItGptTfa39Tjiy56vMKZRs4k1/E=; 
	b=UVHg9ApR40HjKAzwSyV7QXD8Thgm3cCrxOfmi4BqIioZRVrWRvNlIhqgsJWBYXpGCu79XmgfOz8/eWrAi1UgfmoC5yHtLFBQ0zwZz2eHSTsI3XrZJU1n7yI0ctUuBJb9KgOa4+dNM9MQW2G7t7M7AL/tT3toHpE5qvQi0+3F4os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314025;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cBaD7TwdKZDd/dl/ItGptTfa39Tjiy56vMKZRs4k1/E=;
	b=OHVMM9xo4SjvvzEj0Fn21v+y7NtWX0YuveBNYbXlrO061RN7BClYB4GJg3BLF6By
	wwtuJr45rlazWOqfTPs9QLIP4FotLJXGTSJ0B7hLP1VDFzzHho1V0QgjePzfyFGEGAD
	/UffiylZ2s1cOK6Me2V6u3bx1tKLJDqSIMSzdoV4=
Received: by mx.zohomail.com with SMTPS id 1744314023675255.48386641391699;
	Thu, 10 Apr 2025 12:40:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:54 +0200
Subject: [PATCH v2 02/11] clk: rockchip: introduce auxiliary GRFs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-2-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The MUXGRF clock branch type depends on having access to some sort of
GRF as a regmap to be registered. So far, we could easily get away with
only ever having one GRF stowed away in the context.

However, newer Rockchip SoCs, such as the RK3576, have several GRFs
which are relevant for clock purposes. It already depends on the pmu0
GRF for MUXGRF reasons, but could get away with not refactoring this
because it didn't need the sysgrf at all, so could overwrite the pointer
in the clock provider to the pmu0 grf regmap handle.

In preparation for needing to finally access more than one GRF per SoC,
let's untangle this. Introduce an auxiliary GRF hashmap, and a GRF type
enum. The hasmap is keyed by the enum, and clock branches now have a
struct member to store the value of that enum, which defaults to the
system GRF.

The SoC-specific _clk_init function can then insert pointers to GRF
regmaps into the hashmap based on the grf type.

During clock branch registration, we then pick the right GRF for each
branch from the hashmap if something other than the sys GRF is
requested.

The reason for doing it with this grf type indirection in the clock
branches is so that we don't need to define the MUXGRF branches in a
separate step, just to have a direct pointer to a regmap available
already.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/rockchip/clk-rk3328.c |  6 +++---
 drivers/clk/rockchip/clk-rk3568.c |  2 +-
 drivers/clk/rockchip/clk-rk3576.c | 32 ++++++++++++++++++++++----------
 drivers/clk/rockchip/clk.c        | 17 ++++++++++++++++-
 drivers/clk/rockchip/clk.h        | 29 ++++++++++++++++++++++++++++-
 5 files changed, 70 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index cf60fcf2fa5cde4ef97a05852f071763a4ccee40..cd5f65b6cdf55074c753f1dee96972c2a589c260 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -677,9 +677,9 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKSEL_CON(27), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3328_CLKGATE_CON(3), 5, GFLAGS),
 	MUXGRF(SCLK_MAC2IO, "clk_mac2io", mux_mac2io_src_p, CLK_SET_RATE_NO_REPARENT,
-			RK3328_GRF_MAC_CON1, 10, 1, MFLAGS),
+			RK3328_GRF_MAC_CON1, 10, 1, MFLAGS, grf_type_sys),
 	MUXGRF(SCLK_MAC2IO_EXT, "clk_mac2io_ext", mux_mac2io_ext_p, CLK_SET_RATE_NO_REPARENT,
-			RK3328_GRF_SOC_CON4, 14, 1, MFLAGS),
+			RK3328_GRF_SOC_CON4, 14, 1, MFLAGS, grf_type_sys),
 
 	COMPOSITE(SCLK_MAC2PHY_SRC, "clk_mac2phy_src", mux_2plls_p, 0,
 			RK3328_CLKSEL_CON(26), 7, 1, MFLAGS, 0, 5, DFLAGS,
@@ -692,7 +692,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKSEL_CON(26), 8, 2, DFLAGS,
 			RK3328_CLKGATE_CON(9), 2, GFLAGS),
 	MUXGRF(SCLK_MAC2PHY, "clk_mac2phy", mux_mac2phy_src_p, CLK_SET_RATE_NO_REPARENT,
-			RK3328_GRF_MAC_CON2, 10, 1, MFLAGS),
+			RK3328_GRF_MAC_CON2, 10, 1, MFLAGS, grf_type_sys),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
 
diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 7d9279291e7692c5ebdda16563fd09f87732e6d1..5f250bb8260ca0447f7249f212a49597c6c54887 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -590,7 +590,7 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
 			RK3568_CLKSEL_CON(9), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3568_CLKGATE_CON(4), 0, GFLAGS),
 	MUXGRF(CLK_DDR1X, "clk_ddr1x", clk_ddr1x_p, CLK_SET_RATE_PARENT,
-			RK3568_CLKSEL_CON(9), 15, 1, MFLAGS),
+			RK3568_CLKSEL_CON(9), 15, 1, MFLAGS, grf_type_sys),
 
 	COMPOSITE_NOMUX(CLK_MSCH, "clk_msch", "clk_ddr1x", CLK_IGNORE_UNUSED,
 			RK3568_CLKSEL_CON(10), 0, 2, DFLAGS,
diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 595e010341f73aaf7fb0a06d9c6b0864fff0d85b..fd3aa19725c4cb26eb94f4e2399c1d4ec1c1b97a 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1676,13 +1676,13 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 
 	/* phy ref */
 	MUXGRF(CLK_PHY_REF_SRC, "clk_phy_ref_src", clk_phy_ref_src_p,  0,
-			RK3576_PMU0_GRF_OSC_CON6, 4, 1, MFLAGS),
+			RK3576_PMU0_GRF_OSC_CON6, 4, 1, MFLAGS, grf_type_pmu0),
 	MUXGRF(CLK_USBPHY_REF_SRC, "clk_usbphy_ref_src", clk_usbphy_ref_src_p,  0,
-			RK3576_PMU0_GRF_OSC_CON6, 2, 1, MFLAGS),
+			RK3576_PMU0_GRF_OSC_CON6, 2, 1, MFLAGS, grf_type_pmu0),
 	MUXGRF(CLK_CPLL_REF_SRC, "clk_cpll_ref_src", clk_cpll_ref_src_p,  0,
-			RK3576_PMU0_GRF_OSC_CON6, 1, 1, MFLAGS),
+			RK3576_PMU0_GRF_OSC_CON6, 1, 1, MFLAGS, grf_type_pmu0),
 	MUXGRF(CLK_AUPLL_REF_SRC, "clk_aupll_ref_src", clk_aupll_ref_src_p,  0,
-			RK3576_PMU0_GRF_OSC_CON6, 0, 1, MFLAGS),
+			RK3576_PMU0_GRF_OSC_CON6, 0, 1, MFLAGS, grf_type_pmu0),
 
 	/* secure ns */
 	COMPOSITE_NODIV(ACLK_SECURE_NS, "aclk_secure_ns", mux_350m_175m_116m_24m_p, CLK_IS_CRITICAL,
@@ -1725,13 +1725,14 @@ static void __init rk3576_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
-	struct regmap *grf;
+	struct rockchip_aux_grf *pmu0_grf_e;
+	struct regmap *pmu0_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3576_clk_branches,
 					ARRAY_SIZE(rk3576_clk_branches)) + 1;
 
-	grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-pmu0-grf");
-	if (IS_ERR(grf)) {
+	pmu0_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-pmu0-grf");
+	if (IS_ERR(pmu0_grf)) {
 		pr_err("%s: could not get PMU0 GRF syscon\n", __func__);
 		return;
 	}
@@ -1745,11 +1746,16 @@ static void __init rk3576_clk_init(struct device_node *np)
 	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
-		iounmap(reg_base);
-		return;
+		goto err_unmap;
 	}
 
-	ctx->grf = grf;
+	pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
+	if (!pmu0_grf_e)
+		goto err_unmap;
+
+	pmu0_grf_e->grf = pmu0_grf;
+	pmu0_grf_e->type = grf_type_pmu0;
+	hash_add(ctx->aux_grf_table, &pmu0_grf_e->node, grf_type_pmu0);
 
 	rockchip_clk_register_plls(ctx, rk3576_pll_clks,
 				   ARRAY_SIZE(rk3576_pll_clks),
@@ -1772,6 +1778,12 @@ static void __init rk3576_clk_init(struct device_node *np)
 	rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
 
 	rockchip_clk_of_add_provider(np, ctx);
+
+	return;
+
+err_unmap:
+	iounmap(reg_base);
+	return;
 }
 
 CLK_OF_DECLARE(rk3576_cru, "rockchip,rk3576-cru", rk3576_clk_init);
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index cbf93ea119a9e25c037607ded1f6f358918e8656..0f029106d8aaa24ced78b2ef29726aa561ef6f0d 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -382,6 +382,8 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
 	ctx->cru_node = np;
 	spin_lock_init(&ctx->lock);
 
+	hash_init(ctx->aux_grf_table);
+
 	ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
 						   "rockchip,grf");
 
@@ -496,6 +498,8 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk)
 {
+	struct regmap *grf = ctx->grf;
+	struct rockchip_aux_grf *agrf;
 	struct clk *clk;
 	unsigned int idx;
 	unsigned long flags;
@@ -504,6 +508,17 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		flags = list->flags;
 		clk = NULL;
 
+		/* for GRF-dependent branches, choose the right grf first */
+		if (list->branch_type == branch_muxgrf &&
+				list->grf_type != grf_type_sys) {
+			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
+				if (agrf->type == list->grf_type) {
+					grf = agrf->grf;
+					break;
+				}
+			}
+		}
+
 		/* catch simple muxes */
 		switch (list->branch_type) {
 		case branch_mux:
@@ -526,7 +541,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		case branch_muxgrf:
 			clk = rockchip_clk_register_muxgrf(list->name,
 				list->parent_names, list->num_parents,
-				flags, ctx->grf, list->muxdiv_offset,
+				flags, grf, list->muxdiv_offset,
 				list->mux_shift, list->mux_width,
 				list->mux_flags);
 			break;
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index df2b2d706450f38dfe2b3c7762763c5e832b9892..c136ac54e6213490a995fff553730fa63694dd8f 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -19,6 +19,7 @@
 
 #include <linux/io.h>
 #include <linux/clk-provider.h>
+#include <linux/hashtable.h>
 
 struct clk;
 
@@ -440,12 +441,35 @@ enum rockchip_pll_type {
 	.k = _k,						\
 }
 
+enum rockchip_grf_type {
+	grf_type_sys = 0,
+	grf_type_pmu0,
+	grf_type_pmu1,
+	grf_type_ioc,
+};
+
+/* ceil(sqrt(enums in rockchip_grf_type - 1)) */
+#define GRF_HASH_ORDER 2
+
+/**
+ * struct rockchip_aux_grf - entry for the aux_grf_table hashtable
+ * @grf: pointer to the grf this entry references
+ * @type: what type of GRF this is
+ * @node: hlist node
+ */
+struct rockchip_aux_grf {
+	struct regmap *grf;
+	enum rockchip_grf_type type;
+	struct hlist_node node;
+};
+
 /**
  * struct rockchip_clk_provider - information about clock provider
  * @reg_base: virtual address for the register base.
  * @clk_data: holds clock related data like clk* and number of clocks.
  * @cru_node: device-node of the clock-provider
  * @grf: regmap of the general-register-files syscon
+ * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_type
  * @lock: maintains exclusion between callbacks for a given clock-provider.
  */
 struct rockchip_clk_provider {
@@ -453,6 +477,7 @@ struct rockchip_clk_provider {
 	struct clk_onecell_data clk_data;
 	struct device_node *cru_node;
 	struct regmap *grf;
+	DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
 	spinlock_t lock;
 };
 
@@ -660,6 +685,7 @@ struct rockchip_clk_branch {
 	u8				gate_shift;
 	u8				gate_flags;
 	unsigned int			linked_clk_id;
+	enum rockchip_grf_type		grf_type;
 	struct rockchip_clk_branch	*child;
 };
 
@@ -900,7 +926,7 @@ struct rockchip_clk_branch {
 		.mux_table	= mt,				\
 	}
 
-#define MUXGRF(_id, cname, pnames, f, o, s, w, mf)		\
+#define MUXGRF(_id, cname, pnames, f, o, s, w, mf, gt)		\
 	{							\
 		.id		= _id,				\
 		.branch_type	= branch_muxgrf,		\
@@ -913,6 +939,7 @@ struct rockchip_clk_branch {
 		.mux_width	= w,				\
 		.mux_flags	= mf,				\
 		.gate_offset	= -1,				\
+		.grf_type	= gt,				\
 	}
 
 #define DIV(_id, cname, pname, f, o, s, w, df)			\

-- 
2.49.0



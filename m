Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4474A945F
	for <lists+linux-clk@lfdr.de>; Fri,  4 Feb 2022 08:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349084AbiBDHPJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Feb 2022 02:15:09 -0500
Received: from muru.com ([72.249.23.125]:46296 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349136AbiBDHPI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:08 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0108481D8;
        Fri,  4 Feb 2022 07:14:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 8/8] clk: ti: Update component clocks to use ti_dt_clk_name()
Date:   Fri,  4 Feb 2022 09:14:49 +0200
Message-Id: <20220204071449.16762-9-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's update all the TI component clocks to use ti_dt_clk_name() instead
of devicetree node name if available.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/autoidle.c     | 2 +-
 drivers/clk/ti/clk-dra7-atl.c | 6 ++++--
 drivers/clk/ti/composite.c    | 6 ++++--
 drivers/clk/ti/divider.c      | 6 ++++--
 drivers/clk/ti/fixed-factor.c | 2 +-
 drivers/clk/ti/gate.c         | 4 +++-
 drivers/clk/ti/interface.c    | 4 +++-
 drivers/clk/ti/mux.c          | 4 +++-
 8 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/ti/autoidle.c b/drivers/clk/ti/autoidle.c
--- a/drivers/clk/ti/autoidle.c
+++ b/drivers/clk/ti/autoidle.c
@@ -205,7 +205,7 @@ int __init of_ti_clk_autoidle_setup(struct device_node *node)
 		return -ENOMEM;
 
 	clk->shift = shift;
-	clk->name = node->name;
+	clk->name = ti_dt_clk_name(node);
 	ret = ti_clk_get_reg_addr(node, 0, &clk->reg);
 	if (ret) {
 		kfree(clk);
diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -173,6 +173,7 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 	struct dra7_atl_desc *clk_hw = NULL;
 	struct clk_init_data init = { NULL };
 	const char **parent_names = NULL;
+	const char *name;
 	struct clk *clk;
 
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
@@ -183,7 +184,8 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 
 	clk_hw->hw.init = &init;
 	clk_hw->divider = 1;
-	init.name = node->name;
+	name = ti_dt_clk_name(node);
+	init.name = name;
 	init.ops = &atl_clk_ops;
 	init.flags = CLK_IGNORE_UNUSED;
 	init.num_parents = of_clk_get_parent_count(node);
@@ -203,7 +205,7 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 
 	init.parent_names = parent_names;
 
-	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
+	clk = ti_clk_register(NULL, &clk_hw->hw, name);
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -125,6 +125,7 @@ static void __init _register_composite(void *user,
 	struct component_clk *comp;
 	int num_parents = 0;
 	const char **parent_names = NULL;
+	const char *name;
 	int i;
 	int ret;
 
@@ -172,7 +173,8 @@ static void __init _register_composite(void *user,
 		goto cleanup;
 	}
 
-	clk = clk_register_composite(NULL, node->name,
+	name = ti_dt_clk_name(node);
+	clk = clk_register_composite(NULL, name,
 				     parent_names, num_parents,
 				     _get_hw(cclk, CLK_COMPONENT_TYPE_MUX),
 				     &ti_clk_mux_ops,
@@ -182,7 +184,7 @@ static void __init _register_composite(void *user,
 				     &ti_composite_gate_ops, 0);
 
 	if (!IS_ERR(clk)) {
-		ret = ti_clk_add_alias(NULL, clk, node->name);
+		ret = ti_clk_add_alias(NULL, clk, name);
 		if (ret) {
 			clk_unregister(clk);
 			goto cleanup;
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -320,10 +320,12 @@ static struct clk *_register_divider(struct device_node *node,
 	struct clk *clk;
 	struct clk_init_data init;
 	const char *parent_name;
+	const char *name;
 
 	parent_name = of_clk_get_parent_name(node, 0);
 
-	init.name = node->name;
+	name = ti_dt_clk_name(node);
+	init.name = name;
 	init.ops = &ti_clk_divider_ops;
 	init.flags = flags;
 	init.parent_names = (parent_name ? &parent_name : NULL);
@@ -332,7 +334,7 @@ static struct clk *_register_divider(struct device_node *node,
 	div->hw.init = &init;
 
 	/* register the clock */
-	clk = ti_clk_register(NULL, &div->hw, node->name);
+	clk = ti_clk_register(NULL, &div->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(div);
diff --git a/drivers/clk/ti/fixed-factor.c b/drivers/clk/ti/fixed-factor.c
--- a/drivers/clk/ti/fixed-factor.c
+++ b/drivers/clk/ti/fixed-factor.c
@@ -36,7 +36,7 @@
 static void __init of_ti_fixed_factor_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
-	const char *clk_name = node->name;
+	const char *clk_name = ti_dt_clk_name(node);
 	const char *parent_name;
 	u32 div, mult;
 	u32 flags = 0;
diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -138,6 +138,7 @@ static void __init _of_ti_gate_clk_setup(struct device_node *node,
 	struct clk *clk;
 	const char *parent_name;
 	struct clk_omap_reg reg;
+	const char *name;
 	u8 enable_bit = 0;
 	u32 val;
 	u32 flags = 0;
@@ -164,7 +165,8 @@ static void __init _of_ti_gate_clk_setup(struct device_node *node,
 	if (of_property_read_bool(node, "ti,set-bit-to-disable"))
 		clk_gate_flags |= INVERT_ENABLE;
 
-	clk = _register_gate(NULL, node->name, parent_name, flags, &reg,
+	name = ti_dt_clk_name(node);
+	clk = _register_gate(NULL, name, parent_name, flags, &reg,
 			     enable_bit, clk_gate_flags, ops, hw_ops);
 
 	if (!IS_ERR(clk))
diff --git a/drivers/clk/ti/interface.c b/drivers/clk/ti/interface.c
--- a/drivers/clk/ti/interface.c
+++ b/drivers/clk/ti/interface.c
@@ -72,6 +72,7 @@ static void __init _of_ti_interface_clk_setup(struct device_node *node,
 	const char *parent_name;
 	struct clk_omap_reg reg;
 	u8 enable_bit = 0;
+	const char *name;
 	u32 val;
 
 	if (ti_clk_get_reg_addr(node, 0, &reg))
@@ -86,7 +87,8 @@ static void __init _of_ti_interface_clk_setup(struct device_node *node,
 		return;
 	}
 
-	clk = _register_interface(NULL, node->name, parent_name, &reg,
+	name = ti_dt_clk_name(node);
+	clk = _register_interface(NULL, name, parent_name, &reg,
 				  enable_bit, ops);
 
 	if (!IS_ERR(clk))
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -176,6 +176,7 @@ static void of_mux_clk_setup(struct device_node *node)
 	struct clk_omap_reg reg;
 	unsigned int num_parents;
 	const char **parent_names;
+	const char *name;
 	u8 clk_mux_flags = 0;
 	u32 mask = 0;
 	u32 shift = 0;
@@ -213,7 +214,8 @@ static void of_mux_clk_setup(struct device_node *node)
 
 	mask = (1 << fls(mask)) - 1;
 
-	clk = _register_mux(NULL, node->name, parent_names, num_parents,
+	name = ti_dt_clk_name(node);
+	clk = _register_mux(NULL, name, parent_names, num_parents,
 			    flags, &reg, shift, mask, latch, clk_mux_flags,
 			    NULL);
 
-- 
2.35.1

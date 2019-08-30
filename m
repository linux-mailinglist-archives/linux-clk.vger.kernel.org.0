Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966B5A39FB
	for <lists+linux-clk@lfdr.de>; Fri, 30 Aug 2019 17:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfH3PJm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Aug 2019 11:09:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728232AbfH3PJ2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Aug 2019 11:09:28 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6851C2342A;
        Fri, 30 Aug 2019 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567177767;
        bh=lq5loIkxSt3ugN+aBMACxOO2vhnCkN0nhH1aF4brFsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2kDUNxMJgKHqmzmneMudM9mjaTrFGJXeS3v7vAnDHgiNucrB5u6vXnpSGo5bfiKc4
         BR79Yl6uqsaltCrIKI52nwrCsG26Xt+We2WeRvzyzDvB3sUMpBR+THn7vegLTW9iQM
         smeb4aFfd5FJplNeBU68k59NNQ3C4PnIri3OWZgE=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/12] clk: mux: Add support for specifying parents via DT/pointers
Date:   Fri, 30 Aug 2019 08:09:21 -0700
Message-Id: <20190830150923.259497-11-sboyd@kernel.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190830150923.259497-1-sboyd@kernel.org>
References: <20190830150923.259497-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After commit fc0c209c147f ("clk: Allow parents to be specified without
string names") we can use DT or direct clk_hw pointers to specify
parents. Create a generic function that shouldn't be used very often to
encode the multitude of ways of registering a mux clk with different
parent information. Then add a bunch of wrapper macros that only pass
down what needs to be passed down to the generic function to support
this with less arguments.

Note: the msm drm driver passes an anonymous array through the macro
which seems to confuse my compiler. Adding a parenthesis around the
whole thing at the call site seems to fix it but it must be wrong. Maybe
it's better to split this patch and pick out the array bits there?

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-mux.c                      | 58 +++++++---------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c |  4 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c |  4 +-
 include/linux/clk-provider.h               | 56 ++++++++++++++-------
 4 files changed, 60 insertions(+), 62 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 66e91f740508..e0212c451880 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -145,17 +145,19 @@ const struct clk_ops clk_mux_ro_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
 
-struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u32 mask,
+struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
 {
 	struct clk_mux *mux;
 	struct clk_hw *hw;
 	struct clk_init_data init;
 	u8 width = 0;
-	int ret;
+	int ret = -EINVAL;
 
 	if (clk_mux_flags & CLK_MUX_HIWORD_MASK) {
 		width = fls(mask) - ffs(mask) + 1;
@@ -177,6 +179,8 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 		init.ops = &clk_mux_ops;
 	init.flags = flags;
 	init.parent_names = parent_names;
+	init.parent_data = parent_data;
+	init.parent_hws = parent_hws;
 	init.num_parents = num_parents;
 
 	/* struct clk_mux assignments */
@@ -189,7 +193,10 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 	mux->hw.init = &init;
 
 	hw = &mux->hw;
-	ret = clk_hw_register(dev, hw);
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
 	if (ret) {
 		kfree(mux);
 		hw = ERR_PTR(ret);
@@ -197,53 +204,24 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 
 	return hw;
 }
-EXPORT_SYMBOL_GPL(clk_hw_register_mux_table);
+EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
 
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u32 mask,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
 {
 	struct clk_hw *hw;
 
-	hw = clk_hw_register_mux_table(dev, name, parent_names, num_parents,
-				       flags, reg, shift, mask, clk_mux_flags,
-				       table, lock);
+	hw = clk_hw_register_mux_table(dev, name, parent_names,
+				       num_parents, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
 }
 EXPORT_SYMBOL_GPL(clk_register_mux_table);
 
-struct clk *clk_register_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_mux_flags, spinlock_t *lock)
-{
-	u32 mask = BIT(width) - 1;
-
-	return clk_register_mux_table(dev, name, parent_names, num_parents,
-				      flags, reg, shift, mask, clk_mux_flags,
-				      NULL, lock);
-}
-EXPORT_SYMBOL_GPL(clk_register_mux);
-
-struct clk_hw *clk_hw_register_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_mux_flags, spinlock_t *lock)
-{
-	u32 mask = BIT(width) - 1;
-
-	return clk_hw_register_mux_table(dev, name, parent_names, num_parents,
-				      flags, reg, shift, mask, clk_mux_flags,
-				      NULL, lock);
-}
-EXPORT_SYMBOL_GPL(clk_hw_register_mux);
-
 void clk_unregister_mux(struct clk *clk)
 {
 	struct clk_mux *mux;
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 8f6100db90ed..1c894548dd72 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -751,9 +751,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm)
 	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
 
 	hw = clk_hw_register_mux(dev, clk_name,
-				 (const char *[]){
+				 ((const char *[]){
 				 parent, parent2, parent3, parent4
-				 }, 4, 0, pll_10nm->phy_cmn_mmio +
+				 }), 4, 0, pll_10nm->phy_cmn_mmio +
 				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
 				 0, 2, 0, NULL);
 	if (IS_ERR(hw)) {
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
index 8c99e01ae332..6dffd7f4a99b 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
@@ -554,9 +554,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm)
 	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
 	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
 	clks[num++] = clk_register_mux(dev, clk_name,
-			(const char *[]){
+			((const char *[]){
 				parent1, parent2
-			}, 2, CLK_SET_RATE_PARENT, pll_28nm->mmio +
+			}), 2, CLK_SET_RATE_PARENT, pll_28nm->mmio +
 			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
 
 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 694bd3274221..47dd0efce416 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -644,28 +644,48 @@ struct clk_mux {
 extern const struct clk_ops clk_mux_ops;
 extern const struct clk_ops clk_mux_ro_ops;
 
-struct clk *clk_register_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_mux_flags, spinlock_t *lock);
-struct clk_hw *clk_hw_register_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_mux_flags, spinlock_t *lock);
-
-struct clk *clk_register_mux_table(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u32 mask,
+struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
-struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
+struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u32 mask,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
 
+#define clk_register_mux(dev, name, parent_names, num_parents, flags, reg,    \
+			 shift, width, clk_mux_flags, lock)		      \
+	clk_register_mux_table((dev), (name), (parent_names), (num_parents),  \
+			       (flags), (reg), (shift), BIT((width)) - 1,     \
+			       (clk_mux_flags), NULL, (lock))
+#define clk_hw_register_mux_table(dev, name, parent_names, num_parents,	      \
+				  flags, reg, shift, mask, clk_mux_flags,     \
+				  table, lock)				      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), (mask), (clk_mux_flags), (table),      \
+			      (lock))
+#define clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
+			    shift, width, clk_mux_flags, lock)		      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
+#define clk_hw_register_mux_hws(dev, name, parent_hws, num_parents, flags,    \
+				reg, shift, width, clk_mux_flags, lock)	      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,	      \
+			      (parent_hws), NULL, (flags), (reg), (shift),    \
+			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+#define clk_hw_register_mux_parent_data(dev, name, parent_data, num_parents,  \
+					flags, reg, shift, width,	      \
+					clk_mux_flags, lock)      	      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
+			      (parent_data), (flags), (reg), (shift),	      \
+			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+
 int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
 			 unsigned int val);
 unsigned int clk_mux_index_to_val(u32 *table, unsigned int flags, u8 index);
-- 
Sent by a computer through tubes


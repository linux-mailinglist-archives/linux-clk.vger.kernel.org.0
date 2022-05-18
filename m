Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114A552AEE8
	for <lists+linux-clk@lfdr.de>; Wed, 18 May 2022 01:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbiEQX7j (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 May 2022 19:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiEQX7g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 19:59:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3420353B6E;
        Tue, 17 May 2022 16:59:34 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E8EFB84253;
        Wed, 18 May 2022 01:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1652831972;
        bh=3IXanpwxKJqg6DbP8AshOQri6FpiAaXyP74Si8i9PB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=web7YqY1FQMWRMPsCz3wFml5yyu8urXAdfRPuq0Lyev9kD7RhsyO3Odj1DPgv1Sil
         4liZ4bx8pvRdgfjVQvAY5CpTXdo8kpTI2BPczaYV8kNs56llS2NVjbsVI5QXcypVXu
         zSxcRA5Ov5pTDgw93IK5Q8qIHVLVzu5P8aiBEt1b6fJXCn3diraeVrcWyVVz4OsGdH
         SnMVf1B0+Vf9pXsEePy80QhO/2VNtUyzzf9A1VdxU39M1qO6q4yXtgTnBpUrSqvQNv
         RtVf8TAX/25E86JGMivQMhNczXnreIs1y4XIMl63lqN7adaKCiivE71vWKQj59FVr0
         8aQTAHGby+hEw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] clk: Introduce 'critical-clocks' property
Date:   Wed, 18 May 2022 01:59:19 +0200
Message-Id: <20220517235919.200375-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517235919.200375-1-marex@denx.de>
References: <20220517235919.200375-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require select clock to be always running, e.g. because
those clock supply vital devices which are not otherwise attached to
the system and thus do not have a matching DT node and clock consumer.

An example is a system where the SoC serves as a crystal oscillator
replacement for a programmable logic device. The "critical-clocks"
property of a clock controller allows listing clock which must never
be turned off.

Clock listed in the "critical-clocks" property may have other consumers
in DT, listing the clock in "critical-clocks" only assures those clock
are never turned off, and none of these optional additional consumers
can turn the clock off either. This is achieved by adding CLK_IS_CRITICAL
flag to these critical clock.

This flag has thus far been added to select clock by hard-coding it in
various clock drivers, this patch provides generic DT interface to add
the flag to arbitrary clock that may be critical.

The implementation is modeled after "protected-clocks", except the protected
clock property is currently driver specific. This patch attempts to provide
a generic implementation of "critical-clocks" instead.

Unlike "assigned-clocks", the "critical-clocks" must be parsed much earlier
in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
field.

The new match_clkspec() callback is used to determine whether struct clk_hw
that is currently being registered matches the clock specifier in the DT
"critical-clocks" property, and if so, then the CLK_IS_CRITICAL is added to
these newly registered clock. This callback can only be driver specific.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: - Warn in case critical-clock field cannot be parsed and skip those clock
    - Use match_clkspec() only for non-zero clock-cells controllers
    - Pull the critical-clock code into __clk_register_critical_clock()
    - Update commit message
V3: - Pick np from clk_core->of_node
---
 drivers/clk/clk.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d72..e04bca5e1ff30 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3902,6 +3902,48 @@ static void clk_core_free_parent_map(struct clk_core *core)
 	kfree(core->parents);
 }
 
+static void
+__clk_register_critical_clock(struct clk_core *core, struct clk_hw *hw)
+{
+	struct device_node *np = core->of_node;
+	struct of_phandle_args clkspec;
+	u32 clksize, clktotal;
+	int ret, i, index;
+
+	if (!np)
+		return;
+
+	if (of_property_read_u32(np, "#clock-cells", &clksize))
+		return;
+
+	/* Clock node with #clock-cells = <0> uses critical-clocks; */
+	if (clksize == 0) {
+		if (of_property_read_bool(np, "critical-clocks"))
+			core->flags |= CLK_IS_CRITICAL;
+		return;
+	}
+
+	if (!core->ops->match_clkspec)
+		return;
+
+	clkspec.np = np;
+	clktotal = of_property_count_u32_elems(np, "critical-clocks");
+	clktotal /= clksize;
+	for (index = 0; index < clktotal; index++) {
+		for (i = 0; i < clksize; i++) {
+			ret = of_property_read_u32_index(np, "critical-clocks",
+							 (index * clksize) + i,
+							 &(clkspec.args[i]));
+			if (ret) {
+				pr_warn("Skipping critical-clocks index %d (ret=%d)\n",
+					i, ret);
+			}
+		}
+		if (!core->ops->match_clkspec(hw, &clkspec))
+			core->flags |= CLK_IS_CRITICAL;
+	}
+}
+
 static struct clk *
 __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
@@ -3946,6 +3988,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	__clk_register_critical_clock(core, hw);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e23..f65f6ef4e9985 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -205,6 +205,8 @@ struct clk_duty {
  *		directory is provided as an argument.  Called with
  *		prepare_lock held.  Returns 0 on success, -EERROR otherwise.
  *
+ * @match_clkspec: Check whether clk_hw matches DT clock specifier.
+ *		Returns 0 on success, -EERROR otherwise.
  *
  * The clk_enable/clk_disable and clk_prepare/clk_unprepare pairs allow
  * implementations to split any work between atomic (enable) and sleepable
@@ -252,6 +254,7 @@ struct clk_ops {
 	int		(*init)(struct clk_hw *hw);
 	void		(*terminate)(struct clk_hw *hw);
 	void		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
+	int		(*match_clkspec)(struct clk_hw *hw, struct of_phandle_args *clkspec);
 };
 
 /**
-- 
2.35.1


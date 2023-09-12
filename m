Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B401D79D824
	for <lists+linux-clk@lfdr.de>; Tue, 12 Sep 2023 19:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjILRzk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Sep 2023 13:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236851AbjILRzj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Sep 2023 13:55:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE0BC1;
        Tue, 12 Sep 2023 10:55:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6EDC433CB;
        Tue, 12 Sep 2023 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694541335;
        bh=FfnLct/wM1EZ4QoILWTk6w0kU9+rPQdHk0gX8shw8H0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MBjMeUOip/jXsDm9/9iiwSwy8/XXD5zbPdWpXFRofw8xoxJjpkluJpk7Lidv7e5x9
         B5tw4JyfzIY3J8sEr8rA259DNMkvGGt+aShf12exuXjE3lbDj4uh0UXHDx73ARPCcB
         qRBoHO4J0hMDZS7icph61GpnRpTZoK1AAUhtJU3F94LTu4nyjlsHy6o1jvG/s7ySJj
         WwBkjV/p0o8k/SMihdVqNsGz7uvXiR+lUOpcOtqLXihgJGwK+u/rYw9PonHf4B6NP0
         tLrTc9Eo4dOudHXIm3o8EtHSbsItkoXCq1dAW3RW89N4KK90+998aRKmqYn8G6TPzv
         T8qDNS19XokZw==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
        kernel test robot <yujie.liu@intel.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] clk: Drive clk_leaf_mux_set_rate_parent test from clk_ops
Date:   Tue, 12 Sep 2023 10:55:30 -0700
Message-ID: <20230912175534.2427862-2-sboyd@kernel.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230912175534.2427862-1-sboyd@kernel.org>
References: <20230912175534.2427862-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Running this kunit test with lockdep enabled leads to warning splats
about calling clk provider APIs without the clk_prepare lock held.  I
proposed adding a wrapper around these APIs to grab the prepare lock so
we can call them from anywhere, and Maxime implemented that approach[1],
but it didn't look great. That's because we had to make more kunit
testing APIs just to call code from a place that isn't a clk provider
when the prepare lock isn't held.

Instead of doing that, let's implement a determine_rate clk_op for a new
leaf clk that is the child of the existing leaf clk. We can call
__clk_determine_rate() on the existing leaf clk from there, and stash
away the clk_rate_request struct to check once the clk_op returns. Drive
that clk_op by calling clk_round_rate() to keep things similar to how it
was before (i.e. nothing actually changes rate, just the new rate is
determined). This silences the warning by driving the test from a
clk_op where we know the prepare lock is held.

While looking at this in more detail, it was determined that the code we
intended to test in commit 262ca38f4b6e ("clk: Stop forwarding
clk_rate_requests to the parent") wasn't actually tested. The call to
__clk_determine_rate() wasn't actually getting to the newly introduced
code under the CLK_SET_RATE_PARENT if condition in
clk_core_round_rate_nolock() because the parent clk (the mux) could
round rates. We introduce a new leaf and make sure the parent of that
clk has no clk_ops so that we can be certain that the
CLK_SET_RATE_PARENT condition in clk_core_round_rate_nolock() is
evaluated.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-clk/2b594e50-2bbf-4a2d-88e6-49fc39f3957a@roeck-us.net/
Reported-by: kernel test robot <yujie.liu@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202301310919.b9d56ee3-yujie.liu@intel.com
Cc: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/r/20230721-clk-fix-kunit-lockdep-v1-0-32cdba4c8fc1@kernel.org [1]
Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the parent")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk_test.c | 65 +++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a154ec9d0111..43e85fc0b025 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -10,6 +10,8 @@
 
 #include <kunit/test.h>
 
+static const struct clk_ops empty_clk_ops = { };
+
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
@@ -2155,6 +2157,30 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 struct clk_leaf_mux_ctx {
 	struct clk_multiple_parent_ctx mux_ctx;
 	struct clk_hw hw;
+	struct clk_hw parent;
+	struct clk_rate_request *req;
+};
+
+static int clk_leaf_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct clk_leaf_mux_ctx *ctx = container_of(hw, struct clk_leaf_mux_ctx, hw);
+	int ret;
+	struct clk_rate_request *parent_req = ctx->req;
+
+	clk_hw_forward_rate_request(hw, req, req->best_parent_hw, parent_req, req->rate);
+	ret = __clk_determine_rate(req->best_parent_hw, parent_req);
+	if (ret)
+		return ret;
+
+	req->rate = parent_req->rate;
+
+	return 0;
+}
+
+static const struct clk_ops clk_leaf_mux_set_rate_parent_ops = {
+	.determine_rate = clk_leaf_mux_determine_rate,
+	.set_parent = clk_dummy_single_set_parent,
+	.get_parent = clk_dummy_single_get_parent,
 };
 
 static int
@@ -2193,8 +2219,14 @@ clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 	if (ret)
 		return ret;
 
-	ctx->hw.init = CLK_HW_INIT_HW("test-clock", &ctx->mux_ctx.hw,
-				      &clk_dummy_single_parent_ops,
+	ctx->parent.init = CLK_HW_INIT_HW("test-parent", &ctx->mux_ctx.hw,
+					  &empty_clk_ops, CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->parent);
+	if (ret)
+		return ret;
+
+	ctx->hw.init = CLK_HW_INIT_HW("test-clock", &ctx->parent,
+				      &clk_leaf_mux_set_rate_parent_ops,
 				      CLK_SET_RATE_PARENT);
 	ret = clk_hw_register(NULL, &ctx->hw);
 	if (ret)
@@ -2208,32 +2240,31 @@ static void clk_leaf_mux_set_rate_parent_test_exit(struct kunit *test)
 	struct clk_leaf_mux_ctx *ctx = test->priv;
 
 	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parent);
 	clk_hw_unregister(&ctx->mux_ctx.hw);
 	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[0].hw);
 	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[1].hw);
 }
 
 /*
- * Test that, for a clock that will forward any rate request to its
- * parent, the rate request structure returned by __clk_determine_rate
- * is sane and will be what we expect.
+ * Test that, for a clock that will forward any rate request to its parent, the
+ * rate request structure returned by __clk_determine_rate() is sane and
+ * doesn't have the clk_rate_request's best_parent_hw pointer point to the
+ * clk_hw passed into __clk_determine_rate(). See commit 262ca38f4b6e ("clk:
+ * Stop forwarding clk_rate_requests to the parent") for more background.
  */
-static void clk_leaf_mux_set_rate_parent_determine_rate(struct kunit *test)
+static void clk_leaf_mux_set_rate_parent__clk_determine_rate_proper_parent(struct kunit *test)
 {
 	struct clk_leaf_mux_ctx *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk_rate_request req;
 	unsigned long rate;
-	int ret;
 
+	ctx->req = &req;
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
-
-	clk_hw_init_rate_request(hw, &req, DUMMY_CLOCK_RATE_2);
-
-	ret = __clk_determine_rate(hw, &req);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, DUMMY_CLOCK_RATE_2, clk_round_rate(clk, DUMMY_CLOCK_RATE_2));
 
 	KUNIT_EXPECT_EQ(test, req.rate, DUMMY_CLOCK_RATE_2);
 	KUNIT_EXPECT_EQ(test, req.best_parent_rate, DUMMY_CLOCK_RATE_2);
@@ -2243,15 +2274,15 @@ static void clk_leaf_mux_set_rate_parent_determine_rate(struct kunit *test)
 }
 
 static struct kunit_case clk_leaf_mux_set_rate_parent_test_cases[] = {
-	KUNIT_CASE(clk_leaf_mux_set_rate_parent_determine_rate),
+	KUNIT_CASE(clk_leaf_mux_set_rate_parent__clk_determine_rate_proper_parent),
 	{}
 };
 
 /*
- * Test suite for a clock whose parent is a mux with multiple parents.
- * The leaf clock has CLK_SET_RATE_PARENT, and will forward rate
- * requests to the mux, which will then select which parent is the best
- * fit for a given rate.
+ * Test suite for a clock whose parent is a pass-through clk whose parent is a
+ * mux with multiple parents. The leaf and pass-through clocks have the
+ * CLK_SET_RATE_PARENT flag, and will forward rate requests to the mux, which
+ * will then select which parent is the best fit for a given rate.
  *
  * These tests exercise the behaviour of muxes, and the proper selection
  * of parents.
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git


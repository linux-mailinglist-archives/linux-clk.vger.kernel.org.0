Return-Path: <linux-clk+bounces-22393-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3CAC7465
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 01:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB94C50297F
	for <lists+linux-clk@lfdr.de>; Wed, 28 May 2025 23:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A97224898;
	Wed, 28 May 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AI0KEZ10"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FD221FCD
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474250; cv=none; b=thg7aNPSXPYRp7zPZpM2EJ3i88tqTB+QRJ4ailm+XPT1rhu7rYwpshCeayE7l6G7t9NyNkrFo2wYYreGk1XNmxzTU75y0PlfoDOZ4uc+goPpNSpmJSilWyjk1Bs6n3XBUbjqGL96K2SxZpG/J4aWRZ3xArryIoFyyzou4twvFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474250; c=relaxed/simple;
	bh=kG6u7fMzlYNawhtWbFLh1LXdL8BTH4EkRE0c5G3ajEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onBBDOTWbcErslyUZOz1av0njRZ5HAvANK2exBt69RaX/9YWWrTLhdUPqbulisFIYMTDdxISqLq9GkxRGC+uaVrvdWSo2XbBQxUEryve6xntNz5Yt/dgSIhJCCLR2ZasBMHrXNdWOtemK1x117bryunD13/0d+ckQVhPe+WRcvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AI0KEZ10; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nWljoLC2sVqolLWLvHFiBRnNNgGa1dpWaIMedYHYE9M=;
	b=AI0KEZ10tLqhnAYfacCIoZQiLWVikjuZJ0jEuK5/OpZlystoRqeXaTlOLyY31/8ofl4/8d
	JmaXrElOc0WyDXKRVkjwpt4wy585u1VYcmZuoq7Pw3DZ2wsqFKRySxQxKgdG9SuWeytAXP
	kClIEnSJNEmmdRwtL5bXsLPuDBvukzY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-URxhT3QpOZy5G7hnKgPObQ-1; Wed, 28 May 2025 19:17:26 -0400
X-MC-Unique: URxhT3QpOZy5G7hnKgPObQ-1
X-Mimecast-MFC-AGG-ID: URxhT3QpOZy5G7hnKgPObQ_1748474246
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so7745776d6.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474246; x=1749079046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWljoLC2sVqolLWLvHFiBRnNNgGa1dpWaIMedYHYE9M=;
        b=VScQA4tmIRju/FHBAoBaffznLftJlzrNltFIvoLw2XqLFdj0UqKbpy/gOoh6LUIaTR
         fJEpXw9JX5oHOimD+yTF1eTbDSQxce2dZrF8l6TdMs/xcH8xMVWcHSdUidnNTIWdeJKS
         u9+jbRI9MCMLadXRijxN4h9WXRiAZY11lcFsU1g4A3hOTq4ITZwJg7+Cq0CvL1mrTlmS
         nzazAgDOHeFT90kbt/EQHBlljgtHyolKBQdGWOoyECBHXF4OqDoModxXn0iHfYwmnoRh
         63yivVGMs3VKv0CO0VUTVoZC+fq4IHIWP1v5v5CEHWYqVLfl2pkHCSM0Os7DOj2DceEL
         CYVQ==
X-Gm-Message-State: AOJu0YzYpfTtKizgZyhNZFsW7RLPfMXB3EvuZeCMi4YyPBNFZoJ2ZSRC
	Wbl5TRdcapEkdkMatGWWOp4XhqiTAL0JkzOxkn4CcxhDoCxW/hh2p7c3Uvc27wpuxyjMwmTr1Zy
	/E5FB46Y1kemmsz4IncZOdxcRSULA4j7elUUiu/bjv9EjObdKhP3CKzuF7ENCEQ==
X-Gm-Gg: ASbGncuS2x1giT9I+66s7L6KRtzTxP4Sei5JmhNkDT6rWAF7qz1nCvfz5XERXpMw8XN
	13+GxqPkpi5r9324kanjo40WuUhgmTDz9NI50awU5Kp6f4iKTffffhtCY4jV17WK++hvwmWhRCB
	Jv+d6ncgtZKMl2Hop08Uf7pxT5esqEAno2kIuFBzzJEKyK6Ujar730o6xxLPILL7aQ3uVH2/YU/
	52i0p3wN4JieFPPEbnJXasnHc2kMMXocMrK8aOhZMaMzD6qLoXbB4uOZX8cqYa1qjRaY8M16mDg
	hKOaGCHLfjl214N0UgGGzx1n9kBo+p5bA3xheJ/dGcXs5ygZxQ==
X-Received: by 2002:a05:6214:1949:b0:6f5:4214:774a with SMTP id 6a1803df08f44-6fac858a0c9mr439036d6.41.1748474245687;
        Wed, 28 May 2025 16:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5Jw6lW2iE9TQUSfc4cVAsLOjUQvY0C6ajITrG1/XFl/V3Hs9oZwFVM1VbajT+0sADeUY6w==
X-Received: by 2002:a05:6214:1949:b0:6f5:4214:774a with SMTP id 6a1803df08f44-6fac858a0c9mr438786d6.41.1748474245361;
        Wed, 28 May 2025 16:17:25 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:53 -0400
Subject: [PATCH v2 07/10] clk: test: introduce test suite for sibling rate
 changes on a gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-7-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=6771;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kG6u7fMzlYNawhtWbFLh1LXdL8BTH4EkRE0c5G3ajEc=;
 b=TZ4NRb1XDMzb9R3HAchwwsRpCugASlGuEDjkadlx5srrW+6TSU+QGvVVbsc7OwSwzVUTP6J7+
 I5z6gm5wj0mDjFpB+5PKfBJAYF2ZnhNkWWBmX57KC8fGAKvytGskjfD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test suite that creates a parent with two children: a
divider and a gate. Ensure that changing the rate of one child does
not affect the rate of the gate.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core. This is also implemented as a parameterized kunit test
since additional test variations will be added.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 156 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index c2337527873d3241e7b0a38f67ecaa13535bcc71..1440eb3c41def8c549f92c0e95b2a472f3bdb4a7 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -825,6 +825,161 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
 
+struct clk_test_rate_change_sibling_clk_ctx {
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static void
+clk_test_rate_change_sibling_clk_ctx_put(struct clk_test_rate_change_sibling_clk_ctx *clk_ctx)
+{
+	clk_put(clk_ctx->parent_clk);
+	clk_put(clk_ctx->child1_clk);
+	clk_put(clk_ctx->child2_clk);
+}
+
+struct clk_rate_change_sibling_div_gate_sibling_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1;
+	struct clk_dummy_gate child2;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_gate_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = DUMMY_CLOCK_RATE_24_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk),
+			DUMMY_CLOCK_RATE_24_MHZ);
+
+	return &ctx->clk_ctx;
+}
+
+struct clk_test_rate_change_sibling_test_case {
+	const char *desc;
+	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
+};
+
+static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_sibling_test_cases[] = {
+	{
+		.desc = "div_gate",
+		.init = clk_rate_change_sibling_div_gate_test_init,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,
+		       clk_test_rate_change_sibling_test_cases, desc);
+
+/*
+ * Test that, for a parent with two children and one requests a rate change that
+ * requires a change to the parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_1(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *) test->param_value;
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+/*
+ * Test that, for a parent with two children where one requests an exclusive
+ * rate and the other requests a rate change that requires a change to the
+ * parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_2(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *)(test->param_value);
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ret = clk_rate_exclusive_get(ctx->child2_clk);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	clk_rate_exclusive_put(ctx->child2_clk);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+
+static struct kunit_case clk_rate_change_sibling_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_1,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_2,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two children, where the children can
+ * be combinations of a divider, gate, and a mux. Ensure that changing the rate
+ * of one child does affect the rate of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_test_suite = {
+	.name = "clk-rate-change-sibling",
+	.test_cases = clk_rate_change_sibling_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3618,6 +3773,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.49.0



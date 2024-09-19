Return-Path: <linux-clk+bounces-12186-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E197C6A3
	for <lists+linux-clk@lfdr.de>; Thu, 19 Sep 2024 11:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368F428643E
	for <lists+linux-clk@lfdr.de>; Thu, 19 Sep 2024 09:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624E719ADBB;
	Thu, 19 Sep 2024 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cWm8mjNG"
X-Original-To: linux-clk@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B645199FD2;
	Thu, 19 Sep 2024 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726737117; cv=none; b=c8B710Ja6cBERXs9i8Oas8ZbLUDy6v7RxpwYv9AjamiytTUKCzUHE/BZ9y7tyQWAaH1ssIy0o9NjguqDncp6XAAL96gJCxZp5eXA227Bj4GmnsRkMnEB89yScVaz2iYxYvUtnIUGTifIj6Zsrsp+PHm76REWK+RJ572Alz91eCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726737117; c=relaxed/simple;
	bh=cCE3ZPgccD4A0U6HSZ+eShex/Ypqh2Jg5NY6Idri7BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcAR6ZGCzICaFPwvwZaYk6MiSuMoj8nmdvlRGwJez/uQEuv/Q9r8Emwrpu+UQYxteBARqmc0WIkrPjNQYX9+xJcMLuJd5foohOjcmZsrea5ZdVnG1JBj2K4oXs/XMlOGZCGucEU4Y8ufKLsbzSw9oBwnKVghj9b4AxhexNdOJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cWm8mjNG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726737107;
	bh=cCE3ZPgccD4A0U6HSZ+eShex/Ypqh2Jg5NY6Idri7BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWm8mjNGFb12qqSAWhlu2oUXoML+jFREC/LorIwx32SLInFVnMDL/DP5TdsTKoGB/
	 WXSnixrtTVySjDOD/7zJxqacFH5lTiVbsKk0oV1mSdzMEVQVgnTUhdvHeLVrlc1AC9
	 s1Ziw93jpcR/CUoOz6WFuE+QK3hc4j6f5yYvXy3KMlxFWsJbcMKCie/g8PLytHHDh4
	 MQyBhP2u5X5sQJreXF6tppkO8A0+2NwsZxRQIF1UprJQVL+EVbMq1aCSMJQCB7+vpQ
	 rN9NHXl9FVjNUfPis2RjqfdpD0h/SQA/XA1oPbD3Yh6R/drNNyoEXjm9liQwrpNueN
	 XzDzYlnOfNFlQ==
Received: from jupiter.universe (dyndsl-091-248-208-160.ewe-ip-backbone.de [91.248.208.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7297A17E1091;
	Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 230D8480084; Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v11 2/5] clk: rockchip: rk3588: register GATE_LINK later
Date: Thu, 19 Sep 2024 11:09:45 +0200
Message-ID: <20240919091129.83500-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919091129.83500-1-sebastian.reichel@collabora.com>
References: <20240919091129.83500-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The proper GATE_LINK implementation will use runtime PM to handle the
linked gate clocks, which requires device context. Currently all clocks
are registered early via CLK_OF_DECLARE, which is before the kernel
knows about devices.

Moving the full clocks registration to the probe routine does not work,
since the clocks needed for timers must be registered early.

To work around this issue, most of the clock tree is registered early,
but GATE_LINK clocks are handled in the probe routine. Since the resets
are not needed early either, they have also been moved to the probe
routine.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 66 +++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 74051277ecea..b707105573d2 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -266,6 +266,8 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	},							\
 }
 
+static struct rockchip_clk_provider *early_ctx;
+
 static struct rockchip_cpuclk_rate_table rk3588_cpub0clk_rates[] __initdata = {
 	RK3588_CPUB01CLK_RATE(2496000000, 1),
 	RK3588_CPUB01CLK_RATE(2400000000, 1),
@@ -694,7 +696,7 @@ static struct rockchip_pll_clock rk3588_pll_clks[] __initdata = {
 		     RK3588_MODE_CON0, 10, 15, 0, rk3588_pll_rates),
 };
 
-static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
+static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	/*
 	 * CRU Clock-Architecture
 	 */
@@ -2428,7 +2430,9 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(68), 5, GFLAGS),
 	GATE(ACLK_AV1, "aclk_av1", "aclk_av1_pre", 0,
 			RK3588_CLKGATE_CON(68), 2, GFLAGS),
+};
 
+static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
 	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
 	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
@@ -2453,26 +2457,31 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE_LINK(PCLK_VO1GRF, "pclk_vo1grf", "pclk_vo1_root", HCLK_VO1, CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(59), 12, GFLAGS),
 };
 
-static void __init rk3588_clk_init(struct device_node *np)
+static void __init rk3588_clk_early_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
-	unsigned long clk_nr_clks;
+	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
 	void __iomem *reg_base;
 
-	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
-					ARRAY_SIZE(rk3588_clk_branches)) + 1;
+	max_clk_id1 = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
+					ARRAY_SIZE(rk3588_clk_branches));
+	max_clk_id2 = rockchip_clk_find_max_clk_id(rk3588_early_clk_branches,
+					ARRAY_SIZE(rk3588_early_clk_branches));
+	clk_nr_clks = max(max_clk_id1, max_clk_id2) + 1;
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
 		return;
 	}
 
-	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
+	ctx = rockchip_clk_init_early(np, reg_base, clk_nr_clks);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
 		iounmap(reg_base);
 		return;
 	}
+	early_ctx = ctx;
 
 	rockchip_clk_register_plls(ctx, rk3588_pll_clks,
 				   ARRAY_SIZE(rk3588_pll_clks),
@@ -2491,14 +2500,55 @@ static void __init rk3588_clk_init(struct device_node *np)
 			&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
 			ARRAY_SIZE(rk3588_cpub1clk_rates));
 
+	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
+				       ARRAY_SIZE(rk3588_early_clk_branches));
+
+	rockchip_clk_of_add_provider(np, ctx);
+}
+CLK_OF_DECLARE_DRIVER(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_early_init);
+
+static int clk_rk3588_probe(struct platform_device *pdev)
+{
+	struct rockchip_clk_provider *ctx = early_ctx;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+
 	rockchip_clk_register_branches(ctx, rk3588_clk_branches,
 				       ARRAY_SIZE(rk3588_clk_branches));
 
-	rk3588_rst_init(np, reg_base);
+	rockchip_clk_finalize(ctx);
 
+	rk3588_rst_init(np, ctx->reg_base);
 	rockchip_register_restart_notifier(ctx, RK3588_GLB_SRST_FST, NULL);
 
+	/*
+	 * Re-add clock provider, so that the newly added clocks are also
+	 * re-parented and get their defaults configured.
+	 */
+	of_clk_del_provider(np);
 	rockchip_clk_of_add_provider(np, ctx);
+
+	return 0;
 }
 
-CLK_OF_DECLARE(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_init);
+static const struct of_device_id clk_rk3588_match_table[] = {
+	{
+		.compatible = "rockchip,rk3588-cru",
+	},
+	{ }
+};
+
+static struct platform_driver clk_rk3588_driver = {
+	.probe		= clk_rk3588_probe,
+	.driver		= {
+		.name	= "clk-rk3588",
+		.of_match_table = clk_rk3588_match_table,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init rockchip_clk_rk3588_drv_register(void)
+{
+	return platform_driver_register(&clk_rk3588_driver);
+}
+core_initcall(rockchip_clk_rk3588_drv_register);
-- 
2.45.2



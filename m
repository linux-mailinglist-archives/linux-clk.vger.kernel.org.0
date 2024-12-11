Return-Path: <linux-clk+bounces-15763-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0259ED2F0
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 18:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA32188B2A2
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 17:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8BF1DE89A;
	Wed, 11 Dec 2024 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nmrKbTDj"
X-Original-To: linux-clk@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407291DDC11;
	Wed, 11 Dec 2024 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936408; cv=none; b=MMn8clEXvC+HgDwYTeeD3EBIkeLGK0q2Wo5Cf1KNezEoRCzcPd2PPBOQWp/IWny646tvSX02loBG5rfqXNHQvwJR3w+ClnvsIDUfgBMq4evYG2Gb/TNZIGfjwxKQCiM8jJcZ5IYbJb82JSDTBn+QFImWIzW2/zwYM2hEmtZU3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936408; c=relaxed/simple;
	bh=DSNwDLRf/P54mHmslHBKxqEX2ZztLCnT2ge/GxcmDGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdKBA9Cftg6mdw9modVM+RKn71n3tf5xjfpJnZoF5e4IX/z4o7AA09hw2AZoqW05R5cqC3pNQ5tTF+Uv5ED0u6uoWMcs6Bp+Dk33PZ0TBVDUWWfJPPWoFVfGAOG6gWe4UW5+dhnKy8ttfhR10U6q45gUV7MdfoE9ZRpGRlDFByQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nmrKbTDj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733936399;
	bh=DSNwDLRf/P54mHmslHBKxqEX2ZztLCnT2ge/GxcmDGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmrKbTDj8+I8NH3nQWBAeL8Ogw4LJHNVibNsfkklxWPbQuXOLb9TX4Cs6cwx//bKY
	 ZrA6QCqaI+d4ieoqcFT3PidTWzPFdXE4bB6/APX1g7Le/FOC7kv7dhmYsipo+QJ7MX
	 j1AcvBwdpKglr5QNK3SqqtNSm8aD1IjZrTXjsDJsaCfsE/2v3cUHBkA/yRR+K5XuYX
	 0phq2bMIqRfjlA5tNUFPCqMCb32aQxjvJloa6W4uSGRd2gWc9tOzZ8ohNmxu56Objf
	 ni5jKk+ZOGu4EBrwPj/DhoM2j6ES5ilYgDHGdP0vblSvXz+nELWk3yMYlZ1nszP89H
	 KMNulVU/wXAnA==
Received: from jupiter.universe (dyndsl-091-248-215-089.ewe-ip-backbone.de [91.248.215.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B2FE17E37BB;
	Wed, 11 Dec 2024 17:59:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7A3CE48CC8B; Wed, 11 Dec 2024 17:59:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
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
Subject: [PATCH v12 1/5] clk: rockchip: support clocks registered late
Date: Wed, 11 Dec 2024 17:58:50 +0100
Message-ID: <20241211165957.94922-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211165957.94922-1-sebastian.reichel@collabora.com>
References: <20241211165957.94922-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When some clocks are registered late and some clocks are registered
early we need to make sure the late registered clocks report probe defer
until the final registration has happened.

But we do not want to keep reporting probe defer after the late
registration has happened. Also not all Rockchip SoCs have late
registered clocks and may not need to report probe defer at all.

This restructures code a bit, so that there is a new function
rockchip_clk_init_early(), which should be used for initializing the CRU
structure on SoCs making use of late initialization in addition to the
early init. These platforms should call rockchip_clk_finalize()
once all clocks have been registered.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 35 +++++++++++++++++++++++++++++++----
 drivers/clk/rockchip/clk.h |  3 +++
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 88629a9abc9c..45214607467e 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -359,14 +359,17 @@ static struct clk *rockchip_clk_register_factor_branch(const char *name,
 	return hw->clk;
 }
 
-struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
-						void __iomem *base,
-						unsigned long nr_clks)
+static struct rockchip_clk_provider *rockchip_clk_init_base(
+		struct device_node *np, void __iomem *base,
+		unsigned long nr_clks, bool has_late_clocks)
 {
 	struct rockchip_clk_provider *ctx;
 	struct clk **clk_table;
+	struct clk *default_clk_val;
 	int i;
 
+	default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
+
 	ctx = kzalloc(sizeof(struct rockchip_clk_provider), GFP_KERNEL);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
@@ -376,7 +379,7 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 		goto err_free;
 
 	for (i = 0; i < nr_clks; ++i)
-		clk_table[i] = ERR_PTR(-ENOENT);
+		clk_table[i] = default_clk_val;
 
 	ctx->reg_base = base;
 	ctx->clk_data.clks = clk_table;
@@ -393,8 +396,32 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 	kfree(ctx);
 	return ERR_PTR(-ENOMEM);
 }
+
+struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
+						void __iomem *base,
+						unsigned long nr_clks)
+{
+	return rockchip_clk_init_base(np, base, nr_clks, false);
+}
 EXPORT_SYMBOL_GPL(rockchip_clk_init);
 
+struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
+						      void __iomem *base,
+						      unsigned long nr_clks)
+{
+	return rockchip_clk_init_base(np, base, nr_clks, true);
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_init_early);
+
+void rockchip_clk_finalize(struct rockchip_clk_provider *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->clk_data.clk_num; ++i)
+		if (ctx->clk_data.clks[i] == ERR_PTR(-EPROBE_DEFER))
+			ctx->clk_data.clks[i] = ERR_PTR(-ENOENT);
+}
+
 void rockchip_clk_of_add_provider(struct device_node *np,
 				  struct rockchip_clk_provider *ctx)
 {
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index f1957e1c1178..4c6e2c931f8e 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -1024,6 +1024,9 @@ struct rockchip_clk_branch {
 
 struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
+struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
+			void __iomem *base, unsigned long nr_clks);
+void rockchip_clk_finalize(struct rockchip_clk_provider *ctx);
 void rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx);
 unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
-- 
2.45.2



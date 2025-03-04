Return-Path: <linux-clk+bounces-18867-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDBA4D0D6
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 02:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7D911893EB5
	for <lists+linux-clk@lfdr.de>; Tue,  4 Mar 2025 01:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C8C16B3A1;
	Tue,  4 Mar 2025 01:30:42 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680A5156C76;
	Tue,  4 Mar 2025 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741051841; cv=none; b=DtE2+zD1hXSWHQjSy4K96S4aWmhTE9L0BOLMpNtOgM0XfRqkiUf2RJz6N9CzzvbEJrdUKNqOgSi9lyZRXyNPQD2qCdGpAq2h2Pqh4oEKNhFZBdf4jWsDnlfgG+KDOfNATM4dWRzuCU5auk/Vq310Q0sW7yn3vVC2wP6vJggek20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741051841; c=relaxed/simple;
	bh=H3WLfqLyDMom31G0c8m8HyHJQZtWnzIWqedH84LJqxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsgGP/eTDr9WMb9oGj5iSJYok78JC5ZJVO9TTWRK4YCAfiorYhZUfqG6YGT5CPrEKGtC4WkWpigtEJawsA0UaiGZnRLkfdZtu9MTt3YpYZ7yUlyW6QyquuzjoBfI9o190d1N4A2pdeF0MGQNVeoMjcr8tUP8QHZwvK6Bb4oCl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 972661BF7;
	Mon,  3 Mar 2025 17:30:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67A43F673;
	Mon,  3 Mar 2025 17:30:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/15] clk: sunxi-ng: Add support for update bit
Date: Tue,  4 Mar 2025 01:27:53 +0000
Message-ID: <20250304012805.28594-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304012805.28594-1-andre.przywara@arm.com>
References: <20250304012805.28594-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some clocks in the Allwinner A523 SoC contain an "update bit" (bit 27),
which must be set to apply any register changes, namely the mux
selector, the divider and the gate bit.

Add a new CCU feature bit to mark those clocks, and set bit 27 whenever
we are applying any changes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_common.h | 4 ++++
 drivers/clk/sunxi-ng/ccu_div.c    | 2 ++
 drivers/clk/sunxi-ng/ccu_gate.c   | 4 ++++
 drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index 50fd268329671..d41d33bdff470 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -20,10 +20,14 @@
 #define CCU_FEATURE_KEY_FIELD		BIT(8)
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
+#define CCU_FEATURE_UPDATE_BIT27	BIT(11)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
 
+/* Some clocks need this bit to actually apply register changes */
+#define CCU_SUNXI_UPDATE_BIT		BIT(27)
+
 struct device_node;
 
 struct ccu_common {
diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 7f4691f09e01f..2d8b98fe4b13a 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -106,6 +106,8 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cd->common.base + cd->common.reg);
 	reg &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
+	if (cd->common.features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 
 	writel(reg | (val << cd->div.shift),
 	       cd->common.base + cd->common.reg);
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index ac52fd6bff677..0490f95781361 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -20,6 +20,8 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	writel(reg & ~gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
@@ -44,6 +46,8 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	writel(reg | gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index d7ffbdeee9e04..82ee21e0d3a68 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -197,6 +197,8 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 	/* The key field always reads as zero. */
 	if (common->features & CCU_FEATURE_KEY_FIELD)
 		reg |= CCU_MUX_KEY_VALUE;
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
-- 
2.46.3



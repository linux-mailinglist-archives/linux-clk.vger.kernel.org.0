Return-Path: <linux-clk+bounces-9896-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DD938EA5
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2024 13:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5270B1F21DFC
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2024 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B479016D336;
	Mon, 22 Jul 2024 11:59:21 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C6168497
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649561; cv=none; b=X2yNjStbjgkRdnv7WXlfWP/MQXEKyo14nj9PDf1GGv1Uv+OIUSzZyKwIM4PGNL+EHZP6x8zh8vnYX1n39YuUF0uJX9EuP+1uVzuGSCxX9V8QnecDbcZ/kapUr51+lPCwaU2nNalcXYiOWfH+0RcN3qi+NeNNu3j74gFv315awMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649561; c=relaxed/simple;
	bh=+JG19WaXuM1gvV0u3zCWqyeu/mIlAQcm0sjNCcUdoVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DtVZJjS5QudS2vsMbgWUD2Ck4/TUXmvFZLoqZrLy7ar1C3RYUCWNlvaEfE5D+iaAAUX2jEpesgq9rzskCGmAhZp1bRKHwLEhfr8d564VG9YF2+5V5W/oe3VR2PtlB8mMElGHiCS5n7deyY01dYenrU1VbhBtf5shPnVGmZZtbb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2hYtz4x1mH
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qbqc2C00X1wvoRx01bqdR8; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAv-CE;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iG-RL;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 11/15] clk: renesas: r8a779g0: Model PLL1/3/4/6 as fractional PLLs
Date: Mon, 22 Jul 2024 13:50:31 +0200
Message-Id: <b98523ed08de7386944c5ae860eae107dc28be3e.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all PLLs but PLL2 are modelled as fixed divider clocks, based
on the state of the mode pins.  However, the boot loader stack may have
changed the actual PLL configuration from the default, leading to
incorrect clock frequencies.

Describe PLL1 as a fixed fractional PLL instead, and PLL2, PLL3, PLL4,
and PLL6 as variable fractional PLLs.

Reformat nearby lines to retain a consistent layout.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index fb67e8724eeb6235..901a86c6432298ed 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -66,13 +66,13 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_INPUT("extalr",	CLK_EXTALR),
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,     CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1,     CLK_MAIN),
-	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2_VAR, CLK_MAIN),
-	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3,     CLK_MAIN),
-	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4,     CLK_MAIN),
-	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,     CLK_MAIN),
-	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6,     CLK_MAIN),
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,	CLK_EXTAL),
+	DEF_GEN4_PLL_F8_25(".pll1", 1,	CLK_PLL1,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll2", 2,	CLK_PLL2,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll3", 3,	CLK_PLL3,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll4", 4,	CLK_PLL4,		CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,	CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll6", 6,	CLK_PLL6,		CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
-- 
2.34.1



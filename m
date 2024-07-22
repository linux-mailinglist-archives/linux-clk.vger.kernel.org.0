Return-Path: <linux-clk+bounces-9890-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E7938E64
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2024 13:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4571C2106C
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2024 11:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D9F16D324;
	Mon, 22 Jul 2024 11:50:49 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899BE16D313
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649049; cv=none; b=k3ZsLC+Y3RZYfhvJ00HOcAkzPZLVSrTzCaqqSVFpXajbZPQ0tS1BI86zkyczee0YGqPl9HhCvPDGAML8waHpuyBspk2VS23zLseKjFBc87kh0+z5qJt3k5o9bkqs6UUhc0fo8fk4VTKoYD68WrV2QP6FBaOU2V6014xAFpJyCeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649049; c=relaxed/simple;
	bh=ViXWlD3eAc8m5Btmv+f22oH0omoNnIZdG5leVxsApOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nMDIsKC4AHn5o96lPJNkaupk2m0uML+9x9AkN2GqhzMZ2cN/OpHDYBkHPhAgN8nbyrDchlSF9500ru6AhUapZQ9BwL3rxkuKgTtCyuD99b5Ma/GMJwayusmwF+pH7H9Is7Yrt1JP9OPK0WEyo1ci0KbowznBkHxlotc+XuWSTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by baptiste.telenet-ops.be with bizsmtp
	id qbqc2C00Q1wvoRx01bqcUE; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAm-9V;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020i8-Pb;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 09/15] clk: renesas: r8a779a0: Use defines for PLL control registers
Date: Mon, 22 Jul 2024 13:50:29 +0200
Message-Id: <8cac464c7dfb15ecd299b8ab4ba88a16135f8123.1721648548.git.geert+renesas@glider.be>
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

Add symbolic definitions for the various PLL control registers.
Replace hardcoded register offsets by the new definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 14042d6dc4dd3e21..e6e2c3c16c8d5bef 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -61,6 +61,11 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define CPG_PLL20CR	0x0834	/* PLL20 Control Register */
+#define CPG_PLL21CR	0x0838	/* PLL21 Control Register */
+#define CPG_PLL30CR	0x083c	/* PLL30 Control Register */
+#define CPG_PLL31CR	0x0840	/* PLL31 Control Register */
+
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -70,10 +75,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
 	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
 	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
-	DEF_PLL(".pll20", CLK_PLL20,	0x0834),
-	DEF_PLL(".pll21", CLK_PLL21,	0x0838),
-	DEF_PLL(".pll30", CLK_PLL30,	0x083c),
-	DEF_PLL(".pll31", CLK_PLL31,	0x0840),
+	DEF_PLL(".pll20", CLK_PLL20,	CPG_PLL20CR),
+	DEF_PLL(".pll21", CLK_PLL21,	CPG_PLL21CR),
+	DEF_PLL(".pll30", CLK_PLL30,	CPG_PLL30CR),
+	DEF_PLL(".pll31", CLK_PLL31,	CPG_PLL31CR),
 
 	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
-- 
2.34.1



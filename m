Return-Path: <linux-clk+bounces-3795-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CB85A67F
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 15:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437F51F211BB
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2F41EA80;
	Mon, 19 Feb 2024 14:54:17 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7937700
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354457; cv=none; b=jXGBXSQt3YS2LTc2Ma23F+M/6+qPsZhWAKfT2Ca9LdKMqDahu32gV0+LPrkpYdTdeh+HtD/surxKBeC87ZJd7s5AYmdE0SDMGEyclGN1ieo0ejgNrMxii5TT+2jQ+FGF3LExjwSwnPZECjRJFSSxsMqh+sPZ+e06Iipf2F22LCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354457; c=relaxed/simple;
	bh=tF4pglNP5nBOlAMGxEoCXi1cGb2jkE3GNB+g4iJEE8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zn+xs7/I/w+xq68Nkg+ckwshnI8OYFBlThkOp0XStCm9bptAfmtY+QSCy4MsngDQKiAkihNTm/4XoQ0DdPPO/+qDNxQlTgIBWPBtKmxQnHvLLuRKEa1AnFJQtDPW/N8rKv6wlABkQunYmAEDWvoYnC+lzbr+AveoxaB4DJFuGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a66f:1f5b:42c8:e3c5])
	by andre.telenet-ops.be with bizsmtp
	id p2uB2B00T1N8lK5012uBwG; Mon, 19 Feb 2024 15:54:12 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc51v-0016fA-SV;
	Mon, 19 Feb 2024 15:54:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc523-007QfY-Jr;
	Mon, 19 Feb 2024 15:54:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add RPC-IF clock
Date: Mon, 19 Feb 2024 15:54:09 +0100
Message-Id: <07a72378ca64b44341af960f042a6efd41d10dc3.1708354355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the SPI Multi I/O Bus Controller (RPC-IF)
on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 92359306dc0df544..71f67a1c86d80f4c 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -184,6 +184,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c1",		519,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
-- 
2.34.1



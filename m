Return-Path: <linux-clk+bounces-4126-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024886728F
	for <lists+linux-clk@lfdr.de>; Mon, 26 Feb 2024 12:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153E3286D30
	for <lists+linux-clk@lfdr.de>; Mon, 26 Feb 2024 11:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4BC13AC5;
	Mon, 26 Feb 2024 11:05:24 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB471CFA8
	for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945524; cv=none; b=YvK1VhNlp+nl7yluOTeyzH8nOw9eUGlAhLtjgaGMIknkUCDAk2zZG3GClg3xhFPzrxTGyFzcV9+L9SpJDRiFAOuKBKUW6IAlJHMHOrUIOjEfJ7DBWcX7mt3vbO8fYby96Xak+pSYI7qgsFdZr6MDor0u5Hyh/sFKzAweSX6amVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945524; c=relaxed/simple;
	bh=yLtQ/+RgVEkDmhivdlgaIQBj90rcXGFslKcpEwaRft4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l7+P76Yz6K2RJP9xIZZ+0TrEVQRMKqjVMHn7YFZgKJuxqOdQLR1iXK8HCdr6CIwrSvZjfjEnVDSxwOXJaX85vXUPefudU6rRG+/l2dmSZWIsuSHTBLlo9sPpG9CeUiXmScIwQBchlzOt8QaNUozI+mPL2WlYzfZQROx/6gQei1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4TjyLg2DkSz4x1PD
	for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 11:59:55 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7662:e968:947d:f3d0])
	by andre.telenet-ops.be with bizsmtp
	id rmzn2B0075Kh3Z501mznLG; Mon, 26 Feb 2024 11:59:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYht-001lUq-KN;
	Mon, 26 Feb 2024 11:59:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYi3-004Euk-2r;
	Mon, 26 Feb 2024 11:59:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: r9a07g043-cpg: Annotate RZ/G2UL-only core clocks
Date: Mon, 26 Feb 2024 11:59:45 +0100
Message-Id: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M2 (CRU main clock), M3 (LCDC Video Clock), and AT (Cortex-A55 Debug
clock) core clocks are only present on RZ/G2UL, not on RZ/Five.

Annotate this in the comments, like is already done for module clocks
and resets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

 include/dt-bindings/clock/r9a07g043-cpg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc73c6f..a64139fec81520bf 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -16,15 +16,15 @@
 #define R9A07G043_CLK_SD0		5
 #define R9A07G043_CLK_SD1		6
 #define R9A07G043_CLK_M0		7
-#define R9A07G043_CLK_M2		8
-#define R9A07G043_CLK_M3		9
+#define R9A07G043_CLK_M2		8	/* RZ/G2UL Only */
+#define R9A07G043_CLK_M3		9	/* RZ/G2UL Only */
 #define R9A07G043_CLK_HP		10
 #define R9A07G043_CLK_TSU		11
 #define R9A07G043_CLK_ZT		12
 #define R9A07G043_CLK_P0		13
 #define R9A07G043_CLK_P1		14
 #define R9A07G043_CLK_P2		15
-#define R9A07G043_CLK_AT		16
+#define R9A07G043_CLK_AT		16	/* RZ/G2UL Only */
 #define R9A07G043_OSCCLK		17
 #define R9A07G043_CLK_P0_DIV2		18
 
-- 
2.34.1



Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A065F27A3E0
	for <lists+linux-clk@lfdr.de>; Sun, 27 Sep 2020 22:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgI0UCf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Sep 2020 16:02:35 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:14485
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726697AbgI0UCd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Sep 2020 16:02:33 -0400
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; 
   d="scan'208";a="360169497"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256; 27 Sep 2020 21:55:13 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/18] clk: mvebu: ap80x-cpu: use semicolons rather than commas to separate statements
Date:   Sun, 27 Sep 2020 21:12:19 +0200
Message-Id: <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/mvebu/ap-cpu-clk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 6b394302c76a..b4259b60dcfd 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -197,7 +197,7 @@ static int ap_cpu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	stable_bit = BIT(clk->pll_regs->ratio_state_offset +
 			 clk->cluster *
-			 clk->pll_regs->ratio_state_cluster_offset),
+			 clk->pll_regs->ratio_state_cluster_offset);
 	ret = regmap_read_poll_timeout(clk->pll_cr_base,
 				       clk->pll_regs->ratio_state_reg, reg,
 				       reg & stable_bit, STATUS_POLL_PERIOD_US,


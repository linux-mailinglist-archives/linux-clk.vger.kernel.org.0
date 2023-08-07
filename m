Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEA9771C8C
	for <lists+linux-clk@lfdr.de>; Mon,  7 Aug 2023 10:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjHGIsB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Aug 2023 04:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjHGIsB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:48:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0621722
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:47:56 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.felsch@pengutronix.de>)
        id 1qSvu0-00036z-9w; Mon, 07 Aug 2023 10:47:48 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        rasmus.villemoes@prevas.dk, adrian.alonso@nxp.com,
        aford173@gmail.com, a.fatoum@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
Date:   Mon,  7 Aug 2023 10:47:44 +0200
Message-Id: <20230807084744.1184791-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807084744.1184791-1-m.felsch@pengutronix.de>
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates"),
the driver has the ability to dynamically compute PLL parameters to
approximate the requested rates. This is not always used, because the
logic is as follows:

  - Check if the target rate is hardcoded in the frequency table
  - Check if varying only kdiv is possible, so switch over is glitch free
  - Compute rate dynamically by iterating over pdiv range

If we skip the frequency table for the 1443x PLL, we find that the
computed values differ to the hardcoded ones. This can be valid if the
hardcoded values guarantee for example an earlier lock-in or if the
divisors are chosen, so that other important rates are more likely to
be reached glitch-free.

For rates (393216000 and 361267200, this doesn't seem to be the case:
They are only approximated by existing parameters (393215995 and
361267196 Hz, respectively) and they aren't reachable glitch-free from
other hardcoded frequencies. Dropping them from the table allows us
to lock-in to these frequencies exactly.

This is immediately noticeable because they are the assigned-clock-rates
for IMX8MN_AUDIO_PLL1 and IMX8MN_AUDIO_PLL2, respectively and a look
into clk_summary so far showed that they were a few Hz short of the target:

imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
audio_pll2_out           0        0        0   361267196 0     0  50000   N
audio_pll1_out           1        1        0   393215995 0     0  50000   Y

and afterwards:

imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
audio_pll2_out           0        0        0   361267200 0     0  50000   N
audio_pll1_out           1        1        0   393216000 0     0  50000   Y

This change is equivalent to adding following hardcoded values:

  /*               rate     mdiv  pdiv  sdiv   kdiv */
  PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
  PLL_1443X_RATE(361267200, 497,   33,    0, -16882),

Fixes: 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting")
Cc: stable@vger.kernel.org # v5.18+
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v2:
- new patch

 drivers/clk/imx/clk-pll14xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index dc6bc21dff41..0d58d85c375e 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -64,8 +64,6 @@ static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
 	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
 	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
-	PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
-	PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),
 };
 
 struct imx_pll14xx_clk imx_1443x_pll = {
-- 
2.39.2


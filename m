Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9A85FD00B
	for <lists+linux-clk@lfdr.de>; Thu, 13 Oct 2022 02:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiJMAYc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Oct 2022 20:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiJMAXs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 20:23:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601F4AC495;
        Wed, 12 Oct 2022 17:22:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8A0B61646;
        Thu, 13 Oct 2022 00:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913ACC4347C;
        Thu, 13 Oct 2022 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620481;
        bh=IAIz3auuKzMB24HYDVw7FfWvbqNMcbnafFAOA3nTfwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u2Jj/nnGM59aR8ImUqGqrMyBlkBivJ0VTPSE3toxgVQZPq68dvyWPntQkNUoY6YKL
         tZ6Axy6igIWRtfyOFuoGJATGxl0skiJpzC3rG7Tf3Y9c0CriGK/sEI6tWt+GfwlDC9
         qFEWMdf8Nc2k1H6hW5fM2+IWRdjCyDrTth4PuKMpdL0zCxwoH/Y1Vi8vv+y0vDek5+
         w4ud4gu7g8Z9YmZuYH5Pl3pUT4MdJVriXHkXKse0J/h16/3L7o2aZdl2axdOpVlicT
         hWmGteV54G/4oC9+6wGA6eC6k7uCk9h+Vdir6U24ykqgDlyVdttKKzm2NEWanNAU8M
         mNiUe9ywQDQ3Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Phil Elwell <phil@raspberrypi.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, mturquette@baylibre.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        maxime@cerno.tech, nsaenz@kernel.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 63/63] clk: bcm2835: Round UART input clock up
Date:   Wed, 12 Oct 2022 20:18:37 -0400
Message-Id: <20221013001842.1893243-63-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov@suse.de>

[ Upstream commit f690a4d7a8f66430662975511c86819dc9965bcc ]

It was reported that RPi3[1] and RPi Zero 2W boards have issues with
the Bluetooth. It turns out that when switching from initial to
operation speed host and device no longer can talk each other because
host uses incorrect UART baud rate.

The UART driver used in this case is amba-pl011. Original fix, see
below Github link[2], was inside pl011 module, but somehow it didn't
look as the right place to fix. Beside that this original rounding
function is not exactly perfect for all possible clock values. So I
deiced to move the hack to the platform which actually need it.

The UART clock is initialised to be as close to the requested
frequency as possible without exceeding it. Now that there is a
clock manager that returns the actual frequencies, an expected
48MHz clock is reported as 47999625. If the requested baud rate
== requested clock/16, there is no headroom and the slight
reduction in actual clock rate results in failure.

If increasing a clock by less than 0.1% changes it from ..999..
to ..000.., round it up.

[1] https://bugzilla.suse.com/show_bug.cgi?id=1188238
[2] https://github.com/raspberrypi/linux/commit/ab3f1b39537f6d3825b8873006fbe2fc5ff057b7

Cc: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Link: https://lore.kernel.org/r/20220912081306.24662-1-iivanov@suse.de
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 19de0e83b65d..3f2ce20d27ec 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -30,6 +30,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -502,6 +503,8 @@ struct bcm2835_clock_data {
 	bool low_jitter;
 
 	u32 tcnt_mux;
+
+	bool round_up;
 };
 
 struct bcm2835_gate_data {
@@ -993,12 +996,34 @@ static long bcm2835_clock_rate_from_divisor(struct bcm2835_clock *clock,
 	return temp;
 }
 
+static unsigned long bcm2835_round_rate(unsigned long rate)
+{
+	unsigned long scaler;
+	unsigned long limit;
+
+	limit = rate / 100000;
+
+	scaler = 1;
+	while (scaler < limit)
+		scaler *= 10;
+
+	/*
+	 * If increasing a clock by less than 0.1% changes it
+	 * from ..999.. to ..000.., round up.
+	 */
+	if ((rate + scaler - 1) / scaler % 1000 == 0)
+		rate = roundup(rate, scaler);
+
+	return rate;
+}
+
 static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
 {
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	struct bcm2835_cprman *cprman = clock->cprman;
 	const struct bcm2835_clock_data *data = clock->data;
+	unsigned long rate;
 	u32 div;
 
 	if (data->int_bits == 0 && data->frac_bits == 0)
@@ -1006,7 +1031,12 @@ static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
 
 	div = cprman_read(cprman, data->div_reg);
 
-	return bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
+	rate = bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
+
+	if (data->round_up)
+		rate = bcm2835_round_rate(rate);
+
+	return rate;
 }
 
 static void bcm2835_clock_wait_busy(struct bcm2835_clock *clock)
@@ -2143,7 +2173,8 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.div_reg = CM_UARTDIV,
 		.int_bits = 10,
 		.frac_bits = 12,
-		.tcnt_mux = 28),
+		.tcnt_mux = 28,
+		.round_up = true),
 
 	/* TV encoder clock.  Only operating frequency is 108Mhz.  */
 	[BCM2835_CLOCK_VEC]	= REGISTER_PER_CLK(
-- 
2.35.1


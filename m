Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C30B2EBFA4
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jan 2021 15:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbhAFOd7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jan 2021 09:33:59 -0500
Received: from foss.arm.com ([217.140.110.172]:41754 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbhAFOd7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Jan 2021 09:33:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECCCED6E;
        Wed,  6 Jan 2021 06:33:13 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 851693F719;
        Wed,  6 Jan 2021 06:33:12 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Subject: [PATCH] clk: sunxi-ng: h6: Fix CEC clock
Date:   Wed,  6 Jan 2021 14:32:46 +0000
Message-Id: <20210106143246.11255-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CEC clock on the H6 SoC is a bit special, since it uses a fixed
pre-dividier for one source clock (the PLL), but conveys the other clock
(32K OSC) directly.
We are using a fixed predivider array for that, but fail to use the right
flag to actually activate that.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Reported-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index f2497d0a4683..a26dbbdff80d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -682,7 +682,7 @@ static struct ccu_mux hdmi_cec_clk = {
 
 	.common		= {
 		.reg		= 0xb10,
-		.features	= CCU_FEATURE_VARIABLE_PREDIV,
+		.features	= CCU_FEATURE_FIXED_PREDIV,
 		.hw.init	= CLK_HW_INIT_PARENTS("hdmi-cec",
 						      hdmi_cec_parents,
 						      &ccu_mux_ops,
-- 
2.17.5


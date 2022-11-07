Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B950F61E80B
	for <lists+linux-clk@lfdr.de>; Mon,  7 Nov 2022 01:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiKGA4O (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 6 Nov 2022 19:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiKGA4M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 19:56:12 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA295A448;
        Sun,  6 Nov 2022 16:56:11 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BF723A;
        Sun,  6 Nov 2022 16:56:17 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CE03F703;
        Sun,  6 Nov 2022 16:56:09 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH v2 04/10] clk: sunxi-ng: f1c100s: Add IR mod clock
Date:   Mon,  7 Nov 2022 00:54:27 +0000
Message-Id: <20221107005433.11079-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For some reason the mod clock for the Allwinner F1C100s CIR (infrared
receiver) peripheral was not modeled in the CCU driver.

Add the clock description to the list, and wire it up in the clock list.
By assigning a new clock ID at the end, it extends the number of clocks.

This allows to use the CIR peripheral on any F1C100s series board.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
index ed097c4f780f..0d5b60b123b7 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
@@ -239,7 +239,14 @@ static SUNXI_CCU_MUX_WITH_GATE(i2s_clk, "i2s", i2s_spdif_parents,
 static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif", i2s_spdif_parents,
 			       0x0b4, 16, 2, BIT(31), 0);
 
-/* The BSP header file has a CIR_CFG, but no mod clock uses this definition */
+static const char * const ir_parents[] = { "osc32k", "osc24M" };
+static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
+				  ir_parents, 0x0b8,
+				  0, 4,		/* M */
+				  16, 2,	/* P */
+				  24, 2,        /* mux */
+				  BIT(31),      /* gate */
+				  0);
 
 static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
 		      0x0cc, BIT(1), 0);
@@ -355,6 +362,7 @@ static struct ccu_common *suniv_ccu_clks[] = {
 	&mmc1_output_clk.common,
 	&i2s_clk.common,
 	&spdif_clk.common,
+	&ir_clk.common,
 	&usb_phy0_clk.common,
 	&dram_ve_clk.common,
 	&dram_csi_clk.common,
@@ -446,6 +454,7 @@ static struct clk_hw_onecell_data suniv_hw_clks = {
 		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
 		[CLK_I2S]		= &i2s_clk.common.hw,
 		[CLK_SPDIF]		= &spdif_clk.common.hw,
+		[CLK_IR]		= &ir_clk.common.hw,
 		[CLK_USB_PHY0]		= &usb_phy0_clk.common.hw,
 		[CLK_DRAM_VE]		= &dram_ve_clk.common.hw,
 		[CLK_DRAM_CSI]		= &dram_csi_clk.common.hw,
diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
index b22484f1bb9a..d56a4316289d 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
@@ -29,6 +29,6 @@
 
 /* All bus gates, DRAM gates and mod clocks are exported */
 
-#define CLK_NUMBER		(CLK_AVS + 1)
+#define CLK_NUMBER		(CLK_IR + 1)
 
 #endif /* _CCU_SUNIV_F1C100S_H_ */
diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
index f5ac155c9c70..d7570765f424 100644
--- a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
+++ b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
@@ -67,4 +67,6 @@
 #define CLK_CODEC		65
 #define CLK_AVS			66
 
+#define CLK_IR			67
+
 #endif
-- 
2.35.5


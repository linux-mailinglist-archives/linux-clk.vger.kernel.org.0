Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0AB24F00
	for <lists+linux-clk@lfdr.de>; Tue, 21 May 2019 14:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfEUMfp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 08:35:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12593 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726448AbfEUMfo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 08:35:44 -0400
X-IronPort-AV: E=Sophos;i="5.60,495,1549897200"; 
   d="scan'208";a="16575733"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 May 2019 21:35:39 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown [10.226.37.56])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C353F4002650;
        Tue, 21 May 2019 21:35:36 +0900 (JST)
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: renesas: r9a06g032: Add clock domain support
Date:   Tue, 21 May 2019 13:35:11 +0100
Message-Id: <1558442111-10599-1-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are several clocks on the r9ag032 which are currently not enabled
in their drivers that can be delegated to clock domain system for power
management. Therefore add support for clock domain functionality to the
r9a06g032 clock driver.

Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
---
v2:
 - Rebased onto kernel/git/geert/renesas-drivers.git
---
 drivers/clk/renesas/r9a06g032-clocks.c | 243 ++++++++++++++++++++++++---------
 1 file changed, 176 insertions(+), 67 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 97c7247..2e580dd 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -16,6 +16,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/r9a06g032-sysctrl.h>
@@ -28,6 +30,7 @@ struct r9a06g032_gate {
 /* This is used to describe a clock for instantiation */
 struct r9a06g032_clkdesc {
 	const char *name;
+	bool managed;
 	uint32_t type: 3;
 	uint32_t index: 8;
 	uint32_t source : 8; /* source index + 1 (0 == none) */
@@ -60,7 +63,11 @@ struct r9a06g032_clkdesc {
 #define D_GATE(_idx, _n, _src, ...) \
 	{ .type = K_GATE, .index = R9A06G032_##_idx, \
 		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.gate = I_GATE(__VA_ARGS__), }
+		.managed = 0, .gate = I_GATE(__VA_ARGS__) }
+#define D_MODULE(_idx, _n, _src, ...) \
+	{ .type = K_GATE, .index = R9A06G032_##_idx, \
+		.source = 1 + R9A06G032_##_src, .name = _n, \
+		.managed = 1, .gate = I_GATE(__VA_ARGS__) }
 #define D_ROOT(_idx, _n, _mul, _div) \
 	{ .type = K_FFC, .index = R9A06G032_##_idx, .name = _n, \
 		.div = _div, .mul = _mul }
@@ -170,7 +177,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
 	D_GATE(CLK_P6_PG2, "clk_p6_pg2", DIV_P6_PG, 0x8a3, 0x8a4, 0x8a5, 0, 0xb61, 0, 0),
 	D_GATE(CLK_P6_PG3, "clk_p6_pg3", DIV_P6_PG, 0x8a6, 0x8a7, 0x8a8, 0, 0xb62, 0, 0),
 	D_GATE(CLK_P6_PG4, "clk_p6_pg4", DIV_P6_PG, 0x8a9, 0x8aa, 0x8ab, 0, 0xb63, 0, 0),
-	D_GATE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, 0xe6, 0, 0, 0, 0, 0, 0),
+	D_MODULE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, 0xe6, 0, 0, 0, 0, 0, 0),
 	D_GATE(CLK_QSPI0, "clk_qspi0", DIV_QSPI0, 0x2a4, 0x2a5, 0, 0, 0, 0, 0),
 	D_GATE(CLK_QSPI1, "clk_qspi1", DIV_QSPI1, 0x484, 0x485, 0, 0, 0, 0, 0),
 	D_GATE(CLK_RGMII_REF, "clk_rgmii_ref", CLKOUT_D8, 0x340, 0, 0, 0, 0, 0, 0),
@@ -187,17 +194,17 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
 	D_GATE(CLK_SPI5, "clk_spi5", DIV_P4_PG, 0x822, 0x823, 0, 0, 0, 0, 0),
 	D_GATE(CLK_SWITCH, "clk_switch", DIV_SWITCH, 0x982, 0x983, 0, 0, 0, 0, 0),
 	D_DIV(DIV_MOTOR, "div_motor", CLKOUT_D5, 84, 2, 8),
-	D_GATE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, 0x400, 0x401, 0, 0x402, 0, 0x440, 0x441),
-	D_GATE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, 0x740, 0x741, 0x742, 0, 0xae0, 0, 0),
-	D_GATE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, 0x420, 0x422, 0, 0x421, 0, 0x460, 0x461),
-	D_GATE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, 0x8c3, 0x8c4, 0x8c5, 0, 0xb41, 0, 0),
-	D_GATE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, 0x8c6, 0x8c7, 0x8c8, 0, 0xb42, 0, 0),
-	D_GATE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, 0x8c9, 0x8ca, 0x8cb, 0, 0xb43, 0, 0),
-	D_GATE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, 0x743, 0x744, 0x745, 0, 0xae1, 0, 0),
-	D_GATE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, 0x746, 0x747, 0x748, 0, 0xae2, 0, 0),
-	D_GATE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, 0xe3, 0, 0, 0xe4, 0, 0x102, 0x103),
-	D_GATE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, 0xe0, 0xe1, 0, 0xe2, 0, 0x100, 0x101),
-	D_GATE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, 0xe5, 0, 0, 0, 0, 0, 0),
+	D_MODULE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, 0x400, 0x401, 0, 0x402, 0, 0x440, 0x441),
+	D_MODULE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, 0x740, 0x741, 0x742, 0, 0xae0, 0, 0),
+	D_MODULE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, 0x420, 0x422, 0, 0x421, 0, 0x460, 0x461),
+	D_MODULE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, 0x8c3, 0x8c4, 0x8c5, 0, 0xb41, 0, 0),
+	D_MODULE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, 0x8c6, 0x8c7, 0x8c8, 0, 0xb42, 0, 0),
+	D_MODULE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, 0x8c9, 0x8ca, 0x8cb, 0, 0xb43, 0, 0),
+	D_MODULE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, 0x743, 0x744, 0x745, 0, 0xae1, 0, 0),
+	D_MODULE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, 0x746, 0x747, 0x748, 0, 0xae2, 0, 0),
+	D_MODULE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, 0xe3, 0, 0, 0xe4, 0, 0x102, 0x103),
+	D_MODULE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, 0xe0, 0xe1, 0, 0xe2, 0, 0x100, 0x101),
+	D_MODULE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, 0xe5, 0, 0, 0, 0, 0, 0),
 	D_GATE(CLK_48_PG_F, "clk_48_pg_f", CLK_48, 0x78c, 0x78d, 0, 0x78e, 0, 0xb04, 0xb05),
 	D_GATE(CLK_48_PG4, "clk_48_pg4", CLK_48, 0x789, 0x78a, 0x78b, 0, 0xb03, 0, 0),
 	D_FFC(CLK_DDRPHY_PLLCLK_D4, "clk_ddrphy_pllclk_d4", CLK_DDRPHY_PLLCLK, 4),
@@ -207,13 +214,13 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
 	D_FFC(CLK_REF_SYNC_D8, "clk_ref_sync_d8", CLK_REF_SYNC, 8),
 	D_FFC(CLK_SERCOS100_D2, "clk_sercos100_d2", CLK_SERCOS100, 2),
 	D_DIV(DIV_CA7, "div_ca7", CLK_REF_SYNC, 57, 1, 4, 1, 2, 4),
-	D_GATE(HCLK_CAN0, "hclk_can0", CLK_48, 0x783, 0x784, 0x785, 0, 0xb01, 0, 0),
-	D_GATE(HCLK_CAN1, "hclk_can1", CLK_48, 0x786, 0x787, 0x788, 0, 0xb02, 0, 0),
-	D_GATE(HCLK_DELTASIGMA, "hclk_deltasigma", DIV_MOTOR, 0x1ef, 0x1f0, 0x1f1, 0, 0, 0, 0),
-	D_GATE(HCLK_PWMPTO, "hclk_pwmpto", DIV_MOTOR, 0x1ec, 0x1ed, 0x1ee, 0, 0, 0, 0),
-	D_GATE(HCLK_RSV, "hclk_rsv", CLK_48, 0x780, 0x781, 0x782, 0, 0xb00, 0, 0),
-	D_GATE(HCLK_SGPIO0, "hclk_sgpio0", DIV_MOTOR, 0x1e0, 0x1e1, 0x1e2, 0, 0, 0, 0),
-	D_GATE(HCLK_SGPIO1, "hclk_sgpio1", DIV_MOTOR, 0x1e3, 0x1e4, 0x1e5, 0, 0, 0, 0),
+	D_MODULE(HCLK_CAN0, "hclk_can0", CLK_48, 0x783, 0x784, 0x785, 0, 0xb01, 0, 0),
+	D_MODULE(HCLK_CAN1, "hclk_can1", CLK_48, 0x786, 0x787, 0x788, 0, 0xb02, 0, 0),
+	D_MODULE(HCLK_DELTASIGMA, "hclk_deltasigma", DIV_MOTOR, 0x1ef, 0x1f0, 0x1f1, 0, 0, 0, 0),
+	D_MODULE(HCLK_PWMPTO, "hclk_pwmpto", DIV_MOTOR, 0x1ec, 0x1ed, 0x1ee, 0, 0, 0, 0),
+	D_MODULE(HCLK_RSV, "hclk_rsv", CLK_48, 0x780, 0x781, 0x782, 0, 0xb00, 0, 0),
+	D_MODULE(HCLK_SGPIO0, "hclk_sgpio0", DIV_MOTOR, 0x1e0, 0x1e1, 0x1e2, 0, 0, 0, 0),
+	D_MODULE(HCLK_SGPIO1, "hclk_sgpio1", DIV_MOTOR, 0x1e3, 0x1e4, 0x1e5, 0, 0, 0, 0),
 	D_DIV(RTOS_MDC, "rtos_mdc", CLK_REF_SYNC, 100, 80, 640, 80, 160, 320, 640),
 	D_GATE(CLK_CM3, "clk_cm3", CLK_REF_SYNC_D4, 0xba0, 0xba1, 0, 0xba2, 0, 0xbc0, 0xbc1),
 	D_GATE(CLK_DDRC, "clk_ddrc", CLK_DDRPHY_PLLCLK_D4, 0x323, 0x324, 0, 0, 0, 0, 0),
@@ -221,53 +228,53 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] __initconst = {
 	D_GATE(CLK_HSR50, "clk_hsr50", CLK_HSR100_D2, 0x484, 0x485, 0, 0, 0, 0, 0),
 	D_GATE(CLK_HW_RTOS, "clk_hw_rtos", CLK_REF_SYNC_D4, 0xc60, 0xc61, 0, 0, 0, 0, 0),
 	D_GATE(CLK_SERCOS50, "clk_sercos50", CLK_SERCOS100_D2, 0x424, 0x423, 0, 0, 0, 0, 0),
-	D_GATE(HCLK_ADC, "hclk_adc", CLK_REF_SYNC_D8, 0x1af, 0x1b0, 0x1b1, 0, 0, 0, 0),
-	D_GATE(HCLK_CM3, "hclk_cm3", CLK_REF_SYNC_D4, 0xc20, 0xc21, 0xc22, 0, 0, 0, 0),
-	D_GATE(HCLK_CRYPTO_EIP150, "hclk_crypto_eip150", CLK_REF_SYNC_D4, 0x123, 0x124, 0x125, 0, 0x142, 0, 0),
-	D_GATE(HCLK_CRYPTO_EIP93, "hclk_crypto_eip93", CLK_REF_SYNC_D4, 0x120, 0x121, 0, 0x122, 0, 0x140, 0x141),
-	D_GATE(HCLK_DDRC, "hclk_ddrc", CLK_REF_SYNC_D4, 0x320, 0x322, 0, 0x321, 0, 0x3a0, 0x3a1),
-	D_GATE(HCLK_DMA0, "hclk_dma0", CLK_REF_SYNC_D4, 0x260, 0x261, 0x262, 0x263, 0x2c0, 0x2c1, 0x2c2),
-	D_GATE(HCLK_DMA1, "hclk_dma1", CLK_REF_SYNC_D4, 0x264, 0x265, 0x266, 0x267, 0x2c3, 0x2c4, 0x2c5),
-	D_GATE(HCLK_GMAC0, "hclk_gmac0", CLK_REF_SYNC_D4, 0x360, 0x361, 0x362, 0x363, 0x3c0, 0x3c1, 0x3c2),
-	D_GATE(HCLK_GMAC1, "hclk_gmac1", CLK_REF_SYNC_D4, 0x380, 0x381, 0x382, 0x383, 0x3e0, 0x3e1, 0x3e2),
-	D_GATE(HCLK_GPIO0, "hclk_gpio0", CLK_REF_SYNC_D4, 0x212, 0x213, 0x214, 0, 0, 0, 0),
-	D_GATE(HCLK_GPIO1, "hclk_gpio1", CLK_REF_SYNC_D4, 0x215, 0x216, 0x217, 0, 0, 0, 0),
-	D_GATE(HCLK_GPIO2, "hclk_gpio2", CLK_REF_SYNC_D4, 0x229, 0x22a, 0x22b, 0, 0, 0, 0),
-	D_GATE(HCLK_HSR, "hclk_hsr", CLK_HSR100_D2, 0x480, 0x482, 0, 0x481, 0, 0x4c0, 0x4c1),
-	D_GATE(HCLK_I2C0, "hclk_i2c0", CLK_REF_SYNC_D8, 0x1a9, 0x1aa, 0x1ab, 0, 0, 0, 0),
-	D_GATE(HCLK_I2C1, "hclk_i2c1", CLK_REF_SYNC_D8, 0x1ac, 0x1ad, 0x1ae, 0, 0, 0, 0),
-	D_GATE(HCLK_LCD, "hclk_lcd", CLK_REF_SYNC_D4, 0x7a0, 0x7a1, 0x7a2, 0, 0xb20, 0, 0),
-	D_GATE(HCLK_MSEBI_M, "hclk_msebi_m", CLK_REF_SYNC_D4, 0x164, 0x165, 0x166, 0, 0x183, 0, 0),
-	D_GATE(HCLK_MSEBI_S, "hclk_msebi_s", CLK_REF_SYNC_D4, 0x160, 0x161, 0x162, 0x163, 0x180, 0x181, 0x182),
-	D_GATE(HCLK_NAND, "hclk_nand", CLK_REF_SYNC_D4, 0x280, 0x281, 0x282, 0x283, 0x2e0, 0x2e1, 0x2e2),
-	D_GATE(HCLK_PG_I, "hclk_pg_i", CLK_REF_SYNC_D4, 0x7ac, 0x7ad, 0, 0x7ae, 0, 0xb24, 0xb25),
-	D_GATE(HCLK_PG19, "hclk_pg19", CLK_REF_SYNC_D4, 0x22c, 0x22d, 0x22e, 0, 0, 0, 0),
-	D_GATE(HCLK_PG20, "hclk_pg20", CLK_REF_SYNC_D4, 0x22f, 0x230, 0x231, 0, 0, 0, 0),
-	D_GATE(HCLK_PG3, "hclk_pg3", CLK_REF_SYNC_D4, 0x7a6, 0x7a7, 0x7a8, 0, 0xb22, 0, 0),
-	D_GATE(HCLK_PG4, "hclk_pg4", CLK_REF_SYNC_D4, 0x7a9, 0x7aa, 0x7ab, 0, 0xb23, 0, 0),
-	D_GATE(HCLK_QSPI0, "hclk_qspi0", CLK_REF_SYNC_D4, 0x2a0, 0x2a1, 0x2a2, 0x2a3, 0x300, 0x301, 0x302),
-	D_GATE(HCLK_QSPI1, "hclk_qspi1", CLK_REF_SYNC_D4, 0x480, 0x481, 0x482, 0x483, 0x4c0, 0x4c1, 0x4c2),
-	D_GATE(HCLK_ROM, "hclk_rom", CLK_REF_SYNC_D4, 0xaa0, 0xaa1, 0xaa2, 0, 0xb80, 0, 0),
-	D_GATE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, 0xa00, 0, 0, 0, 0, 0, 0),
-	D_GATE(HCLK_SDIO0, "hclk_sdio0", CLK_REF_SYNC_D4, 0x60, 0x61, 0x62, 0x63, 0x80, 0x81, 0x82),
-	D_GATE(HCLK_SDIO1, "hclk_sdio1", CLK_REF_SYNC_D4, 0x640, 0x641, 0x642, 0x643, 0x660, 0x661, 0x662),
-	D_GATE(HCLK_SEMAP, "hclk_semap", CLK_REF_SYNC_D4, 0x7a3, 0x7a4, 0x7a5, 0, 0xb21, 0, 0),
-	D_GATE(HCLK_SPI0, "hclk_spi0", CLK_REF_SYNC_D4, 0x200, 0x201, 0x202, 0, 0, 0, 0),
-	D_GATE(HCLK_SPI1, "hclk_spi1", CLK_REF_SYNC_D4, 0x203, 0x204, 0x205, 0, 0, 0, 0),
-	D_GATE(HCLK_SPI2, "hclk_spi2", CLK_REF_SYNC_D4, 0x206, 0x207, 0x208, 0, 0, 0, 0),
-	D_GATE(HCLK_SPI3, "hclk_spi3", CLK_REF_SYNC_D4, 0x209, 0x20a, 0x20b, 0, 0, 0, 0),
-	D_GATE(HCLK_SPI4, "hclk_spi4", CLK_REF_SYNC_D4, 0x20c, 0x20d, 0x20e, 0, 0, 0, 0),
-	D_GATE(HCLK_SPI5, "hclk_spi5", CLK_REF_SYNC_D4, 0x20f, 0x210, 0x211, 0, 0, 0, 0),
-	D_GATE(HCLK_SWITCH, "hclk_switch", CLK_REF_SYNC_D4, 0x980, 0, 0x981, 0, 0, 0, 0),
-	D_GATE(HCLK_SWITCH_RG, "hclk_switch_rg", CLK_REF_SYNC_D4, 0xc40, 0xc41, 0xc42, 0, 0, 0, 0),
-	D_GATE(HCLK_UART0, "hclk_uart0", CLK_REF_SYNC_D8, 0x1a0, 0x1a1, 0x1a2, 0, 0, 0, 0),
-	D_GATE(HCLK_UART1, "hclk_uart1", CLK_REF_SYNC_D8, 0x1a3, 0x1a4, 0x1a5, 0, 0, 0, 0),
-	D_GATE(HCLK_UART2, "hclk_uart2", CLK_REF_SYNC_D8, 0x1a6, 0x1a7, 0x1a8, 0, 0, 0, 0),
-	D_GATE(HCLK_UART3, "hclk_uart3", CLK_REF_SYNC_D4, 0x218, 0x219, 0x21a, 0, 0, 0, 0),
-	D_GATE(HCLK_UART4, "hclk_uart4", CLK_REF_SYNC_D4, 0x21b, 0x21c, 0x21d, 0, 0, 0, 0),
-	D_GATE(HCLK_UART5, "hclk_uart5", CLK_REF_SYNC_D4, 0x220, 0x221, 0x222, 0, 0, 0, 0),
-	D_GATE(HCLK_UART6, "hclk_uart6", CLK_REF_SYNC_D4, 0x223, 0x224, 0x225, 0, 0, 0, 0),
-	D_GATE(HCLK_UART7, "hclk_uart7", CLK_REF_SYNC_D4, 0x226, 0x227, 0x228, 0, 0, 0, 0),
+	D_MODULE(HCLK_ADC, "hclk_adc", CLK_REF_SYNC_D8, 0x1af, 0x1b0, 0x1b1, 0, 0, 0, 0),
+	D_MODULE(HCLK_CM3, "hclk_cm3", CLK_REF_SYNC_D4, 0xc20, 0xc21, 0xc22, 0, 0, 0, 0),
+	D_MODULE(HCLK_CRYPTO_EIP150, "hclk_crypto_eip150", CLK_REF_SYNC_D4, 0x123, 0x124, 0x125, 0, 0x142, 0, 0),
+	D_MODULE(HCLK_CRYPTO_EIP93, "hclk_crypto_eip93", CLK_REF_SYNC_D4, 0x120, 0x121, 0, 0x122, 0, 0x140, 0x141),
+	D_MODULE(HCLK_DDRC, "hclk_ddrc", CLK_REF_SYNC_D4, 0x320, 0x322, 0, 0x321, 0, 0x3a0, 0x3a1),
+	D_MODULE(HCLK_DMA0, "hclk_dma0", CLK_REF_SYNC_D4, 0x260, 0x261, 0x262, 0x263, 0x2c0, 0x2c1, 0x2c2),
+	D_MODULE(HCLK_DMA1, "hclk_dma1", CLK_REF_SYNC_D4, 0x264, 0x265, 0x266, 0x267, 0x2c3, 0x2c4, 0x2c5),
+	D_MODULE(HCLK_GMAC0, "hclk_gmac0", CLK_REF_SYNC_D4, 0x360, 0x361, 0x362, 0x363, 0x3c0, 0x3c1, 0x3c2),
+	D_MODULE(HCLK_GMAC1, "hclk_gmac1", CLK_REF_SYNC_D4, 0x380, 0x381, 0x382, 0x383, 0x3e0, 0x3e1, 0x3e2),
+	D_MODULE(HCLK_GPIO0, "hclk_gpio0", CLK_REF_SYNC_D4, 0x212, 0x213, 0x214, 0, 0, 0, 0),
+	D_MODULE(HCLK_GPIO1, "hclk_gpio1", CLK_REF_SYNC_D4, 0x215, 0x216, 0x217, 0, 0, 0, 0),
+	D_MODULE(HCLK_GPIO2, "hclk_gpio2", CLK_REF_SYNC_D4, 0x229, 0x22a, 0x22b, 0, 0, 0, 0),
+	D_MODULE(HCLK_HSR, "hclk_hsr", CLK_HSR100_D2, 0x480, 0x482, 0, 0x481, 0, 0x4c0, 0x4c1),
+	D_MODULE(HCLK_I2C0, "hclk_i2c0", CLK_REF_SYNC_D8, 0x1a9, 0x1aa, 0x1ab, 0, 0, 0, 0),
+	D_MODULE(HCLK_I2C1, "hclk_i2c1", CLK_REF_SYNC_D8, 0x1ac, 0x1ad, 0x1ae, 0, 0, 0, 0),
+	D_MODULE(HCLK_LCD, "hclk_lcd", CLK_REF_SYNC_D4, 0x7a0, 0x7a1, 0x7a2, 0, 0xb20, 0, 0),
+	D_MODULE(HCLK_MSEBI_M, "hclk_msebi_m", CLK_REF_SYNC_D4, 0x164, 0x165, 0x166, 0, 0x183, 0, 0),
+	D_MODULE(HCLK_MSEBI_S, "hclk_msebi_s", CLK_REF_SYNC_D4, 0x160, 0x161, 0x162, 0x163, 0x180, 0x181, 0x182),
+	D_MODULE(HCLK_NAND, "hclk_nand", CLK_REF_SYNC_D4, 0x280, 0x281, 0x282, 0x283, 0x2e0, 0x2e1, 0x2e2),
+	D_MODULE(HCLK_PG_I, "hclk_pg_i", CLK_REF_SYNC_D4, 0x7ac, 0x7ad, 0, 0x7ae, 0, 0xb24, 0xb25),
+	D_MODULE(HCLK_PG19, "hclk_pg19", CLK_REF_SYNC_D4, 0x22c, 0x22d, 0x22e, 0, 0, 0, 0),
+	D_MODULE(HCLK_PG20, "hclk_pg20", CLK_REF_SYNC_D4, 0x22f, 0x230, 0x231, 0, 0, 0, 0),
+	D_MODULE(HCLK_PG3, "hclk_pg3", CLK_REF_SYNC_D4, 0x7a6, 0x7a7, 0x7a8, 0, 0xb22, 0, 0),
+	D_MODULE(HCLK_PG4, "hclk_pg4", CLK_REF_SYNC_D4, 0x7a9, 0x7aa, 0x7ab, 0, 0xb23, 0, 0),
+	D_MODULE(HCLK_QSPI0, "hclk_qspi0", CLK_REF_SYNC_D4, 0x2a0, 0x2a1, 0x2a2, 0x2a3, 0x300, 0x301, 0x302),
+	D_MODULE(HCLK_QSPI1, "hclk_qspi1", CLK_REF_SYNC_D4, 0x480, 0x481, 0x482, 0x483, 0x4c0, 0x4c1, 0x4c2),
+	D_MODULE(HCLK_ROM, "hclk_rom", CLK_REF_SYNC_D4, 0xaa0, 0xaa1, 0xaa2, 0, 0xb80, 0, 0),
+	D_MODULE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, 0xa00, 0, 0, 0, 0, 0, 0),
+	D_MODULE(HCLK_SDIO0, "hclk_sdio0", CLK_REF_SYNC_D4, 0x60, 0x61, 0x62, 0x63, 0x80, 0x81, 0x82),
+	D_MODULE(HCLK_SDIO1, "hclk_sdio1", CLK_REF_SYNC_D4, 0x640, 0x641, 0x642, 0x643, 0x660, 0x661, 0x662),
+	D_MODULE(HCLK_SEMAP, "hclk_semap", CLK_REF_SYNC_D4, 0x7a3, 0x7a4, 0x7a5, 0, 0xb21, 0, 0),
+	D_MODULE(HCLK_SPI0, "hclk_spi0", CLK_REF_SYNC_D4, 0x200, 0x201, 0x202, 0, 0, 0, 0),
+	D_MODULE(HCLK_SPI1, "hclk_spi1", CLK_REF_SYNC_D4, 0x203, 0x204, 0x205, 0, 0, 0, 0),
+	D_MODULE(HCLK_SPI2, "hclk_spi2", CLK_REF_SYNC_D4, 0x206, 0x207, 0x208, 0, 0, 0, 0),
+	D_MODULE(HCLK_SPI3, "hclk_spi3", CLK_REF_SYNC_D4, 0x209, 0x20a, 0x20b, 0, 0, 0, 0),
+	D_MODULE(HCLK_SPI4, "hclk_spi4", CLK_REF_SYNC_D4, 0x20c, 0x20d, 0x20e, 0, 0, 0, 0),
+	D_MODULE(HCLK_SPI5, "hclk_spi5", CLK_REF_SYNC_D4, 0x20f, 0x210, 0x211, 0, 0, 0, 0),
+	D_MODULE(HCLK_SWITCH, "hclk_switch", CLK_REF_SYNC_D4, 0x980, 0, 0x981, 0, 0, 0, 0),
+	D_MODULE(HCLK_SWITCH_RG, "hclk_switch_rg", CLK_REF_SYNC_D4, 0xc40, 0xc41, 0xc42, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART0, "hclk_uart0", CLK_REF_SYNC_D8, 0x1a0, 0x1a1, 0x1a2, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART1, "hclk_uart1", CLK_REF_SYNC_D8, 0x1a3, 0x1a4, 0x1a5, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART2, "hclk_uart2", CLK_REF_SYNC_D8, 0x1a6, 0x1a7, 0x1a8, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART3, "hclk_uart3", CLK_REF_SYNC_D4, 0x218, 0x219, 0x21a, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART4, "hclk_uart4", CLK_REF_SYNC_D4, 0x21b, 0x21c, 0x21d, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART5, "hclk_uart5", CLK_REF_SYNC_D4, 0x220, 0x221, 0x222, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART6, "hclk_uart6", CLK_REF_SYNC_D4, 0x223, 0x224, 0x225, 0, 0, 0, 0),
+	D_MODULE(HCLK_UART7, "hclk_uart7", CLK_REF_SYNC_D4, 0x226, 0x227, 0x228, 0, 0, 0, 0),
 	/*
 	 * These are not hardware clocks, but are needed to handle the special
 	 * case where we have a 'selector bit' that doesn't just change the
@@ -344,6 +351,104 @@ struct r9a06g032_clk_gate {
 
 #define to_r9a06g032_gate(_hw) container_of(_hw, struct r9a06g032_clk_gate, hw)
 
+struct r9a06g032_clk_domain {
+	struct generic_pm_domain genpd;
+	struct device_node *np;
+};
+
+static struct r9a06g032_clk_domain *r9a06g032_clk_domain;
+
+static int create_add_module_clock(struct of_phandle_args *clkspec,
+				   struct device *dev)
+{
+	struct clk *clk;
+	int error = 0;
+
+	clk = of_clk_get_from_provider(clkspec);
+
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	error = pm_clk_create(dev);
+	if (error) {
+		dev_err(dev, "pm_clk_create failed %d\n", error);
+		clk_put(clk);
+		return error;
+	}
+
+	error = pm_clk_add_clk(dev, clk);
+	if (error) {
+		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
+		pm_clk_destroy(dev);
+		clk_put(clk);
+	}
+
+	return error;
+}
+
+int __init r9a06g032_attach_dev(struct generic_pm_domain *unused,
+				struct device *dev)
+{
+	struct r9a06g032_clk_domain *pd = r9a06g032_clk_domain;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	int i = 0;
+	int error;
+
+	if (!pd) {
+		dev_dbg(dev, "RZN1 clock domain not yet available\n");
+		return -EPROBE_DEFER;
+	}
+
+	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
+					   &clkspec)) {
+		int index = clkspec.args[0];
+
+		if (index < R9A06G032_CLOCK_COUNT &&
+		    r9a06g032_clocks[index].managed) {
+			error = create_add_module_clock(&clkspec, dev);
+
+			if (error)
+				return error;
+
+			of_node_put(clkspec.np);
+		}
+		i++;
+	}
+
+	return 0;
+}
+
+void r9a06g032_detach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
+static int __init r9a06g032_add_clk_domain(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *genpd;
+	struct r9a06g032_clk_domain *pd;
+
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	pd->np = np;
+
+	genpd = &pd->genpd;
+	genpd->name = np->name;
+	genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
+	genpd->attach_dev = r9a06g032_attach_dev;
+	genpd->detach_dev = r9a06g032_detach_dev;
+	pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	r9a06g032_clk_domain = pd;
+
+	of_genpd_add_provider_simple(np, genpd);
+	return 0;
+}
+
 static void
 r9a06g032_clk_gate_set(struct r9a06g032_priv *clocks,
 		       struct r9a06g032_gate *g, int on)
@@ -870,6 +975,10 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = r9a06g032_add_clk_domain(dev);
+	if (error)
+		return error;
+
 	return devm_add_action_or_reset(dev,
 					r9a06g032_clocks_del_clk_provider, np);
 }
-- 
2.7.4


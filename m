Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB147423C0C
	for <lists+linux-clk@lfdr.de>; Wed,  6 Oct 2021 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238260AbhJFLLQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Oct 2021 07:11:16 -0400
Received: from mx.socionext.com ([202.248.49.38]:1102 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238180AbhJFLLK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Oct 2021 07:11:10 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 06 Oct 2021 20:09:16 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id AA1AC2059034;
        Wed,  6 Oct 2021 20:09:16 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Wed, 6 Oct 2021 20:09:16 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 3CC71AB192;
        Wed,  6 Oct 2021 20:09:16 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 3/5] clk: uniphier: Add NX1 clock support
Date:   Wed,  6 Oct 2021 20:09:13 +0900
Message-Id: <1633518555-8195-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633518555-8195-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633518555-8195-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add basic clock data for UniPhier NX1 SoC.
This includes PLL and clock division data for cpufreq support.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/clk/uniphier/clk-uniphier-core.c | 12 ++++++++++++
 drivers/clk/uniphier/clk-uniphier-sys.c  | 28 ++++++++++++++++++++++++++++
 drivers/clk/uniphier/clk-uniphier.h      |  5 +++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 12380236d7ab..0a947e757d13 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -132,6 +132,10 @@ static const struct of_device_id uniphier_clk_match[] = {
 		.compatible = "socionext,uniphier-pxs3-clock",
 		.data = uniphier_pxs3_sys_clk_data,
 	},
+	{
+		.compatible = "socionext,uniphier-nx1-clock",
+		.data = uniphier_nx1_sys_clk_data,
+	},
 	/* Media I/O clock, SD clock */
 	{
 		.compatible = "socionext,uniphier-ld4-mio-clock",
@@ -165,6 +169,10 @@ static const struct of_device_id uniphier_clk_match[] = {
 		.compatible = "socionext,uniphier-pxs3-sd-clock",
 		.data = uniphier_pro5_sd_clk_data,
 	},
+	{
+		.compatible = "socionext,uniphier-nx1-sd-clock",
+		.data = uniphier_pro5_sd_clk_data,
+	},
 	/* Peripheral clock */
 	{
 		.compatible = "socionext,uniphier-ld4-peri-clock",
@@ -198,6 +206,10 @@ static const struct of_device_id uniphier_clk_match[] = {
 		.compatible = "socionext,uniphier-pxs3-peri-clock",
 		.data = uniphier_pro4_peri_clk_data,
 	},
+	{
+		.compatible = "socionext,uniphier-nx1-peri-clock",
+		.data = uniphier_pro4_peri_clk_data,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/uniphier/clk-uniphier-sys.c b/drivers/clk/uniphier/clk-uniphier-sys.c
index 0ec28ebc39c2..e8bf85cd2d30 100644
--- a/drivers/clk/uniphier/clk-uniphier-sys.c
+++ b/drivers/clk/uniphier/clk-uniphier-sys.c
@@ -20,6 +20,10 @@
 	UNIPHIER_CLK_FACTOR("sd-200m", -1, "spll", 1, 10),		\
 	UNIPHIER_CLK_FACTOR("sd-133m", -1, "spll", 1, 15)
 
+#define UNIPHIER_NX1_SYS_CLK_SD						\
+	UNIPHIER_CLK_FACTOR("sd-200m", -1, "spll", 1, 4),		\
+	UNIPHIER_CLK_FACTOR("sd-133m", -1, "spll", 1, 6)
+
 #define UNIPHIER_LD4_SYS_CLK_NAND(idx)					\
 	UNIPHIER_CLK_FACTOR("nand-50m", -1, "spll", 1, 32),		\
 	UNIPHIER_CLK_GATE("nand", (idx), "nand-50m", 0x2104, 2)
@@ -302,3 +306,27 @@ const struct uniphier_clk_data uniphier_pxs3_sys_clk_data[] = {
 			     "spll/4", "spll/8", "s2pll/4", "s2pll/8"),
 	{ /* sentinel */ }
 };
+
+const struct uniphier_clk_data uniphier_nx1_sys_clk_data[] = {
+	UNIPHIER_CLK_FACTOR("cpll", -1, "ref", 100, 1),		/* ARM: 2500 MHz */
+	UNIPHIER_CLK_FACTOR("spll", -1, "ref", 32, 1),		/* 800 MHz */
+	UNIPHIER_CLK_FACTOR("uart", 0, "spll", 1, 6),
+	UNIPHIER_CLK_FACTOR("i2c", 1, "spll", 1, 16),
+	UNIPHIER_NX1_SYS_CLK_SD,
+	UNIPHIER_CLK_GATE("emmc", 4, NULL, 0x2108, 8),
+	UNIPHIER_CLK_GATE("ether", 6, NULL, 0x210c, 0),
+	UNIPHIER_CLK_GATE("usb30-0", 12, NULL, 0x210c, 16),	/* =GIO */
+	UNIPHIER_CLK_GATE("usb30-1", 13, NULL, 0x210c, 20),	/* =GIO1P */
+	UNIPHIER_CLK_GATE("usb30-hsphy0", 16, NULL, 0x210c, 24),
+	UNIPHIER_CLK_GATE("usb30-ssphy0", 17, NULL, 0x210c, 25),
+	UNIPHIER_CLK_GATE("usb30-ssphy1", 18, NULL, 0x210c, 26),
+	UNIPHIER_CLK_GATE("pcie", 24, NULL, 0x210c, 8),
+	UNIPHIER_CLK_GATE("voc", 52, NULL, 0x2110, 0),
+	UNIPHIER_CLK_GATE("hdmitx", 58, NULL, 0x2110, 8),
+	/* CPU gears */
+	UNIPHIER_CLK_DIV5("cpll", 2, 4, 8, 16, 32),
+	UNIPHIER_CLK_CPUGEAR("cpu-ca53", 33, 0x8080, 0xf, 5,
+			     "cpll/2", "cpll/4", "cpll/8", "cpll/16",
+			     "cpll/32"),
+	{ /* sentinel */ }
+};
diff --git a/drivers/clk/uniphier/clk-uniphier.h b/drivers/clk/uniphier/clk-uniphier.h
index 9e30362e55e1..c54fb7895889 100644
--- a/drivers/clk/uniphier/clk-uniphier.h
+++ b/drivers/clk/uniphier/clk-uniphier.h
@@ -119,6 +119,10 @@ struct uniphier_clk_data {
 	UNIPHIER_CLK_DIV2(parent, div0, div1),			\
 	UNIPHIER_CLK_DIV2(parent, div2, div3)
 
+#define UNIPHIER_CLK_DIV5(parent, div0, div1, div2, div3, div4)	\
+	UNIPHIER_CLK_DIV4(parent, div0, div1, div2, div3),	\
+	UNIPHIER_CLK_DIV(parent, div4)
+
 struct clk_hw *uniphier_clk_register_cpugear(struct device *dev,
 					     struct regmap *regmap,
 					     const char *name,
@@ -146,6 +150,7 @@ extern const struct uniphier_clk_data uniphier_pxs2_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld11_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld20_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_pxs3_sys_clk_data[];
+extern const struct uniphier_clk_data uniphier_nx1_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld4_mio_clk_data[];
 extern const struct uniphier_clk_data uniphier_pro5_sd_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld4_peri_clk_data[];
-- 
2.7.4


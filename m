Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3A04568AA
	for <lists+linux-clk@lfdr.de>; Fri, 19 Nov 2021 04:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233695AbhKSDgv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Nov 2021 22:36:51 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39105 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233669AbhKSDgu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Nov 2021 22:36:50 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 48FAA3201C35;
        Thu, 18 Nov 2021 22:33:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 18 Nov 2021 22:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=YwrkWaojiFtrP
        anohQvO2D+P753pgj28dlCEBJYVO0o=; b=TGy+moLv/z6ryLNJr8XkliQXX9qeB
        XklDgNmREkhJtlBYH0UZ0BhRUKAuNXxzpTA4MVCQ/SLRHsYdhLZEK/2tHilRqY1B
        kWPm76MA1U3OQXllNKfW03O8GykLmN6PShOvT/fMDiUYt0R2O+D2845ylNBFycET
        g9JJ7/opv6qmNznIbQqcHb9DcSOLw5AnbRtKpJVOUTZV1Y++b7nz2rzPc6yofslJ
        ZK3Hr2EEqIfZPOxK8cYId93R5EX6aIQXt7BQlrer6ahYzsV2iZsZMTC3lqaOCbv0
        Vol5eH8dUtGT072UQB7SMrLLL+Rm6MA38s2+gHw9essipQC4GBP0Rj9uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=YwrkWaojiFtrPanohQvO2D+P753pgj28dlCEBJYVO0o=; b=XXrQh05I
        u+jwVW7+RhhAAT9Gx3qa65orI3HnYiHH+x3WZw/cO+Tw+nEzPcpNLX62jJU5XpVn
        PiWpnkm6iqWsKeVYsWIz1omF4wlh8E4M6f40YYfa1dEyJl7i9LW5/B2XZvumZYk+
        5jxbZ65JpmXf/yEHJQHKHW8vMVLH57jgvaBS3AzNC4Lup8ykMhM7qRYd5xvbh1SS
        leAnh6XV3u6KN1jxdWgZgRHGsMBNBB2zM/VLyB0O1cdOca0ECfXPDfmZzp75P3Ls
        B0HP5UQ8/f0NeZkI2WU1cU9bEDNb6RS5cgE4oqMPIrBz3rGIc4Kf538+CBOLaOA8
        GKUkhAdjhJmVdw==
X-ME-Sender: <xms:GxuXYYLNipAz-IoyGr1iyaphS0HchKdb5uB93ijxMzFX-XHqd56PjQ>
    <xme:GxuXYYJoircL0_Vv99cpeWgBl02ur21rGhAW5Wv3DCrZA1Rk58DcaBnfeFQcbldqL
    2NCLbKG_zgq8K-yoQ>
X-ME-Received: <xmr:GxuXYYujC4uwdOhRugptiAt3DVcoJZwnjXXvR4FA-bUlMQHT3B_7kfyFuLn1M0YewcWaxlfS4puJ3Yz-K2rxp6kuoHJX5reVq2_j0P0lgxsnbgNRQnUQfDiEj7eig_to_zb-Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:GxuXYVbw6jvs1fGZyPpFr0Jjvb31hSw_9S3m-8Umt4hUXzGkSW1JjQ>
    <xmx:GxuXYfZcgfZHUsQyxjoRC9SlbNzbv1a0PGwDWFMI33iLFY7sR7B-NA>
    <xmx:GxuXYRA1SLa6l-gyauqtIcNmX1PntBKLJEOPA2whPnZJVi8MfCSWJg>
    <xmx:GxuXYdOE5tdNpmp9jE_k2TXx4CXtqsD3JxqQoEucUQX64AA3MGmxkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 22:33:47 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 3/4] clk: sunxi-ng: Convert early providers to platform drivers
Date:   Thu, 18 Nov 2021 21:33:36 -0600
Message-Id: <20211119033338.25486-4-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119033338.25486-1-samuel@sholland.org>
References: <20211119033338.25486-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PRCM CCU drivers depend on clocks provided by other CCU drivers. For
example, the sun8i-r-ccu driver uses the "pll-periph" clock provided by
the SoC's main CCU.

However, sun8i-r-ccu is an early OF clock provider, and many of the
main CCUs (e.g. sun50i-a64-ccu) use platform drivers. This means that
the consumer clocks will be orphaned until the supplier driver is bound.
This can be avoided by converting the remaining CCUs to use platform
drivers. Then fw_devlink will ensure the drivers are bound in the
optimal order.

The sun5i CCU is the only one which actually needs to be an early clock
provider, because it provides the clock for the system timer. That one
is left alone.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/clk/sunxi-ng/Kconfig             | 20 ++++----
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c     | 58 +++++++++++++--------
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   | 56 ++++++++++++--------
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c   | 33 ++++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c     | 40 +++++++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c     | 35 +++++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c     | 40 +++++++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c      | 62 ++++++++++++++--------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c       | 65 ++++++++++++++----------
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     | 57 +++++++++++++--------
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c | 38 ++++++++++----
 11 files changed, 332 insertions(+), 172 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index c004ffc10ef7..de88b6e0ec69 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -8,7 +8,7 @@ config SUNXI_CCU
 if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
-	bool "Support for the Allwinner newer F1C100s CCU"
+	tristate "Support for the Allwinner newer F1C100s CCU"
 	default MACH_SUNIV
 	depends on MACH_SUNIV || COMPILE_TEST
 
@@ -33,17 +33,17 @@ config SUN50I_H6_CCU
 	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
 
 config SUN50I_H616_CCU
-	bool "Support for the Allwinner H616 CCU"
+	tristate "Support for the Allwinner H616 CCU"
 	default ARM64 && ARCH_SUNXI
 	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
-	bool "Support for the Allwinner H6 and H616 PRCM CCU"
+	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
 	default ARM64 && ARCH_SUNXI
 	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
 
 config SUN4I_A10_CCU
-	bool "Support for the Allwinner A10/A20 CCU"
+	tristate "Support for the Allwinner A10/A20 CCU"
 	default MACH_SUN4I
 	default MACH_SUN7I
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
@@ -54,17 +54,17 @@ config SUN5I_CCU
 	depends on MACH_SUN5I || COMPILE_TEST
 
 config SUN6I_A31_CCU
-	bool "Support for the Allwinner A31/A31s CCU"
+	tristate "Support for the Allwinner A31/A31s CCU"
 	default MACH_SUN6I
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN8I_A23_CCU
-	bool "Support for the Allwinner A23 CCU"
+	tristate "Support for the Allwinner A23 CCU"
 	default MACH_SUN8I
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
-	bool "Support for the Allwinner A33 CCU"
+	tristate "Support for the Allwinner A33 CCU"
 	default MACH_SUN8I
 	depends on MACH_SUN8I || COMPILE_TEST
 
@@ -74,12 +74,12 @@ config SUN8I_A83T_CCU
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
-	bool "Support for the Allwinner H3 CCU"
+	tristate "Support for the Allwinner H3 CCU"
 	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
 	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
 
 config SUN8I_V3S_CCU
-	bool "Support for the Allwinner V3s CCU"
+	tristate "Support for the Allwinner V3s CCU"
 	default MACH_SUN8I
 	depends on MACH_SUN8I || COMPILE_TEST
 
@@ -98,7 +98,7 @@ config SUN9I_A80_CCU
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
-	bool "Support for Allwinner SoCs' PRCM CCUs"
+	tristate "Support for Allwinner SoCs' PRCM CCUs"
 	default MACH_SUN8I || (ARCH_SUNXI && ARM64)
 
 endif
diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
index bd9a8782fec3..c19828f1aa0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
@@ -7,7 +7,9 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -1425,18 +1427,19 @@ static const struct sunxi_ccu_desc sun7i_a20_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sunxi_a10_a20_ccu_resets),
 };
 
-static void __init sun4i_ccu_init(struct device_node *node,
-				  const struct sunxi_ccu_desc *desc)
+static int sun4i_a10_ccu_probe(struct platform_device *pdev)
 {
+	const struct sunxi_ccu_desc *desc;
 	void __iomem *reg;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%s: Could not map the clock registers\n",
-		       of_node_full_name(node));
-		return;
-	}
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	val = readl(reg + SUN4I_PLL_AUDIO_REG);
 
@@ -1464,19 +1467,30 @@ static void __init sun4i_ccu_init(struct device_node *node,
 	val &= ~GENMASK(7, 6);
 	writel(val | (2 << 6), reg + SUN4I_AHB_REG);
 
-	of_sunxi_ccu_probe(node, reg, desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
 
-static void __init sun4i_a10_ccu_setup(struct device_node *node)
-{
-	sun4i_ccu_init(node, &sun4i_a10_ccu_desc);
-}
-CLK_OF_DECLARE(sun4i_a10_ccu, "allwinner,sun4i-a10-ccu",
-	       sun4i_a10_ccu_setup);
+static const struct of_device_id sun4i_a10_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun4i-a10-ccu",
+		.data = &sun4i_a10_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun7i-a20-ccu",
+		.data = &sun7i_a20_ccu_desc,
+	},
+	{ }
+};
 
-static void __init sun7i_a20_ccu_setup(struct device_node *node)
-{
-	sun4i_ccu_init(node, &sun7i_a20_ccu_desc);
-}
-CLK_OF_DECLARE(sun7i_a20_ccu, "allwinner,sun7i-a20-ccu",
-	       sun7i_a20_ccu_setup);
+static struct platform_driver sun4i_a10_ccu_driver = {
+	.probe	= sun4i_a10_ccu_probe,
+	.driver	= {
+		.name			= "sun4i-a10-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun4i_a10_ccu_ids,
+	},
+};
+module_platform_driver(sun4i_a10_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
index f30d7eb5424d..712e103382d8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
@@ -4,7 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "ccu_common.h"
@@ -221,30 +222,43 @@ static const struct sunxi_ccu_desc sun50i_h616_r_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_r_ccu_resets),
 };
 
-static void __init sunxi_r_ccu_init(struct device_node *node,
-				    const struct sunxi_ccu_desc *desc)
+static int sun50i_h6_r_ccu_probe(struct platform_device *pdev)
 {
+	const struct sunxi_ccu_desc *desc;
 	void __iomem *reg;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
 
-	of_sunxi_ccu_probe(node, reg, desc);
-}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
-static void __init sun50i_h6_r_ccu_setup(struct device_node *node)
-{
-	sunxi_r_ccu_init(node, &sun50i_h6_r_ccu_desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
-CLK_OF_DECLARE(sun50i_h6_r_ccu, "allwinner,sun50i-h6-r-ccu",
-	       sun50i_h6_r_ccu_setup);
 
-static void __init sun50i_h616_r_ccu_setup(struct device_node *node)
-{
-	sunxi_r_ccu_init(node, &sun50i_h616_r_ccu_desc);
-}
-CLK_OF_DECLARE(sun50i_h616_r_ccu, "allwinner,sun50i-h616-r-ccu",
-	       sun50i_h616_r_ccu_setup);
+static const struct of_device_id sun50i_h6_r_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun50i-h6-r-ccu",
+		.data = &sun50i_h6_r_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun50i-h616-r-ccu",
+		.data = &sun50i_h616_r_ccu_desc,
+	},
+	{ }
+};
+
+static struct platform_driver sun50i_h6_r_ccu_driver = {
+	.probe	= sun50i_h6_r_ccu_probe,
+	.driver	= {
+		.name			= "sun50i-h6-r-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun50i_h6_r_ccu_ids,
+	},
+};
+module_platform_driver(sun50i_h6_r_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 22eb18079a15..49a2474cf314 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 
 #include "ccu_common.h"
@@ -1082,17 +1082,15 @@ static const u32 usb2_clk_regs[] = {
 	SUN50I_H616_USB3_CLK_REG,
 };
 
-static void __init sun50i_h616_ccu_setup(struct device_node *node)
+static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
 	u32 val;
 	int i;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map clock registers\n", node);
-		return;
-	}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Enable the lock bits and the output enable bits on all PLLs */
 	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
@@ -1141,8 +1139,23 @@ static void __init sun50i_h616_ccu_setup(struct device_node *node)
 	val |= BIT(24);
 	writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
 
-	of_sunxi_ccu_probe(node, reg, &sun50i_h616_ccu_desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
 }
 
-CLK_OF_DECLARE(sun50i_h616_ccu, "allwinner,sun50i-h616-ccu",
-	       sun50i_h616_ccu_setup);
+static const struct of_device_id sun50i_h616_ccu_ids[] = {
+	{ .compatible = "allwinner,sun50i-h616-ccu" },
+	{ }
+};
+
+static struct platform_driver sun50i_h616_ccu_driver = {
+	.probe	= sun50i_h616_ccu_probe,
+	.driver	= {
+		.name			= "sun50i-h616-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun50i_h616_ccu_ids,
+	},
+};
+module_platform_driver(sun50i_h616_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
index 3df5c0b41580..0762deffb33c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
@@ -9,7 +9,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -1226,16 +1227,15 @@ static struct ccu_mux_nb sun6i_a31_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
-static void __init sun6i_a31_ccu_setup(struct device_node *node)
+static int sun6i_a31_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
+	int ret;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 1 */
 	val = readl(reg + SUN6I_A31_PLL_AUDIO_REG);
@@ -1257,10 +1257,30 @@ static void __init sun6i_a31_ccu_setup(struct device_node *node)
 	val |= 0x3 << 12;
 	writel(val, reg + SUN6I_A31_AHB1_REG);
 
-	of_sunxi_ccu_probe(node, reg, &sun6i_a31_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun6i_a31_ccu_desc);
+	if (ret)
+		return ret;
 
 	ccu_mux_notifier_register(pll_cpu_clk.common.hw.clk,
 				  &sun6i_a31_cpu_nb);
+
+	return 0;
 }
-CLK_OF_DECLARE(sun6i_a31_ccu, "allwinner,sun6i-a31-ccu",
-	       sun6i_a31_ccu_setup);
+
+static const struct of_device_id sun6i_a31_ccu_ids[] = {
+	{ .compatible = "allwinner,sun6i-a31-ccu" },
+	{ }
+};
+
+static struct platform_driver sun6i_a31_ccu_driver = {
+	.probe	= sun6i_a31_ccu_probe,
+	.driver	= {
+		.name			= "sun6i-a31-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun6i_a31_ccu_ids,
+	},
+};
+module_platform_driver(sun6i_a31_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
index 577bb235d658..e80cc3864e44 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
@@ -5,7 +5,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -724,16 +725,14 @@ static const struct sunxi_ccu_desc sun8i_a23_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun8i_a23_ccu_resets),
 };
 
-static void __init sun8i_a23_ccu_setup(struct device_node *node)
+static int sun8i_a23_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 1 */
 	val = readl(reg + SUN8I_A23_PLL_AUDIO_REG);
@@ -745,7 +744,23 @@ static void __init sun8i_a23_ccu_setup(struct device_node *node)
 	val &= ~BIT(16);
 	writel(val, reg + SUN8I_A23_PLL_MIPI_REG);
 
-	of_sunxi_ccu_probe(node, reg, &sun8i_a23_ccu_desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun8i_a23_ccu_desc);
 }
-CLK_OF_DECLARE(sun8i_a23_ccu, "allwinner,sun8i-a23-ccu",
-	       sun8i_a23_ccu_setup);
+
+static const struct of_device_id sun8i_a23_ccu_ids[] = {
+	{ .compatible = "allwinner,sun8i-a23-ccu" },
+	{ }
+};
+
+static struct platform_driver sun8i_a23_ccu_driver = {
+	.probe	= sun8i_a23_ccu_probe,
+	.driver	= {
+		.name			= "sun8i-a23-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_a23_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_a23_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 8f65cd03f5ac..d12878a1ba9e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -5,7 +5,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -784,16 +785,15 @@ static struct ccu_mux_nb sun8i_a33_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
-static void __init sun8i_a33_ccu_setup(struct device_node *node)
+static int sun8i_a33_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
+	int ret;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 1 */
 	val = readl(reg + SUN8I_A33_PLL_AUDIO_REG);
@@ -805,7 +805,9 @@ static void __init sun8i_a33_ccu_setup(struct device_node *node)
 	val &= ~BIT(16);
 	writel(val, reg + SUN8I_A33_PLL_MIPI_REG);
 
-	of_sunxi_ccu_probe(node, reg, &sun8i_a33_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun8i_a33_ccu_desc);
+	if (ret)
+		return ret;
 
 	/* Gate then ungate PLL CPU after any rate changes */
 	ccu_pll_notifier_register(&sun8i_a33_pll_cpu_nb);
@@ -813,6 +815,24 @@ static void __init sun8i_a33_ccu_setup(struct device_node *node)
 	/* Reparent CPU during PLL CPU rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun8i_a33_cpu_nb);
+
+	return 0;
 }
-CLK_OF_DECLARE(sun8i_a33_ccu, "allwinner,sun8i-a33-ccu",
-	       sun8i_a33_ccu_setup);
+
+static const struct of_device_id sun8i_a33_ccu_ids[] = {
+	{ .compatible = "allwinner,sun8i-a33-ccu" },
+	{ }
+};
+
+static struct platform_driver sun8i_a33_ccu_driver = {
+	.probe	= sun8i_a33_ccu_probe,
+	.driver	= {
+		.name			= "sun8i-a33-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_a33_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_a33_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index d2fc2903787d..e058cf691aea 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -5,7 +5,9 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -1137,24 +1139,29 @@ static struct ccu_mux_nb sun8i_h3_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
-static void __init sunxi_h3_h5_ccu_init(struct device_node *node,
-					const struct sunxi_ccu_desc *desc)
+static int sun8i_h3_ccu_probe(struct platform_device *pdev)
 {
+	const struct sunxi_ccu_desc *desc;
 	void __iomem *reg;
+	int ret;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 1 */
 	val = readl(reg + SUN8I_H3_PLL_AUDIO_REG);
 	val &= ~GENMASK(19, 16);
 	writel(val | (0 << 16), reg + SUN8I_H3_PLL_AUDIO_REG);
 
-	of_sunxi_ccu_probe(node, reg, desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
+	if (ret)
+		return ret;
 
 	/* Gate then ungate PLL CPU after any rate changes */
 	ccu_pll_notifier_register(&sun8i_h3_pll_cpu_nb);
@@ -1162,18 +1169,31 @@ static void __init sunxi_h3_h5_ccu_init(struct device_node *node,
 	/* Reparent CPU during PLL CPU rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun8i_h3_cpu_nb);
-}
 
-static void __init sun8i_h3_ccu_setup(struct device_node *node)
-{
-	sunxi_h3_h5_ccu_init(node, &sun8i_h3_ccu_desc);
+	return 0;
 }
-CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
-	       sun8i_h3_ccu_setup);
 
-static void __init sun50i_h5_ccu_setup(struct device_node *node)
-{
-	sunxi_h3_h5_ccu_init(node, &sun50i_h5_ccu_desc);
-}
-CLK_OF_DECLARE(sun50i_h5_ccu, "allwinner,sun50i-h5-ccu",
-	       sun50i_h5_ccu_setup);
+static const struct of_device_id sun8i_h3_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun8i-h3-ccu",
+		.data = &sun8i_h3_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun50i-h5-ccu",
+		.data = &sun50i_h5_ccu_desc,
+	},
+	{ }
+};
+
+static struct platform_driver sun8i_h3_ccu_driver = {
+	.probe	= sun8i_h3_ccu_probe,
+	.driver	= {
+		.name			= "sun8i-h3-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_h3_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_h3_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
index 9e754d1f754a..5b7fab832a52 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
@@ -4,7 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "ccu_common.h"
@@ -254,37 +255,47 @@ static const struct sunxi_ccu_desc sun50i_a64_r_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_a64_r_ccu_resets),
 };
 
-static void __init sunxi_r_ccu_init(struct device_node *node,
-				    const struct sunxi_ccu_desc *desc)
+static int sun8i_r_ccu_probe(struct platform_device *pdev)
 {
+	const struct sunxi_ccu_desc *desc;
 	void __iomem *reg;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
 
-	of_sunxi_ccu_probe(node, reg, desc);
-}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
-static void __init sun8i_a83t_r_ccu_setup(struct device_node *node)
-{
-	sunxi_r_ccu_init(node, &sun8i_a83t_r_ccu_desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
-CLK_OF_DECLARE(sun8i_a83t_r_ccu, "allwinner,sun8i-a83t-r-ccu",
-	       sun8i_a83t_r_ccu_setup);
 
-static void __init sun8i_h3_r_ccu_setup(struct device_node *node)
-{
-	sunxi_r_ccu_init(node, &sun8i_h3_r_ccu_desc);
-}
-CLK_OF_DECLARE(sun8i_h3_r_ccu, "allwinner,sun8i-h3-r-ccu",
-	       sun8i_h3_r_ccu_setup);
+static const struct of_device_id sun8i_r_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun8i-a83t-r-ccu",
+		.data = &sun8i_a83t_r_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun8i-h3-r-ccu",
+		.data = &sun8i_h3_r_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun50i-a64-r-ccu",
+		.data = &sun50i_a64_r_ccu_desc,
+	},
+	{ }
+};
 
-static void __init sun50i_a64_r_ccu_setup(struct device_node *node)
-{
-	sunxi_r_ccu_init(node, &sun50i_a64_r_ccu_desc);
-}
-CLK_OF_DECLARE(sun50i_a64_r_ccu, "allwinner,sun50i-a64-r-ccu",
-	       sun50i_a64_r_ccu_setup);
+static struct platform_driver sun8i_r_ccu_driver = {
+	.probe	= sun8i_r_ccu_probe,
+	.driver	= {
+		.name			= "sun8i-r-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_r_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_r_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index ce150f83ab54..87f87d6ea3ad 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -8,7 +8,9 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -805,38 +807,49 @@ static const struct sunxi_ccu_desc sun8i_v3_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun8i_v3_ccu_resets),
 };
 
-static void __init sun8i_v3_v3s_ccu_init(struct device_node *node,
-					 const struct sunxi_ccu_desc *ccu_desc)
+static int sun8i_v3s_ccu_probe(struct platform_device *pdev)
 {
+	const struct sunxi_ccu_desc *desc;
 	void __iomem *reg;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 1 */
 	val = readl(reg + SUN8I_V3S_PLL_AUDIO_REG);
 	val &= ~GENMASK(19, 16);
 	writel(val, reg + SUN8I_V3S_PLL_AUDIO_REG);
 
-	of_sunxi_ccu_probe(node, reg, ccu_desc);
-}
-
-static void __init sun8i_v3s_ccu_setup(struct device_node *node)
-{
-	sun8i_v3_v3s_ccu_init(node, &sun8i_v3s_ccu_desc);
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
 
-static void __init sun8i_v3_ccu_setup(struct device_node *node)
-{
-	sun8i_v3_v3s_ccu_init(node, &sun8i_v3_ccu_desc);
-}
+static const struct of_device_id sun8i_v3s_ccu_ids[] = {
+	{
+		.compatible = "allwinner,sun8i-v3-ccu",
+		.data = &sun8i_v3_ccu_desc,
+	},
+	{
+		.compatible = "allwinner,sun8i-v3s-ccu",
+		.data = &sun8i_v3s_ccu_desc,
+	},
+	{ }
+};
 
-CLK_OF_DECLARE(sun8i_v3s_ccu, "allwinner,sun8i-v3s-ccu",
-	       sun8i_v3s_ccu_setup);
+static struct platform_driver sun8i_v3s_ccu_driver = {
+	.probe	= sun8i_v3s_ccu_probe,
+	.driver	= {
+		.name			= "sun8i-v3s-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun8i_v3s_ccu_ids,
+	},
+};
+module_platform_driver(sun8i_v3s_ccu_driver);
 
-CLK_OF_DECLARE(sun8i_v3_ccu, "allwinner,sun8i-v3-ccu",
-	       sun8i_v3_ccu_setup);
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
index 61ad7ee91c11..a36dcab517e3 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
@@ -6,7 +6,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -525,20 +526,21 @@ static struct ccu_mux_nb suniv_cpu_nb = {
 static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
 {
 	void __iomem *reg;
+	int ret;
 	u32 val;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%pOF: Could not map the clock registers\n", node);
-		return;
-	}
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 4 */
 	val = readl(reg + SUNIV_PLL_AUDIO_REG);
 	val &= ~GENMASK(19, 16);
 	writel(val | (3 << 16), reg + SUNIV_PLL_AUDIO_REG);
 
-	of_sunxi_ccu_probe(node, reg, &suniv_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &suniv_ccu_desc);
+	if (ret)
+		return ret;
 
 	/* Gate then ungate PLL CPU after any rate changes */
 	ccu_pll_notifier_register(&suniv_pll_cpu_nb);
@@ -546,6 +548,24 @@ static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
 	/* Reparent CPU during PLL CPU rate changes */
 	ccu_mux_notifier_register(pll_cpu_clk.common.hw.clk,
 				  &suniv_cpu_nb);
+
+	return 0;
 }
-CLK_OF_DECLARE(suniv_f1c100s_ccu, "allwinner,suniv-f1c100s-ccu",
-	       suniv_f1c100s_ccu_setup);
+
+static const struct of_device_id suniv_f1c100s_ccu_ids[] = {
+	{ .compatible = "allwinner,suniv-f1c100s-ccu" },
+	{ }
+};
+
+static struct platform_driver suniv_f1c100s_ccu_driver = {
+	.probe	= suniv_f1c100s_ccu_probe,
+	.driver	= {
+		.name			= "suniv-f1c100s-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= suniv_f1c100s_ccu_ids,
+	},
+};
+module_platform_driver(suniv_f1c100s_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
-- 
2.32.0


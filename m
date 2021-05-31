Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAAB1396736
	for <lists+linux-clk@lfdr.de>; Mon, 31 May 2021 19:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhEaRiF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 May 2021 13:38:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233338AbhEaRhl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 31 May 2021 13:37:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FA3861260;
        Mon, 31 May 2021 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622482561;
        bh=jtSsetYmuEjt3QS3BhhUr2hzb3iSK9CaEzvTKPx1+No=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DkY5oHg79+r5yz+bI7yK6g/7998xH1DjdPTw/XY4l1R2KuoPf3Kew4n3asOmzyBYa
         +eC069/JPpPEe3mpKzaN0nKt9uFb/VsgrB0egjAHfp300j53mksWejJQ/WrGYhJ4JS
         IrOUaY0RxYZaDmqRCuPV6GrpsgsDSVyTPkKw7RlKzoPTBorlHmdQ1Lmu5NtmqhG6Rq
         qmN+6k8Ipxj10rJYisBFR8jPPj7KuzOQyFNC1ktb2ItfmJW/WABj5esfv5ryBe7T8Q
         +hczh3fKx/1EkBSC+j8CI3WbQMuc9693usXFoKrUWjRLJdnTDyV6OFIxXyANHUEM7N
         xIC/A6knrEyIA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/7] m68k: coldfire: use clkdev_lookup on most coldfire
Date:   Mon, 31 May 2021 19:34:26 +0200
Message-Id: <20210531173429.2467403-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531173429.2467403-1-arnd@kernel.org>
References: <20210531173429.2467403-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Coldfire is now the only target that implements the clk_get()/clk_put()
helpers itself rather than using the common implementation.

Most coldfire variants only have two distinct clocks and use the clk
code purely for lookup. Change those over to use clkdev_lookup instead
but leave the custom clk interface for those two clocks.

Also leave the four SoCs that have gated clocks.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu      |  4 ++++
 arch/m68k/coldfire/clk.c   | 16 ++++++-------
 arch/m68k/coldfire/m5206.c | 25 +++++++++------------
 arch/m68k/coldfire/m523x.c | 42 ++++++++++++++--------------------
 arch/m68k/coldfire/m5249.c | 33 ++++++++++++---------------
 arch/m68k/coldfire/m525x.c | 33 ++++++++++++---------------
 arch/m68k/coldfire/m5272.c | 35 ++++++++++++-----------------
 arch/m68k/coldfire/m527x.c | 46 +++++++++++++++-----------------------
 arch/m68k/coldfire/m528x.c | 42 ++++++++++++++--------------------
 arch/m68k/coldfire/m5307.c | 27 ++++++++++------------
 arch/m68k/coldfire/m5407.c | 25 +++++++++------------
 arch/m68k/coldfire/m54xx.c | 33 ++++++++++++---------------
 12 files changed, 154 insertions(+), 207 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index f4d23977d2a5..b3483929b313 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -328,6 +328,10 @@ config COLDFIRE_SLTIMERS
 	bool
 	select LEGACY_TIMER_TICK
 
+config COLDFIRE_CLKDEV_LOOKUP
+	def_bool !(M5206 || M5206e || M53xx || M5441x)
+	select CLKDEV_LOOKUP
+
 endif # COLDFIRE
 
 
diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index 076a9caa9557..ffe36627bab8 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -71,7 +71,6 @@ struct clk_ops clk_ops1 = {
 	.disable	= __clk_disable1,
 };
 #endif /* MCFPM_PPMCR1 */
-#endif /* MCFPM_PPMCR0 */
 
 struct clk *clk_get(struct device *dev, const char *id)
 {
@@ -87,6 +86,14 @@ struct clk *clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(clk_get);
 
+void clk_put(struct clk *clk)
+{
+	if (clk->enabled != 0)
+		pr_warn("clk_put %s still enabled\n", clk->name);
+}
+EXPORT_SYMBOL(clk_put);
+#endif /* MCFPM_PPMCR0 */
+
 int clk_enable(struct clk *clk)
 {
 	unsigned long flags;
@@ -117,13 +124,6 @@ void clk_disable(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_disable);
 
-void clk_put(struct clk *clk)
-{
-	if (clk->enabled != 0)
-		pr_warn("clk_put %s still enabled\n", clk->name);
-}
-EXPORT_SYMBOL(clk_put);
-
 unsigned long clk_get_rate(struct clk *clk)
 {
 	if (!clk)
diff --git a/arch/m68k/coldfire/m5206.c b/arch/m68k/coldfire/m5206.c
index 2f14ea95c391..5e726e94b5ab 100644
--- a/arch/m68k/coldfire/m5206.c
+++ b/arch/m68k/coldfire/m5206.c
@@ -10,6 +10,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -23,21 +24,15 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfi2c0,
-	NULL
+static struct clk_lookup m5206_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -66,6 +61,8 @@ void __init config_BSP(char *commandp, int size)
 	mcf_mapirq2imr(28, MCFINTC_EINT4);
 	mcf_mapirq2imr(31, MCFINTC_EINT7);
 	m5206_i2c_init();
+
+	clkdev_add_table(m5206_clk_lookup, ARRAY_SIZE(m5206_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
index ddf2496ed117..193c178162c1 100644
--- a/arch/m68k/coldfire/m523x.c
+++ b/arch/m68k/coldfire/m523x.c
@@ -13,6 +13,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -26,31 +27,20 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcfpit0, "mcfpit.0", MCF_CLK);
-DEFINE_CLK(mcfpit1, "mcfpit.1", MCF_CLK);
-DEFINE_CLK(mcfpit2, "mcfpit.2", MCF_CLK);
-DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcfpit0,
-	&clk_mcfpit1,
-	&clk_mcfpit2,
-	&clk_mcfpit3,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfuart2,
-	&clk_mcfqspi0,
-	&clk_fec0,
-	&clk_mcfi2c0,
-	NULL
+
+struct clk_lookup m523x_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcfpit.0", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.1", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.2", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.3", NULL, &clk_pll),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.2", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("fec.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -100,6 +90,8 @@ void __init config_BSP(char *commandp, int size)
 	m523x_fec_init();
 	m523x_qspi_init();
 	m523x_i2c_init();
+
+	clkdev_add_table(m523x_clk_lookup, ARRAY_SIZE(m523x_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
index 0590f8c421f1..6d66972de214 100644
--- a/arch/m68k/coldfire/m5249.c
+++ b/arch/m68k/coldfire/m5249.c
@@ -9,6 +9,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -23,25 +24,17 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c1, "imx1-i2c.1", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfqspi0,
-	&clk_mcfi2c0,
-	&clk_mcfi2c1,
-	NULL
+
+struct clk_lookup m5249_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.1", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -137,6 +130,8 @@ void __init config_BSP(char *commandp, int size)
 #endif
 	m5249_qspi_init();
 	m5249_i2c_init();
+
+	clkdev_add_table(m5249_clk_lookup, ARRAY_SIZE(m5249_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
index 1772359c416c..2c4d2ca2f20d 100644
--- a/arch/m68k/coldfire/m525x.c
+++ b/arch/m68k/coldfire/m525x.c
@@ -9,6 +9,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -23,25 +24,17 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c1, "imx1-i2c.1", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfqspi0,
-	&clk_mcfi2c0,
-	&clk_mcfi2c1,
-	NULL
+
+static struct clk_lookup m525x_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.1", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -88,6 +81,8 @@ void __init config_BSP(char *commandp, int size)
 
 	m525x_qspi_init();
 	m525x_i2c_init();
+
+	clkdev_add_table(m525x_clk_lookup, ARRAY_SIZE(m525x_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 6b3ab583c698..734dab657fe3 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -10,6 +10,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -34,27 +35,18 @@ unsigned char ledbank = 0xff;
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcftmr2, "mcftmr.2", MCF_BUSCLK);
-DEFINE_CLK(mcftmr3, "mcftmr.3", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcftmr2,
-	&clk_mcftmr3,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfqspi0,
-	&clk_fec0,
-	NULL
+
+static struct clk_lookup m5272_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.2", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.3", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("fec.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -128,6 +120,7 @@ static int __init init_BSP(void)
 {
 	m5272_uarts_init();
 	fixed_phy_add(PHY_POLL, 0, &nettel_fixed_phy_status);
+	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
 
diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
index cad462df6861..ff29c7a947e2 100644
--- a/arch/m68k/coldfire/m527x.c
+++ b/arch/m68k/coldfire/m527x.c
@@ -13,6 +13,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -27,33 +28,21 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcfpit0, "mcfpit.0", MCF_CLK);
-DEFINE_CLK(mcfpit1, "mcfpit.1", MCF_CLK);
-DEFINE_CLK(mcfpit2, "mcfpit.2", MCF_CLK);
-DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
-DEFINE_CLK(fec1, "fec.1", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcfpit0,
-	&clk_mcfpit1,
-	&clk_mcfpit2,
-	&clk_mcfpit3,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfuart2,
-	&clk_mcfqspi0,
-	&clk_fec0,
-	&clk_fec1,
-	&clk_mcfi2c0,
-	NULL
+
+static struct clk_lookup m527x_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcfpit.0", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.1", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.2", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.3", NULL, &clk_pll),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.2", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("fec.0", NULL, &clk_sys),
+	CLKDEV_INIT("fec.1", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -97,7 +86,7 @@ static void __init m527x_i2c_init(void)
 	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
 	par = readw(MCFGPIO_PAR_FECI2C);
 	par |= 0x0f;
-	writew(par, MCFGPIO_PAR_FECI2C);
+	wm527x_clk_lookupritew(par, MCFGPIO_PAR_FECI2C);
 #endif
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
@@ -151,6 +140,7 @@ void __init config_BSP(char *commandp, int size)
 	m527x_fec_init();
 	m527x_qspi_init();
 	m527x_i2c_init();
+	clkdev_add_table(m527x_clk_lookup, ARRAY_SIZE(m527x_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 7ad3193887e8..51a6a6236e12 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -13,6 +13,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -28,31 +29,20 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcfpit0, "mcfpit.0", MCF_CLK);
-DEFINE_CLK(mcfpit1, "mcfpit.1", MCF_CLK);
-DEFINE_CLK(mcfpit2, "mcfpit.2", MCF_CLK);
-DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
-DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
-DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcfpit0,
-	&clk_mcfpit1,
-	&clk_mcfpit2,
-	&clk_mcfpit3,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfuart2,
-	&clk_mcfqspi0,
-	&clk_fec0,
-	&clk_mcfi2c0,
-	NULL
+
+static struct clk_lookup m528x_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcfpit.0", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.1", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.2", NULL, &clk_pll),
+	CLKDEV_INIT("mcfpit.3", NULL, &clk_pll),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.2", NULL, &clk_sys),
+	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
+	CLKDEV_INIT("fec.0", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -146,6 +136,8 @@ void __init config_BSP(char *commandp, int size)
 	m528x_fec_init();
 	m528x_qspi_init();
 	m528x_i2c_init();
+
+	clkdev_add_table(m528x_clk_lookup, ARRAY_SIZE(m528x_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
index 64b4b1fd34ff..4ed2e43ab3ad 100644
--- a/arch/m68k/coldfire/m5307.c
+++ b/arch/m68k/coldfire/m5307.c
@@ -10,6 +10,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -32,21 +33,15 @@ unsigned char ledbank = 0xff;
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfi2c0,
-	NULL
+
+static struct clk_lookup m5307_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -88,6 +83,8 @@ void __init config_BSP(char *commandp, int size)
 	wdebug(MCFDEBUG_CSR, MCFDEBUG_CSR_PSTCLK);
 #endif
 	m5307_i2c_init();
+
+	clkdev_add_table(m5307_clk_lookup, ARRAY_SIZE(m5307_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
index 0400d76115a1..b32efb3042a2 100644
--- a/arch/m68k/coldfire/m5407.c
+++ b/arch/m68k/coldfire/m5407.c
@@ -10,6 +10,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -23,21 +24,15 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
-DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcftmr0,
-	&clk_mcftmr1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfi2c0,
-	NULL
+static struct clk_lookup m5407_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcftmr.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcftmr.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -63,6 +58,8 @@ void __init config_BSP(char *commandp, int size)
 	mcf_mapirq2imr(29, MCFINTC_EINT5);
 	mcf_mapirq2imr(31, MCFINTC_EINT7);
 	m5407_i2c_init();
+
+	clkdev_add_table(m5407_clk_lookup, ARRAY_SIZE(m5407_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 360c723c0ae6..8e3c8fee8327 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -9,6 +9,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -32,25 +33,17 @@
 
 DEFINE_CLK(pll, "pll.0", MCF_CLK);
 DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
-DEFINE_CLK(mcfslt0, "mcfslt.0", MCF_BUSCLK);
-DEFINE_CLK(mcfslt1, "mcfslt.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
-DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
-DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
-DEFINE_CLK(mcfuart3, "mcfuart.3", MCF_BUSCLK);
-DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
-
-struct clk *mcf_clks[] = {
-	&clk_pll,
-	&clk_sys,
-	&clk_mcfslt0,
-	&clk_mcfslt1,
-	&clk_mcfuart0,
-	&clk_mcfuart1,
-	&clk_mcfuart2,
-	&clk_mcfuart3,
-	&clk_mcfi2c0,
-	NULL
+
+static struct clk_lookup m54xx_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
+	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
+	CLKDEV_INIT("mcfslt.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfslt.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.2", NULL, &clk_sys),
+	CLKDEV_INIT("mcfuart.3", NULL, &clk_sys),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
 };
 
 /***************************************************************************/
@@ -100,6 +93,8 @@ void __init config_BSP(char *commandp, int size)
 	mach_sched_init = hw_timer_init;
 	m54xx_uarts_init();
 	m54xx_i2c_init();
+
+	clkdev_add_table(m54xx_clk_lookup, ARRAY_SIZE(m54xx_clk_lookup));
 }
 
 /***************************************************************************/
-- 
2.29.2


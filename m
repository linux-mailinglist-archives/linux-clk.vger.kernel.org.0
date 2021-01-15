Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8D42F8460
	for <lists+linux-clk@lfdr.de>; Fri, 15 Jan 2021 19:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbhAOSaE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Jan 2021 13:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbhAOSaC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jan 2021 13:30:02 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC58C061757;
        Fri, 15 Jan 2021 10:29:22 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id d81so4818408iof.3;
        Fri, 15 Jan 2021 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhrnzTC272IzXE7nZRWanMSI5d2sXiTPOddzz1MCXhs=;
        b=CGCib86lLwmLVkHUvgz9v4oyDbUETBoKSt0rI8Jg7N8pDoWa289ctmR4RTe7xR7SLq
         3JJ58AH7DwQfX8EQdMO9O801GtmgKXum2gaMAMD47QFgmNeFa67s+oqh7ey1xgO61uBY
         y5z+HZxmvWfUwx/A7a/awHO0NDCNuZ053Z/PlpJvLw0uJKR1jxHM/7c3pQ6E70Pqa84F
         UcE3dpWIlz6WOhnBwZbIRg0Xu2cGqz4j64d2LrwCj9oXQVlKZmqlKeXr7CDOS2l3sCW5
         lOVjD7voy7/MJBJU0uOlYDVD7scpqmD0hSsEYLKo3u/mAwninT0BMEEKOIaNfJc7a9dw
         6TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhrnzTC272IzXE7nZRWanMSI5d2sXiTPOddzz1MCXhs=;
        b=YCs04Ht6CV7Ulr2g6Ez6Rp/Cw/EjgEC68TKosYijm91uTa6rx/mfPmUSaxvWY6f0UW
         8h8S7BLqM/9PkUgWKxqC2/xOSnEH9/rKAcBaPYnkFCVaLU9t/ICFRYkcfCbNmisZBg99
         Pbf4LG71k1Ga16go3TD1qIWFAwwNGlnAXD9XjsPGs/tpLLqXUUbKRIbkAPoQxLY+4Iq/
         liUZn/9g6RLquwtP5zelZi7c2mErpr9yGmTQIAkDtkjJaLp1XvTv/Eg8z35VIB300uUS
         Cvs7bmqgliil5Sj5gWdnpOgDtTTThSDGnQl5rA0WZjY8jUwrgpNSF5id3R42jYU1w+mP
         2TWA==
X-Gm-Message-State: AOAM531UKR9Z09L0v3JebDyKSBm7MrPDM+dWvesi3mN1im+PDqOZO+7j
        eHDzlWhXpHoDO3+di/dkyEQ=
X-Google-Smtp-Source: ABdhPJxtRZ4Di6IGoDHu6oIHi+63VMzDF2cGBfU8kssx8B7jerIzE4cK3ytuFo1qnKIJIKn0k0imVA==
X-Received: by 2002:a92:1bcd:: with SMTP id f74mr2438542ill.281.1610735361250;
        Fri, 15 Jan 2021 10:29:21 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:475c:c79e:a431:bccb])
        by smtp.gmail.com with ESMTPSA id g3sm2999903ilr.66.2021.01.15.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:29:20 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3] clk: imx: Fix reparenting of UARTs not associated with sdout
Date:   Fri, 15 Jan 2021 12:29:08 -0600
Message-Id: <20210115182909.314756-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Most if not all i.MX SoC's call a function which enables all UARTS.
This is a problem for users who need to re-parent the clock source,
because any attempt to change the parent results in an busy error
due to the fact that the clocks have been enabled already.

  clk: failed to reparent uart1 to sys_pll1_80m: -16

Instead of pre-initializing all UARTS, scan the device tree to see
which UART clocks are associated to stdout, and only enable those
UART clocks if it's needed early.  This will move initialization of
the remaining clocks until after the parenting of the clocks.

When the clocks are shutdown, this mechanism will also disable any
clocks that were pre-initialized.

Fixes: 9461f7b33d11c ("clk: fix CLK_SET_RATE_GATE with clock rate protection")
Suggested-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V3:  Return a method more closely related to upstream kernel but
     instead of passing an array of UART's, each SoC passes the max
     number of UART clocks is has.  The imx clock driver will create
     an array to enable on startup, and disable later.
V2:  Attempt to port driver from vendor kernel.

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index a66cabfbf94f..66192fe0a898 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -73,16 +73,6 @@ enum mx25_clks {
 
 static struct clk *clk[clk_max];
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[uart_ipg_per],
-	&clk[uart1_ipg],
-	&clk[uart2_ipg],
-	&clk[uart3_ipg],
-	&clk[uart4_ipg],
-	&clk[uart5_ipg],
-	NULL
-};
-
 static int __init __mx25_clocks_init(void __iomem *ccm_base)
 {
 	BUG_ON(!ccm_base);
@@ -228,7 +218,7 @@ static int __init __mx25_clocks_init(void __iomem *ccm_base)
 	 */
 	clk_set_parent(clk[cko_sel], clk[ipg]);
 
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(6);
 
 	return 0;
 }
diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 5585ded8b8c6..56a5fc402b10 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -49,17 +49,6 @@ static const char *ssi_sel_clks[] = { "spll_gate", "mpll", };
 static struct clk *clk[IMX27_CLK_MAX];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[IMX27_CLK_PER1_GATE],
-	&clk[IMX27_CLK_UART1_IPG_GATE],
-	&clk[IMX27_CLK_UART2_IPG_GATE],
-	&clk[IMX27_CLK_UART3_IPG_GATE],
-	&clk[IMX27_CLK_UART4_IPG_GATE],
-	&clk[IMX27_CLK_UART5_IPG_GATE],
-	&clk[IMX27_CLK_UART6_IPG_GATE],
-	NULL
-};
-
 static void __init _mx27_clocks_init(unsigned long fref)
 {
 	BUG_ON(!ccm);
@@ -176,7 +165,7 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(7);
 
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 7b13fb57d842..c44e18c6f63f 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -51,16 +51,6 @@ enum mx31_clks {
 static struct clk *clk[clk_max];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[ipg],
-	&clk[uart1_gate],
-	&clk[uart2_gate],
-	&clk[uart3_gate],
-	&clk[uart4_gate],
-	&clk[uart5_gate],
-	NULL
-};
-
 static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 {
 	clk[dummy] = imx_clk_fixed("dummy", 0);
diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index c1df03665c09..0fe5ac210156 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -82,14 +82,6 @@ enum mx35_clks {
 
 static struct clk *clk[clk_max];
 
-static struct clk ** const uart_clks[] __initconst = {
-	&clk[ipg],
-	&clk[uart1_gate],
-	&clk[uart2_gate],
-	&clk[uart3_gate],
-	NULL
-};
-
 static void __init _mx35_clocks_init(void)
 {
 	void __iomem *base;
@@ -243,7 +235,7 @@ static void __init _mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(4);
 
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 }
diff --git a/drivers/clk/imx/clk-imx5.c b/drivers/clk/imx/clk-imx5.c
index 01e079b81026..e4493846454d 100644
--- a/drivers/clk/imx/clk-imx5.c
+++ b/drivers/clk/imx/clk-imx5.c
@@ -128,30 +128,6 @@ static const char *ieee1588_sels[] = { "pll3_sw", "pll4_sw", "dummy" /* usbphy2_
 static struct clk *clk[IMX5_CLK_END];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks_mx51[] __initconst = {
-	&clk[IMX5_CLK_UART1_IPG_GATE],
-	&clk[IMX5_CLK_UART1_PER_GATE],
-	&clk[IMX5_CLK_UART2_IPG_GATE],
-	&clk[IMX5_CLK_UART2_PER_GATE],
-	&clk[IMX5_CLK_UART3_IPG_GATE],
-	&clk[IMX5_CLK_UART3_PER_GATE],
-	NULL
-};
-
-static struct clk ** const uart_clks_mx50_mx53[] __initconst = {
-	&clk[IMX5_CLK_UART1_IPG_GATE],
-	&clk[IMX5_CLK_UART1_PER_GATE],
-	&clk[IMX5_CLK_UART2_IPG_GATE],
-	&clk[IMX5_CLK_UART2_PER_GATE],
-	&clk[IMX5_CLK_UART3_IPG_GATE],
-	&clk[IMX5_CLK_UART3_PER_GATE],
-	&clk[IMX5_CLK_UART4_IPG_GATE],
-	&clk[IMX5_CLK_UART4_PER_GATE],
-	&clk[IMX5_CLK_UART5_IPG_GATE],
-	&clk[IMX5_CLK_UART5_PER_GATE],
-	NULL
-};
-
 static void __init mx5_clocks_common_init(void __iomem *ccm_base)
 {
 	clk[IMX5_CLK_DUMMY]		= imx_clk_fixed("dummy", 0);
@@ -382,7 +358,7 @@ static void __init mx50_clocks_init(struct device_node *np)
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
 
-	imx_register_uart_clocks(uart_clks_mx50_mx53);
+	imx_register_uart_clocks(5);
 }
 CLK_OF_DECLARE(imx50_ccm, "fsl,imx50-ccm", mx50_clocks_init);
 
@@ -488,7 +464,7 @@ static void __init mx51_clocks_init(struct device_node *np)
 	val |= 1 << 23;
 	writel(val, MXC_CCM_CLPCR);
 
-	imx_register_uart_clocks(uart_clks_mx51);
+	imx_register_uart_clocks(3);
 }
 CLK_OF_DECLARE(imx51_ccm, "fsl,imx51-ccm", mx51_clocks_init);
 
@@ -633,6 +609,6 @@ static void __init mx53_clocks_init(struct device_node *np)
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
 
-	imx_register_uart_clocks(uart_clks_mx50_mx53);
+	imx_register_uart_clocks(5);
 }
 CLK_OF_DECLARE(imx53_ccm, "fsl,imx53-ccm", mx53_clocks_init);
diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index b2ff187cedab..f444bbe8244c 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -140,13 +140,6 @@ static inline int clk_on_imx6dl(void)
 	return of_machine_is_compatible("fsl,imx6dl");
 }
 
-static const int uart_clk_ids[] __initconst = {
-	IMX6QDL_CLK_UART_IPG,
-	IMX6QDL_CLK_UART_SERIAL,
-};
-
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1] __initdata;
-
 static int ldb_di_sel_by_clock_id(int clock_id)
 {
 	switch (clock_id) {
@@ -440,7 +433,6 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	struct device_node *np;
 	void __iomem *anatop_base, *base;
 	int ret;
-	int i;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX6QDL_CLK_END), GFP_KERNEL);
@@ -982,12 +974,6 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 			       hws[IMX6QDL_CLK_PLL3_USB_OTG]->clk);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(1);
 }
 CLK_OF_DECLARE(imx6q, "fsl,imx6q-ccm", imx6q_clocks_init);
diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
index 2f9361946a0e..d997b5b07818 100644
--- a/drivers/clk/imx/clk-imx6sl.c
+++ b/drivers/clk/imx/clk-imx6sl.c
@@ -178,19 +178,11 @@ void imx6sl_set_wait_clk(bool enter)
 		imx6sl_enable_pll_arm(false);
 }
 
-static const int uart_clk_ids[] __initconst = {
-	IMX6SL_CLK_UART,
-	IMX6SL_CLK_UART_SERIAL,
-};
-
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1] __initdata;
-
 static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
 	void __iomem *base;
 	int ret;
-	int i;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX6SL_CLK_END), GFP_KERNEL);
@@ -447,12 +439,6 @@ static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 	clk_set_parent(hws[IMX6SL_CLK_LCDIF_AXI_SEL]->clk,
 		       hws[IMX6SL_CLK_PLL2_PFD2]->clk);
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(2);
 }
 CLK_OF_DECLARE(imx6sl, "fsl,imx6sl-ccm", imx6sl_clocks_init);
diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 8e8288bda4d0..31d777f30039 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -76,26 +76,10 @@ static u32 share_count_ssi1;
 static u32 share_count_ssi2;
 static u32 share_count_ssi3;
 
-static const int uart_clk_ids[] __initconst = {
-	IMX6SLL_CLK_UART1_IPG,
-	IMX6SLL_CLK_UART1_SERIAL,
-	IMX6SLL_CLK_UART2_IPG,
-	IMX6SLL_CLK_UART2_SERIAL,
-	IMX6SLL_CLK_UART3_IPG,
-	IMX6SLL_CLK_UART3_SERIAL,
-	IMX6SLL_CLK_UART4_IPG,
-	IMX6SLL_CLK_UART4_SERIAL,
-	IMX6SLL_CLK_UART5_IPG,
-	IMX6SLL_CLK_UART5_SERIAL,
-};
-
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1] __initdata;
-
 static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
 	void __iomem *base;
-	int i;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX6SLL_CLK_END), GFP_KERNEL);
@@ -356,13 +340,7 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(5);
 
 	/* Lower the AHB clock rate before changing the clock source. */
 	clk_set_rate(hws[IMX6SLL_CLK_AHB]->clk, 99000000);
diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 20dcce526d07..fc1bd23d4583 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -117,18 +117,10 @@ static u32 share_count_ssi3;
 static u32 share_count_sai1;
 static u32 share_count_sai2;
 
-static const int uart_clk_ids[] __initconst = {
-	IMX6SX_CLK_UART_IPG,
-	IMX6SX_CLK_UART_SERIAL,
-};
-
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1] __initdata;
-
 static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
 	void __iomem *base;
-	int i;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX6SX_CLK_CLK_END), GFP_KERNEL);
@@ -556,12 +548,6 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(2);
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);
diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 22d24a6a05e7..c4e0f1c07192 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -377,23 +377,10 @@ static const char *pll_video_bypass_sel[] = { "pll_video_main", "pll_video_main_
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
 
-static const int uart_clk_ids[] __initconst = {
-	IMX7D_UART1_ROOT_CLK,
-	IMX7D_UART2_ROOT_CLK,
-	IMX7D_UART3_ROOT_CLK,
-	IMX7D_UART4_ROOT_CLK,
-	IMX7D_UART5_ROOT_CLK,
-	IMX7D_UART6_ROOT_CLK,
-	IMX7D_UART7_ROOT_CLK,
-};
-
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1] __initdata;
-
 static void __init imx7d_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
 	void __iomem *base;
-	int i;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX7D_CLK_END), GFP_KERNEL);
@@ -897,14 +884,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_USB1_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb1_main_clk", "osc", 20, 1);
 	hws[IMX7D_USB_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb_main_clk", "osc", 20, 1);
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(7);
 
 }
 CLK_OF_DECLARE(imx7d, "fsl,imx7d-ccm", imx7d_clocks_init);
diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index 634c0b6636b0..779e09105da7 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -43,19 +43,6 @@ static const struct clk_div_table ulp_div_table[] = {
 	{ /* sentinel */ },
 };
 
-static const int pcc2_uart_clk_ids[] __initconst = {
-	IMX7ULP_CLK_LPUART4,
-	IMX7ULP_CLK_LPUART5,
-};
-
-static const int pcc3_uart_clk_ids[] __initconst = {
-	IMX7ULP_CLK_LPUART6,
-	IMX7ULP_CLK_LPUART7,
-};
-
-static struct clk **pcc2_uart_clks[ARRAY_SIZE(pcc2_uart_clk_ids) + 1] __initdata;
-static struct clk **pcc3_uart_clks[ARRAY_SIZE(pcc3_uart_clk_ids) + 1] __initdata;
-
 static void __init imx7ulp_clk_scg1_init(struct device_node *np)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -150,7 +137,6 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **hws;
 	void __iomem *base;
-	int i;
 
 	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_PCC2_END),
 			   GFP_KERNEL);
@@ -190,13 +176,7 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 
-	for (i = 0; i < ARRAY_SIZE(pcc2_uart_clk_ids); i++) {
-		int index = pcc2_uart_clk_ids[i];
-
-		pcc2_uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(pcc2_uart_clks);
+	imx_register_uart_clocks(2);
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc2, "fsl,imx7ulp-pcc2", imx7ulp_clk_pcc2_init);
 
@@ -205,7 +185,6 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **hws;
 	void __iomem *base;
-	int i;
 
 	clk_data = kzalloc(struct_size(clk_data, hws, IMX7ULP_CLK_PCC3_END),
 			   GFP_KERNEL);
@@ -244,13 +223,7 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
 
-	for (i = 0; i < ARRAY_SIZE(pcc3_uart_clk_ids); i++) {
-		int index = pcc3_uart_clk_ids[i];
-
-		pcc3_uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(pcc3_uart_clks);
+	imx_register_uart_clocks(7);
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc3, "fsl,imx7ulp-pcc3", imx7ulp_clk_pcc3_init);
 
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 7c905861af5d..209775140fe8 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -291,20 +291,12 @@ static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
-static const int uart_clk_ids[] = {
-	IMX8MM_CLK_UART1_ROOT,
-	IMX8MM_CLK_UART2_ROOT,
-	IMX8MM_CLK_UART3_ROOT,
-	IMX8MM_CLK_UART4_ROOT,
-};
-static struct clk **uart_hws[ARRAY_SIZE(uart_clk_ids) + 1];
-
 static int imx8mm_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
-	int ret, i;
+	int ret;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX8MM_CLK_END), GFP_KERNEL);
@@ -622,13 +614,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_hws[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_hws);
+	imx_register_uart_clocks(4);
 
 	return 0;
 
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 3c21db942d5b..43098186abeb 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -284,20 +284,12 @@ static const char * const imx8mn_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sy
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
-static const int uart_clk_ids[] = {
-	IMX8MN_CLK_UART1_ROOT,
-	IMX8MN_CLK_UART2_ROOT,
-	IMX8MN_CLK_UART3_ROOT,
-	IMX8MN_CLK_UART4_ROOT,
-};
-static struct clk **uart_hws[ARRAY_SIZE(uart_clk_ids) + 1];
-
 static int imx8mn_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
-	int ret, i;
+	int ret;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX8MN_CLK_END), GFP_KERNEL);
@@ -573,13 +565,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_hws[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_hws);
+	imx_register_uart_clocks(4);
 
 	return 0;
 
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 2f4e1d674e1c..3e6557e7d559 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -414,20 +414,11 @@ static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_r
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
 
-static const int uart_clk_ids[] = {
-	IMX8MP_CLK_UART1_ROOT,
-	IMX8MP_CLK_UART2_ROOT,
-	IMX8MP_CLK_UART3_ROOT,
-	IMX8MP_CLK_UART4_ROOT,
-};
-static struct clk **uart_clks[ARRAY_SIZE(uart_clk_ids) + 1];
-
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	void __iomem *anatop_base, *ccm_base;
-	int i;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
 	anatop_base = of_iomap(np, 0);
@@ -737,13 +728,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_clks[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_clks);
+	imx_register_uart_clocks(4);
 
 	return 0;
 }
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 779ea69e639c..3d539e9f9c92 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -273,20 +273,12 @@ static const char * const imx8mq_clko2_sels[] = {"osc_25m", "sys2_pll_200m", "sy
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
-static const int uart_clk_ids[] = {
-	IMX8MQ_CLK_UART1_ROOT,
-	IMX8MQ_CLK_UART2_ROOT,
-	IMX8MQ_CLK_UART3_ROOT,
-	IMX8MQ_CLK_UART4_ROOT,
-};
-static struct clk **uart_hws[ARRAY_SIZE(uart_clk_ids) + 1];
-
 static int imx8mq_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
-	int err, i;
+	int err;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX8MQ_CLK_END), GFP_KERNEL);
@@ -607,13 +599,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(uart_clk_ids); i++) {
-		int index = uart_clk_ids[i];
-
-		uart_hws[i] = &hws[index]->clk;
-	}
-
-	imx_register_uart_clocks(uart_hws);
+	imx_register_uart_clocks(4);
 
 	return 0;
 
diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index 47882c51cb85..158fe302a8b7 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -147,8 +147,10 @@ void imx_cscmr1_fixup(u32 *val)
 }
 
 #ifndef MODULE
-static int imx_keep_uart_clocks;
-static struct clk ** const *imx_uart_clocks;
+
+static bool imx_keep_uart_clocks;
+static int imx_enabled_uart_clocks;
+static struct clk **imx_uart_clocks;
 
 static int __init imx_keep_uart_clocks_param(char *str)
 {
@@ -161,24 +163,43 @@ __setup_param("earlycon", imx_keep_uart_earlycon,
 __setup_param("earlyprintk", imx_keep_uart_earlyprintk,
 	      imx_keep_uart_clocks_param, 0);
 
-void imx_register_uart_clocks(struct clk ** const clks[])
+void imx_register_uart_clocks(unsigned int clk_count)
 {
+#ifdef CONFIG_OF
 	if (imx_keep_uart_clocks) {
 		int i;
 
-		imx_uart_clocks = clks;
-		for (i = 0; imx_uart_clocks[i]; i++)
-			clk_prepare_enable(*imx_uart_clocks[i]);
+		imx_uart_clocks = kcalloc(clk_count, sizeof(struct clk *), GFP_KERNEL);
+		imx_enabled_uart_clocks = 0;
+
+		for (i = 0; i < clk_count; i++) {
+			imx_uart_clocks[imx_enabled_uart_clocks] = of_clk_get(of_stdout, i);
+
+			/* Stop if there are no more of_stdout references */
+			if (IS_ERR(imx_uart_clocks[imx_enabled_uart_clocks]))
+				return;
+
+			/* Only enable the clock if it's not NULL */
+			if (imx_uart_clocks[imx_enabled_uart_clocks])
+				clk_prepare_enable(imx_uart_clocks[imx_enabled_uart_clocks++]);
+		}
 	}
+#else
+	/* i.MX boards use device trees now.  For build tests without CONFIG_OF, do nothing */
+	imx_enabled_uart_clocks = 0;
+#endif
 }
 
 static int __init imx_clk_disable_uart(void)
 {
-	if (imx_keep_uart_clocks && imx_uart_clocks) {
+	if (imx_keep_uart_clocks && imx_enabled_uart_clocks) {
 		int i;
 
-		for (i = 0; imx_uart_clocks[i]; i++)
-			clk_disable_unprepare(*imx_uart_clocks[i]);
+		for (i = 0; i < imx_enabled_uart_clocks; i++) {
+			clk_disable_unprepare(imx_uart_clocks[i]);
+			clk_put(imx_uart_clocks[i]);
+		};
+		kfree(imx_uart_clocks);
 	}
 
 	return 0;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 4f04c8287286..7571603bee23 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -11,9 +11,9 @@ extern spinlock_t imx_ccm_lock;
 void imx_check_clocks(struct clk *clks[], unsigned int count);
 void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count);
 #ifndef MODULE
-void imx_register_uart_clocks(struct clk ** const clks[]);
+void imx_register_uart_clocks(unsigned int clk_count);
 #else
-static inline void imx_register_uart_clocks(struct clk ** const clks[])
+static inline void imx_register_uart_clocks(unsigned int clk_count)
 {
 }
 #endif
-- 
2.25.1


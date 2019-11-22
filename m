Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A1C107BBC
	for <lists+linux-clk@lfdr.de>; Sat, 23 Nov 2019 00:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfKVX4m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 Nov 2019 18:56:42 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:34953 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfKVX4l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Nov 2019 18:56:41 -0500
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id E98AF23D06;
        Sat, 23 Nov 2019 00:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1574466999;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KXeBY+gO4TTDPyLB3nDYLfeOhaloj7KBExK+QQQbyxE=;
        b=gByxFV47SuizKsfhJqjPNMo7Nyl7JeO9V/RId/gm7tLZgQt8RPMHtnGJTMYwIliZFkcSoW
        ytQnC3P808Xj4c+O8h/ijSsSMouzojbpVX4+105eU13nnz7aatOK1x7zjjS+grJ1JVvGAo
        VC6rHKI190aM2yiXFeiEsc4qzIEkHPM=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH 2/2] clk: fsl-sai: new driver
Date:   Sat, 23 Nov 2019 00:56:22 +0100
Message-Id: <20191122235622.8818-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122235622.8818-1-michael@walle.cc>
References: <20191122235622.8818-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
X-Rspamd-Server: web
X-Spam-Status: Yes, score=6.40
X-Spam-Score: 6.40
X-Rspamd-Queue-Id: E98AF23D06
X-Spamd-Result: default: False [6.40 / 15.00];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[8];
         MID_CONTAINS_FROM(1.00)[];
         NEURAL_HAM(-0.00)[-0.633];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE];
         SUSPICIOUS_RECIPS(1.50)[]
X-Spam: Yes
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With this driver it is possible to use the BCLK pin of the SAI module as
a generic clock output. This is esp. useful if you want to drive a clock
to an audio codec. Because the output only allows integer divider values
the audio codec needs an integrated PLL.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/clk/Kconfig       | 12 ++++++
 drivers/clk/Makefile      |  1 +
 drivers/clk/clk-fsl-sai.c | 84 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/clk/clk-fsl-sai.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c44247d0b83e..d3bd43e8a912 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -167,6 +167,18 @@ config COMMON_CLK_CS2000_CP
 	help
 	  If you say yes here you get support for the CS2000 clock multiplier.
 
+config COMMON_CLK_FSL_SAI
+	bool "Clock driver for BCLK of Freescale SAI cores"
+	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	help
+	  This driver supports the Freescale SAI (Synchronous Audio Interface)
+	  to be used as a generic clock output. Some SoCs have restrictions
+	  regarding the possible pin multiplexer settings. Eg. on some SoCs
+	  two SAI interfaces can only be enabled together. If just one is
+	  needed, the BCLK pin of the second one can be used as general
+	  purpose clock output. Ideally, it can be used to drive an audio
+	  codec (sometimes known as MCLK).
+
 config COMMON_CLK_GEMINI
 	bool "Clock driver for Cortina Systems Gemini SoC"
 	depends on ARCH_GEMINI || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0138fb14e6f8..139f55e544a8 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
+obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
new file mode 100644
index 000000000000..b92054d15ab1
--- /dev/null
+++ b/drivers/clk/clk-fsl-sai.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Freescale SAI BCLK as a generic clock driver
+ *
+ * Copyright 2019 Kontron Europe GmbH
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+#define I2S_CSR		0x00
+#define I2S_CR2		0x08
+#define CSR_BCE_BIT	28
+#define CR2_BCD		BIT(24)
+#define CR2_DIV_SHIFT	0
+#define CR2_DIV_WIDTH	8
+
+struct fsl_sai_clk {
+	struct clk_divider div;
+	struct clk_gate gate;
+	spinlock_t lock;
+};
+
+static void __init fsl_sai_clk_setup(struct device_node *node)
+{
+	const char *clk_name = node->name;
+	struct fsl_sai_clk *sai_clk;
+	unsigned int num_parents;
+	const char *parent_name;
+	void __iomem *base;
+	struct clk_hw *hw;
+
+	num_parents = of_clk_get_parent_count(node);
+	if (!num_parents) {
+		pr_err("%s: no parent found", clk_name);
+		return;
+	}
+
+	parent_name = of_clk_get_parent_name(node, 0);
+
+	sai_clk = kzalloc(sizeof(*sai_clk), GFP_KERNEL);
+	if (!sai_clk)
+		return;
+
+	base = of_iomap(node, 0);
+	if (base == NULL) {
+		pr_err("%s: failed to map register space", clk_name);
+		goto err;
+	}
+
+	spin_lock_init(&sai_clk->lock);
+
+	sai_clk->gate.reg = base + I2S_CSR;
+	sai_clk->gate.bit_idx = CSR_BCE_BIT;
+	sai_clk->gate.lock = &sai_clk->lock;
+
+	sai_clk->div.reg = base + I2S_CR2;
+	sai_clk->div.shift = CR2_DIV_SHIFT;
+	sai_clk->div.width = CR2_DIV_WIDTH;
+	sai_clk->div.lock = &sai_clk->lock;
+
+	/* set clock direction, we are the BCLK master */
+	writel(CR2_BCD, base + I2S_CR2);
+
+	hw = clk_hw_register_composite(NULL, clk_name, &parent_name, 1,
+				       NULL, NULL,
+				       &sai_clk->div.hw, &clk_divider_ops,
+				       &sai_clk->gate.hw, &clk_gate_ops,
+				       CLK_SET_RATE_GATE);
+	if (IS_ERR(hw))
+		goto err;
+
+	of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+
+	return;
+
+err:
+	kfree(sai_clk);
+}
+
+CLK_OF_DECLARE(fsl_sai_clk, "fsl,vf610-sai-clock", fsl_sai_clk_setup);
-- 
2.20.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1336E09DE
	for <lists+linux-clk@lfdr.de>; Tue, 22 Oct 2019 18:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732952AbfJVQ5k (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Oct 2019 12:57:40 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25487 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbfJVQ5k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Oct 2019 12:57:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571763446; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=D/s02LsEajAaoF3QT3njyN8bu204NVX4AGlffUJJBvznlY5z4TuszpCR5fPem7e0ehL92Sj5u9tv1EQrbP9OoJfj1cNOVOBmT0M/ZZeQkKwj0tmCEH5Fow8bQ7AqeBqdkuom0/HtE7UNzd9EWjEqLh7fGIgJXlUAVm3sSosEaOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1571763446; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=uwOEpsBJi8wy4RWezg1zTsH5RrCezPZMo1HoRqxrqYI=; 
        b=UiVCEQcC44utFYGl9LAlg7ec1uK+/PCyvKsn5HHopiK1jEDF89lXRxnPQA+ZHkMY+CUbs/byoLCjUgfsbzzBWXM3FlJ5YPxrrBuvgnKc6r/I+B7syqUQtTBnXjYziYFfWoLb9uTDdx9JJYLptvgfiIlYxjK8zZJrjyOUzuo0/EE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=IYpuUScx2I3PqVRh2jfxYYuRDrBGb0t06+2hODFLRXQH1PkPHVD/WBk1bvVJkFjHEJLkk8oVMEVu
    ZL/szkxCeVTH+4NvUTpuwdhN2zg8JVxOCRA++raAI9iYlLkdFXfN  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571763446;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=8061; bh=uwOEpsBJi8wy4RWezg1zTsH5RrCezPZMo1HoRqxrqYI=;
        b=mw3N6qY8JA5kQ6vl/ylPoJGPuf8MAiNqwBIE4hJvIqBVtkisssv0iVhOuFJAI7In
        Jj8G34MiyLzKXHIDrCOFJVWK3R+u7R/5g/g2Z2ddeWPeq/4B7LKmYSfOFXzOljiXx9V
        3x2NNYOn/JbO+y2eTKhePIpOoKPZ3JiuNrCgHxT0=
Received: from localhost.localdomain (171.221.113.199 [171.221.113.199]) by mx.zohomail.com
        with SMTPS id 1571763445368379.5435379219763; Tue, 22 Oct 2019 09:57:25 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mturquette@baylibre.com, sboyd@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net
Subject: [PATCH 2/2 v2] clk: Ingenic: Add CGU driver for X1000.
Date:   Wed, 23 Oct 2019 00:56:29 +0800
Message-Id: <1571763389-43443-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571763389-43443-1-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1571763389-43443-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the clocks provided by the CGU in the Ingenic X1000
SoC, making use of the cgu code to do the heavy lifting.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/clk/ingenic/Kconfig     |  10 ++
 drivers/clk/ingenic/Makefile    |   1 +
 drivers/clk/ingenic/x1000-cgu.c | 256 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/clk/ingenic/x1000-cgu.c

diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
index fe8db93..2aebf0d 100644
--- a/drivers/clk/ingenic/Kconfig
+++ b/drivers/clk/ingenic/Kconfig
@@ -45,4 +45,14 @@ config INGENIC_CGU_JZ4780
 
 	  If building for a JZ4780 SoC, you want to say Y here.
 
+config INGENIC_CGU_X1000
+	bool "Ingenic X1000 CGU driver"
+	default MACH_X1000
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic X1000
+	  and compatible SoCs.
+
+	  If building for a X1000 SoC, you want to say Y here.
+
 endmenu
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 250570a..0f0e784 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4725B)	+= jz4725b-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
 obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
+obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
new file mode 100644
index 00000000..a964911
--- /dev/null
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * X1000 SoC CGU driver
+ * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <dt-bindings/clock/x1000-cgu.h>
+#include "cgu.h"
+#include "pm.h"
+
+/* CGU register offsets */
+#define CGU_REG_CPCCR		0x00
+#define CGU_REG_APLL		0x10
+#define CGU_REG_MPLL		0x14
+#define CGU_REG_CLKGR		0x20
+#define CGU_REG_OPCR		0x24
+#define CGU_REG_DDRCDR		0x2c
+#define CGU_REG_MACPHYCDR	0x54
+#define CGU_REG_I2SCDR		0x60
+#define CGU_REG_LPCDR		0x64
+#define CGU_REG_MSC0CDR		0x68
+#define CGU_REG_I2SCDR1		0x70
+#define CGU_REG_SSICDR		0x74
+#define CGU_REG_CIMCDR		0x7c
+#define CGU_REG_PCMCDR		0x84
+#define CGU_REG_MSC1CDR		0xa4
+#define CGU_REG_CMP_INTR	0xb0
+#define CGU_REG_CMP_INTRE	0xb4
+#define CGU_REG_DRCG		0xd0
+#define CGU_REG_CLOCKSTATUS	0xd4
+#define CGU_REG_PCMCDR1		0xe0
+#define CGU_REG_MACPHYC		0xe8
+
+/* bits within the OPCR register */
+#define OPCR_SPENDN0		BIT(7)
+#define OPCR_SPENDN1		BIT(6)
+
+static struct ingenic_cgu *cgu;
+
+static const s8 pll_od_encoding[8] = {
+	0x0, 0x1, -1, 0x2, -1, -1, -1, 0x3,
+};
+
+static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
+
+	/* External clocks */
+
+	[X1000_CLK_EXCLK] = { "ext", CGU_CLK_EXT },
+	[X1000_CLK_RTCLK] = { "rtc", CGU_CLK_EXT },
+
+	/* PLLs */
+
+	[X1000_CLK_APLL] = {
+		"apll", CGU_CLK_PLL,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_APLL,
+			.m_shift = 24,
+			.m_bits = 7,
+			.m_offset = 1,
+			.n_shift = 18,
+			.n_bits = 5,
+			.n_offset = 1,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 9,
+			.enable_bit = 8,
+			.stable_bit = 10,
+		},
+	},
+
+	[X1000_CLK_MPLL] = {
+		"mpll", CGU_CLK_PLL,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.pll = {
+			.reg = CGU_REG_MPLL,
+			.m_shift = 24,
+			.m_bits = 7,
+			.m_offset = 1,
+			.n_shift = 18,
+			.n_bits = 5,
+			.n_offset = 1,
+			.od_shift = 16,
+			.od_bits = 2,
+			.od_max = 8,
+			.od_encoding = pll_od_encoding,
+			.bypass_bit = 6,
+			.enable_bit = 7,
+			.stable_bit = 0,
+		},
+	},
+
+	/* Muxes & dividers */
+
+	[X1000_CLK_SCLKA] = {
+		"sclk_a", CGU_CLK_MUX,
+		.parents = { -1, X1000_CLK_EXCLK, X1000_CLK_APLL, -1 },
+		.mux = { CGU_REG_CPCCR, 30, 2 },
+	},
+
+	[X1000_CLK_CPUMUX] = {
+		"cpu_mux", CGU_CLK_MUX,
+		.parents = { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 28, 2 },
+	},
+
+	[X1000_CLK_CPU] = {
+		"cpu", CGU_CLK_DIV,
+		.parents = { X1000_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
+	},
+
+	[X1000_CLK_L2CACHE] = {
+		"l2cache", CGU_CLK_DIV,
+		.parents = { X1000_CLK_CPUMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
+	},
+
+	[X1000_CLK_AHB0] = {
+		"ahb0", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 26, 2 },
+		.div = { CGU_REG_CPCCR, 8, 1, 4, 21, -1, -1 },
+	},
+
+	[X1000_CLK_AHB2PMUX] = {
+		"ahb2_apb_mux", CGU_CLK_MUX,
+		.parents = { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_CPCCR, 24, 2 },
+	},
+
+	[X1000_CLK_AHB2] = {
+		"ahb2", CGU_CLK_DIV,
+		.parents = { X1000_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
+	},
+
+	[X1000_CLK_PCLK] = {
+		"pclk", CGU_CLK_DIV,
+		.parents = { X1000_CLK_AHB2PMUX, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
+	},
+
+	[X1000_CLK_DDR] = {
+		"ddr", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { -1, X1000_CLK_SCLKA, X1000_CLK_MPLL, -1 },
+		.mux = { CGU_REG_DDRCDR, 30, 2 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 31 },
+	},
+
+	[X1000_CLK_MAC] = {
+		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL},
+		.mux = { CGU_REG_MACPHYCDR, 31, 1 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 25 },
+	},
+
+	[X1000_CLK_MSCMUX] = {
+		"msc_mux", CGU_CLK_MUX,
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL},
+		.mux = { CGU_REG_MSC0CDR, 31, 1 },
+	},
+
+	[X1000_CLK_MSC0] = {
+		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1000_CLK_MSCMUX, -1, -1, -1 },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 4 },
+	},
+
+	[X1000_CLK_MSC1] = {
+		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
+		.parents = { X1000_CLK_MSCMUX, -1, -1, -1 },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 5 },
+	},
+
+	[X1000_CLK_SSIPLL] = {
+		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
+		.mux = { CGU_REG_SSICDR, 31, 1 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
+	},
+
+	[X1000_CLK_SSIMUX] = {
+		"ssi_mux", CGU_CLK_MUX,
+		.parents = { X1000_CLK_EXCLK, X1000_CLK_SSIPLL, -1, -1 },
+		.mux = { CGU_REG_SSICDR, 30, 1 },
+	},
+
+	/* Gate-only clocks */
+
+	[X1000_CLK_SFC] = {
+		"sfc", CGU_CLK_GATE,
+		.parents = { X1000_CLK_SSIPLL, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 2 },
+	},
+
+	[X1000_CLK_UART0] = {
+		"uart0", CGU_CLK_GATE,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 14 },
+	},
+
+	[X1000_CLK_UART1] = {
+		"uart1", CGU_CLK_GATE,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 15 },
+	},
+
+	[X1000_CLK_UART2] = {
+		"uart2", CGU_CLK_GATE,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 16 },
+	},
+
+	[X1000_CLK_SSI] = {
+		"ssi", CGU_CLK_GATE,
+		.parents = { X1000_CLK_SSIMUX, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 19 },
+	},
+
+	[X1000_CLK_PDMA] = {
+		"pdma", CGU_CLK_GATE,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 21 },
+	},
+};
+
+static void __init x1000_cgu_init(struct device_node *np)
+{
+	int retval;
+
+	cgu = ingenic_cgu_new(x1000_cgu_clocks,
+			      ARRAY_SIZE(x1000_cgu_clocks), np);
+	if (!cgu) {
+		pr_err("%s: failed to initialise CGU\n", __func__);
+		return;
+	}
+
+	retval = ingenic_cgu_register_clocks(cgu);
+	if (retval) {
+		pr_err("%s: failed to register CGU Clocks\n", __func__);
+		return;
+	}
+
+	ingenic_cgu_register_syscore_ops(cgu);
+}
+CLK_OF_DECLARE_DRIVER(x1000_cgu, "ingenic,x1000-cgu", x1000_cgu_init);
-- 
2.7.4



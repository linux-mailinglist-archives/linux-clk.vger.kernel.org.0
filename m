Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871616B2DE5
	for <lists+linux-clk@lfdr.de>; Thu,  9 Mar 2023 20:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCIToi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Mar 2023 14:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCITog (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 14:44:36 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2084.outbound.protection.outlook.com [40.107.215.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F29EE825F;
        Thu,  9 Mar 2023 11:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGA67dAwmyXVdhvlsTiU+q/RgKqno1kdD5llA5JnVJEKlEiTG6HPwRMcfWssziTfE7rJytOQ6StoijubhW8wg7FkFuwBwiEf3zb/RWyTOhIQbNvIR0afpuqvfIe7zDLqKr947DVNO5jW8XZAL4zBdAJZp2BhfkXme4FAIQs0m4z3wmt1Q5qFP4vaTjF9YnECVImV2J7uIinhFlqBdy7rFKBAdsmNSQYlbYQTzDGw1OQcGyRBwUGvTv6v4pjeLfR0rmxnAPOhRacG7aBesIm4XqtqsMerQGFbWZKfvjCasAGgmRPx0VIcCTW5uMwR1P+LTan9e+qm64NspaGcOAYduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyWpJGhVdV4NpPwU/Ir8BnvKgEaddYlITMUEP2orsN4=;
 b=FvelZT3vegyZfrinzGJtymRXdPzC3eE7hxzhpuubpJWsFZH3BsN9+Sz8TCxMm12CHJZ4+n9qADO5F8sQwcN7Rw/pBstdN75zObKTXVvSOxh+ORKgHcHjvxraKE2pEWgYpBijvk/MS/oZ7UZFeBsOtoZUz2f+/BMru3kWY22jQGn6OTDk+p61yGgUd0iqICXrCnvEWh1RxBKxb9J8ONoVY3c5Ss1WOPap9tpDVh7EQqtrUvTQQSYmgw165SEKkK70ixZzn3dGrQksCbt/3VrKqK+SNKGpEJN0vZVCfhG+dy+d9xBTGo6GkQ2o8rQJW4ji6Qm5Dil+rag1Oyeuj1XMYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nuvoton.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyWpJGhVdV4NpPwU/Ir8BnvKgEaddYlITMUEP2orsN4=;
 b=CtyJ30uGP/aTkUqTuj+1PSHcvFPzIw/MyvC0+HxUytwbflmK7/Pd7vV1iSZmrocRUWujDmclsvuzOU4Fmio2nkGCprStfQNisJQteZp0y0iohHRYjiMFxBIbeWUx0uV0bWUe6/E9vOaniA7UuhncHiRYIJ8W4pRDZntpUN5ChoA=
Received: from TYCPR01CA0157.jpnprd01.prod.outlook.com (2603:1096:400:2b1::10)
 by SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 19:44:10 +0000
Received: from TYZAPC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:2b1::4) by TYCPR01CA0157.outlook.office365.com
 (2603:1096:400:2b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18 via Frontend
 Transport; Thu, 9 Mar 2023 19:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT022.mail.protection.outlook.com (10.118.152.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 19:44:10 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 10
 Mar 2023 03:44:10 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 10 Mar
 2023 03:44:09 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport;
 Fri, 10 Mar 2023 03:44:09 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 87C416473C; Thu,  9 Mar 2023 21:44:08 +0200 (IST)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>
CC:     <openbmc@lists.ozlabs.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v15 1/1] clk: npcm8xx: add clock controller
Date:   Thu, 9 Mar 2023 21:44:02 +0200
Message-ID: <20230309194402.119562-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230309194402.119562-1-tmaimon77@gmail.com>
References: <20230309194402.119562-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT022:EE_|SEZPR03MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b1dc81-c9d4-4b5b-0e06-08db20d6a76f
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: miqCZtL3W3ZoF5W1wKOpI4uYtNaJqGaqNdsIBHxe2MqjDol57Fie2UKUrMdOe996ok8GKf5vfFzZEG4/JJTLwUM4S9E07N3xHJ3NpXn3BhpICZRSlwT825OpIpQYzgN/cWIMbxFVGy/PqDSM0lY75VVBAHfChAeciQeWxcWR4qGD4sQtEZKxqC7qg6gIavpIKgveKvLm6WoEfcmYp9koKthNN95Xte7uDF2Uwh2A6ldwUAepQvoo6zr4SxtnGKdeVyoEJFk5+iyUd5TvnWHab4yRNKfcNjIXnmU65glZvigL4X7s74j8L2dtIMU8vraagd3llzkeUC6AcWXR7uO1McgC7ns30a4CupNGUk3y0hPyGXPwbPWuKFS00dDunVipmQVEBtS52Y0tbD981EymSyyLaUzFVQ6w2wdc9U8JL1MzwhhHErhHD+9/99LunOoWlH/S3A5/Ejini5gwLBqvb/Y2Wtb9VMD9FhAojGhkg/sEkNOrDBJT7Tf1gK34k+8aheLC9UlqVRzpKXwMI5PEcIA3y0QE+gDc5uqP4RT2znXkIELsLFkm1YGaK41+EW9Ertdl+3+2/gqFl/MzLtxfpTYWBUfH0jBvHEeQnslwERDt/hKUGCuhmLmyQvFSZBdhgIofdaLtc+ag0TqZ+nshMNymaIS0eDi01eLchWXqUkWkKWNoJPHT9epnwZbEx2EkQQRCVxEc7zQP2+SV4AE2myo9DCc66niRxNzQt6X14HaaXfFNx69cu1M81ytob210JZ/2YztbiWJh4SRYTJbMeO5tNsYIDogirKZfzs4pSoE=
X-Forefront-Antispam-Report: CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(46966006)(36840700001)(40470700004)(36756003)(6266002)(42186006)(40460700003)(110136005)(54906003)(478600001)(76482006)(7416002)(316002)(4326008)(70206006)(2906002)(8676002)(30864003)(70586007)(5660300002)(8936002)(41300700001)(356005)(82740400003)(36860700001)(81166007)(26005)(186003)(83170400001)(1076003)(40480700001)(83380400001)(2616005)(6666004)(82310400005)(55446002)(82202003)(336012)(73392003)(42882007)(47076005)(45356006)(32563001)(35450700002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 19:44:10.6439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b1dc81-c9d4-4b5b-0e06-08db20d6a76f
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7146
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        DKIM_SIGNED,DKIM_VALID,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
generates and supplies clocks to all modules within the BMC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/clk/Kconfig       |   8 +
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-npcm8xx.c | 561 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 570 insertions(+)
 create mode 100644 drivers/clk/clk-npcm8xx.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b6c5bf69a2b2..63f2aa1707a3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -325,6 +325,14 @@ config COMMON_CLK_LOCHNAGAR
 	  This driver supports the clocking features of the Cirrus Logic
 	  Lochnagar audio development board.
 
+config COMMON_CLK_NPCM8XX
+	tristate "Clock driver for the NPCM8XX SoC Family"
+	depends on ARCH_NPCM || COMPILE_TEST
+	help
+	  This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC Family,
+	  all the clocks are initialized by the bootloader, so this driver
+	  allows only reading of current settings directly from the hardware.
+
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..cae295de5459 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_ARCH_MILBEAUT_M10V)	+= clk-milbeaut.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
 obj-$(CONFIG_ARCH_NPCM7XX)	    	+= clk-npcm7xx.o
+obj-$(CONFIG_COMMON_CLK_NPCM8XX)	+= clk-npcm8xx.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
 obj-$(CONFIG_COMMON_CLK_OXNAS)		+= clk-oxnas.o
 obj-$(CONFIG_COMMON_CLK_PALMAS)		+= clk-palmas.o
diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
new file mode 100644
index 000000000000..67058f121251
--- /dev/null
+++ b/drivers/clk/clk-npcm8xx.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM8xx Clock Generator
+ * All the clocks are initialized by the bootloader, so this driver allow only
+ * reading of current settings directly from the hardware.
+ *
+ * Copyright (C) 2020 Nuvoton Technologies
+ * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/nuvoton,npcm845-clk.h>
+
+/* npcm8xx clock registers*/
+#define NPCM8XX_CLKSEL          (0x04)
+#define NPCM8XX_CLKDIV1         (0x08)
+#define NPCM8XX_CLKDIV2         (0x2C)
+#define NPCM8XX_CLKDIV3         (0x58)
+#define NPCM8XX_CLKDIV4         (0x7C)
+#define NPCM8XX_PLLCON0         (0x0C)
+#define NPCM8XX_PLLCON1         (0x10)
+#define NPCM8XX_PLLCON2         (0x54)
+#define NPCM8XX_PLLCONG         (0x60)
+#define NPCM8XX_THRTL_CNT       (0xC0)
+
+#define PLLCON_LOKI	BIT(31)
+#define PLLCON_LOKS	BIT(30)
+#define PLLCON_FBDV	GENMASK(27, 16)
+#define PLLCON_OTDV2	GENMASK(15, 13)
+#define PLLCON_PWDEN	BIT(12)
+#define PLLCON_OTDV1	GENMASK(10, 8)
+#define PLLCON_INDV	GENMASK(5, 0)
+
+struct npcm8xx_clk_pll {
+	struct clk_hw	hw;
+	void __iomem	*pllcon;
+	unsigned int	id;
+	const char	*name;
+	u32		reg;
+	unsigned long	flags;
+};
+
+#define to_npcm8xx_clk_pll(_hw) container_of(_hw, struct npcm8xx_clk_pll, hw)
+
+struct npcm8xx_pll_data {
+	const char *name;
+	struct clk_parent_data parent;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+struct npcm8xx_clk_div_data {
+	u32 reg;
+	u8 shift;
+	u8 width;
+	const char *name;
+	const struct clk_parent_data parent_data;
+	u8 clk_divider_flags;
+	unsigned long flags;
+	int onecell_idx;
+};
+
+struct npcm8xx_clk_mux_data {
+	u8 shift;
+	u32 mask;
+	const u32 *table;
+	const char *name;
+	const struct clk_parent_data *parent_data;
+	u8 num_parents;
+	unsigned long flags;
+};
+
+/* external clock definition */
+#define NPCM8XX_CLK_S_REFCLK	"refclk"
+
+/* pll definition */
+#define NPCM8XX_CLK_S_PLL0	"pll0"
+#define NPCM8XX_CLK_S_PLL1	"pll1"
+#define NPCM8XX_CLK_S_PLL2	"pll2"
+#define NPCM8XX_CLK_S_PLL_GFX	"pll_gfx"
+
+/* early divider definition */
+#define NPCM8XX_CLK_S_PLL2_DIV2		"pll2_div2"
+#define NPCM8XX_CLK_S_PLL_GFX_DIV2	"pll_gfx_div2"
+#define NPCM8XX_CLK_S_PLL1_DIV2		"pll1_div2"
+
+/* mux definition */
+#define NPCM8XX_CLK_S_CPU_MUX     "cpu_mux"
+#define NPCM8XX_CLK_S_PIX_MUX     "gfx_pixel_mux"
+#define NPCM8XX_CLK_S_SD_MUX      "sd_mux"
+#define NPCM8XX_CLK_S_UART_MUX    "uart_mux"
+#define NPCM8XX_CLK_S_SU_MUX      "serial_usb_mux"
+#define NPCM8XX_CLK_S_MC_MUX      "mc_mux"
+#define NPCM8XX_CLK_S_ADC_MUX     "adc_mux"
+#define NPCM8XX_CLK_S_GFX_MUX     "gfx_mux"
+#define NPCM8XX_CLK_S_CLKOUT_MUX  "clkout_mux"
+#define NPCM8XX_CLK_S_GFXM_MUX    "gfxm_mux"
+#define NPCM8XX_CLK_S_DVC_MUX     "dvc_mux"
+#define NPCM8XX_CLK_S_RG_MUX	  "rg_mux"
+#define NPCM8XX_CLK_S_RCP_MUX	  "rcp_mux"
+
+/* div definition */
+#define NPCM8XX_CLK_S_MC          "mc"
+#define NPCM8XX_CLK_S_AXI         "axi"
+#define NPCM8XX_CLK_S_AHB         "ahb"
+#define NPCM8XX_CLK_S_SPI0        "spi0"
+#define NPCM8XX_CLK_S_SPI1        "spi1"
+#define NPCM8XX_CLK_S_SPI3        "spi3"
+#define NPCM8XX_CLK_S_SPIX        "spix"
+#define NPCM8XX_CLK_S_APB1        "apb1"
+#define NPCM8XX_CLK_S_APB2        "apb2"
+#define NPCM8XX_CLK_S_APB3        "apb3"
+#define NPCM8XX_CLK_S_APB4        "apb4"
+#define NPCM8XX_CLK_S_APB5        "apb5"
+#define NPCM8XX_CLK_S_APB19       "apb19"
+#define NPCM8XX_CLK_S_TOCK        "tock"
+#define NPCM8XX_CLK_S_CLKOUT      "clkout"
+#define NPCM8XX_CLK_S_PRE_ADC     "pre adc"
+#define NPCM8XX_CLK_S_UART        "uart"
+#define NPCM8XX_CLK_S_UART2       "uart2"
+#define NPCM8XX_CLK_S_TIMER       "timer"
+#define NPCM8XX_CLK_S_MMC         "mmc"
+#define NPCM8XX_CLK_S_SDHC        "sdhc"
+#define NPCM8XX_CLK_S_ADC         "adc"
+#define NPCM8XX_CLK_S_GFX         "gfx0_gfx1_mem"
+#define NPCM8XX_CLK_S_USBIF       "serial_usbif"
+#define NPCM8XX_CLK_S_USB_HOST    "usb_host"
+#define NPCM8XX_CLK_S_USB_BRIDGE  "usb_bridge"
+#define NPCM8XX_CLK_S_PCI         "pci"
+#define NPCM8XX_CLK_S_TH          "th"
+#define NPCM8XX_CLK_S_ATB         "atb"
+#define NPCM8XX_CLK_S_PRE_CLK     "pre_clk"
+#define NPCM8XX_CLK_S_RG	  "rg"
+#define NPCM8XX_CLK_S_RCP	  "rcp"
+
+static struct npcm8xx_pll_data npcm8xx_pll_clks[] = {
+	{ NPCM8XX_CLK_S_PLL0, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON0, 0 },
+	{ NPCM8XX_CLK_S_PLL1, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON1, 0 },
+	{ NPCM8XX_CLK_S_PLL2, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON2, 0 },
+	{ NPCM8XX_CLK_S_PLL_GFX, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCONG, 0 },
+};
+
+static const u32 cpuck_mux_table[] = { 0, 1, 2, 7 };
+static const struct clk_parent_data cpuck_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
+	{ .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2, .name = NPCM8XX_CLK_S_PLL2 }
+};
+
+static const u32 pixcksel_mux_table[] = { 0, 2 };
+static const struct clk_parent_data pixcksel_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL_GFX, .name = NPCM8XX_CLK_S_PLL_GFX },
+	{ .name = NPCM8XX_CLK_S_REFCLK }
+};
+
+static const u32 default_mux_table[] = { 0, 1, 2, 3 };
+static const struct clk_parent_data default_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0,},
+	{ .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1},
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2_DIV2, .name = NPCM8XX_CLK_S_PLL2_DIV2}
+};
+
+static const u32 sucksel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data sucksel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2_DIV2, .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 mccksel_mux_table[] = { 0, 2 };
+static const struct clk_parent_data mccksel_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL1_DIV2, .name = NPCM8XX_CLK_S_PLL1_DIV2 },
+	{ .name = NPCM8XX_CLK_S_REFCLK }
+};
+
+static const u32 clkoutsel_mux_table[] = { 0, 1, 2, 3, 4 };
+static const struct clk_parent_data clkoutsel_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
+	{ .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL_GFX_DIV2, .name = NPCM8XX_CLK_S_PLL_GFX_DIV2 },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2_DIV2, .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 gfxmsel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data gfxmsel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2, .name = NPCM8XX_CLK_S_PLL2 }
+};
+
+static const u32 dvcssel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data dvcssel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .fw_name = NPCM8XX_CLK_S_PLL2, .name = NPCM8XX_CLK_S_PLL2 }
+};
+
+static const u32 default3_mux_table[] = { 0, 1, 2 };
+static const struct clk_parent_data default3_mux_parents[] = {
+	{ .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
+	{ .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK }
+};
+
+static const struct npcm8xx_clk_mux_data npcm8xx_muxes[] = {
+	{ 0, 3, cpuck_mux_table, NPCM8XX_CLK_S_CPU_MUX, cpuck_mux_parents,
+		ARRAY_SIZE(cpuck_mux_parents), CLK_IS_CRITICAL },
+	{ 4, 2, pixcksel_mux_table, NPCM8XX_CLK_S_PIX_MUX, pixcksel_mux_parents,
+		ARRAY_SIZE(pixcksel_mux_parents), 0 },
+	{ 6, 2, default_mux_table, NPCM8XX_CLK_S_SD_MUX, default_mux_parents,
+		ARRAY_SIZE(default_mux_parents), 0 },
+	{ 8, 2, default_mux_table, NPCM8XX_CLK_S_UART_MUX, default_mux_parents,
+		ARRAY_SIZE(default_mux_parents), 0 },
+	{ 10, 2, sucksel_mux_table, NPCM8XX_CLK_S_SU_MUX, sucksel_mux_parents,
+		ARRAY_SIZE(sucksel_mux_parents), 0 },
+	{ 12, 2, mccksel_mux_table, NPCM8XX_CLK_S_MC_MUX, mccksel_mux_parents,
+		ARRAY_SIZE(mccksel_mux_parents), 0 },
+	{ 14, 2, default_mux_table, NPCM8XX_CLK_S_ADC_MUX, default_mux_parents,
+		ARRAY_SIZE(default_mux_parents), 0 },
+	{ 16, 2, default_mux_table, NPCM8XX_CLK_S_GFX_MUX, default_mux_parents,
+		ARRAY_SIZE(default_mux_parents), 0 },
+	{ 18, 3, clkoutsel_mux_table, NPCM8XX_CLK_S_CLKOUT_MUX, clkoutsel_mux_parents,
+		ARRAY_SIZE(clkoutsel_mux_parents), 0 },
+	{ 21, 2, gfxmsel_mux_table, NPCM8XX_CLK_S_GFXM_MUX, gfxmsel_mux_parents,
+		ARRAY_SIZE(gfxmsel_mux_parents), 0 },
+	{ 23, 2, dvcssel_mux_table, NPCM8XX_CLK_S_DVC_MUX, dvcssel_mux_parents,
+		ARRAY_SIZE(dvcssel_mux_parents), 0 },
+	{ 25, 2, default3_mux_table, NPCM8XX_CLK_S_RG_MUX, default3_mux_parents,
+		ARRAY_SIZE(default3_mux_parents), 0 },
+	{ 27, 2, default3_mux_table, NPCM8XX_CLK_S_RCP_MUX, default3_mux_parents,
+		ARRAY_SIZE(default3_mux_parents), 0 },
+};
+
+/* configurable dividers: */
+static const struct npcm8xx_clk_div_data npcm8xx_divs[] = {
+	{ NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC,
+	{ .fw_name = NPCM8XX_CLK_S_PRE_ADC, .name = NPCM8XX_CLK_S_PRE_ADC },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
+	{ NPCM8XX_CLKDIV1, 26, 2, NPCM8XX_CLK_S_AHB,
+	{ .fw_name = NPCM8XX_CLK_S_PRE_CLK, .name = NPCM8XX_CLK_S_PRE_CLK },
+	CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
+	{ NPCM8XX_CLKDIV1, 21, 5, NPCM8XX_CLK_S_PRE_ADC,
+	{ .fw_name = NPCM8XX_CLK_S_ADC_MUX, .name = NPCM8XX_CLK_S_ADC_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, -1 },
+	{ NPCM8XX_CLKDIV1, 16, 5, NPCM8XX_CLK_S_UART,
+	{ .fw_name = NPCM8XX_CLK_S_UART_MUX, .name = NPCM8XX_CLK_S_UART_MUX },
+	0, 0, NPCM8XX_CLK_UART },
+	{ NPCM8XX_CLKDIV1, 11, 5, NPCM8XX_CLK_S_MMC,
+	{ .fw_name = NPCM8XX_CLK_S_SD_MUX, .name = NPCM8XX_CLK_S_SD_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
+	{ NPCM8XX_CLKDIV1, 6, 5, NPCM8XX_CLK_S_SPI3,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	0, 0, NPCM8XX_CLK_SPI3 },
+	{ NPCM8XX_CLKDIV1, 2, 4, NPCM8XX_CLK_S_PCI,
+	{ .fw_name = NPCM8XX_CLK_S_GFX_MUX, .name = NPCM8XX_CLK_S_GFX_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI },
+
+	{ NPCM8XX_CLKDIV2, 30, 2, NPCM8XX_CLK_S_APB4,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB4 },
+	{ NPCM8XX_CLKDIV2, 28, 2, NPCM8XX_CLK_S_APB3,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB3 },
+	{ NPCM8XX_CLKDIV2, 26, 2, NPCM8XX_CLK_S_APB2,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB2 },
+	{ NPCM8XX_CLKDIV2, 24, 2, NPCM8XX_CLK_S_APB1,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB1 },
+	{ NPCM8XX_CLKDIV2, 22, 2, NPCM8XX_CLK_S_APB5,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB5 },
+	{ NPCM8XX_CLKDIV2, 16, 5, NPCM8XX_CLK_S_CLKOUT,
+	{ .fw_name = NPCM8XX_CLK_S_CLKOUT_MUX, .name = NPCM8XX_CLK_S_CLKOUT_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
+	{ NPCM8XX_CLKDIV2, 13, 3, NPCM8XX_CLK_S_GFX,
+	{ .fw_name = NPCM8XX_CLK_S_GFX_MUX, .name = NPCM8XX_CLK_S_GFX_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
+	{ NPCM8XX_CLKDIV2, 8, 5, NPCM8XX_CLK_S_USB_BRIDGE,
+	{ .fw_name = NPCM8XX_CLK_S_SU_MUX, .name = NPCM8XX_CLK_S_SU_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
+	{ NPCM8XX_CLKDIV2, 4, 4, NPCM8XX_CLK_S_USB_HOST,
+	{ .fw_name = NPCM8XX_CLK_S_SU_MUX, .name = NPCM8XX_CLK_S_SU_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
+	{ NPCM8XX_CLKDIV2, 0, 4, NPCM8XX_CLK_S_SDHC,
+	{ .fw_name = NPCM8XX_CLK_S_SD_MUX, .name = NPCM8XX_CLK_S_SD_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC },
+
+	{ NPCM8XX_CLKDIV3, 16, 8, NPCM8XX_CLK_S_SPI1,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
+	{ NPCM8XX_CLKDIV3, 11, 5, NPCM8XX_CLK_S_UART2,
+	{ .fw_name = NPCM8XX_CLK_S_UART_MUX, .name = NPCM8XX_CLK_S_UART_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
+	{ NPCM8XX_CLKDIV3, 6, 5, NPCM8XX_CLK_S_SPI0,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
+	{ NPCM8XX_CLKDIV3, 1, 5, NPCM8XX_CLK_S_SPIX,
+	{ .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
+
+	{ NPCM8XX_CLKDIV4, 28, 4, NPCM8XX_CLK_S_RG,
+	{ .fw_name = NPCM8XX_CLK_S_RG_MUX, .name = NPCM8XX_CLK_S_RG_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG },
+	{ NPCM8XX_CLKDIV4, 12, 4, NPCM8XX_CLK_S_RCP,
+	{ .fw_name = NPCM8XX_CLK_S_RCP_MUX, .name = NPCM8XX_CLK_S_RCP_MUX },
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
+
+	{ NPCM8XX_THRTL_CNT, 0, 2, NPCM8XX_CLK_S_TH,
+	{ .fw_name = NPCM8XX_CLK_S_CPU_MUX, .name = NPCM8XX_CLK_S_CPU_MUX },
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
+};
+
+static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
+	unsigned long fbdv, indv, otdv1, otdv2;
+	unsigned int val;
+	u64 ret;
+
+	if (parent_rate == 0) {
+		pr_debug("%s: parent rate is zero\n", __func__);
+		return 0;
+	}
+
+	val = readl_relaxed(pll->pllcon + pll->reg);
+
+	indv = FIELD_GET(PLLCON_INDV, val);
+	fbdv = FIELD_GET(PLLCON_FBDV, val);
+	otdv1 = FIELD_GET(PLLCON_OTDV1, val);
+	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
+
+	ret = (u64)parent_rate * fbdv;
+	do_div(ret, indv * otdv1 * otdv2);
+
+	return ret;
+}
+
+static const struct clk_ops npcm8xx_clk_pll_ops = {
+	.recalc_rate = npcm8xx_clk_pll_recalc_rate,
+};
+
+static struct clk_hw *
+npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
+			 const char *name, const struct clk_parent_data *parent,
+			 unsigned long flags)
+{
+	struct npcm8xx_clk_pll *pll;
+	struct clk_init_data init = {};
+	int ret;
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &npcm8xx_clk_pll_ops;
+	init.parent_data = parent;
+	init.num_parents = 1;
+	init.flags = flags;
+
+	pll->pllcon = pllcon;
+	pll->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &pll->hw);
+	if (ret) {
+		kfree(pll);
+		return ERR_PTR(ret);
+	}
+
+	return &pll->hw;
+}
+
+static DEFINE_SPINLOCK(npcm8xx_clk_lock);
+
+static int npcm8xx_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *npcm8xx_clk_data;
+	struct device *dev = &pdev->dev;
+	void __iomem *clk_base;
+	struct resource *res;
+	struct clk_hw *hw;
+	unsigned int i;
+	int err;
+
+	npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
+							 NPCM8XX_NUM_CLOCKS),
+					GFP_KERNEL);
+	if (!npcm8xx_clk_data)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	clk_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!clk_base) {
+		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
+		return -ENOMEM;
+	}
+
+	npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
+
+	for (i = 0; i < NPCM8XX_NUM_CLOCKS; i++)
+		npcm8xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	/* Register plls */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_pll_clks); i++) {
+		struct npcm8xx_pll_data *pll_clk = &npcm8xx_pll_clks[i];
+
+		hw = npcm8xx_clk_register_pll(dev, clk_base + pll_clk->reg,
+					      pll_clk->name, &pll_clk->parent,
+					      pll_clk->flags);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register pll\n");
+			return PTR_ERR(hw);
+		}
+	}
+
+	/* Register fixed dividers */
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL1_DIV2,
+					       NPCM8XX_CLK_S_PLL1, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register fixed div\n");
+		return PTR_ERR(hw);
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL2_DIV2,
+					       NPCM8XX_CLK_S_PLL2, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register pll2 div2\n");
+		return PTR_ERR(hw);
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL_GFX_DIV2,
+					       NPCM8XX_CLK_S_PLL_GFX, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register gfx div2\n");
+		return PTR_ERR(hw);
+	}
+
+	/* Register muxes */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_muxes); i++) {
+		const struct npcm8xx_clk_mux_data *mux_data = &npcm8xx_muxes[i];
+
+		hw = devm_clk_hw_register_mux_parent_data_table(dev,
+								mux_data->name,
+								mux_data->parent_data,
+								mux_data->num_parents,
+								mux_data->flags,
+								clk_base + NPCM8XX_CLKSEL,
+								mux_data->shift,
+								mux_data->mask,
+								0,
+								mux_data->table,
+								&npcm8xx_clk_lock);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register mux\n");
+			return PTR_ERR(hw);
+		}
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PRE_CLK,
+					       NPCM8XX_CLK_S_CPU_MUX, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register ckclk div2\n");
+		return PTR_ERR(hw);
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_AXI,
+					       NPCM8XX_CLK_S_TH, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
+		return PTR_ERR(hw);
+	}
+	npcm8xx_clk_data->hws[NPCM8XX_CLK_AXI] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
+					       NPCM8XX_CLK_S_AXI, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
+		return PTR_ERR(hw);
+	}
+	npcm8xx_clk_data->hws[NPCM8XX_CLK_ATB] = hw;
+
+	/* Register clock dividers specified in npcm8xx_divs */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
+		const struct npcm8xx_clk_div_data *div_data = &npcm8xx_divs[i];
+
+		hw = clk_hw_register_divider_parent_data(dev, div_data->name,
+							 &div_data->parent_data,
+							 div_data->flags,
+							 clk_base + div_data->reg,
+							 div_data->shift,
+							 div_data->width,
+							 div_data->clk_divider_flags,
+							 &npcm8xx_clk_lock);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register div table\n");
+			goto err_div_clk;
+		}
+
+		if (div_data->onecell_idx >= 0)
+			npcm8xx_clk_data->hws[div_data->onecell_idx] = hw;
+	}
+
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  npcm8xx_clk_data);
+	if (err) {
+		dev_err(dev, "unable to add clk provider\n");
+		hw = ERR_PTR(err);
+		goto err_div_clk;
+	}
+
+	return err;
+
+err_div_clk:
+	while (i--) {
+		if (npcm8xx_divs[i].onecell_idx >= 0)
+			clk_hw_unregister_divider(npcm8xx_clk_data->hws[npcm8xx_divs[i].onecell_idx]);
+	}
+
+	return PTR_ERR(hw);
+}
+
+static const struct of_device_id npcm8xx_clk_dt_ids[] = {
+	{ .compatible = "nuvoton,npcm845-clk", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm8xx_clk_dt_ids);
+
+static struct platform_driver npcm8xx_clk_driver = {
+	.probe  = npcm8xx_clk_probe,
+	.driver = {
+		.name = "npcm8xx_clk",
+		.of_match_table = npcm8xx_clk_dt_ids,
+	},
+};
+
+static int __init npcm8xx_clk_driver_init(void)
+{
+	return platform_driver_register(&npcm8xx_clk_driver);
+}
+arch_initcall(npcm8xx_clk_driver_init);
+
+static void __exit npcm8xx_clk_exit(void)
+{
+	platform_driver_unregister(&npcm8xx_clk_driver);
+}
+module_exit(npcm8xx_clk_exit);
+
+MODULE_DESCRIPTION("Clock driver for Nuvoton NPCM8XX BMC SoC");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
+
-- 
2.33.0


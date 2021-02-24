Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C971B3235B8
	for <lists+linux-clk@lfdr.de>; Wed, 24 Feb 2021 03:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhBXCcJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 23 Feb 2021 21:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbhBXCcG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 21:32:06 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41026C06178A;
        Tue, 23 Feb 2021 18:31:26 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id w19so813856qki.13;
        Tue, 23 Feb 2021 18:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/UzewB9SL/KFaRbRkQLU5DVxrRXp7mqsiYfAQbpVTI=;
        b=ViMmAv5pxljR/kdOjzBjhqeDmkiGXVgKBQo9TeqLomVIGrB2DXLI3mE/PVgd8jSKXr
         fPmtAKhLmY9tHXMNJdGrgX+COHZj2n8qHWhU77LpqnaEhkbluijY3sBUAQodSctTHdJj
         xypamCSXoOUxirur8sqYcK4ToyScHK1x3ynPwBpXzpZ0E82mVj8ElYMlnK+/TsQcAKZ6
         1rpFtcDFYX+WPiAk3I2V2xDmgisfuow6mzVvio8BdpP270fiuSJis80T0pR2JJZi+PSI
         /T/vYNnHjH018bNpsZT4c56uFM7MeMo7Fu8q3mklyAZ1RC/g5BxHDNqRib/NX121/OQF
         z3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/UzewB9SL/KFaRbRkQLU5DVxrRXp7mqsiYfAQbpVTI=;
        b=Aqh3bUo60Ds6rhvWbjocp8rx9uOQpuSHOHcmP3dCcb5CxyY1pBEyaSGZ6praotE4cM
         KKgoPC1pVUXvXX4JXUl9ldAfqpJO6M6LdRCKBbl1J+KAt1nCaVd23JvEJ3S4lJ/QXofD
         pVPZl4dR2BzuYMB3W2RFcR7iC/GZP/PkiV/XYCCT0UeAd98Eys/c6AxzSzYSk0SKkaeP
         tMJp+qyurUM/+uqvp5xHYpkSdk5Hq2799j0o21gdLkNLXfey/kQ9vMS2T1YflW3nbBKG
         Zm8bGo9Hy2NPAom77ABuhhD0BiAvyZAu9BZCJYiXJ1bnfzuw/nq8Ept6ffKOCoYRkAmr
         fIlg==
X-Gm-Message-State: AOAM531qVCajmUVX9PnrcidrDTnxCQp7IXJKLjoSiIMM07Dg1C5zbp1f
        HwupBJuSkswyoa1ZDXHEHpo=
X-Google-Smtp-Source: ABdhPJy58kWglvAkmzBYvnDmiV43T3EVs6zqSPdvWZNf4XZfgzzeaBUeAYttqnW6BNMcWt0cOTfPVw==
X-Received: by 2002:a37:474d:: with SMTP id u74mr4414633qka.397.1614133885284;
        Tue, 23 Feb 2021 18:31:25 -0800 (PST)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p25sm529500qkh.79.2021.02.23.18.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 18:31:24 -0800 (PST)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH v3 1/3] clk: add support for the lmk04832
Date:   Tue, 23 Feb 2021 21:31:14 -0500
Message-Id: <20210224023116.571718-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210224023116.571718-1-liambeguin@gmail.com>
References: <20210224023116.571718-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

The LMK04832 is an ultra-high performance clock conditioner with JEDEC
JESD204B support and is also pin compatible with the LMK0482x family of
devices.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/clk/Kconfig        |    7 +
 drivers/clk/Makefile       |    1 +
 drivers/clk/clk-lmk04832.c | 1286 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1294 insertions(+)
 create mode 100644 drivers/clk/clk-lmk04832.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff506c..1eea7fa8f394 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -55,6 +55,13 @@ config CLK_HSDK
 	  This driver supports the HSDK core, system, ddr, tunnel and hdmi PLLs
 	  control.
 
+config LMK04832
+	tristate "Ti LMK04832 JESD204B Compliant Clock Jitter Cleaner"
+	select REGMAP_SPI
+	help
+	  Say yes here to build support for Texas Instruments' LMK04832 Ultra
+	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..ec2c0437e548 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
+obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
new file mode 100644
index 000000000000..387a60fa2111
--- /dev/null
+++ b/drivers/clk/clk-lmk04832.c
@@ -0,0 +1,1286 @@
+/*
+ * LMK04832 Ultra Low-Noise JESD204B Compliant Clock Jitter Cleaner
+ * Pin compatible with the LMK0482x family
+ *
+ * Datasheet: https://www.ti.com/lit/ds/symlink/lmk04832.pdf
+ *
+ * Copyright (c) 2020, Xiphos Systems Corp.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/gcd.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+/* 0x000 - 0x00d System Functions */
+#define LMK04832_REG_RST3W		0x000
+#define LMK04832_BIT_RESET			BIT(7)
+#define LMK04832_BIT_SPI_3WIRE_DIS		BIT(4)
+#define LMK04832_REG_POWERDOWN		0x002
+#define LMK04832_REG_ID_DEV_TYPE	0x003
+#define LMK04832_REG_ID_PROD_MSB	0x004
+#define LMK04832_REG_ID_PROD_LSB	0x005
+#define LMK04832_REG_ID_MASKREV		0x006
+#define LMK04832_REG_ID_VNDR_MSB	0x00c
+#define LMK04832_REG_ID_VNDR_LSB	0x00d
+
+/* 0x100 - 0x137 Device Clock and SYSREF Clock Output Control */
+#define LMK04832_REG_CLKOUT_CTRL0(ch)	(0x100 + (ch >> 1) * 8)
+#define LMK04832_BIT_DCLK_DIV_LSB		GENMASK(7, 0)
+#define LMK04832_REG_CLKOUT_CTRL1(ch)	(0x101 + (ch >> 1) * 8)
+#define LMK04832_REG_CLKOUT_CTRL2(ch)	(0x102 + (ch >> 1) * 8)
+#define LMK04832_BIT_CLKOUTX_Y_PD		BIT(7)
+#define LMK04832_BIT_DCLK_DIV_MSB		GENMASK(1, 0)
+#define LMK04832_REG_CLKOUT_SRC_MUX(ch)	(0x103 + (ch % 2) + (ch >> 1) * 8)
+#define LMK04832_BIT_CLKOUT_SRC_MUX		BIT(5)
+#define LMK04832_REG_CLKOUT_CTRL3(ch)	(0x103 + (ch >> 1) * 8)
+#define LMK04832_BIT_DCLKX_Y_PD			BIT(4)
+#define LMK04832_BIT_DCLKX_Y_DCC		BIT(2)
+#define LMK04832_REG_CLKOUT_CTRL4(ch)	(0x104 + (ch >> 1) * 8)
+#define LMK04832_BIT_SCLK_PD			BIT(4)
+#define LMK04832_REG_CLKOUT_FMT(ch)	(0x107 + (ch >> 1) * 8)
+#define LMK04832_BIT_CLKOUT_FMT(ch)		(ch % 2 ? 0xf0 : 0x0f)
+#define LMK04832_VAL_CLKOUT_FMT_POWERDOWN		0x00
+#define LMK04832_VAL_CLKOUT_FMT_LVDS			0x01
+#define LMK04832_VAL_CLKOUT_FMT_HSDS6			0x02
+#define LMK04832_VAL_CLKOUT_FMT_HSDS8			0x03
+#define LMK04832_VAL_CLKOUT_FMT_LVPECL1600		0x04
+#define LMK04832_VAL_CLKOUT_FMT_LVPECL2000		0x05
+#define LMK04832_VAL_CLKOUT_FMT_LCPECL			0x06
+#define LMK04832_VAL_CLKOUT_FMT_CML16			0x07
+#define LMK04832_VAL_CLKOUT_FMT_CML24			0x08
+#define LMK04832_VAL_CLKOUT_FMT_CML32			0x09
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_OFF_INV		0x0a
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_NOR_OFF		0x0b
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_INV_INV		0x0c
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_INV_NOR		0x0d
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_NOR_INV		0x0e
+#define LMK04832_VAL_CLKOUT_FMT_CMOS_NOR_NOR		0x0f
+
+/* 0x138 - 0x145 SYSREF, SYNC, and Device Config */
+#define LMK04832_REG_VCO_OSCOUT		0x138
+#define LMK04832_BIT_VCO_MUX			GENMASK(6, 5)
+#define LMK04832_VAL_VCO_MUX_VCO0			0x00
+#define LMK04832_VAL_VCO_MUX_VCO1			0x01
+#define LMK04832_VAL_VCO_MUX_EXT			0x02
+#define LMK04832_REG_SYSREF_OUT		0x139
+#define LMK04832_BIT_SYSREF_MUX			GENMASK(1, 0)
+#define LMK04832_VAL_SYSREF_MUX_CONTINUOUS		0x03
+#define LMK04832_REG_SYSREF_DIV_MSB	0x13a
+#define LMK04832_BIT_SYSREF_DIV_MSB		GENMASK(4, 0)
+#define LMK04832_REG_SYSREF_DIV_LSB	0x13b
+#define LMK04832_REG_FB_CTRL		0x13f
+#define LMK04832_BIT_PLL2_RCLK_MUX		BIT(7)
+#define LMK04832_VAL_PLL2_RCLK_MUX_OSCIN		0x00
+#define LMK04832_VAL_PLL2_RCLK_MUX_CLKIN		0x01
+#define LMK04832_BIT_PLL2_NCLK_MUX		BIT(5)
+#define LMK04832_VAL_PLL2_NCLK_MUX_PLL2_P		0x00
+#define LMK04832_VAL_PLL2_NCLK_MUX_FB_MUX		0x01
+#define LMK04832_BIT_FB_MUX_EN			BIT(0)
+#define LMK04832_REG_MAIN_PD		0x140
+#define LMK04832_BIT_PLL1_PD			BIT(7)
+#define LMK04832_BIT_VCO_LDO_PD			BIT(6)
+#define LMK04832_BIT_VCO_PD			BIT(5)
+#define LMK04832_BIT_OSCIN_PD			BIT(4)
+#define LMK04832_BIT_SYSREF_GBL_PD		BIT(3)
+#define LMK04832_BIT_SYSREF_PD			BIT(2)
+#define LMK04832_BIT_SYSREF_DDLY_PD		BIT(1)
+#define LMK04832_BIT_SYSREF_PLSR_PD		BIT(0)
+#define LMK04832_REG_SYNC		0x143
+#define LMK04832_BIT_SYNC_EN			BIT(4)
+#define LMK04832_REG_SYNC_DIS		0x144
+
+/* 0x146 - 0x14a CLKin Control */
+#define LMK04832_REG_CLKIN_SEL0		0x148
+#define LMK04832_REG_CLKIN_SEL1		0x149
+#define LMK04832_REG_CLKIN_RST		0x14a
+#define LMK04832_BIT_SDIO_RDBK_TYPE		BIT(6)
+#define LMK04832_BIT_CLKIN_SEL_MUX		GENMASK(5, 3)
+#define LMK04832_VAL_CLKIN_SEL_MUX_SPI_RDBK		0x06
+#define LMK04832_BIT_CLKIN_SEL_TYPE		GENMASK(2, 0)
+#define LMK04832_VAL_CLKIN_SEL_TYPE_OUT			0x03
+
+/* 0x14b - 0x152 Holdover */
+
+/* 0x153 - 0x15f PLL1 Configuration */
+
+/* 0x160 - 0x16e PLL2 Configuration */
+#define LMK04832_REG_PLL2_R_MSB		0x160
+#define LMK04832_BIT_PLL2_R_MSB			GENMASK(3, 0)
+#define LMK04832_REG_PLL2_R_LSB		0x161
+#define LMK04832_REG_PLL2_MISC		0x162
+#define LMK04832_BIT_PLL2_MISC_P		GENMASK(7, 5)
+#define LMK04832_BIT_PLL2_MISC_REF_2X_EN	BIT(0)
+#define LMK04832_REG_PLL2_N_CAL_0	0x163
+#define LMK04832_BIT_PLL2_N_CAL_0		GENMASK(1, 0)
+#define LMK04832_REG_PLL2_N_CAL_1	0x164
+#define LMK04832_REG_PLL2_N_CAL_2	0x165
+#define LMK04832_REG_PLL2_N_0		0x166
+#define LMK04832_BIT_PLL2_N_0			GENMASK(1, 0)
+#define LMK04832_REG_PLL2_N_1		0x167
+#define LMK04832_REG_PLL2_N_2		0x168
+#define LMK04832_REG_PLL2_DLD_CNT_LSB	0x16b
+#define LMK04832_REG_PLL2_LD		0x16e
+#define LMK04832_BIT_PLL2_LD_MUX		GENMASK(7, 3)
+#define LMK04832_VAL_PLL2_LD_MUX_PLL2_DLD		0x02
+#define LMK04832_BIT_PLL2_LD_TYPE		GENMASK(2, 0)
+#define LMK04832_VAL_PLL2_LD_TYPE_OUT_PP		0x03
+
+/* 0x16F - 0x555 Misc Registers */
+#define LMK04832_REG_PLL2_PD		0x173
+#define LMK04832_BIT_PLL2_PRE_PD		BIT(6)
+#define LMK04832_BIT_PLL2_PD			BIT(5)
+#define LMK04832_REG_PLL1R_RST		0x177
+#define LMK04832_REG_CLR_PLL_LOST	0x182
+#define LMK04832_REG_RB_PLL_LD		0x183
+#define LMK04832_REG_RB_CLK_DAC_VAL_MSB	0x184
+#define LMK04832_REG_RB_DAC_VAL_LSB	0x185
+#define LMK04832_REG_RB_HOLDOVER	0x188
+#define LMK04832_REG_SPI_LOCK		0x555
+
+enum lmk04832_device_types {
+	LMK04832,
+};
+
+/**
+ * lmk04832_device_info - Holds static device information that is specific to
+ *                        the chip revision
+ *
+ * pid:          Product Identifier
+ * maskrev:      IC version identifier
+ * num_channels: Number of available output channels (clkout count)
+ * vco0_range:   {min, max} of the VCO0 operating range (in MHz)
+ * vco1_range:   {min, max} of the VCO1 operating range (in MHz)
+ */
+struct lmk04832_device_info {
+	u16 pid;
+	u8 maskrev;
+	size_t num_channels;
+	unsigned int vco0_range[2];
+	unsigned int vco1_range[2];
+};
+
+const struct lmk04832_device_info lmk04832_device_info[] = {
+	[LMK04832] = {
+		.pid = 0x63d1, /* WARNING PROD_ID is inverted in the datasheet */
+		.maskrev = 0x70,
+		.num_channels = 14,
+		.vco0_range = { 2440, 2580 },
+		.vco1_range = { 2945, 3255 },
+	},
+};
+
+enum lmk04832_rdbk_type {
+	RDBK_CLKIN_SEL0,
+	RDBK_CLKIN_SEL1,
+	RDBK_RESET,
+};
+
+struct lmk_dclk {
+	struct lmk04832 *lmk;
+	struct clk_hw hw;
+	u8 id;
+};
+
+struct lmk_clkout {
+	struct lmk04832 *lmk;
+	struct clk_hw hw;
+	bool sysref;
+	u32 format;
+	u8 id;
+};
+
+/**
+ * struct lmk04832 - The LMK04832 device structure
+ *
+ * @dev: reference to a struct device, linked to the spi_device
+ * @regmap: struct regmap instance use to access the chip
+ * @oscin: PLL2 input clock
+ * @vco: reference to the internal VCO clock
+ * @sclk: reference to the internal sysref clock (SCLK)
+ * @vco_rate: user provided VCO rate
+ * @reset_gpio: reference to the reset GPIO
+ * @dclk: list of internal device clock references.
+ *        Each pair of clkout clocks share a single device clock (DCLKX_Y)
+ * @clkout: list of output clock references
+ * @clk_data: holds clkout related data like clk_hw* and number of clocks
+ */
+struct lmk04832 {
+	struct device *dev;
+	struct regmap *regmap;
+
+	struct clk *oscin;
+	struct clk_hw vco;
+	struct clk_hw sclk;
+	unsigned int vco_rate;
+
+	struct gpio_desc *reset_gpio;
+
+	struct lmk_dclk *dclk;
+	struct lmk_clkout *clkout;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+static bool lmk04832_regmap_rd_regs(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LMK04832_REG_RST3W ... LMK04832_REG_ID_MASKREV:
+		fallthrough;
+	case LMK04832_REG_ID_VNDR_MSB:
+		fallthrough;
+	case LMK04832_REG_ID_VNDR_LSB:
+		fallthrough;
+	case LMK04832_REG_CLKOUT_CTRL0(0) ... LMK04832_REG_PLL2_DLD_CNT_LSB:
+		fallthrough;
+	case LMK04832_REG_PLL2_LD:
+		fallthrough;
+	case LMK04832_REG_PLL2_PD:
+		fallthrough;
+	case LMK04832_REG_PLL1R_RST:
+		fallthrough;
+	case LMK04832_REG_CLR_PLL_LOST ... LMK04832_REG_RB_DAC_VAL_LSB:
+		fallthrough;
+	case LMK04832_REG_RB_HOLDOVER:
+		fallthrough;
+	case LMK04832_REG_SPI_LOCK:
+		return true;
+	default:
+		return false;
+	};
+};
+
+static bool lmk04832_regmap_wr_regs(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LMK04832_REG_RST3W:
+		fallthrough;
+	case LMK04832_REG_POWERDOWN:
+		return true;
+	case LMK04832_REG_ID_DEV_TYPE ... LMK04832_REG_ID_MASKREV:
+		fallthrough;
+	case LMK04832_REG_ID_VNDR_MSB:
+		fallthrough;
+	case LMK04832_REG_ID_VNDR_LSB:
+		return false;
+	case LMK04832_REG_CLKOUT_CTRL0(0) ... LMK04832_REG_PLL2_DLD_CNT_LSB:
+		fallthrough;
+	case LMK04832_REG_PLL2_LD:
+		fallthrough;
+	case LMK04832_REG_PLL2_PD:
+		fallthrough;
+	case LMK04832_REG_PLL1R_RST:
+		fallthrough;
+	case LMK04832_REG_CLR_PLL_LOST ... LMK04832_REG_RB_DAC_VAL_LSB:
+		fallthrough;
+	case LMK04832_REG_RB_HOLDOVER:
+		fallthrough;
+	case LMK04832_REG_SPI_LOCK:
+		return true;
+	default:
+		return false;
+	};
+};
+
+static const struct regmap_config regmap_config = {
+	.name = "lmk04832",
+	.reg_bits = 16,
+	.val_bits = 8,
+	.use_single_read = 1,
+	.use_single_write = 1,
+	.read_flag_mask = 0x80,
+	.write_flag_mask = 0x00,
+	.readable_reg = lmk04832_regmap_rd_regs,
+	.writeable_reg = lmk04832_regmap_wr_regs,
+	.cache_type = REGCACHE_NONE,
+	.max_register = LMK04832_REG_SPI_LOCK,
+};
+
+static int lmk04832_vco_is_enabled(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_MAIN_PD, &tmp);
+	if (ret)
+		return ret;
+
+	return !(FIELD_GET(LMK04832_BIT_OSCIN_PD, tmp) |
+		 FIELD_GET(LMK04832_BIT_VCO_PD, tmp) |
+		 FIELD_GET(LMK04832_BIT_VCO_LDO_PD, tmp));
+}
+
+static int lmk04832_vco_prepare(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+	int ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_PLL2_PD,
+				 LMK04832_BIT_PLL2_PRE_PD |
+				 LMK04832_BIT_PLL2_PD,
+				 0x00);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(lmk->regmap, LMK04832_REG_MAIN_PD,
+				  LMK04832_BIT_VCO_LDO_PD |
+				  LMK04832_BIT_VCO_PD |
+				  LMK04832_BIT_OSCIN_PD, 0x00);
+}
+
+static void lmk04832_vco_unprepare(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+
+	regmap_update_bits(lmk->regmap, LMK04832_REG_PLL2_PD,
+			   LMK04832_BIT_PLL2_PRE_PD | LMK04832_BIT_PLL2_PD,
+			   0xff);
+
+	/* Don't set LMK04832_BIT_OSCIN_PD since other clocks depend on it */
+	regmap_update_bits(lmk->regmap, LMK04832_REG_MAIN_PD,
+			   LMK04832_BIT_VCO_LDO_PD | LMK04832_BIT_VCO_PD, 0xff);
+}
+
+static unsigned long lmk04832_vco_recalc_rate(struct clk_hw *hw,
+					      unsigned long prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+	unsigned int pll2_p[] = {8, 2, 2, 3, 4, 5, 6, 7};
+	unsigned int pll2_n, p, pll2_r;
+	unsigned int pll2_misc;
+	unsigned long vco_rate;
+	u8 tmp[3];
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_PLL2_MISC, &pll2_misc);
+	if (ret)
+		return ret;
+
+	p = FIELD_GET(LMK04832_BIT_PLL2_MISC_P, pll2_misc);
+
+	ret = regmap_bulk_read(lmk->regmap, LMK04832_REG_PLL2_N_0, &tmp, 3);
+	if (ret)
+		return ret;
+
+	pll2_n = FIELD_PREP(0x030000, tmp[0]) |
+		 FIELD_PREP(0x00ff00, tmp[1]) |
+		 FIELD_PREP(0x0000ff, tmp[2]);
+
+	ret = regmap_bulk_read(lmk->regmap, LMK04832_REG_PLL2_R_MSB, &tmp, 2);
+	if (ret)
+		return ret;
+
+	pll2_r = FIELD_PREP(0x0f00, tmp[0]) |
+		 FIELD_PREP(0x00ff, tmp[1]);
+
+	vco_rate = (prate << FIELD_GET(LMK04832_BIT_PLL2_MISC_REF_2X_EN,
+				       pll2_misc)) * pll2_n * pll2_p[p] / pll2_r;
+
+	return vco_rate;
+};
+
+/**
+ * lmk04832_check_vco_ranges - Check requested VCO frequency against VCO ranges
+ *
+ * @lmk:   Reference to the lmk device
+ * @rate:  Desired output rate for the VCO
+ *
+ * The LMK04832 has 2 internal VCO, each with independant operating ranges.
+ * Use the device_info structure to determine which VCO to use based on rate.
+ *
+ * Returns VCO_MUX value or negative errno.
+ */
+static int lmk04832_check_vco_ranges(struct lmk04832 *lmk, unsigned long rate)
+{
+	struct spi_device *spi = to_spi_device(lmk->dev);
+	const struct lmk04832_device_info *info;
+	unsigned long mhz = rate / 1000000;
+
+	info = &lmk04832_device_info[spi_get_device_id(spi)->driver_data];
+
+	if (mhz >= info->vco0_range[0] && mhz <= info->vco0_range[1]) {
+		return LMK04832_VAL_VCO_MUX_VCO0;
+	} else if (mhz >= info->vco1_range[0] && mhz <= info->vco1_range[1]) {
+		return LMK04832_VAL_VCO_MUX_VCO1;
+	} else {
+		dev_err(lmk->dev, "%lu Hz is out of VCO ranges\n", rate);
+		return -ERANGE;
+	}
+}
+
+/**
+ * lmk04832_calc_pll2_params - Get PLL2 parameters used to set the VCO frequency
+ *
+ * @prate: parent rate to the PLL2, usually OSCin
+ * @rate:  Desired output rate for the VCO
+ * @n:     reference to PLL2_N
+ * @p:     reference to PLL2_P
+ * @r:     reference to PLL2_R
+ *
+ * This functions assumes LMK04832_BIT_PLL2_MISC_REF_2X_EN is set since it is
+ * recommended in the datasheet because a higher phase detector frequencies
+ * makes the design of wider loop bandwidth filters possible.
+ *
+ * the VCO rate can be calculated using the following expression:
+ *
+ *	VCO = OSCin * 2 * PLL2_N * PLL2_P / PLL2_R
+ *
+ * Returns vco rate or negative errno.
+ */
+static long lmk04832_calc_pll2_params(unsigned long prate, unsigned long rate,
+				      unsigned int *n, unsigned int *p,
+				      unsigned int *r)
+{
+	unsigned int pll2_n, pll2_p, pll2_r;
+	unsigned long num, div;
+
+	/* Set PLL2_P to a fixed value to simplify optimizations */
+	pll2_p = 2;
+
+	div = gcd(rate, prate);
+
+	num = DIV_ROUND_CLOSEST(rate, div);
+	pll2_r = DIV_ROUND_CLOSEST(prate, div);
+
+	if (num > 4) {
+		pll2_n = num >> 2;
+	} else {
+		pll2_r = pll2_r << 2;
+		pll2_n = num;
+	}
+
+	if (pll2_n < 1 || pll2_n > 0x03ffff)
+		return -EINVAL;
+	if (pll2_r < 1 || pll2_r > 0xfff)
+		return -EINVAL;
+
+	*n = pll2_n;
+	*p = pll2_p;
+	*r = pll2_r;
+
+	return DIV_ROUND_CLOSEST(prate * 2 * pll2_p * pll2_n, pll2_r);
+}
+
+static long lmk04832_vco_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+	unsigned int n, p, r;
+	long vco_rate;
+	int ret;
+
+	ret = lmk04832_check_vco_ranges(lmk, rate);
+	if (rate < 0)
+		return ret;
+
+	vco_rate = lmk04832_calc_pll2_params(*prate, rate, &n, &p, &r);
+	if (vco_rate < 0) {
+		dev_err(lmk->dev, "PLL2 parmeters out of range\n");
+		return vco_rate;
+	}
+
+	if (rate != vco_rate)
+		return -EINVAL;
+
+	return vco_rate;
+};
+
+static int lmk04832_vco_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, vco);
+	unsigned int n, p, r;
+	long vco_rate;
+	int vco_mux;
+	int ret;
+
+	vco_mux = lmk04832_check_vco_ranges(lmk, rate);
+	if (vco_mux < 0)
+		return vco_mux;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_VCO_OSCOUT,
+				 LMK04832_BIT_VCO_MUX,
+				 FIELD_PREP(LMK04832_BIT_VCO_MUX, vco_mux));
+	if (ret)
+		return ret;
+
+	vco_rate = lmk04832_calc_pll2_params(prate, rate, &n, &p, &r);
+	if (vco_rate < 0) {
+		dev_err(lmk->dev, "failed to determine PLL2 parmeters\n");
+		return vco_rate;
+	}
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_PLL2_R_MSB,
+				 LMK04832_BIT_PLL2_R_MSB,
+				 FIELD_GET(0x000700, r));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(lmk->regmap, LMK04832_REG_PLL2_R_LSB,
+			   FIELD_GET(0x0000ff, r));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_PLL2_MISC,
+				 LMK04832_BIT_PLL2_MISC_P,
+				 FIELD_PREP(LMK04832_BIT_PLL2_MISC_P, p));
+	if (ret)
+		return ret;
+
+	/*
+	 * PLL2_N registers must be programmed after other PLL2 dividers are
+	 * programed to ensure proper VCO frequency calibration
+	 */
+	ret = regmap_write(lmk->regmap, LMK04832_REG_PLL2_N_0,
+			   FIELD_GET(0x030000, n));
+	if (ret)
+		return ret;
+	ret = regmap_write(lmk->regmap, LMK04832_REG_PLL2_N_1,
+			   FIELD_GET(0x00ff00, n));
+	if (ret)
+		return ret;
+
+	return regmap_write(lmk->regmap, LMK04832_REG_PLL2_N_2,
+			    FIELD_GET(0x0000ff, n));
+};
+
+static const struct clk_ops lmk04832_vco_ops = {
+	.is_enabled = lmk04832_vco_is_enabled,
+	.prepare = lmk04832_vco_prepare,
+	.unprepare = lmk04832_vco_unprepare,
+	.recalc_rate = lmk04832_vco_recalc_rate,
+	.round_rate = lmk04832_vco_round_rate,
+	.set_rate = lmk04832_vco_set_rate,
+};
+
+/*
+ * lmk04832_register_vco - Initialize the internal VCO and clock distribution
+ *                         path in PLL2 single loop mode.
+ */
+static int lmk04832_register_vco(struct lmk04832 *lmk)
+{
+	const char *parent_names[1];
+	struct clk_init_data init;
+	int ret;
+
+	init.name = "lmk-vco";
+	parent_names[0] = __clk_get_name(lmk->oscin);
+	init.parent_names = parent_names;
+
+	init.ops = &lmk04832_vco_ops;
+	init.num_parents = 1;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_VCO_OSCOUT,
+				 LMK04832_BIT_VCO_MUX,
+				 FIELD_PREP(LMK04832_BIT_VCO_MUX,
+					    LMK04832_VAL_VCO_MUX_VCO1));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_FB_CTRL,
+				 LMK04832_BIT_PLL2_RCLK_MUX |
+				 LMK04832_BIT_PLL2_NCLK_MUX,
+				 FIELD_PREP(LMK04832_BIT_PLL2_RCLK_MUX,
+					    LMK04832_VAL_PLL2_RCLK_MUX_OSCIN)|
+				 FIELD_PREP(LMK04832_BIT_PLL2_NCLK_MUX,
+					    LMK04832_VAL_PLL2_NCLK_MUX_PLL2_P));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_PLL2_MISC,
+				 LMK04832_BIT_PLL2_MISC_REF_2X_EN,
+				 LMK04832_BIT_PLL2_MISC_REF_2X_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(lmk->regmap, LMK04832_REG_PLL2_LD,
+			   FIELD_PREP(LMK04832_BIT_PLL2_LD_MUX,
+				      LMK04832_VAL_PLL2_LD_MUX_PLL2_DLD) |
+			   FIELD_PREP(LMK04832_BIT_PLL2_LD_TYPE,
+				      LMK04832_VAL_PLL2_LD_TYPE_OUT_PP));
+	if (ret)
+		return ret;
+
+	lmk->vco.init = &init;
+	return devm_clk_hw_register(lmk->dev, &lmk->vco);
+}
+
+static int lmk04832_sclk_is_enabled(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_MAIN_PD, &tmp);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(LMK04832_BIT_SYSREF_PD, tmp);
+}
+
+static int lmk04832_sclk_prepare(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+
+	return regmap_update_bits(lmk->regmap, LMK04832_REG_MAIN_PD,
+				  LMK04832_BIT_SYSREF_PD, 0x00);
+}
+
+static void lmk04832_sclk_unprepare(struct clk_hw *hw)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+
+	regmap_update_bits(lmk->regmap, LMK04832_REG_MAIN_PD,
+			   LMK04832_BIT_SYSREF_PD, LMK04832_BIT_SYSREF_PD);
+}
+
+static unsigned long lmk04832_sclk_recalc_rate(struct clk_hw *hw,
+					       unsigned long prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+	unsigned int sysref_div;
+	u8 tmp[2];
+	int ret;
+
+	ret = regmap_bulk_read(lmk->regmap, LMK04832_REG_SYSREF_DIV_MSB, &tmp, 2);
+	if (ret)
+		return ret;
+
+	sysref_div = FIELD_GET(LMK04832_BIT_SYSREF_DIV_MSB, tmp[0]) << 8 |
+		tmp[1];
+
+	return DIV_ROUND_CLOSEST(prate, sysref_div);
+}
+
+static long lmk04832_sclk_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+	unsigned long sclk_rate;
+	unsigned int sysref_div;
+
+	sysref_div = DIV_ROUND_CLOSEST(*prate, rate);
+	sclk_rate = DIV_ROUND_CLOSEST(*prate, sysref_div);
+
+	if (sysref_div < 0x07 || sysref_div > 0x1fff) {
+		dev_err(lmk->dev, "SYSREF divider out of range\n");
+		return -EINVAL;
+	}
+
+	if (rate != sclk_rate)
+		return -EINVAL;
+
+	return sclk_rate;
+}
+
+static int lmk04832_sclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
+{
+	struct lmk04832 *lmk = container_of(hw, struct lmk04832, sclk);
+	unsigned int sysref_div;
+	int ret;
+
+	sysref_div = DIV_ROUND_CLOSEST(prate, rate);
+
+	if (sysref_div < 0x07 || sysref_div > 0x1fff) {
+		dev_err(lmk->dev, "SYSREF divider out of range\n");
+		return -EINVAL;
+	}
+
+	ret = regmap_write(lmk->regmap, LMK04832_REG_SYSREF_DIV_MSB,
+			   FIELD_GET(0x1f00, sysref_div));
+	if (ret)
+		return ret;
+
+	return regmap_write(lmk->regmap, LMK04832_REG_SYSREF_DIV_LSB,
+			    FIELD_GET(0x00ff, sysref_div));
+}
+
+static const struct clk_ops lmk04832_sclk_ops = {
+	.is_enabled = lmk04832_sclk_is_enabled,
+	.prepare = lmk04832_sclk_prepare,
+	.unprepare = lmk04832_sclk_unprepare,
+	.recalc_rate = lmk04832_sclk_recalc_rate,
+	.round_rate = lmk04832_sclk_round_rate,
+	.set_rate = lmk04832_sclk_set_rate,
+};
+
+static int lmk04832_register_sclk(struct lmk04832 *lmk)
+{
+	const char *parent_names[1];
+	struct clk_init_data init;
+	int ret;
+
+	init.name = "lmk-sclk";
+	parent_names[0] = clk_hw_get_name(&lmk->vco);
+	init.parent_names = parent_names;
+
+	init.ops = &lmk04832_sclk_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.num_parents = 1;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_SYSREF_OUT,
+				 LMK04832_BIT_SYSREF_MUX,
+				 FIELD_PREP(LMK04832_BIT_SYSREF_MUX,
+					    LMK04832_VAL_SYSREF_MUX_CONTINUOUS));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_MAIN_PD,
+				 LMK04832_BIT_SYSREF_PLSR_PD,
+				 LMK04832_BIT_SYSREF_PLSR_PD);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_SYNC,
+				 LMK04832_BIT_SYNC_EN, 0xff);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(lmk->regmap, LMK04832_REG_SYNC_DIS, 0xff);
+	if (ret)
+		return ret;
+
+	lmk->sclk.init = &init;
+	return devm_clk_hw_register(lmk->dev, &lmk->sclk);
+}
+
+static int lmk04832_dclk_is_enabled(struct clk_hw *hw)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_CTRL3(dclk->id),
+			  &tmp);
+	if (ret)
+		return ret;
+
+	return !FIELD_GET(LMK04832_BIT_DCLKX_Y_PD, tmp);
+}
+
+static int lmk04832_dclk_prepare(struct clk_hw *hw)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+
+	return regmap_update_bits(lmk->regmap,
+				  LMK04832_REG_CLKOUT_CTRL3(dclk->id),
+				  LMK04832_BIT_DCLKX_Y_PD, 0x00);
+}
+
+static void lmk04832_dclk_unprepare(struct clk_hw *hw)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+
+	regmap_update_bits(lmk->regmap,
+			   LMK04832_REG_CLKOUT_CTRL3(dclk->id),
+			   LMK04832_BIT_DCLKX_Y_PD, 0xff);
+}
+
+static unsigned long lmk04832_dclk_recalc_rate(struct clk_hw *hw,
+					       unsigned long prate)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+	unsigned int dclk_div;
+	unsigned int lsb, msb;
+	unsigned long rate;
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_CTRL0(dclk->id),
+			  &lsb);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_CTRL2(dclk->id),
+			  &msb);
+	if (ret)
+		return ret;
+
+	dclk_div = FIELD_GET(LMK04832_BIT_DCLK_DIV_MSB, msb) << 8 | lsb;
+	rate = DIV_ROUND_CLOSEST(prate, dclk_div);
+
+	return rate;
+};
+
+static long lmk04832_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+	unsigned long dclk_rate;
+	unsigned int dclk_div;
+
+	dclk_div = DIV_ROUND_CLOSEST(*prate, rate);
+	dclk_rate = DIV_ROUND_CLOSEST(*prate, dclk_div);
+
+	if (dclk_div < 1 || dclk_div > 0x3ff) {
+		dev_err(lmk->dev, "%s_div out of range\n", clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	if (rate != dclk_rate)
+		return -EINVAL;
+
+	return dclk_rate;
+};
+
+static int lmk04832_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
+{
+	struct lmk_dclk *dclk = container_of(hw, struct lmk_dclk, hw);
+	struct lmk04832 *lmk = dclk->lmk;
+	unsigned int dclk_div;
+	int ret;
+
+	dclk_div = DIV_ROUND_CLOSEST(prate, rate);
+
+	if (dclk_div > 0x3ff) {
+		dev_err(lmk->dev, "%s_div out of range\n", clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	/* Enable Duty Cycle Corretion */
+	if (dclk_div == 1) {
+		ret = regmap_update_bits(lmk->regmap,
+					 LMK04832_REG_CLKOUT_CTRL3(dclk->id),
+					 LMK04832_BIT_DCLKX_Y_DCC,
+					 FIELD_PREP(LMK04832_BIT_DCLKX_Y_DCC, 1));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_write(lmk->regmap, LMK04832_REG_CLKOUT_CTRL0(dclk->id),
+			   FIELD_GET(0x0ff, dclk_div));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(lmk->regmap,
+				  LMK04832_REG_CLKOUT_CTRL2(dclk->id),
+				  LMK04832_BIT_DCLK_DIV_MSB,
+				  FIELD_GET(0x300, dclk_div));
+};
+
+static const struct clk_ops lmk04832_dclk_ops = {
+	.is_enabled = lmk04832_dclk_is_enabled,
+	.prepare = lmk04832_dclk_prepare,
+	.unprepare = lmk04832_dclk_unprepare,
+	.recalc_rate = lmk04832_dclk_recalc_rate,
+	.round_rate = lmk04832_dclk_round_rate,
+	.set_rate = lmk04832_dclk_set_rate,
+};
+
+static int lmk04832_clkout_is_enabled(struct clk_hw *hw)
+{
+	struct lmk_clkout *clkout = container_of(hw, struct lmk_clkout, hw);
+	struct lmk04832 *lmk = clkout->lmk;
+	unsigned int clkoutx_y_pd;
+	unsigned int sclkx_y_pd;
+	unsigned int tmp;
+	u32 enabled;
+	int ret;
+	u8 fmt;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_CTRL2(clkout->id),
+			  &clkoutx_y_pd);
+	if (ret)
+		return ret;
+
+	enabled = !FIELD_GET(LMK04832_BIT_CLKOUTX_Y_PD, clkoutx_y_pd);
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_SRC_MUX(clkout->id),
+			  &tmp);
+	if (ret)
+		return ret;
+
+	if (FIELD_GET(LMK04832_BIT_CLKOUT_SRC_MUX, tmp)) {
+		ret = regmap_read(lmk->regmap,
+				  LMK04832_REG_CLKOUT_CTRL4(clkout->id),
+				  &sclkx_y_pd);
+		if (ret)
+			return ret;
+
+		enabled = enabled && !FIELD_GET(LMK04832_BIT_SCLK_PD, sclkx_y_pd);
+	}
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_FMT(clkout->id),
+			  &tmp);
+	if (ret)
+		return ret;
+
+	if (clkout->id % 2)
+		fmt = FIELD_GET(0xf0, tmp);
+	else
+		fmt = FIELD_GET(0x0f, tmp);
+
+	return enabled && !fmt;
+}
+
+static int lmk04832_clkout_prepare(struct clk_hw *hw)
+{
+	struct lmk_clkout *clkout = container_of(hw, struct lmk_clkout, hw);
+	struct lmk04832 *lmk = clkout->lmk;
+	unsigned int tmp;
+	int ret;
+
+	if (clkout->format == LMK04832_VAL_CLKOUT_FMT_POWERDOWN)
+		dev_err(lmk->dev, "prepared %s but format is powerdown\n",
+			clk_hw_get_name(hw));
+
+	ret = regmap_update_bits(lmk->regmap,
+				 LMK04832_REG_CLKOUT_CTRL2(clkout->id),
+				 LMK04832_BIT_CLKOUTX_Y_PD, 0x00);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_SRC_MUX(clkout->id),
+			  &tmp);
+	if (ret)
+		return ret;
+
+	if (FIELD_GET(LMK04832_BIT_CLKOUT_SRC_MUX, tmp)) {
+		ret = regmap_update_bits(lmk->regmap,
+					 LMK04832_REG_CLKOUT_CTRL4(clkout->id),
+					 LMK04832_BIT_SCLK_PD, 0x00);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(lmk->regmap,
+				  LMK04832_REG_CLKOUT_FMT(clkout->id),
+				  LMK04832_BIT_CLKOUT_FMT(clkout->id),
+				  clkout->format << 4 * (clkout->id % 2));
+}
+
+static void lmk04832_clkout_unprepare(struct clk_hw *hw)
+{
+	struct lmk_clkout *clkout = container_of(hw, struct lmk_clkout, hw);
+	struct lmk04832 *lmk = clkout->lmk;
+
+	regmap_update_bits(lmk->regmap, LMK04832_REG_CLKOUT_FMT(clkout->id),
+			   LMK04832_BIT_CLKOUT_FMT(clkout->id),
+			   0x00);
+}
+
+static int lmk04832_clkout_set_parent(struct clk_hw *hw, uint8_t index)
+{
+	struct lmk_clkout *clkout = container_of(hw, struct lmk_clkout, hw);
+	struct lmk04832 *lmk = clkout->lmk;
+
+	return regmap_update_bits(lmk->regmap,
+				  LMK04832_REG_CLKOUT_SRC_MUX(clkout->id),
+				  LMK04832_BIT_CLKOUT_SRC_MUX,
+				  FIELD_PREP(LMK04832_BIT_CLKOUT_SRC_MUX,
+					     index));
+}
+
+static uint8_t lmk04832_clkout_get_parent(struct clk_hw *hw)
+{
+	struct lmk_clkout *clkout = container_of(hw, struct lmk_clkout, hw);
+	struct lmk04832 *lmk = clkout->lmk;
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(lmk->regmap, LMK04832_REG_CLKOUT_SRC_MUX(clkout->id),
+			  &tmp);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(LMK04832_BIT_CLKOUT_SRC_MUX, tmp);
+}
+
+static const struct clk_ops lmk04832_clkout_ops = {
+	.is_enabled = lmk04832_clkout_is_enabled,
+	.prepare = lmk04832_clkout_prepare,
+	.unprepare = lmk04832_clkout_unprepare,
+	.set_parent = lmk04832_clkout_set_parent,
+	.get_parent = lmk04832_clkout_get_parent,
+};
+
+static int lmk04832_register_clkout(struct lmk04832 *lmk, const int num)
+{
+	char name[] = "lmk-clkoutXX";
+	char dclk_name[] = "lmk-dclkXX_YY";
+	const char *parent_names[2];
+	struct clk_init_data init;
+	int dclk_num = num / 2;
+	int ret;
+
+	if (num % 2 == 0) {
+		sprintf(dclk_name, "lmk-dclk%02d_%02d", num, num + 1);
+		init.name = dclk_name;
+		parent_names[0] = clk_hw_get_name(&lmk->vco);
+		init.ops = &lmk04832_dclk_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		init.num_parents = 1;
+
+		lmk->dclk[dclk_num].id = num;
+		lmk->dclk[dclk_num].lmk = lmk;
+		lmk->dclk[dclk_num].hw.init = &init;
+
+		ret = devm_clk_hw_register(lmk->dev, &lmk->dclk[dclk_num].hw);
+		if (ret)
+			return ret;
+	} else {
+		sprintf(dclk_name, "lmk-dclk%02d_%02d", num - 1, num);
+	}
+
+	if (of_property_read_string_index(lmk->dev->of_node,
+					  "clock-output-names",
+					  num, &init.name)) {
+		sprintf(name, "lmk-clkout%02d", num);
+		init.name = name;
+	}
+
+	parent_names[0] = dclk_name;
+	parent_names[1] = clk_hw_get_name(&lmk->sclk);
+	init.parent_names = parent_names;
+	init.ops = &lmk04832_clkout_ops;
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+	init.num_parents = ARRAY_SIZE(parent_names);
+
+	lmk->clkout[num].id = num;
+	lmk->clkout[num].lmk = lmk;
+	lmk->clkout[num].hw.init = &init;
+	lmk->clk_data->hws[num] = &lmk->clkout[num].hw;
+
+	/* Set initial parent */
+	regmap_update_bits(lmk->regmap,
+			   LMK04832_REG_CLKOUT_SRC_MUX(num),
+			   LMK04832_BIT_CLKOUT_SRC_MUX,
+			   FIELD_PREP(LMK04832_BIT_CLKOUT_SRC_MUX,
+				      lmk->clkout[num].sysref));
+
+	return devm_clk_hw_register(lmk->dev, &lmk->clkout[num].hw);
+}
+
+static int lmk04832_set_spi_rdbk(const struct lmk04832 *lmk, const int rdbk_pin)
+{
+	int reg;
+	int ret;
+
+	dev_info(lmk->dev, "setting up 4-wire mode\n");
+	ret = regmap_write(lmk->regmap, LMK04832_REG_RST3W,
+			   LMK04832_BIT_SPI_3WIRE_DIS);
+	if (ret)
+		return ret;
+
+	switch (rdbk_pin) {
+	case RDBK_CLKIN_SEL0:
+		reg = LMK04832_REG_CLKIN_SEL0;
+		break;
+	case RDBK_CLKIN_SEL1:
+		reg = LMK04832_REG_CLKIN_SEL1;
+		break;
+	case RDBK_RESET:
+		reg = LMK04832_REG_CLKIN_RST;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_write(lmk->regmap, reg,
+			    FIELD_PREP(LMK04832_BIT_CLKIN_SEL_MUX,
+				       LMK04832_VAL_CLKIN_SEL_MUX_SPI_RDBK) |
+			    FIELD_PREP(LMK04832_BIT_CLKIN_SEL_TYPE,
+				       LMK04832_VAL_CLKIN_SEL_TYPE_OUT));
+}
+
+static int lmk04832_probe(struct spi_device *spi)
+{
+	const struct lmk04832_device_info *info;
+	int rdbk_pin = RDBK_CLKIN_SEL1;
+	struct device_node *child;
+	struct lmk04832 *lmk;
+	u8 tmp[3];
+	int ret;
+	int i;
+
+	info = &lmk04832_device_info[spi_get_device_id(spi)->driver_data];
+
+	lmk = devm_kzalloc(&spi->dev, sizeof(struct lmk04832), GFP_KERNEL);
+	if (!lmk)
+		return -ENOMEM;
+
+	lmk->dev = &spi->dev;
+
+	lmk->oscin = devm_clk_get(lmk->dev, "oscin");
+	if (IS_ERR(lmk->oscin)) {
+		dev_err(lmk->dev, "failed to get oscin clock\n");
+		return PTR_ERR(lmk->oscin);
+	}
+
+	ret = clk_prepare_enable(lmk->oscin);
+	if (ret)
+		return ret;
+
+	lmk->reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset",
+						  GPIOD_OUT_LOW);
+
+	lmk->dclk = devm_kcalloc(lmk->dev, info->num_channels >> 1,
+				 sizeof(struct lmk_dclk), GFP_KERNEL);
+	if (IS_ERR(lmk->dclk)) {
+		ret = PTR_ERR(lmk->dclk);
+		goto err_disable_oscin;
+	}
+
+	lmk->clkout = devm_kcalloc(lmk->dev, info->num_channels,
+				   sizeof(*lmk->clkout), GFP_KERNEL);
+	if (IS_ERR(lmk->clkout)) {
+		ret = PTR_ERR(lmk->clkout);
+		goto err_disable_oscin;
+	}
+
+	lmk->clk_data = devm_kzalloc(lmk->dev, struct_size(lmk->clk_data, hws,
+							   info->num_channels),
+				     GFP_KERNEL);
+	if (IS_ERR(lmk->clk_data)) {
+		ret = PTR_ERR(lmk->clk_data);
+		goto err_disable_oscin;
+	}
+
+	device_property_read_u32(lmk->dev, "ti,vco-hz", &lmk->vco_rate);
+
+	for_each_child_of_node(lmk->dev->of_node, child) {
+		int reg;
+
+		ret = of_property_read_u32(child, "reg", &reg);
+		if (ret) {
+			dev_err(lmk->dev, "missing reg property in child: %s\n",
+				child->full_name);
+			goto err_disable_oscin;
+		}
+
+		of_property_read_u32(child, "ti,clkout-fmt",
+				     &lmk->clkout[reg].format);
+
+		if (lmk->clkout[reg].format >= 0x0a && reg % 2 == 0
+		    && reg != 8 && reg != 10)
+			dev_err(lmk->dev, "invalid format for clkout%02d\n",
+				reg);
+
+		lmk->clkout[reg].sysref =
+			of_property_read_bool(child, "ti,clkout-sysref");
+	};
+
+	lmk->regmap = devm_regmap_init_spi(spi, &regmap_config);
+	if (IS_ERR(lmk->regmap)) {
+		dev_err(lmk->dev, "%s: regmap allocation failed: %ld\n",
+
+			__func__, PTR_ERR(lmk->regmap));
+		ret = PTR_ERR(lmk->regmap);
+		goto err_disable_oscin;
+	}
+
+	regmap_write(lmk->regmap, LMK04832_REG_RST3W, LMK04832_BIT_RESET);
+
+	if (!(spi->mode & SPI_3WIRE)) {
+		device_property_read_u32(lmk->dev, "ti,spi-4wire-rdbk",
+					 &rdbk_pin);
+		ret = lmk04832_set_spi_rdbk(lmk, rdbk_pin);
+		if (ret)
+			goto err_disable_oscin;
+	}
+
+	regmap_bulk_read(lmk->regmap, LMK04832_REG_ID_PROD_MSB, &tmp, 3);
+	if ((tmp[0] << 8 | tmp[1]) != info->pid || tmp[2] != info->maskrev) {
+		dev_err(lmk->dev, "unsupported device type: pid 0x%04x, maskrev 0x%02x\n",
+			tmp[0] << 8 | tmp[1], tmp[2]);
+		ret = -EINVAL;
+		goto err_disable_oscin;
+	}
+
+	ret = lmk04832_register_vco(lmk);
+	if (ret) {
+		dev_err(lmk->dev, "failed to init device clock path\n");
+		goto err_disable_oscin;
+	}
+
+	if (lmk->vco_rate) {
+		dev_info(lmk->dev, "setting VCO rate to %u Hz\n", lmk->vco_rate);
+		ret = clk_set_rate(lmk->vco.clk, lmk->vco_rate);
+		if (ret) {
+			dev_err(lmk->dev, "failed to set VCO rate\n");
+			goto err_disable_vco;
+		}
+	}
+
+	ret = lmk04832_register_sclk(lmk);
+	if (ret) {
+		dev_err(lmk->dev, "failed to init SYNC/SYSREF clock path\n");
+		goto err_disable_vco;
+	}
+
+	for (i = 0; i < info->num_channels; i++) {
+		ret = lmk04832_register_clkout(lmk, i);
+		if (ret) {
+			dev_err(lmk->dev, "failed to register clk %d\n", i);
+			goto err_disable_vco;
+		}
+	}
+
+	lmk->clk_data->num = info->num_channels;
+	ret = of_clk_add_hw_provider(lmk->dev->of_node, of_clk_hw_onecell_get,
+				     lmk->clk_data);
+	if (ret) {
+		dev_err(lmk->dev, "failed to add provider (%d)\n", ret);
+		goto err_disable_vco;
+	}
+
+	spi_set_drvdata(spi, lmk);
+
+	return 0;
+
+err_disable_vco:
+	clk_disable_unprepare(lmk->vco.clk);
+
+err_disable_oscin:
+	clk_disable_unprepare(lmk->oscin);
+
+	return ret;
+}
+
+static int lmk04832_remove(struct spi_device *spi)
+{
+	struct lmk04832 *lmk = spi_get_drvdata(spi);
+
+	clk_disable_unprepare(lmk->oscin);
+	of_clk_del_provider(spi->dev.of_node);
+
+	return 0;
+}
+static const struct spi_device_id lmk04832_id[] = {
+	{ "lmk04832", LMK04832 },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, lmk04832_id);
+
+static const struct of_device_id lmk04832_of_id[] = {
+	{ .compatible = "ti,lmk04832" },
+	{},
+};
+
+static struct spi_driver lmk04832_driver = {
+	.driver = {
+		.name	= "lmk04832",
+	},
+	.probe		= lmk04832_probe,
+	.remove		= lmk04832_remove,
+	.id_table	= lmk04832_id,
+};
+module_spi_driver(lmk04832_driver);
+
+MODULE_AUTHOR("Liam Beguin <lvb@xiphos.com>");
+MODULE_DESCRIPTION("Texas Instruments LMK04832");
+MODULE_LICENSE("GPL v2");
-- 
2.30.1.489.g328c10930387


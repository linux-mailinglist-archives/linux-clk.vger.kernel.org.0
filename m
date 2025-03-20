Return-Path: <linux-clk+bounces-19632-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E02A6A6C9
	for <lists+linux-clk@lfdr.de>; Thu, 20 Mar 2025 14:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88CBA980730
	for <lists+linux-clk@lfdr.de>; Thu, 20 Mar 2025 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7A322577D;
	Thu, 20 Mar 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJAB3GxT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0B224B1C;
	Thu, 20 Mar 2025 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742475711; cv=none; b=RqNik7MHUyPpx58HOMEyunNeJPvJcSPariF+XlUL6AxXwrVDMM3oCkL5ZKs7BKTbH1oQvHkJ0foTU9hnXW7/1FbjGvfqKdEhWyi22UMWC+zYNI9RtpaM/p07F1Xn+QmVXJJweyqFBiohEf/5aPGe3bi/sAwh0adEq+jnsatwJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742475711; c=relaxed/simple;
	bh=qS4ryP6jBuiFMl4ojYVikNLV3h2ESuKSmolB4u89eFI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SO5g2qIypxT4ON9Wdy0YjIAGmmIyUlIhOVoag6LpkcEhDzc6T4Bk1MDJR7IHIfkAW8YUjM0y5liJVFmSFsDy+ErgvQdfCMQ9zQYXohlI1QAM3UmlpKCwKtnK0FsiNqB8vkbWQs2/ndiakoYiy/LANpmpDQqIkg6uQttuYGBEGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJAB3GxT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so351861f8f.0;
        Thu, 20 Mar 2025 06:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475705; x=1743080505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+zeHfM2s5nyXBkANIJRscsnuLHTK8RBHZgXCdIfUm8=;
        b=QJAB3GxTUk9GqqrQK1Uw59GKVPsnP/Ny3us1l9/eC1RlQD68woIz9Jm5przPkxiBI0
         cvHCVWLrHDqCpfUaW0lWMkRSX1Tt9sJHaONwwHcDgaNCvEbUYdDQxb30YdEkRNfNTSQE
         Bl5niPnIBm9ikACeSLKiCGnA5ySGdi5DqMVKqhB5wYYMUV+vbgbkcx5C/b5taOyfse+u
         tnPlggkZCISszTEP3K+4cByF3Bx6jPpbagXtZbzwNRWI5KqetkjWB6AY6rvqTJV6h4pz
         nSB9CHUARcAExsl+90Zsc7MW4HW9bAjN5RgwhQnIuGXwGKZA3oVbDqcQ5Fnz8HhgrxSH
         1X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475705; x=1743080505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+zeHfM2s5nyXBkANIJRscsnuLHTK8RBHZgXCdIfUm8=;
        b=WiRnzIDh6wr4wM2I+4UqtTTr79HC922lV6rShn72P8i50N8PHXchyPIvlBwFp28fD9
         7Cv0f0BDEDo0LnT98cAcyUFJqGSq8BmbM+nzbgoOz9OaU1mkFsgq9ep28hj+IO1cMC4S
         v8uR3zoVMETY/py/0ZYFA9PJi1zGwwYuT2ZkZG8qG15G5MQkSVuR+9iRU4QjjbpaA4ZC
         2YQJhUmSX6UhCKkWjAs0Q/lQoweGuq/2suM9ZlYF4FzZB8pY6UupMANdU5gWmfjn+xmO
         I8v5fa2IQHVfY03yPBJOWCu8Kgl6CGwy0PJ2ynzrTb/g15m9S722TUm/FV7vFhzErXph
         UggQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9TsngnPSCFRD/jbsuGDnKKGc2awuJRLjQsmsRH/QiwvcynO0tMvGslYsWL8ezFhU52Ot8m64MJqgx@vger.kernel.org, AJvYcCW+PS23w9TIYYO8rikFtPufqBjCzg0RL1fHQJh+2R1CtJX5C/G2sD2zRPGFzwCjzUHOC+xvRwobOIQU@vger.kernel.org, AJvYcCWJRGjxKQ9k7CnOcnlpwgjfit6Ar1e4XpEzVjc81Vd63VyvBRp6ZdZ56LFNtHbtNaeWXcbaMGM37ZebMxB9@vger.kernel.org, AJvYcCWcdhFYwhsQeVHeiwb3zYaOX8m4924SbSdmOjJIU49dwKkxEq4xe4JUoj6CViUncXt9TeP1Wn4MuauR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ihoYobKB5FuDHbd6ajSFEcJAN8UOpxejKVwH9lnynpPrf86/
	BtlapdwqDMWWGaOU80d68e8i0KCJfBtRv6ZVZJ8Vk/Qr/wYMJxHD
X-Gm-Gg: ASbGnctaO49G/cbzQ/Z6fwA/S/p+Y6114CIk98klUZ3lQORFF7yyNWNzW7l6Y8fK/my
	YXpQt8CuD7kCAkqxbt6Sv4S3srxiwWcukXce6JidCGuXeIYukNJ6Xe9riOLkeLpR+C3Wt59p8JK
	atQDZna8R5UAoJ3WT7SoTwtVzZkBCvHtrRTLg0FAc9WeUvYG1Ptnj2kN+4TkZe27FDV6eflmOip
	Q9vf32YKKCSuywK03MbIVcMLeSIQmJivF7WxlWVfQg18gEvLKt1hTbgAP02lZDZiB+2cuaxuZJI
	MLyQTaG0gZynKk1+fuW0gUMcUpf6p5VCY1Gvvy7vB/6+CPPyDiK7KqHaY7JMAUWSc7MafkkEXZa
	8kGQF+b60E+ETYw==
X-Google-Smtp-Source: AGHT+IFySmYEuIQkHV3hcdE8d9b1dxUxSOmTU/YQwWAlYd4l6DoE/UxiHP7IMAhJSjVJtbdlQGk19Q==
X-Received: by 2002:a05:6000:2cd:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-399739bc8c0mr7028513f8f.14.1742475703674;
        Thu, 20 Mar 2025 06:01:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 08/11] phy: move Airoha PCIe PHY driver to dedicated directory
Date: Thu, 20 Mar 2025 14:00:31 +0100
Message-ID: <20250320130054.4804-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To keep the generic PHY directory tidy, move the PCIe PHY driver to a
dedicated directory.

This is also in preparation for support of the Airoha USB PHY driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                               |    4 +-
 drivers/phy/Kconfig                       |   11 +-
 drivers/phy/Makefile                      |    5 +-
 drivers/phy/airoha/Kconfig                |   13 +
 drivers/phy/airoha/Makefile               |    3 +
 drivers/phy/airoha/phy-airoha-pcie-regs.h |  494 ++++++++
 drivers/phy/airoha/phy-airoha-pcie.c      | 1290 +++++++++++++++++++++
 7 files changed, 1806 insertions(+), 14 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-airoha-pcie.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c4a374da2b12..4e11db5d203a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -733,8 +733,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-airoha-pcie-regs.h
+F:	drivers/phy/airoha/phy-airoha-pcie.c
 
 AIROHA SCU SSR DRIVER
 M:	Christian Marangi <ansuelsmth@gmail.com>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe998ec..7f9f5b786643 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -72,16 +72,6 @@ config PHY_CAN_TRANSCEIVER
 	  functional modes using gpios and sets the attribute max link
 	  rate, for CAN drivers.
 
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
 config PHY_NXP_PTN3222
 	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
 	depends on I2C
@@ -93,6 +83,7 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442acc75..9ab557db59e6 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,9 +10,10 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
+
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
-obj-y					+= allwinner/	\
+obj-y					+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..70b7eac4a2bf
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha devices
+#
+config PHY_AIROHA_PCIE
+	tristate "Airoha PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..3222f749546b
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
diff --git a/drivers/phy/airoha/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-airoha-pcie-regs.h
new file mode 100644
index 000000000000..b938a7b468fe
--- /dev/null
+++ b/drivers/phy/airoha/phy-airoha-pcie-regs.h
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+
+#ifndef _PHY_AIROHA_PCIE_H
+#define _PHY_AIROHA_PCIE_H
+
+/* CSR_2L */
+#define REG_CSR_2L_CMN				0x0000
+#define CSR_2L_PXP_CMN_LANE_EN			BIT(0)
+#define CSR_2L_PXP_CMN_TRIM_MASK		GENMASK(28, 24)
+
+#define REG_CSR_2L_JCPLL_IB_EXT			0x0004
+#define REG_CSR_2L_JCPLL_LPF_SHCK_EN		BIT(8)
+#define CSR_2L_PXP_JCPLL_CHP_IBIAS		GENMASK(21, 16)
+#define CSR_2L_PXP_JCPLL_CHP_IOFST		GENMASK(29, 24)
+
+#define REG_CSR_2L_JCPLL_LPF_BR			0x0008
+#define CSR_2L_PXP_JCPLL_LPF_BR			GENMASK(4, 0)
+#define CSR_2L_PXP_JCPLL_LPF_BC			GENMASK(12, 8)
+#define CSR_2L_PXP_JCPLL_LPF_BP			GENMASK(20, 16)
+#define CSR_2L_PXP_JCPLL_LPF_BWR		GENMASK(28, 24)
+
+#define REG_CSR_2L_JCPLL_LPF_BWC		0x000c
+#define CSR_2L_PXP_JCPLL_LPF_BWC		GENMASK(4, 0)
+#define CSR_2L_PXP_JCPLL_KBAND_CODE		GENMASK(23, 16)
+#define CSR_2L_PXP_JCPLL_KBAND_DIV		GENMASK(26, 24)
+
+#define REG_CSR_2L_JCPLL_KBAND_KFC		0x0010
+#define CSR_2L_PXP_JCPLL_KBAND_KFC		GENMASK(1, 0)
+#define CSR_2L_PXP_JCPLL_KBAND_KF		GENMASK(9, 8)
+#define CSR_2L_PXP_JCPLL_KBAND_KS		GENMASK(17, 16)
+#define CSR_2L_PXP_JCPLL_POSTDIV_EN		BIT(24)
+
+#define REG_CSR_2L_JCPLL_MMD_PREDIV_MODE	0x0014
+#define CSR_2L_PXP_JCPLL_MMD_PREDIV_MODE	GENMASK(1, 0)
+#define CSR_2L_PXP_JCPLL_POSTDIV_D2		BIT(16)
+#define CSR_2L_PXP_JCPLL_POSTDIV_D5		BIT(24)
+
+#define CSR_2L_PXP_JCPLL_MONCK			0x0018
+#define CSR_2L_PXP_JCPLL_REFIN_DIV		GENMASK(25, 24)
+
+#define REG_CSR_2L_JCPLL_RST_DLY		0x001c
+#define CSR_2L_PXP_JCPLL_RST_DLY		GENMASK(2, 0)
+#define CSR_2L_PXP_JCPLL_RST			BIT(8)
+#define CSR_2L_PXP_JCPLL_SDM_DI_EN		BIT(16)
+#define CSR_2L_PXP_JCPLL_SDM_DI_LS		GENMASK(25, 24)
+
+#define REG_CSR_2L_JCPLL_SDM_IFM		0x0020
+#define CSR_2L_PXP_JCPLL_SDM_IFM		BIT(0)
+
+#define REG_CSR_2L_JCPLL_SDM_HREN		0x0024
+#define CSR_2L_PXP_JCPLL_SDM_HREN		BIT(0)
+#define CSR_2L_PXP_JCPLL_TCL_AMP_EN		BIT(8)
+#define CSR_2L_PXP_JCPLL_TCL_AMP_GAIN		GENMASK(18, 16)
+#define CSR_2L_PXP_JCPLL_TCL_AMP_VREF		GENMASK(28, 24)
+
+#define REG_CSR_2L_JCPLL_TCL_CMP		0x0028
+#define CSR_2L_PXP_JCPLL_TCL_LPF_EN		BIT(16)
+#define CSR_2L_PXP_JCPLL_TCL_LPF_BW		GENMASK(26, 24)
+
+#define REG_CSR_2L_JCPLL_VCODIV			0x002c
+#define CSR_2L_PXP_JCPLL_VCO_CFIX		GENMASK(9, 8)
+#define CSR_2L_PXP_JCPLL_VCO_HALFLSB_EN		BIT(16)
+#define CSR_2L_PXP_JCPLL_VCO_SCAPWR		GENMASK(26, 24)
+
+#define REG_CSR_2L_JCPLL_VCO_TCLVAR		0x0030
+#define CSR_2L_PXP_JCPLL_VCO_TCLVAR		GENMASK(2, 0)
+
+#define REG_CSR_2L_JCPLL_SSC				0x0038
+#define CSR_2L_PXP_JCPLL_SSC_EN			BIT(0)
+#define CSR_2L_PXP_JCPLL_SSC_PHASE_INI		BIT(8)
+#define CSR_2L_PXP_JCPLL_SSC_TRI_EN		BIT(16)
+
+#define REG_CSR_2L_JCPLL_SSC_DELTA1		0x003c
+#define CSR_2L_PXP_JCPLL_SSC_DELTA1		GENMASK(15, 0)
+#define CSR_2L_PXP_JCPLL_SSC_DELTA		GENMASK(31, 16)
+
+#define REG_CSR_2L_JCPLL_SSC_PERIOD		0x0040
+#define CSR_2L_PXP_JCPLL_SSC_PERIOD		GENMASK(15, 0)
+
+#define REG_CSR_2L_JCPLL_TCL_VTP_EN		0x004c
+#define CSR_2L_PXP_JCPLL_SPARE_LOW		GENMASK(31, 24)
+
+#define REG_CSR_2L_JCPLL_TCL_KBAND_VREF		0x0050
+#define CSR_2L_PXP_JCPLL_TCL_KBAND_VREF		GENMASK(4, 0)
+#define CSR_2L_PXP_JCPLL_VCO_KBAND_MEAS_EN	BIT(24)
+
+#define REG_CSR_2L_750M_SYS_CK			0x0054
+#define CSR_2L_PXP_TXPLL_LPF_SHCK_EN		BIT(16)
+#define CSR_2L_PXP_TXPLL_CHP_IBIAS		GENMASK(29, 24)
+
+#define REG_CSR_2L_TXPLL_CHP_IOFST		0x0058
+#define CSR_2L_PXP_TXPLL_CHP_IOFST		GENMASK(5, 0)
+#define CSR_2L_PXP_TXPLL_LPF_BR			GENMASK(12, 8)
+#define CSR_2L_PXP_TXPLL_LPF_BC			GENMASK(20, 16)
+#define CSR_2L_PXP_TXPLL_LPF_BP			GENMASK(28, 24)
+
+#define REG_CSR_2L_TXPLL_LPF_BWR		0x005c
+#define CSR_2L_PXP_TXPLL_LPF_BWR		GENMASK(4, 0)
+#define CSR_2L_PXP_TXPLL_LPF_BWC		GENMASK(12, 8)
+#define CSR_2L_PXP_TXPLL_KBAND_CODE		GENMASK(31, 24)
+
+#define REG_CSR_2L_TXPLL_KBAND_DIV		0x0060
+#define CSR_2L_PXP_TXPLL_KBAND_DIV		GENMASK(2, 0)
+#define CSR_2L_PXP_TXPLL_KBAND_KFC		GENMASK(9, 8)
+#define CSR_2L_PXP_TXPLL_KBAND_KF		GENMASK(17, 16)
+#define CSR_2L_PXP_txpll_KBAND_KS		GENMASK(25, 24)
+
+#define REG_CSR_2L_TXPLL_POSTDIV		0x0064
+#define CSR_2L_PXP_TXPLL_POSTDIV_EN		BIT(0)
+#define CSR_2L_PXP_TXPLL_MMD_PREDIV_MODE	GENMASK(9, 8)
+#define CSR_2L_PXP_TXPLL_PHY_CK1_EN		BIT(24)
+
+#define REG_CSR_2L_TXPLL_PHY_CK2		0x0068
+#define CSR_2L_PXP_TXPLL_REFIN_INTERNAL		BIT(24)
+
+#define REG_CSR_2L_TXPLL_REFIN_DIV		0x006c
+#define CSR_2L_PXP_TXPLL_REFIN_DIV		GENMASK(1, 0)
+#define CSR_2L_PXP_TXPLL_RST_DLY		GENMASK(10, 8)
+#define CSR_2L_PXP_TXPLL_PLL_RSTB		BIT(16)
+
+#define REG_CSR_2L_TXPLL_SDM_DI_LS		0x0070
+#define CSR_2L_PXP_TXPLL_SDM_DI_LS		GENMASK(1, 0)
+#define CSR_2L_PXP_TXPLL_SDM_IFM		BIT(8)
+#define CSR_2L_PXP_TXPLL_SDM_ORD		GENMASK(25, 24)
+
+#define REG_CSR_2L_TXPLL_SDM_OUT		0x0074
+#define CSR_2L_PXP_TXPLL_TCL_AMP_EN		BIT(16)
+#define CSR_2L_PXP_TXPLL_TCL_AMP_GAIN		GENMASK(26, 24)
+
+#define REG_CSR_2L_TXPLL_TCL_AMP_VREF		0x0078
+#define CSR_2L_PXP_TXPLL_TCL_AMP_VREF		GENMASK(4, 0)
+#define CSR_2L_PXP_TXPLL_TCL_LPF_EN		BIT(24)
+
+#define REG_CSR_2L_TXPLL_TCL_LPF_BW		0x007c
+#define CSR_2L_PXP_TXPLL_TCL_LPF_BW		GENMASK(2, 0)
+#define CSR_2L_PXP_TXPLL_VCO_CFIX		GENMASK(17, 16)
+#define CSR_2L_PXP_TXPLL_VCO_HALFLSB_EN		BIT(24)
+
+#define REG_CSR_2L_TXPLL_VCO_SCAPWR		0x0080
+#define CSR_2L_PXP_TXPLL_VCO_SCAPWR		GENMASK(2, 0)
+
+#define REG_CSR_2L_TXPLL_SSC			0x0084
+#define CSR_2L_PXP_TXPLL_SSC_EN			BIT(0)
+#define CSR_2L_PXP_TXPLL_SSC_PHASE_INI		BIT(8)
+
+#define REG_CSR_2L_TXPLL_SSC_DELTA1		0x0088
+#define CSR_2L_PXP_TXPLL_SSC_DELTA1		GENMASK(15, 0)
+#define CSR_2L_PXP_TXPLL_SSC_DELTA		GENMASK(31, 16)
+
+#define REG_CSR_2L_TXPLL_SSC_PERIOD		0x008c
+#define CSR_2L_PXP_txpll_SSC_PERIOD		GENMASK(15, 0)
+
+#define REG_CSR_2L_TXPLL_VTP			0x0090
+#define CSR_2L_PXP_TXPLL_VTP_EN			BIT(0)
+
+#define REG_CSR_2L_TXPLL_TCL_VTP		0x0098
+#define CSR_2L_PXP_TXPLL_SPARE_L		GENMASK(31, 24)
+
+#define REG_CSR_2L_TXPLL_TCL_KBAND_VREF		0x009c
+#define CSR_2L_PXP_TXPLL_TCL_KBAND_VREF		GENMASK(4, 0)
+#define CSR_2L_PXP_TXPLL_VCO_KBAND_MEAS_EN	BIT(24)
+
+#define REG_CSR_2L_TXPLL_POSTDIV_D256		0x00a0
+#define CSR_2L_PXP_CLKTX0_AMP			GENMASK(10, 8)
+#define CSR_2L_PXP_CLKTX0_OFFSET		GENMASK(17, 16)
+#define CSR_2L_PXP_CLKTX0_SR			GENMASK(25, 24)
+
+#define REG_CSR_2L_CLKTX0_FORCE_OUT1		0x00a4
+#define CSR_2L_PXP_CLKTX0_HZ			BIT(8)
+#define CSR_2L_PXP_CLKTX0_IMP_SEL		GENMASK(20, 16)
+#define CSR_2L_PXP_CLKTX1_AMP			GENMASK(26, 24)
+
+#define REG_CSR_2L_CLKTX1_OFFSET		0x00a8
+#define CSR_2L_PXP_CLKTX1_OFFSET		GENMASK(1, 0)
+#define CSR_2L_PXP_CLKTX1_SR			GENMASK(9, 8)
+#define CSR_2L_PXP_CLKTX1_HZ			BIT(24)
+
+#define REG_CSR_2L_CLKTX1_IMP_SEL		0x00ac
+#define CSR_2L_PXP_CLKTX1_IMP_SEL		GENMASK(4, 0)
+
+#define REG_CSR_2L_PLL_CMN_RESERVE0		0x00b0
+#define CSR_2L_PXP_PLL_RESERVE_MASK		GENMASK(15, 0)
+
+#define REG_CSR_2L_TX0_CKLDO			0x00cc
+#define CSR_2L_PXP_TX0_CKLDO_EN			BIT(0)
+#define CSR_2L_PXP_TX0_DMEDGEGEN_EN		BIT(24)
+
+#define REG_CSR_2L_TX1_CKLDO			0x00e8
+#define CSR_2L_PXP_TX1_CKLDO_EN			BIT(0)
+#define CSR_2L_PXP_TX1_DMEDGEGEN_EN		BIT(24)
+
+#define REG_CSR_2L_TX1_MULTLANE			0x00ec
+#define CSR_2L_PXP_TX1_MULTLANE_EN		BIT(0)
+
+#define REG_CSR_2L_RX0_REV0			0x00fc
+#define CSR_2L_PXP_VOS_PNINV			GENMASK(19, 18)
+#define CSR_2L_PXP_FE_GAIN_NORMAL_MODE		GENMASK(22, 20)
+#define CSR_2L_PXP_FE_GAIN_TRAIN_MODE		GENMASK(26, 24)
+
+#define REG_CSR_2L_RX0_PHYCK_DIV		0x0100
+#define CSR_2L_PXP_RX0_PHYCK_SEL		GENMASK(9, 8)
+#define CSR_2L_PXP_RX0_PHYCK_RSTB		BIT(16)
+#define CSR_2L_PXP_RX0_TDC_CK_SEL		BIT(24)
+
+#define REG_CSR_2L_CDR0_PD_PICAL_CKD8_INV	0x0104
+#define CSR_2L_PXP_CDR0_PD_EDGE_DISABLE		BIT(8)
+
+#define REG_CSR_2L_CDR0_LPF_RATIO		0x0110
+#define CSR_2L_PXP_CDR0_LPF_TOP_LIM		GENMASK(26, 8)
+
+#define REG_CSR_2L_CDR0_PR_INJ_MODE		0x011c
+#define CSR_2L_PXP_CDR0_INJ_FORCE_OFF		BIT(24)
+
+#define REG_CSR_2L_CDR0_PR_BETA_DAC		0x0120
+#define CSR_2L_PXP_CDR0_PR_BETA_SEL		GENMASK(19, 16)
+#define CSR_2L_PXP_CDR0_PR_KBAND_DIV		GENMASK(26, 24)
+
+#define REG_CSR_2L_CDR0_PR_VREG_IBAND		0x0124
+#define CSR_2L_PXP_CDR0_PR_VREG_IBAND		GENMASK(2, 0)
+#define CSR_2L_PXP_CDR0_PR_VREG_CKBUF		GENMASK(10, 8)
+
+#define REG_CSR_2L_CDR0_PR_CKREF_DIV		0x0128
+#define CSR_2L_PXP_CDR0_PR_CKREF_DIV		GENMASK(1, 0)
+
+#define REG_CSR_2L_CDR0_PR_MONCK		0x012c
+#define CSR_2L_PXP_CDR0_PR_MONCK_ENABLE		BIT(0)
+#define CSR_2L_PXP_CDR0_PR_RESERVE0		GENMASK(19, 16)
+
+#define REG_CSR_2L_CDR0_PR_COR_HBW		0x0130
+#define CSR_2L_PXP_CDR0_PR_LDO_FORCE_ON		BIT(8)
+#define CSR_2L_PXP_CDR0_PR_CKREF_DIV1		GENMASK(17, 16)
+
+#define REG_CSR_2L_CDR0_PR_MONPI		0x0134
+#define CSR_2L_PXP_CDR0_PR_XFICK_EN		BIT(8)
+
+#define REG_CSR_2L_RX0_SIGDET_DCTEST		0x0140
+#define CSR_2L_PXP_RX0_SIGDET_LPF_CTRL		GENMASK(9, 8)
+#define CSR_2L_PXP_RX0_SIGDET_PEAK		GENMASK(25, 24)
+
+#define REG_CSR_2L_RX0_SIGDET_VTH_SEL		0x0144
+#define CSR_2L_PXP_RX0_SIGDET_VTH_SEL		GENMASK(4, 0)
+#define CSR_2L_PXP_RX0_FE_VB_EQ1_EN		BIT(24)
+
+#define REG_CSR_2L_PXP_RX0_FE_VB_EQ2		0x0148
+#define CSR_2L_PXP_RX0_FE_VB_EQ2_EN		BIT(0)
+#define CSR_2L_PXP_RX0_FE_VB_EQ3_EN		BIT(8)
+#define CSR_2L_PXP_RX0_FE_VCM_GEN_PWDB		BIT(16)
+
+#define REG_CSR_2L_PXP_RX0_OSCAL_CTLE1IOS	0x0158
+#define CSR_2L_PXP_RX0_PR_OSCAL_VGA1IOS		GENMASK(29, 24)
+
+#define REG_CSR_2L_PXP_RX0_OSCA_VGA1VOS		0x015c
+#define CSR_2L_PXP_RX0_PR_OSCAL_VGA1VOS		GENMASK(5, 0)
+#define CSR_2L_PXP_RX0_PR_OSCAL_VGA2IOS		GENMASK(13, 8)
+
+#define REG_CSR_2L_RX1_REV0			0x01b4
+
+#define REG_CSR_2L_RX1_PHYCK_DIV		0x01b8
+#define CSR_2L_PXP_RX1_PHYCK_SEL		GENMASK(9, 8)
+#define CSR_2L_PXP_RX1_PHYCK_RSTB		BIT(16)
+#define CSR_2L_PXP_RX1_TDC_CK_SEL		BIT(24)
+
+#define REG_CSR_2L_CDR1_PD_PICAL_CKD8_INV	0x01bc
+#define CSR_2L_PXP_CDR1_PD_EDGE_DISABLE		BIT(8)
+
+#define REG_CSR_2L_CDR1_PR_BETA_DAC		0x01d8
+#define CSR_2L_PXP_CDR1_PR_BETA_SEL		GENMASK(19, 16)
+#define CSR_2L_PXP_CDR1_PR_KBAND_DIV		GENMASK(26, 24)
+
+#define REG_CSR_2L_CDR1_PR_MONCK		0x01e4
+#define CSR_2L_PXP_CDR1_PR_MONCK_ENABLE		BIT(0)
+#define CSR_2L_PXP_CDR1_PR_RESERVE0		GENMASK(19, 16)
+
+#define REG_CSR_2L_CDR1_LPF_RATIO		0x01c8
+#define CSR_2L_PXP_CDR1_LPF_TOP_LIM		GENMASK(26, 8)
+
+#define REG_CSR_2L_CDR1_PR_INJ_MODE		0x01d4
+#define CSR_2L_PXP_CDR1_INJ_FORCE_OFF		BIT(24)
+
+#define REG_CSR_2L_CDR1_PR_VREG_IBAND_VAL	0x01dc
+#define CSR_2L_PXP_CDR1_PR_VREG_IBAND		GENMASK(2, 0)
+#define CSR_2L_PXP_CDR1_PR_VREG_CKBUF		GENMASK(10, 8)
+
+#define REG_CSR_2L_CDR1_PR_CKREF_DIV		0x01e0
+#define CSR_2L_PXP_CDR1_PR_CKREF_DIV		GENMASK(1, 0)
+
+#define REG_CSR_2L_CDR1_PR_COR_HBW		0x01e8
+#define CSR_2L_PXP_CDR1_PR_LDO_FORCE_ON		BIT(8)
+#define CSR_2L_PXP_CDR1_PR_CKREF_DIV1		GENMASK(17, 16)
+
+#define REG_CSR_2L_CDR1_PR_MONPI		0x01ec
+#define CSR_2L_PXP_CDR1_PR_XFICK_EN		BIT(8)
+
+#define REG_CSR_2L_RX1_DAC_RANGE_EYE		0x01f4
+#define CSR_2L_PXP_RX1_SIGDET_LPF_CTRL		GENMASK(25, 24)
+
+#define REG_CSR_2L_RX1_SIGDET_NOVTH		0x01f8
+#define CSR_2L_PXP_RX1_SIGDET_PEAK		GENMASK(9, 8)
+#define CSR_2L_PXP_RX1_SIGDET_VTH_SEL		GENMASK(20, 16)
+
+#define REG_CSR_2L_RX1_FE_VB_EQ1		0x0200
+#define CSR_2L_PXP_RX1_FE_VB_EQ1_EN		BIT(0)
+#define CSR_2L_PXP_RX1_FE_VB_EQ2_EN		BIT(8)
+#define CSR_2L_PXP_RX1_FE_VB_EQ3_EN		BIT(16)
+#define CSR_2L_PXP_RX1_FE_VCM_GEN_PWDB		BIT(24)
+
+#define REG_CSR_2L_RX1_OSCAL_VGA1IOS		0x0214
+#define CSR_2L_PXP_RX1_PR_OSCAL_VGA1IOS		GENMASK(5, 0)
+#define CSR_2L_PXP_RX1_PR_OSCAL_VGA1VOS		GENMASK(13, 8)
+#define CSR_2L_PXP_RX1_PR_OSCAL_VGA2IOS		GENMASK(21, 16)
+
+/* PMA */
+#define REG_PCIE_PMA_SS_LCPLL_PWCTL_SETTING_1	0x0004
+#define PCIE_LCPLL_MAN_PWDB			BIT(0)
+
+#define REG_PCIE_PMA_SEQUENCE_DISB_CTRL1	0x010c
+#define PCIE_DISB_RX_SDCAL_EN			BIT(0)
+
+#define REG_PCIE_PMA_CTRL_SEQUENCE_FORCE_CTRL1	0x0114
+#define PCIE_FORCE_RX_SDCAL_EN			BIT(0)
+
+#define REG_PCIE_PMA_SS_RX_FREQ_DET1		0x014c
+#define PCIE_PLL_FT_LOCK_CYCLECNT		GENMASK(15, 0)
+#define PCIE_PLL_FT_UNLOCK_CYCLECNT		GENMASK(31, 16)
+
+#define REG_PCIE_PMA_SS_RX_FREQ_DET2		0x0150
+#define PCIE_LOCK_TARGET_BEG			GENMASK(15, 0)
+#define PCIE_LOCK_TARGET_END			GENMASK(31, 16)
+
+#define REG_PCIE_PMA_SS_RX_FREQ_DET3		0x0154
+#define PCIE_UNLOCK_TARGET_BEG			GENMASK(15, 0)
+#define PCIE_UNLOCK_TARGET_END			GENMASK(31, 16)
+
+#define REG_PCIE_PMA_SS_RX_FREQ_DET4		0x0158
+#define PCIE_FREQLOCK_DET_EN			GENMASK(2, 0)
+#define PCIE_LOCK_LOCKTH			GENMASK(11, 8)
+#define PCIE_UNLOCK_LOCKTH			GENMASK(15, 12)
+
+#define REG_PCIE_PMA_SS_RX_CAL1			0x0160
+#define REG_PCIE_PMA_SS_RX_CAL2			0x0164
+#define PCIE_CAL_OUT_OS				GENMASK(11, 8)
+
+#define REG_PCIE_PMA_SS_RX_SIGDET0		0x0168
+#define PCIE_SIGDET_WIN_NONVLD_TIMES		GENMASK(28, 24)
+
+#define REG_PCIE_PMA_TX_RESET			0x0260
+#define PCIE_TX_TOP_RST				BIT(0)
+#define PCIE_TX_CAL_RST				BIT(8)
+
+#define REG_PCIE_PMA_RX_FORCE_MODE0		0x0294
+#define PCIE_FORCE_DA_XPON_RX_FE_GAIN_CTRL	GENMASK(1, 0)
+
+#define REG_PCIE_PMA_SS_DA_XPON_PWDB0		0x034c
+#define PCIE_DA_XPON_CDR_PR_PWDB		BIT(8)
+
+#define REG_PCIE_PMA_SW_RESET			0x0460
+#define PCIE_SW_RX_FIFO_RST			BIT(0)
+#define PCIE_SW_RX_RST				BIT(1)
+#define PCIE_SW_TX_RST				BIT(2)
+#define PCIE_SW_PMA_RST				BIT(3)
+#define PCIE_SW_ALLPCS_RST			BIT(4)
+#define PCIE_SW_REF_RST				BIT(5)
+#define PCIE_SW_TX_FIFO_RST			BIT(6)
+#define PCIE_SW_XFI_TXPCS_RST			BIT(7)
+#define PCIE_SW_XFI_RXPCS_RST			BIT(8)
+#define PCIE_SW_XFI_RXPCS_BIST_RST		BIT(9)
+#define PCIE_SW_HSG_TXPCS_RST			BIT(10)
+#define PCIE_SW_HSG_RXPCS_RST			BIT(11)
+#define PCIE_PMA_SW_RST				(PCIE_SW_RX_FIFO_RST | \
+						 PCIE_SW_RX_RST | \
+						 PCIE_SW_TX_RST | \
+						 PCIE_SW_PMA_RST | \
+						 PCIE_SW_ALLPCS_RST | \
+						 PCIE_SW_REF_RST | \
+						 PCIE_SW_TX_FIFO_RST | \
+						 PCIE_SW_XFI_TXPCS_RST | \
+						 PCIE_SW_XFI_RXPCS_RST | \
+						 PCIE_SW_XFI_RXPCS_BIST_RST | \
+						 PCIE_SW_HSG_TXPCS_RST | \
+						 PCIE_SW_HSG_RXPCS_RST)
+
+#define REG_PCIE_PMA_RO_RX_FREQDET		0x0530
+#define PCIE_RO_FBCK_LOCK			BIT(0)
+#define PCIE_RO_FL_OUT				GENMASK(31, 16)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC	0x0794
+#define PCIE_FORCE_DA_PXP_CDR_PR_IDAC		GENMASK(10, 0)
+#define PCIE_FORCE_SEL_DA_PXP_CDR_PR_IDAC	BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW	BIT(24)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW	0x0798
+#define PCIE_FORCE_DA_PXP_TXPLL_SDM_PCW		GENMASK(30, 0)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_VOS	0x079c
+#define PCIE_FORCE_SEL_DA_PXP_JCPLL_SDM_PCW	BIT(16)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW	0x0800
+#define PCIE_FORCE_DA_PXP_JCPLL_SDM_PCW		GENMASK(30, 0)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_CDR_PD_PWDB	0x081c
+#define PCIE_FORCE_DA_PXP_CDR_PD_PWDB		BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_CDR_PD_PWDB	BIT(8)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C	0x0820
+#define PCIE_FORCE_DA_PXP_CDR_PR_LPF_C_EN	BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_C_EN	BIT(8)
+#define PCIE_FORCE_DA_PXP_CDR_PR_LPF_R_EN	BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_R_EN	BIT(24)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB	0x0824
+#define PCIE_FORCE_DA_PXP_CDR_PR_PWDB			BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_CDR_PR_PWDB		BIT(24)
+
+#define REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT	0x0828
+#define PCIE_FORCE_DA_PXP_JCPLL_CKOUT_EN	BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN	BIT(8)
+#define PCIE_FORCE_DA_PXP_JCPLL_EN		BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_JCPLL_EN		BIT(24)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_RX_SCAN_RST	0x0084c
+#define PCIE_FORCE_DA_PXP_RX_SIGDET_PWDB	BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_RX_SIGDET_PWDB	BIT(24)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT	0x0854
+#define PCIE_FORCE_DA_PXP_TXPLL_CKOUT_EN	BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN	BIT(8)
+#define PCIE_FORCE_DA_PXP_TXPLL_EN		BIT(16)
+#define PCIE_FORCE_SEL_DA_PXP_TXPLL_EN		BIT(24)
+
+#define REG_PCIE_PMA_SCAN_MODE				0x0884
+#define PCIE_FORCE_DA_PXP_JCPLL_KBAND_LOAD_EN		BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_JCPLL_KBAND_LOAD_EN	BIT(8)
+
+#define REG_PCIE_PMA_DIG_RESERVE_13		0x08bc
+#define PCIE_FLL_IDAC_PCIEG1			GENMASK(10, 0)
+#define PCIE_FLL_IDAC_PCIEG2			GENMASK(26, 16)
+
+#define REG_PCIE_PMA_DIG_RESERVE_14		0x08c0
+#define PCIE_FLL_IDAC_PCIEG3			GENMASK(10, 0)
+#define PCIE_FLL_LOAD_EN			BIT(16)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL	0x088c
+#define PCIE_FORCE_DA_PXP_RX_FE_GAIN_CTRL		GENMASK(1, 0)
+#define PCIE_FORCE_SEL_DA_PXP_RX_FE_GAIN_CTRL		BIT(8)
+
+#define REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_PWDB	0x0894
+#define PCIE_FORCE_DA_PXP_RX_FE_PWDB		BIT(0)
+#define PCIE_FORCE_SEL_DA_PXP_RX_FE_PWDB	BIT(8)
+
+#define REG_PCIE_PMA_DIG_RESERVE_12		0x08b8
+#define PCIE_FORCE_PMA_RX_SPEED			GENMASK(7, 4)
+#define PCIE_FORCE_SEL_PMA_RX_SPEED		BIT(7)
+
+#define REG_PCIE_PMA_DIG_RESERVE_17		0x08e0
+
+#define REG_PCIE_PMA_DIG_RESERVE_18		0x08e4
+#define PCIE_PXP_RX_VTH_SEL_PCIE_G1		GENMASK(4, 0)
+#define PCIE_PXP_RX_VTH_SEL_PCIE_G2		GENMASK(12, 8)
+#define PCIE_PXP_RX_VTH_SEL_PCIE_G3		GENMASK(20, 16)
+
+#define REG_PCIE_PMA_DIG_RESERVE_19		0x08e8
+#define PCIE_PCP_RX_REV0_PCIE_GEN1		GENMASK(31, 16)
+
+#define REG_PCIE_PMA_DIG_RESERVE_20		0x08ec
+#define PCIE_PCP_RX_REV0_PCIE_GEN2		GENMASK(15, 0)
+#define PCIE_PCP_RX_REV0_PCIE_GEN3		GENMASK(31, 16)
+
+#define REG_PCIE_PMA_DIG_RESERVE_21		0x08f0
+#define REG_PCIE_PMA_DIG_RESERVE_22		0x08f4
+#define REG_PCIE_PMA_DIG_RESERVE_27		0x0908
+#define REG_PCIE_PMA_DIG_RESERVE_30		0x0914
+
+/* DTIME */
+#define REG_PCIE_PEXTP_DIG_GLB44		0x00
+#define PCIE_XTP_RXDET_VCM_OFF_STB_T_SEL	GENMASK(7, 0)
+#define PCIE_XTP_RXDET_EN_STB_T_SEL		GENMASK(15, 8)
+#define PCIE_XTP_RXDET_FINISH_STB_T_SEL		GENMASK(23, 16)
+#define PCIE_XTP_TXPD_TX_DATA_EN_DLY		GENMASK(27, 24)
+#define PCIE_XTP_TXPD_RXDET_DONE_CDT		BIT(28)
+#define PCIE_XTP_RXDET_LATCH_STB_T_SEL		GENMASK(31, 29)
+
+/* RX AEQ */
+#define REG_PCIE_PEXTP_DIG_LN_RX30_P0		0x0000
+#define PCIE_XTP_LN_RX_PDOWN_L1P2_EXIT_WAIT	GENMASK(7, 0)
+#define PCIE_XTP_LN_RX_PDOWN_T2RLB_DIG_EN	BIT(8)
+#define PCIE_XTP_LN_RX_PDOWN_E0_AEQEN_WAIT	GENMASK(31, 16)
+
+#define REG_PCIE_PEXTP_DIG_LN_RX30_P1		0x0100
+
+#endif /* _PHY_AIROHA_PCIE_H */
diff --git a/drivers/phy/airoha/phy-airoha-pcie.c b/drivers/phy/airoha/phy-airoha-pcie.c
new file mode 100644
index 000000000000..56e9ade8a9fd
--- /dev/null
+++ b/drivers/phy/airoha/phy-airoha-pcie.c
@@ -0,0 +1,1290 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "phy-airoha-pcie-regs.h"
+
+#define LEQ_LEN_CTRL_MAX_VAL	7
+#define FREQ_LOCK_MAX_ATTEMPT	10
+
+/* PCIe-PHY initialization time in ms needed by the hw to complete */
+#define PHY_HW_INIT_TIME_MS	30
+
+enum airoha_pcie_port_gen {
+	PCIE_PORT_GEN1 = 1,
+	PCIE_PORT_GEN2,
+	PCIE_PORT_GEN3,
+};
+
+/**
+ * struct airoha_pcie_phy - PCIe phy driver main structure
+ * @dev: pointer to device
+ * @phy: pointer to generic phy
+ * @csr_2l: Analogic lane IO mapped register base address
+ * @pma0: IO mapped register base address of PMA0-PCIe
+ * @pma1: IO mapped register base address of PMA1-PCIe
+ * @p0_xr_dtime: IO mapped register base address of port0 Tx-Rx detection time
+ * @p1_xr_dtime: IO mapped register base address of port1 Tx-Rx detection time
+ * @rx_aeq: IO mapped register base address of Rx AEQ training
+ */
+struct airoha_pcie_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *csr_2l;
+	void __iomem *pma0;
+	void __iomem *pma1;
+	void __iomem *p0_xr_dtime;
+	void __iomem *p1_xr_dtime;
+	void __iomem *rx_aeq;
+};
+
+static void airoha_phy_clear_bits(void __iomem *reg, u32 mask)
+{
+	u32 val = readl(reg) & ~mask;
+
+	writel(val, reg);
+}
+
+static void airoha_phy_set_bits(void __iomem *reg, u32 mask)
+{
+	u32 val = readl(reg) | mask;
+
+	writel(val, reg);
+}
+
+static void airoha_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
+{
+	u32 tmp = readl(reg);
+
+	tmp &= ~mask;
+	tmp |= val & mask;
+	writel(tmp, reg);
+}
+
+#define airoha_phy_update_field(reg, mask, val)					\
+	do {									\
+		BUILD_BUG_ON_MSG(!__builtin_constant_p((mask)),			\
+				 "mask is not constant");			\
+		airoha_phy_update_bits((reg), (mask),				\
+				       FIELD_PREP((mask), (val)));		\
+	} while (0)
+
+#define airoha_phy_csr_2l_clear_bits(pcie_phy, reg, mask)			\
+	airoha_phy_clear_bits((pcie_phy)->csr_2l + (reg), (mask))
+#define airoha_phy_csr_2l_set_bits(pcie_phy, reg, mask)				\
+	airoha_phy_set_bits((pcie_phy)->csr_2l + (reg), (mask))
+#define airoha_phy_csr_2l_update_field(pcie_phy, reg, mask, val)		\
+	airoha_phy_update_field((pcie_phy)->csr_2l + (reg), (mask), (val))
+#define airoha_phy_pma0_clear_bits(pcie_phy, reg, mask)				\
+	airoha_phy_clear_bits((pcie_phy)->pma0 + (reg), (mask))
+#define airoha_phy_pma1_clear_bits(pcie_phy, reg, mask)				\
+	airoha_phy_clear_bits((pcie_phy)->pma1 + (reg), (mask))
+#define airoha_phy_pma0_set_bits(pcie_phy, reg, mask)				\
+	airoha_phy_set_bits((pcie_phy)->pma0 + (reg), (mask))
+#define airoha_phy_pma1_set_bits(pcie_phy, reg, mask)				\
+	airoha_phy_set_bits((pcie_phy)->pma1 + (reg), (mask))
+#define airoha_phy_pma0_update_field(pcie_phy, reg, mask, val)			\
+	airoha_phy_update_field((pcie_phy)->pma0 + (reg), (mask), (val))
+#define airoha_phy_pma1_update_field(pcie_phy, reg, mask, val)			\
+	airoha_phy_update_field((pcie_phy)->pma1 + (reg), (mask), (val))
+
+static void
+airoha_phy_init_lane0_rx_fw_pre_calib(struct airoha_pcie_phy *pcie_phy,
+				      enum airoha_pcie_port_gen gen)
+{
+	u32 fl_out_target = gen == PCIE_PORT_GEN3 ? 41600 : 41941;
+	u32 lock_cyclecnt = gen == PCIE_PORT_GEN3 ? 26000 : 32767;
+	u32 pr_idac, val, cdr_pr_idac_tmp = 0;
+	int i;
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_SS_LCPLL_PWCTL_SETTING_1,
+				 PCIE_LCPLL_MAN_PWDB);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET2,
+				     PCIE_LOCK_TARGET_BEG,
+				     fl_out_target - 100);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET2,
+				     PCIE_LOCK_TARGET_END,
+				     fl_out_target + 100);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET1,
+				     PCIE_PLL_FT_LOCK_CYCLECNT, lock_cyclecnt);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET4,
+				     PCIE_LOCK_LOCKTH, 0x3);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET3,
+				     PCIE_UNLOCK_TARGET_BEG,
+				     fl_out_target - 100);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET3,
+				     PCIE_UNLOCK_TARGET_END,
+				     fl_out_target + 100);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET1,
+				     PCIE_PLL_FT_UNLOCK_CYCLECNT,
+				     lock_cyclecnt);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET4,
+				     PCIE_UNLOCK_LOCKTH, 0x3);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR0_PR_INJ_MODE,
+				   CSR_2L_PXP_CDR0_INJ_FORCE_OFF);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_IDAC);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				   PCIE_FORCE_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				 PCIE_FORCE_DA_PXP_CDR_PR_PWDB);
+
+	for (i = 0; i < LEQ_LEN_CTRL_MAX_VAL; i++) {
+		airoha_phy_pma0_update_field(pcie_phy,
+				REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				PCIE_FORCE_DA_PXP_CDR_PR_IDAC, i << 8);
+		airoha_phy_pma0_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = FIELD_GET(PCIE_RO_FL_OUT,
+				readl(pcie_phy->pma0 +
+				      REG_PCIE_PMA_RO_RX_FREQDET));
+		if (val > fl_out_target)
+			cdr_pr_idac_tmp = i << 8;
+	}
+
+	for (i = LEQ_LEN_CTRL_MAX_VAL; i >= 0; i--) {
+		pr_idac = cdr_pr_idac_tmp | (0x1 << i);
+		airoha_phy_pma0_update_field(pcie_phy,
+				REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				PCIE_FORCE_DA_PXP_CDR_PR_IDAC, pr_idac);
+		airoha_phy_pma0_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = FIELD_GET(PCIE_RO_FL_OUT,
+				readl(pcie_phy->pma0 +
+				      REG_PCIE_PMA_RO_RX_FREQDET));
+		if (val < fl_out_target)
+			pr_idac &= ~(0x1 << i);
+
+		cdr_pr_idac_tmp = pr_idac;
+	}
+
+	airoha_phy_pma0_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				     PCIE_FORCE_DA_PXP_CDR_PR_IDAC,
+				     cdr_pr_idac_tmp);
+
+	for (i = 0; i < FREQ_LOCK_MAX_ATTEMPT; i++) {
+		u32 val;
+
+		airoha_phy_pma0_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = readl(pcie_phy->pma0 + REG_PCIE_PMA_RO_RX_FREQDET);
+		if (val & PCIE_RO_FBCK_LOCK)
+			break;
+	}
+
+	/* turn off force mode and update band values */
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR0_PR_INJ_MODE,
+				     CSR_2L_PXP_CDR0_INJ_FORCE_OFF);
+
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_IDAC);
+	if (gen == PCIE_PORT_GEN3) {
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_14,
+					     PCIE_FLL_IDAC_PCIEG3,
+					     cdr_pr_idac_tmp);
+	} else {
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_13,
+					     PCIE_FLL_IDAC_PCIEG1,
+					     cdr_pr_idac_tmp);
+		airoha_phy_pma0_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_13,
+					     PCIE_FLL_IDAC_PCIEG2,
+					     cdr_pr_idac_tmp);
+	}
+}
+
+static void
+airoha_phy_init_lane1_rx_fw_pre_calib(struct airoha_pcie_phy *pcie_phy,
+				      enum airoha_pcie_port_gen gen)
+{
+	u32 fl_out_target = gen == PCIE_PORT_GEN3 ? 41600 : 41941;
+	u32 lock_cyclecnt = gen == PCIE_PORT_GEN3 ? 26000 : 32767;
+	u32 pr_idac, val, cdr_pr_idac_tmp = 0;
+	int i;
+
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_SS_LCPLL_PWCTL_SETTING_1,
+				 PCIE_LCPLL_MAN_PWDB);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET2,
+				     PCIE_LOCK_TARGET_BEG,
+				     fl_out_target - 100);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET2,
+				     PCIE_LOCK_TARGET_END,
+				     fl_out_target + 100);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET1,
+				     PCIE_PLL_FT_LOCK_CYCLECNT, lock_cyclecnt);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET4,
+				     PCIE_LOCK_LOCKTH, 0x3);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET3,
+				     PCIE_UNLOCK_TARGET_BEG,
+				     fl_out_target - 100);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET3,
+				     PCIE_UNLOCK_TARGET_END,
+				     fl_out_target + 100);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET1,
+				     PCIE_PLL_FT_UNLOCK_CYCLECNT,
+				     lock_cyclecnt);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_FREQ_DET4,
+				     PCIE_UNLOCK_LOCKTH, 0x3);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR1_PR_INJ_MODE,
+				   CSR_2L_PXP_CDR1_INJ_FORCE_OFF);
+
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_IDAC);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				   PCIE_FORCE_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				 PCIE_FORCE_DA_PXP_CDR_PR_PWDB);
+
+	for (i = 0; i < LEQ_LEN_CTRL_MAX_VAL; i++) {
+		airoha_phy_pma1_update_field(pcie_phy,
+				REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				PCIE_FORCE_DA_PXP_CDR_PR_IDAC, i << 8);
+		airoha_phy_pma1_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = FIELD_GET(PCIE_RO_FL_OUT,
+				readl(pcie_phy->pma1 +
+				      REG_PCIE_PMA_RO_RX_FREQDET));
+		if (val > fl_out_target)
+			cdr_pr_idac_tmp = i << 8;
+	}
+
+	for (i = LEQ_LEN_CTRL_MAX_VAL; i >= 0; i--) {
+		pr_idac = cdr_pr_idac_tmp | (0x1 << i);
+		airoha_phy_pma1_update_field(pcie_phy,
+				REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				PCIE_FORCE_DA_PXP_CDR_PR_IDAC, pr_idac);
+		airoha_phy_pma1_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = FIELD_GET(PCIE_RO_FL_OUT,
+				readl(pcie_phy->pma1 +
+				      REG_PCIE_PMA_RO_RX_FREQDET));
+		if (val < fl_out_target)
+			pr_idac &= ~(0x1 << i);
+
+		cdr_pr_idac_tmp = pr_idac;
+	}
+
+	airoha_phy_pma1_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				     PCIE_FORCE_DA_PXP_CDR_PR_IDAC,
+				     cdr_pr_idac_tmp);
+
+	for (i = 0; i < FREQ_LOCK_MAX_ATTEMPT; i++) {
+		u32 val;
+
+		airoha_phy_pma1_clear_bits(pcie_phy,
+					   REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					   PCIE_FREQLOCK_DET_EN);
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_SS_RX_FREQ_DET4,
+					     PCIE_FREQLOCK_DET_EN, 0x3);
+
+		usleep_range(10000, 15000);
+
+		val = readl(pcie_phy->pma1 + REG_PCIE_PMA_RO_RX_FREQDET);
+		if (val & PCIE_RO_FBCK_LOCK)
+			break;
+	}
+
+	/* turn off force mode and update band values */
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR1_PR_INJ_MODE,
+				     CSR_2L_PXP_CDR1_INJ_FORCE_OFF);
+
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_R_EN);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_LPF_C,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_LPF_C_EN);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_PIEYE_PWDB,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_PWDB);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				   PCIE_FORCE_SEL_DA_PXP_CDR_PR_IDAC);
+	if (gen == PCIE_PORT_GEN3) {
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_14,
+					     PCIE_FLL_IDAC_PCIEG3,
+					     cdr_pr_idac_tmp);
+	} else {
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_13,
+					     PCIE_FLL_IDAC_PCIEG1,
+					     cdr_pr_idac_tmp);
+		airoha_phy_pma1_update_field(pcie_phy,
+					     REG_PCIE_PMA_DIG_RESERVE_13,
+					     PCIE_FLL_IDAC_PCIEG2,
+					     cdr_pr_idac_tmp);
+	}
+}
+
+static void airoha_pcie_phy_init_default(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CMN,
+				       CSR_2L_PXP_CMN_TRIM_MASK, 0x10);
+	writel(0xcccbcccb, pcie_phy->pma0 + REG_PCIE_PMA_DIG_RESERVE_21);
+	writel(0xcccb, pcie_phy->pma0 + REG_PCIE_PMA_DIG_RESERVE_22);
+	writel(0xcccbcccb, pcie_phy->pma1 + REG_PCIE_PMA_DIG_RESERVE_21);
+	writel(0xcccb, pcie_phy->pma1 + REG_PCIE_PMA_DIG_RESERVE_22);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CMN,
+				   CSR_2L_PXP_CMN_LANE_EN);
+}
+
+static void airoha_pcie_phy_init_clk_out(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_TXPLL_POSTDIV_D256,
+				       CSR_2L_PXP_CLKTX0_AMP, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_CLKTX0_FORCE_OUT1,
+				       CSR_2L_PXP_CLKTX1_AMP, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_TXPLL_POSTDIV_D256,
+				       CSR_2L_PXP_CLKTX0_OFFSET, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CLKTX1_OFFSET,
+				       CSR_2L_PXP_CLKTX1_OFFSET, 0x2);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CLKTX0_FORCE_OUT1,
+				     CSR_2L_PXP_CLKTX0_HZ);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CLKTX1_OFFSET,
+				     CSR_2L_PXP_CLKTX1_HZ);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_CLKTX0_FORCE_OUT1,
+				       CSR_2L_PXP_CLKTX0_IMP_SEL, 0x12);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CLKTX1_IMP_SEL,
+				       CSR_2L_PXP_CLKTX1_IMP_SEL, 0x12);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_POSTDIV_D256,
+				     CSR_2L_PXP_CLKTX0_SR);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CLKTX1_OFFSET,
+				     CSR_2L_PXP_CLKTX1_SR);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_PLL_CMN_RESERVE0,
+				       CSR_2L_PXP_PLL_RESERVE_MASK, 0xd0d);
+}
+
+static void airoha_pcie_phy_init_csr_2l(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				 PCIE_SW_XFI_RXPCS_RST | PCIE_SW_REF_RST |
+				 PCIE_SW_RX_RST);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				 PCIE_SW_XFI_RXPCS_RST | PCIE_SW_REF_RST |
+				 PCIE_SW_RX_RST);
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_TX_RESET,
+				 PCIE_TX_TOP_RST | PCIE_TX_CAL_RST);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_TX_RESET,
+				 PCIE_TX_TOP_RST | PCIE_TX_CAL_RST);
+}
+
+static void airoha_pcie_phy_init_rx(struct airoha_pcie_phy *pcie_phy)
+{
+	writel(0x2a00090b, pcie_phy->pma0 + REG_PCIE_PMA_DIG_RESERVE_17);
+	writel(0x2a00090b, pcie_phy->pma1 + REG_PCIE_PMA_DIG_RESERVE_17);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR0_PR_MONPI,
+				   CSR_2L_PXP_CDR0_PR_XFICK_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR1_PR_MONPI,
+				   CSR_2L_PXP_CDR1_PR_XFICK_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy,
+				     REG_CSR_2L_CDR0_PD_PICAL_CKD8_INV,
+				     CSR_2L_PXP_CDR0_PD_EDGE_DISABLE);
+	airoha_phy_csr_2l_clear_bits(pcie_phy,
+				     REG_CSR_2L_CDR1_PD_PICAL_CKD8_INV,
+				     CSR_2L_PXP_CDR1_PD_EDGE_DISABLE);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_PHYCK_DIV,
+				       CSR_2L_PXP_RX0_PHYCK_SEL, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_PHYCK_DIV,
+				       CSR_2L_PXP_RX1_PHYCK_SEL, 0x1);
+}
+
+static void airoha_pcie_phy_init_jcpll(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				   PCIE_FORCE_DA_PXP_JCPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_EN);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				   PCIE_FORCE_DA_PXP_JCPLL_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_TCL_VTP_EN,
+				       CSR_2L_PXP_JCPLL_SPARE_LOW, 0x20);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_RST_DLY,
+				   CSR_2L_PXP_JCPLL_RST);
+	writel(0x0, pcie_phy->csr_2l + REG_CSR_2L_JCPLL_SSC_DELTA1);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC_PERIOD,
+				     CSR_2L_PXP_JCPLL_SSC_PERIOD);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				     CSR_2L_PXP_JCPLL_SSC_PHASE_INI);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				     CSR_2L_PXP_JCPLL_SSC_TRI_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BR,
+				       CSR_2L_PXP_JCPLL_LPF_BR, 0xa);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BR,
+				       CSR_2L_PXP_JCPLL_LPF_BP, 0xc);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BR,
+				       CSR_2L_PXP_JCPLL_LPF_BC, 0x1f);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BWC,
+				       CSR_2L_PXP_JCPLL_LPF_BWC, 0x1e);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BR,
+				       CSR_2L_PXP_JCPLL_LPF_BWR, 0xa);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_JCPLL_MMD_PREDIV_MODE,
+				       CSR_2L_PXP_JCPLL_MMD_PREDIV_MODE,
+				       0x1);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, CSR_2L_PXP_JCPLL_MONCK,
+				     CSR_2L_PXP_JCPLL_REFIN_DIV);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_VOS,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_SDM_PCW);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_VOS,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_SDM_PCW);
+	airoha_phy_pma0_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW,
+				     PCIE_FORCE_DA_PXP_JCPLL_SDM_PCW,
+				     0x50000000);
+	airoha_phy_pma1_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_JCPLL_SDM_PCW,
+				     PCIE_FORCE_DA_PXP_JCPLL_SDM_PCW,
+				     0x50000000);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy,
+				   REG_CSR_2L_JCPLL_MMD_PREDIV_MODE,
+				   CSR_2L_PXP_JCPLL_POSTDIV_D5);
+	airoha_phy_csr_2l_set_bits(pcie_phy,
+				   REG_CSR_2L_JCPLL_MMD_PREDIV_MODE,
+				   CSR_2L_PXP_JCPLL_POSTDIV_D2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_RST_DLY,
+				       CSR_2L_PXP_JCPLL_RST_DLY, 0x4);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_RST_DLY,
+				     CSR_2L_PXP_JCPLL_SDM_DI_LS);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_TCL_KBAND_VREF,
+				     CSR_2L_PXP_JCPLL_VCO_KBAND_MEAS_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_IB_EXT,
+				     CSR_2L_PXP_JCPLL_CHP_IOFST);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_IB_EXT,
+				       CSR_2L_PXP_JCPLL_CHP_IBIAS, 0xc);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_JCPLL_MMD_PREDIV_MODE,
+				       CSR_2L_PXP_JCPLL_MMD_PREDIV_MODE,
+				       0x1);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_VCODIV,
+				   CSR_2L_PXP_JCPLL_VCO_HALFLSB_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_VCODIV,
+				       CSR_2L_PXP_JCPLL_VCO_CFIX, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_VCODIV,
+				       CSR_2L_PXP_JCPLL_VCO_SCAPWR, 0x4);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_IB_EXT,
+				     REG_CSR_2L_JCPLL_LPF_SHCK_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_KBAND_KFC,
+				   CSR_2L_PXP_JCPLL_POSTDIV_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_KBAND_KFC,
+				     CSR_2L_PXP_JCPLL_KBAND_KFC);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_KBAND_KFC,
+				       CSR_2L_PXP_JCPLL_KBAND_KF, 0x3);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_KBAND_KFC,
+				     CSR_2L_PXP_JCPLL_KBAND_KS);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BWC,
+				       CSR_2L_PXP_JCPLL_KBAND_DIV, 0x1);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_SCAN_MODE,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_KBAND_LOAD_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy, REG_PCIE_PMA_SCAN_MODE,
+				   PCIE_FORCE_DA_PXP_JCPLL_KBAND_LOAD_EN);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_LPF_BWC,
+				       CSR_2L_PXP_JCPLL_KBAND_CODE, 0xe4);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SDM_HREN,
+				   CSR_2L_PXP_JCPLL_TCL_AMP_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_TCL_CMP,
+				   CSR_2L_PXP_JCPLL_TCL_LPF_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_JCPLL_TCL_KBAND_VREF,
+				       CSR_2L_PXP_JCPLL_TCL_KBAND_VREF, 0xf);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_SDM_HREN,
+				       CSR_2L_PXP_JCPLL_TCL_AMP_GAIN, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_SDM_HREN,
+				       CSR_2L_PXP_JCPLL_TCL_AMP_VREF, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_TCL_CMP,
+				       CSR_2L_PXP_JCPLL_TCL_LPF_BW, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_VCO_TCLVAR,
+				       CSR_2L_PXP_JCPLL_VCO_TCLVAR, 0x3);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN);
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_JCPLL_CKOUT_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_CKOUT_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_JCPLL_CKOUT_EN);
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_EN);
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_JCPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_JCPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_PXP_JCPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_JCPLL_EN);
+}
+
+static void airoha_pcie_phy_txpll(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_EN);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				   PCIE_FORCE_DA_PXP_TXPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_EN);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				   PCIE_FORCE_DA_PXP_TXPLL_EN);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_REFIN_DIV,
+				   CSR_2L_PXP_TXPLL_PLL_RSTB);
+	writel(0x0, pcie_phy->csr_2l + REG_CSR_2L_TXPLL_SSC_DELTA1);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SSC_PERIOD,
+				     CSR_2L_PXP_txpll_SSC_PERIOD);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_CHP_IOFST,
+				       CSR_2L_PXP_TXPLL_CHP_IOFST, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_750M_SYS_CK,
+				       CSR_2L_PXP_TXPLL_CHP_IBIAS, 0x2d);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_REFIN_DIV,
+				     CSR_2L_PXP_TXPLL_REFIN_DIV);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_TCL_LPF_BW,
+				       CSR_2L_PXP_TXPLL_VCO_CFIX, 0x3);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+	airoha_phy_pma0_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW,
+				     PCIE_FORCE_DA_PXP_TXPLL_SDM_PCW,
+				     0xc800000);
+	airoha_phy_pma1_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_SDM_PCW,
+				     PCIE_FORCE_DA_PXP_TXPLL_SDM_PCW,
+				     0xc800000);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SDM_DI_LS,
+				     CSR_2L_PXP_TXPLL_SDM_IFM);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SSC,
+				     CSR_2L_PXP_TXPLL_SSC_PHASE_INI);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_REFIN_DIV,
+				       CSR_2L_PXP_TXPLL_RST_DLY, 0x4);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SDM_DI_LS,
+				     CSR_2L_PXP_TXPLL_SDM_DI_LS);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_SDM_DI_LS,
+				       CSR_2L_PXP_TXPLL_SDM_ORD, 0x3);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_TCL_KBAND_VREF,
+				     CSR_2L_PXP_TXPLL_VCO_KBAND_MEAS_EN);
+	writel(0x0, pcie_phy->csr_2l + REG_CSR_2L_TXPLL_SSC_DELTA1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_CHP_IOFST,
+				       CSR_2L_PXP_TXPLL_LPF_BP, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_CHP_IOFST,
+				       CSR_2L_PXP_TXPLL_LPF_BC, 0x18);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_CHP_IOFST,
+				       CSR_2L_PXP_TXPLL_LPF_BR, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_CHP_IOFST,
+				       CSR_2L_PXP_TXPLL_CHP_IOFST, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_750M_SYS_CK,
+				       CSR_2L_PXP_TXPLL_CHP_IBIAS, 0x2d);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_TCL_VTP,
+				       CSR_2L_PXP_TXPLL_SPARE_L, 0x1);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_LPF_BWR,
+				     CSR_2L_PXP_TXPLL_LPF_BWC);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_POSTDIV,
+				     CSR_2L_PXP_TXPLL_MMD_PREDIV_MODE);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_REFIN_DIV,
+				     CSR_2L_PXP_TXPLL_REFIN_DIV);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_TCL_LPF_BW,
+				   CSR_2L_PXP_TXPLL_VCO_HALFLSB_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_VCO_SCAPWR,
+				       CSR_2L_PXP_TXPLL_VCO_SCAPWR, 0x7);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_TCL_LPF_BW,
+				       CSR_2L_PXP_TXPLL_VCO_CFIX, 0x3);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PR_IDAC,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_SDM_PCW);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SSC,
+				     CSR_2L_PXP_TXPLL_SSC_PHASE_INI);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_LPF_BWR,
+				     CSR_2L_PXP_TXPLL_LPF_BWR);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_PHY_CK2,
+				   CSR_2L_PXP_TXPLL_REFIN_INTERNAL);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_TCL_KBAND_VREF,
+				     CSR_2L_PXP_TXPLL_VCO_KBAND_MEAS_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_VTP,
+				     CSR_2L_PXP_TXPLL_VTP_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_POSTDIV,
+				     CSR_2L_PXP_TXPLL_PHY_CK1_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_PHY_CK2,
+				   CSR_2L_PXP_TXPLL_REFIN_INTERNAL);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_SSC,
+				     CSR_2L_PXP_TXPLL_SSC_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_750M_SYS_CK,
+				     CSR_2L_PXP_TXPLL_LPF_SHCK_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_POSTDIV,
+				     CSR_2L_PXP_TXPLL_POSTDIV_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TXPLL_KBAND_DIV,
+				     CSR_2L_PXP_TXPLL_KBAND_KFC);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_KBAND_DIV,
+				       CSR_2L_PXP_TXPLL_KBAND_KF, 0x3);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_KBAND_DIV,
+				       CSR_2L_PXP_txpll_KBAND_KS, 0x1);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_KBAND_DIV,
+				       CSR_2L_PXP_TXPLL_KBAND_DIV, 0x4);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_LPF_BWR,
+				       CSR_2L_PXP_TXPLL_KBAND_CODE, 0xe4);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_SDM_OUT,
+				   CSR_2L_PXP_TXPLL_TCL_AMP_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TXPLL_TCL_AMP_VREF,
+				   CSR_2L_PXP_TXPLL_TCL_LPF_EN);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_TXPLL_TCL_KBAND_VREF,
+				       CSR_2L_PXP_TXPLL_TCL_KBAND_VREF, 0xf);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_SDM_OUT,
+				       CSR_2L_PXP_TXPLL_TCL_AMP_GAIN, 0x3);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_TXPLL_TCL_AMP_VREF,
+				       CSR_2L_PXP_TXPLL_TCL_AMP_VREF, 0xb);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_TXPLL_TCL_LPF_BW,
+				       CSR_2L_PXP_TXPLL_TCL_LPF_BW, 0x3);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_TXPLL_CKOUT_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_CKOUT_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_TXPLL_CKOUT_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_EN);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_TXPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_SEL_DA_PXP_TXPLL_EN);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_TXPLL_CKOUT,
+				 PCIE_FORCE_DA_PXP_TXPLL_EN);
+}
+
+static void airoha_pcie_phy_init_ssc_jcpll(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_SSC_DELTA1,
+				       CSR_2L_PXP_JCPLL_SSC_DELTA1, 0x106);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_SSC_DELTA1,
+				       CSR_2L_PXP_JCPLL_SSC_DELTA, 0x106);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_JCPLL_SSC_PERIOD,
+				       CSR_2L_PXP_JCPLL_SSC_PERIOD, 0x31b);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				   CSR_2L_PXP_JCPLL_SSC_PHASE_INI);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				   CSR_2L_PXP_JCPLL_SSC_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SDM_IFM,
+				   CSR_2L_PXP_JCPLL_SDM_IFM);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SDM_HREN,
+				   CSR_2L_PXP_JCPLL_SDM_HREN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_RST_DLY,
+				     CSR_2L_PXP_JCPLL_SDM_DI_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				   CSR_2L_PXP_JCPLL_SSC_TRI_EN);
+}
+
+static void
+airoha_pcie_phy_set_rxlan0_signal_detect(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR0_PR_COR_HBW,
+				   CSR_2L_PXP_CDR0_PR_LDO_FORCE_ON);
+
+	usleep_range(100, 200);
+
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_19,
+				     PCIE_PCP_RX_REV0_PCIE_GEN1, 0x18b0);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_20,
+				     PCIE_PCP_RX_REV0_PCIE_GEN2, 0x18b0);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_20,
+				     PCIE_PCP_RX_REV0_PCIE_GEN3, 0x1030);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_SIGDET_DCTEST,
+				       CSR_2L_PXP_RX0_SIGDET_PEAK, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_SIGDET_VTH_SEL,
+				       CSR_2L_PXP_RX0_SIGDET_VTH_SEL, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_REV0,
+				       CSR_2L_PXP_VOS_PNINV, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_SIGDET_DCTEST,
+				       CSR_2L_PXP_RX0_SIGDET_LPF_CTRL, 0x1);
+
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_CAL2,
+				     PCIE_CAL_OUT_OS, 0x0);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_PXP_RX0_FE_VB_EQ2,
+				   CSR_2L_PXP_RX0_FE_VCM_GEN_PWDB);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+				 PCIE_FORCE_SEL_DA_PXP_RX_FE_PWDB);
+	airoha_phy_pma0_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+				     PCIE_FORCE_DA_PXP_RX_FE_GAIN_CTRL, 0x3);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_RX_FORCE_MODE0,
+				     PCIE_FORCE_DA_XPON_RX_FE_GAIN_CTRL, 0x1);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_SIGDET0,
+				     PCIE_SIGDET_WIN_NONVLD_TIMES, 0x3);
+	airoha_phy_pma0_clear_bits(pcie_phy, REG_PCIE_PMA_SEQUENCE_DISB_CTRL1,
+				   PCIE_DISB_RX_SDCAL_EN);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_CTRL_SEQUENCE_FORCE_CTRL1,
+				 PCIE_FORCE_RX_SDCAL_EN);
+	usleep_range(150, 200);
+	airoha_phy_pma0_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_CTRL_SEQUENCE_FORCE_CTRL1,
+				   PCIE_FORCE_RX_SDCAL_EN);
+}
+
+static void
+airoha_pcie_phy_set_rxlan1_signal_detect(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_CDR1_PR_COR_HBW,
+				   CSR_2L_PXP_CDR1_PR_LDO_FORCE_ON);
+
+	usleep_range(100, 200);
+
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_19,
+				     PCIE_PCP_RX_REV0_PCIE_GEN1, 0x18b0);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_20,
+				     PCIE_PCP_RX_REV0_PCIE_GEN2, 0x18b0);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_20,
+				     PCIE_PCP_RX_REV0_PCIE_GEN3, 0x1030);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_SIGDET_NOVTH,
+				       CSR_2L_PXP_RX1_SIGDET_PEAK, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_SIGDET_NOVTH,
+				       CSR_2L_PXP_RX1_SIGDET_VTH_SEL, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_REV0,
+				       CSR_2L_PXP_VOS_PNINV, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_DAC_RANGE_EYE,
+				       CSR_2L_PXP_RX1_SIGDET_LPF_CTRL, 0x1);
+
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_CAL2,
+				     PCIE_CAL_OUT_OS, 0x0);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_RX1_FE_VB_EQ1,
+				   CSR_2L_PXP_RX1_FE_VCM_GEN_PWDB);
+
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+				 PCIE_FORCE_SEL_DA_PXP_RX_FE_PWDB);
+	airoha_phy_pma1_update_field(pcie_phy,
+				     REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_GAIN_CTRL,
+				     PCIE_FORCE_DA_PXP_RX_FE_GAIN_CTRL, 0x3);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_RX_FORCE_MODE0,
+				     PCIE_FORCE_DA_XPON_RX_FE_GAIN_CTRL, 0x1);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_SS_RX_SIGDET0,
+				     PCIE_SIGDET_WIN_NONVLD_TIMES, 0x3);
+	airoha_phy_pma1_clear_bits(pcie_phy, REG_PCIE_PMA_SEQUENCE_DISB_CTRL1,
+				   PCIE_DISB_RX_SDCAL_EN);
+
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_CTRL_SEQUENCE_FORCE_CTRL1,
+				 PCIE_FORCE_RX_SDCAL_EN);
+	usleep_range(150, 200);
+	airoha_phy_pma1_clear_bits(pcie_phy,
+				   REG_PCIE_PMA_CTRL_SEQUENCE_FORCE_CTRL1,
+				   PCIE_FORCE_RX_SDCAL_EN);
+}
+
+static void airoha_pcie_phy_set_rxflow(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_SCAN_RST,
+				 PCIE_FORCE_DA_PXP_RX_SIGDET_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_RX_SIGDET_PWDB);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_SCAN_RST,
+				 PCIE_FORCE_DA_PXP_RX_SIGDET_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_RX_SIGDET_PWDB);
+
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PD_PWDB,
+				 PCIE_FORCE_DA_PXP_CDR_PD_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PD_PWDB);
+	airoha_phy_pma0_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_PWDB,
+				 PCIE_FORCE_DA_PXP_RX_FE_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_RX_FE_PWDB);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_CDR_PD_PWDB,
+				 PCIE_FORCE_DA_PXP_CDR_PD_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_CDR_PD_PWDB);
+	airoha_phy_pma1_set_bits(pcie_phy,
+				 REG_PCIE_PMA_FORCE_DA_PXP_RX_FE_PWDB,
+				 PCIE_FORCE_DA_PXP_RX_FE_PWDB |
+				 PCIE_FORCE_SEL_DA_PXP_RX_FE_PWDB);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_RX0_PHYCK_DIV,
+				   CSR_2L_PXP_RX0_PHYCK_RSTB |
+				   CSR_2L_PXP_RX0_TDC_CK_SEL);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_RX1_PHYCK_DIV,
+				   CSR_2L_PXP_RX1_PHYCK_RSTB |
+				   CSR_2L_PXP_RX1_TDC_CK_SEL);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				 PCIE_SW_RX_FIFO_RST | PCIE_SW_TX_RST |
+				 PCIE_SW_PMA_RST | PCIE_SW_ALLPCS_RST |
+				 PCIE_SW_TX_FIFO_RST);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				 PCIE_SW_RX_FIFO_RST | PCIE_SW_TX_RST |
+				 PCIE_SW_PMA_RST | PCIE_SW_ALLPCS_RST |
+				 PCIE_SW_TX_FIFO_RST);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_PXP_RX0_FE_VB_EQ2,
+				   CSR_2L_PXP_RX0_FE_VB_EQ2_EN |
+				   CSR_2L_PXP_RX0_FE_VB_EQ3_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_RX0_SIGDET_VTH_SEL,
+				   CSR_2L_PXP_RX0_FE_VB_EQ1_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_RX1_FE_VB_EQ1,
+				   CSR_2L_PXP_RX1_FE_VB_EQ1_EN |
+				   CSR_2L_PXP_RX1_FE_VB_EQ2_EN |
+				   CSR_2L_PXP_RX1_FE_VB_EQ3_EN);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_REV0,
+				       CSR_2L_PXP_FE_GAIN_NORMAL_MODE, 0x4);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX0_REV0,
+				       CSR_2L_PXP_FE_GAIN_TRAIN_MODE, 0x4);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_REV0,
+				       CSR_2L_PXP_FE_GAIN_NORMAL_MODE, 0x4);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_REV0,
+				       CSR_2L_PXP_FE_GAIN_TRAIN_MODE, 0x4);
+}
+
+static void airoha_pcie_phy_set_pr(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_PR_VREG_IBAND,
+				       CSR_2L_PXP_CDR0_PR_VREG_IBAND, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_PR_VREG_IBAND,
+				       CSR_2L_PXP_CDR0_PR_VREG_CKBUF, 0x5);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR0_PR_CKREF_DIV,
+				     CSR_2L_PXP_CDR0_PR_CKREF_DIV);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR0_PR_COR_HBW,
+				     CSR_2L_PXP_CDR0_PR_CKREF_DIV1);
+
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_CDR1_PR_VREG_IBAND_VAL,
+				       CSR_2L_PXP_CDR1_PR_VREG_IBAND, 0x5);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_CDR1_PR_VREG_IBAND_VAL,
+				       CSR_2L_PXP_CDR1_PR_VREG_CKBUF, 0x5);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR1_PR_CKREF_DIV,
+				     CSR_2L_PXP_CDR1_PR_CKREF_DIV);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR1_PR_COR_HBW,
+				     CSR_2L_PXP_CDR1_PR_CKREF_DIV1);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_LPF_RATIO,
+				       CSR_2L_PXP_CDR0_LPF_TOP_LIM, 0x20000);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR1_LPF_RATIO,
+				       CSR_2L_PXP_CDR1_LPF_TOP_LIM, 0x20000);
+
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_PR_BETA_DAC,
+				       CSR_2L_PXP_CDR0_PR_BETA_SEL, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR1_PR_BETA_DAC,
+				       CSR_2L_PXP_CDR1_PR_BETA_SEL, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_PR_BETA_DAC,
+				       CSR_2L_PXP_CDR0_PR_KBAND_DIV, 0x4);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR1_PR_BETA_DAC,
+				       CSR_2L_PXP_CDR1_PR_KBAND_DIV, 0x4);
+}
+
+static void airoha_pcie_phy_set_txflow(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TX0_CKLDO,
+				   CSR_2L_PXP_TX0_CKLDO_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TX1_CKLDO,
+				   CSR_2L_PXP_TX1_CKLDO_EN);
+
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TX0_CKLDO,
+				   CSR_2L_PXP_TX0_DMEDGEGEN_EN);
+	airoha_phy_csr_2l_set_bits(pcie_phy, REG_CSR_2L_TX1_CKLDO,
+				   CSR_2L_PXP_TX1_DMEDGEGEN_EN);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_TX1_MULTLANE,
+				     CSR_2L_PXP_TX1_MULTLANE_EN);
+}
+
+static void airoha_pcie_phy_set_rx_mode(struct airoha_pcie_phy *pcie_phy)
+{
+	writel(0x804000, pcie_phy->pma0 + REG_PCIE_PMA_DIG_RESERVE_27);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G1, 0x5);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G2, 0x5);
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G3, 0x5);
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_30,
+				 0x77700);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR0_PR_MONCK,
+				     CSR_2L_PXP_CDR0_PR_MONCK_ENABLE);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR0_PR_MONCK,
+				       CSR_2L_PXP_CDR0_PR_RESERVE0, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_PXP_RX0_OSCAL_CTLE1IOS,
+				       CSR_2L_PXP_RX0_PR_OSCAL_VGA1IOS, 0x19);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_PXP_RX0_OSCA_VGA1VOS,
+				       CSR_2L_PXP_RX0_PR_OSCAL_VGA1VOS, 0x19);
+	airoha_phy_csr_2l_update_field(pcie_phy,
+				       REG_CSR_2L_PXP_RX0_OSCA_VGA1VOS,
+				       CSR_2L_PXP_RX0_PR_OSCAL_VGA2IOS, 0x14);
+
+	writel(0x804000, pcie_phy->pma1 + REG_PCIE_PMA_DIG_RESERVE_27);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G1, 0x5);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G2, 0x5);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_18,
+				     PCIE_PXP_RX_VTH_SEL_PCIE_G3, 0x5);
+
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_30,
+				 0x77700);
+
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_CDR1_PR_MONCK,
+				     CSR_2L_PXP_CDR1_PR_MONCK_ENABLE);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_CDR1_PR_MONCK,
+				       CSR_2L_PXP_CDR1_PR_RESERVE0, 0x2);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_OSCAL_VGA1IOS,
+				       CSR_2L_PXP_RX1_PR_OSCAL_VGA1IOS, 0x19);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_OSCAL_VGA1IOS,
+				       CSR_2L_PXP_RX1_PR_OSCAL_VGA1VOS, 0x19);
+	airoha_phy_csr_2l_update_field(pcie_phy, REG_CSR_2L_RX1_OSCAL_VGA1IOS,
+				       CSR_2L_PXP_RX1_PR_OSCAL_VGA2IOS, 0x14);
+}
+
+static void airoha_pcie_phy_load_kflow(struct airoha_pcie_phy *pcie_phy)
+{
+	airoha_phy_pma0_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_12,
+				     PCIE_FORCE_PMA_RX_SPEED, 0xa);
+	airoha_phy_pma1_update_field(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_12,
+				     PCIE_FORCE_PMA_RX_SPEED, 0xa);
+	airoha_phy_init_lane0_rx_fw_pre_calib(pcie_phy, PCIE_PORT_GEN3);
+	airoha_phy_init_lane1_rx_fw_pre_calib(pcie_phy, PCIE_PORT_GEN3);
+
+	airoha_phy_pma0_clear_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_12,
+				   PCIE_FORCE_PMA_RX_SPEED);
+	airoha_phy_pma1_clear_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_12,
+				   PCIE_FORCE_PMA_RX_SPEED);
+	usleep_range(100, 200);
+
+	airoha_phy_init_lane0_rx_fw_pre_calib(pcie_phy, PCIE_PORT_GEN2);
+	airoha_phy_init_lane1_rx_fw_pre_calib(pcie_phy, PCIE_PORT_GEN2);
+}
+
+/**
+ * airoha_pcie_phy_init() - Initialize the phy
+ * @phy: the phy to be initialized
+ *
+ * Initialize the phy registers.
+ * The hardware settings will be reset during suspend, it should be
+ * reinitialized when the consumer calls phy_init() again on resume.
+ */
+static int airoha_pcie_phy_init(struct phy *phy)
+{
+	struct airoha_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	/* Setup Tx-Rx detection time */
+	val = FIELD_PREP(PCIE_XTP_RXDET_VCM_OFF_STB_T_SEL, 0x33) |
+	      FIELD_PREP(PCIE_XTP_RXDET_EN_STB_T_SEL, 0x1) |
+	      FIELD_PREP(PCIE_XTP_RXDET_FINISH_STB_T_SEL, 0x2) |
+	      FIELD_PREP(PCIE_XTP_TXPD_TX_DATA_EN_DLY, 0x3) |
+	      FIELD_PREP(PCIE_XTP_RXDET_LATCH_STB_T_SEL, 0x1);
+	writel(val, pcie_phy->p0_xr_dtime + REG_PCIE_PEXTP_DIG_GLB44);
+	writel(val, pcie_phy->p1_xr_dtime + REG_PCIE_PEXTP_DIG_GLB44);
+	/* Setup Rx AEQ training time */
+	val = FIELD_PREP(PCIE_XTP_LN_RX_PDOWN_L1P2_EXIT_WAIT, 0x32) |
+	      FIELD_PREP(PCIE_XTP_LN_RX_PDOWN_E0_AEQEN_WAIT, 0x5050);
+	writel(val, pcie_phy->rx_aeq + REG_PCIE_PEXTP_DIG_LN_RX30_P0);
+	writel(val, pcie_phy->rx_aeq + REG_PCIE_PEXTP_DIG_LN_RX30_P1);
+
+	/* enable load FLL-K flow */
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_14,
+				 PCIE_FLL_LOAD_EN);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_DIG_RESERVE_14,
+				 PCIE_FLL_LOAD_EN);
+
+	airoha_pcie_phy_init_default(pcie_phy);
+	airoha_pcie_phy_init_clk_out(pcie_phy);
+	airoha_pcie_phy_init_csr_2l(pcie_phy);
+
+	usleep_range(100, 200);
+
+	airoha_pcie_phy_init_rx(pcie_phy);
+	/* phase 1, no ssc for K TXPLL */
+	airoha_pcie_phy_init_jcpll(pcie_phy);
+
+	usleep_range(500, 600);
+
+	/* TX PLL settings */
+	airoha_pcie_phy_txpll(pcie_phy);
+
+	usleep_range(200, 300);
+
+	/* SSC JCPLL setting */
+	airoha_pcie_phy_init_ssc_jcpll(pcie_phy);
+
+	usleep_range(100, 200);
+
+	/* Rx lan0 signal detect */
+	airoha_pcie_phy_set_rxlan0_signal_detect(pcie_phy);
+	/* Rx lan1 signal detect */
+	airoha_pcie_phy_set_rxlan1_signal_detect(pcie_phy);
+	/* RX FLOW */
+	airoha_pcie_phy_set_rxflow(pcie_phy);
+
+	usleep_range(100, 200);
+
+	airoha_pcie_phy_set_pr(pcie_phy);
+	/* TX FLOW */
+	airoha_pcie_phy_set_txflow(pcie_phy);
+
+	usleep_range(100, 200);
+	/* RX mode setting */
+	airoha_pcie_phy_set_rx_mode(pcie_phy);
+	/* Load K-Flow */
+	airoha_pcie_phy_load_kflow(pcie_phy);
+	airoha_phy_pma0_clear_bits(pcie_phy, REG_PCIE_PMA_SS_DA_XPON_PWDB0,
+				   PCIE_DA_XPON_CDR_PR_PWDB);
+	airoha_phy_pma1_clear_bits(pcie_phy, REG_PCIE_PMA_SS_DA_XPON_PWDB0,
+				   PCIE_DA_XPON_CDR_PR_PWDB);
+
+	usleep_range(100, 200);
+
+	airoha_phy_pma0_set_bits(pcie_phy, REG_PCIE_PMA_SS_DA_XPON_PWDB0,
+				 PCIE_DA_XPON_CDR_PR_PWDB);
+	airoha_phy_pma1_set_bits(pcie_phy, REG_PCIE_PMA_SS_DA_XPON_PWDB0,
+				 PCIE_DA_XPON_CDR_PR_PWDB);
+
+	/* Wait for the PCIe PHY to complete initialization before returning */
+	msleep(PHY_HW_INIT_TIME_MS);
+
+	return 0;
+}
+
+static int airoha_pcie_phy_exit(struct phy *phy)
+{
+	struct airoha_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	airoha_phy_pma0_clear_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				   PCIE_PMA_SW_RST);
+	airoha_phy_pma1_clear_bits(pcie_phy, REG_PCIE_PMA_SW_RESET,
+				   PCIE_PMA_SW_RST);
+	airoha_phy_csr_2l_clear_bits(pcie_phy, REG_CSR_2L_JCPLL_SSC,
+				     CSR_2L_PXP_JCPLL_SSC_PHASE_INI |
+				     CSR_2L_PXP_JCPLL_SSC_TRI_EN |
+				     CSR_2L_PXP_JCPLL_SSC_EN);
+
+	return 0;
+}
+
+static const struct phy_ops airoha_pcie_phy_ops = {
+	.init = airoha_pcie_phy_init,
+	.exit = airoha_pcie_phy_exit,
+	.owner = THIS_MODULE,
+};
+
+static int airoha_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct airoha_pcie_phy *pcie_phy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->csr_2l = devm_platform_ioremap_resource_byname(pdev, "csr-2l");
+	if (IS_ERR(pcie_phy->csr_2l))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->csr_2l),
+				     "Failed to map phy-csr-2l base\n");
+
+	pcie_phy->pma0 = devm_platform_ioremap_resource_byname(pdev, "pma0");
+	if (IS_ERR(pcie_phy->pma0))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->pma0),
+				     "Failed to map phy-pma0 base\n");
+
+	pcie_phy->pma1 = devm_platform_ioremap_resource_byname(pdev, "pma1");
+	if (IS_ERR(pcie_phy->pma1))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->pma1),
+				     "Failed to map phy-pma1 base\n");
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node, &airoha_pcie_phy_ops);
+	if (IS_ERR(pcie_phy->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
+				     "Failed to create PCIe phy\n");
+
+	pcie_phy->p0_xr_dtime =
+		devm_platform_ioremap_resource_byname(pdev, "p0-xr-dtime");
+	if (IS_ERR(pcie_phy->p0_xr_dtime))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->p0_xr_dtime),
+				     "Failed to map P0 Tx-Rx dtime base\n");
+
+	pcie_phy->p1_xr_dtime =
+		devm_platform_ioremap_resource_byname(pdev, "p1-xr-dtime");
+	if (IS_ERR(pcie_phy->p1_xr_dtime))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->p1_xr_dtime),
+				     "Failed to map P1 Tx-Rx dtime base\n");
+
+	pcie_phy->rx_aeq = devm_platform_ioremap_resource_byname(pdev, "rx-aeq");
+	if (IS_ERR(pcie_phy->rx_aeq))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->rx_aeq),
+				     "Failed to map Rx AEQ base\n");
+
+	pcie_phy->dev = dev;
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "PCIe phy probe failed\n");
+
+	return 0;
+}
+
+static const struct of_device_id airoha_pcie_phy_of_match[] = {
+	{ .compatible = "airoha,en7581-pcie-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
+
+static struct platform_driver airoha_pcie_phy_driver = {
+	.probe	= airoha_pcie_phy_probe,
+	.driver	= {
+		.name = "airoha-pcie-phy",
+		.of_match_table = airoha_pcie_phy_of_match,
+	},
+};
+module_platform_driver(airoha_pcie_phy_driver);
+
+MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.48.1



Return-Path: <linux-clk+bounces-19596-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A778A69B65
	for <lists+linux-clk@lfdr.de>; Wed, 19 Mar 2025 22:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 095927AFF0E
	for <lists+linux-clk@lfdr.de>; Wed, 19 Mar 2025 21:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0CD21D591;
	Wed, 19 Mar 2025 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e2eX6k3U"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A521C9EF
	for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421099; cv=none; b=Ci3kIiV4TZbkqit/cizKK2oyJxh7KSYYx7Iicx9yN0n24eZ4zc+SIB7Zrfwoy+GTboIrQdL3H4L5XCJe/+0Nl/byVeeAucmcpAw+rjLYD56x13Evqr7gGzG3B2/2NVV96Lcpqh5u0N7SZfxx1Nkp4HWIex799Ab8zh/gZC9hvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421099; c=relaxed/simple;
	bh=eDNRqUbvzAmNlS85fAcYjalGmSbq3zyjbxYXnR64aTM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up8HMNXmKuxcylChErpPdLAfXfmKhG41DRScEpjGJPKCMXEr8Bct7tGN49loaOgwfW3axjUP9MDrfeQztqs+f6ymi1/ppAxIw8bYP84fjSeBbs0Uzc15M+ZrvSNxbqwHoCf49qKWivdyxsLmYlcc1J5RYrLX1AnDISA6dj6EdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e2eX6k3U; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2440646a12.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 14:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421092; x=1743025892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QevKPwqW8YUaS72p79IwmwVKLmJBNGfQKtwymY/cxYg=;
        b=e2eX6k3ULSSpTC4m13qZxSJdAE+OTyf1yOQl7lt7pIWj5MczE/UXPiQNIG2Dh0nRZF
         CH6AeOETeuoUoFzinO2eMgzoeYz+X8ses63QVj+FlumJeJ6LzaZcfJowusgv9l0O1a7h
         mQF37QdLexxun9LYOXr+c8ocLPDyKCa+dY5hFYmueFdrweCNa1EwMXmyUos6v6553j1J
         iaKI2wb1Jl3ylyrDe3XOjgV6/avEIti+o00ZkUm8j3IJ1RiGlc4stQbJ3P7XCXXQFw7p
         pBxLoriwDrtJXVCI9H0F/h1kT9nfuulGUTDp4Wgmv7XloxvnK0T8+9cf8V0dLqAGAzid
         EukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421092; x=1743025892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QevKPwqW8YUaS72p79IwmwVKLmJBNGfQKtwymY/cxYg=;
        b=sg1lut2zuoVy4U9URKxXfkJg7TnZ5qzeTEGDsiwcrcXx/avt09JTSdNlTgOiaaEm51
         XN2A//8SqKjGlj2sz/guGmnLTaT8qE0N4qd4tjJEbeqbpi/vBbGVz8lWrb3a799ul1wg
         OIdLy2TshAKh/weQmTUD4aQd2SXXnxgNdmLWUEnYNddA/gQDqSObMpB6jFvzULgr1+Pd
         tWG0FDzCBlNMbClSQ3rzxZYIH7uejrHbTJUAVKYXqHlyG2WQb9LzfL2yPP2D0gtL6hlF
         BdDAIVjf8y7yy5/I2MpwQZAW6Z6q/gB2vcEfX0ITy8TVNK8ybG5/JHYBQZL+D+j+hoYC
         rFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWdGpUfd3isOE/lxhzXlBYKzev9wd9AG+yhcesaXVnPKSij7PhZNgUl3DZiHt5l75HV5rxIT9Jxeys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhGYKO6dE/J9k8aOwSb8RTaeWaLRTlNIRRRxxkw7N2c/P9jnP
	ZdsfeD/6kaqJguvju7y1OCDpZcja4pjAmrQSAnIjI1/flDhkrc+2iwSbcrYabS4=
X-Gm-Gg: ASbGncsnJdY0j9yiKjKm7LZazWa9SQHbgu8izXm+Skp2/u0yXoLVFEYPf5sdSrtWmfb
	gmu+tbjBiHELubtbh1fuJa2WluvR9SmV6Rdd/yzKUsj3XQGePwHlvvdtl0rERN2k4wbfbBl75Ov
	ifq0T49Fnxlaqeqsl4F04spmPlZX9BRhnUlk0HjnlMPGYR1XVEFUQSZDAFLxFZHCtvBVgUqgNP1
	qDHusoswJSrgXpVRYE2RjTRLSXMX/v4zrq0tSO+I1rYAcaqKsGKCiDEcweR1qEaL6i7j9ScHK9d
	peDnaVtWor5GsoGVte0QAYbGOYBJ8/ZBRNnBdUx+LXCMFSd7qywVbDqyZEl5jM6VNLaVycao0da
	lKVC5e/pOuQ==
X-Google-Smtp-Source: AGHT+IHAVocnO7DU/71pyjkmZ9uqGOqRjILhUmI5pFJlWP5fB2FXo1jOugt61jiOMW/Ysjy2eEQGhg==
X-Received: by 2002:a17:907:c5c9:b0:ac0:4364:4083 with SMTP id a640c23a62f3a-ac3cd293a02mr150052566b.0.1742421091979;
        Wed, 19 Mar 2025 14:51:31 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ef34asm1079231666b.68.2025.03.19.14.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: [PATCH v8 06/13] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
Date: Wed, 19 Mar 2025 22:52:27 +0100
Message-ID: <511141fb10db44d0500de5a8e65ac1b3aa7316ed.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
Add minimum support for the gpio only portion. The driver is in
pinctrl folder since upcoming patches will add the pinmux/pinctrl
support where the gpio part can be seen as an addition.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 MAINTAINERS                   |   1 +
 drivers/pinctrl/Kconfig       |  11 +
 drivers/pinctrl/Makefile      |   1 +
 drivers/pinctrl/pinctrl-rp1.c | 790 ++++++++++++++++++++++++++++++++++
 4 files changed, 803 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 75263700370d..c2749c588809 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	drivers/clk/clk-rp1.c
+F:	drivers/pinctrl/pinctrl-rp1.c
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 95a8e2b9a614..53b265cabc26 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -612,6 +612,17 @@ config PINCTRL_MLXBF3
 	  each pin. This driver can also be built as a module called
 	  pinctrl-mlxbf3.
 
+config PINCTRL_RP1
+	tristate "Pinctrl driver for RP1"
+	depends on MISC_RP1
+	default MISC_RP1
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
+	  multi function device.
+
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index fba1c56624c0..6fb77de58545 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
 obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
new file mode 100644
index 000000000000..7ff2db0320ba
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -0,0 +1,790 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Raspberry Pi RP1 GPIO unit
+ *
+ * Copyright (C) 2023 Raspberry Pi Ltd.
+ *
+ * This driver is inspired by:
+ * pinctrl-bcm2835.c, please see original file for copyright information
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MODULE_NAME "pinctrl-rp1"
+#define RP1_NUM_GPIOS	54
+#define RP1_NUM_BANKS	3
+
+#define RP1_INT_EDGE_FALLING		BIT(0)
+#define RP1_INT_EDGE_RISING		BIT(1)
+#define RP1_INT_LEVEL_LOW		BIT(2)
+#define RP1_INT_LEVEL_HIGH		BIT(3)
+#define RP1_INT_MASK			GENMASK(3, 0)
+#define RP1_INT_EDGE_BOTH		(RP1_INT_EDGE_FALLING |	\
+					 RP1_INT_EDGE_RISING)
+
+#define RP1_FSEL_COUNT			9
+
+#define RP1_FSEL_ALT0			0x00
+#define RP1_FSEL_GPIO			0x05
+#define RP1_FSEL_NONE			0x09
+#define RP1_FSEL_NONE_HW		0x1f
+
+#define RP1_PAD_DRIVE_2MA		0x0
+#define RP1_PAD_DRIVE_4MA		0x1
+#define RP1_PAD_DRIVE_8MA		0x2
+#define RP1_PAD_DRIVE_12MA		0x3
+
+enum {
+	RP1_PUD_OFF			= 0,
+	RP1_PUD_DOWN			= 1,
+	RP1_PUD_UP			= 2,
+};
+
+enum {
+	RP1_DIR_OUTPUT			= 0,
+	RP1_DIR_INPUT			= 1,
+};
+
+enum {
+	RP1_OUTOVER_PERI		= 0,
+	RP1_OUTOVER_INVPERI		= 1,
+	RP1_OUTOVER_LOW			= 2,
+	RP1_OUTOVER_HIGH		= 3,
+};
+
+enum {
+	RP1_OEOVER_PERI			= 0,
+	RP1_OEOVER_INVPERI		= 1,
+	RP1_OEOVER_DISABLE		= 2,
+	RP1_OEOVER_ENABLE		= 3,
+};
+
+enum {
+	RP1_INOVER_PERI			= 0,
+	RP1_INOVER_INVPERI		= 1,
+	RP1_INOVER_LOW			= 2,
+	RP1_INOVER_HIGH			= 3,
+};
+
+enum {
+	RP1_GPIO_CTRL_IRQRESET_SET		= 0,
+	RP1_GPIO_CTRL_INT_CLR			= 1,
+	RP1_GPIO_CTRL_INT_SET			= 2,
+	RP1_GPIO_CTRL_OEOVER			= 3,
+	RP1_GPIO_CTRL_FUNCSEL			= 4,
+	RP1_GPIO_CTRL_OUTOVER			= 5,
+	RP1_GPIO_CTRL				= 6,
+};
+
+enum {
+	RP1_INTE_SET			= 0,
+	RP1_INTE_CLR			= 1,
+};
+
+enum {
+	RP1_RIO_OUT_SET			= 0,
+	RP1_RIO_OUT_CLR			= 1,
+	RP1_RIO_OE			= 2,
+	RP1_RIO_OE_SET			= 3,
+	RP1_RIO_OE_CLR			= 4,
+	RP1_RIO_IN			= 5,
+};
+
+enum {
+	RP1_PAD_SLEWFAST		= 0,
+	RP1_PAD_SCHMITT			= 1,
+	RP1_PAD_PULL			= 2,
+	RP1_PAD_DRIVE			= 3,
+	RP1_PAD_IN_ENABLE		= 4,
+	RP1_PAD_OUT_DISABLE		= 5,
+};
+
+static const struct reg_field rp1_gpio_fields[] = {
+	[RP1_GPIO_CTRL_IRQRESET_SET]	= REG_FIELD(0x2004, 28, 28),
+	[RP1_GPIO_CTRL_INT_CLR]		= REG_FIELD(0x3004, 20, 23),
+	[RP1_GPIO_CTRL_INT_SET]		= REG_FIELD(0x2004, 20, 23),
+	[RP1_GPIO_CTRL_OEOVER]		= REG_FIELD(0x0004, 14, 15),
+	[RP1_GPIO_CTRL_FUNCSEL]		= REG_FIELD(0x0004, 0, 4),
+	[RP1_GPIO_CTRL_OUTOVER]		= REG_FIELD(0x0004, 12, 13),
+	[RP1_GPIO_CTRL]			= REG_FIELD(0x0004, 0, 31),
+};
+
+static const struct reg_field rp1_inte_fields[] = {
+	[RP1_INTE_SET]			= REG_FIELD(0x2000, 0, 0),
+	[RP1_INTE_CLR]			= REG_FIELD(0x3000, 0, 0),
+};
+
+static const struct reg_field rp1_rio_fields[] = {
+	[RP1_RIO_OUT_SET]		= REG_FIELD(0x2000, 0, 0),
+	[RP1_RIO_OUT_CLR]		= REG_FIELD(0x3000, 0, 0),
+	[RP1_RIO_OE]			= REG_FIELD(0x0004, 0, 0),
+	[RP1_RIO_OE_SET]		= REG_FIELD(0x2004, 0, 0),
+	[RP1_RIO_OE_CLR]		= REG_FIELD(0x3004, 0, 0),
+	[RP1_RIO_IN]			= REG_FIELD(0x0008, 0, 0),
+};
+
+static const struct reg_field rp1_pad_fields[] = {
+	[RP1_PAD_SLEWFAST]		= REG_FIELD(0, 0, 0),
+	[RP1_PAD_SCHMITT]		= REG_FIELD(0, 1, 1),
+	[RP1_PAD_PULL]			= REG_FIELD(0, 2, 3),
+	[RP1_PAD_DRIVE]			= REG_FIELD(0, 4, 5),
+	[RP1_PAD_IN_ENABLE]		= REG_FIELD(0, 6, 6),
+	[RP1_PAD_OUT_DISABLE]		= REG_FIELD(0, 7, 7),
+};
+
+struct rp1_iobank_desc {
+	int min_gpio;
+	int num_gpios;
+	int gpio_offset;
+	int inte_offset;
+	int ints_offset;
+	int rio_offset;
+	int pads_offset;
+};
+
+struct rp1_pin_info {
+	u8 num;
+	u8 bank;
+	u8 offset;
+	u8 fsel;
+	u8 irq_type;
+
+	struct regmap_field *gpio[ARRAY_SIZE(rp1_gpio_fields)];
+	struct regmap_field *rio[ARRAY_SIZE(rp1_rio_fields)];
+	struct regmap_field *inte[ARRAY_SIZE(rp1_inte_fields)];
+	struct regmap_field *pad[ARRAY_SIZE(rp1_pad_fields)];
+};
+
+struct rp1_pinctrl {
+	struct device *dev;
+	void __iomem *gpio_base;
+	void __iomem *rio_base;
+	void __iomem *pads_base;
+	int irq[RP1_NUM_BANKS];
+	struct rp1_pin_info pins[RP1_NUM_GPIOS];
+
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	struct pinctrl_gpio_range gpio_range;
+
+	raw_spinlock_t irq_lock[RP1_NUM_BANKS];
+};
+
+static const struct rp1_iobank_desc rp1_iobanks[RP1_NUM_BANKS] = {
+	/*         gpio   inte    ints     rio    pads */
+	{  0, 28, 0x0000, 0x011c, 0x0124, 0x0000, 0x0004 },
+	{ 28,  6, 0x4000, 0x411c, 0x4124, 0x4000, 0x4004 },
+	{ 34, 20, 0x8000, 0x811c, 0x8124, 0x8000, 0x8004 },
+};
+
+static int rp1_pinconf_set(struct rp1_pin_info *pin,
+			   unsigned int offset, unsigned long *configs,
+			   unsigned int num_configs);
+
+static struct rp1_pin_info *rp1_get_pin(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+
+	if (pc && offset < RP1_NUM_GPIOS)
+		return &pc->pins[offset];
+	return NULL;
+}
+
+static void rp1_input_enable(struct rp1_pin_info *pin, int value)
+{
+	regmap_field_write(pin->pad[RP1_PAD_IN_ENABLE], !!value);
+}
+
+static void rp1_output_enable(struct rp1_pin_info *pin, int value)
+{
+	regmap_field_write(pin->pad[RP1_PAD_OUT_DISABLE], !value);
+}
+
+static u32 rp1_get_fsel(struct rp1_pin_info *pin)
+{
+	u32 oeover, fsel;
+
+	regmap_field_read(pin->gpio[RP1_GPIO_CTRL_OEOVER], &oeover);
+	regmap_field_read(pin->gpio[RP1_GPIO_CTRL_FUNCSEL], &fsel);
+
+	if (oeover != RP1_OEOVER_PERI || fsel >= RP1_FSEL_COUNT)
+		fsel = RP1_FSEL_NONE;
+
+	return fsel;
+}
+
+static void rp1_set_fsel(struct rp1_pin_info *pin, u32 fsel)
+{
+	if (fsel >= RP1_FSEL_COUNT)
+		fsel = RP1_FSEL_NONE_HW;
+
+	rp1_input_enable(pin, 1);
+	rp1_output_enable(pin, 1);
+
+	if (fsel == RP1_FSEL_NONE) {
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OEOVER], RP1_OEOVER_DISABLE);
+	} else {
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OUTOVER], RP1_OUTOVER_PERI);
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OEOVER], RP1_OEOVER_PERI);
+	}
+
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_FUNCSEL], fsel);
+}
+
+static int rp1_get_dir(struct rp1_pin_info *pin)
+{
+	unsigned int val;
+
+	regmap_field_read(pin->rio[RP1_RIO_OE], &val);
+
+	return !val ? RP1_DIR_INPUT : RP1_DIR_OUTPUT;
+}
+
+static void rp1_set_dir(struct rp1_pin_info *pin, bool is_input)
+{
+	int reg = is_input ? RP1_RIO_OE_CLR : RP1_RIO_OE_SET;
+
+	regmap_field_write(pin->rio[reg], 1);
+}
+
+static int rp1_get_value(struct rp1_pin_info *pin)
+{
+	unsigned int val;
+
+	regmap_field_read(pin->rio[RP1_RIO_IN], &val);
+
+	return !!val;
+}
+
+static void rp1_set_value(struct rp1_pin_info *pin, int value)
+{
+	/* Assume the pin is already an output */
+	int reg = value ? RP1_RIO_OUT_SET : RP1_RIO_OUT_CLR;
+
+	regmap_field_write(pin->rio[reg], 1);
+}
+
+static int rp1_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	ret = rp1_get_value(pin);
+
+	return ret;
+}
+
+static void rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (pin)
+		rp1_set_value(pin, value);
+}
+
+static int rp1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	u32 fsel;
+
+	if (!pin)
+		return -EINVAL;
+
+	fsel = rp1_get_fsel(pin);
+	if (fsel != RP1_FSEL_GPIO)
+		return -EINVAL;
+
+	return (rp1_get_dir(pin) == RP1_DIR_OUTPUT) ?
+		GPIO_LINE_DIRECTION_OUT :
+		GPIO_LINE_DIRECTION_IN;
+}
+
+static int rp1_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (!pin)
+		return -EINVAL;
+	rp1_set_dir(pin, RP1_DIR_INPUT);
+	rp1_set_fsel(pin, RP1_FSEL_GPIO);
+
+	return 0;
+}
+
+static int rp1_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+				     int value)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (!pin)
+		return -EINVAL;
+	rp1_set_value(pin, value);
+	rp1_set_dir(pin, RP1_DIR_OUTPUT);
+	rp1_set_fsel(pin, RP1_FSEL_GPIO);
+
+	return 0;
+}
+
+static int rp1_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+			       unsigned long config)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	unsigned long configs[] = { config };
+
+	return rp1_pinconf_set(pin, offset, configs,
+			       ARRAY_SIZE(configs));
+}
+
+static const struct gpio_chip rp1_gpio_chip = {
+	.label = MODULE_NAME,
+	.owner = THIS_MODULE,
+	.request = gpiochip_generic_request,
+	.free = gpiochip_generic_free,
+	.direction_input = rp1_gpio_direction_input,
+	.direction_output = rp1_gpio_direction_output,
+	.get_direction = rp1_gpio_get_direction,
+	.get = rp1_gpio_get,
+	.set = rp1_gpio_set,
+	.base = -1,
+	.set_config = rp1_gpio_set_config,
+	.ngpio = RP1_NUM_GPIOS,
+	.can_sleep = false,
+};
+
+static void rp1_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+	const struct rp1_iobank_desc *bank;
+	int irq = irq_desc_get_irq(desc);
+	unsigned long ints;
+	int bit_pos;
+
+	if (pc->irq[0] == irq)
+		bank = &rp1_iobanks[0];
+	else if (pc->irq[1] == irq)
+		bank = &rp1_iobanks[1];
+	else
+		bank = &rp1_iobanks[2];
+
+	chained_irq_enter(host_chip, desc);
+
+	ints = readl(pc->gpio_base + bank->ints_offset);
+	for_each_set_bit(bit_pos, &ints, 32) {
+		struct rp1_pin_info *pin = rp1_get_pin(chip, bit_pos);
+
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
+						     bank->gpio_offset + bit_pos));
+	}
+
+	chained_irq_exit(host_chip, desc);
+}
+
+static void rp1_gpio_irq_config(struct rp1_pin_info *pin, bool enable)
+{
+	int reg = enable ? RP1_INTE_SET : RP1_INTE_CLR;
+
+	regmap_field_write(pin->inte[reg], 1);
+	if (!enable)
+		/* Clear any latched events */
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+}
+
+static void rp1_gpio_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	rp1_gpio_irq_config(pin, true);
+}
+
+static void rp1_gpio_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	rp1_gpio_irq_config(pin, false);
+}
+
+static int rp1_irq_set_type(struct rp1_pin_info *pin, unsigned int type)
+{
+	u32 irq_flags;
+
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		irq_flags = 0;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		irq_flags = RP1_INT_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_flags = RP1_INT_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_flags = RP1_INT_EDGE_RISING | RP1_INT_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_flags = RP1_INT_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_flags = RP1_INT_LEVEL_LOW;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Clear them all */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_INT_CLR], RP1_INT_MASK);
+
+	/* Set those that are needed */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_INT_SET], irq_flags);
+	pin->irq_type = type;
+
+	return 0;
+}
+
+static int rp1_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+	int bank = pin->bank;
+	unsigned long flags;
+	int ret;
+
+	raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
+
+	ret = rp1_irq_set_type(pin, type);
+	if (!ret) {
+		if (type & IRQ_TYPE_EDGE_BOTH)
+			irq_set_handler_locked(data, handle_edge_irq);
+		else
+			irq_set_handler_locked(data, handle_level_irq);
+	}
+
+	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+
+	return ret;
+}
+
+static void rp1_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	/* Clear any latched events */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+}
+
+static struct irq_chip rp1_gpio_irq_chip = {
+	.name = MODULE_NAME,
+	.irq_enable = rp1_gpio_irq_enable,
+	.irq_disable = rp1_gpio_irq_disable,
+	.irq_set_type = rp1_gpio_irq_set_type,
+	.irq_ack = rp1_gpio_irq_ack,
+	.irq_mask = rp1_gpio_irq_disable,
+	.irq_unmask = rp1_gpio_irq_enable,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void rp1_pull_config_set(struct rp1_pin_info *pin, unsigned int arg)
+{
+	regmap_field_write(pin->pad[RP1_PAD_PULL], arg & 0x3);
+}
+
+static int rp1_pinconf_set(struct rp1_pin_info *pin, unsigned int offset,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	u32 param, arg;
+	int i;
+
+	if (!pin)
+		return -EINVAL;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			rp1_pull_config_set(pin, RP1_PUD_OFF);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			rp1_pull_config_set(pin, RP1_PUD_DOWN);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			rp1_pull_config_set(pin, RP1_PUD_UP);
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			rp1_input_enable(pin, arg);
+			break;
+
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			rp1_output_enable(pin, arg);
+			break;
+
+		case PIN_CONFIG_OUTPUT:
+			rp1_set_value(pin, arg);
+			rp1_set_dir(pin, RP1_DIR_OUTPUT);
+			rp1_set_fsel(pin, RP1_FSEL_GPIO);
+			break;
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			regmap_field_write(pin->pad[RP1_PAD_SCHMITT], !!arg);
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			regmap_field_write(pin->pad[RP1_PAD_SLEWFAST], !!arg);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			switch (arg) {
+			case 2:
+				arg = RP1_PAD_DRIVE_2MA;
+				break;
+			case 4:
+				arg = RP1_PAD_DRIVE_4MA;
+				break;
+			case 8:
+				arg = RP1_PAD_DRIVE_8MA;
+				break;
+			case 12:
+				arg = RP1_PAD_DRIVE_12MA;
+				break;
+			default:
+				return -ENOTSUPP;
+			}
+			regmap_field_write(pin->pad[RP1_PAD_DRIVE], arg);
+			break;
+
+		default:
+			return -ENOTSUPP;
+
+		} /* switch param type */
+	} /* for each config */
+
+	return 0;
+}
+
+static const struct of_device_id rp1_pinctrl_match[] = {
+	{ .compatible = "raspberrypi,rp1-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rp1_pinctrl_match);
+
+static struct rp1_pinctrl rp1_pinctrl_data = {};
+
+static const struct regmap_config rp1_pinctrl_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.name = "rp1-pinctrl",
+};
+
+static int rp1_gen_regfield(struct device *dev,
+			    const struct reg_field *array,
+			    size_t array_size,
+			    int reg_off,
+			    int pin_off,
+			    bool additive_offset,
+			    struct regmap *regmap,
+			    struct regmap_field *out[])
+{
+	struct reg_field regfield;
+	int k;
+
+	for (k = 0; k < array_size; k++) {
+		regfield = array[k];
+		regfield.reg = (additive_offset ? regfield.reg : 0) + reg_off;
+		if (pin_off >= 0) {
+			regfield.lsb = pin_off;
+			regfield.msb = regfield.lsb;
+		}
+		out[k] = devm_regmap_field_alloc(dev, regmap, regfield);
+
+		if (IS_ERR(out[k]))
+			return PTR_ERR(out[k]);
+	}
+
+	return 0;
+}
+
+static int rp1_pinctrl_probe(struct platform_device *pdev)
+{
+	struct regmap *gpio_regmap, *rio_regmap, *pads_regmap;
+	struct rp1_pinctrl *pc = &rp1_pinctrl_data;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct gpio_irq_chip *girq;
+	int err, i;
+
+	pc->dev = dev;
+	pc->gpio_chip = rp1_gpio_chip;
+	pc->gpio_chip.parent = dev;
+
+	pc->gpio_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->gpio_base))
+		return dev_err_probe(dev, PTR_ERR(pc->gpio_base), "could not get GPIO IO memory\n");
+
+	pc->rio_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pc->rio_base))
+		return dev_err_probe(dev, PTR_ERR(pc->rio_base), "could not get RIO IO memory\n");
+
+	pc->pads_base = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(pc->pads_base))
+		return dev_err_probe(dev, PTR_ERR(pc->pads_base), "could not get PADS IO memory\n");
+
+	gpio_regmap = devm_regmap_init_mmio(dev, pc->gpio_base,
+					    &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(gpio_regmap))
+		return dev_err_probe(dev, PTR_ERR(gpio_regmap), "could not init GPIO regmap\n");
+
+	rio_regmap = devm_regmap_init_mmio(dev, pc->rio_base,
+					   &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(rio_regmap))
+		return dev_err_probe(dev, PTR_ERR(rio_regmap), "could not init RIO regmap\n");
+
+	pads_regmap = devm_regmap_init_mmio(dev, pc->pads_base,
+					    &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(pads_regmap))
+		return dev_err_probe(dev, PTR_ERR(pads_regmap), "could not init PADS regmap\n");
+
+	for (i = 0; i < RP1_NUM_BANKS; i++) {
+		const struct rp1_iobank_desc *bank = &rp1_iobanks[i];
+		int j;
+
+		for (j = 0; j < bank->num_gpios; j++) {
+			struct rp1_pin_info *pin =
+				&pc->pins[bank->min_gpio + j];
+			int reg_off;
+
+			pin->num = bank->min_gpio + j;
+			pin->bank = i;
+			pin->offset = j;
+
+			reg_off = bank->gpio_offset + pin->offset *
+				  sizeof(u32) * 2;
+			err = rp1_gen_regfield(dev,
+					       rp1_gpio_fields,
+					       ARRAY_SIZE(rp1_gpio_fields),
+					       reg_off,
+					       -1,
+					       true,
+					       gpio_regmap,
+					       pin->gpio);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for gpio\n");
+
+			reg_off = bank->inte_offset;
+			err = rp1_gen_regfield(dev,
+					       rp1_inte_fields,
+					       ARRAY_SIZE(rp1_inte_fields),
+					       reg_off,
+					       pin->offset,
+					       true,
+					       gpio_regmap,
+					       pin->inte);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for inte\n");
+
+			reg_off = bank->rio_offset;
+			err = rp1_gen_regfield(dev,
+					       rp1_rio_fields,
+					       ARRAY_SIZE(rp1_rio_fields),
+					       reg_off,
+					       pin->offset,
+					       true,
+					       rio_regmap,
+					       pin->rio);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for rio\n");
+
+			reg_off = bank->pads_offset + pin->offset * sizeof(u32);
+			err = rp1_gen_regfield(dev,
+					       rp1_pad_fields,
+					       ARRAY_SIZE(rp1_pad_fields),
+					       reg_off,
+					       -1,
+					       false,
+					       pads_regmap,
+					       pin->pad);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for pad\n");
+		}
+
+		raw_spin_lock_init(&pc->irq_lock[i]);
+	}
+
+	girq = &pc->gpio_chip.irq;
+	girq->chip = &rp1_gpio_irq_chip;
+	girq->parent_handler = rp1_gpio_irq_handler;
+	girq->num_parents = RP1_NUM_BANKS;
+	girq->parents = pc->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	/*
+	 * Use the same handler for all groups: this is necessary
+	 * since we use one gpiochip to cover all lines - the
+	 * irq handler then needs to figure out which group and
+	 * bank that was firing the IRQ and look up the per-group
+	 * and bank data.
+	 */
+	for (i = 0; i < RP1_NUM_BANKS; i++) {
+		pc->irq[i] = irq_of_parse_and_map(np, i);
+		if (!pc->irq[i]) {
+			girq->num_parents = i;
+			break;
+		}
+	}
+
+	platform_set_drvdata(pdev, pc);
+
+	err = devm_gpiochip_add_data(dev, &pc->gpio_chip, pc);
+	if (err)
+		return dev_err_probe(dev, err, "could not add GPIO chip\n");
+
+	return 0;
+}
+
+static struct platform_driver rp1_pinctrl_driver = {
+	.probe = rp1_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = rp1_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(rp1_pinctrl_driver);
+
+MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("RP1 pinctrl/gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3



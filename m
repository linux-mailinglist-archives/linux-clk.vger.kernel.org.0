Return-Path: <linux-clk+bounces-16970-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A803A0BB22
	for <lists+linux-clk@lfdr.de>; Mon, 13 Jan 2025 16:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFEB3AC9E6
	for <lists+linux-clk@lfdr.de>; Mon, 13 Jan 2025 15:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09BA24633F;
	Mon, 13 Jan 2025 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JsdAzcPE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8FA233555
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780259; cv=none; b=KPsnTHUOqOxF52lUj1sxAi0Oc736T0b2uoGSavJycEcDcSDibYbqwuRUizmXrgW/PvTz2ym3EW/lQgGmNJQoChQon75emfsbDzHquKzPX287oNVP8J66T3uxpr9YzDlJwtOiQKo8TK5JXw9dT58a+8Izy/88a5kPYYUw+CLtpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780259; c=relaxed/simple;
	bh=thTlw5JtYu4LeRORhbblRsKwExYVu4wMkqKEuy5JLzs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZwUILLwA2uRcb6oKhboou2xsfR07Ucv4WXLOmhV5IRwGM8rtUm79bq1ISwF5dvliWVRj1ixkZSxkNj/NH05LFqY6Ml5FuvrjZflqT1eKb6/HU9QbD8k90KiC1L1FzhIDzx3Sgj9PD62xmFmaq+XYr8tTv0ya4e8NbOmwlqZRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JsdAzcPE; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so647618166b.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780251; x=1737385051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5Syod//Rmt7/HH9hv4977njkIkORPgD/HA+7eqXGnc=;
        b=JsdAzcPErJYkhfuEuJkzDxDSEl13wJsQLz5i6sPOwhHJjiVD1j0VTRbYrQBzu7LDEn
         RgK0C2hMg5Ivusf+1B2DdK2r8uay4eXV2zD/ZYECvhZyu1d8ifxYtFOZnoshvxcnoNpA
         8UGjTbdSm4V1nzGIHdnpiMiQ0ozg/BotFbPs1vMqzk4ukfyzfGWa+b1g3/KQATJGDlsN
         7i7c1z++++geWByW5c01AzRUBK3FkO0B3ry4Fw+KnqYYx/fuDSoJ+bbN7rW2WRNl9s7l
         hGg2k8bbTCIRUpiJZldyWfCRT96r+dkz7S+CDs+rcZzRjLxWyKiI2Vok2j0tUoQ3Iifp
         o7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780252; x=1737385052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5Syod//Rmt7/HH9hv4977njkIkORPgD/HA+7eqXGnc=;
        b=n/rcoQ9SZehwOYOv+374WGmgd93ekTHRL4/K4qGwPDWrRxj/Nmnc/6CYjJcnkQ9C3E
         JWg5kDlRJbx4aV4bYZ4lRvAiVWTGe8L7YE9KP1dBYsOKsjeDWHcmjeoUHlOB/fj5n3iD
         lwcysuWiYZwen6Y4PRtoaJZ1wIE/fx1R0PORVUy36rCZm+5mV+SZ21AqY1mzyhoMrVew
         AZ6JctJm4feHRBLNfwVqzZWJEmGVQI4EKcesMelluFnHMGpwBtuTx0ptv2Cuq5sBVGYH
         kg27EUW9mEPxXUADBFhGJekbamA34QV2Lk1ymrqRf5hDdR9qRNmV1epy09rdoFYlhCvS
         MD+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJKltTSGEQFQm99JUOgsa5pYGkbDtVJHbWAg48zBxPAWUHxoEtkekwYS6MoVRObjRlivUNWaJwltg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaR2nJuNgSeU5VfmmOzma7JzAcWylkFPUzSD5CA/UBR5hkY/da
	MwGEE2/w4XsCsPKbhR29ZlRTdH0Ek+DPBXdoc7gGkmPUnocytVxMlmRbERBSy5U=
X-Gm-Gg: ASbGncvhcZayKHaFMKthAJg4aaj5Z+hHERO5BP3mUiwQN+m5fRm7FtT/wAlA5w2B5nR
	UJOgUNQBdHbrTzxueZlX7oXPT1BXZJ3qZLX6BfgDVQnVOBUHBHjiokXqeA12aXmP3DTxsIFfvD4
	/vqNm9x7SNvUzdnEpq+tfRLXoD6FVjgrPXWV/O6fMN5+MZeuwFugM6nVLBpqzTvqAx0CmwzPMqx
	hdtjPydJnRo6mMHlcPrVFHy5fKeAaP4u3iQCDqvyv75oPZ+upgREIGddkmbmO8tLryFVD6NTSeS
	ADi8cFZq20POGm4H96s74IuSh9A=
X-Google-Smtp-Source: AGHT+IG9zHWW91Jvy8EOROMgeJXoJxwcxspVbw0esNKFLtYtGz+4WJASTxBZhYi2YeNvBeV6CgyO0w==
X-Received: by 2002:a05:6402:5251:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d972e63ddfmr45448297a12.23.1736780251496;
        Mon, 13 Jan 2025 06:57:31 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm521106966b.10.2025.01.13.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:31 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Date: Mon, 13 Jan 2025 15:58:07 +0100
Message-ID: <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RaspberryPi RP1 is a PCI multi function device containing
peripherals ranging from Ethernet to USB controller, I2C, SPI
and others.

Implement a bare minimum driver to operate the RP1, leveraging
actual OF based driver implementations for the on-board peripherals
by loading a devicetree overlay during driver probe.

The peripherals are accessed by mapping MMIO registers starting
from PCI BAR1 region.

With the overlay approach we can achieve more generic and agnostic
approach to managing this chipset, being that it is a PCI endpoint
and could possibly be reused in other hw implementations. The
presented approach is also used by Bootlin's Microchip LAN966x
patchset (see link) as well, for a similar chipset.

For reasons why this driver is contained in drivers/misc, please
check the links.

This driver is heavily based on downstream code from RaspberryPi
Foundation, and the original author is Phil Elwell.

Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS                   |   1 +
 drivers/misc/Kconfig          |   1 +
 drivers/misc/Makefile         |   1 +
 drivers/misc/rp1/Kconfig      |  21 +++
 drivers/misc/rp1/Makefile     |   3 +
 drivers/misc/rp1/rp1-pci.dtso |   8 +
 drivers/misc/rp1/rp1_pci.c    | 305 ++++++++++++++++++++++++++++++++++
 drivers/misc/rp1/rp1_pci.h    |  14 ++
 drivers/pci/quirks.c          |   1 +
 include/linux/pci_ids.h       |   3 +
 10 files changed, 358 insertions(+)
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fbdd8594aa7e..d67ba6d10aa8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19583,6 +19583,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
 F:	drivers/pinctrl/pinctrl-rp1.c
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 09cbe3f0ab1e..ffa4d8315c35 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -651,4 +651,5 @@ source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
+source "drivers/misc/rp1/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 40bf953185c7..3b6b07a23aac 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -74,3 +74,4 @@ lan966x-pci-objs		:= lan966x_pci.o
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
+obj-$(CONFIG_MISC_RP1)		+= rp1/
diff --git a/drivers/misc/rp1/Kconfig b/drivers/misc/rp1/Kconfig
new file mode 100644
index 000000000000..15c443e13389
--- /dev/null
+++ b/drivers/misc/rp1/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# RaspberryPi RP1 misc device
+#
+
+config MISC_RP1
+	tristate "RaspberryPi RP1 PCIe support"
+	depends on OF_IRQ && PCI_MSI && PCI_QUIRKS
+	select OF_OVERLAY
+	select PCI_DYNAMIC_OF_NODES
+	help
+	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
+
+	  This device supports several sub-devices including e.g. Ethernet
+	  controller, USB controller, I2C, SPI and UART.
+
+	  The driver is responsible for enabling the DT node once the PCIe
+	  endpoint has been configured, and handling interrupts.
+
+	  This driver uses an overlay to load other drivers to support for
+	  RP1 internal sub-devices.
diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
new file mode 100644
index 000000000000..508b4cb05627
--- /dev/null
+++ b/drivers/misc/rp1/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MISC_RP1)		+= rp1-pci.o
+rp1-pci-objs			:= rp1_pci.o rp1-pci.dtbo.o
diff --git a/drivers/misc/rp1/rp1-pci.dtso b/drivers/misc/rp1/rp1-pci.dtso
new file mode 100644
index 000000000000..0bf2f4bb18e6
--- /dev/null
+++ b/drivers/misc/rp1/rp1-pci.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/* the dts overlay is included from the dts directory so
+ * it can be possible to check it with CHECK_DTBS while
+ * also compile it from the driver source directory.
+ */
+
+#include "arm64/broadcom/rp1.dtso"
diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
new file mode 100644
index 000000000000..3e8ba3fa7fd5
--- /dev/null
+++ b/drivers/misc/rp1/rp1_pci.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-24 Raspberry Pi Ltd.
+ * All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+#include "rp1_pci.h"
+
+#define RP1_DRIVER_NAME		"rp1"
+
+#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
+
+#define REG_SET			0x800
+#define REG_CLR			0xc00
+
+/* MSI-X CFG registers start at 0x8 */
+#define MSIX_CFG(x) (0x8 + (4 * (x)))
+
+#define MSIX_CFG_IACK_EN        BIT(3)
+#define MSIX_CFG_IACK           BIT(2)
+#define MSIX_CFG_ENABLE         BIT(0)
+
+/* Address map */
+#define RP1_PCIE_APBS_BASE	0x108000
+
+/* Interrupts */
+#define RP1_INT_END		61
+
+struct rp1_dev {
+	struct pci_dev *pdev;
+	struct irq_domain *domain;
+	struct irq_data *pcie_irqds[64];
+	void __iomem *bar1;
+	int ovcs_id;	/* overlay changeset id */
+	bool level_triggered_irq[RP1_INT_END];
+};
+
+static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
+{
+	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
+}
+
+static void msix_cfg_clr(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
+{
+	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_CLR + MSIX_CFG(hwirq));
+}
+
+static void rp1_mask_irq(struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
+
+	pci_msi_mask_irq(pcie_irqd);
+}
+
+static void rp1_unmask_irq(struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
+
+	pci_msi_unmask_irq(pcie_irqd);
+}
+
+static int rp1_irq_set_type(struct irq_data *irqd, unsigned int type)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	unsigned int hwirq = (unsigned int)irqd->hwirq;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %d\n", hwirq);
+		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
+		rp1->level_triggered_irq[hwirq] = true;
+	break;
+	case IRQ_TYPE_EDGE_RISING:
+		msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
+		rp1->level_triggered_irq[hwirq] = false;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct irq_chip rp1_irq_chip = {
+	.name		= "rp1_irq_chip",
+	.irq_mask	= rp1_mask_irq,
+	.irq_unmask	= rp1_unmask_irq,
+	.irq_set_type	= rp1_irq_set_type,
+};
+
+static void rp1_chained_handle_irq(struct irq_desc *desc)
+{
+	unsigned int hwirq = desc->irq_data.hwirq & RP1_HW_IRQ_MASK;
+	struct rp1_dev *rp1 = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int virq;
+
+	chained_irq_enter(chip, desc);
+
+	virq = irq_find_mapping(rp1->domain, hwirq);
+	generic_handle_irq(virq);
+	if (rp1->level_triggered_irq[hwirq])
+		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int rp1_irq_xlate(struct irq_domain *d, struct device_node *node,
+			 const u32 *intspec, unsigned int intsize,
+			 unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct rp1_dev *rp1 = d->host_data;
+	struct irq_data *pcie_irqd;
+	unsigned long hwirq;
+	int pcie_irq;
+	int ret;
+
+	ret = irq_domain_xlate_twocell(d, node, intspec, intsize,
+				       &hwirq, out_type);
+	if (ret)
+		return ret;
+
+	pcie_irq = pci_irq_vector(rp1->pdev, hwirq);
+	pcie_irqd = irq_get_irq_data(pcie_irq);
+	rp1->pcie_irqds[hwirq] = pcie_irqd;
+	*out_hwirq = hwirq;
+
+	return 0;
+}
+
+static int rp1_irq_activate(struct irq_domain *d, struct irq_data *irqd,
+			    bool reserve)
+{
+	struct rp1_dev *rp1 = d->host_data;
+
+	msix_cfg_set(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
+
+	return 0;
+}
+
+static void rp1_irq_deactivate(struct irq_domain *d, struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = d->host_data;
+
+	msix_cfg_clr(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
+}
+
+static const struct irq_domain_ops rp1_domain_ops = {
+	.xlate      = rp1_irq_xlate,
+	.activate   = rp1_irq_activate,
+	.deactivate = rp1_irq_deactivate,
+};
+
+static void rp1_unregister_interrupts(struct pci_dev *pdev)
+{
+	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
+	int irq, i;
+
+	if (rp1->domain) {
+		for (i = 0; i < RP1_INT_END; i++) {
+			irq = irq_find_mapping(rp1->domain, i);
+			irq_dispose_mapping(irq);
+		}
+
+		irq_domain_remove(rp1->domain);
+	}
+
+	pci_free_irq_vectors(pdev);
+}
+
+static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	u32 dtbo_size = __dtbo_rp1_pci_end - __dtbo_rp1_pci_begin;
+	void *dtbo_start = __dtbo_rp1_pci_begin;
+	struct device *dev = &pdev->dev;
+	struct device_node *rp1_node;
+	struct rp1_dev *rp1;
+	int err = 0;
+	int i;
+
+	rp1_node = dev_of_node(dev);
+	if (!rp1_node) {
+		dev_err(dev, "Missing of_node for device\n");
+		return -EINVAL;
+	}
+
+	rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
+	if (!rp1)
+		return -ENOMEM;
+
+	rp1->pdev = pdev;
+
+	if (pci_resource_len(pdev, 1) <= 0x10000) {
+		dev_err(&pdev->dev,
+			"Not initialised - is the firmware running?\n");
+		return -EINVAL;
+	}
+
+	err = pcim_enable_device(pdev);
+	if (err < 0)
+		return dev_err_probe(&pdev->dev, err,
+				     "Enabling PCI device has failed");
+
+	rp1->bar1 = pcim_iomap(pdev, 1, 0);
+	if (!rp1->bar1) {
+		dev_err(&pdev->dev, "Cannot map PCI BAR\n");
+		return -EIO;
+	}
+
+	pci_set_master(pdev);
+
+	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
+				    PCI_IRQ_MSIX);
+	if (err < 0) {
+		return dev_err_probe(&pdev->dev, err,
+				     "pci_alloc_irq_vectors failed");
+	} else if (err != RP1_INT_END) {
+		dev_err(&pdev->dev, "Cannot allocate enough interrupts\n");
+		return -EINVAL;
+	}
+
+	pci_set_drvdata(pdev, rp1);
+	rp1->domain = irq_domain_add_linear(rp1_node, RP1_INT_END,
+					    &rp1_domain_ops, rp1);
+	if (!rp1->domain) {
+		dev_err(&pdev->dev, "Error creating IRQ domain\n");
+		err = -ENOMEM;
+		goto err_unregister_interrupts;
+	}
+
+	for (i = 0; i < RP1_INT_END; i++) {
+		unsigned int irq = irq_create_mapping(rp1->domain, i);
+
+		if (!irq) {
+			dev_err(&pdev->dev, "failed to create irq mapping\n");
+			err = -EINVAL;
+			goto err_unregister_interrupts;
+		}
+
+		irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
+		irq_set_probe(irq);
+		irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
+						 rp1_chained_handle_irq, rp1);
+	}
+
+	err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id, rp1_node);
+	if (err)
+		goto err_unregister_interrupts;
+
+	err = of_platform_default_populate(rp1_node, NULL, dev);
+	if (err)
+		goto err_unload_overlay;
+
+	return 0;
+
+err_unload_overlay:
+	of_overlay_remove(&rp1->ovcs_id);
+err_unregister_interrupts:
+	rp1_unregister_interrupts(pdev);
+
+	return err;
+}
+
+static void rp1_remove(struct pci_dev *pdev)
+{
+	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	of_platform_depopulate(dev);
+	of_overlay_remove(&rp1->ovcs_id);
+	rp1_unregister_interrupts(pdev);
+}
+
+static const struct pci_device_id dev_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, dev_id_table);
+
+static struct pci_driver rp1_driver = {
+	.name		= RP1_DRIVER_NAME,
+	.id_table	= dev_id_table,
+	.probe		= rp1_probe,
+	.remove		= rp1_remove,
+};
+
+module_pci_driver(rp1_driver);
+
+MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("RP1 wrapper");
+MODULE_LICENSE("GPL");
diff --git a/drivers/misc/rp1/rp1_pci.h b/drivers/misc/rp1/rp1_pci.h
new file mode 100644
index 000000000000..7982f13bad9b
--- /dev/null
+++ b/drivers/misc/rp1/rp1_pci.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2018-24 Raspberry Pi Ltd.
+ * All rights reserved.
+ */
+
+#ifndef _RP1_EXTERN_H_
+#define _RP1_EXTERN_H_
+
+extern char __dtbo_rp1_pci_begin[];
+extern char __dtbo_rp1_pci_end[];
+
+#endif
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 76f4df75b08a..e9a0fb707a4a 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6269,6 +6269,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0, of_pci_make_dev_node);
 
 /*
  * Devices known to require a longer delay before first config space access
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index d2402bf4aea2..9232b131a41e 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2615,6 +2615,9 @@
 #define PCI_VENDOR_ID_TEKRAM		0x1de1
 #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
 
+#define PCI_VENDOR_ID_RPI		0x1de4
+#define PCI_DEVICE_ID_RPI_RP1_C0	0x0001
+
 #define PCI_VENDOR_ID_ALIBABA		0x1ded
 
 #define PCI_VENDOR_ID_CXL		0x1e98
-- 
2.35.3



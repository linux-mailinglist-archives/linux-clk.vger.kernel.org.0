Return-Path: <linux-clk+bounces-23183-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FCDADEC08
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978A04000B7
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEC42E9749;
	Wed, 18 Jun 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IT9Jo25x"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F22E8E17
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249040; cv=none; b=Sc+mYp46Dyh2JkOB30aSYluMkrZpF9kravBTyCB2LspvF+jVh7ApuNgunmoKS/tB5bdOIU55ZNgx+0+Lmix1CbZ5FpThDVKT3lrGn7lJYhFvOOJvWViXBKN4GFqekFt/VC8OG83+S1DbCfhK6ElVNR0aMCyAtMpBv/mP6pIfz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249040; c=relaxed/simple;
	bh=MnWssIe2gPHfcipP/eIFfuXpaV0J/C/5d3IRgfnAQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceAGb6ugQK2SUba4VgIQejqxH3L0IbodyeYRXAJnSIclpBARLCx9X7ux/4Q5crwUjBcbsbkWtkEFI3XI4vZyliCnoB7itUquBhu8bOxmdggDpC8u02BkXeCvsVPWLnsv/Mwxjpw4ccSyfseAa9IN1TcSea40XJajnr5rsA4ySoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IT9Jo25x; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748cd3c8829so1344245b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249037; x=1750853837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=IT9Jo25xCdbOPiCQnMOb/NCrHUZL141F24OYef1o/vRfqJQqaa1utLlidO5nCzL/v/
         W7NdcdBAxmAouYVw3vls1qbI3e5xG0OH3eI3K+C4XPtPAA8wgkO3EDvDtaq9Bj+U8nNY
         aINZL4IEq6nDGHvJ8RpJitcy6QSeO0hGlgritiolGw/xh1ETXn208kT9LPl9fuRj49ST
         guvCwFhsbJdZF4jrsNeLInAQECy1obulVm46esbNgVpIhyqJeIlZuPYW+v2HkVKjc/Xx
         JaTbWp0L4MmNq3W8asZ3uUBEsL7Iof0zpS/8f9I99XaifQN2Is+8B+O024AAui1udMqm
         OfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249037; x=1750853837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=Ysx7gsUiuTDKilFyU8mcMwTHqtVLD5gqqg0o9ky+/W8f40dEbp8Cw8XtQKdmFWMElX
         Iqb0QuHhiDpZGVJ584FNU6/XirwXyyF//RinPPAbCpr78Z+D7lJOsZ1DTE2NgnxcfcNB
         KQIunG95AZlNTP4eleSRJAeIYmz05m9JbCDGVEoeSLDMXoS23pTz6GzrvFAhoszrJBti
         m5WXx2ctBfc54dEzla7WdXQdTVHrhjYHX3Wd6cqk9oDVK2YkpZz0TZDKmp2ttGhljxKr
         FcBBnyYszM+xM2+Hyoxwmu5KZYpUpDbIPyw7/HkENyKbnbaAgGma3MCbCHoLBZchV19h
         kYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcO5kVnUpJyxs6rDU63NXGfCmr3i7MUxNPvez12uIJkSEBJrDpCZ1yRROj8nC0PXT70x2de6QOYH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyimWGhdJCwUfQEEoub2foEcDU35vcMs/HJ30Wn+Gt8RgTtorpO
	67557phuZwlmpyAZnCDwzGg/K4DadMuYdDfFwcP9IQy72RgvNw15rQW906BATHfDPr4=
X-Gm-Gg: ASbGnctnk8vOA5F0ZziRHodoH+LBLxOzwe9Dxs1OofEANu6kO8KPgGDox4EU4rPcQZu
	1JOoHTbrz6vfLLa150WXaDMPyfmEcHGjEsC/kC722pCuArbEAOyLdWCFnsAped3iR66ow152nCU
	EtVVN8wXGri5rpNTAO9GXbn96tZNRTa6Ta87cjAah85DuGevz3LxAKRQz8qSke1rft86d4qDJVR
	LBR/knMg8qYHUWwxJmprgi/vrHT8B00rSYPYI7nj93cd7pRJjxz4c+Yf4HHIxYSpdVeK0SvRXo/
	v/KUXMgAZpEqDLI12pksShf29/W7MVG69UwkdpehQkRnBVIFGkJprv0O7Lc2IDAkD7zNsHUNwa9
	tbPgewC+8EkEZTOnMa3ZbB+ACt2+A
X-Google-Smtp-Source: AGHT+IGZxm5K+fImPTj80yc/09wm99fEy6jDG9RVHP9Gj1V5pfPQ80BXgbZFOxeJiG+mqaum26We2w==
X-Received: by 2002:a05:6a00:14c2:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7489ce0c6bbmr28455044b3a.8.1750249036547;
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed, 18 Jun 2025 17:43:56 +0530
Message-ID: <20250618121358.503781-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 47 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 96bf6aa55681..dfa8cc0e23dd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -619,7 +619,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index c42fceab71fa..6b64a93d3c87 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -9,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -209,6 +211,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -239,6 +243,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	fwnode = dev_fwnode(dev);
+	if (is_acpi_node(fwnode)) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
+					     &nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+
+		/* Update with actual GSI range */
+		if (nr_irqs != priv->nr_irqs)
+			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
+	}
+
 	/* Set the device MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
 		/*
@@ -248,8 +268,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -264,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -273,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
-		.name		= "rpmi-sysmsi",
-		.of_match_table	= rpmi_sysmsi_match,
+		.name			= "rpmi-sysmsi",
+		.of_match_table		= rpmi_sysmsi_match,
+		.acpi_match_table	= acpi_rpmi_sysmsi_match,
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0



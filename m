Return-Path: <linux-clk+bounces-25211-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18201B1382C
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 11:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A78AD17ADD5
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CCF268C40;
	Mon, 28 Jul 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="UcD/plq2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4ED267B02
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695866; cv=none; b=TDkN4VFpZtmeSrMgqScnmuiFqmE6pxq//rIIlyfSrmwSHmWELuvojAND00UP7R1tiKUncZxjttAzhieX5HTU1rfHEMbGehh0XhjR51q5o3wQpCaU8S4oLDMijmxersB1hZNPYlshi1od3SeRkMAYNpaYA+sYtxWbH3XQLlN4Lqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695866; c=relaxed/simple;
	bh=PtaGTQIB63YKTLfgwQ3XfVrixO/1mo3kv8aS9BkGbS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUAR5IhLZqVpMxntIet2zE5CwTGQnacAit9R41Ne2KlUdS7cUwB4PKi82/GDKLD9wPUaAI6/qWOLDXFdlKF/jA4P/bIjDSLcV5AtEkft6VVjPaL/hnjlqlM8g+Hu67k46lGqmBGBka8lXavyvjx2M/TAa33+K8MI1uwQ+9E9aXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=UcD/plq2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3400999a12.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695864; x=1754300664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFGMp/8sUfZuk+3Y8XCd9vyHjPUvGjLmyL+w7ERUYQc=;
        b=UcD/plq22gOfiXDoGt4i9PC7kURdP4tRMllRny12MGACA1zHC878DxljPkXKLHkq1F
         /zhOnRlPL8Vb4cS4igMjZKnI3Yu8mmvgKSbkehPeRFOuDsF0oQFLkb8q3R9Wt9r+KpHW
         2Fz3bR1+r7nc5cXVBVQxTivZVYLbSHl0VwMPkR5IQpOl7JNe7CMWYT3rHjr321sVlcq3
         Ba0wVcOPunlqXm0ns6dHfAHF0DNRtnB5mhvzv4tLAeq+UfXJ//s7olPA5DlGS8wz5lBJ
         lCZIsEw5yUgkLI4YXrXPbJFUrQrDszExgme3V8afex+RF6miY38UXt5Zgm+CO1vqIZVu
         Gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695864; x=1754300664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFGMp/8sUfZuk+3Y8XCd9vyHjPUvGjLmyL+w7ERUYQc=;
        b=DMXHDpD8LgOjpsJy8DvLleHjhxCxSYu2rL+XQVpVnt0Xicve5kPqvtXNFL1f4/ijy+
         H90MCITPgzFY2+BlSDrrlyqOFdQ67X4ZaGOSz4vNa5LxncgnoNJ9gWpaiKcVDGPn4m1S
         l2DVNbgIcEsK7BvzDDiy7Gl9ZHDEBIJ5KeEwvbMu5uFSq1rmt1/j4BEnOP7e4wjtZKvi
         HBuLvBHRVZbjSwZUYxUJIZwMtwEl59QMX1llM344pRk73DJNujcthfOuStae+KuaSv2n
         DTol+ARQiVh9skp1umxm+bXPSpmkcPZT7WiS6BciNh7fWa5y5sTgrFVPLlobouyMUrqe
         1vVw==
X-Forwarded-Encrypted: i=1; AJvYcCXGfSOUNRU8GNFLZ9wevqixd6Xhoyr0JEO75WQ4C1aoxwbJ7jye4bhEuzln6tfjpcRNWT8HzVpjdbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDG2rAxd9PK0SeeS+W3/6xuWjbvarE7d5q2heHsr9vgdf3jHuP
	J43tnkjJB04+dvenTFOUhEWFTejLD8wuJ9VT+uP7RBoewODmMiGyGDLFfa4M9z7Y0P8=
X-Gm-Gg: ASbGnctha3KS+ZSOeyJS32XbmT3bqki7vBNNY4lSo1aKhKmQR6pSkkbHhFwf8hdkhn6
	P2fLzAMnnKg9a3VpWZf6HwzXZQXASy+jm77cXrCNNxuIRn6ifk4E+xqkAX4CceUefL4OWNv3lg7
	OFuH1AERJ3ynl6xzY7H7gkPy/ZLuVqFUe2gLpcaicXJvRKGFu9Vl6sVU5HXkdipmiVfzx1SfYLY
	zg9REs57BOti3ekhoe3l7zNJLg7ABDjygef/b2RrvOH9iXZzDmFVPJCnhyZjUdFFgfAkzwGJOcc
	P1dOPgV09DehsmGD0awKpOmyWQ0WpghH1PW0H+z+fHTCeJyunYxkK7HxGI9EA1cVlDxv7pKSPf2
	YBf0d/oHylVJBBT+wmkSitkkyv8CovwlgrZ1tQ42AxxspCr07CzLlrtQni7hP
X-Google-Smtp-Source: AGHT+IEDGiXI75AkHkQ4o0aOIbn/4zDgCxZFmEByTpNI6PDAP9qRlU1aFkohBNQLk3i6jzgU5OxoGg==
X-Received: by 2002:a17:90b:4d10:b0:31e:a0a9:753e with SMTP id 98e67ed59e1d1-31ea0a97a21mr9736203a91.25.1753695863519;
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon, 28 Jul 2025 15:10:29 +0530
Message-ID: <20250728094032.63545-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 1a8a74d3ad4b..a739088c3d4c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,9 +5,11 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/minmax.h>
@@ -902,6 +904,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	 * explicitly configure here.
 	 */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -909,8 +913,15 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -958,6 +969,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -977,10 +995,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = mpxy_mbox_acpi_match,
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0



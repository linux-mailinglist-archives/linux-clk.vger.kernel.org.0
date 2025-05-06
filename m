Return-Path: <linux-clk+bounces-21467-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840BAACF52
	for <lists+linux-clk@lfdr.de>; Tue,  6 May 2025 23:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071EE189D5FE
	for <lists+linux-clk@lfdr.de>; Tue,  6 May 2025 21:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76AB21C174;
	Tue,  6 May 2025 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dtmoq59L"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2945B21A427
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565613; cv=none; b=IMwD9VslKlEnShoE3WgfF0KI9UgAIdox/fZLgRm7+D6+aJ1ndkT5DsmGZqnLQUv8d77zf3TprwEGuxopqtsh0QiDq8WmrfDu8MhrCbNCaJVaqqfJLM35AGebY18c+7vALDUZfWbw21n45C2NoSXlSxC1H6RKhPHnN8KqmswEN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565613; c=relaxed/simple;
	bh=nqsH3yR3Ezq0Bm/Bx2cPVqA6NKWuwnXVjVbuASJM7yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFvh5jxf+AxIPYgndrfkWuKBCITj4O8oadJkXJidfZGyypVApGmtdc82PdAirxN1CbuGWc4If9qpGuApGKMAYosBkH+HUKqVpC4LstEXMwvqAp82cwxCR9tI986DA2XhfK8baL18OMSzSDyoSuIv38RW3hPEb4Fx4Eb2HemHwUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dtmoq59L; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85e15dc8035so183295239f.0
        for <linux-clk@vger.kernel.org>; Tue, 06 May 2025 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565609; x=1747170409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woLn9Vv7U1eAB3kmEge6xMExWIQJbuvrft+klRkSVKw=;
        b=Dtmoq59Lc+89DVAYAtVdSAazv0+5ZPBoimIn5MO3V7JIGCpstYMlG2apAdmKO/5Pgq
         6OicCHwLEyNWvalccR0BzxUDbPNeUWpCYsRPu8FEsYxdoqo1abaSZQr8LGocnp5pr8Zj
         Dem0/C061p2gqaHUdkRpA0T7u/ZxZ3sjfLjKIEjRwgT6pOmdwRpmkQEiupi8BtKj8q+l
         A1cnx0D4CfAJOtQQGfN8uR2HSv9e9VFeuv4Q0IcyRo2+HtmxVwwu5T7uclYpsNMEMJWS
         cqdyea+tvaAch1PBj4gLaV2G5/lgQ12Ny2s8wH1IABNHKjdVVE6O454w6cCNMlT6loda
         egFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565609; x=1747170409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woLn9Vv7U1eAB3kmEge6xMExWIQJbuvrft+klRkSVKw=;
        b=A1KQQuu0BYpg3PlMKb1YZPElXQdOp053X/DSTKKOVveRnH8rOaLKrZIGS+TOnenXG5
         fYTbgOMFSJs0BQqcXAkS+Fo3YZ9rJeVjjPHUJIg2CDoob5Mh0/CBK9WGgXOzvie0u3AB
         Qjj6A2yP4vg+d8gf5h9n+lvYDSZnvenKIvwHRRdKpk03WbuMQ5rWJBQIkhJQRZmxpeNS
         KyJjy7GeuSDWbgkE/jrPBTmlgbE/Kope+4etXaLdi77JgfymX9jbTpBP0JTXyPK70gfu
         OQ01E6Ozwx4j1yQ1iQSNpFxhc3T8ai2b9QzcaosesmoyCr0iOcYMyFAPitX6CU2e8zlu
         KxYA==
X-Forwarded-Encrypted: i=1; AJvYcCUENlI2WCbXeM3judTXcHtSIdu/ICtVJHQTlYcL+9Z476FeVmGAlVC/x9oYDQdo43k7RhYNQT1noOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE72KZqbiFJsEmdEkDeSV+psL1nz4PiUxcOY2YRNHdtRP1cR2P
	cQqX4fl2bsLxeUJOmpzEqmymYsUQOyZpMKDae3rtQHj/gWBQIDdhCmFJk8NODxk=
X-Gm-Gg: ASbGncv+cxBC+yM6KdbgOcUpeFVnTnjPHwPnUNlAIWNV5idjs09cwO47gflsTGbEyV2
	0vG1Ne3BEMZhqLg5hdfOWiwPWXJnofPancZKYKIYzphS7NIiDNPX4MhDm9A8E2+NnUNC834v+JO
	tlwYuS6ZQHEQu97FO70u0yxXie641Gau0RmR341otFPOHvRmeIXpZHTvVDqdKgEW4s5I7oW/L2P
	DHcr5VfigW9b53Xrc2TFh0r7eFK6E0mRo418Dv6J8YMoQisbzKpWhIXn/PllaxKwlUk33twAcH/
	Bx5FmyYdiH0WuUJiQpPzDr500TkPRri1sq4DNm+GBJFAG43QC4Kg51mCla2ZlfEEKtMJBoQryfB
	k4vYQ18yMcOgd0hYqSfeXOF06
X-Google-Smtp-Source: AGHT+IG44A/k6YY4+4TVqNrhG/OugRCgRTsVXuJEoJBMUIWbFJj0TsYrtdiwe53mCPOKw5twIJyW6w==
X-Received: by 2002:a05:6e02:1a24:b0:3d6:d145:3006 with SMTP id e9e14a558f8ab-3da73935b2fmr8546905ab.20.1746565609062;
        Tue, 06 May 2025 14:06:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU resets
Date: Tue,  6 May 2025 16:06:35 -0500
Message-ID: <20250506210638.2800228-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement reset support for SpacemiT CCUs.  The code is structured to
handle SpacemiT resets generically, while defining the set of specific
reset controllers and their resets in an SoC-specific source file.  A
SpacemiT reset controller device is an auxiliary device associated with
a clock controller (CCU).

This initial patch defines the reset controllers for the MPMU, APBC, and
MPMU CCUs, which already defined clock controllers.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/reset/Kconfig           |   1 +
 drivers/reset/Makefile          |   1 +
 drivers/reset/spacemit/Kconfig  |  12 +++
 drivers/reset/spacemit/Makefile |   7 ++
 drivers/reset/spacemit/core.c   |  61 +++++++++++
 drivers/reset/spacemit/core.h   |  39 +++++++
 drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
 7 files changed, 298 insertions(+)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/core.c
 create mode 100644 drivers/reset/spacemit/core.h
 create mode 100644 drivers/reset/spacemit/k1.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e686..b1f1af50ca10b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -354,6 +354,7 @@ source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 31f9904d13f9c..6c19fd875ff13 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
new file mode 100644
index 0000000000000..4ff3487a99eff
--- /dev/null
+++ b/drivers/reset/spacemit/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SPACEMIT
+	bool
+
+config RESET_SPACEMIT_K1
+	tristate "SpacemiT K1 reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select RESET_SPACEMIT
+	default ARCH_SPACEMIT
+	help
+	  This enables the reset controller driver for the SpacemiT K1 SoC.
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
new file mode 100644
index 0000000000000..3a064e9d5d6b4
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
+
+reset_spacemit-y				:= core.o
+
+reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o
diff --git a/drivers/reset/spacemit/core.c b/drivers/reset/spacemit/core.c
new file mode 100644
index 0000000000000..5cd981eb3f097
--- /dev/null
+++ b/drivers/reset/spacemit/core.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT reset driver core */
+
+#include <linux/container_of.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+#include "core.h"
+
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
+/**
+ * spacemit_reset_controller_register() - register a reset controller
+ * @dev:	Device that's registering the controller
+ * @controller:	SpacemiT CCU reset controller structure
+ */
+int spacemit_reset_controller_register(struct device *dev,
+				       struct ccu_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
diff --git a/drivers/reset/spacemit/core.h b/drivers/reset/spacemit/core.h
new file mode 100644
index 0000000000000..a71f835ccb779
--- /dev/null
+++ b/drivers/reset/spacemit/core.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* SpacemiT reset driver core */
+
+#ifndef __RESET_SPACEMIT_CORE_H__
+#define __RESET_SPACEMIT_CORE_H__
+
+#include <linux/device.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
+struct ccu_reset_controller_data {
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t count;
+};
+
+struct ccu_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct ccu_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+extern int spacemit_reset_controller_register(struct device *dev,
+			      struct ccu_reset_controller *controller);
+
+#endif /* __RESET_SPACEMIT_CORE_H__ */
diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
new file mode 100644
index 0000000000000..19a34f151b214
--- /dev/null
+++ b/drivers/reset/spacemit/k1.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT reset driver data for the K1 SoC */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+#include <soc/spacemit/ccu_k1.h>
+#include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+#include "core.h"
+
+static const struct ccu_reset_data mpmu_resets[] = {
+	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_mpmu_reset_data = {
+	.reset_data	= mpmu_resets,
+	.count		= ARRAY_SIZE(mpmu_resets),
+};
+
+static const struct ccu_reset_data apbc_resets[] = {
+	[RESET_UART0]	= RESET_DATA(APBC_UART1_CLK_RST,	BIT(2),	0),
+	[RESET_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2), 0),
+	[RESET_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_SSP3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2), 0),
+	[RESET_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_IR]	= RESET_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI7]	= RESET_DATA(APBC_TWSI7_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_IPC_AP2AUD] = RESET_DATA(APBC_IPC_AP2AUD_CLK_RST, BIT(2), 0),
+	[RESET_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2), 0),
+	[RESET_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2), 0),
+	[RESET_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2), 0),
+	[RESET_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2), 0),
+	[RESET_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2), 0),
+	[RESET_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2), 0),
+	[RESET_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc_reset_data = {
+	.reset_data	= apbc_resets,
+	.count		= ARRAY_SIZE(apbc_resets),
+};
+
+static const struct ccu_reset_data apmu_resets[] = {
+	[RESET_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_CCIC1_PHY] = RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_USBP1_AXI] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_USB_AXI]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_USB3_0]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(11) | BIT(10) | BIT(9)),
+	[RESET_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_QSPI_BUS] = RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AES]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC_X]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AUDIO]	= RESET_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(3) | BIT(2) | BIT(0)),
+	[RESET_HDMI]	= RESET_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_PCIE0]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE1]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE2]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_JPG]	= RESET_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_CCIC2PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_CCIC3PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(29)),
+	[RESET_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(1)),
+	[RESET_ISP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_ISP_CPP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RESET_ISP_BUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_ISP_CI]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RESET_DPU_MCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_DPU_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_DPU_HCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_DPU_SPIBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(4)),
+	[RESET_DPU_SPI_HBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_MIPI]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RESET_MC]	= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_apmu_reset_data = {
+	.reset_data	= apmu_resets,
+	.count		= ARRAY_SIZE(apmu_resets),
+};
+
+static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
+	const void *data = (void *)id->driver_data;
+	struct ccu_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENODEV;
+	controller->data = data;
+	controller->regmap = rdev->regmap;
+
+	return spacemit_reset_controller_register(dev, controller);
+}
+
+#define K1_AUX_DEV_ID(_unit) \
+	{ \
+		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
+	}
+
+static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
+	K1_AUX_DEV_ID(mpmu),
+	K1_AUX_DEV_ID(apbc),
+	K1_AUX_DEV_ID(apmu),
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
+
+#undef K1_AUX_DEV_ID
+
+static struct auxiliary_driver spacemit_k1_reset_driver = {
+	.probe          = spacemit_k1_reset_probe,
+	.id_table       = spacemit_k1_reset_ids,
+};
+module_auxiliary_driver(spacemit_k1_reset_driver);
-- 
2.45.2



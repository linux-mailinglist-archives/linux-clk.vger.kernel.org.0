Return-Path: <linux-clk+bounces-10510-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4C94BAF6
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 12:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9181C222D7
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 10:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512D218C904;
	Thu,  8 Aug 2024 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2Sim2PFp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320518B48A
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112891; cv=none; b=D3kY1EirleZOtXilQ9de1Enz3ke8Lttf4f92qviFZP+Eo0M67ijm31boJ9TX/okRws2wFuqGCyWXVzshtGbtGSH21tUlR4NhDuVnzZyisJgvQjB5FL6xkSO4/DzFuUodn252Np+DDWqo0BdSNaidW7ozFn2Ue0XsAiVlng7s+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112891; c=relaxed/simple;
	bh=mFDjyf3WRN8A9pQQQLievbp8sSfjF42ekOPZY+9tCUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4F3vR0tMMk6WZQkvQQvffc2wBtB0wxqO3WEWqTYWWAksMpr0gOq+oaDhR9BHSmpX7MlsiAUXAflAwSPLQaxsWIp74OYXvjsv/D9bbh4JOPmv39PP/PH7li0Ke6Kih+bu7L51oaUDnt4DsZTErjNHWiJ/kJo3tGMuErYQdCzNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2Sim2PFp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36bb2047bf4so515912f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112887; x=1723717687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x1lfpdLeHdHaVZLxnPFzwGf3V/7oMT6QazhAgPTFUc=;
        b=2Sim2PFpS9Kc4JJRdksWS17AmrWtApmZBa0DscDBhcMsv9xU6ufvhOIPuMJBGZyZ0n
         xuwwi5MN0VrtMHogMqj2zZRcVBVcObd/dnwgH3XCc09mSN5scn2WcKOEc0fS+W3AZViA
         MuhneWPgO0fEx4VDiCpaSEzUmz0tD1hwcEyo5Nu4z1cgba060o4b1dlEzs5E6VnGAVNp
         kdF1OZMsJh6gzXvxWxdSDHtpSeSlDH1RnCVAcw3UDM/sdUbNYB1DWszfb1ojQMThFlF4
         kdzYdI6E9tDaV7npAw/Eu5eJj2AoLDwfjKw0OEtMTD1vPmOFRlhRAz6g0f8Isu1xr95n
         JqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112887; x=1723717687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0x1lfpdLeHdHaVZLxnPFzwGf3V/7oMT6QazhAgPTFUc=;
        b=qTEGbHZER7onwKKMpadhtag37Qho6SxWjLRSgui2LrNOeg6gZOIvgzqfEY6fFaUYLd
         mGLuicLE8Gp0Y32VRG5dvLkLWYD74EUvv4IhiOv9DK5JKmWqI7y/+yRB/QQ/Ph+h/u0I
         MLmc8YelBPoMwDBcUMx7xCrgFktS+ZeVWD6LDujp9teIz4dbOg4VQpufJY89FxX48DgN
         O+DOUXIMCccPEvKVej8DH0wtlFiYl/hKUITRDzzt2Q+FOnX9Dizxk2Ffzu3OjU/hagRV
         APsORFMMCUwhLuTEJP4ZBSs2tt6ZvrGntlVKn1paUwHnJf3moL1Z+pMb0vViQg85yKbR
         aWsw==
X-Forwarded-Encrypted: i=1; AJvYcCXJZJZlqLSxQgB/TKltHsUtAxO1y71B4Efc26/xJfLsDUhTjn/pTRWHyxKKbzgig3yRB3ws7OtZicWrhsZTuUi3W51A1h38FGH9
X-Gm-Message-State: AOJu0YyAcDrS0Iog3fgMq6C3ly5jX7xFjl7cTWcxCnW+/aVROsg1jI1b
	472VZJAe3lRgqr7gCB6Gkal+7KqjR9KWs+OvvlEqTS4C4RHuHIUVp3cFvDUMGoM=
X-Google-Smtp-Source: AGHT+IF44atPcsfUXvMJQaD7h568xLsRA9KqH/4UoYtbI1jiNngo54AyUWhS/kjqhCBIq1PF0BbzEg==
X-Received: by 2002:adf:fe12:0:b0:362:8ec2:53d6 with SMTP id ffacd0b85a97d-36d2757dcd3mr1025346f8f.61.1723112887285;
        Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 8/9] reset: amlogic: split the device core and platform probe
Date: Thu,  8 Aug 2024 12:27:38 +0200
Message-ID: <20240808102742.4095904-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

To prepare the addition of the auxiliary device support, split
out the device core function from the probe of the platform device.

The device core function will be common to both the platform and auxiliary
driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/amlogic/Kconfig                 |  10 +-
 drivers/reset/amlogic/Makefile                |   3 +-
 .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
 drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
 drivers/reset/amlogic/reset-meson.h           |  24 +++++
 5 files changed, 143 insertions(+), 87 deletions(-)
 rename drivers/reset/amlogic/{reset-meson.c => reset-meson-core.c} (51%)
 create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 7ed9cf50f038..04c7be0f3165 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -1,9 +1,15 @@
+config RESET_MESON_CORE
+	tristate
+	select REGMAP
+
 config RESET_MESON
-	tristate "Meson Reset Driver"
+	tristate "Meson Reset Platform Driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
+	select REGMAP_MMIO
+	select RESET_MESON_CORE
 	help
-	  This enables the reset driver for Amlogic Meson SoCs.
+	  This enables the reset platform driver for Amlogic SoCs.
 
 config RESET_MESON_AUDIO_ARB
 	tristate "Meson Audio Memory Arbiter Reset Driver"
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
index 55509fc78513..0f8f9121b566 100644
--- a/drivers/reset/amlogic/Makefile
+++ b/drivers/reset/amlogic/Makefile
@@ -1,2 +1,3 @@
-obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
+obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson-core.c
similarity index 51%
rename from drivers/reset/amlogic/reset-meson.c
rename to drivers/reset/amlogic/reset-meson-core.c
index b16d9c32adb1..ea4fc562f7e6 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson-core.c
@@ -1,27 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /*
- * Amlogic Meson Reset Controller driver
+ * Amlogic Meson Reset core functions
  *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/of.h>
+
+#include <linux/device.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
-#include <linux/slab.h>
-#include <linux/types.h>
-
-struct meson_reset_param {
-	unsigned int reset_num;
-	unsigned int reset_offset;
-	unsigned int level_offset;
-	bool level_low_reset;
-};
+
+#include "reset-meson.h"
 
 struct meson_reset {
 	const struct meson_reset_param *param;
@@ -102,84 +92,27 @@ static const struct reset_control_ops meson_reset_ops = {
 	.status		= meson_reset_status,
 };
 
-static const struct meson_reset_param meson8b_param = {
-	.reset_num	= 256,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x7c,
-	.level_low_reset = true,
-};
-
-static const struct meson_reset_param meson_a1_param = {
-	.reset_num	= 96,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x40,
-	.level_low_reset = true,
-};
-
-static const struct meson_reset_param meson_s4_param = {
-	.reset_num	= 192,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x40,
-	.level_low_reset = true,
-};
-
-static const struct of_device_id meson_reset_dt_ids[] = {
-	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
-	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
-	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
-	 { /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
-
-static const struct regmap_config regmap_config = {
-	.reg_bits   = 32,
-	.val_bits   = 32,
-	.reg_stride = 4,
-};
-
-static int meson_reset_probe(struct platform_device *pdev)
+int meson_reset_probe(struct device *dev, struct regmap *map,
+		      const struct meson_reset_param *param)
 {
-	struct device *dev = &pdev->dev;
 	struct meson_reset *data;
-	void __iomem *base;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	data->param = device_get_match_data(dev);
-	if (!data->param)
-		return -ENODEV;
-
-	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
-	if (IS_ERR(data->map))
-		return dev_err_probe(dev, PTR_ERR(data->map),
-				     "can't init regmap mmio region\n");
-
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reset_num;
+	data->param = param;
+	data->map = map;
+	data->rcdev.owner = dev->driver->owner;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
+EXPORT_SYMBOL_NS_GPL(meson_reset_probe, MESON_RESET);
 
-static struct platform_driver meson_reset_driver = {
-	.probe	= meson_reset_probe,
-	.driver = {
-		.name		= "meson_reset",
-		.of_match_table	= meson_reset_dt_ids,
-	},
-};
-module_platform_driver(meson_reset_driver);
-
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
new file mode 100644
index 000000000000..97e933b4aa34
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson-pltf.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Amlogic Meson Reset platform driver
+ *
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include "reset-meson.h"
+
+static const struct meson_reset_param meson8b_param = {
+	.reset_num	= 256,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x7c,
+	.level_low_reset = true,
+};
+
+static const struct meson_reset_param meson_a1_param = {
+	.reset_num	= 96,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x40,
+	.level_low_reset = true,
+};
+
+static const struct meson_reset_param meson_s4_param = {
+	.reset_num	= 192,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x40,
+	.level_low_reset = true,
+};
+
+static const struct of_device_id meson_reset_dt_ids[] = {
+	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
+	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
+	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
+	 { /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
+
+static const struct regmap_config regmap_config = {
+	.reg_bits   = 32,
+	.val_bits   = 32,
+	.reg_stride = 4,
+};
+
+static int meson_reset_pltf_probe(struct platform_device *pdev)
+{
+	const struct meson_reset_param *param;
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	param = device_get_match_data(dev);
+	if (!param)
+		return -ENODEV;
+
+	map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
+				     "can't init regmap mmio region\n");
+
+	return meson_reset_probe(dev, map, param);
+}
+
+static struct platform_driver meson_reset_pltf_driver = {
+	.probe	= meson_reset_pltf_probe,
+	.driver = {
+		.name		= "meson_reset",
+		.of_match_table	= meson_reset_dt_ids,
+	},
+};
+module_platform_driver(meson_reset_pltf_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Platform Controller driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
new file mode 100644
index 000000000000..c2e8a5cf2e46
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_RESET_CORE_H
+#define __MESON_RESET_CORE_H
+
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+struct meson_reset_param {
+	unsigned int reset_num;
+	unsigned int reset_offset;
+	unsigned int level_offset;
+	bool level_low_reset;
+};
+
+int meson_reset_probe(struct device *dev, struct regmap *map,
+		      const struct meson_reset_param *param);
+
+#endif /* __MESON_RESET_CORE_H */
-- 
2.43.0



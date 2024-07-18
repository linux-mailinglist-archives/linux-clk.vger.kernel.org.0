Return-Path: <linux-clk+bounces-9789-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAD934B60
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 11:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF56028575B
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1BC13B295;
	Thu, 18 Jul 2024 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ez2FVjhx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE513664E
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296693; cv=none; b=hBB9F9CjSVNFAuu2gGxfYVjYIZB4wpXWZucF3orgVDi46F9mvCgBYYdeJRHWGIxjsBcuoOsY09B4wq9pD6hu/cBxwXezlEqt4dbJMlHvCeOCHBubWhzfylig1Tqv8Wc0AMCpCrc2NFQ8tcfRrHYOVt+9q+cVVjzn5F1XbCdGUOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296693; c=relaxed/simple;
	bh=YX9oOmzuen/R6INXwW5TFjcGneUcqK6jfmkokW+qGUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCvVcVW5LvFessli/EQX+gtQRKwUmLif65mn/Ic7umML1F4TL6w5bLZKd5he+UzVbbKqxIGmPZaPCrC9eTVgzIFbpj/ONUmdh1rQPTrUo7+imvR5tyVSFPgw+PTZ/f1Wvd/rrl1mQAHmdFQ++ID/v3ja88Xy6BdMcjG0n09JaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ez2FVjhx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367940c57ddso310228f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296690; x=1721901490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCH5u/ZQ46EyBFByLmOEPWmFGVlqJDI/+pS92Vu1GSk=;
        b=Ez2FVjhx9Ptz+5YbOpyS7Sr35XamlSVgEMQjgIL3Ml9rjqRMkMwrYsYrhtg8ajPB5z
         OE5i0tlzovVEmTMyKE8m+/O+9FbMalg9oTrkFisFRjerq0AIIbzeeprzrzmQ8XR6IV2X
         iGmK5Iak34uigRsaO/fyEU3kVztPMntDj1+qNHLLRExIZvlheNjAUsa6if42mMcCTE87
         5j3rnnK+QPCaHlFSh4+bM6T6QOHvgp6wSEZMWelU0HwsbSwBR/tR3pAs3AufWYLkgxDG
         6WZnmTuWfTBzIYnkelCJnggEFQUW9M+ZZX/5yz2PEI4g015OZ+B9AMQqXTwJtJuFPwci
         S30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296690; x=1721901490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCH5u/ZQ46EyBFByLmOEPWmFGVlqJDI/+pS92Vu1GSk=;
        b=gmYLI15flvzzxxnImr3EJ4biQhYrFydqe+iMo8OnxrpEjLTwpnv9rc7vCGnNuERmNd
         by1oLlO36wcGM+x0GHNDnhhBDbHmvYHKxMeoDIuv6qFqIqvSBnPHrTMuhtp6WkPVLdQ6
         Hh8e9E7T6NRi+9PwSRh2c+8CnPaUKbXznJ7+9gmb6mM/qPkTcPk5DwKfyxlttC1mdnYg
         ywgui9fc52iLHO1ry4TcgKgQ92VpndMcshjsmPqWkad5tuzdZBnQULhSsXS7u4OYvLfM
         7WwBBCoMbjBn7nyJV04rpHnZJqXgzjROzPrGAEdnHBEeCBkulwzKQP0Z/erASsS49uIa
         b68A==
X-Forwarded-Encrypted: i=1; AJvYcCVy9SDRRunhIwe/Svh40qFudpu257WfzUCnbXbMsp6i5dXyonzDgzeM0QIaM6cKEXVy0pzudclRcvA64JPb6S9f8nWl3ce1x6lM
X-Gm-Message-State: AOJu0YwUQpUBVWC5FYC6K7NeQLdaXQ9DgcKH0OgXfdPRFZXdnH3ksP5F
	Ldg2QAjYxr6SbsuMtkAhMpGQmRkshG3EuZk+jRX+pxCa4FYHKPz1F3p7Hldo+Os=
X-Google-Smtp-Source: AGHT+IGiRMLYPD8/mj2DdlgRkFnwPYEWEbXjTmQ5vs7sFEFj2QKW2f7+XfNNarH8pxk2uC5pHnAF9g==
X-Received: by 2002:a5d:5f49:0:b0:367:993e:8747 with SMTP id ffacd0b85a97d-36831654ae0mr3925223f8f.30.1721296689701;
        Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 8/9] reset: amlogic: split the device core and platform probe
Date: Thu, 18 Jul 2024 11:57:52 +0200
Message-ID: <20240718095755.3511992-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
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
index b3ef1a1c7cf9..5e23f3212e6d 100644
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
@@ -103,84 +93,27 @@ static const struct reset_control_ops meson_reset_ops = {
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



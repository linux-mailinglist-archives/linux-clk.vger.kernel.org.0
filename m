Return-Path: <linux-clk+bounces-9440-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA292D650
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 18:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A264283CE7
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 16:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FBD197A6A;
	Wed, 10 Jul 2024 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sqSBuULB"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FF194C85
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628748; cv=none; b=eBKXAqk64KIpMmZIVbT3CyKLgzGqa/fuU7tc5wdr5dlFwC4ejO/QeIbbathMK9gKK+5ybdDKZFqsv9veWLgKn2GJa+cEUYxQ8mHe0OJmyrLk5w6/5FwcqrtEbYPVb+cEdkre54gxtNGjheEJ+tuX/IJZAPMSh6RyRaGXoWYJ908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628748; c=relaxed/simple;
	bh=WiThtGmde5VQBxumF8xA9V+0PcE0mtIDwrP//zliULw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpJgnEV0xO/70eYzGo6nmn/QLswhtEMHn3wSspirv7EGBiWTJJj1tkLbdvvuYaRLKbnsL9JYT5TOkuipSPWEujCsyjFEa/qK0pObsiFjMxjS7eNNouIS3PkTiMwjGE/WUfLD75Y+B/sgb3eMsk3AT4f6WG8ihiD2rHpW+0rc9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sqSBuULB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea33671ffso6122544e87.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628743; x=1721233543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IARsI+FI+i+eKGJY1BDsgLjfmpMAYd8+oKcq4aFTD8I=;
        b=sqSBuULBEsT0mSQKQKiNW27xScfS6AeocnkffN8QHm/hcFfqMA804ngGnpUT+fo8J2
         JA3UHHa32S8K/c6MNZWNRi3J5h/chPbRCOx3pKBkUX4UD32OByX3JuwKJMDEFFNWaiMB
         l1bqDFy++3dV2Tw4f/pVlL13SdwubPisGsj1KjNn1ieF0x5s5ZhxJQxQYya1b0PKdUjs
         bY3dT4MJEtDabq6vREmwDnC4a+7JS5jvVw3WY5fuLzMGCqh41ajRB9G9wy8XSonJrp8t
         mWI26q1QcEvF3ubGCWqtW8tuDewYm1Z6RWjzrrCHJ9rOUpWcU4MqMctw4UZn7SlQgFKB
         2DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628743; x=1721233543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IARsI+FI+i+eKGJY1BDsgLjfmpMAYd8+oKcq4aFTD8I=;
        b=O634SHgxxb9O/qDGSMp/QjQtZ1P3vlOKSc32D+neSs7z3C73nMfeqYD1/xqrJ5vHvI
         yIe1K14q21sG5zgfgKQr5wii2+XLaxlAAvBvo2fUEfrW5a6J4rtaxXAh0zmFCdqs7D/U
         yyLGzfzEuHu8WUIALph0UM7smOa8/6X/pInheehqvtN9h4F45X/9SfEw3IygTmdQ4L3P
         hGK+q4yP2DnODVwQ/8h6RUGnAPg0y66oLrStJV14SdNO2kD3te/moPm5Xb+l2kp9v16O
         r5ym7DqmhQtLyHCIXi7xOs8bR/LyMNXlJWhZkEgQL7D7g6moWxC5jTbRe/b+LqqXuOxw
         LvcA==
X-Forwarded-Encrypted: i=1; AJvYcCX2RxOvZOovJ6/jggr9FRGMOTyQKZa9LjfzMF8BE0kDuHQKIu/h/kuYIei9TQDgHBhTuCu/pP89PKIXQndMOoD+Bo2W6e4FHtz2
X-Gm-Message-State: AOJu0Yw/YGPk1ROgbs0vdnbv5BntLgOH73garGDT/e8SzPOUwn85JKDl
	HAwkmao0N6kBXYnJ3E8gqeZBrD1IvxXDy/Qd7/MUURe0xXAnqH/pJN6jxrCtqh4=
X-Google-Smtp-Source: AGHT+IEcUV9rflAISGdUtE/xqZPmuLeXR5bEfX8EcOnERF2wu0mjIsOgHuUUJqEcj4imHelJS6s1hg==
X-Received: by 2002:a05:6512:39c5:b0:52c:a465:c61f with SMTP id 2adb3069b0e04-52eb99d6e56mr3725342e87.56.1720628743099;
        Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
Date: Wed, 10 Jul 2024 18:25:16 +0200
Message-ID: <20240710162526.2341399-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Add support for the reset controller present in the audio clock
controller of the g12 and sm1 SoC families, using the auxiliary bus.

This is expected to replace the driver currently present directly
within the related clock driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                       |   1 +
 drivers/reset/reset-meson.c                 | 121 +++++++++++++++++++-
 include/soc/amlogic/meson-auxiliary-reset.h |  23 ++++
 3 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7112f5932609..2a316c469bcc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -134,6 +134,7 @@ config RESET_MCHP_SPARX5
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
+	select AUXILIARY_BUS
 	default ARCH_MESON
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e34a10b15593..5cc767d50e8f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
+#include <linux/auxiliary_bus.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -16,6 +17,10 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <soc/amlogic/meson-auxiliary-reset.h>
+
+static DEFINE_IDA(meson_rst_aux_ida);
+
 struct meson_reset_param {
 	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
@@ -30,6 +35,14 @@ struct meson_reset {
 	struct regmap *map;
 };
 
+struct meson_reset_adev {
+	struct auxiliary_device adev;
+	struct regmap *map;
+};
+
+#define to_meson_reset_adev(_adev) \
+	container_of((_adev), struct meson_reset_adev, adev)
+
 static void meson_reset_offset_and_bit(struct meson_reset *data,
 				       unsigned long id,
 				       unsigned int *offset,
@@ -218,6 +231,112 @@ static struct platform_driver meson_reset_pltf_driver = {
 };
 module_platform_driver(meson_reset_pltf_driver);
 
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+static const struct meson_reset_param meson_g12a_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 26,
+	.level_offset	= 0x24,
+};
+
+static const struct meson_reset_param meson_sm1_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 39,
+	.level_offset	= 0x28,
+};
+
+static const struct auxiliary_device_id meson_reset_aux_ids[] = {
+	{
+		.name = "axg-audio-clkc.rst-g12a",
+		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
+	}, {
+		.name = "axg-audio-clkc.rst-sm1",
+		.driver_data = (kernel_ulong_t)&meson_sm1_audio_param,
+	},
+};
+MODULE_DEVICE_TABLE(auxiliary, meson_reset_aux_ids);
+
+static int meson_reset_aux_probe(struct auxiliary_device *adev,
+				 const struct auxiliary_device_id *id)
+{
+	const struct meson_reset_param *param =
+		(const struct meson_reset_param *)(id->driver_data);
+	struct meson_reset_adev *raux =
+		to_meson_reset_adev(adev);
+
+	return meson_reset_probe(&adev->dev, raux->map, param);
+}
+
+static struct auxiliary_driver meson_reset_aux_driver = {
+	.probe		= meson_reset_aux_probe,
+	.id_table	= meson_reset_aux_ids,
+};
+module_auxiliary_driver(meson_reset_aux_driver);
+
+static void meson_rst_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct meson_reset_adev *raux =
+		to_meson_reset_adev(adev);
+
+	ida_free(&meson_rst_aux_ida, adev->id);
+	kfree(raux);
+}
+
+static void meson_rst_aux_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int devm_meson_rst_aux_register(struct device *dev,
+				struct regmap *map,
+				const char *adev_name)
+{
+	struct meson_reset_adev *raux;
+	struct auxiliary_device *adev;
+	int ret;
+
+	raux = kzalloc(sizeof(*raux), GFP_KERNEL);
+	if (!raux)
+		return -ENOMEM;
+
+	ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto raux_free;
+
+	raux->map = map;
+
+	adev = &raux->adev;
+	adev->id = ret;
+	adev->name = adev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = meson_rst_aux_release;
+	device_set_of_node_from_dev(&adev->dev, dev);
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto ida_free;
+
+	ret = __auxiliary_device_add(adev, dev->driver->name);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
+					adev);
+
+ida_free:
+	ida_free(&meson_rst_aux_ida, adev->id);
+raux_free:
+	kfree(raux);
+	return ret;
+
+}
+EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
new file mode 100644
index 000000000000..8fdb02b18d8c
--- /dev/null
+++ b/include/soc/amlogic/meson-auxiliary-reset.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
+#define __SOC_AMLOGIC_MESON_AUX_RESET_H
+
+#include <linux/err.h>
+
+struct device;
+struct regmap;
+
+#ifdef CONFIG_RESET_MESON
+int devm_meson_rst_aux_register(struct device *dev,
+				struct regmap *map,
+				const char *adev_name);
+#else
+static inline int devm_meson_rst_aux_register(struct device *dev,
+					      struct regmap *map,
+					      const char *adev_name)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __SOC_AMLOGIC_MESON8B_AUX_RESET_H */
-- 
2.43.0



Return-Path: <linux-clk+bounces-7133-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4F8C86C7
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 14:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D086E1F23ED6
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 12:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD8D53E27;
	Fri, 17 May 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="DistQRgE"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF74F608;
	Fri, 17 May 2024 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950734; cv=none; b=Ycn5yU5aFMENag8jwcTlXrh8t0pNY2ISO3Ko/kXcqxivxR4kgNVLMyL535km1q9F3nm3bFvcZ8judilflMg1ku4LPtqhgLA+L77VZvTawhdZGGq5z7qIUU74yE3yptY1vprQfzWGHUkMMZfFyO6pXg0D+ERuw05ltk8dpEV1+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950734; c=relaxed/simple;
	bh=zhEWBrawvMbizC57yXlsDphblOxGvShm0hH9a8UM0cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzmfLVjGl6lhk5mQ/zYYCSpd+nl56a2mOgKYOvcMLTknBL2HctKsQNjGRsCZg+3Aj/XZYQ4niNiKUUln6bC9zTAH73HjSVYVaUgkFEfjKfr4/6w5HogETNj10gzRphNkp7Yd8lUyKZxhDQHZkCD8NgyD/W1GDJXUO49clv6Sd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=DistQRgE; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJGBX33aY0n80azEn4ipwIvrPzKLZvbe5lsXykY8yrk=;
	b=DistQRgEInbSJ+T5Tl0tJuLA4B6kO3oXQvYWjlwdenBXa7km9R5i1fL7dm/95XUweTxryY
	Wpwdrde35+5HfosjaYrQPLTGyTBy0HDzEyJS8XKZepBOfj2rTFSIWRRqK5Jirtbmd/+j8V
	nQYc66rjh/EGooc/jD1XX6QbN4yf5ZWVNNQ54iKgepTQFC7tpbbs0fD0X+fXzN2CzVvNO5
	emNoSUEvq4+tsG/iI2hEoytfBqVheXUXpV+RHtDqq93so1bjkkBvBmCK4ZJE/BnZfvlVZF
	zN/WMJebSpHXB5KKNC9Mrm6e8Y+BLuLnHfw62japUz1BmUCsVxLncZKJa3b0FA==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 14:58:00 +0200
Subject: [PATCH 02/13] regmap: add A2B support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-2-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Add regmap support for A2B drivers.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/base/regmap/Kconfig      |  6 ++-
 drivers/base/regmap/Makefile     |  1 +
 drivers/base/regmap/regmap-a2b.c | 82 ++++++++++++++++++++++++++++++++++++++++
 include/linux/regmap.h           | 38 +++++++++++++++++++
 4 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index b1affac70d5d..df9ad0c9a338 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -5,7 +5,7 @@
 
 config REGMAP
 	bool
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI || REGMAP_A2B)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	select MDIO_BUS if REGMAP_MDIO
 	help
@@ -91,3 +91,7 @@ config REGMAP_SPI_AVMM
 config REGMAP_FSI
 	tristate
 	depends on FSI
+
+config REGMAP_A2B
+	tristate
+	depends on A2B
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index 5fdd0845b45e..979e10419f8f 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
 obj-$(CONFIG_REGMAP_SPI_AVMM) += regmap-spi-avmm.o
 obj-$(CONFIG_REGMAP_MDIO) += regmap-mdio.o
 obj-$(CONFIG_REGMAP_FSI) += regmap-fsi.o
+obj-$(CONFIG_REGMAP_A2B) += regmap-a2b.o
diff --git a/drivers/base/regmap/regmap-a2b.c b/drivers/base/regmap/regmap-a2b.c
new file mode 100644
index 000000000000..ba5fbc5ed6eb
--- /dev/null
+++ b/drivers/base/regmap/regmap-a2b.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Register map access API - A2B support
+//
+// Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+
+#include <linux/regmap.h>
+#include <linux/a2b/a2b.h>
+
+static int regmap_a2b_write(void *context, const void *data, size_t count)
+{
+	struct a2b_node *node = context;
+	struct a2b_bus *bus = node->bus;
+	const u8 *d = data;
+	u8 reg;
+	int ret;
+	int i;
+
+	reg = d[0];
+
+	for (i = 0; i < count - 1; i++) {
+		ret = bus->ops->write(bus, node, reg + i, d[i + 1]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int regmap_a2b_read(void *context, const void *reg_buf, size_t reg_size,
+			   void *val_buf, size_t val_size)
+{
+	struct a2b_node *node = context;
+	struct a2b_bus *bus = node->bus;
+	u8 reg = ((u8 *)reg_buf)[0];
+	u8 *v = val_buf;
+	int ret;
+	int i;
+
+	if (reg_size != 1)
+		return -EINVAL;
+
+	for (i = 0; i < val_size; i++) {
+		unsigned int tmp;
+
+		ret = bus->ops->read(bus, node, reg + i, &tmp);
+		if (ret)
+			return ret;
+
+		v[i] = tmp & 0xFF;
+	}
+
+	return 0;
+}
+
+static const struct regmap_bus regmap_a2b = {
+	.write = regmap_a2b_write,
+	.read = regmap_a2b_read,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+};
+
+struct regmap *__devm_regmap_init_a2b_node(struct a2b_node *node,
+					   const struct regmap_config *config,
+					   struct lock_class_key *lock_key,
+					   const char *lock_name)
+{
+	return __devm_regmap_init(&node->dev, &regmap_a2b, node, config,
+				  lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_a2b_node);
+
+struct regmap *__devm_regmap_init_a2b_func(struct a2b_func *func,
+					   const struct regmap_config *config,
+					   struct lock_class_key *lock_key,
+					   const char *lock_name)
+{
+	return __devm_regmap_init(&func->dev, &regmap_a2b, func->node, config,
+				  lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_a2b_func);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a6bc2980a98b..742bcc110a95 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -37,6 +37,8 @@ struct regmap_range_cfg;
 struct regmap_field;
 struct snd_ac97;
 struct sdw_slave;
+struct a2b_node;
+struct a2b_func;
 
 /*
  * regmap_mdio address encoding. IEEE 802.3ae clause 45 addresses consist of a
@@ -655,6 +657,14 @@ struct regmap *__regmap_init_fsi(struct fsi_device *fsi_dev,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__devm_regmap_init_a2b_node(struct a2b_node *node,
+					   const struct regmap_config *config,
+					   struct lock_class_key *lock_key,
+					   const char *lock_name);
+struct regmap *__devm_regmap_init_a2b_func(struct a2b_func *func,
+					   const struct regmap_config *config,
+					   struct lock_class_key *lock_key,
+					   const char *lock_name);
 
 struct regmap *__devm_regmap_init(struct device *dev,
 				  const struct regmap_bus *bus,
@@ -1207,6 +1217,34 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__devm_regmap_init_fsi, #config,	\
 				 fsi_dev, config)
 
+/**
+ * devm_regmap_init_a2b_node() - Initialise managed register map for A2B node
+ *
+ * @node: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap.  The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_a2b_node(node, config)                              \
+	__regmap_lockdep_wrapper(__devm_regmap_init_a2b_node, #config, node, \
+				 config)
+
+/**
+ * devm_regmap_init_a2b_func() - Initialise managed register map for A2B func
+ *
+ * @func: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap.  The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_a2b_func(func, config)                              \
+	__regmap_lockdep_wrapper(__devm_regmap_init_a2b_func, #config, func, \
+				 config)
+
 int regmap_mmio_attach_clk(struct regmap *map, struct clk *clk);
 void regmap_mmio_detach_clk(struct regmap *map);
 void regmap_exit(struct regmap *map);

-- 
2.44.0



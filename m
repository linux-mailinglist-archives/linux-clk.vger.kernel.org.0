Return-Path: <linux-clk+bounces-7136-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0A8C86D7
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E011C21260
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 12:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300EB51C3E;
	Fri, 17 May 2024 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="A0C/+HAc"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090FD5026A
	for <linux-clk@vger.kernel.org>; Fri, 17 May 2024 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950737; cv=none; b=AXwmKwYifQAwj61PXEycrxscncy7PYA7lk5HHA4vc/Ly4+ti1reQ/LjrOHfmVViz7a5i5v71X+ZLgwt3J6Was3Z4fLFmLCa+BTl4xmYhKueHoozyYB+Oiz7Vew38ZRx8BWGnuQIc6XM5w2BwcZHAUuzg8ErZxgkqwlRjUqdjIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950737; c=relaxed/simple;
	bh=8vYRnccSlQYqlh3fxX5/Hisboqgnyr4rICOClMIM20U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXZHlcUJq8TnWOcsFk4OrLE5GeM7ZGr6OqaGpinFDTlPBH5sjv1F1qeBKe/ZrEGPLFXrPmgr1VQJsfZyJ5hGartgTsZIusMSwdmACVY1IyVOzr4YXkoKdhMeAim/Tqu/G6/Zk1QEzjVH1D+gyGW05zbPitMDU/pZiZ1+pw9dGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=A0C/+HAc; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFm2NKOLNS2+8TI+0VNTEyF5JacM3hETg+tusBEe8nU=;
	b=A0C/+HAc5wMRHsEa0T699iNczH9rVQuqtbmPYWpCAFb83KllhXwxDi9kUzpJSucX5MZ4ar
	zO+Viuu+SvaXiQyAwZO1z6CkywvjI1iueTGVLhDIfqb2sejYjj4ghOIjQHSCuOGYYlR+Nm
	uepk85w6H/Q8s7Cer3nhiYKfkZNL8gLcVZfjnsmEk48Q4ku+C8g59Uz/p9Qndbt0YKtw8R
	eEcJKnZXnwsMQJG5cLspewe+ULO54KJ36QFPmNe9jbwkZcUCG3QDxJYgHtpO5+TFG3ynwO
	OE49IL1Q2rKIrfbXsXOVk+CfXiEvcGLcU8kk4Zl0Spgl+XYNc/77q6SLJBWi+Q==
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
Date: Fri, 17 May 2024 14:58:02 +0200
Subject: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>
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

AD24xx series chips (AD240x, AD241x, AD242x) are controlled over I2C.
Add an A2B interface driver for I2C which registers an A2B node with the
A2B core and implements the relevant interface ops.

The motivation for abstracting away the interface and node control in
the driver model is because future generations of A2B transceivers are
expected to support both SPI and I2C as control interfaces.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig        |  15 +
 drivers/a2b/Makefile       |   3 +
 drivers/a2b/ad24xx-i2c.c   | 532 +++++++++++++++++++++++++++
 include/linux/a2b/ad24xx.h | 892 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1442 insertions(+)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index 4aaef2ea4460..120b1d491623 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -11,3 +11,18 @@ menuconfig A2B
 	 Analog Devices Inc.
 
 	 If unsure, say N.
+
+if A2B
+
+config A2B_AD24XX_I2C
+       tristate "Analog Devices Inc. AD24xx I2C interface support"
+       depends on I2C
+       select REGMAP_I2C
+       help
+         Say Y here to enable I2C interface support for AD24xx A2B transceiver
+         chips from Analog Devices Inc. Supported models include AD240x, AD241x,
+         and AD242x.
+
+	 If unsure, say N.
+
+endif # A2B
diff --git a/drivers/a2b/Makefile b/drivers/a2b/Makefile
index 40c9821f61ee..07241524645c 100644
--- a/drivers/a2b/Makefile
+++ b/drivers/a2b/Makefile
@@ -4,3 +4,6 @@
 #
 
 obj-$(CONFIG_A2B)			+= a2b.o
+
+# Interface drivers
+obj-$(CONFIG_A2B_AD24XX_I2C)		+= ad24xx-i2c.o
diff --git a/drivers/a2b/ad24xx-i2c.c b/drivers/a2b/ad24xx-i2c.c
new file mode 100644
index 000000000000..227d0391adf1
--- /dev/null
+++ b/drivers/a2b/ad24xx-i2c.c
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * I2C interface driver for AD24xx A2B transceivers
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#include <linux/a2b/a2b.h>
+#include <linux/a2b/ad24xx.h>
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+struct ad24xx_i2c {
+	struct device *dev;
+	struct i2c_client *base_client;
+	struct i2c_client *bus_client;
+	struct regmap *base_regmap;
+	struct regmap *bus_regmap;
+	struct a2b_bus a2b_bus;
+	struct mutex mutex;
+	unsigned int irqs_enabled;
+	struct irq_domain *irqdomain;
+	int irq;
+	struct clk *sync_clk;
+};
+
+#define to_ad24xx_i2c(iface) container_of(iface, struct ad24xx_i2c, a2b_bus)
+
+static bool ad24xx_i2c_private_reg(unsigned int reg)
+{
+	/*
+	 * "Private" registers which are owned by this interface driver should
+	 * not be accessed by the constituent A2B drivers.
+	 */
+	switch (reg) {
+	case A2B_CHIP:
+	case A2B_NODEADR:
+	case A2B_INTSRC:
+	case A2B_INTTYPE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int __ad24xx_i2c_read(struct a2b_bus *a2b_bus,
+			     const struct a2b_node *node, unsigned int reg,
+			     unsigned int *val)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	unsigned int nodeadr;
+	int ret;
+
+	if (ad24xx_i2c_private_reg(reg))
+		return -EACCES;
+
+	/* Main node access */
+	if (is_a2b_main(node))
+		return regmap_read(ad->base_regmap, reg, val);
+
+	/* Sub node access */
+	nodeadr = FIELD_PREP(A2B_NODEADR_NODE_MASK, node->addr - 1);
+
+	ret = regmap_write(ad->base_regmap, A2B_NODEADR, nodeadr);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(ad->bus_regmap, reg, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ad24xx_i2c_read(struct a2b_bus *a2b_bus, const struct a2b_node *node,
+			   unsigned int reg, unsigned int *val)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	int ret;
+
+	mutex_lock(&ad->mutex);
+	ret = __ad24xx_i2c_read(a2b_bus, node, reg, val);
+	mutex_unlock(&ad->mutex);
+	return ret;
+}
+
+static int __ad24xx_i2c_write(struct a2b_bus *a2b_bus,
+			      const struct a2b_node *node, unsigned int reg,
+			      unsigned int val)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	unsigned int nodeadr;
+	int ret;
+
+	if (ad24xx_i2c_private_reg(reg))
+		return -EACCES;
+
+	/* Main node access */
+	if (is_a2b_main(node))
+		return regmap_write(ad->base_regmap, reg, val);
+
+	/* Sub node access */
+	nodeadr = FIELD_PREP(A2B_NODEADR_NODE_MASK, node->addr - 1);
+
+	ret = regmap_write(ad->base_regmap, A2B_NODEADR, nodeadr);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ad->bus_regmap, reg, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ad24xx_i2c_write(struct a2b_bus *a2b_bus,
+			    const struct a2b_node *node, unsigned int reg,
+			    unsigned int val)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	int ret;
+
+	mutex_lock(&ad->mutex);
+	ret = __ad24xx_i2c_write(a2b_bus, node, reg, val);
+	mutex_unlock(&ad->mutex);
+	return ret;
+}
+
+static int ad24xx_i2c_xfer(struct a2b_bus *a2b_bus, const struct a2b_node *node,
+			   struct i2c_msg *msgs, int num)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	struct i2c_msg msgs2[2];
+	unsigned int nodeadr;
+	int ret;
+	int i;
+
+	/* Mains only have one I2C interface and it operates in slave mode */
+	if (is_a2b_main(node))
+		return -EINVAL;
+
+	/*
+	 * Enforce some basic assumptions this function makes about the
+	 * transfer. If this proves insufficient, some more complex logic will
+	 * be needed.
+	 */
+	if (num > 2 || (num == 2 && msgs[0].addr != msgs[1].addr))
+		return -EOPNOTSUPP;
+
+	/* Modify the messages to use the I2C address of the BUS client */
+	for (i = 0; i < num; i++) {
+		msgs2[i] = msgs[i];
+		msgs2[i].addr = ad->bus_client->addr;
+	}
+
+	mutex_lock(&ad->mutex);
+
+	/* Set I2C peripheral address in subordinate node */
+	nodeadr = FIELD_PREP(A2B_NODEADR_NODE_MASK, node->addr - 1);
+
+	ret = regmap_write(ad->base_regmap, A2B_NODEADR, nodeadr);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(ad->bus_regmap, A2B_CHIP, msgs[0].addr);
+	if (ret)
+		goto out;
+
+	/* Set peripheral bit */
+	nodeadr |= FIELD_PREP(A2B_NODEADR_PERI_MASK, 1);
+
+	ret = regmap_write(ad->base_regmap, A2B_NODEADR, nodeadr);
+	if (ret)
+		goto out;
+
+	ret = i2c_transfer(ad->bus_client->adapter, msgs2, num);
+	if (ret < 0)
+		goto out;
+
+out:
+	mutex_unlock(&ad->mutex);
+
+	if (ret < 0)
+		return ret;
+
+	return num;
+}
+
+static int ad24xx_i2c_get_inttype(struct a2b_bus *a2b_bus,
+				  unsigned int *val)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+	int ret;
+
+	mutex_lock(&ad->mutex);
+	ret = regmap_read(ad->base_regmap, A2B_INTTYPE, val);
+	mutex_unlock(&ad->mutex);
+
+	return ret;
+}
+
+static struct clk *ad24xx_i2c_get_sync_clk(struct a2b_bus *a2b_bus)
+{
+	struct ad24xx_i2c *ad = to_ad24xx_i2c(a2b_bus);
+
+	return ad->sync_clk;
+}
+
+struct a2b_bus_ops ad24xx_i2c_a2b_bus_ops = {
+	.read = ad24xx_i2c_read,
+	.write = ad24xx_i2c_write,
+	.i2c_xfer = ad24xx_i2c_xfer,
+	.get_inttype = ad24xx_i2c_get_inttype,
+	.get_sync_clk = ad24xx_i2c_get_sync_clk,
+};
+
+static irqreturn_t ad24xx_i2c_irq_handler(int irq, void *data)
+{
+	struct ad24xx_i2c *ad = data;
+	bool handled = false;
+	unsigned long hwirq;
+	unsigned int val;
+	unsigned int virq;
+	int ret;
+
+	/*
+	 * The transceiver asserts the IRQ line as long as there are pending
+	 * interrupts. Process them all here so that the interrupt can be
+	 * configured with an edge trigger.
+	 */
+	while (true) {
+		mutex_lock(&ad->mutex);
+		ret = regmap_read(ad->base_regmap, A2B_INTSRC, &val);
+		mutex_unlock(&ad->mutex);
+		if (ret) {
+			dev_err_ratelimited(
+				ad->dev,
+				"failed to read interrupt source: %d\n", ret);
+			break;
+		}
+
+		if (val & A2B_INTSRC_MSTINT_MASK)
+			hwirq = 0;
+		else if (val & A2B_INTSRC_SLVINT_MASK)
+			hwirq = (val & A2B_INTSRC_INODE_MASK) + 1;
+		else
+			break;
+
+		/*
+		 * Pending interrupts are only cleared when reading the
+		 * interrupt type. Normally this is done in the corresponding
+		 * node's interrupt handler, but in case the interrupt is
+		 * disabled, it has to be read here.
+		 */
+		if (!(BIT(hwirq) & ad->irqs_enabled)) {
+			ret = ad24xx_i2c_get_inttype(&ad->a2b_bus, &val);
+			if (ret)
+				dev_err_ratelimited(
+					ad->dev,
+					"failed to read interrupt type: %d\n",
+					ret);
+			handled = true;
+			continue;
+		}
+
+		virq = irq_find_mapping(ad->irqdomain, hwirq);
+		if (!virq)
+			break;
+
+		handle_nested_irq(virq);
+		handled = true;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static void ad24xx_i2c_irq_enable(struct irq_data *irq_data)
+{
+	struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
+	irq_hw_number_t hwirq = irq_data->hwirq;
+
+	ad->irqs_enabled |= BIT(hwirq);
+}
+
+static void ad24xx_i2c_irq_disable(struct irq_data *irq_data)
+{
+	struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
+	irq_hw_number_t hwirq = irq_data->hwirq;
+
+	ad->irqs_enabled &= ~BIT(hwirq);
+}
+
+static const struct irq_chip ad24xx_i2c_irq_chip = {
+	.name = "ad24xx-i2c",
+	.irq_enable = ad24xx_i2c_irq_enable,
+	.irq_disable = ad24xx_i2c_irq_disable,
+};
+
+static int ad24xx_i2c_irqdomain_map(struct irq_domain *irqdomain,
+				    unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(irq, irqdomain->host_data);
+	irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(irq, 1);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static void ad24xx_i2c_irqdomain_unmap(struct irq_domain *irqdomain,
+				       unsigned int irq)
+{
+	irq_set_nested_thread(irq, 0);
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops ad24xx_i2c_irqdomain_ops = {
+	.map = ad24xx_i2c_irqdomain_map,
+	.unmap = ad24xx_i2c_irqdomain_unmap,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static void devm_ad24xx_i2c_release_irqdomain(void *data)
+{
+	struct irq_domain *irqdomain = data;
+	int virq;
+	int i;
+
+	for (i = 0; i < A2B_MAX_NODES; i++) {
+		virq = irq_find_mapping(irqdomain, i);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(irqdomain);
+}
+
+static int ad24xx_i2c_irq_setup(struct ad24xx_i2c *ad)
+{
+	u32 intsize;
+	int ret;
+
+	if (!of_property_read_bool(ad->dev->of_node, "interrupt-controller") ||
+	    of_property_read_u32(ad->dev->of_node, "#interrupt-cells",
+				 &intsize) ||
+	    intsize != 1)
+		return -EINVAL;
+
+	ad->irqdomain = irq_domain_add_linear(ad->dev->of_node, A2B_MAX_NODES,
+					      &ad24xx_i2c_irqdomain_ops, ad);
+	if (!ad->irqdomain)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(
+		ad->dev, devm_ad24xx_i2c_release_irqdomain, ad->irqdomain);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(ad->dev, ad->irq, NULL,
+					ad24xx_i2c_irq_handler, IRQF_ONESHOT,
+					"ad24xx-i2c", ad);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ad24xx_i2c_bus_setup(struct ad24xx_i2c *ad)
+{
+	struct device *dev = ad->dev;
+	unsigned long sff_rate;
+	int ret;
+
+	ad->a2b_bus.ops = &ad24xx_i2c_a2b_bus_ops;
+	ad->a2b_bus.parent = dev;
+	ad->a2b_bus.priv = ad;
+
+	sff_rate = clk_get_rate(ad->sync_clk);
+	if (sff_rate == 48000)
+		ad->a2b_bus.sff = A2B_SFF_48000;
+	else if (sff_rate == 44100)
+		ad->a2b_bus.sff = A2B_SFF_44100;
+	else
+		return -EINVAL;
+
+	ret = a2b_register_bus(&ad->a2b_bus);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct regmap_config ad24xx_i2c_base_regmap_config = {
+	.disable_locking = true,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.max_register = A2B_REG_MAX,
+};
+
+static const struct regmap_config ad24xx_i2c_bus_regmap_config = {
+	.disable_locking = true,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.max_register = A2B_REG_MAX,
+};
+
+static void ad24xx_i2c_remove(struct i2c_client *client)
+{
+	struct ad24xx_i2c *ad = i2c_get_clientdata(client);
+
+	a2b_unregister_bus(&ad->a2b_bus);
+}
+
+static int ad24xx_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np;
+	struct ad24xx_i2c *ad;
+	struct regmap_config *base_regmap_config;
+	struct regmap_config *bus_regmap_config;
+	u32 bus_addr;
+	int ret;
+	int i;
+
+	ad = devm_kzalloc(dev, sizeof(*ad), GFP_KERNEL);
+	if (!ad)
+		return -ENOMEM;
+
+	base_regmap_config = devm_kmemdup(dev, &ad24xx_i2c_base_regmap_config,
+					  sizeof(*base_regmap_config),
+					  GFP_KERNEL);
+	if (!base_regmap_config)
+		return -ENOMEM;
+
+	bus_regmap_config = devm_kmemdup(dev, &ad24xx_i2c_bus_regmap_config,
+					  sizeof(*bus_regmap_config),
+					  GFP_KERNEL);
+	if (!bus_regmap_config)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, ad);
+	ad->dev = dev;
+	ad->irq = client->irq;
+	ad->base_client = client;
+	mutex_init(&ad->mutex);
+
+	/* Optionally enable regulators for VIN or for out-of-band bus power */
+	ret = devm_regulator_get_enable_optional(dev, "vin");
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	ret = devm_regulator_get_enable_optional(dev, "bus");
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	ad->base_regmap =
+		devm_regmap_init_i2c(ad->base_client, base_regmap_config);
+	if (IS_ERR(ad->base_regmap))
+		return PTR_ERR(ad->base_regmap);
+
+	np = client->dev.of_node;
+	if (!np)
+		return -EINVAL;
+
+	i = of_property_match_string(np, "reg-names", "bus");
+	if (i < 0)
+		return -EINVAL;
+
+	ret = of_property_read_u32_index(np, "reg", i, &bus_addr);
+	if (ret)
+		return ret;
+
+	ad->bus_client =
+		devm_i2c_new_dummy_device(dev, client->adapter, bus_addr);
+	if (IS_ERR(ad->bus_client))
+		return PTR_ERR(ad->bus_client);
+
+	ad->bus_regmap =
+		devm_regmap_init_i2c(ad->bus_client, bus_regmap_config);
+	if (IS_ERR(ad->bus_regmap))
+		return PTR_ERR(ad->bus_regmap);
+
+	ad->sync_clk = devm_clk_get_enabled(dev, "sync");
+	if (IS_ERR(ad->sync_clk))
+		return PTR_ERR(ad->sync_clk);
+
+	ret = ad24xx_i2c_irq_setup(ad);
+	if (ret)
+		return ret;
+
+	ret = ad24xx_i2c_bus_setup(ad);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id ad24xx_i2c_of_match_table[] = {
+	{ .compatible = "adi,ad2403" },
+	{ .compatible = "adi,ad2410" },
+	{ .compatible = "adi,ad2425" },
+	{ .compatible = "adi,ad2428" },
+	{ .compatible = "adi,ad2429" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ad24xx_i2c_of_match_table);
+
+static const struct i2c_device_id ad24xx_i2c_id_table[] = {
+	{ .name = "ad24xx", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, ad24xx_i2c_id_table);
+
+static struct i2c_driver ad24xx_i2c_driver = {
+	.driver = {
+		.name = "ad24xx-i2c",
+		.of_match_table = ad24xx_i2c_of_match_table,
+	},
+	.probe = ad24xx_i2c_probe,
+	.remove = ad24xx_i2c_remove,
+	.id_table = ad24xx_i2c_id_table,
+};
+module_i2c_driver(ad24xx_i2c_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("AD24xx I2C driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/a2b/ad24xx.h b/include/linux/a2b/ad24xx.h
new file mode 100644
index 000000000000..846838e62c8a
--- /dev/null
+++ b/include/linux/a2b/ad24xx.h
@@ -0,0 +1,892 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AD24xx register map
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#ifndef _AD24XX_H
+#define _AD24XX_H
+
+#define AD24XX_MAX_GPIOS 8
+
+enum ad24xx_regs {
+	A2B_CHIP = 0x00,	/* I2C Chip Address Register (sub only) */
+	A2B_NODEADR = 0x01,	/* Node Address Register (main only) */
+	A2B_VENDOR = 0x02,	/* Vendor ID Register */
+	A2B_PRODUCT = 0x03,	/* Product ID Register */
+	A2B_VERSION = 0x04,	/* Version ID Register */
+	A2B_CAPABILITY = 0x05,	/* Capability ID Register */
+	A2B_SWCTL = 0x09,	/* Switch Control Register */
+	A2B_BCDNSLOTS = 0x0A,	/* Broadcast Downstream Slots Register (sub only) */
+	A2B_LDNSLOTS = 0x0B,	/* Local Downstream Slots Register (sub only) */
+	A2B_LUPSLOTS = 0x0C,	/* Local Upstream Slots Register (sub only) */
+	A2B_DNSLOTS = 0x0D,	/* Downstream Slots Register */
+	A2B_UPSLOTS = 0x0E,	/* Upstream Slots Register */
+	A2B_RESPCYCS = 0x0F,	/* Response Cycles Register */
+	A2B_SLOTFMT = 0x10,	/* Slot Format Register (main only, Auto-Broadcast) */
+	A2B_DATCTL = 0x11,	/* Data Control Register (main only, Auto-Broadcast) */
+	A2B_CONTROL = 0x12,	/* Control Register */
+	A2B_DISCVRY = 0x13,	/* Discovery Register (main only) */
+	A2B_SWSTAT = 0x14,	/* Switch Status Register */
+	A2B_INTSTAT = 0x15,	/* Interrupt Status Register */
+	A2B_INTSRC = 0x16,	/* Interrupt Source Register (main only) */
+	A2B_INTTYPE = 0x17,	/* Interrupt Type Register (main only) */
+	A2B_INTPND0 = 0x18,	/* Interrupt Pending 0 Register */
+	A2B_INTPND1 = 0x19,	/* Interrupt Pending 1 Register */
+	A2B_INTPND2 = 0x1A,	/* Interrupt Pending 2 Register (main only) */
+	A2B_INTMSK0 = 0x1B,	/* Interrupt Mask 0 Register */
+	A2B_INTMSK1 = 0x1C,	/* Interrupt Mask 1 Register */
+	A2B_INTMSK2 = 0x1D,	/* Interrupt Mask 2 Register (main only) */
+	A2B_BECCTL = 0x1E,	/* Bit Error Count Control Register */
+	A2B_BECNT = 0x1F,	/* Bit Error Count Register */
+	A2B_TESTMODE = 0x20,	/* Testmode Register */
+	A2B_ERRCNT0 = 0x21,	/* PRBS Error Count Byte 0 Register */
+	A2B_ERRCNT1 = 0x22,	/* PRBS Error Count Byte 1 Register */
+	A2B_ERRCNT2 = 0x23,	/* PRBS Error Count Byte 2 Register */
+	A2B_ERRCNT3 = 0x24,	/* PRBS Error Count Byte 3 Register */
+	A2B_NODE = 0x29,	/* Node Register */
+	A2B_DISCSTAT = 0x2B,	/* Discovery Status Register (main only) */
+	A2B_TXACTL = 0x2E,	/* LVDSA TX Control Register */
+	A2B_TXBCTL = 0x30,	/* LVDSB TX Control Register */
+	A2B_LINTTYPE = 0x3E,	/* Local Interrupt Type (sub only) */
+	A2B_I2CCFG = 0x3F,	/* I2C Configuration Register */
+	A2B_PLLCTL = 0x40,	/* PLL Control Register */
+	A2B_I2SGCFG = 0x41,	/* I2S Global Configuration Register */
+	A2B_I2SCFG = 0x42,	/* I2S Configuration Register */
+	A2B_I2SRATE = 0x43,	/* I2S Rate Register (sub only) */
+	A2B_I2STXOFFSET = 0x44,	/* I2S Transmit Data Offset Register (main only) */
+	A2B_I2SRXOFFSET = 0x45,	/* I2S Receive Data Offset Register (main only) */
+	A2B_SYNCOFFSET = 0x46,	/* SYNC Offset Register (sub only) */
+	A2B_PDMCTL = 0x47,	/* PDM Control Register */
+	A2B_ERRMGMT = 0x48,	/* Error Management Register */
+	A2B_GPIODAT = 0x4A,	/* GPIO Output Data Register */
+	A2B_GPIODATSET = 0x4B,	/* GPIO Output Data Set Register */
+	A2B_GPIODATCLR = 0x4C,	/* GPIO Output Data Clear Register */
+	A2B_GPIOOEN = 0x4D,	/* GPIO Output Enable Register */
+	A2B_GPIOIEN = 0x4E,	/* GPIO Input Enable Register */
+	A2B_GPIOIN = 0x4F,	/* GPIO Input Value Register */
+	A2B_PINTEN = 0x50,	/* Pin Interrupt Enable Register */
+	A2B_PINTINV = 0x51,	/* Pin Interrupt Invert Register */
+	A2B_PINCFG = 0x52,	/* Pin Configuration Register */
+	A2B_I2STEST = 0x53,	/* I2S Test Register */
+	A2B_RAISE = 0x54,	/* Raise Interrupt Register */
+	A2B_GENERR = 0x55,	/* Generate Bus Error */
+	A2B_I2SRRATE = 0x56,	/* I2S Reduced Rate Register (main only, Auto-Broadcast) */
+	A2B_I2SRRCTL = 0x57,	/* I2S Reduced Rate Control Register */
+	A2B_I2SRRSOFFS = 0x58,	/* I2S Reduced Rate SYNC Offset Register (sub only) */
+	A2B_CLK1CFG = 0x59,	/* CLKOUT1 Configuration Register */
+	A2B_CLK2CFG = 0x5A,	/* CLKOUT2 Configuration Register */
+	A2B_BMMCFG = 0x5B,	/* Bus Monitor Mode Configuration Register */
+	A2B_SUSCFG = 0x5C,	/* Sustain Configuration Register (sub only) */
+	A2B_PDMCTL2 = 0x5D,	/* PDM Control 2 Register */
+	A2B_UPMASK0 = 0x60,	/* Upstream Data RX Mask 0 Register (sub only) */
+	A2B_UPMASK1 = 0x61,	/* Upstream Data RX Mask 1 Register (sub only) */
+	A2B_UPMASK2 = 0x62,	/* Upstream Data RX Mask 2 Register (sub only) */
+	A2B_UPMASK3 = 0x63,	/* Upstream Data RX Mask 3 Register (sub only) */
+	A2B_UPOFFSET = 0x64,	/* Local Upstream Channel Offset Register (sub only) */
+	A2B_DNMASK0 = 0x65,	/* Downstream Data RX Mask 0 Register (sub only) */
+	A2B_DNMASK1 = 0x66,	/* Downstream Data RX Mask 1 Register (sub only) */
+	A2B_DNMASK2 = 0x67,	/* Downstream Data RX Mask 2 Register (sub only) */
+	A2B_DNMASK3 = 0x68,	/* Downstream Data RX Mask 3 Register (sub only) */
+	A2B_DNOFFSET = 0x69,	/* Local Downstream Channel Offset Register (sub only) */
+	A2B_CHIPID0 = 0x6A,	/* Chip ID Register 0 */
+	A2B_CHIPID1 = 0x6B,	/* Chip ID Register 1 */
+	A2B_CHIPID2 = 0x6C,	/* Chip ID Register 2 */
+	A2B_CHIPID3 = 0x6D,	/* Chip ID Register 3 */
+	A2B_CHIPID4 = 0x6E,	/* Chip ID Register 4 */
+	A2B_CHIPID5 = 0x6F,	/* Chip ID Register 5 */
+	A2B_GPIODEN = 0x80,	/* GPIO Over Distance Enable Register */
+	A2B_GPIOD0MSK = 0x81,	/* GPIO Over Distance Mask 0 Register */
+	A2B_GPIOD1MSK = 0x82,	/* GPIO Over Distance Mask 1 Register */
+	A2B_GPIOD2MSK = 0x83,	/* GPIO Over Distance Mask 2 Register */
+	A2B_GPIOD3MSK = 0x84,	/* GPIO Over Distance Mask 3 Register */
+	A2B_GPIOD4MSK = 0x85,	/* GPIO Over Distance Mask 4 Register */
+	A2B_GPIOD5MSK = 0x86,	/* GPIO Over Distance Mask 5 Register */
+	A2B_GPIOD6MSK = 0x87,	/* GPIO Over Distance Mask 6 Register */
+	A2B_GPIOD7MSK = 0x88,	/* GPIO Over Distance Mask 7 Register */
+	A2B_GPIODDAT = 0x89,	/* GPIO Over Distance Data Register */
+	A2B_GPIODINV = 0x8A,	/* GPIO Over Distance Invert Register */
+	A2B_MBOX0CTL = 0x90,	/* Mailbox 0 Control Register (sub only) */
+	A2B_MBOX0STAT = 0x91,	/* Mailbox 0 Status Register (sub only) */
+	A2B_MBOX0B0 = 0x92,	/* Mailbox 0 Byte 0 Register (sub only) */
+	A2B_MBOX0B1 = 0x93,	/* Mailbox 0 Byte 1 Register (sub only) */
+	A2B_MBOX0B2 = 0x94,	/* Mailbox 0 Byte 2 Register (sub only) */
+	A2B_MBOX0B3 = 0x95,	/* Mailbox 0 Byte 3 Register (sub only) */
+	A2B_MBOX1CTL = 0x96,	/* Mailbox 1 Control Register (sub only) */
+	A2B_MBOX1STAT = 0x97,	/* Mailbox 1 Status Register (sub only) */
+	A2B_MBOX1B0 = 0x98,	/* Mailbox 1 Byte 0 Register (sub only) */
+	A2B_MBOX1B1 = 0x99,	/* Mailbox 1 Byte 1 Register (sub only) */
+	A2B_MBOX1B2 = 0x9A,	/* Mailbox 1 Byte 2 Register (sub only) */
+	A2B_MBOX1B3 = 0x9B,	/* Mailbox 1 Byte 3 Register (sub only) */
+	A2B_REG_END,
+	A2B_REG_MAX = A2B_REG_END - 1,
+};
+
+#define A2B_CHIP_CHIPADR_MASK GENMASK(6, 0)
+#define A2B_NODEADR_NODE_MASK GENMASK(3, 0)
+#define A2B_NODEADR_PERI_MASK GENMASK(5, 5)
+#define A2B_NODEADR_BRCST_MASK GENMASK(7, 7)
+#define A2B_VENDOR_VENDOR_MASK GENMASK(7, 0)
+#define A2B_PRODUCT_PRODUCT_MASK GENMASK(7, 0)
+#define A2B_VERSION_VERSION_MASK GENMASK(7, 0)
+#define A2B_CAPABILITY_I2CAVAIL_MASK GENMASK(0, 0)
+#define A2B_SWCTL_ENSW_MASK GENMASK(0, 0)
+#define A2B_SWCTL_DIAGMODE_MASK GENMASK(3, 3)
+#define A2B_SWCTL_MODE_MASK GENMASK(5, 4)
+#define A2B_SWCTL_DISNXT_MASK GENMASK(6, 6)
+#define A2B_BCDNSLOTS_BCDNSLOTS_MASK GENMASK(5, 0)
+#define A2B_LDNSLOTS_LDNSLOTS_MASK GENMASK(5, 0)
+#define A2B_LDNSLOTS_DNMASKEN_MASK GENMASK(7, 7)
+#define A2B_LUPSLOTS_LUPSLOTS_MASK GENMASK(5, 0)
+#define A2B_DNSLOTS_DNSLOTS_MASK GENMASK(5, 0)
+#define A2B_UPSLOTS_UPSLOTS_MASK GENMASK(5, 0)
+#define A2B_RESPCYCS_RESPCYCS_MASK GENMASK(7, 0)
+#define A2B_SLOTFMT_DNSIZE_MASK GENMASK(2, 0)
+#define A2B_SLOTFMT_DNFMT_MASK GENMASK(3, 3)
+#define A2B_SLOTFMT_UPSIZE_MASK GENMASK(6, 4)
+#define A2B_SLOTFMT_UPFMT_MASK GENMASK(7, 7)
+#define A2B_DATCTL_DNS_MASK GENMASK(0, 0)
+#define A2B_DATCTL_UPS_MASK GENMASK(1, 1)
+#define A2B_DATCTL_ENDSNIFF_MASK GENMASK(5, 5)
+#define A2B_DATCTL_STANDBY_MASK GENMASK(7, 7)
+#define A2B_CONTROL_NEWSTRCT_MASK GENMASK(0, 0)
+#define A2B_CONTROL_ENDDSC_MASK GENMASK(1, 1)
+#define A2B_CONTROL_SOFTRST_MASK GENMASK(2, 2)
+#define A2B_CONTROL_SWBYP_MASK GENMASK(3, 3)
+#define A2B_CONTROL_XCVRBINV_MASK GENMASK(4, 4)
+#define A2B_CONTROL_MSTR_MASK GENMASK(7, 7)
+#define A2B_DISCVRY_DRESPCYC_MASK GENMASK(7, 0)
+#define A2B_SWSTAT_FIN_MASK GENMASK(0, 0)
+#define A2B_SWSTAT_FAULT_MASK GENMASK(1, 1)
+#define A2B_SWSTAT_FAULT_CODE_MASK GENMASK(6, 4)
+#define A2B_SWSTAT_FAULT_NLOC_MASK GENMASK(7, 7)
+#define A2B_INTSTAT_IRQ_MASK GENMASK(0, 0)
+#define A2B_INTSRC_INODE_MASK GENMASK(3, 0)
+#define A2B_INTSRC_SLVINT_MASK GENMASK(6, 6)
+#define A2B_INTSRC_MSTINT_MASK GENMASK(7, 7)
+#define A2B_INTTYPE_TYPE_MASK GENMASK(7, 0)
+#define A2B_INTPND0_HDCNTERR_MASK GENMASK(0, 0)
+#define A2B_INTPND0_DDERR_MASK GENMASK(1, 1)
+#define A2B_INTPND0_CRCERR_MASK GENMASK(2, 2)
+#define A2B_INTPND0_DPERR_MASK GENMASK(3, 3)
+#define A2B_INTPND0_PWRERR_MASK GENMASK(4, 4)
+#define A2B_INTPND0_BECOVF_MASK GENMASK(5, 5)
+#define A2B_INTPND0_SRFERR_MASK GENMASK(6, 6)
+#define A2B_INTPND0_SRFCRCERR_MASK GENMASK(7, 7)
+#define A2B_INTPND1_IO0PND_MASK GENMASK(0, 0)
+#define A2B_INTPND1_IO1PND_MASK GENMASK(1, 1)
+#define A2B_INTPND1_IO2PND_MASK GENMASK(2, 2)
+#define A2B_INTPND1_IO3PND_MASK GENMASK(3, 3)
+#define A2B_INTPND1_IO4PND_MASK GENMASK(4, 4)
+#define A2B_INTPND1_IO5PND_MASK GENMASK(5, 5)
+#define A2B_INTPND1_IO6PND_MASK GENMASK(6, 6)
+#define A2B_INTPND1_IO7PND_MASK GENMASK(7, 7)
+#define A2B_INTPND2_DSCDONE_MASK GENMASK(0, 0)
+#define A2B_INTPND2_I2CERR_MASK GENMASK(1, 1)
+#define A2B_INTPND2_ICRCERR_MASK GENMASK(2, 2)
+#define A2B_INTPND2_SLVIRQ_MASK GENMASK(3, 3)
+#define A2B_INTMSK0_HDEIEN_MASK GENMASK(0, 0)
+#define A2B_INTMSK0_DDEIEN_MASK GENMASK(1, 1)
+#define A2B_INTMSK0_CRCEIEN_MASK GENMASK(2, 2)
+#define A2B_INTMSK0_DPEIEN_MASK GENMASK(3, 3)
+#define A2B_INTMSK0_PWREIEN_MASK GENMASK(4, 4)
+#define A2B_INTMSK0_BECIEN_MASK GENMASK(5, 5)
+#define A2B_INTMSK0_SRFEIEN_MASK GENMASK(6, 6)
+#define A2B_INTMSK0_SRFCRCEIEN_MASK GENMASK(7, 7)
+#define A2B_INTMSK1_IO0IRQEN_MASK GENMASK(0, 0)
+#define A2B_INTMSK1_IO1IRQEN_MASK GENMASK(1, 1)
+#define A2B_INTMSK1_IO2IRQEN_MASK GENMASK(2, 2)
+#define A2B_INTMSK1_IO3IRQEN_MASK GENMASK(3, 3)
+#define A2B_INTMSK1_IO4IRQEN_MASK GENMASK(4, 4)
+#define A2B_INTMSK1_IO5IRQEN_MASK GENMASK(5, 5)
+#define A2B_INTMSK1_IO6IRQEN_MASK GENMASK(6, 6)
+#define A2B_INTMSK1_IO7IRQEN_MASK GENMASK(7, 7)
+#define A2B_INTMSK2_DSCDIEN_MASK GENMASK(0, 0)
+#define A2B_INTMSK2_I2CEIEN_MASK GENMASK(1, 1)
+#define A2B_INTMSK2_ICRCEIEN_MASK GENMASK(2, 2)
+#define A2B_INTMSK2_SLVIRQEN_MASK GENMASK(3, 3)
+#define A2B_BECCTL_ENHDCNT_MASK GENMASK(0, 0)
+#define A2B_BECCTL_ENDD_MASK GENMASK(1, 1)
+#define A2B_BECCTL_ENCRC_MASK GENMASK(2, 2)
+#define A2B_BECCTL_ENDP_MASK GENMASK(3, 3)
+#define A2B_BECCTL_ENICRC_MASK GENMASK(4, 4)
+#define A2B_BECCTL_THRESHLD_MASK GENMASK(7, 5)
+#define A2B_BECNT_BECNT_MASK GENMASK(7, 0)
+#define A2B_TESTMODE_PRBSUP_MASK GENMASK(0, 0)
+#define A2B_TESTMODE_PRBSDN_MASK GENMASK(1, 1)
+#define A2B_TESTMODE_PRBSN2N_MASK GENMASK(2, 2)
+#define A2B_TESTMODE_RXDPTH_MASK GENMASK(5, 4)
+#define A2B_ERRCNT0_ERRCNT_MASK GENMASK(7, 0)
+#define A2B_ERRCNT1_ERRCNT_MASK GENMASK(7, 0)
+#define A2B_ERRCNT2_ERRCNT_MASK GENMASK(7, 0)
+#define A2B_ERRCNT3_ERRCNT_MASK GENMASK(7, 0)
+#define A2B_NODE_NUMBER_MASK GENMASK(3, 0)
+#define A2B_NODE_DISCVD_MASK GENMASK(5, 5)
+#define A2B_NODE_NLAST_MASK GENMASK(6, 6)
+#define A2B_NODE_LAST_MASK GENMASK(7, 7)
+#define A2B_DISCSTAT_DNODE_MASK GENMASK(3, 0)
+#define A2B_DISCSTAT_DSCACT_MASK GENMASK(7, 7)
+#define A2B_TXACTL_TXALEVEL_MASK GENMASK(1, 0)
+#define A2B_TXACTL_TXAOVREN_MASK GENMASK(7, 7)
+#define A2B_TXBCTL_TXBLEVEL_MASK GENMASK(1, 0)
+#define A2B_TXBCTL_TXBOVREN_MASK GENMASK(7, 7)
+#define A2B_LINTTYPE_LTYPE_MASK GENMASK(7, 0)
+#define A2B_I2CCFG_DATARATE_MASK GENMASK(0, 0)
+#define A2B_I2CCFG_EACK_MASK GENMASK(1, 1)
+#define A2B_I2CCFG_FRAMERATE_MASK GENMASK(2, 2)
+#define A2B_PLLCTL_SSFREQ_MASK GENMASK(1, 0)
+#define A2B_PLLCTL_SSDEPTH_MASK GENMASK(3, 3)
+#define A2B_PLLCTL_SSMODE_MASK GENMASK(7, 6)
+#define A2B_I2SGCFG_TDMMODE_MASK GENMASK(2, 0)
+#define A2B_I2SGCFG_RXONDTX1_MASK GENMASK(3, 3)
+#define A2B_I2SGCFG_TDMSS_MASK GENMASK(4, 4)
+#define A2B_I2SGCFG_ALT_MASK GENMASK(5, 5)
+#define A2B_I2SGCFG_EARLY_MASK GENMASK(6, 6)
+#define A2B_I2SGCFG_INV_MASK GENMASK(7, 7)
+#define A2B_I2SCFG_TX0EN_MASK GENMASK(0, 0)
+#define A2B_I2SCFG_TX1EN_MASK GENMASK(1, 1)
+#define A2B_I2SCFG_TX2PINTL_MASK GENMASK(2, 2)
+#define A2B_I2SCFG_TXBCLKINV_MASK GENMASK(3, 3)
+#define A2B_I2SCFG_RX0EN_MASK GENMASK(4, 4)
+#define A2B_I2SCFG_RX1EN_MASK GENMASK(5, 5)
+#define A2B_I2SCFG_RX2PINTL_MASK GENMASK(6, 6)
+#define A2B_I2SCFG_RXBCLKINV_MASK GENMASK(7, 7)
+#define A2B_I2SRATE_I2SRATE_MASK GENMASK(2, 0)
+#define A2B_I2SRATE_BCLKRATE_MASK GENMASK(5, 3)
+#define A2B_I2SRATE_FRAMES_MASK GENMASK(5, 4)
+#define A2B_I2SRATE_REDUCE_MASK GENMASK(6, 6)
+#define A2B_I2SRATE_SHARE_MASK GENMASK(7, 7)
+#define A2B_I2STXOFFSET_TXOFFSET_MASK GENMASK(5, 0)
+#define A2B_I2STXOFFSET_TSAFTER_MASK GENMASK(6, 6)
+#define A2B_I2STXOFFSET_TSBEFORE_MASK GENMASK(7, 7)
+#define A2B_I2SRXOFFSET_RXOFFSET_MASK GENMASK(5, 0)
+#define A2B_SYNCOFFSET_SYNCOFFSET_MASK GENMASK(7, 0)
+#define A2B_PDMCTL_PDM0EN_MASK GENMASK(0, 0)
+#define A2B_PDMCTL_PDM0SLOTS_MASK GENMASK(1, 1)
+#define A2B_PDMCTL_PDM1EN_MASK GENMASK(2, 2)
+#define A2B_PDMCTL_PDM1SLOTS_MASK GENMASK(3, 3)
+#define A2B_PDMCTL_HPFEN_MASK GENMASK(4, 4)
+#define A2B_PDMCTL_PDMRATE_MASK GENMASK(6, 5)
+#define A2B_ERRMGMT_ERRLSB_MASK GENMASK(0, 0)
+#define A2B_ERRMGMT_ERRSIG_MASK GENMASK(1, 1)
+#define A2B_ERRMGMT_ERRSLOT_MASK GENMASK(2, 2)
+#define A2B_GPIODAT_IO0DAT_MASK GENMASK(0, 0)
+#define A2B_GPIODAT_IO1DAT_MASK GENMASK(1, 1)
+#define A2B_GPIODAT_IO2DAT_MASK GENMASK(2, 2)
+#define A2B_GPIODAT_IO3DAT_MASK GENMASK(3, 3)
+#define A2B_GPIODAT_IO4DAT_MASK GENMASK(4, 4)
+#define A2B_GPIODAT_IO5DAT_MASK GENMASK(5, 5)
+#define A2B_GPIODAT_IO6DAT_MASK GENMASK(6, 6)
+#define A2B_GPIODAT_IO7DAT_MASK GENMASK(7, 7)
+#define A2B_GPIODATSET_IO0DSET_MASK GENMASK(0, 0)
+#define A2B_GPIODATSET_IO1DSET_MASK GENMASK(1, 1)
+#define A2B_GPIODATSET_IO2DSET_MASK GENMASK(2, 2)
+#define A2B_GPIODATSET_IO3DSET_MASK GENMASK(3, 3)
+#define A2B_GPIODATSET_IO4DSET_MASK GENMASK(4, 4)
+#define A2B_GPIODATSET_IO5DSET_MASK GENMASK(5, 5)
+#define A2B_GPIODATSET_IO6DSET_MASK GENMASK(6, 6)
+#define A2B_GPIODATSET_IO7DSET_MASK GENMASK(7, 7)
+#define A2B_GPIODATCLR_IO0DCLR_MASK GENMASK(0, 0)
+#define A2B_GPIODATCLR_IO1DCLR_MASK GENMASK(1, 1)
+#define A2B_GPIODATCLR_IO2DCLR_MASK GENMASK(2, 2)
+#define A2B_GPIODATCLR_IO3DCLR_MASK GENMASK(3, 3)
+#define A2B_GPIODATCLR_IO4DCLR_MASK GENMASK(4, 4)
+#define A2B_GPIODATCLR_IO5DCLR_MASK GENMASK(5, 5)
+#define A2B_GPIODATCLR_IO6DCLR_MASK GENMASK(6, 6)
+#define A2B_GPIODATCLR_IO7DCLR_MASK GENMASK(7, 7)
+#define A2B_GPIOOEN_IO0OEN_MASK GENMASK(0, 0)
+#define A2B_GPIOOEN_IO1OEN_MASK GENMASK(1, 1)
+#define A2B_GPIOOEN_IO2OEN_MASK GENMASK(2, 2)
+#define A2B_GPIOOEN_IO3OEN_MASK GENMASK(3, 3)
+#define A2B_GPIOOEN_IO4OEN_MASK GENMASK(4, 4)
+#define A2B_GPIOOEN_IO5OEN_MASK GENMASK(5, 5)
+#define A2B_GPIOOEN_IO6OEN_MASK GENMASK(6, 6)
+#define A2B_GPIOOEN_IO7OEN_MASK GENMASK(7, 7)
+#define A2B_GPIOIEN_IO0IEN_MASK GENMASK(0, 0)
+#define A2B_GPIOIEN_IO1IEN_MASK GENMASK(1, 1)
+#define A2B_GPIOIEN_IO2IEN_MASK GENMASK(2, 2)
+#define A2B_GPIOIEN_IO3IEN_MASK GENMASK(3, 3)
+#define A2B_GPIOIEN_IO4IEN_MASK GENMASK(4, 4)
+#define A2B_GPIOIEN_IO5IEN_MASK GENMASK(5, 5)
+#define A2B_GPIOIEN_IO6IEN_MASK GENMASK(6, 6)
+#define A2B_GPIOIEN_IO7IEN_MASK GENMASK(7, 7)
+#define A2B_GPIOIN_IO0IN_MASK GENMASK(0, 0)
+#define A2B_GPIOIN_IO1IN_MASK GENMASK(1, 1)
+#define A2B_GPIOIN_IO2IN_MASK GENMASK(2, 2)
+#define A2B_GPIOIN_IO3IN_MASK GENMASK(3, 3)
+#define A2B_GPIOIN_IO4IN_MASK GENMASK(4, 4)
+#define A2B_GPIOIN_IO5IN_MASK GENMASK(5, 5)
+#define A2B_GPIOIN_IO6IN_MASK GENMASK(6, 6)
+#define A2B_GPIOIN_IO7IN_MASK GENMASK(7, 7)
+#define A2B_PINTEN_IO0IE_MASK GENMASK(0, 0)
+#define A2B_PINTEN_IO1IE_MASK GENMASK(1, 1)
+#define A2B_PINTEN_IO2IE_MASK GENMASK(2, 2)
+#define A2B_PINTEN_IO3IE_MASK GENMASK(3, 3)
+#define A2B_PINTEN_IO4IE_MASK GENMASK(4, 4)
+#define A2B_PINTEN_IO5IE_MASK GENMASK(5, 5)
+#define A2B_PINTEN_IO6IE_MASK GENMASK(6, 6)
+#define A2B_PINTEN_IO7IE_MASK GENMASK(7, 7)
+#define A2B_PINTINV_IO0INV_MASK GENMASK(0, 0)
+#define A2B_PINTINV_IO1INV_MASK GENMASK(1, 1)
+#define A2B_PINTINV_IO2INV_MASK GENMASK(2, 2)
+#define A2B_PINTINV_IO3INV_MASK GENMASK(3, 3)
+#define A2B_PINTINV_IO4INV_MASK GENMASK(4, 4)
+#define A2B_PINTINV_IO5INV_MASK GENMASK(5, 5)
+#define A2B_PINTINV_IO6INV_MASK GENMASK(6, 6)
+#define A2B_PINTINV_IO7INV_MASK GENMASK(7, 7)
+#define A2B_PINCFG_DRVSTR_MASK GENMASK(0, 0)
+#define A2B_PINCFG_IRQINV_MASK GENMASK(4, 4)
+#define A2B_PINCFG_IRQTS_MASK GENMASK(5, 5)
+#define A2B_I2STEST_PATTRN2TX_MASK GENMASK(0, 0)
+#define A2B_I2STEST_LOOPBK2TX_MASK GENMASK(1, 1)
+#define A2B_I2STEST_RX2LOOPBK_MASK GENMASK(2, 2)
+#define A2B_I2STEST_SELRX1_MASK GENMASK(3, 3)
+#define A2B_I2STEST_BUSLOOPBK_MASK GENMASK(4, 4)
+#define A2B_RAISE_RAISE_MASK GENMASK(7, 0)
+#define A2B_GENERR_GENHCERR_MASK GENMASK(0, 0)
+#define A2B_GENERR_GENDDERR_MASK GENMASK(1, 1)
+#define A2B_GENERR_GENCRCERR_MASK GENMASK(2, 2)
+#define A2B_GENERR_GENDPERR_MASK GENMASK(3, 3)
+#define A2B_GENERR_GENICRCERR_MASK GENMASK(4, 4)
+#define A2B_I2SRRATE_RRDIV_MASK GENMASK(5, 0)
+#define A2B_I2SRRATE_RBUS_MASK GENMASK(7, 7)
+#define A2B_I2SRRCTL_ENVLSB_MASK GENMASK(0, 0)
+#define A2B_I2SRRCTL_ENXBIT_MASK GENMASK(1, 1)
+#define A2B_I2SRRCTL_ENSTRB_MASK GENMASK(4, 4)
+#define A2B_I2SRRCTL_STRBDIR_MASK GENMASK(5, 5)
+#define A2B_I2SRRSOFFS_RRSOFFSET_MASK GENMASK(1, 0)
+#define A2B_CLK1CFG_CLK1DIV_MASK GENMASK(3, 0)
+#define A2B_CLK1CFG_CLK1PDIV_MASK GENMASK(5, 5)
+#define A2B_CLK1CFG_CLK1INV_MASK GENMASK(6, 6)
+#define A2B_CLK1CFG_CLK1EN_MASK GENMASK(7, 7)
+#define A2B_CLK2CFG_CLK2DIV_MASK GENMASK(3, 0)
+#define A2B_CLK2CFG_CLK2PDIV_MASK GENMASK(5, 5)
+#define A2B_CLK2CFG_CLK2INV_MASK GENMASK(6, 6)
+#define A2B_CLK2CFG_CLK2EN_MASK GENMASK(7, 7)
+#define A2B_BMMCFG_BMMEN_MASK GENMASK(0, 0)
+#define A2B_BMMCFG_BMMRXEN_MASK GENMASK(1, 1)
+#define A2B_BMMCFG_BMMNDSC_MASK GENMASK(2, 2)
+#define A2B_SUSCFG_SUSSEL_MASK GENMASK(2, 0)
+#define A2B_SUSCFG_SUSOE_MASK GENMASK(4, 4)
+#define A2B_SUSCFG_SUSDIS_MASK GENMASK(5, 5)
+#define A2B_PDMCTL2_PDMDEST_MASK GENMASK(1, 0)
+#define A2B_PDMCTL2_PDM0FFRST_MASK GENMASK(2, 2)
+#define A2B_PDMCTL2_PDM1FFRST_MASK GENMASK(3, 3)
+#define A2B_PDMCTL2_PDMALTCLK_MASK GENMASK(4, 4)
+#define A2B_PDMCTL2_PDMINVCLK_MASK GENMASK(5, 5)
+#define A2B_UPMASK0_RXUPSLOT00_MASK GENMASK(0, 0)
+#define A2B_UPMASK0_RXUPSLOT01_MASK GENMASK(1, 1)
+#define A2B_UPMASK0_RXUPSLOT02_MASK GENMASK(2, 2)
+#define A2B_UPMASK0_RXUPSLOT03_MASK GENMASK(3, 3)
+#define A2B_UPMASK0_RXUPSLOT04_MASK GENMASK(4, 4)
+#define A2B_UPMASK0_RXUPSLOT05_MASK GENMASK(5, 5)
+#define A2B_UPMASK0_RXUPSLOT06_MASK GENMASK(6, 6)
+#define A2B_UPMASK0_RXUPSLOT07_MASK GENMASK(7, 7)
+#define A2B_UPMASK1_RXUPSLOT08_MASK GENMASK(0, 0)
+#define A2B_UPMASK1_RXUPSLOT09_MASK GENMASK(1, 1)
+#define A2B_UPMASK1_RXUPSLOT10_MASK GENMASK(2, 2)
+#define A2B_UPMASK1_RXUPSLOT11_MASK GENMASK(3, 3)
+#define A2B_UPMASK1_RXUPSLOT12_MASK GENMASK(4, 4)
+#define A2B_UPMASK1_RXUPSLOT13_MASK GENMASK(5, 5)
+#define A2B_UPMASK1_RXUPSLOT14_MASK GENMASK(6, 6)
+#define A2B_UPMASK1_RXUPSLOT15_MASK GENMASK(7, 7)
+#define A2B_UPMASK2_RXUPSLOT16_MASK GENMASK(0, 0)
+#define A2B_UPMASK2_RXUPSLOT17_MASK GENMASK(1, 1)
+#define A2B_UPMASK2_RXUPSLOT18_MASK GENMASK(2, 2)
+#define A2B_UPMASK2_RXUPSLOT19_MASK GENMASK(3, 3)
+#define A2B_UPMASK2_RXUPSLOT20_MASK GENMASK(4, 4)
+#define A2B_UPMASK2_RXUPSLOT21_MASK GENMASK(5, 5)
+#define A2B_UPMASK2_RXUPSLOT22_MASK GENMASK(6, 6)
+#define A2B_UPMASK2_RXUPSLOT23_MASK GENMASK(7, 7)
+#define A2B_UPMASK3_RXUPSLOT24_MASK GENMASK(0, 0)
+#define A2B_UPMASK3_RXUPSLOT25_MASK GENMASK(1, 1)
+#define A2B_UPMASK3_RXUPSLOT26_MASK GENMASK(2, 2)
+#define A2B_UPMASK3_RXUPSLOT27_MASK GENMASK(3, 3)
+#define A2B_UPMASK3_RXUPSLOT28_MASK GENMASK(4, 4)
+#define A2B_UPMASK3_RXUPSLOT29_MASK GENMASK(5, 5)
+#define A2B_UPMASK3_RXUPSLOT30_MASK GENMASK(6, 6)
+#define A2B_UPMASK3_RXUPSLOT31_MASK GENMASK(7, 7)
+#define A2B_UPOFFSET_UPOFFSET_MASK GENMASK(4, 0)
+#define A2B_DNMASK0_RXDNSLOT00_MASK GENMASK(0, 0)
+#define A2B_DNMASK0_RXDNSLOT01_MASK GENMASK(1, 1)
+#define A2B_DNMASK0_RXDNSLOT02_MASK GENMASK(2, 2)
+#define A2B_DNMASK0_RXDNSLOT03_MASK GENMASK(3, 3)
+#define A2B_DNMASK0_RXDNSLOT04_MASK GENMASK(4, 4)
+#define A2B_DNMASK0_RXDNSLOT05_MASK GENMASK(5, 5)
+#define A2B_DNMASK0_RXDNSLOT06_MASK GENMASK(6, 6)
+#define A2B_DNMASK0_RXDNSLOT07_MASK GENMASK(7, 7)
+#define A2B_DNMASK1_RXDNSLOT08_MASK GENMASK(0, 0)
+#define A2B_DNMASK1_RXDNSLOT09_MASK GENMASK(1, 1)
+#define A2B_DNMASK1_RXDNSLOT10_MASK GENMASK(2, 2)
+#define A2B_DNMASK1_RXDNSLOT11_MASK GENMASK(3, 3)
+#define A2B_DNMASK1_RXDNSLOT12_MASK GENMASK(4, 4)
+#define A2B_DNMASK1_RXDNSLOT13_MASK GENMASK(5, 5)
+#define A2B_DNMASK1_RXDNSLOT14_MASK GENMASK(6, 6)
+#define A2B_DNMASK1_RXDNSLOT15_MASK GENMASK(7, 7)
+#define A2B_DNMASK2_RXDNSLOT16_MASK GENMASK(0, 0)
+#define A2B_DNMASK2_RXDNSLOT17_MASK GENMASK(1, 1)
+#define A2B_DNMASK2_RXDNSLOT18_MASK GENMASK(2, 2)
+#define A2B_DNMASK2_RXDNSLOT19_MASK GENMASK(3, 3)
+#define A2B_DNMASK2_RXDNSLOT20_MASK GENMASK(4, 4)
+#define A2B_DNMASK2_RXDNSLOT21_MASK GENMASK(5, 5)
+#define A2B_DNMASK2_RXDNSLOT22_MASK GENMASK(6, 6)
+#define A2B_DNMASK2_RXDNSLOT23_MASK GENMASK(7, 7)
+#define A2B_DNMASK3_RXDNSLOT24_MASK GENMASK(0, 0)
+#define A2B_DNMASK3_RXDNSLOT25_MASK GENMASK(1, 1)
+#define A2B_DNMASK3_RXDNSLOT26_MASK GENMASK(2, 2)
+#define A2B_DNMASK3_RXDNSLOT27_MASK GENMASK(3, 3)
+#define A2B_DNMASK3_RXDNSLOT28_MASK GENMASK(4, 4)
+#define A2B_DNMASK3_RXDNSLOT29_MASK GENMASK(5, 5)
+#define A2B_DNMASK3_RXDNSLOT30_MASK GENMASK(6, 6)
+#define A2B_DNMASK3_RXDNSLOT31_MASK GENMASK(7, 7)
+#define A2B_DNOFFSET_DNOFFSET_MASK GENMASK(4, 0)
+#define A2B_CHIPID0_CHIPID_MASK GENMASK(7, 0)
+#define A2B_CHIPID1_CHIPID_MASK GENMASK(7, 0)
+#define A2B_CHIPID2_CHIPID_MASK GENMASK(7, 0)
+#define A2B_CHIPID3_CHIPID_MASK GENMASK(7, 0)
+#define A2B_CHIPID4_CHIPID_MASK GENMASK(7, 0)
+#define A2B_CHIPID5_CHIPID_MASK GENMASK(7, 0)
+#define A2B_GPIODEN_IOD0EN_MASK GENMASK(0, 0)
+#define A2B_GPIODEN_IOD1EN_MASK GENMASK(1, 1)
+#define A2B_GPIODEN_IOD2EN_MASK GENMASK(2, 2)
+#define A2B_GPIODEN_IOD3EN_MASK GENMASK(3, 3)
+#define A2B_GPIODEN_IOD4EN_MASK GENMASK(4, 4)
+#define A2B_GPIODEN_IOD5EN_MASK GENMASK(5, 5)
+#define A2B_GPIODEN_IOD6EN_MASK GENMASK(6, 6)
+#define A2B_GPIODEN_IOD7EN_MASK GENMASK(7, 7)
+#define A2B_GPIOD0MSK_IOD0MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD1MSK_IOD1MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD2MSK_IOD2MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD3MSK_IOD3MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD4MSK_IOD4MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD5MSK_IOD5MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD6MSK_IOD6MSK_MASK GENMASK(7, 0)
+#define A2B_GPIOD7MSK_IOD7MSK_MASK GENMASK(7, 0)
+#define A2B_GPIODDAT_IOD0DAT_MASK GENMASK(0, 0)
+#define A2B_GPIODDAT_IOD1DAT_MASK GENMASK(1, 1)
+#define A2B_GPIODDAT_IOD2DAT_MASK GENMASK(2, 2)
+#define A2B_GPIODDAT_IOD3DAT_MASK GENMASK(3, 3)
+#define A2B_GPIODDAT_IOD4DAT_MASK GENMASK(4, 4)
+#define A2B_GPIODDAT_IOD5DAT_MASK GENMASK(5, 5)
+#define A2B_GPIODDAT_IOD6DAT_MASK GENMASK(6, 6)
+#define A2B_GPIODDAT_IOD7DAT_MASK GENMASK(7, 7)
+#define A2B_GPIODINV_IOD0INV_MASK GENMASK(0, 0)
+#define A2B_GPIODINV_IOD1INV_MASK GENMASK(1, 1)
+#define A2B_GPIODINV_IOD2INV_MASK GENMASK(2, 2)
+#define A2B_GPIODINV_IOD3INV_MASK GENMASK(3, 3)
+#define A2B_GPIODINV_IOD4INV_MASK GENMASK(4, 4)
+#define A2B_GPIODINV_IOD5INV_MASK GENMASK(5, 5)
+#define A2B_GPIODINV_IOD6INV_MASK GENMASK(6, 6)
+#define A2B_GPIODINV_IOD7INV_MASK GENMASK(7, 7)
+#define A2B_MBOX0CTL_MB0EN_MASK GENMASK(0, 0)
+#define A2B_MBOX0CTL_MB0DIR_MASK GENMASK(1, 1)
+#define A2B_MBOX0CTL_MB0EIEN_MASK GENMASK(2, 2)
+#define A2B_MBOX0CTL_MB0FIEN_MASK GENMASK(3, 3)
+#define A2B_MBOX0CTL_MB0LEN_MASK GENMASK(5, 4)
+#define A2B_MBOX0STAT_MB0FULL_MASK GENMASK(0, 0)
+#define A2B_MBOX0STAT_MB0EMPTY_MASK GENMASK(1, 1)
+#define A2B_MBOX0STAT_MB0FIRQ_MASK GENMASK(4, 4)
+#define A2B_MBOX0STAT_MB0EIRQ_MASK GENMASK(5, 5)
+#define A2B_MBOX0B0_MBOX0_MASK GENMASK(7, 0)
+#define A2B_MBOX0B1_MBOX0_MASK GENMASK(7, 0)
+#define A2B_MBOX0B2_MBOX0_MASK GENMASK(7, 0)
+#define A2B_MBOX0B3_MBOX0_MASK GENMASK(7, 0)
+#define A2B_MBOX1CTL_MB1EN_MASK GENMASK(0, 0)
+#define A2B_MBOX1CTL_MB1DIR_MASK GENMASK(1, 1)
+#define A2B_MBOX1CTL_MB1EIEN_MASK GENMASK(2, 2)
+#define A2B_MBOX1CTL_MB1FIEN_MASK GENMASK(3, 3)
+#define A2B_MBOX1CTL_MB1LEN_MASK GENMASK(5, 4)
+#define A2B_MBOX1STAT_MB1FULL_MASK GENMASK(0, 0)
+#define A2B_MBOX1STAT_MB1EMPTY_MASK GENMASK(1, 1)
+#define A2B_MBOX1STAT_MB1FIRQ_MASK GENMASK(4, 4)
+#define A2B_MBOX1STAT_MB1EIRQ_MASK GENMASK(5, 5)
+#define A2B_MBOX1B0_MBOX1_MASK GENMASK(7, 0)
+#define A2B_MBOX1B1_MBOX1_MASK GENMASK(7, 0)
+#define A2B_MBOX1B2_MBOX1_MASK GENMASK(7, 0)
+#define A2B_MBOX1B3_MBOX1_MASK GENMASK(7, 0)
+
+#define A2B_CHIP_CHIPADR_SHIFT 0
+#define A2B_NODEADR_NODE_SHIFT 0
+#define A2B_NODEADR_PERI_SHIFT 5
+#define A2B_NODEADR_BRCST_SHIFT 7
+#define A2B_VENDOR_VENDOR_SHIFT 0
+#define A2B_PRODUCT_PRODUCT_SHIFT 0
+#define A2B_VERSION_VERSION_SHIFT 0
+#define A2B_CAPABILITY_I2CAVAIL_SHIFT 0
+#define A2B_SWCTL_ENSW_SHIFT 0
+#define A2B_SWCTL_DIAGMODE_SHIFT 3
+#define A2B_SWCTL_MODE_SHIFT 4
+#define A2B_SWCTL_DISNXT_SHIFT 6
+#define A2B_BCDNSLOTS_BCDNSLOTS_SHIFT 0
+#define A2B_LDNSLOTS_LDNSLOTS_SHIFT 0
+#define A2B_LDNSLOTS_DNMASKEN_SHIFT 7
+#define A2B_LUPSLOTS_LUPSLOTS_SHIFT 0
+#define A2B_DNSLOTS_DNSLOTS_SHIFT 0
+#define A2B_UPSLOTS_UPSLOTS_SHIFT 0
+#define A2B_RESPCYCS_RESPCYCS_SHIFT 0
+#define A2B_SLOTFMT_DNSIZE_SHIFT 0
+#define A2B_SLOTFMT_DNFMT_SHIFT 3
+#define A2B_SLOTFMT_UPSIZE_SHIFT 4
+#define A2B_SLOTFMT_UPFMT_SHIFT 7
+#define A2B_DATCTL_DNS_SHIFT 0
+#define A2B_DATCTL_UPS_SHIFT 1
+#define A2B_DATCTL_ENDSNIFF_SHIFT 5
+#define A2B_DATCTL_STANDBY_SHIFT 7
+#define A2B_CONTROL_NEWSTRCT_SHIFT 0
+#define A2B_CONTROL_ENDDSC_SHIFT 1
+#define A2B_CONTROL_SOFTRST_SHIFT 2
+#define A2B_CONTROL_SWBYP_SHIFT 3
+#define A2B_CONTROL_XCVRBINV_SHIFT 4
+#define A2B_CONTROL_MSTR_SHIFT 7
+#define A2B_DISCVRY_DRESPCYC_SHIFT 0
+#define A2B_SWSTAT_FIN_SHIFT 0
+#define A2B_SWSTAT_FAULT_SHIFT 1
+#define A2B_SWSTAT_FAULT_CODE_SHIFT 4
+#define A2B_SWSTAT_FAULT_NLOC_SHIFT 7
+#define A2B_INTSTAT_IRQ_SHIFT 0
+#define A2B_INTSRC_INODE_SHIFT 0
+#define A2B_INTSRC_SLVINT_SHIFT 6
+#define A2B_INTSRC_MSTINT_SHIFT 7
+#define A2B_INTTYPE_TYPE_SHIFT 0
+#define A2B_INTPND0_HDCNTERR_SHIFT 0
+#define A2B_INTPND0_DDERR_SHIFT 1
+#define A2B_INTPND0_CRCERR_SHIFT 2
+#define A2B_INTPND0_DPERR_SHIFT 3
+#define A2B_INTPND0_PWRERR_SHIFT 4
+#define A2B_INTPND0_BECOVF_SHIFT 5
+#define A2B_INTPND0_SRFERR_SHIFT 6
+#define A2B_INTPND0_SRFCRCERR_SHIFT 7
+#define A2B_INTPND1_IO0PND_SHIFT 0
+#define A2B_INTPND1_IO1PND_SHIFT 1
+#define A2B_INTPND1_IO2PND_SHIFT 2
+#define A2B_INTPND1_IO3PND_SHIFT 3
+#define A2B_INTPND1_IO4PND_SHIFT 4
+#define A2B_INTPND1_IO5PND_SHIFT 5
+#define A2B_INTPND1_IO6PND_SHIFT 6
+#define A2B_INTPND1_IO7PND_SHIFT 7
+#define A2B_INTPND2_DSCDONE_SHIFT 0
+#define A2B_INTPND2_I2CERR_SHIFT 1
+#define A2B_INTPND2_ICRCERR_SHIFT 2
+#define A2B_INTPND2_SLVIRQ_SHIFT 3
+#define A2B_INTMSK0_HDEIEN_SHIFT 0
+#define A2B_INTMSK0_DDEIEN_SHIFT 1
+#define A2B_INTMSK0_CRCEIEN_SHIFT 2
+#define A2B_INTMSK0_DPEIEN_SHIFT 3
+#define A2B_INTMSK0_PWREIEN_SHIFT 4
+#define A2B_INTMSK0_BECIEN_SHIFT 5
+#define A2B_INTMSK0_SRFEIEN_SHIFT 6
+#define A2B_INTMSK0_SRFCRCEIEN_SHIFT 7
+#define A2B_INTMSK1_IO0IRQEN_SHIFT 0
+#define A2B_INTMSK1_IO1IRQEN_SHIFT 1
+#define A2B_INTMSK1_IO2IRQEN_SHIFT 2
+#define A2B_INTMSK1_IO3IRQEN_SHIFT 3
+#define A2B_INTMSK1_IO4IRQEN_SHIFT 4
+#define A2B_INTMSK1_IO5IRQEN_SHIFT 5
+#define A2B_INTMSK1_IO6IRQEN_SHIFT 6
+#define A2B_INTMSK1_IO7IRQEN_SHIFT 7
+#define A2B_INTMSK2_DSCDIEN_SHIFT 0
+#define A2B_INTMSK2_I2CEIEN_SHIFT 1
+#define A2B_INTMSK2_ICRCEIEN_SHIFT 2
+#define A2B_INTMSK2_SLVIRQEN_SHIFT 3
+#define A2B_BECCTL_ENHDCNT_SHIFT 0
+#define A2B_BECCTL_ENDD_SHIFT 1
+#define A2B_BECCTL_ENCRC_SHIFT 2
+#define A2B_BECCTL_ENDP_SHIFT 3
+#define A2B_BECCTL_ENICRC_SHIFT 4
+#define A2B_BECCTL_THRESHLD_SHIFT 5
+#define A2B_BECNT_BECNT_SHIFT 0
+#define A2B_TESTMODE_PRBSUP_SHIFT 0
+#define A2B_TESTMODE_PRBSDN_SHIFT 1
+#define A2B_TESTMODE_PRBSN2N_SHIFT 2
+#define A2B_TESTMODE_RXDPTH_SHIFT 4
+#define A2B_ERRCNT0_ERRCNT_SHIFT 0
+#define A2B_ERRCNT1_ERRCNT_SHIFT 0
+#define A2B_ERRCNT2_ERRCNT_SHIFT 0
+#define A2B_ERRCNT3_ERRCNT_SHIFT 0
+#define A2B_NODE_NUMBER_SHIFT 0
+#define A2B_NODE_DISCVD_SHIFT 5
+#define A2B_NODE_NLAST_SHIFT 6
+#define A2B_NODE_LAST_SHIFT 7
+#define A2B_DISCSTAT_DNODE_SHIFT 0
+#define A2B_DISCSTAT_DSCACT_SHIFT 7
+#define A2B_TXACTL_TXALEVEL_SHIFT 0
+#define A2B_TXACTL_TXAOVREN_SHIFT 7
+#define A2B_TXBCTL_TXBLEVEL_SHIFT 0
+#define A2B_TXBCTL_TXBOVREN_SHIFT 7
+#define A2B_LINTTYPE_LTYPE_SHIFT 0
+#define A2B_I2CCFG_DATARATE_SHIFT 0
+#define A2B_I2CCFG_EACK_SHIFT 1
+#define A2B_I2CCFG_FRAMERATE_SHIFT 2
+#define A2B_PLLCTL_SSFREQ_SHIFT 0
+#define A2B_PLLCTL_SSDEPTH_SHIFT 3
+#define A2B_PLLCTL_SSMODE_SHIFT 6
+#define A2B_I2SGCFG_TDMMODE_SHIFT 0
+#define A2B_I2SGCFG_RXONDTX1_SHIFT 3
+#define A2B_I2SGCFG_TDMSS_SHIFT 4
+#define A2B_I2SGCFG_ALT_SHIFT 5
+#define A2B_I2SGCFG_EARLY_SHIFT 6
+#define A2B_I2SGCFG_INV_SHIFT 7
+#define A2B_I2SCFG_TX0EN_SHIFT 0
+#define A2B_I2SCFG_TX1EN_SHIFT 1
+#define A2B_I2SCFG_TX2PINTL_SHIFT 2
+#define A2B_I2SCFG_TXBCLKINV_SHIFT 3
+#define A2B_I2SCFG_RX0EN_SHIFT 4
+#define A2B_I2SCFG_RX1EN_SHIFT 5
+#define A2B_I2SCFG_RX2PINTL_SHIFT 6
+#define A2B_I2SCFG_RXBCLKINV_SHIFT 7
+#define A2B_I2SRATE_I2SRATE_SHIFT 0
+#define A2B_I2SRATE_BCLKRATE_SHIFT 3
+#define A2B_I2SRATE_FRAMES_SHIFT 4
+#define A2B_I2SRATE_REDUCE_SHIFT 6
+#define A2B_I2SRATE_SHARE_SHIFT 7
+#define A2B_I2STXOFFSET_TXOFFSET_SHIFT 0
+#define A2B_I2STXOFFSET_TSAFTER_SHIFT 6
+#define A2B_I2STXOFFSET_TSBEFORE_SHIFT 7
+#define A2B_I2SRXOFFSET_RXOFFSET_SHIFT 0
+#define A2B_SYNCOFFSET_SYNCOFFSET_SHIFT 0
+#define A2B_PDMCTL_PDM0EN_SHIFT 0
+#define A2B_PDMCTL_PDM0SLOTS_SHIFT 1
+#define A2B_PDMCTL_PDM1EN_SHIFT 2
+#define A2B_PDMCTL_PDM1SLOTS_SHIFT 3
+#define A2B_PDMCTL_HPFEN_SHIFT 4
+#define A2B_PDMCTL_PDMRATE_SHIFT 5
+#define A2B_ERRMGMT_ERRLSB_SHIFT 0
+#define A2B_ERRMGMT_ERRSIG_SHIFT 1
+#define A2B_ERRMGMT_ERRSLOT_SHIFT 2
+#define A2B_GPIODAT_IO0DAT_SHIFT 0
+#define A2B_GPIODAT_IO1DAT_SHIFT 1
+#define A2B_GPIODAT_IO2DAT_SHIFT 2
+#define A2B_GPIODAT_IO3DAT_SHIFT 3
+#define A2B_GPIODAT_IO4DAT_SHIFT 4
+#define A2B_GPIODAT_IO5DAT_SHIFT 5
+#define A2B_GPIODAT_IO6DAT_SHIFT 6
+#define A2B_GPIODAT_IO7DAT_SHIFT 7
+#define A2B_GPIODATSET_IO0DSET_SHIFT 0
+#define A2B_GPIODATSET_IO1DSET_SHIFT 1
+#define A2B_GPIODATSET_IO2DSET_SHIFT 2
+#define A2B_GPIODATSET_IO3DSET_SHIFT 3
+#define A2B_GPIODATSET_IO4DSET_SHIFT 4
+#define A2B_GPIODATSET_IO5DSET_SHIFT 5
+#define A2B_GPIODATSET_IO6DSET_SHIFT 6
+#define A2B_GPIODATSET_IO7DSET_SHIFT 7
+#define A2B_GPIODATCLR_IO0DCLR_SHIFT 0
+#define A2B_GPIODATCLR_IO1DCLR_SHIFT 1
+#define A2B_GPIODATCLR_IO2DCLR_SHIFT 2
+#define A2B_GPIODATCLR_IO3DCLR_SHIFT 3
+#define A2B_GPIODATCLR_IO4DCLR_SHIFT 4
+#define A2B_GPIODATCLR_IO5DCLR_SHIFT 5
+#define A2B_GPIODATCLR_IO6DCLR_SHIFT 6
+#define A2B_GPIODATCLR_IO7DCLR_SHIFT 7
+#define A2B_GPIOOEN_IO0OEN_SHIFT 0
+#define A2B_GPIOOEN_IO1OEN_SHIFT 1
+#define A2B_GPIOOEN_IO2OEN_SHIFT 2
+#define A2B_GPIOOEN_IO3OEN_SHIFT 3
+#define A2B_GPIOOEN_IO4OEN_SHIFT 4
+#define A2B_GPIOOEN_IO5OEN_SHIFT 5
+#define A2B_GPIOOEN_IO6OEN_SHIFT 6
+#define A2B_GPIOOEN_IO7OEN_SHIFT 7
+#define A2B_GPIOIEN_IO0IEN_SHIFT 0
+#define A2B_GPIOIEN_IO1IEN_SHIFT 1
+#define A2B_GPIOIEN_IO2IEN_SHIFT 2
+#define A2B_GPIOIEN_IO3IEN_SHIFT 3
+#define A2B_GPIOIEN_IO4IEN_SHIFT 4
+#define A2B_GPIOIEN_IO5IEN_SHIFT 5
+#define A2B_GPIOIEN_IO6IEN_SHIFT 6
+#define A2B_GPIOIEN_IO7IEN_SHIFT 7
+#define A2B_GPIOIN_IO0IN_SHIFT 0
+#define A2B_GPIOIN_IO1IN_SHIFT 1
+#define A2B_GPIOIN_IO2IN_SHIFT 2
+#define A2B_GPIOIN_IO3IN_SHIFT 3
+#define A2B_GPIOIN_IO4IN_SHIFT 4
+#define A2B_GPIOIN_IO5IN_SHIFT 5
+#define A2B_GPIOIN_IO6IN_SHIFT 6
+#define A2B_GPIOIN_IO7IN_SHIFT 7
+#define A2B_PINTEN_IO0IE_SHIFT 0
+#define A2B_PINTEN_IO1IE_SHIFT 1
+#define A2B_PINTEN_IO2IE_SHIFT 2
+#define A2B_PINTEN_IO3IE_SHIFT 3
+#define A2B_PINTEN_IO4IE_SHIFT 4
+#define A2B_PINTEN_IO5IE_SHIFT 5
+#define A2B_PINTEN_IO6IE_SHIFT 6
+#define A2B_PINTEN_IO7IE_SHIFT 7
+#define A2B_PINTINV_IO0INV_SHIFT 0
+#define A2B_PINTINV_IO1INV_SHIFT 1
+#define A2B_PINTINV_IO2INV_SHIFT 2
+#define A2B_PINTINV_IO3INV_SHIFT 3
+#define A2B_PINTINV_IO4INV_SHIFT 4
+#define A2B_PINTINV_IO5INV_SHIFT 5
+#define A2B_PINTINV_IO6INV_SHIFT 6
+#define A2B_PINTINV_IO7INV_SHIFT 7
+#define A2B_PINCFG_DRVSTR_SHIFT 0
+#define A2B_PINCFG_IRQINV_SHIFT 4
+#define A2B_PINCFG_IRQTS_SHIFT 5
+#define A2B_I2STEST_PATTRN2TX_SHIFT 0
+#define A2B_I2STEST_LOOPBK2TX_SHIFT 1
+#define A2B_I2STEST_RX2LOOPBK_SHIFT 2
+#define A2B_I2STEST_SELRX1_SHIFT 3
+#define A2B_I2STEST_BUSLOOPBK_SHIFT 4
+#define A2B_RAISE_RAISE_SHIFT 0
+#define A2B_GENERR_GENHCERR_SHIFT 0
+#define A2B_GENERR_GENDDERR_SHIFT 1
+#define A2B_GENERR_GENCRCERR_SHIFT 2
+#define A2B_GENERR_GENDPERR_SHIFT 3
+#define A2B_GENERR_GENICRCERR_SHIFT 4
+#define A2B_I2SRRATE_RRDIV_SHIFT 0
+#define A2B_I2SRRATE_RBUS_SHIFT 7
+#define A2B_I2SRRCTL_ENVLSB_SHIFT 0
+#define A2B_I2SRRCTL_ENXBIT_SHIFT 1
+#define A2B_I2SRRCTL_ENSTRB_SHIFT 4
+#define A2B_I2SRRCTL_STRBDIR_SHIFT 5
+#define A2B_I2SRRSOFFS_RRSOFFSET_SHIFT 0
+#define A2B_CLK1CFG_CLK1DIV_SHIFT 0
+#define A2B_CLK1CFG_CLK1PDIV_SHIFT 5
+#define A2B_CLK1CFG_CLK1INV_SHIFT 6
+#define A2B_CLK1CFG_CLK1EN_SHIFT 7
+#define A2B_CLK2CFG_CLK2DIV_SHIFT 0
+#define A2B_CLK2CFG_CLK2PDIV_SHIFT 5
+#define A2B_CLK2CFG_CLK2INV_SHIFT 6
+#define A2B_CLK2CFG_CLK2EN_SHIFT 7
+#define A2B_BMMCFG_BMMEN_SHIFT 0
+#define A2B_BMMCFG_BMMRXEN_SHIFT 1
+#define A2B_BMMCFG_BMMNDSC_SHIFT 2
+#define A2B_SUSCFG_SUSSEL_SHIFT 0
+#define A2B_SUSCFG_SUSOE_SHIFT 4
+#define A2B_SUSCFG_SUSDIS_SHIFT 5
+#define A2B_PDMCTL2_PDMDEST_SHIFT 0
+#define A2B_PDMCTL2_PDM0FFRST_SHIFT 2
+#define A2B_PDMCTL2_PDM1FFRST_SHIFT 3
+#define A2B_PDMCTL2_PDMALTCLK_SHIFT 4
+#define A2B_PDMCTL2_PDMINVCLK_SHIFT 5
+#define A2B_UPMASK0_RXUPSLOT00_SHIFT 0
+#define A2B_UPMASK0_RXUPSLOT01_SHIFT 1
+#define A2B_UPMASK0_RXUPSLOT02_SHIFT 2
+#define A2B_UPMASK0_RXUPSLOT03_SHIFT 3
+#define A2B_UPMASK0_RXUPSLOT04_SHIFT 4
+#define A2B_UPMASK0_RXUPSLOT05_SHIFT 5
+#define A2B_UPMASK0_RXUPSLOT06_SHIFT 6
+#define A2B_UPMASK0_RXUPSLOT07_SHIFT 7
+#define A2B_UPMASK1_RXUPSLOT08_SHIFT 0
+#define A2B_UPMASK1_RXUPSLOT09_SHIFT 1
+#define A2B_UPMASK1_RXUPSLOT10_SHIFT 2
+#define A2B_UPMASK1_RXUPSLOT11_SHIFT 3
+#define A2B_UPMASK1_RXUPSLOT12_SHIFT 4
+#define A2B_UPMASK1_RXUPSLOT13_SHIFT 5
+#define A2B_UPMASK1_RXUPSLOT14_SHIFT 6
+#define A2B_UPMASK1_RXUPSLOT15_SHIFT 7
+#define A2B_UPMASK2_RXUPSLOT16_SHIFT 0
+#define A2B_UPMASK2_RXUPSLOT17_SHIFT 1
+#define A2B_UPMASK2_RXUPSLOT18_SHIFT 2
+#define A2B_UPMASK2_RXUPSLOT19_SHIFT 3
+#define A2B_UPMASK2_RXUPSLOT20_SHIFT 4
+#define A2B_UPMASK2_RXUPSLOT21_SHIFT 5
+#define A2B_UPMASK2_RXUPSLOT22_SHIFT 6
+#define A2B_UPMASK2_RXUPSLOT23_SHIFT 7
+#define A2B_UPMASK3_RXUPSLOT24_SHIFT 0
+#define A2B_UPMASK3_RXUPSLOT25_SHIFT 1
+#define A2B_UPMASK3_RXUPSLOT26_SHIFT 2
+#define A2B_UPMASK3_RXUPSLOT27_SHIFT 3
+#define A2B_UPMASK3_RXUPSLOT28_SHIFT 4
+#define A2B_UPMASK3_RXUPSLOT29_SHIFT 5
+#define A2B_UPMASK3_RXUPSLOT30_SHIFT 6
+#define A2B_UPMASK3_RXUPSLOT31_SHIFT 7
+#define A2B_UPOFFSET_UPOFFSET_SHIFT 0
+#define A2B_DNMASK0_RXDNSLOT00_SHIFT 0
+#define A2B_DNMASK0_RXDNSLOT01_SHIFT 1
+#define A2B_DNMASK0_RXDNSLOT02_SHIFT 2
+#define A2B_DNMASK0_RXDNSLOT03_SHIFT 3
+#define A2B_DNMASK0_RXDNSLOT04_SHIFT 4
+#define A2B_DNMASK0_RXDNSLOT05_SHIFT 5
+#define A2B_DNMASK0_RXDNSLOT06_SHIFT 6
+#define A2B_DNMASK0_RXDNSLOT07_SHIFT 7
+#define A2B_DNMASK1_RXDNSLOT08_SHIFT 0
+#define A2B_DNMASK1_RXDNSLOT09_SHIFT 1
+#define A2B_DNMASK1_RXDNSLOT10_SHIFT 2
+#define A2B_DNMASK1_RXDNSLOT11_SHIFT 3
+#define A2B_DNMASK1_RXDNSLOT12_SHIFT 4
+#define A2B_DNMASK1_RXDNSLOT13_SHIFT 5
+#define A2B_DNMASK1_RXDNSLOT14_SHIFT 6
+#define A2B_DNMASK1_RXDNSLOT15_SHIFT 7
+#define A2B_DNMASK2_RXDNSLOT16_SHIFT 0
+#define A2B_DNMASK2_RXDNSLOT17_SHIFT 1
+#define A2B_DNMASK2_RXDNSLOT18_SHIFT 2
+#define A2B_DNMASK2_RXDNSLOT19_SHIFT 3
+#define A2B_DNMASK2_RXDNSLOT20_SHIFT 4
+#define A2B_DNMASK2_RXDNSLOT21_SHIFT 5
+#define A2B_DNMASK2_RXDNSLOT22_SHIFT 6
+#define A2B_DNMASK2_RXDNSLOT23_SHIFT 7
+#define A2B_DNMASK3_RXDNSLOT24_SHIFT 0
+#define A2B_DNMASK3_RXDNSLOT25_SHIFT 1
+#define A2B_DNMASK3_RXDNSLOT26_SHIFT 2
+#define A2B_DNMASK3_RXDNSLOT27_SHIFT 3
+#define A2B_DNMASK3_RXDNSLOT28_SHIFT 4
+#define A2B_DNMASK3_RXDNSLOT29_SHIFT 5
+#define A2B_DNMASK3_RXDNSLOT30_SHIFT 6
+#define A2B_DNMASK3_RXDNSLOT31_SHIFT 7
+#define A2B_DNOFFSET_DNOFFSET_SHIFT 0
+#define A2B_CHIPID0_CHIPID_SHIFT 0
+#define A2B_CHIPID1_CHIPID_SHIFT 0
+#define A2B_CHIPID2_CHIPID_SHIFT 0
+#define A2B_CHIPID3_CHIPID_SHIFT 0
+#define A2B_CHIPID4_CHIPID_SHIFT 0
+#define A2B_CHIPID5_CHIPID_SHIFT 0
+#define A2B_GPIODEN_IOD0EN_SHIFT 0
+#define A2B_GPIODEN_IOD1EN_SHIFT 1
+#define A2B_GPIODEN_IOD2EN_SHIFT 2
+#define A2B_GPIODEN_IOD3EN_SHIFT 3
+#define A2B_GPIODEN_IOD4EN_SHIFT 4
+#define A2B_GPIODEN_IOD5EN_SHIFT 5
+#define A2B_GPIODEN_IOD6EN_SHIFT 6
+#define A2B_GPIODEN_IOD7EN_SHIFT 7
+#define A2B_GPIOD0MSK_IOD0MSK_SHIFT 0
+#define A2B_GPIOD1MSK_IOD1MSK_SHIFT 0
+#define A2B_GPIOD2MSK_IOD2MSK_SHIFT 0
+#define A2B_GPIOD3MSK_IOD3MSK_SHIFT 0
+#define A2B_GPIOD4MSK_IOD4MSK_SHIFT 0
+#define A2B_GPIOD5MSK_IOD5MSK_SHIFT 0
+#define A2B_GPIOD6MSK_IOD6MSK_SHIFT 0
+#define A2B_GPIOD7MSK_IOD7MSK_SHIFT 0
+#define A2B_GPIODDAT_IOD0DAT_SHIFT 0
+#define A2B_GPIODDAT_IOD1DAT_SHIFT 1
+#define A2B_GPIODDAT_IOD2DAT_SHIFT 2
+#define A2B_GPIODDAT_IOD3DAT_SHIFT 3
+#define A2B_GPIODDAT_IOD4DAT_SHIFT 4
+#define A2B_GPIODDAT_IOD5DAT_SHIFT 5
+#define A2B_GPIODDAT_IOD6DAT_SHIFT 6
+#define A2B_GPIODDAT_IOD7DAT_SHIFT 7
+#define A2B_GPIODINV_IOD0INV_SHIFT 0
+#define A2B_GPIODINV_IOD1INV_SHIFT 1
+#define A2B_GPIODINV_IOD2INV_SHIFT 2
+#define A2B_GPIODINV_IOD3INV_SHIFT 3
+#define A2B_GPIODINV_IOD4INV_SHIFT 4
+#define A2B_GPIODINV_IOD5INV_SHIFT 5
+#define A2B_GPIODINV_IOD6INV_SHIFT 6
+#define A2B_GPIODINV_IOD7INV_SHIFT 7
+#define A2B_MBOX0CTL_MB0EN_SHIFT 0
+#define A2B_MBOX0CTL_MB0DIR_SHIFT 1
+#define A2B_MBOX0CTL_MB0EIEN_SHIFT 2
+#define A2B_MBOX0CTL_MB0FIEN_SHIFT 3
+#define A2B_MBOX0CTL_MB0LEN_SHIFT 4
+#define A2B_MBOX0STAT_MB0FULL_SHIFT 0
+#define A2B_MBOX0STAT_MB0EMPTY_SHIFT 1
+#define A2B_MBOX0STAT_MB0FIRQ_SHIFT 4
+#define A2B_MBOX0STAT_MB0EIRQ_SHIFT 5
+#define A2B_MBOX0B0_MBOX0_SHIFT 0
+#define A2B_MBOX0B1_MBOX0_SHIFT 0
+#define A2B_MBOX0B2_MBOX0_SHIFT 0
+#define A2B_MBOX0B3_MBOX0_SHIFT 0
+#define A2B_MBOX1CTL_MB1EN_SHIFT 0
+#define A2B_MBOX1CTL_MB1DIR_SHIFT 1
+#define A2B_MBOX1CTL_MB1EIEN_SHIFT 2
+#define A2B_MBOX1CTL_MB1FIEN_SHIFT 3
+#define A2B_MBOX1CTL_MB1LEN_SHIFT 4
+#define A2B_MBOX1STAT_MB1FULL_SHIFT 0
+#define A2B_MBOX1STAT_MB1EMPTY_SHIFT 1
+#define A2B_MBOX1STAT_MB1FIRQ_SHIFT 4
+#define A2B_MBOX1STAT_MB1EIRQ_SHIFT 5
+#define A2B_MBOX1B0_MBOX1_SHIFT 0
+#define A2B_MBOX1B1_MBOX1_SHIFT 0
+#define A2B_MBOX1B2_MBOX1_SHIFT 0
+#define A2B_MBOX1B3_MBOX1_SHIFT 0
+
+#endif /* _AD24XX_H */

-- 
2.44.0



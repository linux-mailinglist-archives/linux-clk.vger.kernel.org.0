Return-Path: <linux-clk+bounces-7100-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76828C78F5
	for <lists+linux-clk@lfdr.de>; Thu, 16 May 2024 17:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357F8281FC7
	for <lists+linux-clk@lfdr.de>; Thu, 16 May 2024 15:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B8014D2A8;
	Thu, 16 May 2024 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qiT2ujII"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E414B97C
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872132; cv=none; b=jOJBdM+uzzYbw4zq+hIlqeQ9BtBgviX44dDB8QlF48sT7FeeVnRX8qwK0qAX7UH1vHr6o9Ae6ZiwS25RoWQweOawOtL+TXdb9yn5hiLxPyBUWS4XBBc4lTIwtxzucbfnq8mtDDvlJDI1SkvWH16XVNHraZjjBQ095RXwAZ8r9nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872132; c=relaxed/simple;
	bh=cxaqUoQ9aguHyFdmx85j2AoRbVwkuszVVEgKQCGMEX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmdWBYvMTgl3lYeGPRPle6riVBp8rREKpqw5sC5l4Ko21VVNA4YCJpBmFVmsVF7Qsf71tAkGrY/VNt6kv+K+c4cB+JYG+PFWVmG7OqpFKawrde/6Z39LxuKmxC2pnF/tgLIq7UzgBfVZtK1hcXBIixUsbeUg8kAKUnFqBVf/anE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qiT2ujII; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4202dd90dcfso2629015e9.0
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872128; x=1716476928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=qiT2ujIIVGhrnuqOh3+FX8h23MZkpHqzNIhTFqsgLttZUVWi9NhtGcq7sh/HCpXPqS
         HnSdeWHSUiunY81T+sjuCYgvD9h44XvslU2HzSRxEA3PckF+6W+k7WauDx8JhvUnKN6L
         3td+XdAWwgn2DkqL3cEBi8NbXX6ZVAKYSf1gdJaPWiRcCYIxc2n+XhjFXMgo+Wq23yvc
         jSGCrTrRgzmW+1impZgD9sP3WLKwHe4tgrA0w/hNNUceQcTfc8/BkdOGUaQNHYeP9ZUY
         2MmiAwZXqVDOI0wzi9DGJqllfEJF8AhX5x9TPxfO9G2hG4LlKpoGQk8swM9zzSiGv/IY
         eYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872128; x=1716476928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=V4gvYk1yAOzoIYL+rsmh4sj8gGGuoLHrbVwzwrUsIsYueV1Yf0IzkaMZzSzf4cpJgg
         zkDbsQ52yscYnohRHLVF1IbWlbmDN7zSacf8xHUyLsD8ZBJFDM/UF3PGRc2D+9bQTOMX
         2FEDFDPuzy8Rlibl9sXgD7v6nCAiIlqoMtnZC/ZuB2CxbrnHISC8IOMQNFvxSiC5a8Pt
         1IpCZoAGIwOMdXb8q7h3H1xJCbNDElIydTqFRicOWAEqq5ixSO46sEIuBBvM3CkDhDm9
         l5/pfcW8+FzBErAxYhS0TXNbJXPQdDW4x+7sySnS96huHvDYktQ2hHjIYDLwJ3OabanJ
         BClg==
X-Forwarded-Encrypted: i=1; AJvYcCWgIRMh6FIHInnYl7C/0YVpYrWimKy5lroWh8kdHUzkzO3Mh5W6G3ED8chFOeK5+johLpaWjBVF9IfrDDCQMHiwZWFon8cXpbuJ
X-Gm-Message-State: AOJu0Yz+0q2l1gf+cmOqggMB2izKVYqCsDwAr6TXBErb6MRHkfX2aQOU
	aXlrYhNtWKg9sOup2jyeqGiolgjg4X0a6gNltvzqLM4p8X9f4os7bCLV+0zyGlw=
X-Google-Smtp-Source: AGHT+IEYZF+5ejklYa8gOutFOpqH9vmFIkmi4oDHndgWrV0jEKKooJucmjXLHzEaKGqSFHUhay2i4Q==
X-Received: by 2002:a05:600c:5008:b0:41f:e7ac:cc72 with SMTP id 5b1f17b1804b1-41fead643a0mr145586765e9.40.1715872128318;
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/9] reset: amlogic: convert driver to regmap
Date: Thu, 16 May 2024 17:08:31 +0200
Message-ID: <20240516150842.705844-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

To allow using the same driver for the main reset controller and the
auxiliary ones embedded in the clock controllers, convert the
the Amlogic reset driver to regmap.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index f78be97898bc..8f3d6e9df235 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -11,36 +11,44 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define BITS_PER_REG	32
-
 struct meson_reset_param {
 	int reg_count;
 	int level_offset;
 };
 
 struct meson_reset {
-	void __iomem *reg_base;
 	const struct meson_reset_param *param;
 	struct reset_controller_dev rcdev;
-	spinlock_t lock;
+	struct regmap *map;
 };
 
+static void meson_reset_offset_and_bit(struct meson_reset *data,
+				       unsigned long id,
+				       unsigned int *offset,
+				       unsigned int *bit)
+{
+	unsigned int stride = regmap_get_reg_stride(data->map);
+
+	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
+	*bit = id % (stride * BITS_PER_BYTE);
+}
+
 static int meson_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+			     unsigned long id)
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr = data->reg_base + (bank << 2);
+	unsigned int offset, bit;
 
-	writel(BIT(offset), reg_addr);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
 
-	return 0;
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), BIT(bit));
 }
 
 static int meson_reset_level(struct reset_controller_dev *rcdev,
@@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr;
-	unsigned long flags;
-	u32 reg;
+	unsigned int offset, bit;
 
-	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
 
-	spin_lock_irqsave(&data->lock, flags);
-
-	reg = readl(reg_addr);
-	if (assert)
-		writel(reg & ~BIT(offset), reg_addr);
-	else
-		writel(reg | BIT(offset), reg_addr);
-
-	spin_unlock_irqrestore(&data->lock, flags);
-
-	return 0;
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), assert ? 0 : BIT(bit));
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 
+static const struct regmap_config regmap_config = {
+	.reg_bits   = 32,
+	.val_bits   = 32,
+	.reg_stride = 4,
+};
+
 static int meson_reset_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct meson_reset *data;
+	void __iomem *base;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg_base))
-		return PTR_ERR(data->reg_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(&pdev->dev);
+	data->param = of_device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 
-	spin_lock_init(&data->lock);
+	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(data->map))
+		return dev_err_probe(dev, PTR_ERR(data->map),
+				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
+	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
+		* regmap_config.reg_stride;
 	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = pdev->dev.of_node;
+	data->rcdev.of_node = dev->of_node;
 
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static struct platform_driver meson_reset_driver = {
-- 
2.43.0



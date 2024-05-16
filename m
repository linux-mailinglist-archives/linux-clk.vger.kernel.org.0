Return-Path: <linux-clk+bounces-7106-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515968C7900
	for <lists+linux-clk@lfdr.de>; Thu, 16 May 2024 17:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BAF282BAC
	for <lists+linux-clk@lfdr.de>; Thu, 16 May 2024 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DAC14E2FF;
	Thu, 16 May 2024 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hbJwNewz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896C14C599
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872136; cv=none; b=al6m51B3a2VNZyXiuTf7JZxj6YD9ZDAFhkB1Ejbjt7UbBTCj6Ja0Ey5zjihbgVXyUyZ6VBAYUD2zFpQpsDXfSwETwFElbV/wgchOjBpio0pSyWd+IHoV9KKC6J4xlg/lyE/Zhcp1Iy+gXGxwguWjYf7YbIo9aHcxQjB5mb7ajK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872136; c=relaxed/simple;
	bh=tGtxQtR7HQ0uRAG9sLpag+dAG8Y70atmcVnT7vJqVsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rICNFOfS4y0e+DOX8EZGe7bAbDS2ymFL9NXcIOqs0Ad7eGwRv383hCdePHmnBIwLldFHTZV8DzRzc/Nqlp3doIL7wOqABCfHMgjp3mrLKGBo280wXY3NriykUt3yJIY8gn40Q6nYcIF6z39rmX3K3/112zJesfCbRXtNDOsVC2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hbJwNewz; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e6ffe57c23so8425231fa.3
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872133; x=1716476933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=hbJwNewzud1Oefpi9c5VwSDD8IUG8RsAFst1DYriSvb0AkKWLyEnRXKXQYP8h7Tp87
         EdEQ17XITvLG6F5tkmd5zge1YRcT7ihBxmh6rtPdqNeg4TJQluEqRLWVUFeqH3UJPP9j
         II7hVjn5dq9H/kXFFf6RPOSvMujTbzJFVtNrbnfuqBJ4cpPdnKXVk0uWuFYvULANVmdo
         fdEHwtNJoILubrIkdfflLp/oboCzsI7YafTfaVUB2wkMclUTpBKBlLthNV0iNKIZFcVa
         2LkGWVry1io8Kjmv4HnHedZkZmcmFa98o6uqFom96+fW8tiNMKrls5tBzAiiOcEKIAvY
         Bumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872133; x=1716476933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=qHtfs1vqAd0kA6D2LZs/Tkguw5ZbYIsXDOuVlBLqH/j9MziM+h8bbeTPcxfE0vXaZb
         H9Ofxx+Mn6C1wQHAcNgaxCkb32xWMr2TzB2wBBs+qExsszeqmGeAte5vzWS1x/cCjow7
         EWd8HxM2ghOA3zLExKR6yTZ/HusfGj5E7ufQAq/WJ6b1dIN+55fgQRx20WrsXpm9nt8t
         VPmvyIvm5+G24PR+UVapUqse4dL8bdEBNbXkNlFYlkGya2PllJChJMGwpzD3qvcOOrpC
         I8SVFKQKTzjPFASpPYlKIVOw+JZRzRmWmsqQZ7FIJAHHlOsVVWHek/pOR+xUkm1SeRIT
         RknA==
X-Forwarded-Encrypted: i=1; AJvYcCVmV7FCvXxNJiNc54w2lS0E2MKL+6Ma4Ckfow2Buuhvkc3L2kHndh96achDmpirIj49HsQ3eBX/bJvnDNDUv4gjrYBNrHF+jaI3
X-Gm-Message-State: AOJu0YzUqIc87pdAfSXt54qUDlVWEhLMJLfErAD7x7Cf2aJOssHuxG8c
	rQs/dGlWn7HcstXM6/aPfse8dcOFQaNX/C/Rpq0KADf170ehfS7ETcI2dhgTte8=
X-Google-Smtp-Source: AGHT+IHu52Tyfwl/3CPcNq8casphAsBV/Ti3JZcRRlwYTeXDmESt1XeztpWut4mxoqayT/xcvdJZXw==
X-Received: by 2002:a2e:97c3:0:b0:2e1:f253:152a with SMTP id 38308e7fff4ca-2e5204aef69mr132927271fa.51.1715872133305;
        Thu, 16 May 2024 08:08:53 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 6/9] reset: amlogic: add toggle reset support
Date: Thu, 16 May 2024 17:08:36 +0200
Message-ID: <20240516150842.705844-7-jbrunet@baylibre.com>
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

Add the emulation for the reset callback using level reset if reset is not
directly supported. This is done to keep the functionality of reset
driver of audio clock controller. This is expected to work by the related
reset consumers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 65ba9190cb53..e34a10b15593 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
+	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
@@ -98,6 +99,18 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
 	return meson_reset_level(rcdev, id, false);
 }
 
+static int meson_reset_level_toggle(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	int ret;
+
+	ret = meson_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return meson_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
@@ -105,6 +118,13 @@ static const struct reset_control_ops meson_reset_ops = {
 	.status		= meson_reset_status,
 };
 
+static const struct reset_control_ops meson_reset_toggle_ops = {
+	.reset		= meson_reset_level_toggle,
+	.assert		= meson_reset_assert,
+	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
+};
+
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
@@ -118,13 +138,14 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
 	data->rcdev.nr_resets = param->reset_num;
-	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.ops = param->reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static const struct meson_reset_param meson8b_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
@@ -132,6 +153,7 @@ static const struct meson_reset_param meson8b_param = {
 };
 
 static const struct meson_reset_param meson_a1_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
@@ -139,6 +161,7 @@ static const struct meson_reset_param meson_a1_param = {
 };
 
 static const struct meson_reset_param meson_s4_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
-- 
2.43.0



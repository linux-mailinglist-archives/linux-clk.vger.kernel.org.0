Return-Path: <linux-clk+bounces-9439-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9392D64C
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 18:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0464A289ACD
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 16:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2328195FE0;
	Wed, 10 Jul 2024 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eHNRRPSK"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00531953AD
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628745; cv=none; b=XQxcCAqiFoFUm0toteQYarbQ+KYWW7dLkD8Haown0Lij86EPUmTgCqFE3YlUFZHz8ID9ooMrNjDwE+2a2te3NWad5bM23eWBCRoFbyUGCP42YSWgdmH5v4ufHDNWFFF3SgBv+Vn64qay1zzv6Y7nVpuY2D8THj/sATl98gnX3G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628745; c=relaxed/simple;
	bh=tGtxQtR7HQ0uRAG9sLpag+dAG8Y70atmcVnT7vJqVsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZAvke8oKVD9pysFlwLUOASi9CrrCGbnnTHBLtH0p5cPiZ/Ntw3EAsY4iBXIyOt5p9E65K5wzFgljjVbHJR3CqiS/b68utFVKz8qK86gWDjUG0QsB8JFogDzMIVjsXGpVquRzxOmwsw8bc16t2RFdf4Ogy9L/rvPblF7kQJkaX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eHNRRPSK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e9f863c46so7116660e87.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628742; x=1721233542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=eHNRRPSKr4nKOK+kMBlBy+RrxmqHaiKL9GRHi9AsE2xXNYaSl3BP2oY1jLin2hktQ7
         +mIf8iJLANSRNySqbW9kVLUWsPddAONB/jgI3URN9MoTVaolhSD61CWsN3YAxOBvYWYN
         Z+mTPbsJ5ck8Ha/YhQTr53El49pZMihP3IBEaDzwl01eyxlItJqSUdw8HXv9WK/yoYFV
         Xn5eE4iGooAOtkstA3jkUdbg5oa+KOrMF0/cKry9LRbrW3KMKJLei7RGM0V1B4YkH0KH
         94Xx1r8abDZp/j+/B8+2sUhGfwj8HUa3Wn+XJS1mtTc1D//AmYxe0zIhawVvp7G6nfNl
         idAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628742; x=1721233542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=Nmkb6jvCDWgHRuocYUW8KXNXJX9R0ZruUfzUs5Nrk+VUCGeklR9As9DXW9X0ky6m/C
         U12Z/qaFueoq05Y7tt/2p8A9I/1voMIO2tGRx03hV7RPqrT7H9zYyS+BPpc7ffhLSNbR
         Ja0vrTrKa4c6/zCYI1srEDcE5pytJbjcMUm1M+kptcrjMZS/3Un6tWmVIdAeUuJ2rIKw
         wr/ApFCTeLdKP5fEE9PC2i/DxHXcZdkCrZYp7I02sWO12BGgnpKO6WNBHrBZDirlIgl+
         f9YYkmmk4wmd2CXDwy7N4wCKE4t43LA12T09Y8SRAyYsah9/njMMk2i3akZlG1ubx09h
         pG4w==
X-Forwarded-Encrypted: i=1; AJvYcCU4eOhoCEytzpgiFxBW1a+fOwdRWpRszjFt2ue/H+cOTH6IWqLcJT3/ALhdae0Q058QGdIJZGOa9mvtrp8YJHuTbzuhc1xhsbRd
X-Gm-Message-State: AOJu0YwalzswvFHTbYTdz6x2fmwyij8OHNV5ZlTR2slpXrZ1mK4FQNQ5
	Cpy4uYxgtBmKhpxJlJArfKhBUvQkWSEC+wk133ssc9l7P9NR316gKgpZ7XCs1Ei4ugeAgBn5Rcp
	WNhA=
X-Google-Smtp-Source: AGHT+IGoeOCZklKr0/1tvlfZaKQ+3YXN1j9s6sBPZnGkb/G0RZztUbY1oN6KCwJUbQaOeD8WjqbHnw==
X-Received: by 2002:a05:6512:108c:b0:52e:9480:9e71 with SMTP id 2adb3069b0e04-52eb9996055mr3907030e87.28.1720628742241;
        Wed, 10 Jul 2024 09:25:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/8] reset: amlogic: add toggle reset support
Date: Wed, 10 Jul 2024 18:25:15 +0200
Message-ID: <20240710162526.2341399-7-jbrunet@baylibre.com>
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



Return-Path: <linux-clk+bounces-28420-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BBB9A7EF
	for <lists+linux-clk@lfdr.de>; Wed, 24 Sep 2025 17:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D84164BED
	for <lists+linux-clk@lfdr.de>; Wed, 24 Sep 2025 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4122E30DD19;
	Wed, 24 Sep 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1tO3PBS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10B30ACF8
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726676; cv=none; b=Rr+XcHYTfxgF9spGHwy8H7vK68tNE269W7Qrd51OWucIZbrBkosg5jUC6URlm2tQPNcNnOqGm+6BwQe5mDYvj0Pygs6nWrTMSrMQjiWINBeBWFRyrDWSR3mi+ROxuMPYuTYuE9ykZ0xm7r2aFT0Uf3xf26GBc354Qd6oTYFFbSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726676; c=relaxed/simple;
	bh=e9jnjsKxvNvdU2khw3Ii1tiDbQ0I3fEhveIt8DxtYOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aF6Wsou1LujAE0pGbWx7FKpEpj5Jj/CS2AVXwQz39GgpT8GzotO5V/K2vizHEkFGFUgI0F9D7dy4Bo6+COuf1eWfyORazkfFJDHkqc2DJjg3CZg1Tw7jdT48qMyU6aE5wrImsi5xCmYuHYpr9nborazOKOBFCwutv7LSrfRYz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1tO3PBS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso13158335e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726672; x=1759331472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41p1zpQsk+NbDwSIv78ihFM0CdBgvYG00QN32wnKKd8=;
        b=l1tO3PBS2i7ppwg4+6jQ6aKg10ZOTcOltPXQesf9ZPIxy0quulpBVd4Q0hFxM015LV
         Zk9tBXt44KZuYYXdmFXs+mgymHZeiEw1ag8S2dQOqokU1yrZ3G3zDT4DpTd4hPKBR4B5
         j4XLJpOO7uy6k8kt4XlYGh2uZtq0VpbLO5w4DUxg1S7sqRW9hrGPMZ6GP8HJ3lI3UymV
         SxeFib8Js/c38tdu7IhPsbv7Yqab6mtVL+/y1AFDlCzYIoDPzY75fno9MKeUCZHqr8qb
         W7LjPUVGsP02DUidNkO7a+PeqrWrVxqNhzqhDhWvOdNnI9L+g3cLIutp/XhbmAvyPdnW
         2hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726672; x=1759331472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41p1zpQsk+NbDwSIv78ihFM0CdBgvYG00QN32wnKKd8=;
        b=qvJa7QOwrWl7TlDQGoNMIVLvI+Vx/YiawJ6ZzOJbDnwaxTunHo7SINfROPyuUOWd48
         5trnRZI7iAcRqbSOa+23srnMu1KeWzWN8dRs445nZ63Mu6nOJrk656lV45Bzl3H0Wm/L
         f7DyI0lo+/DS9d2RxmiWw0Lfu5jwlGP5aDA68BUp6TkhKeoliKJl9LYrpwXysTzpLAaY
         +lir994SbTTSzhTrHth9QMA5OCDJvu2PAfoaaDFNsoTkudxiXwSNtiQ7+INR2C119ZNn
         ixHNPxX14OY6peIXW2ZxE/Yu+Pt+WNn19K5obSfqeMpqQm07uZ/4eRSws+cRA9PhpUkW
         drKw==
X-Forwarded-Encrypted: i=1; AJvYcCUhpZ8ilG9+VZNqDX+OkBfUruXnEf4VGxl1/9Jjvu/51eLtfzRR8/EFsb1Knh/ERIS1uJbotEfyS+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyGj7TyzsZEFF88NSmbv7l7UqLyR7b4comDQoOpUICMLzqjFR
	l9ZGy298VHrRmW7/mPgd8a074p73c+WZH1srKHakMW9Vq8jf9gotKvoErPwiElJyur8=
X-Gm-Gg: ASbGncvYAR182EU64tnTuiR1yXDrXDbdBp91k17yCl9weXHLvbhKUG95xPOPwKlu/HW
	yv5LhhqZymOdHCp2MlsjgfHVUYOfNfII42jTKg3l0LdEctXlklG134Pkj9ZvXyKRdvakzbAOL1A
	aMHYcE1aSg1XgcfF04qUi7Sq20FGKHfWrQsZztC/xGjuZZmH0ESNdvRtdOELJbdxFv2cH4xQuEv
	7LfC0qPWUp+JHRIhx0POrER6B7nJql9G4P3+QIpOvArlZkTtjuCe1Vei8l4B+2d0dJbyt9Yk4aA
	TtWHEW0w1uokobmqoFy10sfOz0KRuiU9iERXo4ZVDaIcl9eqXPhmL4KCC1CqXXrRWfQ89mdueUg
	a1WP1VtBHT0PXtvOP6XUC8EuS4wkqRX4Le3dcFl+cKkyYm79SmcMyz20lUrpPyjzsqFC5UybKws
	8=
X-Google-Smtp-Source: AGHT+IETWzoCn+KI4Y062GniSVBIueDGgqmtXBjNxKzPiwlUP/Ee0vR/LVaxIC0wQUEdUpBQ+TYtnA==
X-Received: by 2002:a05:600c:a47:b0:46d:45e:3514 with SMTP id 5b1f17b1804b1-46e329f9b7amr1978275e9.17.1758726672238;
        Wed, 24 Sep 2025 08:11:12 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:02 +0000
Subject: [PATCH v5 3/5] firmware: exynos-acpm: register ACPM clocks pdev
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-3-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=2732;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=e9jnjsKxvNvdU2khw3Ii1tiDbQ0I3fEhveIt8DxtYOQ=;
 b=8K1Nho86vCYKFmFOrazLr4JP7fnaMoeuy8L8qTUu/0OpDGoboRM5EW54QSEvJNgMv/DGNkSgY
 c1wak4b5exrCe3QpKblmZ7ZO55mwUaDA00P58OE0FyNZ2H8STjvekkG
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Register by hand a platform device for the ACPM clocks.
The ACPM clocks are not modeled as a DT child of ACPM because:
1/ they don't have their own resources.
2/ they are not a block that can be reused. The clock identifying
   data is reduced (clock ID, clock name and mailbox channel ID)
   and may differ from a SoC to another.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..0cb269c7046015d4c5fe5731ba0d61d48dcaeee1 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -177,9 +177,11 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_dev_name:	base name for the ACPM clocks device that we're registering.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const char *acpm_clk_dev_name;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
@@ -604,9 +606,15 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->update_reg = acpm_pmic_update_reg;
 }
 
+static void acpm_clk_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
+	struct platform_device *acpm_clk_pdev;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
 	struct acpm_info *acpm;
@@ -647,6 +655,18 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
+	acpm_clk_pdev = platform_device_register_data(dev,
+						match_data->acpm_clk_dev_name,
+						PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(acpm_clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm_clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_add_action_or_reset(dev, acpm_clk_pdev_unregister,
+				       acpm_clk_pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm action.\n");
+
 	return devm_of_platform_populate(dev);
 }
 
@@ -746,6 +766,7 @@ EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_dev_name = "gs101-acpm-clk",
 };
 
 static const struct of_device_id acpm_match[] = {

-- 
2.51.0.536.g15c5d4f767-goog



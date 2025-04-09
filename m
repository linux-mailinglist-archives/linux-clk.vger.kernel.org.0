Return-Path: <linux-clk+bounces-20376-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79DEA83244
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 22:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF5517AB3EE
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAF821A459;
	Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7twnjgU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0F21505C
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231063; cv=none; b=bqlIbGIzTyLHLnulS5uvYCbKEyGILVwUfFncHTmpSoJ4nkez6j4FlsO3koTK2MtC96rP/Rli/pkpX/PCQ9Q/9kC7NwcbPBTzUmLvRTxHSYhQeb8lvu9snptu7WjFOeVTnc2ce7GClhu/4+v+cyec+Bp2zDNkYeUjucl/jEAd7Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231063; c=relaxed/simple;
	bh=ko021o0chPJ/pDx9CtG/i6EPLlich4rSb+hQ8wotehM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6aWZs7xgW+KI5MSpR2HymF8QW4zfqwbTfduuriTDKgxfeCHXZJRyHowlT70/oh9bX/YxGV8SMfPnbIWVEeispHCx/ZfhPsAYhwji0Tyh99qXMOB0gm5uJZoJPwBg3oPa1DGSDZt1p3r39/7SoWAIOCvh32nKKKWRpNnZEktKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7twnjgU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so188251a12.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231056; x=1744835856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzewZfPwk4hJVFLYHiSrmH9jhhrX57HEhFAQDXSOGew=;
        b=A7twnjgU0FQj1w/J+xk+0icOR48aVQtiHwss7vaJfG28nSpmGXYScy6L1vwVmewCED
         vv2w2q0xE+Z7RTdKGgr89NNoIz8/1pX7NvJZ0zrHyjZmX0FfB1cR3KTEKGxOUfubZNGk
         shhOqn8IQSNPHXxmNR+pO6x3i6U8woiQNzLdGF8yvj84QarUrbSE3SjBh09KTIbuibJX
         T1fX7QECToQ7DTxkWnNqxCjPV5PEUmd1uUspLym2OyasjzEmL/VwkWwRzhh/vQnwyDqz
         W3CMQ0UbC9+SggmQlFAOItX1+YjdcqCkYcklTAmr8/FETj2j8hVZnRxqsirSmI7v1xOd
         l2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231056; x=1744835856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzewZfPwk4hJVFLYHiSrmH9jhhrX57HEhFAQDXSOGew=;
        b=Rraf1JZCIKzlKASuvfiWpIJX3d23xu0MhdRE37A471NfX66SQeKRTS+SSXg7HTOLzR
         zj4uts41tsM/5UitXOJ9PCi2nuFI/EFu8IwdxoFkVhrJPeyXxIVf96KcWtgEFIrh0b1V
         k2PALLHvD5f9WqxmKddMsVK1T1gjaTqtdnHTx2eKNgrqmZXBGVABoMhRZ+SAN81AA1FD
         8artygG7QEo4rg1OwApO6wjyuQt0LS2QJpPSxkTpuYJGab7iCG//rSAP7Verw1pVIosH
         +kdFcYC9czYnEqFcEpAf3goFlY1ylcQiM5qmlk0vPmo8XAuU0u3ccNel5QgQGu8FhbQ7
         YKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvXWZiNLoUtPljEFEsnNHgrY9qyHDk9nfamXdtd3muQCUHFHM+O6pvpnho2Bo4bkvickxET7Viy/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHveuTczMkiNTWLCOC8scK+ZrTpJWctbXKq6DOnNG+2ONYkbm7
	tGZooccv/1ISUwrJnyGGrT1SeLSajNfMJALXoLmhHvhDwi5TStoGily1UkK/k1w=
X-Gm-Gg: ASbGnctE0wQbWgqO8xPE8Q7w/9A+EEejt/oi11I7G9hXT5lHAgfeNWnm57JrJbSbCB2
	cAjQ11qW+6p+LUvspBw+kI2GvlZyCFH5H5eSZwdSvTxj/QjEMHk/+tKI+/HMoArUdkrk5G9JDJX
	XQn8MFMoV91T1JF8coOddWNvA6Fu7cQmkJPoHnXnSPNYa4zIE1m9QXJskgX+y7JJg6ihRgnkm3h
	g4+L/gOZxCIxw2e8y5Gb5U7Ckjumeew4KvNTIovd1i4sDR1nPHACrxB8v3/NvuCFDSxKz40K4Nq
	tGkOFFEdTzFA8zVwF/sysYhQZwK1I1mQsb36xB7CC7SIliTG+JZQflK+W++eMlcEMgvQ4IVJruT
	z8sjQe5QKwWPDmmrrNFVz59+F6yE=
X-Google-Smtp-Source: AGHT+IGpsT9IiqTJupkCVJCKwUjfYOLBHOS0zZILWuXu5C8V5rItHRHHHMylNW+J8A+q4dyb1hPgug==
X-Received: by 2002:a17:907:7d9f:b0:aca:a16f:ee8f with SMTP id a640c23a62f3a-acabd12b147mr8466766b.8.1744231056245;
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:34 +0100
Subject: [PATCH v4 13/32] mfd: sec: Use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-13-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 1a6f14dda825adeaeee1a677459c7399c144d553..f4c606c5ee5a809a106b13e947464f35a926b199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -229,9 +229,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 966d116dd781ac6ab63453f641b2a68bba3945a9..a107a9c1e760f90fcb59a9944b74e9a39a0d946c 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -134,7 +134,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
@@ -166,12 +165,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index b75d7fe86253037b4b7256a4d8c089003d58bc44..340f5f14eba3fad3b25935803dd33e91f7ec6629 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -487,18 +487,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.604.gff1f9ca942-goog



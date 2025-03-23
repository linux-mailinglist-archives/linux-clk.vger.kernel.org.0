Return-Path: <linux-clk+bounces-19740-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02301A6D1EB
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 23:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E873A188ED5F
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 22:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4A71F0E2A;
	Sun, 23 Mar 2025 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjTp/XUQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87111EA7F9
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=s1n3m5N6/92SquN16/y7ZathCara7x+w+u/Fvm3fuVmiEWgm1LKiC6R7cjf/zgOq9/Uoa52eagylzmhgU6Zv8OmMmM55THubN3yaMx0jCB7/oB/hhRkZyZq+1tfpQmV4iYvfXjAT02g4pxQMqIDbWrncmHyiuMrm89i8QbFYECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=/OXCrEd9LUPrpcKww+A0Kr+dM/K8OFFL8Z6qLEQS07c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceiDFg4VvDVLx8bw53vftErpW9F9wJx2xw7lb0mL6LWYMOAOwa6vWwUIAyLrjbt7i9q39C40jBhDZtoDVbu5oaASCp0cXJ9IsxprH6Z08Keupl8NgKHkiGdP4xDa7XKzjOK1R4kZO9RM0hoVYFfyZYBbpnroY684gRUvaXTsQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjTp/XUQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac345bd8e13so673823866b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769578; x=1743374378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=FjTp/XUQBGfShXnTuX3CmHx6Ok4Dut8B0ibb0vSOCJNDotKOrZEqOLCTWulKfPQHMZ
         7hBe0vWxxKL+b3W85RBg4Y+aZAtHRK0VhQwukCv4lkIItO3e0FKC8hBNFTenmRTCJtKh
         iBPJ3q/PZv6i03YZku2cZpHUAp4bAY5M6UN2+2Rd/g0fbCWyLlDvXTELsHb5XNLPUNvy
         FrmYUCCX+qHaMXCut1EkE+K9pybz1E7KWJn6DDXDU3CrJkNtx1mob/HsKgZnYPOFTxEh
         jL8sXe1qYedjrbNwNBuWGJS+jXVyoKGwKq1b7bQk/W0FSLClmyE2lxT8bskJ1zyweLrW
         j9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769578; x=1743374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=K+sOxRLaqheqDBgbMcvCbwwAlAa0PNLGxQbf4JggNDULyE1oOQbnTSe+4TvN8G6w6t
         BMvJTukhQMnheHbb9Z/L0l4eHfXC9qANLUsNd/0Mif9s7MVxSxqn5evZvPN5elG08rge
         Xtsmeep+hbwBj9zlmqmkhGWNFDOg+8DFbXag4ISrEK+nve/4/mIw4PA48BAP/5C6wDZj
         QCEx0zYxkyjIMwwTteZ82I7Zd5IxC40PAG0to93sdmewZuSzWlEVhFExlOsQ2cz4I2OB
         27a/4yVHWYltrdFTor6BN2kD6J+ZxVV1TmJlKJmeFZu2YeNYp6H9Jw1ld3eWMAzbxSXe
         U0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoqKVNh4zdwb6N7Nl31RxEgjr9fa4iTfedUjLeg0z7PdTu2yBAsal7pwGgFvKQ/I7J9gzduNCj6T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLk565Z50h2xRcYD6Q67+5+anpSOw0LOJoDhKAYNTatKwpTSKk
	NP7yuw07pfXi8u0kxu94BBzBkt32gD43s/2fXquoYKVWO9DFALmIMBgKWcFbFlY=
X-Gm-Gg: ASbGncuUXHTx4H1yxQjQBJ3UZJlfcpPbrYDkcAmkyPb6tafFsf37xmRyHEf6uPqPVtk
	N0oHDcGDQ8Fa9DLrErrO5kqrrWLHkY7zdZDyaXiEnio3At6OW1w23TZrcsNZLXYpZs55Xn+IaJt
	+xZI1olbRt023NdovwoIJ6Gia4QAEfYudAp6Npvl3F82EbuixZ/LZ2DdkhYB+VaIKZlK+CZ9HcK
	xauWeQrybrrff49+8ePwu2HCU0ja0cnzHXfcgvMqYmwEV2zaNDoCg7oYZ77ZkxbEZIdi6Yu76dO
	oAcAqGPajuQ33HqPaSVYuyq1qCqNR38+Y4gBQRSSreDS0s5AH4bz7S/a+RdSIvgOTNEcdNfXV1j
	Fa7xPud6GYzZ9SB64beBxHVbiW1vF
X-Google-Smtp-Source: AGHT+IGSiAkDAFqSZ3rMyd/nphhDlOTX1hDDy7CmBLGPyAROlgJin8tD1xxjQmFA6VfwByP2ficCYA==
X-Received: by 2002:a17:906:f5a3:b0:ac2:bb97:e56f with SMTP id a640c23a62f3a-ac3f2559a5emr850721866b.53.1742769577873;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:40 +0000
Subject: [PATCH 24/34] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-24-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 5ebc77d7edacbc1b7a3debb9069bb489109d57d7..77298e92642021679ea1eb95d338907fec098aea 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -23,16 +23,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -44,53 +41,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.395.g12beb8f557-goog



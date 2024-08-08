Return-Path: <linux-clk+bounces-10562-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C594BFFF
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2235BB2610D
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA239191490;
	Thu,  8 Aug 2024 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxnuzTGD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF219006A
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=LDMQzXj5nVJ5RhDCUl+VFPVRXC0eaTaASVcQZQZuFuC2lQBqpkMlmY+2qx8wJeYbcv1GCrjfaP0NIdNtO5d8V9fobVLy0PFtFKJg/sF5CU4mabc6iJEwkcIfZTsNi2T7P4GdfnPyC2FDgNfp+RQOV5goiGslsEAXm7XiEqT+3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=3MuovDtIRZorURIU9tYKQJVq47VGHfGnfR9ISQ9xJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MrmQFvX/7Iezwu4FWytBae+IL0fX1HWigoXjusl/p+lAP1xrUkLbOGMByUjmSHuy00H5vcjd9Ch6B+4AmhNH63yO5yfHf2VNHmGJWjswPaNDeCU1u37M7ef9OmuKjN1+76UvOM3dNPrbrIITqsEpht/JPCqhchTIDgvllJ4sonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxnuzTGD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7ab76558a9so158711466b.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128177; x=1723732977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=mxnuzTGDiigYZua/xLBvyxa1x7N4KSbrsGQb7mN1+Kxbbq4CMNB7qtuG4SfmmIHjHJ
         gl4Yqf2EgggyiY7KkXqMQWG4TQ1Zh8sVZzGb+LTZ3qbXH6/twvAgsR0KbItU0fPwH0AG
         janONPeA7hgsnHFx4Kb/8UNqGf7WY7rBL41ovduP5984hkCLt2g9BPgxGi3O/tdwP3RM
         jGPt8X2SSis7B2rYthAEsu6JGG1YzD3bios50STX2W3Pj+Uwa8kMUXrQp7kw+Muaxkz3
         FlTbyXE+6tdi/rS7s9XBrG2wzB9ZiCuVQPUbRwRLD6QsT87TRbE/wq2/XYMEDHxzNdIe
         wvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128177; x=1723732977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=ewN8Nkw2CvXnalY8gsMGenRJXKgnaPY5qgqhXMK/wK7LkAeDZi4dgbJbmSjh1sijEH
         tBovSrIY3rrk7wTxik3VYREyvdHoUn6SUX9ongsTyUavFpM5MaJnivNS9AmBZ7DmjJfW
         rMyATP6T1BTOe28PNWxPkHZ6yyIZpCT5vNIDDqXPgbzVmbBMALcZ/kB1R2kUgu36eODW
         vr4pMLO4i9MG9FmjLWwe3biTz7385OaS7X614xZg5ejdsMGnv7zs7MtIMMkz5gzmFREf
         qxlBsJ5a7XKS9Ld4c7RYZ2a68E2YPCj0qZR1wNdPHMI72a4dy3zhcjAixHGfvxzvYAo4
         Pt7A==
X-Forwarded-Encrypted: i=1; AJvYcCU2d5eQzct6ZS/B6gNdQUerBoQ8GDPa8ZFrbkdSA+dlWR/xui0EHt8dTIiOl36G4Qsp+CkDqZL1HUWDd+oSKiIr+N94/wPptjKF
X-Gm-Message-State: AOJu0YyejJc2h+7bJpdBEsIcXOx5EJa4dKsKDVzuCZ0mzcDD4TTODxIy
	2kVl0dZukmZah5xJOTB7vwivpwUWLxLZUqjYFli/2MjF2HEuHGYfEfoHUT3PVA8=
X-Google-Smtp-Source: AGHT+IE7R8B3T4fgiuoLqDk3xF7+I+3kP37bpToSGsITYor/oRfOoUboQm8qOJh9YQr2roRMF9fkPA==
X-Received: by 2002:a17:907:8692:b0:a7c:d284:4f1d with SMTP id a640c23a62f3a-a8091fd825emr175510066b.28.1723128176714;
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:59 +0100
Subject: [PATCH v6 18/20] clk: imx: imx8ulp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-18-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx8ulp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
index 535b6364ca7e..5531e51a1e80 100644
--- a/drivers/clk/imx/clk-imx8ulp.c
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -385,8 +385,6 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	imx_register_uart_clocks();
-
 	/* register the pcc3 reset controller */
 	return imx8ulp_pcc_reset_init(pdev, base, pcc3_resets, ARRAY_SIZE(pcc3_resets));
 }

-- 
2.46.0.rc2.264.g509ed76dc8-goog



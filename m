Return-Path: <linux-clk+bounces-10550-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF994BFE6
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8861F22020
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853E118FDB3;
	Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzIKePSr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4B18E760
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128176; cv=none; b=iVD2q7n2J6G6Q4200f/Lihgh0oLUwEqoZJAjM7CgAyoZmcm4DOqxbgE6lEXmIg1LZDCovhfYYx+zK97S5DzEovXIRPqwMVGnOOCurTN/iX/V+mta/MfTRrYIPPNHnzAnwyqyi5LLEmA11E8IDi/ogUMLBvBoH21HM9Po8pk7AZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128176; c=relaxed/simple;
	bh=F8XBaUKciL76OFnGIv5KAgXWQ49BMItLdMHThv/YF90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNvagXPvKY7UPS46hrD04rOze6Zr5zBUFZat6Ku3eMlthv2bGf/4ZufoyF4Vk91jONN2tR5b+PF6IdXOevHActlS1A2HAlqNO6cwv0ZvrXMjOZLaOrUUAUMdwieIMJlMQQwx+9lDMzBPvRf0ndAdn7rG2Em5Hfj7faWSbgXuBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uzIKePSr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7ab76558a9so158702066b.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128172; x=1723732972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=uzIKePSryN1SQI3PDMQn6mQBloHaaF1cSg7JNnjAmUdY1G88petIcdrtL7rTMJ8B0k
         /HxXm6evzzOn3GF3lKQw2WX0KphtyaOthoZFWZ4rNEPmd02u0tuQKhc+XVlZmu97CSQl
         6JC3RL94mOljZuKDOiMpfjM47w3Y5hFs1q8wPtuZku/C4SBGnUwji/8MleIX0zp7uUgC
         fIbDe2KCx8nBt6ir3/ZwoTsYdaialRsTXXltDztxGS3TXSUVQn2B1kUv4hBTJdbFMQnZ
         vCea6ULGn3kFusJSquZcV0d2wVRgySrVUxET2uIWLWcacvOV9GoPpJuwjYthb8N17vZl
         PqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128172; x=1723732972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=jRmFhF2VK+o7apnGcnewKigdbUzwRZeD9YwO4WxV7i5CTtmOvywSfkjwqGLnAZmCEF
         VJ6usjM0Jevh1UtIC9o8w8nrfFwTKQEzTj3XNMhlzqIZUjx1eFyYIwgBpkDC526dWXPs
         R3K5oj1jYiW+yeJFjR3Gj+UR56KiIdBwnWJJ2W0MK3+VSjxfJbv4aZpWEyShrHw26BWa
         ZHmyJL8thHx/aF3gQoptmWOfGSldIDJs9yZd2dsQLYimxu1fxl6ZfR3M6UkBBGWSHAd+
         jGVRW2e9vG2F3dVICuT0ybvGbh3pFO+FxGIoc8SKDvrESmZgx7ld36gW8KsZgouFcRgV
         uCKg==
X-Forwarded-Encrypted: i=1; AJvYcCWuiY1nSnjQQ1kGKL7kcxSSr8JuMeORbYPcOL3UcMURui+BOw9FWR0TKnKo2fF9cYeNx5CTa4lWWkMGw4qsHflSX/mGyuOK9BAa
X-Gm-Message-State: AOJu0Yy78cbgyW643i5pa/VKQgrGVFgMJPZ1XQOSnk04ssdzctkvPKbA
	lE5cIaQWTkXeXeM5B4QowgGADMbKA0Icqzp09hnTlWE9kKZhjdcGTgEpox6fOsc=
X-Google-Smtp-Source: AGHT+IGtJSveR8KZxSWZ0BBBvkzHjtJ1Agj61Z/XNfYmQr6Fm/KzaJ6kZoSkBXVQlwYGFGtVuoa17g==
X-Received: by 2002:a17:907:3da4:b0:a7a:81ba:8eb3 with SMTP id a640c23a62f3a-a809201715amr190601366b.27.1723128171973;
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:50 +0100
Subject: [PATCH v6 09/20] clk: imx: imx6sll: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-9-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6sll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 2fa70bf35e45..4310adc5d54f 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -340,8 +340,6 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	imx_register_uart_clocks();
-
 	/* Lower the AHB clock rate before changing the clock source. */
 	clk_set_rate(hws[IMX6SLL_CLK_AHB]->clk, 99000000);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog



Return-Path: <linux-clk+bounces-10526-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE094BF44
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85511C25F3A
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87FB18FC67;
	Thu,  8 Aug 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g878ehHe"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971418EFF9
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126286; cv=none; b=rit57MkA2Gp3BHxXB2ntYp9zXJemSJBHFpDqaRny7hilFCSTxFriKwhtOcP2EJRUPQ0zn4IdHh9wAUdKXDeByZcVWPPSi2lncl16zbDYNYgvIs7EVx2GpUcw8aQPt9Vh/YHhfFt1S+18fYvoxv8WLAiMZ3fd92MV0n8qfqLlS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126286; c=relaxed/simple;
	bh=Aa36Al+8XL+o6jnCRaXGcn3QPeSfqDekEcFkrR4ZXoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4kDhg8oirmSc+VRtjGhP1YfYqNUcNmqxFEgi2TYPqIp1TNf4JMMTYQOxoTBgYCmGB9qmkZqz0z/wdFJskKnUd704mn3XgwqSqaV3RyauxPYJwpv/OjTbpdaBccZ6BpZU+F8UAemJZHSwA4nKxTmZpWn5/tZBieL4MEWyOWbHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g878ehHe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so1276636a12.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126282; x=1723731082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=g878ehHeqPePtuknGc5aguvKTeTjva2DbOcSfXFHvjvAz+9E3/QIHoOklIhp8YIm70
         OCIJ+XIr/sPQbjGnnJW3FslUlm7fu/aEi6BUF33cjJhoAnKxtHhYOJHeapq8vnQI+Ix9
         3NVYyYAnloSaua83gY9lvcGOHU57zCwcJld6wlmZcYtmKXBlHzsQC9wVUPMVo7edfAT3
         ujH5VD99HKzuori4rESja4SnIVnFnOrvYBBFQslxOhZ2kX5RqS3JoG9hg3Zgt1J0Dtph
         1UpofE14cMTg4SsMf9xkDDsNHfrfqFtVQRkATRbYTRw3MwUVYeFCLiB2c3UAYb7cq19o
         sBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126282; x=1723731082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=MxuDES5fZZL3V3/6Dnk+/srq8fxpLaacwtPk4VsCWRefv8U6X2h384/EZYwRnUgwtI
         oI0plHv9pIrHCD7LgXF0VXnMxoi1SG9k8Qo9NQQhQuu2FGwLRwM0zDrI2UW1k0vvSVm7
         X6i2sDCvbYIJ4KSHt5YSQooqTQWwOekSbIJLMkWsT3fvFNwqg813OG7Wjz+EkpNoE+fj
         V+z7HqkCb7tqrmllLTHYULly0tp68Ekk0yrav8BHmHBUltcYLFzeKHRXhx6w+iivH6SK
         9Sgy8rxqdz5gMbVsQbaASyFcWACMJuFBlCg035BdvyMRzwnU4OVPYPmN+7J8BkTQXBrC
         iFZw==
X-Forwarded-Encrypted: i=1; AJvYcCW6DGNiQBv8CE/LhqzDilGCOJ5qHkCoZeQzp/o17IkDMx/Aw8P3RfEy9E7JQDeaBukT8uOyMVyGg/ch43yvGMnmCYEwjFOO00tT
X-Gm-Message-State: AOJu0YyAGd5luH/hX4q7q79Rt5mI5L1yJboyt7aetiwy+5LbYr62XnBt
	kbRlWu/rTa6icyhoLEr6nZJ3rAePEuJt/dn+IwqUKnQt7fo/GJi5WjWIQC7AzSQTNN3JR3WglCC
	9qil5ww==
X-Google-Smtp-Source: AGHT+IEfS7LGmhzwOfvg0WuiGG6clp5qzEGX5Jeh5uDmvlBV96anV1MuY8BGYSssk+Dyt3tkyKIdwQ==
X-Received: by 2002:a05:6402:3484:b0:5a7:464a:ac0 with SMTP id 4fb4d7f45d1cf-5bbb21bdde4mr1617742a12.11.1723126281574;
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:24 +0100
Subject: [PATCH v5 10/20] clk: imx: imx6sx: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-10-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6sx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 69f8f6f9ca49..4e42e30245b3 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -555,7 +555,5 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog



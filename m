Return-Path: <linux-clk+bounces-10558-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1F94BFF8
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E78271F2641F
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491A4190497;
	Thu,  8 Aug 2024 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqoLc1mV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBA190052
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128181; cv=none; b=WNAK7tAnAmS9AOls0H/vjQNiCcRSdZN9OwGi8K8DkhZ7PW+D1b3nbFib0Q+wExZxjglT83G4HWTl8wTrco++IYBBhJ5qXSxvpprHuiASe3BGiLpbgYPQAkil4PBZXhXrYtAwI9VOcxw3WhzbetP3Ec/8AXgtwkzApSR0ns0oIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128181; c=relaxed/simple;
	bh=fgoFdUktN0AC8jt3vFeTIBwCbSQYaBCYL6rp147Iyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFuyXAhUjgAfO4NhFrsKNu7PZLssq9neKrhMQNTMSdyjER8BFEGa1Bv0cGSZLvFsLNHgR+3Zwt3PJ8Y5z6imisHizs6CaNgDQJ4vWd7bZWrUdRkPgs/mU5Tq6ubAdb1DT3HA5uusdiKgqY7T++WCGgx9nDs7wiXaqkBll07f/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqoLc1mV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135dso1405964a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128176; x=1723732976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=pqoLc1mVvKzs73vcO/mdYukyK5R5is+E75F31pkVBJw3l3ByxDeCndPtALui8/pztQ
         r3Li7KB9eeBuzEhJgsyhGoFPONcu4KB6o8suqnRM5hD88hknB0t936B3RG17paNSNVTi
         fm2F1Ed0dUZKVXZGmJOW/x+b0qV0aBB0zRQ2YAzfGn+5l+uVFKAqvlggx7C/KhJRbvjr
         s2tnUTgGjbRv7rVKBVCm//wziuzWj6fJlb2DP37f1aLDdJlck0LDskKM0uu37k4LPwmh
         RwgIoZxPy8e20/7//qa43sonUHYWM/Seq4eGQT/4ciTw1fdPZ4qunjIzFU80PgHPk86U
         k/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128176; x=1723732976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=pdrXKH7bWVPA30vpx9hXA7Yxw2IpC8tpFc/Htr1DL8tkZsZGEASBbsqsnXUFmCDGU/
         qTMFBD6INp6ZC5nKWOPTjWewtojU0Utt7zU6NnL1cj/DNxfQqf20lXqlOf4t9Nli6K+L
         wMKQhrkT94kwvHWm/macwRNOJsEHtxFd74hc0Hx6zisECK9+TbhBTrTtRAz1sFkRzzM6
         Pg3vb/5wub0I/BHzMnOsxBeH2iSaXTyYDqo1J04zrou0fokAdT/8S07fcmG9MJOx8WL1
         GFIYW/CR/KRRO1OuncUOOZwqxHsiWb1r0yd3ckOtd2mx3DHBkUm02gM5en16SbsUyRBO
         CBEg==
X-Forwarded-Encrypted: i=1; AJvYcCXixcMIORU9KyBZT4/taHm37KxkNibjhQ0QS6Y6jtRsQ6d3YMkUcidFrGeBccWHF6AtSpwZet+FVnRfl6lxz57G9hizYurykiHp
X-Gm-Message-State: AOJu0Yyxt/lnQ4pc/QVhsyIZyFU1ffyearbl+cC5LIzqOHA5UXskHofp
	5D20eTE36BLSSNyEwI95MwVO+b4HKLFlCuuj9xfZywtMjw7msWROkUHpzkzHyIU=
X-Google-Smtp-Source: AGHT+IFSPGIEwEerUResLzza1dskdeBStZ+yQq7ZShNAdphCslLhbLSN6wQiNk3FONRiktC7/rGCQA==
X-Received: by 2002:a17:907:a47:b0:a6f:33d6:2d45 with SMTP id a640c23a62f3a-a8090eb48a1mr160008266b.60.1723128175854;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:57 +0100
Subject: [PATCH v6 16/20] clk: imx: imx8mp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-16-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8mp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..1c128c051199 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -721,8 +721,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog



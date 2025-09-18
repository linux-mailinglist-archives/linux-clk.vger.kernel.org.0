Return-Path: <linux-clk+bounces-27761-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A291B56874
	for <lists+linux-clk@lfdr.de>; Sun, 14 Sep 2025 14:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17AC2189DBE3
	for <lists+linux-clk@lfdr.de>; Sun, 14 Sep 2025 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACAC263F40;
	Sun, 14 Sep 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e91JpCZx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA425A2C6
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852485; cv=none; b=rmoL3e9M7Pw9IQZUforkFa1+RsDctAbPM9DCksTKDsyfPiVJeazWgx54bOxUcDO/wmUo/mSpahk0FzSJtpCtLYC+q6QNtNdIgoQv4tpwtgJVF6Tj2dFiI0Ob5P5V2wSs26DBkUnMrjA3CA+Zl0ndlNzmHVL/3CzZumO+2WnSRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852485; c=relaxed/simple;
	bh=HsKgMDMGi4Qm+jADjAIuMkdyiCiLMaJzOoizVUBFK08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OILVT/aZt0MgKdN4kKdPwWrt4h3bEczS9fmpAhRZGsgPHFXUoHfAL0wbhViVDVY2VkVTxw7rHXDOY7vQwutadcufzq3pwsHG1aPsa5WYniYhWf6XpD33luMQG5bPfch2JtCWiDTnsuUT3qK5GDoz/DgRfeZAaDhcQGfREXcStBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e91JpCZx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so19664225e9.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852482; x=1758457282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5Cs1xRcXuj3YkbFgeMeQhW1EJtbYuZKXH70X0qTeJM=;
        b=e91JpCZx1bhy+lGKuB771CBHW4FKq8/8f3aoiQPpj4m0Ly4E8O0BA9a7kDjCLyilkf
         zzgkgIRNKAjHAwQX7oWKWZIjVbZ8Wv3q55/NxikTvzEq4xKJlmJhVHqFaiVUJHxkgBSu
         8i5uh1b4jI4/SJseYwrK2QiwiPj8dSDLfX8ynp1/dxXbHcutkOIjtxQs+kQ0c/kJ4TKS
         8JP7c/2TYv2N5tXTrf53kPaySkyhQTOtIqijLtNQMZC9Qdu5SqrZROqB16wu5QXy+jfz
         6uNcu1GI976czuH9ZGKMmgfxi6zdqWyUPjT5FvTRLzjuSHxC7IxXQQ139RYp9Q1z9Z70
         ujUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852482; x=1758457282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5Cs1xRcXuj3YkbFgeMeQhW1EJtbYuZKXH70X0qTeJM=;
        b=czzD2FnIqkqmCMH/EKU+1BbiWSBWPvVljP6V2y0NUsChGic+6MlN5B4iaeybls1iCp
         bH4Nya7caPomC1i0P/IsKns89jgCDB+u6eecE7hyLpsZ+KUisC37r+15mUisg793A2xD
         AA+AXdaSMUHr7M8CE9zUr1mO0P0A0t5ip+M9RZDTj1XJSZd79oyqrCa1Bloiw+il3JTt
         Yp9LyBFYcJ5IY42z/+ni01l3snXPoGi3JPS/CwmtZbI40BayL/cFDgQwnMY++vkLFRTT
         XP5hWigmzVUyWhFaIGXY3DsD7CI+cuT4UoEAWedNrYrrUdLJaYX/xwonKkUjT0yCCAcU
         WKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUuAFkboMLUxk/eC+DocbmshqzmHq9aR48xSco+G27iWENhKC6ZwtmIILeiomcuUupXld1JywVbVYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDxpofb0X9ffDRjQ4R+7+k213ITrqGbf5GB+y92+SpyQ3uyDh
	fsPjMv5W2Ch8P/8iU3VRoGagqJcK35upR+fwjRFCmKA6yZcCkuOqQFx6
X-Gm-Gg: ASbGncujetHrR0pFskkWkrnX9C1XkwJMT6j8UVj1CK/+gkjHrSF9jFaE0ushJYStqh7
	N4y4T1JQAticup2SrKsJxc5CG1GW9cEKHRgMDiJubi3+c9JE3ozv8tlNtK0+xADQIe1NpqcYpJX
	ZFIWha2auh4lT9ikdfqsEbabcVrwZFSXKcJVkH93F+jesZWK1ePqDcYcKf+0SitTtiVZHiUFZM8
	3hknp7WwvLS/ccMgZ6u79lxH1LD1WHDuUL9jcY0LuwFHI447dOaW0xJXexqrk2e0Yj/c1LQEpmB
	qvlwUU4JB6HXTSn7hM1kH51wO63ywevDy0gH0p1Re/scMTPMOPvIZ/wx+UpJeqnBB5C38zh7vqt
	tH1NXuo+FzaN7o146qZswikcw4tJyNtoJgqUg7JrHOOO62ZahBnOa22usq88lowq+FGdWAKCkUg
	==
X-Google-Smtp-Source: AGHT+IEfqFGxuOfmlhhwGv7U2npP5G8hBTAO+yZ39G5pkt81csfwpQKDYYEI4//RmCbaAvablIiNmQ==
X-Received: by 2002:a05:600c:1d0c:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-45f211c9bfdmr70100835e9.7.1757852481707;
        Sun, 14 Sep 2025 05:21:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Date: Sun, 14 Sep 2025 15:21:13 +0300
Message-ID: <20250914122116.2616801-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is similar to pll_35xx, with the exception of a different
Locktime - 150 instead of 270, as with pll_142xx.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_141xx, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 4 +++-
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e4faf02b6..acb366f14 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -273,7 +273,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx)
+	if (pll->type == pll_142xx || pll->type == pll_141xx)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -287,6 +287,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
 			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
+
 	writel_relaxed(tmp, pll->con_reg);
 
 	/* Wait for PLL lock if the PLL is enabled */
@@ -1372,6 +1373,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+	case pll_141xx:
 	case pll_142xx:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index e9a5f8e0e..989addfdb 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_141xx,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0



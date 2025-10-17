Return-Path: <linux-clk+bounces-29283-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CABEAC98
	for <lists+linux-clk@lfdr.de>; Fri, 17 Oct 2025 18:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E867C589E
	for <lists+linux-clk@lfdr.de>; Fri, 17 Oct 2025 16:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0737328CF5D;
	Fri, 17 Oct 2025 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIMW6a0b"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F72285CA2
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717664; cv=none; b=hDUS/rqwcPopBkSkojjc5X2PneRqFubXzLajMh5ZQTHCAN0gqVPNIQaSE8dn+ymRGUl/LmZHABL8jd3D/bunPN+FdQUhjIxGQjHh7L14jbiWKVzOggT5qLQ/oD7JgMl3MAdbyNEbUf99SpWZjkgkmBIPst7CwRNdGr7SHvufwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717664; c=relaxed/simple;
	bh=XFwwYgwIrE13kgm1GHDPMNiskJfkj4wbU7LgqZMT5+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PN8mQjpfENzGE1DafZ/MtFfW1iYX1uHr/Ry1Szpn/788n95HyiqcYVv6043PLl9dr09SUegDULg+L0YTbbmBi5VhkKNfEZSS1LEvFW6z5+KzxeLqNbA2mqwwyNADVas1vTSPOdxnzMYK92BY7oZeTHoT5XMlj7qF8k6H+FvxiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIMW6a0b; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b40f11a1027so384547666b.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717659; x=1761322459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+ezreZej8AwNtgLmDRvkBFDk/rnw6yuzZ412Fm/rQ0=;
        b=YIMW6a0bqMl/IRqEE1KQVWc8RBdOvAoiGN4+K8z0xBtJjhG7DMwfoabK83Wik0ri00
         nHs7FYHbeiY7qg+9EqtDza7/QnnxQ00GiRQmGFKWGexDzsC+5frqIEqeCnpqeFA32app
         funHh40N/8ABzy900LlTcL4JE1PK8fkmnCh2ZcIF4Dcz761WY6vILShSIzcu86I0hP2B
         C/N/7C0q7Df1iBI5x2FdmB8TNSGe+0TLI319jCulceebz38YCMJ93IOhC4WFvN0R0AHr
         UyUEOa76tVMlsIuOEiJxAEuaxty4rUywenC3ysc/BEzrjdJjc0A6po5nuJ18f51Y6CYs
         p4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717659; x=1761322459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+ezreZej8AwNtgLmDRvkBFDk/rnw6yuzZ412Fm/rQ0=;
        b=JRY7gItdxhXn8Dh6QdwHgoK9DsKmJjPgoTTgjxAdqZ6eX3vvGjr9PgsnLNeUtT3OGE
         TnsNhh1QIVfnZeqNmfYR4u6RgX1S8rDc4CFYDM9nLmxgVo/WASvS2Ayy60QXnh2M0Pea
         im01vdtZQ4JzIJwWYB/rmNSxQkg1Y7TdE1QFHqtaXNN2LfrhXqGR8lfwLSoQ7pimy+lP
         IucscUUpl6QCcvVNMKzwS7hBtx9UenEQJqJSDFUs0pRckwKMzWi+px/Ezq/aWF8xy/7c
         jpyx+DbYDY0r9to/9l5vySnXQXqXqZprzTiQrtvrWwsaXLCPPbzOz5dntXpzYWFCFWd1
         YgeA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9FEjOTbYaepz7JY3GzgAHA7gRP63138ns+l23igxb087xmaPCRAkmofzkrLdo4yC8j9FpZSKWh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyS9c/U25tmDF6sePhsMqyU0XjE285oa31l5AN4wgiSXqlZKg
	hzDq+xu+pgdqcq04iESIyrvgefnWm4xaBFqvIl4C8D/EdQtqhLJ1vCaN
X-Gm-Gg: ASbGncswZRU3/SKAEKu3hUl77v5XQuNAov8/RldHsGothB4JRGZLD5cDD6Wqom0z0ij
	rDwICatZbvEz4HuBmgNbrhw85uStXx1Cc8OPyLHoZ4hpv32+pTXTCAQCAmjVVZi53/DFzG9PY8T
	MbRGmyIMVO+eKOLcx1jJwXnfGDfBF5wfTHD8kUeKMJv9Xh8tAyjwoZUvyPXk7UvuF3O9KdsXnVT
	KZHGzgXVSMFRJkc4FoeVKSuiAFcVVDqGwox9M8dcBrwOJUW+FqC24FQsOuLqE4RxZspWtUFUI3Z
	uZ6tWKL+i5eDk+elz5ZFOlQxmwn0ugRPsx6zghX8Zi3+Lpoa7gcBFeOL2MW3Y3oVim8/8uAIwie
	V3BbugWrqAHiyOJst/hZV6frVcPj/upXmz9tVasKi5tmYuPG7GMv0EWAYI903v+LNnqoAWSLPsR
	TxQyc2rfaQ+Ad/oUjV/0dDt4nJquw8xjfU2quF9lSG
X-Google-Smtp-Source: AGHT+IGaVeu0oUJ1C7UDFeHqtgsEFDLC0C+6KDtBnxoCgNM6QWJpaLsxbbHRVuTXDwHGVCCCSflQPg==
X-Received: by 2002:a17:906:c144:b0:b04:48b5:6e8a with SMTP id a640c23a62f3a-b6472d5d715mr467188466b.7.1760717659090;
        Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:18 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] clk: samsung: clk-pll: Add support for pll_1419x
Date: Fri, 17 Oct 2025 19:13:31 +0300
Message-ID: <20251017161334.1295955-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 The PLL is similar to pll_35xx, with the following differences:
- different locktime - 150 instead of 270, as with pll_142xx
- different rate calculation

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1419x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
Changes from v2:
- rebase on next
- add r-b tag from Peng Fan
---
 drivers/clk/samsung/clk-pll.c |  7 ++++++-
 drivers/clk/samsung/clk-pll.h | 10 ++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4700eadad..3c7333529 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -234,7 +234,11 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 	sdiv = (pll_con >> PLL35XX_SDIV_SHIFT) & PLL35XX_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_1419x)
+		fvco *= (2 * mdiv);
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1498,6 +1502,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_1419x:
 	case pll_141xx:
 	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 3c7575cde..04b3fe97f 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -52,6 +52,7 @@ enum samsung_pll_type {
 	pll_1017x,
 	pll_1031x,
 	pll_141xx,
+	pll_1419x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -68,6 +69,15 @@ enum samsung_pll_type {
 		.sdiv	=	(_s),				\
 	}
 
+#define PLL_1419X_RATE(_fin, _rate, _m, _p, _s)			\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				2 * _m, _p, _s, 0, 16),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
 #define PLL_36XX_RATE(_fin, _rate, _m, _p, _s, _k)		\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
-- 
2.43.0



Return-Path: <linux-clk+bounces-19006-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7597A50E11
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 22:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD603A5809
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 21:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CDA25E815;
	Wed,  5 Mar 2025 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDNLa1CY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C325E45C
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211058; cv=none; b=oNIo28wq06TimWLGWEILC9vY5s019IqwlRbzTg5/K7aIqIGt3iqElnbtOJoSvo/zhTHt/0rJdG07uE2jB1Z0qKITC/C7Hx/8cyKcBfDd13abRdTmzDki3MzOD5MuLFgS1C5rv0yDgsrFLFmsRl4PYV5vOloq2H+j7c2Q5sx/YX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211058; c=relaxed/simple;
	bh=mXOe6fwHovvLXqqthe9+GQXLrhENIXsJm1doaVUDONk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3jPxjYT69UqsPNkDo5B67MrhxtzydN94r2IUtdwzAZcg/x81kmVDhv8YxnI8mAamzEn659HorEMmmVg0EfS83zVYjfJZu9vWllwre2L/wZzLK7zlFlsYEMwPpbl5r9dJOyuXq9gLe/3VooLTZyf5x1And3sulxgMKL88PShV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDNLa1CY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bc526c7c8so4314575e9.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211052; x=1741815852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=QDNLa1CYSJG0ftaaWxwOO8iOnNlMzGNDrNM8oZ8NmYDoo7NtA4z1hqdMYu5WoNQw/t
         9JhV7BDL2WaNYD4R4tsUZBA7vK2uKxixfHUBXyJrXqWhYI4N0ZgktK/fUNvqeHk2h0j0
         8jin6A3WHAaTjqXDrz4WuiJjvbv3vDakRdZaBqxEJ2nUDXl6RrivyORTyYqDDJSVvj6s
         JY4NkO1m076d2VqK3ka7Mp75L/wY25tj+bFkmHoLzuIvJvVsdMhLDgkrSq7nUQHKAy2O
         WBatEfdk/nGRKzlVHNaA3pMkjhyALG7pJMjRhB9GOY3ylS+/rY/OXtxPnelp061WHkkn
         FriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211052; x=1741815852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=uoTZ5d02LhFdVGYThS9BxbjkkIuOw7ABwkLHC9eR+cuL06NmmgBSBwnCedierqSwTc
         YpNe+NsVrz8qxme9inIbbxhbu00o0JZhNpJ2Q+RnY9e1PLGS2+UHKwLebvos0G0X1B7P
         BhcMmALqZQ6jPMblWARYQuUMx15zbmFCWJJXkerfEjSomkYnb0xiHerjfglLIk/E/k8q
         uMqIfpS0fPbHJzJ1d3V0shgBrzn3Loum2BU4ku6i6J4XatZ/4WOEgF8VAjSo6lNuNNxK
         RhbxSZNZS4Xuqz4D73N907d3XzaQ29mLPe6bs25S008nol+8oIVp6OejFHM/8QIYKUYJ
         Ur7A==
X-Forwarded-Encrypted: i=1; AJvYcCX5qE1WMmwD5CaDSW2A43m3NWpozrHWzSMDQRBFufm/bwsPsTU8BsTH7/xDRX/fozxDi+1qCc9EgSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvreUCeF3H6Vhm2XuBcyQmy/OYx5YYj9Tvf9fgq0ZX8TM6TvK
	uGtii/azwNkWetayxuKkBdjpx5y7hhNMW+7TByl+SsWH6H893sTvyB5zfCJ7G6ASSF9svwPsWwJ
	p31E=
X-Gm-Gg: ASbGncuY8tA5FqqfN6wneJOgfgDAGWEHMjq3AxY7Plm4FRSA4UYswDeyl2sW4Dr7Cu+
	pj51NWUVg+S+cOx8PCN7xNm4u4WzQJ7GYjUckVfG6+scf/LbWpgjcf78Ka+G7dNcvpLcLMtFsbu
	Ar92p76a+7+3wZn1n/0dctq9E1fL6ytTX73qwbES4VY8FPRIX8k8kqGcbFbQ3Jjj2/94ftRgnUR
	zx6buQdjFuA7Ykt9xzyIsz0pLUq8J5kdcRUQiTqp9TzLSm5W2yf2PDtU6oP9JpyXCqO1NGJ8rd9
	HiZg4PBZrhzWVLgFelvRBW/C9cI+pqYMqaC14OQmxFC4/Cy7Wg9fHBB7NFbW
X-Google-Smtp-Source: AGHT+IGU5f4CFfN52Eji+qJBgn9yLo2zeYNv+sZvVOANxwUJnTo17xDP6bdyENJM47mSh3r+31a2Bg==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr1483785f8f.8.1741211052257;
        Wed, 05 Mar 2025 13:44:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:38 +0100
Subject: [PATCH RFC/RFT 03/12] clk: samsung: exynos5433: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-3-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mXOe6fwHovvLXqqthe9+GQXLrhENIXsJm1doaVUDONk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWYud3+m8P2UJvxkM+EHo/GfYaZm7KB6mDdI
 9TVoiHY0OiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmAAKCRDBN2bmhouD
 13+nEACPnS35jbBP3i9U7AQvyLAnMz3XKRsQifaM7t8yYT6AfyoMEXcp3pG5SLgA3pVqv5ha1lv
 52C5BQr5kJ6P+NK9X0dkjtP92H2u6fubKR2rg4Dtk6RupP1xgdAAXdd+3jyjGRSFD+i2da9QjAj
 +JxhgxtCX5WjGFM51N5aJ3ryOAAq9f0m7Y67sD+co88ThBlWXrI/6wvaRIQjEvdQ5Vjsp37FrsL
 VNW+Gz4IC21imJje2I1Q48V4M662YCurNx/VWRN+ESe/k9MHsqChh+8K4Av79mQHcgmjePUSY1j
 72r+YZiq9GiMZeZT4ed2j9HdTDA5DvHfFdXu7ekCZLrQPzWd3+yI+5Tb2L0wW+VOlIWU1BMGqyc
 PpqlZBgckDKYZnyH7Kx4HqZFkCZNbW08ekfhT6LGncLMBtadr4GdO7hpI3xy2V4IQ9mZhPxUyHE
 xj8x/9xy8bmBGu0aF7ZUxm4ufQUsB/AMRM0PQ0fnMDVfOnyvURmH9bGkcz7qp6z3klJvx/J7I5j
 YjMpjDQZGoJjcDqu6G+J3NYY6iNrYgQJq8W+W5oQTIEyuzuIs4B+l9O3xH14ysWXH+v+TqoRhWp
 Uv1n9ppucj8g5zRIepffyZg3m8837UyxgsFw+qWvdQEUyLBKnCjPnXMVSo8SwNPQvwoJPQWbjVw
 zZz63fp1bPZnPGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos5433.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 609d31a7aa5247e6318884609d1e651001616b73..d18b4f7b96b66e48fb94b86b663443ec691e968d 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5555,18 +5555,17 @@ static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos5433_cmu_driver __refdata = {
+static struct platform_driver exynos5433_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos5433-cmu",
 		.of_match_table = exynos5433_cmu_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &exynos5433_cmu_pm_ops,
 	},
-	.probe = exynos5433_cmu_probe,
 };
 
 static int __init exynos5433_cmu_init(void)
 {
-	return platform_driver_register(&exynos5433_cmu_driver);
+	return platform_driver_probe(&exynos5433_cmu_driver, exynos5433_cmu_probe);
 }
-core_initcall(exynos5433_cmu_init);
+subsys_initcall(exynos5433_cmu_init);

-- 
2.43.0



Return-Path: <linux-clk+bounces-19009-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDAA50E03
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 22:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F98E1884E1B
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 21:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A604260A5B;
	Wed,  5 Mar 2025 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dk5wTdtG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D255F25C716
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211065; cv=none; b=J++Dc8eMSuQRtSsFDihMRR55EhJTpLsHnj+OlAwNprdIsy5XbY5pUvsC1JMhk/jZRAdKCyh/Uc6ke3z+YzNB0j2L/VX1JU92xQNq5wBnde+CVpAk1GKoV0iryiLFNUlrSnsSwifJ8BsTqOOsLJhr4ba2qXBCRaYoDgmou3c9sTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211065; c=relaxed/simple;
	bh=6SbNRrg9WxI7TrGJUYa4ZN7DHWIj2qawRcBQlYXU+sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnkZM1BkekBGHRxi5Y1GeKi9vEWiz/NSLDUA3OUbvM8Nd6UUR9R6toD/gUABa9UYhQuKoyb+dJXuoci5KmPvz5MtQDt4OcKVyCfQ48QAYvw0w5f9eKRP/K6vnpiHAoW+2N/h4rd6Tzz9S/4bnThE0GFICygLSFd4yTyN8imcF/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dk5wTdtG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so972085e9.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211059; x=1741815859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AbHtC7bGFAAArB+3IgMlUK2lz2UUrTpFHXyawqx9Yg=;
        b=Dk5wTdtGPD2HzbtYBpHOju0Gg+tarq7nhHICHDhNYByfGwYKyQQV2sW7jBKXgwDK7Q
         gBlFgVEKh9PqjjqJ1+/ZUSzNOaUmJsOtugTjnw/PCCQYKXfHbSx6oRFdPOlu/gm1lTW+
         owUa3jQmIotkk6ZPlKN/HHEobENkjH0nPTI7XyJQcRbmz2KteOVVca3GfXDkQ5HjtrDd
         vSFiOgIk9/ktq6iw5/JArr+9O+wFVN/X+5Z2kEe9JGOC0iDPQh1VBHWkUZo9gIHIPJcO
         Ojzn5KPlR0fiY+2ZTzlWMNw3JVl/flsUARQ8MTnppRa5Qu2XI0ke0Zx091QxFKQykUwg
         ktig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211059; x=1741815859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AbHtC7bGFAAArB+3IgMlUK2lz2UUrTpFHXyawqx9Yg=;
        b=OaM/EK3gaAWTmtuVHq1aUypEc6n8bvsRWyQCNjRXw7RL2ZhZSKYCqJ6Nfuyq3Cx7L1
         h3fnXGEP9aGgIUIGkz59++SFCMbftcnwAOkqgqCSv6bOkiAjXN/hG2uctXZHKfsrwoUG
         5eEcntLLee07/annqmaMCkeTYjuNT50tNlbi6pbbA0CCcw72GARncK1BYYA1iU/RAe6S
         yWAqFCCtQmLmTawxRj4BG6em78C32osVDBH9h/AbfFi0SLQyRSHslwMvjXwuW7tvf2jG
         45uEIxaM3Iy8bKXW/Xd8F2muuEcm+u1jypXHxSxZTlphhC4jlZn4i5CHf+ZJZbIiUrJm
         u9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXFPFKgzrYXh4phT2OfZoFLJNWb0EJ0Hbg0QSo7nBTrHVP6QjL1apPhbbFan9ouYwNz5T4s+JVkpOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmnjY71kSgq9+s0YbnfkMzBB7bJRYU0OKTKOS/3xWwjoNqWlk
	2nPQZLuoZpoJQrTc4Ch46w3JE/lfEpNe1hDIkHHqDwLJqzej0VFWYzKA1pa24zzR06zcatM33+d
	VInE=
X-Gm-Gg: ASbGnct3fpvQnozDDJAxD9hSGsfDAGlpi+owT+3lIk0Uud5UbBx18skLIxPnd608z6m
	G2fC7kWHHCF3gXFZwlDmdG0G+fW6XbRM0MgCpw0Deldp9RRrwbaPKP9vMjoqiVZhzZzI+bdHL5a
	6GbogDhwpt6QvXNE3pgtAwAcCozV/d0rXE3ZNjybHRpgMMVjLtlxHlC8e18CgwQq07sNoXndyhW
	WHAFou2O8nrGdSynzUE8kDZJ1q2P47596k4NRPAv09B1v5YijUTfgR8cU37Wghgi5fGK6pqPEGd
	ciXtkUwaWHUR3Cv8rJv0xYUZGmMOMFwSdfGktptcgK/TWuSs/mJe9Vo9mHq8
X-Google-Smtp-Source: AGHT+IESqlA+NmHyup0UZmZ7wt1v7EySUvsP5qdj9PWu4jeZ36TmYHRDyU7n3XRFf4qUwKatNhGpKQ==
X-Received: by 2002:a05:600c:4e8d:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-43bd28a6f48mr13740805e9.0.1741211059570;
        Wed, 05 Mar 2025 13:44:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:41 +0100
Subject: [PATCH RFC/RFT 06/12] clk: samsung: exynos850: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-6-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6SbNRrg9WxI7TrGJUYa4ZN7DHWIj2qawRcBQlYXU+sw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWbNxVeej/GBuhHTzdhrQ513MoQ1zvD/Htni
 ohisbn9jR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmwAKCRDBN2bmhouD
 11b0D/9ub4Z8KIBdWqGs6DDGExA47ysD9YtbCBSmkGQorDhG8JIRIUI9M9rWphbWb4voAO23hCJ
 Quqnc2chadb94Yt+Zk1jdPtcbK227ki0j45Ax4jZBWgjy7H8VQJLtdK9ay3ZmU2HGrnD5y9ZpBW
 ol3i4enAc53Y2lZc/XXWO5wwA2ebk7QzkvmFTcUUrYMQDRcTHgwjh7H/ViJ2sCOtFWDsT3dfDbr
 zJMvth+3RBax6C3QQ759OCjqNPRoDaZXdTn+6n01sV0+wCdihRi625LeHOPRJcxl/Xfo135SLm8
 Sa7mCB8JSCE6qySlcwz67BxfvhU+vkX6XSoWg9AeRi4T7/ZPRZR0KcR96azXO+er8P0ivgMQDec
 NVUY916jlcNjP76/VL9SNjgMuh6cxIw6Xtsh0ZqRyFoK2AuPpSzb4kX3YQbFEtFjnrRnjtAs+O8
 56kh/sAiLhuRIHdorDKAbZwX/awnWoxXcY8EUQ2obcjBPbI+JG1ARuajoH1XokNKZ/vV6MPkIYE
 FgtCuFoFQmZhexaGBBkWOHEF+D4Xs3G8jn5yL4Rfq42MY2e35LyjFogzZh5CLGWbL20Y6BvfSxE
 p4sy8IAI1t8knICnOZqB/RhfePrG8+XOW0+LPth3C0SXMk4BleNAx5cMKF8GC9u7fw4v434JymW
 FLcyaG6UvTXiLeg==
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
 drivers/clk/samsung/clk-exynos850.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index e00e213b1201c82ac0c70cfe23d5ccc9c04f2aa3..37c06cbbe78f87e18877d33425fcd03b97a61e7f 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -2322,17 +2322,16 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos850_cmu_driver __refdata = {
+static struct platform_driver exynos850_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos850-cmu",
 		.of_match_table = exynos850_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos850_cmu_probe,
 };
 
 static int __init exynos850_cmu_init(void)
 {
-	return platform_driver_register(&exynos850_cmu_driver);
+	return platform_driver_probe(&exynos850_cmu_driver, exynos850_cmu_probe);
 }
-core_initcall(exynos850_cmu_init);
+subsys_initcall(exynos850_cmu_init);

-- 
2.43.0



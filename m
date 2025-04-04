Return-Path: <linux-clk+bounces-20150-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7DA7BC0F
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4A53BC20A
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E351EBA1C;
	Fri,  4 Apr 2025 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASlxhWIm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A51E9B04
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767825; cv=none; b=shaGXS3Ie8ntEia9VToTUNoQG047YsJLEqY6bdyM2k4ApOw9Ge+XZXw9itKgqrwqbBl9r4qgO3IirXSu5ZvxkteY9FEYNSeFid1RG1MxE9v46J2gxjP8aPbwVsy1XsB9pxsmuu9fkz3nRSLSL2rnB2B6doBQOe3rachJHsBbxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767825; c=relaxed/simple;
	bh=ZIlp12gUJ3TOZlm4LUJ6yds6K8SvLpJOolQ3dHPZQgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAws3QmfRMzt6XVTBc9VKKob37YJ5O98ERTlNjEEnGjHlL/3x5KUW1UkTaZFsa9KuWhOm1XOIqcwKFJcKobWRz71r/QqVjTtfW5gDMIHGMtIf/B2y90FOHwYfCMsHNQzw5FW/XhXjc4f2iAE7uoq94YJDOqF+ACTxbbP/gz+Skg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASlxhWIm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1410985e9.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767822; x=1744372622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=ASlxhWImZK2hH7Y1juiH0Lq542fUdKquujjxAk8LIIq2edILSa6FE8sC2xWgYETQvU
         Ra5nKksOD7WqDGRrJ1c0gsYZ5zmtwgxeDr50uwlZ+u9Z2Edm+Z6lvdq1gWBPiw5igpk8
         xxyqRhArTFU0tyRBw40P8JtClkOB5jusEKyWUuBwHedIoKDteWBrwX3h2EGJ/ruIsYfd
         Jj93Gs0Xo4n3R3/yiSA3cHtRvRnhhtnIIF1htCf9oKa7+XFJfpCL659fbA01eZWvGIjj
         20GnMMj+/o8GyKyJPyTV2qThokT4uGxJnQ/LpG7+w2tOU5NJAFKbcW+nWctUylfY9FCm
         4pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767822; x=1744372622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=mYkk7/aadfhY4xgp0CvBrwLWWmmkl+yirfdpM6LwAxRDS7goij5RkGnxdKtNW8FFX4
         yF550b0srW37qXmUklrL7XJsxXxvqeTJR0GZZp2TNHR7zFGlOOan5UW+2eAIAjXzHZtZ
         PdUAPblnxniTCFqtFYZg/Og7vEeXBT6IBIO1dZ8YirxmCtKb80DQizUYEvcd+SJSuANO
         vF+eSEz406mNorl8OHIiD6mHc3bDMOvYgMbsorhVr4GaQdyjZLHlLZZ9P0Vq3we7XWZl
         keAlaNLxDgS73BuU9PCAqH9zMS5kq2jlyFKh6ZMz64nqNDD7ZkXgG4bKyt7WInMprInU
         HRQA==
X-Forwarded-Encrypted: i=1; AJvYcCU/4SK+9lmY4TuJFFgv8LC98tE+dzEzlW2rvcPoMoNrNbBBWcSa8QUCQWh8FiYBNZZEBf+pFEmX1X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8rrpk2Izbmk4AP8fvdEMb3K4b/jaDZOKoK1P7mN5fkB3HuED
	UIhsH1cVsBTfSU11PcEihQT6RQA0I5f44cvZGv9KKzdM5EXc9LKPGZJPcwPfHTQ=
X-Gm-Gg: ASbGnctXBFWWZINPPThtbSEmolY6SIrEf8C+0c4JNdIW1U7T+5xc8SbAP7Nn6rxfnG6
	ZhC+Nfcdwanht+SoYge/c+zezAjrQEtbqPxar2BrCMkI42ARop8i0DZ9xppckkzHLrIQAQhFBRX
	+k5Ovy9dwr99gx+PrdPyT70tfVmOxKLkV2JTFqMBXxqkCur43oU2jW0fxViJJUc8yD+8YjryqXd
	kHppgKUtrLJAYVMOrlkYWrm3gORq/qUvry5w8D1KDb5diz8sMINdVr6NXawrAKVlDelaZJY50QU
	QMHmJpD1xHLnjBPP+ZphOcNcOpvRMIjqhnsba/HPgyIUCbE/ibSYWiG9wDSm/slqT3O3UZwpqQ=
	=
X-Google-Smtp-Source: AGHT+IFxuBP0nmnZWUjwXivSZyFM5R5EOm7OqMfFckNVWAgHA5LCnGmvvIDCOlE0EShLntnYXKvpnQ==
X-Received: by 2002:a05:600c:348b:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43ecf9c2b5emr11378355e9.4.1743767821387;
        Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:57 +0200
Subject: [PATCH 1/5] clk: meson: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/meson/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..ff003dc5ab20d904c91fc34c701ba499a11d0b63 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -55,7 +55,7 @@ config COMMON_CLK_MESON_CPU_DYNDIV
 config COMMON_CLK_MESON8B
 	bool "Meson8 SoC Clock controller support"
 	depends on ARM
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
@@ -70,7 +70,7 @@ config COMMON_CLK_MESON8B
 config COMMON_CLK_GXBB
 	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
@@ -86,7 +86,7 @@ config COMMON_CLK_GXBB
 config COMMON_CLK_AXG
 	tristate "AXG SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -136,7 +136,7 @@ config COMMON_CLK_A1_PERIPHERALS
 config COMMON_CLK_C3_PLL
 	tristate "Amlogic C3 PLL clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -149,7 +149,7 @@ config COMMON_CLK_C3_PLL
 config COMMON_CLK_C3_PERIPHERALS
 	tristate "Amlogic C3 peripherals clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -163,7 +163,7 @@ config COMMON_CLK_C3_PERIPHERALS
 config COMMON_CLK_G12A
 	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -181,7 +181,7 @@ config COMMON_CLK_G12A
 config COMMON_CLK_S4_PLL
 	tristate "S4 SoC PLL clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
@@ -194,7 +194,7 @@ config COMMON_CLK_S4_PLL
 config COMMON_CLK_S4_PERIPHERALS
 	tristate "S4 SoC peripherals clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV

-- 
2.45.2



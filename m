Return-Path: <linux-clk+bounces-1964-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E193881F84B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Dec 2023 13:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820AB1F2426F
	for <lists+linux-clk@lfdr.de>; Thu, 28 Dec 2023 12:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9026B8472;
	Thu, 28 Dec 2023 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgBq2nX2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BA79CB
	for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d5b159497so21438985e9.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768292; x=1704373092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LzbWE9szdRtnTR5PECxBTSqD8svHOqTLDWpgcXftXE=;
        b=BgBq2nX2itV8MpKeHpPQ1JDKDaEZ+S1grWWmKNTc2jSlcU+eopUT+Rr1rcDxjXJ7gX
         F5FCNwdG5IZDAAWgV9q3VJshMydNXBlWyaB8TuybeT51VDHZP9Q3rHs1dI/Z2pqdZQOE
         fga8cWWtKUl9oUCtWAjKEVaqJoA4As5cFEgLHB9Vx6b6pNmOwIDhjGtKzAHpR26yXqYQ
         Ln4Z2x0tOpFzTgoenm8ZFlJxxKWaGJKL0aNpldGMZ2RBcqQA2WetZftWNSORf+4NJEfh
         uTIGUMmuQJZWiR/uBx24fO18xotJ9vwvb3rDxCSRpvZEG/TbtNrRhOvCjjyuGN+Y/PBY
         SOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768292; x=1704373092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LzbWE9szdRtnTR5PECxBTSqD8svHOqTLDWpgcXftXE=;
        b=r2kkc81+D0PquObW3npHR0SjrCCARdyXjkXOZNfXXrex9JHnffbrOZpXw6yinvNCux
         TwQN/M0ToZFQyZm/kqkxG0wcUhjdHx4lnYVCmpRQk3KSu2nkjyAsoJllsqhCt8yP4yUf
         ppT+4dYN+aaOfSyE7/l1v3lrR6AC1GxWqeO3E+2IuGPg5yD2LFYDXENZgYvz+Cl7DdMh
         RnF337xwGK/Hh93vt8Q3cRB7hkwwVRv3BGf7vYIDb84+fQmJExfZTyZP0GRLI0wDxjg3
         p2DbvcfV0+xKT+bAE7ki6faWcX1nbkFylfn7YSbHDu4OCq2MlDSnEzcyS07BkG+evDv4
         R/Cg==
X-Gm-Message-State: AOJu0YxY8OSM3aP9gk4z2asOYZoXlG/Lq0xWe5LUu9NNrrOIuiZP+B2o
	g8j79Wy8/mIsshBSpxeM0cEu8B5HuCJ/QA==
X-Google-Smtp-Source: AGHT+IE7E9kPf6I6zhnXOaF+uBAHwWTIoJTK7yrN1FHwVGdUVH+mfR5uoQTW8/LH67NmXpPT96hsmA==
X-Received: by 2002:a7b:c3c8:0:b0:40d:39d0:9916 with SMTP id t8-20020a7bc3c8000000b0040d39d09916mr3985455wmj.246.1703768292208;
        Thu, 28 Dec 2023 04:58:12 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:11 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/12] dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
Date: Thu, 28 Dec 2023 12:57:55 +0000
Message-ID: <20231228125805.661725-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231228125805.661725-1-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add google,gs101-hsi2c dedicated compatible for representing
I2C of Google GS101 SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2: collect tags

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index df9c57bca2a8..cc8bba5537b9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -33,6 +33,7 @@ properties:
           - const: samsung,exynos7-hsi2c
       - items:
           - enum:
+              - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
-- 
2.43.0.472.g3155946c3a-goog



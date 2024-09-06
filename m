Return-Path: <linux-clk+bounces-11826-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D834896F61E
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 16:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0111D1C209EC
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 14:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF831CDFA4;
	Fri,  6 Sep 2024 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSpZXmDc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD713AA38
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631281; cv=none; b=JVamTgvvjSI6MF0HtsMmK8Ei4IaZY6Xse3IyT+btRLsx92x9eFRjO1x4TuyJ4ZnJzaxuRJQUityAG8UDaYQeRAIrxCnqCY3hA6Tb7Hs84I7zomY9HkbtoXkI9++TZyfAQXN7Ic81OX5kFo0e0zXxDw1mq6tQr0lrsQANP/lvT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631281; c=relaxed/simple;
	bh=0TZGFFblseD1XzUlKvxPGUFM77Kk+EJiwlfN3a5N3lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qB1axZcktklu+6OIaEB9i8ZyHf2Bmkm0kdZUSEL9chZlfhFD9BefjAUT29CREDxJayfAydLFTYzxhZp2uj2A3YxXlQWFi0iIUl9eJoCo28OaAv1YUKG2PpQ+M2jHyN+z/zivAXoowSxfeYaaRZHGH726TRJ/fdjdh3ksFgAXZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSpZXmDc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5361bae70b9so347560e87.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2024 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725631278; x=1726236078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AcUWsTK40ufzjzSKkiyJYxbNIJ0fv8WDhSYTnJO0Ltc=;
        b=CSpZXmDcbzaZ2t6PDtoQdFf48+1jVMzMJ/KwdE/bqQTqthokSV4t0M5ZMgkB15socK
         lcl+X0rbJldz/fmhXFpvtACNIKI9KDVSzGkoLpuSv8+y/Ej0OiWYsJVBRnIMahfbX3hY
         Wa6vUG9RwYu5boC8BIdqsiKYSzjaXT/cEYqwxWL2D20ZvrE1MKIJcbZJnsk2Tr16mlPG
         tBlLv1UmfBTGRCreRSnyCevDzscL4EGJ6TYI2ej/IxMuzzx/VV8M9x0lIfB6CzONgb9p
         iBJZUdNTp5gEvFUQpXS6gYJVfBdygtjyIsG1P3EOofVOmIzy/YUE/9kJltfjTwKQQsEo
         3Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631278; x=1726236078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcUWsTK40ufzjzSKkiyJYxbNIJ0fv8WDhSYTnJO0Ltc=;
        b=U9xKg4msxzcwFMxleKAjmg8mZ8qdjq2uP+fizoTFTyIDHcsa95EfdC2uZd2y4nMTBk
         1JwnHnxor6OUxWJWseOfDQRWEEk+zmKU+XNvpfCpOzfY54xdlfJYYPmT7j/5UwlpAuaW
         Clo6H9uoaUNGyNR7ADReJF5WY8zUeCs++KJ0AX+1dFvXiVhMInTx+zWb/jGQlWkzL+cn
         X4736qx3aO/kcbpA/61o31eMk5YeVwjpkYLnl2WygFkWNf8DY9WMQDZEqYz25fWoluM3
         OKfB/+UF81p4CQVYAmRMOeVE1RnDHsbcp9GCQmBbwJHZI9aScWNrvbTffTXWTyAHorda
         j/2A==
X-Forwarded-Encrypted: i=1; AJvYcCWmEOuegGVv8yT5IfHOdKv3YVENmesWoGYtKrWHNOIo80x93y+NOxkjMUKVeNneDII+QfjRgPFQ3js=@vger.kernel.org
X-Gm-Message-State: AOJu0YwThz2fkp016278+aH9fpLZzTqyVPPFNsmSFreF3cPTJ8BrZX9t
	BYjGv70k7yzUIJb1wE2L0cJq4y1bNVdqw8cgXyPSq1yhpkGARakEOp7nHoMlT5c=
X-Google-Smtp-Source: AGHT+IGlmv2AbsdgjpYnNyWtkoQ9kk+XTDqlQ7jIgkBs4spQQBM+yrJuJHUBTyoACaiSEwgScqbw0g==
X-Received: by 2002:a05:6512:2356:b0:535:681d:34b6 with SMTP id 2adb3069b0e04-5365882c1f9mr813526e87.10.1725631276738;
        Fri, 06 Sep 2024 07:01:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6236d194sm277544866b.113.2024.09.06.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.12
Date: Fri,  6 Sep 2024 16:01:10 +0200
Message-ID: <20240906140111.70922-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.12

for you to fetch changes up to 485e13fe2fb649e60eb49d8bec4404da215c1f5b:

  clk: samsung: add top clock support for ExynosAuto v920 SoC (2024-08-23 09:21:35 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.12

1. Exynos850: Add clock for Thermal Management Unit.
2. Exynos7885: Fix duplicated ID in the header, add missing TOP PLLs and
   add clocks for USB block in the FSYS clock controller.
3. ExynosAutov9: Add DPUM clock controller
4. ExynosAutov920: Add new (first) clock controllers: TOP and PERIC0
   (and a bit more complete bindings).

----------------------------------------------------------------
David Virag (7):
      dt-bindings: clock: exynos7885: Fix duplicated binding
      dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
      dt-bindings: clock: exynos7885: Add indices for USB clocks
      clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
      clk: samsung: exynos7885: Add missing MUX clocks from PLLs in CMU_TOP
      clk: samsung: clk-pll: Add support for pll_1418x
      clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.12/clk-dt-bindings' into next/clk
      Merge branch 'for-v6.12/clk-dt-bindings' into next/clk
      Merge branch 'for-v6.12/clk-dt-bindings' into next/clk

Kwanghoon Son (2):
      dt-bindings: clock: exynosautov9: add dpum clock
      clk: samsung: exynosautov9: add dpum clock support

Sam Protsenko (2):
      dt-bindings: clock: exynos850: Add TMU clock
      clk: samsung: exynos850: Add TMU clock

Sunyeal Hong (3):
      dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_531x
      clk: samsung: add top clock support for ExynosAuto v920 SoC

 .../bindings/clock/samsung,exynosautov9-clock.yaml |   19 +
 .../clock/samsung,exynosautov920-clock.yaml        |  162 +++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos7885.c               |   93 +-
 drivers/clk/samsung/clk-exynos850.c                |    7 +-
 drivers/clk/samsung/clk-exynosautov9.c             |   83 ++
 drivers/clk/samsung/clk-exynosautov920.c           | 1173 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   62 +-
 drivers/clk/samsung/clk-pll.h                      |    2 +
 include/dt-bindings/clock/exynos7885.h             |   32 +-
 include/dt-bindings/clock/exynos850.h              |    1 +
 include/dt-bindings/clock/samsung,exynosautov9.h   |   11 +
 include/dt-bindings/clock/samsung,exynosautov920.h |  191 ++++
 13 files changed, 1802 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h


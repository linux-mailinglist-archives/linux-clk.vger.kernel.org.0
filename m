Return-Path: <linux-clk+bounces-6685-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFD8BBB09
	for <lists+linux-clk@lfdr.de>; Sat,  4 May 2024 14:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3161F21FEF
	for <lists+linux-clk@lfdr.de>; Sat,  4 May 2024 12:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388C5208C4;
	Sat,  4 May 2024 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOMg4RNE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C262033E
	for <linux-clk@vger.kernel.org>; Sat,  4 May 2024 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824392; cv=none; b=ux56OgqEPZ4/ynYZ1tNc7eF8WrdrpCS4CLzniAi4X7R+IEk0wK9BbF0Pu71LF1S/FzLVQuIAHTVWmh8j4Ke8gL+uEbnmlcMOreUNLA7QMkyN20hcm6leuJZNkpImolNpl/d2SPfT+lCCs24AZy+dGGZ5zUnjEujJ0B8AzgR3AB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824392; c=relaxed/simple;
	bh=E4NUlF5VQIe9oFr4HXVzgpyXS9FkO1vWaryQVaiCw78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bjrKhsjPL3A/fDunpdxeQjFOoQXDXJsHNtefxtOAPp2UDvba+qdoTq53M1VMiGtbaI4UPEJRBjJDuUw7kdBGbTyX68sJ3XqHM0mQKPkSQijPJfm53JV/f4zIKj1C4wWdUhNuA6el9vL5tMJKNzq7cxOYbs5/J+sNYZnwGvArlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOMg4RNE; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e28d8fb942so5261851fa.1
        for <linux-clk@vger.kernel.org>; Sat, 04 May 2024 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714824388; x=1715429188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmoUDmEK4doQTcwFVaJWsAEo654TgpusHYo23zS6+4A=;
        b=GOMg4RNECO7NIaDOAkeA/6t7xQ3eO7ZPlgxPp+q3EYDFwXryN25Xb0tnqFDaQ2sv8X
         GJQTCv4o/euBDSzeUIp0t1ZccqC9XFZRQ46zVSjkAC1YE+zWniseVqO6zk8NhdEpEe+7
         JfOI9L62R5vyMaCe7Vhg7fw7g53aaQSJ0KE7DUPtPmwuUyH5EdDSQiZfUY7YmsyoefrC
         v1rVqjVWfD7ASYAUHU7dO5Ud3zaVcWHhS0EsVjkiuJwY9+28xqA7XSHURxk7BYKD9h14
         GUDfUzlOwBjYtmyXOxzSM2nrFLkoxa3N6fYE60OTCrDppVH5gynEdpUzmmBbBN2pojNF
         GgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714824388; x=1715429188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmoUDmEK4doQTcwFVaJWsAEo654TgpusHYo23zS6+4A=;
        b=PSviEzMxHXGMTWxHkEAG6elqItxJqnNTAAiek62/umtMbECEnuN9K6WES8RBqFBZXO
         Lodb2EHxz+pw3DWJebgQhGx3gGyIb6z/3V0QgXHSA78r/Kpxws4LjzcnHkxzAuVY3iYJ
         2WwVfj7kJp+4IKohEES+LpX/PZ8GAgZ6ZdhFqpBpKntZHdJ9neR3hen97j8olWqftnD1
         zjT/+1T7GyGm0rBsakGhWY18SomuE4kBKoFYbzBHoU18LhVX7iHW9mkz+zQnNc2FAEHT
         OCrEoZsVk26X+83K+yLBfCAJvx2wSEzYhRs4SR/Whc7ohPk7ltLlQcB3+OFfAEEwAceE
         wXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVhcU6R9TDYgpa4RWQM7TpJKhw/0o3sgtp64TRQZMkzPXAQfC+uo5q2degbZp+fWeLx/LCQf0FwdU78HA3jS0k0xhu55GWLEXz
X-Gm-Message-State: AOJu0YypHb68QmEGX4re+hkBhxHt+qt7OMTErnb419lhQkDMMK37iHJE
	lGvsQIBzEqOKz0p4MF6N0fEUWKh8JV4294ZACMcu5OUjg7tQF8iSKn/Knqg6LHU=
X-Google-Smtp-Source: AGHT+IH9atE4P8OuHxvPaHIfI65XvGoUqbPNzcEeOie682Vh5NLZSyRG6SsdCDxSBhHt7uZBnRTCaw==
X-Received: by 2002:a2e:a416:0:b0:2d4:7292:92c0 with SMTP id p22-20020a2ea416000000b002d4729292c0mr3003429ljn.20.1714824388259;
        Sat, 04 May 2024 05:06:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bd13-20020a05600c1f0d00b0041c012ca327sm9048194wmb.45.2024.05.04.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:06:27 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.10
Date: Sat,  4 May 2024 14:06:22 +0200
Message-ID: <20240504120624.6574-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.10

for you to fetch changes up to 6b32d7474e9b833dc7fadc1b4d4f08af9bd87fde:

  clk: samsung: gs101: mark some apm UASC and XIU clocks critical (2024-05-03 10:34:34 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.10

1. Allow choice of manual or firmware-driven control over PLLs, needed
   to fully implement CPU clock controllers on Exynos850.

2. Correct PLL clock IDs on ExynosAutov9.

3. Google GS101:
   - Propagate certain clock rates to allow setting proper SPI clock
     rates.
   - Add HSI0 and HSI2 clock controllers.
   - Mark certain clocks critical.

4. Convert old S3C64xx clock controller bindings to DT schema.

----------------------------------------------------------------
André Draszik (3):
      dt-bindings: clock: google,gs101-clock: add HSI0 clock management unit
      clk: samsung: gs101: add support for cmu_hsi0
      clk: samsung: gs101: mark some apm UASC and XIU clocks critical

Jaewon Kim (1):
      clk: samsung: exynosautov9: fix wrong pll clock id value

Krzysztof Kozlowski (2):
      dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
      Merge branch 'for-v6.10/clk-gs101-bindings' into next/clk

Peter Griffin (2):
      dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      clk: samsung: gs101: add support for cmu_hsi2

Sam Protsenko (2):
      clk: samsung: Implement manual PLL control for ARM64 SoCs
      clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1

Tudor Ambarus (2):
      clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
      clk: samsung: gs101: propagate PERIC1 USI SPI clock rate

 .../bindings/clock/google,gs101-clock.yaml         |   55 +-
 .../bindings/clock/samsung,s3c6400-clock.yaml      |   57 +
 .../bindings/clock/samsung,s3c64xx-clock.txt       |   76 --
 drivers/clk/samsung/clk-exynos-arm64.c             |   56 +-
 drivers/clk/samsung/clk-exynos850.c                |  440 ++++++-
 drivers/clk/samsung/clk-exynosautov9.c             |    8 +-
 drivers/clk/samsung/clk-gs101.c                    | 1207 ++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |   15 +-
 include/dt-bindings/clock/google,gs101.h           |  116 ++
 9 files changed, 1822 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c6400-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt


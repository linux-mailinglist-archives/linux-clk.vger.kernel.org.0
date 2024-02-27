Return-Path: <linux-clk+bounces-4149-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3F868A49
	for <lists+linux-clk@lfdr.de>; Tue, 27 Feb 2024 08:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4198E1C21F27
	for <lists+linux-clk@lfdr.de>; Tue, 27 Feb 2024 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BE455E70;
	Tue, 27 Feb 2024 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2pwS+qT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D154FA6
	for <linux-clk@vger.kernel.org>; Tue, 27 Feb 2024 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709020722; cv=none; b=rDe4UVCQmihcxUCzKFSO/pxl/XCJJ251rnzcEpNZ48SSSw29un0pTUWa/aWDVwSSazT8C9OTFsNujh3Nf3XlpuQ+CU3WFj3ZsJGmaWZuCXjNHpaxQS/f4lzzfEUVBiYXEEgSQKYGSQhtlP9gJaffVBVxQRxFbQo72hmL20vuERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709020722; c=relaxed/simple;
	bh=/ew7vIeLEuM/TCI7njTkckWnYO2dVksctCFiWGxakDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PfN3ZYcTSu5bGYodCOf59aFQS1CEd2kb7hcT2KtM5zUg5NpUHtGcFnDHZj8wzlZqXK0OuXeewAOwWhgKfFxl1TgsAcKxFGAN7XC1ywK7h38q+In/sj8HJ6qGi9/eLJkfK+970FIOvAYhtv9/v4ReIzPPeSo7voOT5ms40cE5Yuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A2pwS+qT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e75e30d36so744779366b.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 23:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709020718; x=1709625518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ic80dLEyZy6kdVJF7joUFUuNP61uTBpqR9Za88+XI28=;
        b=A2pwS+qTQzBQgPiW144YdOmdFP1LbuoxQHAEvJ1cs4yZHqcs4n+GHVJ7vql/7nET9W
         1PjlyJJHWCwfW1nnR3J5zZYSIRn9uGUgCv6t+CJ3Sj3NAfED8B0zrEMRRWqStBQ5THfT
         Gm298p+S7ug+8ndExDumcwNpGNxYDwh+pReOtRVP42mkLaqmVMdT1bXMJLaVwhMqNr36
         HKO6DcjD06fCdRCiaRYfWHUFwkBus0key7uqFuSp5ZkN15Q9bfCV3rhO+yne7B66KyG3
         LJO2G2BMUcNsh8HDJsNNbyo9rPsh2wByWXZmK830+5E9YnwmAkt6b48m/U8XmmjXfFne
         8u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020718; x=1709625518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ic80dLEyZy6kdVJF7joUFUuNP61uTBpqR9Za88+XI28=;
        b=wfcpngI4/aQS0tVS73bwVe6JmC3qdia9vavcO49Yh8s+Ytlrt7OF4WRXQhzS/w/cGY
         nLvBAvToZpnNI7gVdyrE4Y1IoMOZJr/wetGQYKp3xv6dkLmGhXjuUjU5x8Xz1xmTU1NJ
         dlAOhq9GQSiwivPx8vZC1q92zubK6mSZiRuFYOlPNM8GCXM8O7lS4vqCY4RRPA/LAQv1
         6IHNUGvxNOwSJcxSnqDFMcXNmv9QvCMJJ+3vgZk1Qs/UJ6jwQLnNNiMOHA1Q5HplTx3R
         dKIfLiWQoqBuVn9vw/N18jPtklxjjuwYIwyA5Je5J353688O5dhS3KzEI/3Cfgwz3afp
         VAXA==
X-Forwarded-Encrypted: i=1; AJvYcCWDtHi+fxdrvtLtmFEdG59jEJPQaKpVsRQkJdABQmR4EH2qNUc4BDzmSvHDphDtW3i5VrGkc8TeyhovWQlgRIeIkPgjLWiFMzBD
X-Gm-Message-State: AOJu0YzXt33uAXExPWAF2ZFnetW0o6knd0CDoHBwFHzdO06I/wL+nZJl
	nbDyEuT+T/9ZMKB+8EaAu9qJAnBmUvaYLvKwiLy4xoFhNeVVW/OPFnr9EgLUvzM=
X-Google-Smtp-Source: AGHT+IFTBK9hxL6b/DxdG3pgJ4lkvuj80VlJ9MESHK5mlD8V/Sd4fRjlluYaVaQPIm8Rcyfo6sMoVg==
X-Received: by 2002:a17:906:fa8d:b0:a3f:f8a7:e1f7 with SMTP id lt13-20020a170906fa8d00b00a3ff8a7e1f7mr8339780ejb.5.1709020718353;
        Mon, 26 Feb 2024 23:58:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id bg26-20020a170906a05a00b00a3d0a094574sm503467ejb.66.2024.02.26.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:58:37 -0800 (PST)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.9
Date: Tue, 27 Feb 2024 08:58:35 +0100
Message-Id: <20240227075835.33513-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On top of the previous fixes pull request - my previous tag
samsung-clk-fixes-6.8 - due to context dependencies.

Best regards,
Krzysztof


The following changes since commit d76c762e7ee04af79e1c127422e0bbcb5f123018:

  clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names (2024-01-22 11:40:12 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.9

for you to fetch changes up to 61f4399c74d0677ee64e42f7b8d4ab01ee39de45:

  clk: samsung: Add CPU clock support for Exynos850 (2024-02-25 17:07:34 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.9

Google GS101:
1. Register the CMU MISC clock controller earlier, so the Multi Core
   Timer clocksource can use it.
2. Add PERIC0 and PERIC1 clock controllers.

Exynos850:
1. Add PDMA clocks.
2. Add CPU cluster 0 and 1 (CMU_CPUCLK0/CMU_CPUCLK1) clock controllers.
3. Propagate SPI IPCLK rate change to parents, so the SPI will get
   proper clock rates.
4. Refactor the generic Samsung CPU clock controllers code, preparing it
   for supporting Exynos850 CPU clocks.

----------------------------------------------------------------
André Draszik (4):
      clk: samsung: gs101: gpio_peric0_pclk needs to be kept on
      dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
      clk: samsung: gs101: drop extra empty line
      clk: samsung: gs101: add support for cmu_peric1

Krzysztof Kozlowski (2):
      Merge tag 'samsung-dt-bindings-clk-6.9-2' into next/clk
      Merge tag 'samsung-dt-bindings-clk-6.9-3' into next/clk

Peter Griffin (1):
      clk: samsung: gs101: register cmu_misc clocks early

Sam Protsenko (15):
      dt-bindings: clock: exynos850: Add PDMA clocks
      clk: samsung: exynos850: Add PDMA clocks
      clk: samsung: exynos850: Propagate SPI IPCLK rate change
      dt-bindings: clock: exynos850: Add CMU_CPUCLK0 and CMU_CPUCL1
      clk: samsung: Improve clk-cpu.c style
      clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
      clk: samsung: Reduce params count in exynos_register_cpu_clock()
      clk: samsung: Use single CPU clock notifier callback for all chips
      clk: samsung: Group CPU clock functions by chip
      clk: samsung: Pass actual CPU clock registers base to CPU_CLK()
      clk: samsung: Pass register layout type explicitly to CLK_CPU()
      clk: samsung: Keep CPU clock chip specific data in a dedicated struct
      clk: samsung: Keep register offsets in chip specific structure
      clk: samsung: Pass mask to wait_until_mux_stable()
      clk: samsung: Add CPU clock support for Exynos850

Tudor Ambarus (2):
      dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
      clk: samsung: gs101: add support for cmu_peric0

Varada Pavani (1):
      dt-bindings: clock: tesla,fsd: Fix spelling mistake

 .../bindings/clock/google,gs101-clock.yaml         |  28 +-
 .../bindings/clock/samsung,exynos850-clock.yaml    |  42 +
 .../devicetree/bindings/clock/tesla,fsd-clock.yaml |   2 +-
 drivers/clk/samsung/clk-cpu.c                      | 564 +++++++++----
 drivers/clk/samsung/clk-cpu.h                      |  53 +-
 drivers/clk/samsung/clk-exynos3250.c               |   2 +-
 drivers/clk/samsung/clk-exynos4.c                  |   9 +-
 drivers/clk/samsung/clk-exynos5250.c               |   5 +-
 drivers/clk/samsung/clk-exynos5420.c               |  16 +-
 drivers/clk/samsung/clk-exynos5433.c               |  10 +-
 drivers/clk/samsung/clk-exynos850.c                |  43 +-
 drivers/clk/samsung/clk-gs101.c                    | 940 ++++++++++++++++++++-
 drivers/clk/samsung/clk.h                          |   5 +-
 include/dt-bindings/clock/exynos850.h              |  56 ++
 include/dt-bindings/clock/google,gs101.h           | 129 +++
 15 files changed, 1661 insertions(+), 243 deletions(-)


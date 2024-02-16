Return-Path: <linux-clk+bounces-3706-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469285888D
	for <lists+linux-clk@lfdr.de>; Fri, 16 Feb 2024 23:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89251F24CA5
	for <lists+linux-clk@lfdr.de>; Fri, 16 Feb 2024 22:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBCD14831A;
	Fri, 16 Feb 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGp9viQL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31D44369
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122769; cv=none; b=dpkWzv/xH6ShIPHNxj2Yp4sWgyaRGssRwQC24rqoXjeJFFWp6A5Z8ZNr3gdfHV88DE+gGUvtE2+JyUlsbqdMZTmQI/pFYOFiUcNJWy+0p5IRaFys/PebOx7TKbT2vAQjAi1z311p2SXtw3zLwBZzWXjL8H2EQj3G5jHSKUG0TKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122769; c=relaxed/simple;
	bh=bJXbMlyr3+7OgLAhAoFw6DwWmRsb5c7TniueV2APaRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ajz5Ht1c3ZGu9TVjVyPKlZ3eBWH0a6OBNicmRovZjeqh4UlGJBXADnLu7YbAgyjAROqVUJj2iDPKHzhk0W1FbVFbxv6qi7xeZXxp+5fz50Vq0U4CB56bdB3clmd8IK7SVpfF1EeY4ZMAGRJE6cj2hTB6Hqg12/pwm9KndgxULQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGp9viQL; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c0449eaadaso2323172b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122766; x=1708727566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHTYIdNR7kys2A/utNtL/i8pf8YMUUwp1NermvOPClE=;
        b=WGp9viQLhEF8SDke4sBkWwz8WW5WR6zWI4EJNqcb3V67hZPHrT/xu8RgeM383QaF+0
         lxz88mF6RRtXi+BtMuTKJdug58kH2P/Ovy1++R8nOShlWSMCLA/rqp1A1D1janCgRobD
         tlc/SfN6yx/sB3LPGV4B/GCFO8ATPVu7PUmiPPaQQJNTrE978zOPJcO6tywFw5OTDGgz
         Kxg+yL+dIzYgf2Db0NyIay/ecqRRgg3v8+hF5Njbh2M7+NVy9UoL3eprYPVl4WuRhD3P
         gGdHXA7D3cWup0MKGYOJZIimYANqI7vzVd0gN4zgmuuLCCj/LsQTDXn8kpt698zFyh/V
         lVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122766; x=1708727566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHTYIdNR7kys2A/utNtL/i8pf8YMUUwp1NermvOPClE=;
        b=bTQXSe2I1zPRlut1Vqq9sWcMsrYk3T+POwq0wAwIhA0PYLrAKr/sgmV0s9ZrjKaM5C
         /egIzuWKYRoZhrVLMDNTe/7Mj8F97K9On9oYBRRRGZ8EZAIGJCkaeMUxRaRdDSKEWkn+
         xyhQrd5+3dgsHd0lxG3VOGmMMIFjpWaXJpSvoLNyAbyYgIYNs5KBhjmcE5k73SYMndxO
         BXmABsB3jrnmkBkXqbLU4z+JikrvSfhbs9u8Wwl4lzFy8gV1fXUWvpSDM3dL3ZrraHCU
         xLQ+kbwsEN8BgAe7AjEfPHy+MWPvDHKJYYwzWbPjbgpUtoTskt50oEh+e1DICjQCVOrf
         8Jyg==
X-Forwarded-Encrypted: i=1; AJvYcCVNpHyvmnRjhoj9iV+Ah2dlvLz9pC4YJs7fIpGysMV2oXxebaOaX4/VAL9arIzl15Quhi/gwDZAhQBslOo5pecF8EPjoEe/B0Ui
X-Gm-Message-State: AOJu0YzYxGfTy6QbvAGRfDoxI+8I9656qqoHnM/1VVvIuAm7Sb6Xdy6b
	who4ZSSCx+ZuWHG+x9o1UI2MZPUZ7Wi6vOJN4puC3votoweBYZOhvoi3+QAjyyE=
X-Google-Smtp-Source: AGHT+IFZ5qApavg7upJPRo6/wr5ec1xuG8yUN72eSx6NMpyH+uoGXiQImeQDOsCtto82hbvFIjqikA==
X-Received: by 2002:a05:6808:238f:b0:3c0:35a1:742c with SMTP id bp15-20020a056808238f00b003c035a1742cmr7615895oib.41.1708122765783;
        Fri, 16 Feb 2024 14:32:45 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id s9-20020a0568080b0900b003c0408e5b06sm126274oij.55.2024.02.16.14.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:45 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] clk: samsung: Add CPU clocks for Exynos850
Date: Fri, 16 Feb 2024 16:32:29 -0600
Message-Id: <20240216223245.12273-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series implements CPU clock support for Exynos850, adds CPU CMUs to
the clock driver and enables those in dts. This is the first step
towards cpufreq implementation.

The breakup by patch:

  * Patch 01: Add bindings
  * Patches 02..12: Prepare clk-cpu.c for Exynos850 support
  * Patch 13: Add Exynos850 support
  * Patch 14: Init PLLs to be in manual mode
  * Patch 15: Add CPU CMUs in Exynos850 clock driver
  * Patch 16: Add CPU CMUs and clocks in Exynos850 dtsi

If possible, all patches should go through Krzysztof's tree. As
inter-series dependencies go:

  * All driver changes (patch 02..15) must be taken together following
    the order established in this series
  * Patch 16 (dts changes) depends on patch 01 (bindings additions)
  * Patch 15 (driver changes) depends on patch 01 (bindings additions)

The series was tested on E850-96 board, via DebugFS with
CLOCK_ALLOW_WRITE_DEBUGFS enabled, by setting different CPU clock rates,
like this:

  # cd /sys/kernel/debug/clk/cluster0_clk/
  # cat clk_rate
  1053000000
  # echo 10000000 > clk_rate
  # cat clk_rate
  130000000

Of course, DVFS/cpufreq is not implemented yet, so the CPU can't be
overclocked too much right now, and the cpufreq interface is not
available too. As per the TRM, the CPU operates at a voltage level of
0.65 V, 0.75 V, 0.85 V and 1.05 V. When the voltage is 0.85 V, A55
quad-core operates at 1.6 GHz and CoreSight at 200 MHz.

To check the actual frequency, the "perf" tool was used:

  # perf stat sleep 1

And to check that on a particular CPU core:

  # taskset -c 4 perf stat sleep 1

Some takeaways:

  * Max functional frequency right now is 1.586 GHz
  * 1.742 GHz or more leads to the system freeze, as it requires
    more voltage to be operational
  * Max possible frequency: 2.210 GHz
  * The lowest possible frequency: 130 MHz
  * Default boot up frequency: 1.053 GHz

Sam Protsenko (16):
  dt-bindings: clock: exynos850: Add CMU_CPUCLK0 and CMU_CPUCL1
  clk: samsung: Improve clk-cpu.c style
  clk: samsung: Pull struct exynos_cpuclk into clk-cpu.c
  clk: samsung: Reduce params count in exynos_register_cpu_clock()
  clk: samsung: Use single CPU clock notifier callback for all chips
  clk: samsung: Group CPU clock functions by chip
  clk: samsung: Pass actual clock controller base address to CPU_CLK()
  clk: samsung: Use clk.h as a single header for Samsung CCF
  clk: samsung: Pass register layout type explicitly to CLK_CPU()
  clk: samsung: Keep CPU clock chip specific data in a dedicated struct
  clk: samsung: Keep register offsets in chip specific structure
  clk: samsung: Pass mask to wait_until_mux_stable()
  clk: samsung: Add CPU clock support for Exynos850
  clk: samsung: Implement manual PLL control for ARM64 SoCs
  clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1
  arm64: dts: exynos: Add CPU clocks

 .../clock/samsung,exynos850-clock.yaml        |  42 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  26 +
 drivers/clk/samsung/clk-cpu.c                 | 565 +++++++++++++-----
 drivers/clk/samsung/clk-cpu.h                 |  53 +-
 drivers/clk/samsung/clk-exynos-arm64.c        |  44 +-
 drivers/clk/samsung/clk-exynos3250.c          |   4 +-
 drivers/clk/samsung/clk-exynos4.c             |  10 +-
 drivers/clk/samsung/clk-exynos5250.c          |   6 +-
 drivers/clk/samsung/clk-exynos5260.c          |   1 -
 drivers/clk/samsung/clk-exynos5420.c          |  17 +-
 drivers/clk/samsung/clk-exynos5433.c          |  12 +-
 drivers/clk/samsung/clk-exynos850.c           | 440 +++++++++++++-
 drivers/clk/samsung/clk-pll.c                 |   2 +-
 drivers/clk/samsung/clk-s3c64xx.c             |   1 -
 drivers/clk/samsung/clk-s5pv210.c             |   1 -
 drivers/clk/samsung/clk.h                     |   9 +-
 include/dt-bindings/clock/exynos850.h         |  54 ++
 17 files changed, 1042 insertions(+), 245 deletions(-)

-- 
2.39.2



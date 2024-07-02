Return-Path: <linux-clk+bounces-8901-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15A91EF06
	for <lists+linux-clk@lfdr.de>; Tue,  2 Jul 2024 08:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6AA9B21049
	for <lists+linux-clk@lfdr.de>; Tue,  2 Jul 2024 06:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298B9537E7;
	Tue,  2 Jul 2024 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuwpcWJp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC77347C2
	for <linux-clk@vger.kernel.org>; Tue,  2 Jul 2024 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901888; cv=none; b=P6BN8tIgWxnTGjQ3podewZoGOMgL0egMKBVI53DEda1AXIBgXZx+YwsstijXO5r4NIMB4mmOwMODeiQRNIzQBSu+3uBzGcRVArADvYw9TWM+pvFd9Fc3cwiQTfGqIkdo9PFHynyCnvy1GBbXQ3Q0nAUwUiYg0exx9V2CQkcs98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901888; c=relaxed/simple;
	bh=bUusz5MFGQbk320lmZ7nHwxfWZl+U6GCDeO9USqryDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsGLPvgtmvRIQk+C30SH6Qf7l5u+jDxOfXIoDjJrlo5nDX4RBWT9UMqGdJLHxl6fNXV3Rz1yBkXPrU/1JfAKmVVgDP1R3OzujcEsY3DyQsehf7zNZbXF6rzi6embV3CmXX+GKFd0R9Wsf9lmVtRX8Klw2JSj7w6WLU8ZpoQ2Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuwpcWJp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-365663f51adso2303996f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2024 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719901885; x=1720506685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPU0iTtV1+7oVrxQo2zcnXjCL251x61XTIALxv2H0OM=;
        b=xuwpcWJpfu9hX+kviR7IeaDp+qgQfcKixUZFep0aTL4442AMPwSO5GJEkSxplFEQck
         jbSi8wtV/qJsl0xb3Lajws/jJnf6b+f0nJ6Z43lrquw+ChRYGGPTaSXqOibEwSDaQkZ6
         klOQWqp9sxMbXS5AqwH3r0SuycCl1GzcUu+ffgsNfE2wkCdFawsGZ7k+kcOKFXSjQypp
         z9j4KwC+tnH4YdD/YhdcyHbb7vJ6tpXrazhr1KguLWka8GiQWq/maVDswIZiQefFXAqE
         fYT7demAZ3lG4PB3KideQeYX4iecCQE4oaK5J4MpwsKnpS0E3JnWRsETtu5AO+2uNK13
         ZQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719901885; x=1720506685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPU0iTtV1+7oVrxQo2zcnXjCL251x61XTIALxv2H0OM=;
        b=DEnx99vLksr5/tlzKnouSzenETxo2Otob0/eQkiAuCWwv5XIvDwMZAUzyMS1gDYPyd
         IY5EnNEnvY+s11am4Lg5XNs6mVH4l2cFgqTkklDGo9PMhOu+z0x+p6kssE5hB3cxV9Y8
         HRp4aYiW2Lvv2fudjocT2GiThSm79mj8PnFIKm9KdSBYkJPs9ZJfNwBiPNOnVdW4Xhjj
         Ks6dI1xoJBOcUZR2hVWQV/XeDxCChsbNGeo9WvmjwSuF2CphzO1oVEtO7SRWgWLr3HEi
         WeejyPqMRBaGF06LTxFTs79RXEtGMFH3U5A1RrnpfkHACHmw2uSgf/UprG8Q/Ka+Cws7
         0Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCXI56nG2AGO7rZwkfunEB9ePWruwr6VWODoYwkSmGhYBQe3fUieL0z0HMJ7dZKVdBkyxJ/I8K6DRFI+PsSrvhEJpeUWJ8Lby9XH
X-Gm-Message-State: AOJu0YzoHlggYZX1nEmchNl2s1fNnBEZ1dl5cDO8vj339wRM82ILbzAQ
	5Kq4N1g+hZKFja7K4rKeMAMvB69odl2vwy1GhI+30essb3aHhjv3pl6ctg74+mI=
X-Google-Smtp-Source: AGHT+IH7TeWOJbXnfMxDaKJe3iYWxiALr9fPl4REF5wkT0sXVKtGKpAgu6H+zyO3BCdKZKl9oco8NQ==
X-Received: by 2002:adf:f30b:0:b0:362:b906:99c4 with SMTP id ffacd0b85a97d-3677572829amr4407346f8f.58.1719901884817;
        Mon, 01 Jul 2024 23:31:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8daasm12107097f8f.30.2024.07.01.23.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:31:24 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.11
Date: Tue,  2 Jul 2024 08:31:19 +0200
Message-ID: <20240702063120.5821-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.11

for you to fetch changes up to e61f400d6cf3d598ac3ff88a47b34823f9e1f2d5:

  clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical (2024-07-01 10:15:30 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.11

1. exynos-clkout: Remove usage of of_device_id table as .of_match_table,
   because the driver is instantiated as MFD cell, not as standalone
   platform driver.  Populated .of_match_table confused people few times
   to convert the code to device_get_match_data(), which broke the
   driver.

2. Mark one of UFS clocks as critical, because having it off stops the
   system from shutdown.

3. Cleanup: Use kmemdup_array() when applicable.

----------------------------------------------------------------
Andy Shevchenko (1):
      clk: samsung: Switch to use kmemdup_array()

Marek Szyprowski (1):
      clk: samsung: exynos-clkout: Remove misleading of_match_table/MODULE_DEVICE_TABLE

Peter Griffin (1):
      clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical

 drivers/clk/samsung/clk-cpu.c           | 4 ++--
 drivers/clk/samsung/clk-exynos-clkout.c | 7 ++++---
 drivers/clk/samsung/clk-gs101.c         | 2 +-
 drivers/clk/samsung/clk-pll.c           | 8 ++++----
 4 files changed, 11 insertions(+), 10 deletions(-)


Return-Path: <linux-clk+bounces-2536-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC67832874
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jan 2024 12:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09841C214F3
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jan 2024 11:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820474C62D;
	Fri, 19 Jan 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0BSiKTF"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163BA3EA60
	for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662711; cv=none; b=Wbo0cPhC4etJG4ehcrH0pdDML3v2cbF5XD/+OeC4ZK9S/vdXcKVafRTYdh9Uy+viR9WHJcfky9h0GI4WQzmI3pCocUHO+9B1WfoLlDWXfxbKukRYn0o4S8qQvZKyrT4aNsnmCGykljCQ6gOOCh3uG70dxlw5heoJQUHBT4xwfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662711; c=relaxed/simple;
	bh=OGQtZLKrPxDoakHtxJ2AlI+ihVOAm30q1lZ5mJXixds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TX7tSqOli2+mEV+nitRzqY049cInNGyED6ZnY7zpfEnIOI1RMHTdVBFht+cjZHnUK5EvNlf6wWKir8xQhsFsdgATd/cXYRlpzMQzrzUa/3UZIrol5rZ6vy6XqBv4i/DT1ZDPqN58yjOyQ+Muz9Ymxwa0Bg2nP7tpqL5xQOIlDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0BSiKTF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33922d2cb92so180150f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jan 2024 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662706; x=1706267506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gde/CEZexSF+MgWdYhtnhm3Pk0rf6HJ1JZWUNmdN21Q=;
        b=C0BSiKTFXb1hujP8Z8m3Q9r7oUJYd4RtKU3rxnv1Fa2+0yR8HtMcyOTYk4VoJULia+
         WUfqqosU6BvHEughcdD3p7EaiwdglVwMxP/pxH4r31yuTWaUbZvvUWhSf2+SsE35h02m
         IilTp0n//2hyrQVzUd7Kh4BGjZWQJInUE9xcNGHpF+v55XOT/9Qb2km8w3E9mpLxf6h0
         h5NvI7PpZ0v7gRDAEDku/co6tzAZZjFuyFoKSC5O9mw3YtvxyDckwNAGruJA163G9hll
         lPmz+I/7HmKoeqTu3fQhHALLAQZeQEDsRwuw7FfprGCuvnTOwm0GT724FrmQNOeTFijv
         cjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662706; x=1706267506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gde/CEZexSF+MgWdYhtnhm3Pk0rf6HJ1JZWUNmdN21Q=;
        b=pTGv4fhhnxIzD7gJmvD9YHLexjVGYrUNReWztBDkzX3lK8/DokpMiQ3sJ8KZOc/Qlf
         8s2v2mdvmkC4UWsBbwDH8xoo/z2MLclnr0rkFAN4vqnFknIwuso719gewEJqYJKvXsLV
         cZ/a1n30cHupYDgDDbrzB2NZ5vZo5Z6bityJb2bguHkJKjtmYee/mq1yj9bS4RwEN6Y+
         VBQwnInG4tJ6erp3oDV/VCwTc9wp6H7bVuDPfuKfs58rgJFUXmJkZ+PwixK6kjSxJPO+
         FyCVRzM2PoEC48NtD/fHb5wL6EO3/jl/Fa76g5PWaHsQ+l58hQHxuczTyGoj9ZvqsKFG
         eKlg==
X-Gm-Message-State: AOJu0Yz0O6U71mwI9LXbB5ZdZkRJ4kMmsNafr/Lf/dSGIHX9TJIoNJ/L
	pe/BOEe97xFmKoR1edjRHM5LW/XmIKZlAsntGU79ojhyAduP1e/qZm4291PFzuM=
X-Google-Smtp-Source: AGHT+IGtifd9K3NZvVC90VJrmNNTi5MUmQ5FbQ71/eCU55PSRhdJPA5+wlVQwRHcx3gTkzT850iqRQ==
X-Received: by 2002:a5d:5183:0:b0:337:bf81:e06c with SMTP id k3-20020a5d5183000000b00337bf81e06cmr639071wrv.79.1705662706307;
        Fri, 19 Jan 2024 03:11:46 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/8] GS101 Oriole: CMU_PERIC0 support and USI updates
Date: Fri, 19 Jan 2024 11:11:24 +0000
Message-ID: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4 drops the serial patches as they should be queued through the tty
tree. It also fixes the CMU PERIC0 DIV widths -> from 3 to 4. Saw the
bug while enabling SPI.

This patch set shall be queued after the cmu_misc clock name fixes from:
https://lore.kernel.org/linux-arm-kernel/20240109114908.3623645-1-tudor.ambarus@linaro.org/

Users that want to test the series must merge the serial patches to
infer the 32-bit register accesses from the compatible, otherwise
they'll see a Serror Interrupt as in this patch set we remove the
reg-io-width = <4> property. The serial set can be found at:
https://lore.kernel.org/linux-arm-kernel/20240119104526.1221243-1-tudor.ambarus@linaro.org/T/#t

Add support for PERIC0 clocks. Use them for USI in serial and I2C
configurations. Tested the serial at different baudrates (115200,
1M, 3M) and the I2C with an at24 eeprom, all went fine.

Cheers,
ta

Changes in v4:
- drop all serial patches as they should be taken via Greg's tty tree
- fix CMU PERIC0 DIV widths -> from 3 to 4. Discovered the bug while
  testing SPI
- collect Sam's R-b tags

Changes in v3:
- rename cmu_peric0 clocks to just "bus" and "ip" and then comply with
  the change in device tree and clock driver
- reposition ``iotype`` of ``struct s3c24xx_uart_info`` to reduce the
  memory footprint of the struct. A patch set reworking the members of
  the struct will follow.
- fix the usi8 clocks order in the device tree
- collect Peter's R-b tags
- changes log in each patch set as well, in the comments section under
  ```---```

Changes in v2:
- gs101 serial - infer the reg-io-width from the compatible as the entire
  PERIC block allows just 32-bit register accesses.
- identify the critical clocks faaaaaaarom PERIC0 and mark them accordingly
  (if disabled theslocks hang the system even if their parents are
   still enabled).
- update dtsi and use USI's gate clocks instead of the dividers clocks
- move hsi2c_8 cells and pinctrls into dtsi
- address Sam's cosmetic changes in the device tree files
- drop defconfig patches (savedefconfig output & at24 eeprom enablement)
- collect Acked-by and Reviewed-by tags
- changes log in each patch as well, in the comments section under
  ```---```


Tudor Ambarus (8):
  dt-bindings: clock: google,gs101-clock: add PERIC0 clock management
    unit
  dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
  clk: samsung: gs101: add support for cmu_peric0
  arm64: dts: exynos: gs101: remove reg-io-width from serial
  arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
  arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
  arm64: dts: exynos: gs101: define USI8 with I2C configuration
  arm64: dts: exynos: gs101: enable eeprom on gs101-oriole

 .../bindings/clock/google,gs101-clock.yaml    |  25 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |   1 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  14 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  54 +-
 drivers/clk/samsung/clk-gs101.c               | 583 ++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h      |  81 +++
 6 files changed, 745 insertions(+), 13 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog



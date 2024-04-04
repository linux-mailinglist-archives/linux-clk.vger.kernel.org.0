Return-Path: <linux-clk+bounces-5507-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C62898773
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 14:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C340C1F28CBF
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB51286AC2;
	Thu,  4 Apr 2024 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7Dl8WGr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4008664B
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233573; cv=none; b=hiQEFpj3WPBAENw/q5M4Z1V1nSqB3o3w6WsM2wqil0MaJVIAAMsT8okZ+Y1i/5Bs9A0+O5DDM7QusaAZH02bjF0d/jTp6ParSSBzmkxzUIVUUIAjh2yTbvIFXRzGJQRZDi0ydqwG61xQUsWlS3Ek6MT0vh0lZGrmqMGYJypGKFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233573; c=relaxed/simple;
	bh=bADRJFGOvu1b0zF/Q4lv3G9rwZq8EwwDyeDlWWXD6Co=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dj3vWkZHZL9r68iMc82nZ8DqArykJzGR2SVxovL54PZ1KmdHWzBmmYzA1yyaVfXB8b4EzflAFGNUsz9/TFXLoMs30wCisnuJ9hblm/IHTYvTfUi8rN90q0cuamCYbeh4qfNHFFQPnAdsxOLeykMmPkq+CscA30UlybarZ04Il3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7Dl8WGr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4162b8cb3e9so3261095e9.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233570; x=1712838370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJYM6tMjtFChrulSjg0o7kKxgUYy0TmdSYB4AKPdhEk=;
        b=c7Dl8WGrjLWTItx3QpPn1tbGFQqqf+0BDlci95hQt4INKr4QDj2vAdy261gNi/3ZeC
         MWTmLH1Ijym07RYr8fKnCgTryJRWtp4Fpz+vHv8xmuMldGQvVby8WysmChWitLVtPNiT
         z6RPvcEmqtab9HTK0NnBg3GcQjCJ0CTiWaVevlsfyie2PqHBY/KgA8jDzmd8IN33zXsd
         +kYLc3WeMwceyJRjnvW0euv985FH9G34i3Cyw7YgoebF3DJwkVvucFtBy4gWCZXHo/gl
         b1m6d+TvR3DENTPLZ6J8PalFntIjOl4uQsOQgddPbORO/YHi7VbFDWdgtk81Hl203YoF
         QUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233570; x=1712838370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJYM6tMjtFChrulSjg0o7kKxgUYy0TmdSYB4AKPdhEk=;
        b=Ktavli4keK7LojQbgyQin0OIOqtpzV1npXMWx+tAlxrchBMLxlFVvd3aHjOx66iFS9
         lnZmWUMUJ7rBM1UZAf0dl8Zs8Sjk4zNIyFQxbYiMzpv2dJP4Th+TWSnxl/Te41LmZ8RG
         eTxrN7T+nG5xQvHNIgBA+1u1VkvwxYzp5A3yxICfw3uRmTvtjIwwOX9NuCs87Rc24BFo
         XT24zE48TIfK8dCWybnH/AEVaW1I1gytFz4biLr4sEEN2079yxOcnMYiHDtuZsTe4PNH
         iwX/XTyolEDxAV6nRFbbdX3U6BVebO0FY/Ea+ELC52SRR9ny0moP0/bc59LBdRIXiEgg
         b3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWphcGpqObJK4GhogxZ74uszSMqwMjyt2WlKItIqsRw512bBwPmvXoo9IbtCLgn8owuqHP/PGBoU1fgzl8kviHAehWjcD2ERo/R
X-Gm-Message-State: AOJu0Ywwqlj57mOIFE0AidT1mYCnMLzLSTipu9D165kLqaUbjrFWFXnq
	yEPBg7y85B6y6S0b+JzsZ8q/fCNSFPWVCDf6D26f4euGyU3QnQ6ttfLH2rcD+h0=
X-Google-Smtp-Source: AGHT+IGhdc0j00kl/SimlNVvg9pgoaeQSTThX/VudHinZM2oZtNar8Jm+FLBUrq74KmHRHDDb/tr/A==
X-Received: by 2002:a05:600c:54ef:b0:415:533b:1071 with SMTP id jb15-20020a05600c54ef00b00415533b1071mr2316215wmb.19.1712233569988;
        Thu, 04 Apr 2024 05:26:09 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:08 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 00/17] HSI2, UFS & UFS phy support for Tensor GS101
Date: Thu,  4 Apr 2024 13:25:42 +0100
Message-ID: <20240404122559.898930-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds support for the High Speed Interface (HSI) 2 clock
management unit, UFS controller and UFS phy calibration/tuning for GS101.

With this series applied, UFS is now functional! The SKhynix HN8T05BZGKX015
can be enumerated, partitions mounted etc. This then allows us to move away
from the initramfs rootfs we have been using for development so far.

The intention is this series will be merged via Krzysztofs Samsung Exynos
tree(s). This series is rebased on next-20240404.

The series is broadly split into the following parts:
1) dt-bindings documentation updates
2) gs101 device tree updates
3) Prepatory patches for samsung-ufs driver
4) GS101 ufs-phy support
5) Prepatory patches for ufs-exynos driver
6) GS101 ufs-exynos support

Question
========

Currently the link comes up in Gear 3 due to ufshcd_init_host_params()
host_params initialisation. If I update that to use UFS_HS_G4 for
negotiation then the link come up in Gear 4. I propose (in a future patch)
to use VER register offset 0x8 to determine whether to set G4 capability
or not (if major version is >= 3).

The bitfield of VER register in gs101 docs is

RSVD [31:16] Reserved
MJR [15:8] Major version number
MNR [7:4] Minor version number
VS [3:0] Version Suffix

Can anyone confirm if other Exynos platforms supported by this driver have
the same register, and if it conforms to the bitfield described above?

I'm also open to suggestions on how else to detect and set G4 if others
have a better idea. It looks like MTK and QCOM drivers both use a version
field, hence the proposal above.

fyi I'm out of office until Monday 12th April, so I will deal with any
review feedback upon my return :-)

For anyone wishing to try out the upstream kernel on their Pixel 6 device
you can find the README on how to build / flash the kernel here
https://git.codelinaro.org/linaro/googlelt/pixelscripts

kind regards,

Peter

Peter Griffin (17):
  dt-bindings: clock: google,gs101-clock:  add HSI2 clock management
    unit
  dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg
    compatible
  dt-bindings: ufs: exynos-ufs: Add gs101 compatible
  dt-bindings: phy: samsung,ufs-phy: Add dedicated gs101-ufs-phy
    compatible
  arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
  arm64: dts: exynos: gs101: Add the hsi2 sysreg node
  arm64: dts: exynos: gs101: Add ufs, ufs-phy and ufs regulator dt nodes
  clk: samsung: gs101: add support for cmu_hsi2
  phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle() to obtain PMU
    regmap
  phy: samsung-ufs: ufs: Add SoC callbacks for calibration and clk data
    recovery
  phy: samsung-ufs: ufs: Add support for gs101 UFS phy tuning
  scsi: ufs: host: ufs-exynos: Add EXYNOS_UFS_OPT_UFSPR_SECURE option
  scsi: ufs: host: ufs-exynos: add EXYNOS_UFS_OPT_TIMER_TICK_SELECT
    option
  scsi: ufs: host: ufs-exynos: allow max frequencies up to 267Mhz
  scsi: ufs: host: ufs-exynos: add some pa_dbg_ register offsets into
    drvdata
  scsi: ufs: host: ufs-exynos: Add support for Tensor gs101 SoC
  MAINTAINERS: Add phy-gs101-ufs file to Tensor GS101.

 .../bindings/clock/google,gs101-clock.yaml    |  30 +-
 .../bindings/phy/samsung,ufs-phy.yaml         |   1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |   2 +
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  51 +-
 MAINTAINERS                                   |   1 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  17 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  53 ++
 drivers/clk/samsung/clk-gs101.c               | 558 ++++++++++++++++++
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynos7-ufs.c         |   1 +
 drivers/phy/samsung/phy-exynosautov9-ufs.c    |   1 +
 drivers/phy/samsung/phy-fsd-ufs.c             |   1 +
 drivers/phy/samsung/phy-gs101-ufs.c           | 182 ++++++
 drivers/phy/samsung/phy-samsung-ufs.c         |  21 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   6 +
 drivers/ufs/host/ufs-exynos.c                 | 197 ++++++-
 drivers/ufs/host/ufs-exynos.h                 |  24 +-
 include/dt-bindings/clock/google,gs101.h      |  63 ++
 18 files changed, 1179 insertions(+), 31 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.44.0.478.gd926399ef9-goog



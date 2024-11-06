Return-Path: <linux-clk+bounces-14306-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F59BEFFD
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 15:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10FE5B21B90
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3367F2010E5;
	Wed,  6 Nov 2024 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gag/AhQe"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9E1E04B2
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902927; cv=none; b=Umy2o5mCBsE/aKfp2DEcMUraRL15uHASN8mkhCew8UcY5wWCeuPsMzqzooE7CX8C8TDgjjjHRbtdNcG++MO+UIdEVOMKuoRuxNCiP9AZkTAI89rQL6+1udeYik+HwnUuNiIxb+04uzWf9ZuK+ItX5HOfISZ8RQta3r4P1ecZNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902927; c=relaxed/simple;
	bh=Jai6l51tfQXx2f20hBESY7dASlBrE5N2eyk6W7quo9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZ2XH2mHRsHNUQ0V/WcuIhI0scHoG4qmGf8Mpb8feY/YcRHsiW/Wbgnt+uZAi0VUjarf7ZFGqB1MyykGgBobx87SliI1JnoO8aAYAwuMwi344+wqK05K1indpWx/79/ksRSxpO6P8AnOoQb1tMHCsDXT63ibRjjSX2IxHIc7Oag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gag/AhQe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4319399a411so57481385e9.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 06:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730902924; x=1731507724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAlPwdfUhMPwlTJAbroDL64kzgDUSQREYrAUHpV4lWk=;
        b=gag/AhQeCuqv8iNcB2kOd4M2pJ/TCbPO/Z3LPC5OLq1DAH8YOuNgAqEO4sPCqNrRPL
         SARzsWojRXNADdv8QNXRXuoVODV5ojbvRrbhq1EsU9y16CNUpyRCMyH3j44ZJm8lkn3X
         G1YWC70ZLf1fP9c9BJ89hsIc9XLe49aNvi4xsLgsTow/GSmrRxH/TseJaaz5ATS16AfV
         B8v9Kcv5jHJyluLQwJrGFz36/gu/1c21/6vX1kvqkAzsIlgArnKDkyXRwcbkhJzhXHx9
         aCrl+1sBZbDE3M/3ImW6M/AYS3Sz2uvrGQ4Y8BP+BqKLahu69HXYvmjU6If+kGJmvnoQ
         PSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730902924; x=1731507724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAlPwdfUhMPwlTJAbroDL64kzgDUSQREYrAUHpV4lWk=;
        b=ExOfd6uydH3A40eSaRoDLoEovAU4xa/MZIq0J5H8KbMLGuTvyGS34G79k5jE6aN+ur
         DAa1usZCAY9GADFxqOBnRr1BRP7doqOqD4FXKAutwV30QSziMLHxgy4DFSoIHPT1FeTs
         rdjsA03MXMixTH3VVprTuJbqIwm9/MAR/W6dJdWuY+bhCtor3dGet/gyIfGaq7uHLPqy
         nCaadJn78pYWhihUstZ65ws6DSRMHpy7oUluM08PNwOq3M8o2lVDF+/yZodVGgPbtiH+
         0hZrTpDiFT0acLwcV6oJrOIx6MeutugorMWYYfjySkcbUsOqfB9NEfGdy9BJZT0iwBp+
         Y6yA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Gx4xw6H5VD1wfEvgPR3tkaz6jJmcp53TWY9BSXyMH+wz+M3qUxNO9uuasRr4hMBkuJb0AXPaQuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8osusIiL/V0vnsnRauNt1/v8+xYxr+jtElzZ4sXwriZhpah9Q
	8NJKnOQp/5mQapHzuIFdlBsuVPhd78sAerT6tQeiPB9RKU9+ub+ZGqT+4N5zPb0=
X-Google-Smtp-Source: AGHT+IHIfw5QJbKJej7wCYRgrtaZek0f7PoBsxUGko/YPocysw1rxvIGEWPP3OMvd9OmYtIElvTfWA==
X-Received: by 2002:a05:600c:a085:b0:431:5187:28ef with SMTP id 5b1f17b1804b1-4319ad2f3b4mr328657115e9.33.1730902923745;
        Wed, 06 Nov 2024 06:22:03 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e6aasm19289952f8f.67.2024.11.06.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:22:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.13
Date: Wed,  6 Nov 2024 16:21:54 +0200
Message-Id: <20241106142154.622141-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.13

for you to fetch changes up to 81a206d736c19139d3863b79e7174f9e98b45499:

  clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains() (2024-11-05 12:07:59 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.13

- Document the compatible for i.MX95 HSIO BLK CTRL
- Add the HSIO BLK CTRL provider to the i.MX95 driver
- Moved the CLK_END macro from bindings to driver for i.MX93
- Add support for i.MX91 CCM to the i.MX93 driver
- Add workaround as a fix for errata e10858 to the lpcg-scu driver
- Fix PLL initialization and power up for i.MX93 in fracn-gppll clock type
- Fix clock enable state save/restore in clk-scu clock implementation
- Skip HDMI LPCG clocks save/restore in lpcg-scu clock implementation
- Fix return value check on PM domains attach in imx8-acm driver

----------------------------------------------------------------
Dong Aisheng (1):
      clk: imx: clk-scu: fix clk enable state save and restore

Peng Fan (4):
      clk: imx: lpcg-scu: SW workaround for errata (e10858)
      clk: imx: fracn-gppll: correct PLL initialization flow
      clk: imx: fracn-gppll: fix pll power up
      clk: imx: lpcg-scu: Skip HDMI LPCG clock save/restore

Pengfei Li (4):
      clk: imx93: Move IMX93_CLK_END macro to clk driver
      dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
      dt-bindings: clock: Add i.MX91 clock support
      clk: imx: add i.MX91 clk

Richard Zhu (2):
      dt-bindings: clock: nxp,imx95-blk-ctl: Add compatible string for i.MX95 HSIO BLK CTRL
      clk: imx95-blk-ctl: Add one clock gate for HSIO block

Yang Yingliang (1):
      clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()

 .../devicetree/bindings/clock/imx93-clock.yaml     |  1 +
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  5 +-
 drivers/clk/imx/clk-fracn-gppll.c                  | 10 ++--
 drivers/clk/imx/clk-imx8-acm.c                     |  4 +-
 drivers/clk/imx/clk-imx93.c                        | 63 ++++++++++++++--------
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 20 +++++++
 drivers/clk/imx/clk-lpcg-scu.c                     | 41 +++++++++++---
 drivers/clk/imx/clk-scu.c                          |  2 +-
 include/dt-bindings/clock/imx93-clock.h            |  6 ++-
 9 files changed, 113 insertions(+), 39 deletions(-)


Return-Path: <linux-clk+bounces-9783-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82838934B52
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 11:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A629B1C22224
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 09:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16412C54D;
	Thu, 18 Jul 2024 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="d/Bri/rw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1792D638
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296688; cv=none; b=NLk/+SNyinRFTvsisUAR7miezBvM6olpS/EgjecXb//sAuYjHe3Yrlx2Wg4m+LbeITnaK1vX4XFMrmfgEZAACy0iqyhiivqsfAA7X69k6d73iHeXjraJmvclJlsoGimXn9K/8W5vUQMm/G41wY8kFx4ftPj3zJnWpNgRrFxU2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296688; c=relaxed/simple;
	bh=JmZZOfYeNgwLmbv9ZzZmueAe0OYP+/3+b1TO99PfC5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOh/uKEMXM5BxAYGWf7wdDC0XeBU9oKujo5OhhTCldePbXUrSsbxAO559a+Af098y3zQzOJIbwGjzVbHFbrpe6rJgLc2oxexirNapNAHlwyVCUNRTx2KZ0eFG5oT+W7q3WJcEXEKtf5bxLNHzR2vgol9LOGCj/ffad8dyPV0tyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=d/Bri/rw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266fd39527so1078585e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296683; x=1721901483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apqr4MjpXZ1D4CbWyTpnUc+azdCUdbdHdOC61/0sTcA=;
        b=d/Bri/rwDB9b3xkqiDhdcXpC9RHCJfvMDaT4Dt0wMuLQjTeX01VzH14BgRN3yoxBkg
         rxIQthkCgqWbqEurDT2OFKWXSPoyht/kFjTBpqnjc2iHf8ludFFGgWH35T1UKvJWfnwj
         7zpvIpn6aNEbgWG0q5MLknFtUTyAD/d2N8ddYAlfx8/zjJddcI/+0TV+tHJUOPRRKGbc
         RhfXsp7vfEvhKycPIDrrRHbx5Jlc+6oAyQXwaso+j1HGVr2fM+g4h7QBxnZD8pAhMYcZ
         7uRJ5NPa2Y9sCh5mqeX+pFzbmao5nk+9TdItmn5vh9cndZVcPS4szLgOOWRn2eLbf6i1
         RMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296683; x=1721901483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apqr4MjpXZ1D4CbWyTpnUc+azdCUdbdHdOC61/0sTcA=;
        b=tXuchPabqUCk3CNo+DEodrSd0SEoM2YxlA2kgzysSN8dDGlaOsgCkHNNwAYwGrEnbC
         VmFPGd34Pav3xWyOpHaFWhjBinYoKv1raHxnFhIHGy4vsoj2Ld/ZknK6Y8KkOL/7MBC2
         fbUiHfFDyIYkwgZ6GtpBD9uEuBDb3asAawVaeMBqoxoLO77EBFZhXcjxH/xgXD33gWUp
         MkxjSon5b4V52fPufbbaZ3CKR0/lT2fG4txr6XwkgY/cmaCXx10aZGB9i4kJP0h2R/mA
         +Cn2tnEgcUScCusizlduNVcglpCEoogGHfHci9HScvbp5pu09Xbc4Jqq/rIgWte2VJlv
         ZzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXaIaUJcQeKMmwllTicGmLXd4ZEDTyc6IyNBL2eYXpckjTDMt/30rZoC5of+NQBANTN67BdknyDwbC2M5FCe+yJZx3u8WuieHXV
X-Gm-Message-State: AOJu0Yzg8tR66ZNf7f0/ysfbDDg4wlpiPk2aHKteG9XyAYSn5jY50dkl
	Ztv4fNZhHJKwpM/dy1D1FyT6cYcSpZe78r0Fr+VaZpf4MjG3jq4fAXGdMzPs7pw=
X-Google-Smtp-Source: AGHT+IHPLDzIfgK/BifnQdo6doJOM8/tpFYJfvzun4tqGe+2vBGATojTwO9cCkzNqJXzETloX+A32Q==
X-Received: by 2002:a5d:59a2:0:b0:367:9073:3496 with SMTP id ffacd0b85a97d-3683160e527mr3553248f8f.29.1721296683409;
        Thu, 18 Jul 2024 02:58:03 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Thu, 18 Jul 2024 11:57:44 +0200
Message-ID: <20240718095755.3511992-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This patchset follows the discussion about having reset driver in the
clock tree [1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2
trees and could use the same driver code.

This patcheset alignes the reset drivers present in the reset and clock
then adds support for the reset driver of audio clock controller found in
the  g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

Changes since v1 [3]:
 * Fixes formatting errors reported by Stephen.
 * Changed parameters type to unsigned
 * Fix usage of ops passed as parameters, previously ignored.
 * Return 0 instead of an error if reset support is absent
   to properly decouple from the clock and have a weak
   dependency
 * Split the platform and auxiliary modules in 2 distinct modules
   to fix the COMPILE_TEST error reported by ktest robot.

Change since RFC [2]:
 * Move the aux registration helper out of clock too.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
[2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
[3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com

Jerome Brunet (9):
  reset: amlogic: convert driver to regmap
  reset: amlogic: use generic data matching function
  reset: amlogic: make parameters unsigned
  reset: amlogic: add driver parameters
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: move drivers to a dedicated directory
  reset: amlogic: split the device core and platform probe
  reset: amlogic: add auxiliary reset driver support

 drivers/reset/Kconfig                         |  15 +-
 drivers/reset/Makefile                        |   3 +-
 drivers/reset/amlogic/Kconfig                 |  27 ++++
 drivers/reset/amlogic/Makefile                |   4 +
 .../{ => amlogic}/reset-meson-audio-arb.c     |   0
 drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-core.c      | 140 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
 drivers/reset/amlogic/reset-meson.h           |  28 ++++
 drivers/reset/reset-meson.c                   | 153 ------------------
 include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
 11 files changed, 455 insertions(+), 169 deletions(-)
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-core.c
 create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

-- 
2.43.0



Return-Path: <linux-clk+bounces-9659-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D49323E6
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 12:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B0361C21F5A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 10:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A6198A3D;
	Tue, 16 Jul 2024 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P+p0GZwm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593251953A8
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125839; cv=none; b=c0dbx3gEwIX7Y7uT+clTQeRUUBRkoxjA4Xd2wQ+2W4Gz+F4F4a7qvCQ/kcGwUFGa5pVoI+afNNDSgiEck7YYGZTAFkDRu22gSG5j+mWTQ4lH/DuCrghdM0o/X7+H57FuKZVIHQ7W2y75AObSLf8BIeIpZXeFUCMpvk3hM5KmeqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125839; c=relaxed/simple;
	bh=6VyR9TNhbMrQhPhYEUVNJpdMEkYjK1X2W/9Ih6F1hpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Op404i2hR/fn7FfwB04fVNpkzO9/lxTv+fd9p59cT7uSRIJBi8S8ZijscoUdKO+pbh2cvzcLRg6hpS9XjnRH3CNF+MfSHGgaiAeNEkW1NdZ75gFO1GgskehlG8eidWYSYR3slCr8uV3SeEPKENLzGkH6POH8xSLcI3dI0T0LJKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P+p0GZwm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3679f806223so3716507f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125836; x=1721730636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2oAUOUIr8Inm5CAOgiH6h0kthoIy+ddKKLth4dhl9c=;
        b=P+p0GZwmVtXD/CIc70JXy7hhGnW5KX1y7+CCYj8/Mf+NeyCcWe5vgCRsiYJz4wtFFG
         P56BGhcHi5YGBkTMM1+IdvtERmjYPXqo2mW0nJ4rZDSD+Y0772I3iHRnKQF0QU+SGy9U
         jK6Yi2JUCjtEksast60/KsvqDbA3Bn5rSMKz5FX1rRPgUSJoGBhwWG6F2FVfeieptBgW
         aa3U7VjcIP+dIya0/Y5DuHvZap3k68Bs48yZssC5/NIvtwpEGL/m71A+S8IJd6Vstb+4
         oNpxNDLdvTSFBnJlQ35rPCKIuwKLvSspztc8XArwA4YSSYJUv2UXFpLHmawVmQMtC4n+
         oTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125836; x=1721730636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2oAUOUIr8Inm5CAOgiH6h0kthoIy+ddKKLth4dhl9c=;
        b=LHbER93WuMYrKiCsMVp0Dsz/5Nx21lDJt2zlIa3wbSn1r6fkRSKffxf0s2ueipX63B
         4Rn/VbUHyA5IKs5usQUGFS1J3sgKu+8WcCBE2xqfuFmNbW9VvOJjW3kw9ijOloDKCLSf
         LJBQqdUs9hy4KvBffcHcmQ5Say2M0Gcc4EGSO9PSkwqweTLbn9PvxhQzyDVf6DChFGOa
         vQxjuCk3oH0fzMMgbti2IkqzN/b47kca1YruIz6Q0mvPFNYlt4gEILQy5hbsfEZ22XaG
         RuwEdGI8SsTkGDXTDCsJR2K5YRZmAobHD46cSMXnyhCVz8zc+6ytIVYf9TblO40jKgDt
         GeSg==
X-Forwarded-Encrypted: i=1; AJvYcCVVdES/Kd6S4EJTkaVrtw8KDcJe5LipiHbB7bIgMs8giL4UHbCzFMVbfLNxy9IiqjwFF1R/5YDIdb4Y23dn9FqHZhUKFJUvZvBt
X-Gm-Message-State: AOJu0Yz1JzWvHYln0SwvMEiBl4TO45EF7hOCTJ0Nbiox3lTfgZFXldxI
	0qxG2zZ1bQ7DnkGSCrH1uujcE496slI+FsAwWitHw/l7aC7f8UCP9pU+VkvwYvA=
X-Google-Smtp-Source: AGHT+IFfQhmkb59uH7LLa18F1SN7rqCnC4h7YO13ztbZBrn/+rB64CFv3oFG71YVR5qVnFq44xDcDA==
X-Received: by 2002:a5d:62c8:0:b0:366:ea4a:17ec with SMTP id ffacd0b85a97d-368273575b2mr1107731f8f.2.1721125835619;
        Tue, 16 Jul 2024 03:30:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/11] Add RTC support for the Renesas RZ/G3S SoC
Date: Tue, 16 Jul 2024 13:30:14 +0300
Message-Id: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-03/11).

Patches 04-05/11 add the RTC driver.

Patches 06-09/11 update the device trees with proper nodes to enable RTC.

Patches 10-11/11 enable proper config flags for RTC to work on RZ/G3S SoC.

Thank you,
Claudiu Beznea

Changes in v2:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power domain
  support for the VBATTB IP" as it was already integrated
- kept only a documentation file for both VBATT MFD and clock drivers as
  suggested
- addressed review comments
- used cleanup.h lock helpers
- update startup sequence for the RTC driver
- switch to 24 hours mode on the RTC driver
- fixed range for the RTC driver
- added a generic compatible for the RTC driver as this will also be
  used by RZ/V2H
- used clkin/xin clock names for the VBATTB clock driver to determine
  if bypass should be configured on registers instead of having
  dedicated DT property
- added mfd driver for VBATTB
- updated Kconfig flag names to include vendor name
- removed DT node labels from Documentation files
- used items to describe the interrupts and clocks

Claudiu Beznea (11):
  dt-bindings: mfd: renesas,r9a08g045-vbattb: Document VBATTB
  mfd: renesas-vbattb: Add a MFD driver for the Renesas VBATTB IP
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB clock
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB
  arm64: defconfig: Enable Renesas RTCA-3 flag

 .../mfd/renesas,r9a08g045-vbattb.yaml         | 136 +++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  69 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  43 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  17 +
 arch/arm64/configs/defconfig                  |   3 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 212 +++++
 drivers/mfd/Kconfig                           |   8 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/renesas-vbattb.c                  |  78 ++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 853 ++++++++++++++++++
 15 files changed, 1445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/mfd/renesas-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c

-- 
2.39.2



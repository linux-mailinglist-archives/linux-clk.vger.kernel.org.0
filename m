Return-Path: <linux-clk+bounces-21168-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED13AA4635
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 11:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB31917998F
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 09:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D85E21B9DB;
	Wed, 30 Apr 2025 09:02:02 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA3219A6B
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003722; cv=none; b=crzyiEBJyhqLxIpg3YMLjX4Yot+A3Tm31/GZ/v+93W1DclF1ffUpb9IjWjV0XgVC6zOjzELoCJvqE1JqJiR5eIrEFZ2DfY1XuwsuHFIHnpS6cRvOQSOju9JNapRmlfb9xVIgL0ZpL1yw3Wpyeu7se8uwo5s/BHujdpVD/lmkyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003722; c=relaxed/simple;
	bh=L7m7/oDOVyLCTBoHwxcpvzWEPQ5God4FzUVY+/hwE20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k79xDw9tQVmjU4jIFeHGHvn5zt+S8N2nS4bPuQG3wT6xY/B9bXKyC0AfLzcG4seNXPOuxuRmCbF+FPVlZe8VfHIWBZ5iV1uYqTxcDWbGmmdwbtQwPVLZ2P4hvj0BguthWW7LaZPLnNnAcqJsT3DrLgOR6XpyWHtPbhW7AFav5zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-00036b-RX; Wed, 30 Apr 2025 11:01:43 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-000OlJ-1Y;
	Wed, 30 Apr 2025 11:01:43 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uA3K3-00E1q2-1F;
	Wed, 30 Apr 2025 11:01:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v4 0/3] clk: add support for TI CDCE6214
Date: Wed, 30 Apr 2025 11:01:33 +0200
Message-Id: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3mEWgC/3XMQQ6CMBCF4auQrq2ZTgsFV97DuIB2qo0GSEGCI
 dzdwoqgLv+XvG9iHQVPHTslEws0+M43dQx1SJi5l/WNuLexGQKmoCDn5vngxhrKUCgORitQ0hr
 MNIuXNpDz48pdrrHvvuub8F71QSzrH2gQHHhlFWkosCyEO7dU3159aGo/Hi2xRRtwKxQ7AaOgo
 MK00ohkqp+C3AgCdoKMgtXSuMI5aXP4EuZ5/gACoD8MMQEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746003703; l=2340;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=L7m7/oDOVyLCTBoHwxcpvzWEPQ5God4FzUVY+/hwE20=;
 b=bgdEW5W5Ln/+GzTpAi73T021/b4KxvzNBza+YfQ0zZUa9FbpFmSWQ+HDyom7uRyTHsbXv1+lP
 hi20JrJ0DE3BcwblgEbzmtHvbCcJIItJRvyoxSmm0PS9ec4BM7WqmoF
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM.

This series adds a common clk framework driver for this chip along with
the dt-bindings document and a small fix needed for the common clk
framework.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v4:
- add missing '>' modifier in include/dt-bindings/clock/ti,cdce6214.h
- fix clocks maxItems should be 2
- add missing license in include/dt-bindings/clock/ti,cdce6214.h
- Fix checkpatch issues
- Link to v3: https://lore.kernel.org/r/20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de

Changes in v3:
- Use string properties instead of int for enums
- Use units from property-units in dtschema
- Link to v2: https://lore.kernel.org/r/20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de

Changes in v2:
- Use consistent quotes in binding document
- make clock-names an enum to make each clock fully optional
- drop '|' in binding description where not needed
- encode clock input mode into integer
- encode clock output mode into integer
- do not use defines for reg properties
- support setting load capacity for the oscillator via device tree
- support setting Bias current for the oscillator via device tree
- support setting polarities of CMOS outputs via device tree
- fix compatible string in driver
- remove unused struct cdce6214_config
- Link to v1: https://lore.kernel.org/r/20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de

---
Sascha Hauer (3):
      clk: make determine_rate optional for non reparenting clocks
      dt-bindings: clock: add TI CDCE6214 binding
      clk: add TI CDCE6214 clock driver

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  155 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1310 ++++++++++++++++++++
 drivers/clk/clk.c                                  |    3 +-
 include/dt-bindings/clock/ti,cdce6214.h            |   25 +
 6 files changed, 1500 insertions(+), 1 deletion(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>



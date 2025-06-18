Return-Path: <linux-clk+bounces-23151-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D084ADE698
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FEB67AAEA0
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D0728312F;
	Wed, 18 Jun 2025 09:21:23 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743A280CF6
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238483; cv=none; b=g8xG72kIP68UIkdWOOAMznbrGowGtsOcC7aNXdmu0ppi/O6WnrK4f5leDV+D8+aSDkWpAHfyF0fInCbWfpTTrNbckEy6Q7Dyd637BHRDdlv/6q4WpTofn1vwzxkSe9uYngYIhYwRy9MwS6IV2xU1+ufcJKK1OlZHH6nZtwVpHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238483; c=relaxed/simple;
	bh=8E1ehRVYoTz9WwqT1b9dtBs8b6qcwXxr8HWeBeBxMM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Eot8XNpGW5bQ3YBI+GhYLnq2svMq43slTAG9tiPq0WdqyGPleOT9f1J07GSc8R5HkG5d0VKLxRf8E/TyfvaYJD/rJ9aIQ5VLhFQ9SfNeH6jb97oWRHj/WerTZEo7vYpK7ZO7zaSJjicyw2RmBpknnyn+wlzBvNQot1lMNp7A35Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyr-0003B5-6r; Wed, 18 Jun 2025 11:21:17 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-004757-2Q;
	Wed, 18 Jun 2025 11:21:16 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-005QWt-25;
	Wed, 18 Jun 2025 11:21:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v5 0/4] clk: add support for TI CDCE6214
Date: Wed, 18 Jun 2025 11:21:11 +0200
Message-Id: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeFUmgC/3XQQQ6CMBCF4auYrq2ZTgu1rryHcQHTqTYaMEWJx
 nB3CyuCuvxfMt9i3qLjFLkTu9VbJO5jF9smR7FeCTpXzYll9LkFAhZgYCvpepHkiUtURgJZA0Z
 7wtKKfHJLHOJz4g7H3OfY3dv0mvRejesfqFcSZO0NW3BYORX2N25Oj3tqm/jceBaj1uNccAsBs
 2CgxqK2iEz1T0HPBAULQWfBW03BhaD9Fn4KZibopZA/Il1QBVuFZUXllzAMwwepizYlcwEAAA=
 =
X-Change-ID: 20250408-clk-cdce6214-0c74043dc267
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750238476; l=3422;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=8E1ehRVYoTz9WwqT1b9dtBs8b6qcwXxr8HWeBeBxMM8=;
 b=ugTiqbkjv8Qt6G0qBx990iwWKhv9rCrE7gnUekl7QAAPq79duUebJ6F907vnukpZVGiVe7Mxv
 /gsFY6xzVLCB8MTety5Hm5RnGD6xGhYPh7YQCBYgKWcyXRvhaoynRyo
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

In this round I have split out the pin configuration support and
binding to separate patches. My hope is that without the pin
configuration the first two patches are acceptable already and then
the pin configuration can be disscussed separately.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v5:
- Reword commit message for binding patch (Krzysztof)
- Make clock binding yaml simpler (Krzysztof)
- add link to datasheet to driver code (Stephen)
- Drop inclusion of linux/clk.h (Stephen)
- Add missing #include <linux/bitfield.h> (Kernel test robot)
- simplify cdce6214_clk_out0_get_parent() (Stephen)
- Use divider_get_val() where appropriate (Stephen)
- Add Rxx defines for registers (Stephen)
- Add define for magic value 24 (Stephen)
- introduce and use cdce6214_clk_psx_mask() (Stephen)
- Use clamp() instead of open code (Stephen)
- declare const arrays const (Stephen)
- more use of dev_err_probe() (Stephen)
- use determine_rate() instead of round_rate (Stephen)
- split out pin configuration to separate patches
- Link to v4: https://lore.kernel.org/r/20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de

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
Sascha Hauer (4):
      dt-bindings: clock: add TI CDCE6214 binding
      clk: add TI CDCE6214 clock driver
      dt-bindings: clock: cdce6214: add binding for pin configuration
      clk: cdce6214: add pin configuration support

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  155 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1389 ++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |   25 +
 5 files changed, 1577 insertions(+)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>



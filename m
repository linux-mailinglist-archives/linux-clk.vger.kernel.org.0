Return-Path: <linux-clk+bounces-20352-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF7A82370
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 13:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ECB13A9920
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 11:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BE025D918;
	Wed,  9 Apr 2025 11:21:19 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA425DD1A
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197679; cv=none; b=sQBFy5S0zW2XhYsVFW5K8SYOLq5Ju7XrLPHQgOP5I4sAi3Et8mjeE4HtvbZ0B3/5uBHaAghGbG8NPkDXM02iNTvsabgpiLWcubNksozC2BbexUFGlaSRMQ86cJodxEunu9y/zmaQ3eez2mbipvvFpCSPoB1I84c/K1a8jZJXdWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197679; c=relaxed/simple;
	bh=7tije2NwPJ8JUYfrk6Nbn+v7LM8+SxWVe/sBjMR5O0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dz/OFaTBq7pmp2hsjB+jMUZjRSdP+ZZ6d7T9P/rudHujyrFZUPloDyY9kErgNvfyDo2YSA89/b9JoNv7uQFx4gcD7FOcJZIwpFEeTxTrKRgfuDDHe43tn/OdVIYD2svisrOr6IgWozAJnlznMJlcnJbf8guQ3tIAlPs3mUFT9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUH-0007P8-9J; Wed, 09 Apr 2025 13:20:57 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUH-0045qb-02;
	Wed, 09 Apr 2025 13:20:57 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUG-00GOXj-2s;
	Wed, 09 Apr 2025 13:20:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/3] clk: add support for TI CDCE6214
Date: Wed, 09 Apr 2025 13:20:56 +0200
Message-Id: <20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhY9mcC/3XMQQ6CMBCF4auQWVszrZWKK+9hWGA7wETTkhYbD
 OHuVvYu/5e8b4VEkSnBtVohUubEwZdQhwrs2PmBBLvSoFCdUeNF2NdTWGepVlILtEajPjmragP
 lMkXqedm5e1t65DSH+Nn1LH/rHyhLgeLhNBlsVNfI/jaRH95zDJ6XoyNot237AlhQTvitAAAA
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744197656; l=1820;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=7tije2NwPJ8JUYfrk6Nbn+v7LM8+SxWVe/sBjMR5O0Q=;
 b=wtk51CkFO3YbZTL5b/0C5IvLP+ysM1hbgF4ZS46yRAaWSbds4EsLOrt8XfdIWFC34e1pRsfyZ
 BREidgiYMF1BlIltodnePbIalauiAdowFpHxTVkavHjtfRTSXSJTOsj
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

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  167 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1284 ++++++++++++++++++++
 drivers/clk/clk.c                                  |    3 +-
 include/dt-bindings/clock/ti,cdce6214.h            |   24 +
 6 files changed, 1485 insertions(+), 1 deletion(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>



Return-Path: <linux-clk+bounces-10196-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F99416F4
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 18:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051341F251E3
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357603DAC0F;
	Tue, 30 Jul 2024 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gWMwUH21"
X-Original-To: linux-clk@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820C189516;
	Tue, 30 Jul 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355496; cv=none; b=fypAvyOmTLBIKlQUDd3MCeMA4KFtfPq/MIZvEh/B2mSbNM6Mg+/SK89DcSsMt8hERtprk4yXMvoD4oMhVPAlk8Lkhtjc9NHtv3KW1zaH0oCq84jPsj4Ljs3xcFN6GK45W0g3qVk1gKOs2ujyf0IgCFxIgUQReYe1Vby2x19F84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355496; c=relaxed/simple;
	bh=2R5/sv0kcPZcfp8U4D6LvxVkMc81HbU12UhjhjHgemM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DsHXOSIEIIAVODs8HgpUT2WLZwnViWQhJII4w7BdToLfrqXcezj9/Y7csNx2rX3sS+zl3DJW9B91U7dF1LCosk2Cnn3NJcom9WxQgvVFbig08Ndlb6os5/+/Q7rj60KMtioyPVRAId/hzWmCRUM62ceE7cZTxa0WY461g4c1RQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gWMwUH21; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDA6CE0009;
	Tue, 30 Jul 2024 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722355485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jx5HOWIVddi0QwfCZ5fXk5+RupCYlyridzMe4GLji28=;
	b=gWMwUH214sDsLZwQvdY3rRQPWD9MMLTxJN68++nTDCMgN+gAre9HYOmWdoYuCnyRuDJz5G
	yMa+ZiPnNndUDRH2D4D6R5bSTZSi5rvFupZ01U+7Q8UvKD6DQLqZ5WxwFaOhtzRezdjayQ
	b6RlDppo1PPxi8/ovlN9Or1lIwNO3VppYMCTbG7DJe047UOzRPDl4wyk8SqlGzBrjwej+M
	rjh16oit56bYzTEnI8prf1XzT/oKF5cRcu8kTSZj24syvGuCeRrOrJ2Jb1dbY8n+TKJGFh
	AkqcRUkOzgMaMb8t7KXmdZSVsXS+MgW6LgmxL8FKHWST4XCQOUUdW4r7KJ0g8A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH RESEND v3 0/4] Add Mobileye EyeQ clock support
Date: Tue, 30 Jul 2024 18:04:42 +0200
Message-Id: <20240730-mbly-clk-v3-0-4f90fad2f203@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-GND-Sasl: theo.lebrun@bootlin.com

This is a new iteration on the clock part of the Mobileye
system-controller series. It used to be sent as a single series [0],
but has been split in the previous revisions (see [1], [2], [3], [4])
to faciliate merging.

This series adds a platform driver dealing with read-only PLLs derived
from the main crystal, and some divider clocks based on those PLLs. It
also acts at the one instantiating reset and pinctrl auxiliary devices.

One special feature is that some clocks are required before platform
bus infrastructure is available; we therefore register some clocks at
the of_clk_init() stage.

We support EyeQ5, EyeQ6L and EyeQ6H SoCs. The last one is special in
that there are seven instances of this system-controller. All of those
handle clocks.

Only clock is receiving a v3; other driver series (reset, pinctrl) stay
at v2. MIPS [4] has been taken in the MIPS tree [5].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com/

[1]: https://lore.kernel.org/lkml/20240703-mbly-clk-v2-0-fe8c6199a579@bootlin.com/
[2]: https://lore.kernel.org/lkml/20240703-mbly-reset-v2-0-3fe853d78139@bootlin.com/
[3]: https://lore.kernel.org/lkml/20240703-mbly-pinctrl-v2-0-eab5f69f1b01@bootlin.com/
[4]: https://lore.kernel.org/lkml/20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com/

[5]: https://lore.kernel.org/lkml/ZoVr8g3B7nUwRujO@alpha.franken.de/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v3:
- Kconfig: add "depends on 64BIT" because we use readq(). This removes
  the ability to COMPILE_TEST the driver on 32bit, which is fine as
  this is a SoC clk platform driver used on 64bit SoCs.
- driver: avoid `of_match_node(...)->data` because, if !CONFIG_OF,
  of_match_node(...) is resolved by the preprocessor to NULL.
  There is still a warning "eqc_early_match_table declared but unused"
  if !CONFIG_OF. We fix the <linux/of.h> header in a separate patch:
  https://lore.kernel.org/lkml/20240708-of-match-node-v1-1-90aaa7c2d21d@bootlin.com/
- Link to v2: see [1]

Changes in v2:
- bindings: take Acked-by: Krzysztof Kozlowski.
- driver: eqc_auxdev_create(): cast the `void __iomem *base` variable to
  (void __force *) before putting it in platform_data, to avoid sparse
  warning.
- Link to v1: see [1]

Changes since OLB v3 [0]:
 - MAINTAINERS: Move changes into a separate commit to avoid merge
   conflicts. This commit is in the MIPS series [3].
 - dt-bindings: split include/dt-bindings/ changes into its own commit.
   It is part of this clk series.
 - dt-bindings: Take Reviewed-by: Rob Herring. The include/dt-bindings/
   new commit has NOT inherited from it, just to make sure.

---
Théo Lebrun (4):
      Revert "dt-bindings: clock: mobileye,eyeq5-clk: add bindings"
      dt-bindings: clock: add Mobileye EyeQ6L/EyeQ6H clock indexes
      clk: divider: Introduce CLK_DIVIDER_EVEN_INTEGERS flag
      clk: eyeq: add driver

 .../bindings/clock/mobileye,eyeq5-clk.yaml         |  51 --
 drivers/clk/Kconfig                                |  13 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-divider.c                          |  12 +-
 drivers/clk/clk-eyeq.c                             | 793 +++++++++++++++++++++
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 +
 include/linux/clk-provider.h                       |  11 +-
 7 files changed, 844 insertions(+), 58 deletions(-)
---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240628-mbly-clk-4c6ebc716347

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>



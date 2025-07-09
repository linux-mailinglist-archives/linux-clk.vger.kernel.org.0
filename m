Return-Path: <linux-clk+bounces-24397-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF6AFF2C6
	for <lists+linux-clk@lfdr.de>; Wed,  9 Jul 2025 22:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32441C85BB1
	for <lists+linux-clk@lfdr.de>; Wed,  9 Jul 2025 20:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD09824418F;
	Wed,  9 Jul 2025 20:14:20 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB7243954;
	Wed,  9 Jul 2025 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092060; cv=none; b=oDZ3NQgLCsnQQ/EJ4vWrLCH88Qv0PyofFXTrgYZbigI1d0rZggqz91SIW1CSdeMIKzoLUipMA2y8zCgkxOV3jaTN5Ib9sYyKsRA2RRaun/L7ZJXImTVzn01yTDAl0YpO//I5ip7yEP1de3uZco/PBhH5Deg5eU4UaEBo6QPWBOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092060; c=relaxed/simple;
	bh=baFOyU5jXIBmGqiXM+xoPbfVkQZ75rSm/M3/gWwE1SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZTBLh9tAvDJ2sADTGfgJ/Ccn5dQ9o9Qqyhz2lFKSJPm+y+jwykKaX+UrVrGOoH+mdn5+rz7bM7mctYTft5mrAjmylxhGbQvZsA+ABZDSrodK5ePZ+JY0BfWut3ipOmyL/Z82uRLC95nxmwEMfAwj6qIrKdorJQw/vIuxk/hYMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA42DC4CEEF;
	Wed,  9 Jul 2025 20:14:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:14:11 +0200
Message-ID: <cover.1752090701.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit b7c26cbd5b704a350b3176669f47047153903bc9:

  clk: renesas: rzv2h: Add missing include file (2025-06-26 16:28:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.17-tag2

for you to fetch changes up to 0ab2d84f94dae48c3e7605cdc99dbb4e7c7b206a:

  clk: renesas: r9a08g045: Add MSTOP for coupled clocks as well (2025-07-08 11:36:16 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.17 (take two)

  - Add Expanded Serial Peripheral Interface (xSPI) clocks and resets on
    RZ/V2H(P) and RZ/V2N,
  - Add SPI (RSPI) clocks and resets on RZ/V2H(P),
  - Add SDHI and I2C clocks on RZ/T2H and RZ/N2H,
  - Add Ethernet clocks and resets on RZ/G3E,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/N2H,
RZ/T2H, RZ/V2H, and RZ/V2N SoCs, which are shared by clock driver and DT
source files.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      clk: renesas: r9a08g045: Add MSTOP for coupled clocks as well

Fabrizio Castro (1):
      clk: renesas: r9a09g057: Add entries for the RSPIs

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g087-dt-binding-defs-tag2' into renesas-clk-for-v6.17
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag4' into renesas-clk-for-v6.17

John Madieu (1):
      clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs

Lad Prabhakar (10):
      dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
      dt-bindings: clock: renesas,r9a09g077/87: Add SDHI_CLKHS clock ID
      clk: renesas: rzv2h: Drop redundant base pointer from pll_clk
      clk: renesas: r9a09g077: Add PLL2 and SDHI clock support
      clk: renesas: r9a09g077: Add RIIC module clocks
      clk: renesas: r9a09g056: Add support for xspi mux and divider
      clk: renesas: r9a09g057: Add support for xspi mux and divider
      clk: renesas: rzv2h: Add fixed-factor module clocks with status reporting
      clk: renesas: r9a09g056: Add XSPI clock/reset
      clk: renesas: r9a09g057: Add XSPI clock/reset

 drivers/clk/renesas/r9a08g045-cpg.c                |  6 +-
 drivers/clk/renesas/r9a09g047-cpg.c                | 64 +++++++++++++++
 drivers/clk/renesas/r9a09g056-cpg.c                | 37 ++++++++-
 drivers/clk/renesas/r9a09g057-cpg.c                | 63 +++++++++++++-
 drivers/clk/renesas/r9a09g077-cpg.c                | 15 +++-
 drivers/clk/renesas/rzv2h-cpg.c                    | 95 +++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h                    | 24 ++++++
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |  1 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |  1 +
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |  1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |  1 +
 11 files changed, 297 insertions(+), 11 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds


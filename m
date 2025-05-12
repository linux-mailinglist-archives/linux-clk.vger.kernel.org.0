Return-Path: <linux-clk+bounces-21774-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D0AB43C0
	for <lists+linux-clk@lfdr.de>; Mon, 12 May 2025 20:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2587B8E03B1
	for <lists+linux-clk@lfdr.de>; Mon, 12 May 2025 18:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E848C296D3F;
	Mon, 12 May 2025 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cU749Irc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CB2550D5
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074739; cv=none; b=qBJYdMc+IZS/Y+cK9bpZ1xm7AWDRydTm7BZlVc/4lyiPepl4WHjHWE9KqKFntSXCas/7dtbxDZyyBEL++BqcLtoN9rlLa4Usskks/tY+ytO7ULUykRHeveiw9JKWJTSOuzW8Pvyg/Yuyq05iVE1Tfnj4Mg5pG9uyIZ5Eljpn+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074739; c=relaxed/simple;
	bh=cNV23VwDv69uP/6gK3LiM6nRmaksJESB2bF4ACMarY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oObiRsQ8GJIOUWFDJDLTJIXqwzK0iFVXVent+oVgOvStD7bqoo+/VluTLA+bbnG/+lWzJoZ0gYBIHcBiJuCYZPyUyFRwX7WiMZncCojD8tRxBfPelwaNM7mzHlBMs6nCjhrrZZkd+jJFhaPEofSaAjEEXbgpVSRU3/uHHNKrpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cU749Irc; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d93f4fe5baso17960835ab.2
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074737; x=1747679537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5sF5S4WoA46QFbSi1L1CMmO0LFLi0JLWxGsdZ5Mz7U=;
        b=cU749IrciPjXrHx2fhWyvGMb/qTrNjvRZpEZGr893F5i03EpAfAQyclrTRVEJfYsAE
         k9QWG3o5SURb1ZU2EEvErQ1mW/A6ItF7WOu2T+zZq3iaLtiExL3Mm9Itj61YzJZmPr5t
         1HltxQqK1CH06+HtfP1ax6IHlvV54ydBSVTRHplFmYAovm5Csqxb/wkgvX7PzDnXgF/k
         C8F5BHIZkTrayr0bXLZF3UTbuanU7H4jf7F/ZFW+3DVLJYNAx0Wy9S1Fik9Boqiy4RLB
         xA47f784jXjsU6kvI6c2ywYo1BICwRrG/58NPsoR0zUwiSUQKx+j0EpaS1Xxm0iiNach
         z9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074737; x=1747679537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5sF5S4WoA46QFbSi1L1CMmO0LFLi0JLWxGsdZ5Mz7U=;
        b=RQbFcEUsppsINXXygPVVOf6khsC4maWpatbzMQShBts0vmb4Kt9BsCZZo2q6qT5QKs
         es0+rzRUfpCaXScDA58fKPgQMTgp+IrhGGp3IOiMlKWzfXe1kA6wfT3kd61juu6Gi/33
         kngR54s37AWqw+1o2TC6norzKFsWAILQkKwrdGNKhhBeIx9GY16Cfcv+z3Lnb0n/vIt2
         mTrrWqJplyIgPdkNJz8Z+XI7v/UMQuq5JA3aKAXKqaPKJdHjXBaqLheShwzPNLbDQp2U
         k+7dwZPGQUEJCBNX/GM7RkrKArgNjBx/PGvsAlHEDZPeGfG3eIlt14Pz/phDaAHlF3ko
         SCEw==
X-Forwarded-Encrypted: i=1; AJvYcCVrUXsaYIblIFcPzIS0B+ZkEAgJqouuqmAkdduy2HgtYdflHhFriA/tla42vd2ch+Wh9F5HL8rFiIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/ihIlBWdDGHvP8IRgG7D4cA6AN8Y+WjBScWBIzwCFXKO3urR
	N6ZSs1RQXBzNPKmPyTAHjyWw85HJTw+KqMGb6WX2zAqWmV5KLczBhbXq4PKWPIA=
X-Gm-Gg: ASbGncuLXFQpf4qL/+xihMEQ/WeupNTtdPi4ll/Kh666pbO0RHszQ96VhA8EkjqLl9i
	D0KLr/pHdOAe8r7g9oCnVLIwTBOPyVpLypQ1hh0ScqyZEsghMZgrj7HPHtG4CDtoyh4HhqOvXRc
	wJMEyrE1wZAFRrb2D9PpRlOdfsh9mmD2vPWORkSLxAyaXXs272G2ElL1aOvJyX1gzkRHntddiw9
	bRdaxiwMwZAZewMHFLxswSnsywo7xU9rKIEDXXLDzpU94GvIAnnrsUj3+eFbSMmMzvN6jict7G+
	Cr0HsV2L+ir0n55WslBd8CdhXLzgoY+WYTXZeleRa5MlPD72KR2OXzV/oSV6k+L8AxyJyrluqrP
	db42LlBaePCrIsg8ufQsrNEdm
X-Google-Smtp-Source: AGHT+IH8SMFCBxxWn3abIuKGOB7o7zwQCx8+T8NAJEP1pyotvXX4Tn/Jp/UkbpGJ3ju1m6yqyuZcVA==
X-Received: by 2002:a05:6e02:1fc5:b0:3d6:cbed:3305 with SMTP id e9e14a558f8ab-3da7e1e7608mr156233785ab.10.1747074736564;
        Mon, 12 May 2025 11:32:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] reset: spacemit: add K1 reset support
Date: Mon, 12 May 2025 13:32:05 -0500
Message-ID: <20250512183212.3465963-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

This version uses ida_alloc() to assign a unique auxiliary device
ID rather than the value of an ever-incrementing static variable.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v9

					-Alex

Between version 8 and version 9:
  - The auxiliary device ID is now allocated using ida_alloc(), to
    avoid colliding device IDs, as suggested by Philipp.

Here is version 8 of this series.
  https://lore.kernel.org/lkml/20250509112032.2980811-1-elder@riscstar.com/

Between version 7 and version 8:
  - The structure containing the auxiliary device is now allocated
    using kzalloc().  That means its lifetime is not tied to the
    parent device, and auxiliary device's release function is
    correct in freeing the structure.

Here is version 7 of this series.
  https://lore.kernel.org/lkml/20250508195409.2962633-1-elder@riscstar.com/

Between version 6 and version 7:
  - The new shared header file is now named "k1-syscon.h" (suggested
    by Haylen Chu)
  - The SPACEMIT_CCU_K1 config option has been removed (suggested
    by Philipp Zabel)
  - The SPACEMIT_CCU config option is now tristate, and selects
    AUXILIARY_BUS (suggested by Haylen Chu)
  - All code is concentrated into a single file "reset-spacemit.c"
    rather than in a directory (suggested by Philipp Zabel)
  - A bogus return value has been fixed, and a few irrelevant comments
    have been removed (suggested by Philipp Zabel)
  - MODULE_AUTHOR(), MODULE_DESCRIPTION(), and MODULE_LICENSE() are
    now supplied (suggested by Haylen Chu)

Here is version 6 of this series.
  https://lore.kernel.org/lkml/20250506210638.2800228-1-elder@riscstar.com/

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

Here is version 5 of this series.
  https://lore.kernel.org/lkml/20250418145401.2603648-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/


Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 755 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
-- 
2.45.2



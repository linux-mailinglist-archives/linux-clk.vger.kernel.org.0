Return-Path: <linux-clk+bounces-3291-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A73849DE3
	for <lists+linux-clk@lfdr.de>; Mon,  5 Feb 2024 16:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A542287328
	for <lists+linux-clk@lfdr.de>; Mon,  5 Feb 2024 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1942C86E;
	Mon,  5 Feb 2024 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="ZXjQNScE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC12C85D;
	Mon,  5 Feb 2024 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146580; cv=none; b=FDwFvx7yX+pwIiKwy27LaZB0MsugGYFZgQJSEXEX0AB2lphZRDuSJeuwL//118Hb+Sxj4/bpSwCAlXicRRxhn2rJffEeiEoZC5dLOFvouFkcQ/GoHgFoZk3HdpPqhiRuHdLW6UgE3d7J5F/iHwj4LPgOqtwKQK+q6IRFs0OiqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146580; c=relaxed/simple;
	bh=5zewW1sTOm7xcvwNa8TfsiT0OyH+Ac61q0oCG1IJ5yo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J+q999+tto3ChA1GRctvR/GfP3BnfmNoJOjLdCCyT1BCvDO2KOVGysVplnSp91Eq3wexE9eYs8Vpz/ZeHykqhj1z9kLU7gAVc2CK+2p8qjAR+DElZ+2/pTXNTlUsDgtd2BKuOORrYItjEMHzeaAGGhkwKswZ2atBJhn2AjjpeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=ZXjQNScE; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4TT99g5Pc0z9t3b;
	Mon,  5 Feb 2024 16:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1707146567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=02ruNxK++PAViNf3AQJm4dGqBoNl7wJTiwKpbNLSczQ=;
	b=ZXjQNScEzCDO5NsBo6jCxc7YVO0UavM3fURJA02d2ggdkgyTOadBMCFAiGtdL0hSZM+XBb
	AvrfdmRiQ11Ft5QjNjBNDq+3/GuKmqGHuR4xpUR0fqvVgQfDPlxU+21lQON76gnN4fgChs
	5/txjXryAkW91io2nbW80T03qpUXIgTiDDQnXDTKdOdrtEcxwjf1piZKGY33HeJP5Mq6np
	4ZwEIXIN5T+Tvn1RfxJGdCLHzRJw1IbYiXlIFUY2bCVVBfnU44TaOG9+y9ecOlNy1/iVOW
	i4iPtDI/TDl4HC3mJFeHoLpoEGt6NxHM1XHpt1NKH8VZs6R1JUu9/gcf60VWdQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH v2 0/6] Pinephone video out fixes (flipping between two
 frames)
Date: Mon, 05 Feb 2024 16:22:23 +0100
Message-Id: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/9wGUC/32NQQ6CMBREr0L+2m9oMUhceQ/CAttBfoJt05JGQ
 7i7lQO4fDN5MxslREGiW7VRRJYk3hXQp4rMPLonWGxh0rVulFYdB3EIs3fgsCw8yRuJa2PsZKG
 vDS5UzBBxFEXsh8KzpNXHz3GS1S/9v5cV1wzddI8WtrVG3f2yvkbn0tki07Dv+xePHWdPuQAAA
 A==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3229; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=5zewW1sTOm7xcvwNa8TfsiT0OyH+Ac61q0oCG1IJ5yo=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlwP0+wYhW9UKwddP3vrnpyhEsFoFsaicaYwiaO
 2dmOF/4eR2JAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZcD9PgAKCRCaaaIIlErT
 xxGkC/4qc4crIa5Eoj/UZwfbXARGqeQPX8RtVBTso0IlLQapsMZarACv3napgYyiG3p/WOCGiPt
 YCNMoHryUaHjF9Dvyt27XXm24Fu7eA72vSJ3Po72R03TumUH6G1vDdE/ht0humpzOoDyXoJnogU
 ujW0CYknGItVUQtqBcfAU1a6GeqU/I1CpgzQQi6SMusrjZju4TZBSE6JU/zuhlqSDDVr6P6pkeQ
 CPyXTpiGu9xJLcA1VxMIOmXx7GtY7tsJNkFKhzSaOAQMfZOz8n+2+wFbwwkPEWSJ8+p3dVXP2Md
 clqNDRWt7asIY8cu4HNR9ZIkJqI600PFe/4W+UHMNwq45v8qHSuc3cP3aXmsiifk+h+fll2awdg
 iQmNzjJQV4+nIxSxPY5HeovLW5/tTXa2aq8O8TCppSjMewGW4vuRZVRJg6euwTSVKIpf7CDGUUD
 TPd3iE6/EWTYbW8dmVNfGuRrmExcg1/7ePbYZL2xoS59qt2aPgmKzCWMFovCf66jj8udc=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7

On some pinephones the video output sometimes freezes (flips between two
frames) [1]. It seems to be that the reason for this behaviour is that
PLL-MIPI, PLL-GPU and GPU are operating outside their limits.

In this patch series I propose the followin changes:
  1. sunxi-ng: Adhere to the following constraints given in the
     Allwinner A64 Manual regarding PLL-MIPI:
      * M/N <= 3
      * (PLL_VIDEO0)/M >= 24MHz
      * 500MHz <= clockrate <= 1400MHz

  2. Choose a higher clock rate for the ST7703 based XDB599 panel, so
     that the panel function well with the Allwinner A64 SOC. PLL-MIPI
     must run between 500 MHz and 1.4 GHz. As PLL-MIPI runs at 6 times
     the panel's clock rate, we need the panel's clock to be at least
     83.333 MHz.

  3. Increase the minimum frequency in the A64 DTS OPPs from 120 MHz to
     192 MHz. This further reduces the issue.

Unfortunately, with these patches the issue [1] is not completely gone,
but becomes less likely.

Note, that when pinning the GPU to 432 MHz the issue completely
disappears for me. I've searched the BSP and could not find any
indication that supports the idea of having the three OPPs. The only
frequency I found in the BPSs for A64 is 432 MHz, that has also proven
stable for me. So, while increasing the minimum frequency to 192 MHz
reduces the issue, should we maybe instead set the GPU to a fixed 432
MHz instead?

I very much appreciate your feedback!

[1] https://gitlab.com/postmarketOS/pmaports/-/issues/805

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
Changes in v2:
- dts: Increase minimum GPU frequency to 192 MHz.
- nkm and a64: Add minimum and maximum rate for PLL-MIPI.
- nkm: Use the same approach for skipping invalid rates in
  ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
- nkm: Improve names for ratio struct members and hence get rid of
  describing comments.
- nkm and a64: Correct description in the commit messages: M/N <= 3
- Remove patches for nm as they were not needed.
- st7703: Rework the commit message to cover more background for the
  change.
- Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev

---
Frank Oltmanns (6):
      clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
      clk: sunxi-ng: nkm: Support minimum and maximum rate
      clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
      drm/panel: st7703: Drive XBD599 panel at higher clock rate
      arm64: dts: allwinner: a64: Fix minimum GPU OPP rate

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  4 ++--
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++----
 drivers/clk/sunxi-ng/ccu_nkm.c                | 34 +++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h                |  4 ++++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++------
 5 files changed, 56 insertions(+), 14 deletions(-)
---
base-commit: 059c53e877ca6e723e10490c27c1487a63e66efe
change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>



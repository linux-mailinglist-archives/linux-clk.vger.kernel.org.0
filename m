Return-Path: <linux-clk+bounces-9095-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C355925B6A
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 13:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C5528D329
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036EE1849CF;
	Wed,  3 Jul 2024 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="4LCoQwh5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GdqhEEZr"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9161849D2;
	Wed,  3 Jul 2024 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004118; cv=none; b=BnQQa+DxW3ae133TrIMlMOhBoi3VlNXpl4/k4Tegl4F8Gq+hoXzhX0lFsnN4uJLak5FoY4Uhpby5wpp6sr3dxV6v+yx29iAPrXcCmYtZqDbX9BimIrraAbqMyX2ZNCeGOQQjb706Y3/jJaVG3Vb1ZiCdcoyoljXs7zXYvtiLgm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004118; c=relaxed/simple;
	bh=F1suG1ipHrJUf4eS+/Lq3dMO4C2hVzcUUnE2H+8tGfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWYx5XWcphclZp6msMqJkb2eRsI2vyOnFSouQFJBwXTBR5uQboZ7BuHrUJA4dGfiGTLe0srtLAo0EY57QXV/8KJa8TZIwNBfEYIQVSPof/wJujqQHHihk6MSsDhDquuBeIAvOBMtxUN3P7So4Fqci7vdiO1tc0RoI7RoZpqbEwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=4LCoQwh5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GdqhEEZr; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id F26BA1140376;
	Wed,  3 Jul 2024 06:55:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1720004114; x=1720090514; bh=vs62ryDaMf
	6gufs3103lhRbx+iKi8lU5Gpy0zOHMQBg=; b=4LCoQwh5fKFXSKcx9Q9u1XjFwV
	WNQ7Gyi1J6mwyoTbE5O4H5TH5eN9sajIV7TUNm336t3reKUDRH/Dn3ibaQny52Jv
	b5bDFTio8m7M66KSf3Tp3zedWQVkFG9O1MsWObqv0CAZTpulOVt3Aa7ko2qjeD4G
	H6NdBpgByCUV1OH8FpPyrBZa1IDoHpeqqBUVoLR6FjmM4PMWjdEGD/eYojgR6UpP
	Lbtf2mj7kpxzOmF7YjA9De9KNb9wvRqywcOBP12im4tCCf12sCX4RSBTlL92O8xb
	DjieSrFh6bw5yJDO+8Gt1l2DY9e7qKixac2moyqHk/Ev+gqwAEdogK2iMlUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720004114; x=1720090514; bh=vs62ryDaMf6gufs3103lhRbx+iKi
	8lU5Gpy0zOHMQBg=; b=GdqhEEZrlVq5wrREmg6PF2+7JUsibUzz2vO+rD+rfNTC
	A4iVWbLBWlDLCdvE1Y+BaRQ2NJTCwk262X1fyV8xWfS20eo7j8fH/GmpGF2ULims
	DrPOHgP+zuR89LTb3RSyjeDctgn7Kf1yg8K3souYW7xdq6EdxebXXncs9WUur3L6
	kWj+dOGJcdt470/ByIETuTv42aRyNjULnbJwqcZ4miPHErSxuNg24OfoMZpWmAmZ
	gF8nN/ioKjXdLo3nnJRrbu7qRNTq340GRvfiyoK2Cyi01tJzFFmg49Ds8ntM9VPY
	9fkqYZTL5xXA3yrbGqjELcZsUbvB+Fqr6DLpWU9OJA==
X-ME-Sender: <xms:Ei6FZlTPLJzih3tweTMfEwFyc7S6LdcXDqdek1yn9w4ujzuEQCxJ7w>
    <xme:Ei6FZuzavwJSUfYDxX0aLZmENqX56VJetC4ltBdyoQl6w4JQA6duknxhMK0sJmtSR
    SnL8brRAo62MPgzrg>
X-ME-Received: <xmr:Ei6FZq2WUPvOFtrSY0pBcm_CZRbbd2IbXPA5lmcoyjv7qihhcjirUt4rIwSqBRy6bANKQTQwgzsLq9M_IzH0Jqo73bt5sd250ngvwxOt3RHw9UY4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepuddvueduueegtdeuffetveevgeehhedvhfefudduveekgffgfedtheegtefhhfff
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Ei6FZtABD5vhZhse_bocN7k3NlOQJ_q8L9fh8Ps3ZIBXLBbvtAVmeQ>
    <xmx:Ei6FZuhpCMmG1AHZOC2COEvRrqarMP6XjbX_POY_tDaLA-bHpZWz_A>
    <xmx:Ei6FZhokgnozwKfYf1K0ihB4nCRWGXMOrd1-tEB1WCR3r5JdW5mLZg>
    <xmx:Ei6FZphMblzfcNWXsDtHGRhCyv7etjtL9zEWhIXlHx06w8zj9TxoDQ>
    <xmx:Ei6FZpQjgPdTxhLZA-A30oZ2asQke32lipyzofAgRtVtQ72WF2tnZxoJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:08 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 00/23] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Wed,  3 Jul 2024 22:50:50 +1200
Message-ID: <20240703105454.41254-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

V2 of this patch series adding support for the Allwinner DE33 display engine variant. No functional changes from V1, fixes and review from previous V1 added, and correction to DT bindings.

Original blurb below:

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-16).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 17).
6. Add DT bindings for the DE33 engine. (patch 18).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 19-23).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

Jernej Skrabec (20):
  drm: sun4i: de2/de3: Change CSC argument
  drm: sun4i: de2/de3: Merge CSC functions into one
  drm: sun4i: de2/de3: call csc setup also for UI layer
  drm: sun4i: de2: Initialize layer fields earlier
  drm: sun4i: de3: Add YUV formatter module
  drm: sun4i: de3: add format enumeration function to engine
  drm: sun4i: de3: add formatter flag to mixer config
  drm: sun4i: de3: add YUV support to the DE3 mixer
  drm: sun4i: de3: pass engine reference to ccsc setup function
  drm: sun4i: de3: add YUV support to the color space correction module
  drm: sun4i: de3: add YUV support to the TCON
  drm: sun4i: support YUV formats in VI scaler
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: vi_scaler refactor vi_scaler enablement
  drm: sun4i: de2/de3: make blender register references generic
  drm: sun4i: de3: Implement AFBC support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support

Ryan Walklin (3):
  drm: sun4i: de2/de3: refactor mixer initialisation
  dt-bindings: allwinner: add H616 DE33 bus, clock and display bindings
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  49 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 141 +++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
 20 files changed, 1280 insertions(+), 210 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.45.2



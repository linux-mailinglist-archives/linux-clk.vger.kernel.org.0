Return-Path: <linux-clk+bounces-12497-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DBA98942B
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1FA1C234E9
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759B61422BD;
	Sun, 29 Sep 2024 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="yMNaKSGG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4Jhu2CT"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1813E881;
	Sun, 29 Sep 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601146; cv=none; b=Wzd/ug4+HbMGWpnjGHnq/dOR6WFPoYB0F72MC5Q7NUFuHj9oT9M9euF59OEnrwnIyraWf7xOvMxjCJQsBi2iHOaAvwXT29G1J8S/kiSMl+id3B/cciRzrS4HS/iAaTpBpxiqDnKINoY3ky05gjss8GTB0osC5f6oyzhacBYk4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601146; c=relaxed/simple;
	bh=op6Am6mnV9uhbauhy+Kqw0DurjlaAhAuqwuuQIBlcPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgP+AwiyuLXA1TEwGHz5VlHNBxtaUNvx6jXAnmTxaAOk91+kGt74A0yj82z5aIWL7sab48zkJHQTfD2HRIL8FhZ9VdQ5EYoUIGtEkoVc8+RJiPyEuSSAn+e0mKUsG1VV36FcV1Z25xU7SMW0G0g7bgCBoxvhtSKgU4g7runpoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=yMNaKSGG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N4Jhu2CT; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 384B011401F9;
	Sun, 29 Sep 2024 05:12:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 05:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601144; x=
	1727687544; bh=UUs9KKw9gM7Rm8ttFhQy8Tmz+91u9KDG5MSJ+Ys1Ptg=; b=y
	MNaKSGGaUUpuUEQFbNMSpVWdr/gMdkV9t4Bcy0pyDnP4l9AL1f3j00NOwPKkObGA
	e6tuT7cNtzMStKFBn03o6kr1rJyVcPPQb3YT5x8i+a08714DFc3p6RFFinTjPe1B
	PY6lkIoqmuH+faFykErGTTjQCDG3hc1KFUEo0kHLAyi+ozXBeYK8faJORtDATgKj
	WNnMEldCFgPbULg1Yqz4zrDEt9ZMWU55yNGOyhBnVg1OB/TlPqJ62hQzBBW2A+6j
	3YUJ96drqV+7uPAvF7EBK0/Bt69flt80qnoNT6xYmjuQd7cJqmvk9wt6DgLXXNBZ
	ab+MuMjk62V3Mcjkima8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601144; x=
	1727687544; bh=UUs9KKw9gM7Rm8ttFhQy8Tmz+91u9KDG5MSJ+Ys1Ptg=; b=N
	4Jhu2CT9RO7m0v8ObUm1L4Ayz7aiNSvZohLLspVdcL3g/a7VarSK58P8pcBH7Xfo
	Zua8Hk9U3UAiITfq/CWeYmnc6ZURxxhco5+mVkoka6Fays/t20hDswt5Y9/eTdqh
	1LgZ2aRWUPpchzn019EUq5BKfybxxw2oH+ihZFZf/FhyfQdvahCYg+OwLuL2NMau
	Yr9wFj8At9DLjXGgEffsAoty0W4j6hOJJQEVBEPByikysaUG2bbxD5d9bZhrjDL+
	qW74zV/Ww4I1fOjBS5H2AuBACP3CsmnbK++PnrRIPHeU2tEl3O+2ohU00P8SUe2s
	WQ+e5OF99MkjtDInKkOuw==
X-ME-Sender: <xms:-Bn5Zq7FC9hT9AbyaUOigs9nN2JJf_g8Oy6iZqb9SATh7NGY-HDRHg>
    <xme:-Bn5Zj6b-_jtCdQK1JMkazDnDgUGaLkwSf0xIPRoR4DuyjuqMAgEo4E0dxZZmOaD7
    xIs9rqhdUu4APmfww>
X-ME-Received: <xmr:-Bn5ZpclI-lLGvcnvwFdsWxuMeWXt0EoMAmCBkjwLDfH1pvESJdufpzRnoHB3tyUaSNhvTZUnknWedLPU856KpO2RyOp2mhQfcNSt74HgKFHwH1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-Bn5ZnIX1LV4YflAgYNdUGBi4YLKoPK-GwGn8w7Ewqb0vrjGldA5Vw>
    <xmx:-Bn5ZuIruq20qnj2E2DsbxO-Y64BcfmKL9YPU0YE7SSwUQ4BFT0QOw>
    <xmx:-Bn5ZoxX8CwzojipJYgLjwK2cyAiCwbSrf413fEz3o_JJE0CW0C2ow>
    <xmx:-Bn5ZiKgqqAhNVRlvFWWn6DeeevZboeL9yfviJ-L-KT66hCLdN5wEQ>
    <xmx:-Bn5ZriyJWhipFFLJgdnRt9-Sv1dkBb1EjulVMGXzDMPduS_4WS2YMmJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:12:18 -0400 (EDT)
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
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v5 09/26] drm: sun4i: de3: pass engine reference to ccsc setup function
Date: Sun, 29 Sep 2024 22:04:41 +1300
Message-ID: <20240929091107.838023-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929091107.838023-1-ryan@testtoast.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display engine by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 68d955c63b05b..8a336ccb27d33 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = engine->regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.46.1



Return-Path: <linux-clk+bounces-10795-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001D955A32
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843091C20CBF
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F851155C9A;
	Sat, 17 Aug 2024 23:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="k0mDgGKS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gI0s2Gkf"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCE155A5D;
	Sat, 17 Aug 2024 23:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936065; cv=none; b=UoNGnSMRTfEq9fdnMPM5MUr3RfVEuAZ4qdBWA9zNO0oEyRuAn8LFgv8U9O1ks+zKbmH+PBnfIhpPiBq12nurPM9bbOgN1rf9m6goivb2Njr88yuSUGc26MaQV42aTnURvhR0Pvku6tCRPt9QwYzNJln0PBRPrtzoTsJzybp5mcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936065; c=relaxed/simple;
	bh=r35YfemdwT73QURe5l7/WCZdj9AA2a9g5iNcaprPdF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9OVf95c//5T6F5ql/AeRYXyAe/61yfe9FbrTG+QQ/JaGyBHFS9wqQWtAG6Tnlzbjm+DlQ47saVop8RCzpVkFOM1Zhk9vYinnuZAyg2WGx/Djo9fpwtXOH7x7Zi3hIgoZ6Omv1oiJj8AN2/BclPJc/MSKAB0LoxALz3jWvEe8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=k0mDgGKS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gI0s2Gkf; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9621B114EA0F;
	Sat, 17 Aug 2024 19:07:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936062; x=
	1724022462; bh=VqahAE700W/AawmVXgkFnZMPvIbd2XZovOFuVBHg+zc=; b=k
	0mDgGKS3N5ipbsQ8QeePkjUVJHAth+D7aonNUIP1TPjmjXviciqQF8Rb8/vTJHV6
	bUyLeVIXo3PxxkgapaW3XBTKqlszPyWUnfSorWpP9hIYkeFrJtEhQjHNapFVKET8
	6Jk1ZPlrE9VcIgal6WakDakv50O940Cx6mgQum+z0BYIbjr8dbP2fyHtVitxeaRl
	0sCRUdyZA56pS+iGuWhPqFALzTaD8QhrpazZTeJ5ojLYeMeYqeY9c6PotwUL6bTF
	6n0JM/YAJ+lseITtI+v9424+L61EGGoct0LxRCVo90+csLrGvMKaTh+ARPQlxobc
	bcdgLFSoDGntAzXngYq7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936062; x=
	1724022462; bh=VqahAE700W/AawmVXgkFnZMPvIbd2XZovOFuVBHg+zc=; b=g
	I0s2GkflEEs/1igzXjhl9YUV5R/7bG0a3t5rJ5igvHAhTFCnvbOTQv1FwrKQPonf
	dVDR85jl8H4JFn3HyliC2J9xI948t8+SjhSyFzLNW2Ifayd+VV9S92Xlx9T68PZd
	Ih1b288INxJYAtwI9zI6sXsAMbrAz6iku+5CMngN3Ps3YJJF2/CAoPLPZ7OGNlpC
	JxB4ascy29RdYacNUMBZzKhzKhz8rAVTN4RZKzzAkPWmpwtIT89TMg5Bb2y6MzhP
	pzD5W8hzxg8qU29XTZZtet5n/j+VZC+5MH1/J59J6ulWBbxMHajwFUuYqyMPX+/8
	DrkNILmilUKdo9M/K2vvA==
X-ME-Sender: <xms:Pi3BZjTvETjpySNXOeyi20ii_T1aeaFy36rO2yxg8GLdcY0QMX-cGg>
    <xme:Pi3BZkytceA4Pht7N-R4uJiFCOy-scLt6585z8xm2z4FThBYuFezjy-KWoF7ti2od
    HJNA_bajv1_EZdA9g>
X-ME-Received: <xmr:Pi3BZo1piVPk6irnKJrjqGbC9R3O33ghvXH8x7bj1r-eFGJnEd572arFEC3tkgdXDmbzXOsljsbNdJ6CUS4WMBgkYRr8i9dogT1PwIXUWbJ1x9RK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Pi3BZjALNt9mU2onD3H_CHBgN_ys6WUogDBfl1-MvGBXeaWVNtd1EQ>
    <xmx:Pi3BZsink8SLUROa7kyqSeyRJGAyta-g0huc6aO2jQqJRJ_aPVZihQ>
    <xmx:Pi3BZnq84vgnBRVbXk2kkKkE1HlpTO69ytBXYsndjo1Vz_cnep1PMQ>
    <xmx:Pi3BZnht9ayU5rPgY8e9Iskz7iao3NA4j7OlU_aBr5yhfMwRxgx0JA>
    <xmx:Pi3BZnSz0q6gFxf8jZZoDMWbdrcTUPB2AlSq8gD92PmBv8Pb4Px_yR6y>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:35 -0400 (EDT)
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
Subject: [PATCH v3 17/26] drm: sun4i: de2/de3: use generic register reference function for layer configuration
Date: Sun, 18 Aug 2024 10:46:04 +1200
Message-ID: <20240817230503.158889-18-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Use the new blender register lookup function where required in the layer
commit and update code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--

Changelog v2..v3:
- Refactor for 6.11 layer init/modesetting changes
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8871ca2858c80..23561f122a2b6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -277,6 +277,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
+	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -316,8 +317,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 	}
 
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index cb9b694fef101..7f1231cf0f012 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -24,6 +24,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 					int overlay, struct drm_plane *plane)
@@ -52,6 +53,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -60,6 +62,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -104,10 +107,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index e348fd0a3d81c..d19349eecc9de 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -55,6 +55,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -66,6 +67,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -182,10 +184,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
-- 
2.46.0



Return-Path: <linux-clk+bounces-19282-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283AA58F77
	for <lists+linux-clk@lfdr.de>; Mon, 10 Mar 2025 10:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D6016B474
	for <lists+linux-clk@lfdr.de>; Mon, 10 Mar 2025 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9D2253E1;
	Mon, 10 Mar 2025 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="GSpOcWtZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fNCwWHnI"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2680F224AF8;
	Mon, 10 Mar 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598681; cv=none; b=RzisjxN0LWG1fvL/PpAlkha7MEIX9O6bfBbkSx+mWA43wRsTlypIEiYvPbeooviESNppG1bexpn9bwrBaSiAX8bHSevJlLvtPIibHvKevm4nW6oAG07p2od/dm0oU1BUN4Ei5ecLx63gjKIeYOg+Ysw7pcvqOXLW5vZ//I23/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598681; c=relaxed/simple;
	bh=XdCEai64iKK6BZTw+f732GMR7lraqoAsF7mzKSJu0p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qut8s8hBUOCDtjixm2pIjEIlyprT6f8UnJsd3XGQuhd9SijAqkE9e8pRsxutkKBuI7MkMmkF95pTJ0TReoF01GkeMhYCys1zttwvXVuld2NN5nfdKHJVLmhCBBSpyk4IblAiYlzBQbD5g6qCMGdWZnxrxDneXit90+xbWODndVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=GSpOcWtZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fNCwWHnI; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 403591382D05;
	Mon, 10 Mar 2025 05:24:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 10 Mar 2025 05:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1741598677; x=
	1741685077; bh=OuNpBryzv+/OYV3NJzz30tUB40HcofpgStkUeAr2ZpU=; b=G
	SpOcWtZ4j0YiyaDAhUE4TZHL/PEXO0D6Swv0G6ph3XUTjp+BrqERpDy85yYLvezo
	T4Xpgq6nZ9JdU6riGaCWypY3tnl0Dc4nKzvx2u+mDJevRYiVYELsYNWgx+ur64dH
	MP8BgeqsGeEXAohRCYhtDdGakUhHdWdBijD/zuCurAXfqKBF7CgcQE736VyYX9C5
	lykX9aLh+z+0NXYMXKZ46+0cW+eQQfR4G80gYZ0GU28eGDZ6c24Jc95OIeRbJpey
	kX5XqvNK+uPSxLyYVeeJ8C65e3hK8JBNF+ikj0Wj3dEWRTyhTKau3luFVYZB7OWs
	4E80Yw7LQu5eBca4cwirQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741598677; x=1741685077; bh=O
	uNpBryzv+/OYV3NJzz30tUB40HcofpgStkUeAr2ZpU=; b=fNCwWHnIw+Y143w7/
	Ali8YuLZ/rRaJtqNy7KkWMN0yXDOz+ph6LvUk8HaPhkr5Vut6mLW/V+5FNThPl4i
	3WFYL03IwUMzoFfD8CwR2sCJ4llWaqjnhll1A2IrfgfD60trjqgFvqRhy34JHi9U
	Dd3QCR4KN5S2fR/R1d8NG266pHS2hwDzJsvZvr/68gsY2nFEdtyjMU7Fi/2POvUi
	vAbD6VW6rFMmKoQOQXNSCUNIsLQgZfQI7WYJUNFMt6Gh57ww8MH/Zy8+AEwr0HLh
	WRc+Zg+xoYFP4+7+hLzhQiMtnwu0Sc5WpiocmqYvDR40VT8HiZ2KYQuPertwzoUE
	PIktg==
X-ME-Sender: <xms:1K_OZ3sbbsHWp6sldG1hoLBYJc9x-UaPgIksABnILeZPh_Za9cbuBQ>
    <xme:1K_OZ4dR7I84RXErx8iAgDLLshwCnyFvVI9k4u2Z3Kp2eOYmxRDRn1nnZNHygji05
    K1ZgYMQjfZQn30CbA>
X-ME-Received: <xmr:1K_OZ6xYssrF5VjULlve6q4c_TdpCXujifUMZUEYQNAY3g3sjzLN5ZcKi8rVkk7KEaPvuCRpFck86XMcezlaWQ8-cydh0dsOR7P3S6qUQngO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1K_OZ2O1DbURN4lUKyOMEkNU46P2-QcmGFEFxnUuV-A5s29m2K-pGg>
    <xmx:1K_OZ3_xVLWs5-RIVWOIA6BYQM-JKp5uFZXOqU238G986Snx2omApw>
    <xmx:1K_OZ2WJHcoEtq9yKIbR4qTyMO3uBMcvK_iES5sDgoFxm3XrP0UWxA>
    <xmx:1K_OZ4fPvUnl8kNIZ9Ab1ZdQcmG5bfiLBywodGlOxOnbQEqmnWtySw>
    <xmx:1a_OZ9MA7ykX7ampLF9ik1GqlnOMSzJqu4-5CM29VVozLVXKkals3fCP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:29 -0400 (EDT)
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
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v8 04/11] drm: sun4i: de2/de3: use generic register reference function for layer configuration
Date: Mon, 10 Mar 2025 22:09:50 +1300
Message-ID: <20250310092345.31708-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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

---
Changelog v2..v3:
- Refactor for 6.11 layer init/modesetting changes
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 41815b42d6d2..cc4da11e2c10 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -274,6 +274,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
+	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -313,8 +314,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 	}
 
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e8..7a21d32ff1e4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -23,6 +23,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 					int overlay, struct drm_plane *plane)
@@ -51,6 +52,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -59,6 +61,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -103,10 +106,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
index a7a3a75ffd63..3d81d23d0195 100644
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
@@ -183,10 +185,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
2.48.1



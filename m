Return-Path: <linux-clk+bounces-10801-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411B4955A3E
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA0B2B214CC
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33435156236;
	Sat, 17 Aug 2024 23:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="DC7T4Xv+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YX7VCEU4"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0213DB99;
	Sat, 17 Aug 2024 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936111; cv=none; b=FnocyNJpzJsAxRzjQc/aVrXiuAKGzVSFNkhANW8NyZNGmxrUQhh3roCzE4+njhLINBzNH2aZNw2IYJmAxemXwPrwCf0/n4rPOinylpUc9KABsYe/xj5luSBrFL1AR0pnWMV2LhxwhIiL+HRkeYFV1Y67EADJmxSq+GsH8Kkplg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936111; c=relaxed/simple;
	bh=ptIj+XEJ4Z61A97kkbpQx+qlpr827CVbSyKeozn8Q6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujVhekwnKv63y6i5OUVw1OSk1j5gVHZ1yuoMrwX66aCYZtIAYEBbtVgiDSB24IRdKIHK2YaIgX3h/e0odl5wK5QL1x8pS2gX+cRW+ItGXP1LTlpebb6kgfk9DHTgD+2QEwzONUNw23ctJ6TVkGBUsh1tYPyOxlidRz6/JiQGHak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=DC7T4Xv+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YX7VCEU4; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6DC31138DE7D;
	Sat, 17 Aug 2024 19:08:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 17 Aug 2024 19:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936107; x=
	1724022507; bh=UUql1ayzsVfapqERUTXYxvjlJm/KmgqhSB5tVjVtYlI=; b=D
	C7T4Xv+RLQHRE3a9zA6O5nCDzDF8kE88Aq999fOl9ni+0J1yvQ53QSzJVMDN5UyU
	uaRBrtZW7sSYG5NysCAshAqcRqLazykCFt9/i4XI377clLRvyGDjcCa9/1xCRAxq
	/K7Cq8Yi4GDEyH8Lpt1V4SFQO5IVL7KoDlLO/G5UeW40OM5yDOrDyaBeKbEHJ+f5
	QzCNomUqHJaz1D/NTYQUaBOunldOsayCcG1H8X5gS///jeoqGn+DJB53BVrFtbvB
	2t0YfZbNW9Cguxszjkcy4x76Qa6q8cWDPH8naBkUwR7DqZzuyXVQe58Wr66hEC1Y
	Z/BoLrYMyJTKYCo+ZsXAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936107; x=
	1724022507; bh=UUql1ayzsVfapqERUTXYxvjlJm/KmgqhSB5tVjVtYlI=; b=Y
	X7VCEU4LxYC8VuYbKLUgJ9hDJxosQLfRA++5pIivfgGLFlZCVTTC+MQwOdQrhOuD
	sqbBSAH2Uc1xhJLDUiIwVF2PjRQATdq8lEcg1E3o4mkTPI+EVo5u9Ph0U+8G8R1+
	9neaxksErembgedEFnlaqs3fIISezzDqBZwT4tVAH3y3ufg/Xf0ZPqT6qnDU5oLs
	u9S57hdVY9GTFzJnsy3SJH3L2D6TpsGN4xwEOWUE7Oi0Kvqc8KzKX34RhL14IKSU
	5MnUWc3qERP2gkq9zeE92US8BdYBjGVNyvNVRiJdX7u8Be5VfWdanwnECAE4h43y
	Do2sv+d8LuzRKWumR1exA==
X-ME-Sender: <xms:ay3BZqdEpJkX-lGp6Gj00O_ibQ4M_qVm9Mc3DG-zwUCUPmi1MZcj6w>
    <xme:ay3BZkNhiWSnRU__HHaYdpiahATYAkYA79j1Q2RmxUlvtVphp4iei3OSiizgdkGo1
    AgpQ8_s55NfmrEkuQ>
X-ME-Received: <xmr:ay3BZrjzBPfOYRLXMbjmrv-BjaczErxpdrkbSu58CUx1Sz-WW9CzUe4-OiNyDKtKgYKWoya0w03DVe30RSAcamhpDegvlkbnV6PrdnYTdsPK4RHS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ay3BZn-BliJD9QTSXouB1Lpe3nIJV_qkUVUDWkwbgX3bYacqjOmG4w>
    <xmx:ay3BZmsBxbHILLmVbnHzAUxuuvvyW_uf1eYca7Ka1s9BQUSJpI55CA>
    <xmx:ay3BZuFYskmeaXYhTDiwYHWqwyyodbalrofPLrGaOIA4YB6R6Q_B-w>
    <xmx:ay3BZlOP0xx7C5hI23ip5DT5kQb5ewToaLgqfTKY9G1K70Z4sFgidg>
    <xmx:ay3BZme-syFW5r5J-NAxKC_Jd7FvljLZqNPTRwKcsB4CE_eYu5dKGbjy>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:08:20 -0400 (EDT)
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
Subject: [PATCH v3 23/26] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
Date: Sun, 18 Aug 2024 10:46:10 +1200
Message-ID: <20240817230503.158889-24-ryan@testtoast.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

Notable features (from the H616 datasheet and implemented):
- 4096 x 2048 (4K) output support
- AFBC ARM Frame Buffer Compression support
- YUV420 input support

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group, and adds a top register map.

Extend the mixer to support the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 108 ++++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  16 ++++-
 2 files changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 23561f122a2b6..5a70d60e9a0eb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -321,8 +321,12 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
-		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	else
+		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
 static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
@@ -371,25 +375,33 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	struct regmap *bld_regs, *disp_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
 	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
 			 mode->hdisplay, mode->vdisplay);
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
-	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		disp_regs = mixer->disp_regs;
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
+	} else {
+		disp_regs = mixer->engine.regs;
+		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+	}
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -400,10 +412,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0xff108080;
 
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
 
 	if (mixer->cfg->has_formatter)
 		sun50i_fmt_setup(mixer, mode->hdisplay,
@@ -443,12 +453,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
+	.name		= "layers",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xffffc, /* guessed */
 };
 
+static const struct regmap_config sun8i_top_regmap_config = {
+	.name		= "top",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3c,
+};
+
+static const struct regmap_config sun8i_disp_regmap_config = {
+	.name		= "display",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20000,
+};
+
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -471,33 +498,44 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
+	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
 	int plane_cnt, i;
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		top_regs = mixer->top_regs;
+		disp_regs = mixer->disp_regs;
+	} else {
+		top_regs = disp_regs = mixer->engine.regs;
+	}
+	
 	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
 		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
+		
 	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
+		regmap_write(disp_regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -573,6 +611,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		return PTR_ERR(mixer->engine.regs);
 	}
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		regs = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->top_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_top_regmap_config);
+		if (IS_ERR(mixer->top_regs)) {
+			dev_err(dev, "Couldn't create the top regmap\n");
+			return PTR_ERR(mixer->top_regs);
+		}
+
+		regs = devm_platform_ioremap_resource(pdev, 2);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
@@ -787,6 +849,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.has_formatter	= 1,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -832,6 +906,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 75facc7d1fa66..26b001164647c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -21,6 +21,10 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -154,6 +158,7 @@ enum {
 enum sun8i_mixer_type {
 	sun8i_mixer_de2,
 	sun8i_mixer_de3,
+	sun8i_mixer_de33,
 };
 
 /**
@@ -180,6 +185,7 @@ struct sun8i_mixer_cfg {
 	unsigned int	de_type;
 	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
+	unsigned int	map[6];
 };
 
 struct sun8i_mixer {
@@ -191,6 +197,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
 };
 
 enum {
@@ -227,13 +236,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 static inline struct regmap *
 sun8i_blender_regmap(struct sun8i_mixer *mixer)
 {
-	return mixer->engine.regs;
+	return mixer->cfg->de_type == sun8i_mixer_de33 ?
+		mixer->disp_regs : mixer->engine.regs;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
-- 
2.46.0



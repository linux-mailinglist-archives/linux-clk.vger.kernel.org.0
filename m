Return-Path: <linux-clk+bounces-18156-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB57A376E5
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 19:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5157D188506C
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 18:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF741A0B08;
	Sun, 16 Feb 2025 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="AkWSHZxp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zBu/lWnH"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC351A0714;
	Sun, 16 Feb 2025 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731250; cv=none; b=LkZQMTXoPdfqTtO6jI/zD2AUb37tzkYzMp/RvfEhU2wa0mDRNCs1UXjohqCY2COwREyRUpQspxnkTIGlJ7GA4vsMXzI0eUL7U6KaHTEPRA+Utdec74fSBNQZaZ8wNeu4dSsd6dReJ86lLgwLTM5S7XTrF9u89hTSUuLmzPRxtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731250; c=relaxed/simple;
	bh=+UnHNLyyYeGCZXVpCmkCTzdYE4JOE+RSo/gEicmALRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBrjirryWp8jqAg2Srb9l8b9WRD8NCDBsjCR8v9+CEOUXgLmv45EHvUGvxSaTjFoHwznuPAAWb3+qwDcF1n3OMBaUFC3zf6R4Hm+SsO6Bo8qnCxv/VDEq3xXhRHBHQDORPR1P44ltOe/86mtUYAfjxkptcAqnZgRL/rYzz6jtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=AkWSHZxp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zBu/lWnH; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 49CF825400C3;
	Sun, 16 Feb 2025 13:40:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 16 Feb 2025 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731247; x=
	1739817647; bh=qTrgI4pTmO4u0Lv+OA3OrVhIhys5fJYhQ/UKTPXJAw4=; b=A
	kWSHZxpizbPd8pOJBT5s8IR6LiXnoYRayRS1aT8ukFqUDLvU6v4dqMWYW5T+3eVf
	Kta/BMJ1r7x2Mc0J3sUfzzORVG7O3ERod79A0NTfB4MwfWbUEN6fUqVcHlVEpAcf
	ORG++ZdC0Fm8+kyiUK+kbwUuMO6KKLM9ADtZKiobw4qYlAw1fzfFPA3IGp5+F5d5
	3p/XMBUVsS1dzxjnaeN/MYMbfzdvJ7VCxD4c34yIUp7uim4AeyzBxz7zWzW2Qd1Y
	/RA/7n9YKYO4+xAYLsnQWNqr45ThEIneE3QOm+PQTup3+veBIIp8imb3doWMO1So
	d8Hsm12EwCF+QWeXywkEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731247; x=1739817647; bh=q
	TrgI4pTmO4u0Lv+OA3OrVhIhys5fJYhQ/UKTPXJAw4=; b=zBu/lWnHCoE6Z0YGh
	uHH+rq548qsbllLqdm6blbmbiGsyGRJV4mFznbT3jz7E2k8EV8wBsXSTvNTfSjn9
	VFHI7V/XSwN7nXSwqa09IZOx5BxyW/0Yn89+SQTuhyN4CHokQFIduTIhdgnTM9T1
	+jt+xUloeRNQdyvgDQbca4Xib82FhT8OQ5ewaDKYrXDkXJqHoeyan8nHdJnvxAYW
	DtVS6PoaBMEmtQyucYql7XhbhWCVDSwSkr3YyFboA+7ghJZ8vxbpNtZXlNirA8xB
	tZK5+GNqXw1AFO8tIfBqzp/rY7XBDRWBEv7FtXi4NP5FLbhUA0DlH91hhvi7yNk4
	CnpgQ==
X-ME-Sender: <xms:LjGyZ1UwLqIIctFo6fF5MWTVuV2tobV_EAGfQTU_V3qNj2tf1mpGsg>
    <xme:LjGyZ1kOaRlz5PgpdPljrlONkkcADWpTaIfG7o3h2dHoJOcll5gmoSyHeRY33tGtr
    qiwkOJDf62udGXaDQ>
X-ME-Received: <xmr:LjGyZxZqC5Tl65hXh_WlZqIdYGy6KL0IlbGDOT-AJf0hlsrxQXWnltHgbiUsUovy279hhHHjreLQ6pkskzFauYqf2YhOGRUMmOJk_L-yCsvH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:LzGyZ4VbV29o6rGGAW1u5-qt0g2scfOl5K5OxYKo1BW2sx2WMb5HAw>
    <xmx:LzGyZ_k5S9U6teHw28QnA43dZ9dmEfp1uINU3LKodNVW8an_6TWZ2w>
    <xmx:LzGyZ1cBkEdOqpmKCjSj8ugOExbdX8r69LGyvs0W_7eFjRMRQwOtnA>
    <xmx:LzGyZ5FNVvr9ok8-DdQ7JvAYOJegP0BQkNgacUrQ_ikhg-rRk7E9_Q>
    <xmx:LzGyZz0PT1h4uzRppneMewDVvrfNgTKJDk1cQX178-528fUsLcP7K0sQ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:39 -0500 (EST)
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
Subject: [PATCH v7 24/27] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
Date: Mon, 17 Feb 2025 07:36:24 +1300
Message-ID: <20250216183710.8443-25-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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
Changelog v4..v5:
- Whitespace fixes
- Correct strict mode warnings from checkpatch.pl
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 109 ++++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  13 +++-
 2 files changed, 105 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f0d48796d651f..3584b496c5d58 100644
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
 		sun50i_fmt_setup(mixer, mode->hdisplay, mode->vdisplay);
@@ -442,12 +452,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
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
@@ -470,33 +497,45 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
+	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
 	int plane_cnt, i;
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		top_regs = mixer->top_regs;
+		disp_regs = mixer->disp_regs;
+	} else {
+		top_regs = mixer->engine.regs;
+		disp_regs = mixer->engine.regs;
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
 
@@ -573,6 +612,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
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
+							 &sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
@@ -787,6 +850,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
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
@@ -832,6 +907,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
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
index db962ccd66964..a8afc37dc80d5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -22,6 +22,10 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -155,6 +159,7 @@ enum {
 enum sun8i_mixer_type {
 	sun8i_mixer_de2,
 	sun8i_mixer_de3,
+	sun8i_mixer_de33,
 };
 
 /**
@@ -181,6 +186,7 @@ struct sun8i_mixer_cfg {
 	unsigned int		de_type;
 	unsigned int		has_formatter : 1;
 	unsigned int		scanline_yuv;
+	unsigned int		map[6];
 };
 
 struct sun8i_color_model {
@@ -238,13 +244,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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
2.48.1



Return-Path: <linux-clk+bounces-8303-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D89102CA
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 13:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E1A1B2384B
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23A11AB91B;
	Thu, 20 Jun 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="nk0QasS5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MrXUpcgC"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8E1AB912;
	Thu, 20 Jun 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883228; cv=none; b=Fg/5opkiRdZvLljqUUjRvrQiJkcbrU9SBYXrDLsbnfOOdqHWGdXabzVmoG95jiSBTxRz0VnKJDRhH0ZCRAi388y8Ns+MnFQCZiQLEYCIW1KrzyoCw+L+GjzBoy2bZeX/iRojXRGmruZYGrUg9Tb4jckkfceGNEoO9FawBtV/+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883228; c=relaxed/simple;
	bh=ePbwnhKL2i5CBNn3J8wFMpl4WrzPvoC+XvKazMSM9cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVGkZMMz29w5C0dc63BDqN55GAcYlpVCoE9OqX+IouAI2zimI7AQtRc07rnvWTdLdoAmFpdqcpc08c8/WafDrfGqcyyMZrntV8RclrBfc9WPk8ufEAOoV5J1HGUHNuHnU+zL8OKcW//yPKV+x8IsSCJRNcnur6pBGhuWV+7mIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=nk0QasS5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MrXUpcgC; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 2DD321140276;
	Thu, 20 Jun 2024 07:33:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 20 Jun 2024 07:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883225; x=
	1718969625; bh=JGHiRTMOOOOrPtvrOuXq42oWMI5g86eIe3ydpj8wvuY=; b=n
	k0QasS5TTGMzW7Sp5BsPM2J5r+FA5vmGW4z9trUIJ/cq3n6D4J5xKurlTZJaD/y1
	DT4H8gwm3O7SxUIOUfRCZIxJntRnVxdmex9RLwADuN0Jgy+zoW/BmJaI6GFxkwcB
	9nfBg6XsI4fvO7pw6x0+u0sgE3ujbsExiwQBPkrbfBlEIpH4jgEsYGdczcfOc0hl
	fV5rvFZwP368IlC6bvk/2a6KkmNkscYQX1STJxSSWPcF852OG/j+tw8jBBtnMv9U
	QsfrhwNDLQlJ9RZa3jAeczqLz3IANcijdMywZBfZInPaPQEiU+AEgFYufn1UnoSe
	fJ1E/KXEvgcwRdeoOoiyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883225; x=
	1718969625; bh=JGHiRTMOOOOrPtvrOuXq42oWMI5g86eIe3ydpj8wvuY=; b=M
	rXUpcgC1jZ8cRA9Dx49MePjctXQC56Y9n0F5nts8T1nD8UZZUO97Bb1CFYLvYkuW
	6jGxj5r3O81vAfxwUJhOGhBuFkCst16wwMrzFRkI1p1hl1MFSi5QE++nteZNJiGR
	lK6j5PmfypuwsnxHFkThQKreX53Q+n6BN3u2B30zcxkP43FAvRtSg0Zqu2hXawC0
	K2WMHdbnFlHugkndr4KGwGXTX5AP7DHzMLMdkA5kpbFfCPk+PgKFoW9+MNiPkTHU
	IbbRI3+Wi9qH1lCw9i2rKdANOu8+cb7gq35q/W7VM7OdUuxoSPEBGPHWRKUj9REP
	gOUjFLZK+Y3+6gbKC+meQ==
X-ME-Sender: <xms:mBN0Zi5xvinEqktx7_3aIxZA23_ANd0PLXd9xBFWceFrW4CnUus83g>
    <xme:mBN0Zr6gI2IrcnC0fnJQer6FhK-t-zn1ol5_gychxOb7qu2FShU6q2IY2bkarKhgB
    moxtg7KsrReXSCtFA>
X-ME-Received: <xmr:mBN0Zhd9HrYn96wEDINiZfq-NqurymEd5xzStp99aK3il0BgyzqxDit8rp-OPaEfkJWu9LKcPtH4yIzx2-kJxgUUhqkA3p8wnSlmxrhBEaMmxv7p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:mBN0ZvJYdXe63C2WuS0yvbSXbJ617ilwdTGtz2dEWrBoovhAYFJ_gQ>
    <xmx:mBN0ZmIPPGIkw_a_K__AyOg38915YPK2tnDXAeK-uebZ46yaDlGM4A>
    <xmx:mBN0Zgw1o3R5T_Mu16SyqERVEJfGb8ghEYaitjKU3-7o1tqcQkAAfw>
    <xmx:mBN0ZqLv0wwpvDFKAEayI08g64HrC7YLq4aRFvHlvgg9ruy80Z3eyg>
    <xmx:mRN0Zm66WYkIZlYQaqOiCd80RbZQlyLvAEgAXcRueMbrJCGfEV8HF4PI>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:39 -0400 (EDT)
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
Subject: [PATCH 17/23] drm: sun4i: de3: Implement AFBC support
Date: Thu, 20 Jun 2024 23:29:55 +1200
Message-ID: <20240620113150.83466-18-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Buffers, compressed with AFBC, are supported by the DE3 and above, and
are generally more efficient for memory transfers. Add support for them.

Currently it's implemented only for VI layers, but vendor code and
documentation suggest UI layers can have them too. However, I haven't
observed any SoC with such feature.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/Makefile         |   2 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c    | 250 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h    |  87 +++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  84 +++++++--
 4 files changed, 410 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 3f516329f51ee..78290f1660fbd 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -17,7 +17,7 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
 				   sun8i_vi_scaler.o sun8i_csc.o \
-				   sun50i_fmt.o
+				   sun50i_fmt.o sun50i_afbc.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_afbc.c b/drivers/gpu/drm/sun4i/sun50i_afbc.c
new file mode 100644
index 0000000000000..b55e1c5533714
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_afbc.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <drm/drm_blend.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_plane.h>
+#include <uapi/drm/drm_fourcc.h>
+
+#include "sun50i_afbc.h"
+#include "sun8i_mixer.h"
+
+static u32 sun50i_afbc_get_base(struct sun8i_mixer *mixer, unsigned int channel)
+{
+	u32 base = sun8i_channel_base(mixer, channel);
+
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		return base + SUN50I_AFBC_CH_OFFSET;
+
+	return base + 0x4000;
+}
+
+bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
+				      u32 format, u64 modifier)
+{
+	u64 mode;
+
+	if (modifier == DRM_FORMAT_MOD_INVALID)
+		return false;
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR) {
+		if (format == DRM_FORMAT_YUV420_8BIT ||
+		    format == DRM_FORMAT_YUV420_10BIT ||
+		    format == DRM_FORMAT_Y210)
+			return false;
+		return true;
+	}
+
+	if (mixer->cfg->de_type == sun8i_mixer_de2)
+		return false;
+
+	mode = AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+	       AFBC_FORMAT_MOD_SPARSE |
+	       AFBC_FORMAT_MOD_SPLIT;
+
+	switch (format) {
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBA1010102:
+		mode |= AFBC_FORMAT_MOD_YTR;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_YUV420_8BIT:
+	case DRM_FORMAT_YUV420_10BIT:
+		break;
+	default:
+		return false;
+	}
+
+	return modifier == DRM_FORMAT_MOD_ARM_AFBC(mode);
+}
+
+void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
+			       struct drm_plane *plane)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = state->fb;
+	const struct drm_format_info *format = fb->format;
+	struct drm_gem_dma_object *gem;
+	u32 base, val, src_w, src_h;
+	u32 def_color0, def_color1;
+	struct regmap *regs;
+	dma_addr_t dma_addr;
+
+	base = sun50i_afbc_get_base(mixer, channel);
+	regs = mixer->engine.regs;
+
+	src_w = drm_rect_width(&state->src) >> 16;
+	src_h = drm_rect_height(&state->src) >> 16;
+
+	val = SUN50I_FBD_SIZE_HEIGHT(src_h);
+	val |= SUN50I_FBD_SIZE_WIDTH(src_w);
+	regmap_write(regs, SUN50I_FBD_SIZE(base), val);
+
+	val = SUN50I_FBD_BLK_SIZE_HEIGHT(DIV_ROUND_UP(src_h, 16));
+	val = SUN50I_FBD_BLK_SIZE_WIDTH(DIV_ROUND_UP(src_w, 16));
+	regmap_write(regs, SUN50I_FBD_BLK_SIZE(base), val);
+
+	val = SUN50I_FBD_SRC_CROP_TOP(0);
+	val |= SUN50I_FBD_SRC_CROP_LEFT(0);
+	regmap_write(regs, SUN50I_FBD_SRC_CROP(base), val);
+
+	val = SUN50I_FBD_LAY_CROP_TOP(state->src.y1 >> 16);
+	val |= SUN50I_FBD_LAY_CROP_LEFT(state->src.x1 >> 16);
+	regmap_write(regs, SUN50I_FBD_LAY_CROP(base), val);
+
+	/*
+	 * Default color is always set to white, in colorspace and bitness
+	 * that coresponds to used format. If it is actually used or not
+	 * depends on AFBC buffer. At least in Cedrus it can be turned on
+	 * or off.
+	 * NOTE: G and B channels are off by 1 (up). It's unclear if this
+	 * is because HW need such value or it is due to good enough code
+	 * in vendor driver and HW clips the value anyway.
+	 */
+	def_color0 = 0;
+	def_color1 = 0;
+
+	val = 0;
+	switch (format->format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YUV420_10BIT:
+		val |= SUN50I_FBD_FMT_SBS1(2);
+		val |= SUN50I_FBD_FMT_SBS0(1);
+		break;
+	case DRM_FORMAT_Y210:
+		val |= SUN50I_FBD_FMT_SBS1(3);
+		val |= SUN50I_FBD_FMT_SBS0(2);
+		break;
+	default:
+		val |= SUN50I_FBD_FMT_SBS1(1);
+		val |= SUN50I_FBD_FMT_SBS0(1);
+		break;
+	}
+	switch (format->format) {
+	case DRM_FORMAT_RGBA8888:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_8888);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(255) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
+		break;
+	case DRM_FORMAT_RGB888:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_888);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
+		break;
+	case DRM_FORMAT_RGB565:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_565);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(64) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
+		break;
+	case DRM_FORMAT_RGBA4444:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_4444);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(15) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(15);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(16) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(16);
+		break;
+	case DRM_FORMAT_RGBA5551:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_5551);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(1) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(32) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
+		break;
+	case DRM_FORMAT_RGBA1010102:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA1010102);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(3) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(1024) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(1024);
+		break;
+	case DRM_FORMAT_YUV420_8BIT:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV420);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
+		break;
+	case DRM_FORMAT_YUYV:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV422);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
+		break;
+	case DRM_FORMAT_YUV420_10BIT:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P010);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
+		break;
+	case DRM_FORMAT_Y210:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P210);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
+		break;
+	}
+	regmap_write(regs, SUN50I_FBD_FMT(base), val);
+
+	/* Get the physical address of the buffer in memory */
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
+
+	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
+
+	/* Compute the start of the displayed memory */
+	dma_addr = gem->dma_addr + fb->offsets[0];
+
+	regmap_write(regs, SUN50I_FBD_LADDR(base), lower_32_bits(dma_addr));
+	regmap_write(regs, SUN50I_FBD_HADDR(base), upper_32_bits(dma_addr));
+
+	val = SUN50I_FBD_OVL_SIZE_HEIGHT(src_h);
+	val |= SUN50I_FBD_OVL_SIZE_WIDTH(src_w);
+	regmap_write(regs, SUN50I_FBD_OVL_SIZE(base), val);
+
+	val = SUN50I_FBD_OVL_COOR_Y(0);
+	val |= SUN50I_FBD_OVL_COOR_X(0);
+	regmap_write(regs, SUN50I_FBD_OVL_COOR(base), val);
+
+	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
+	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
+
+	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
+	val |= SUN50I_FBD_CTL_CLK_GATE;
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
+		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
+	val |= SUN50I_FBD_CTL_FBD_EN;
+	regmap_write(regs, SUN50I_FBD_CTL(base), val);
+}
+
+void sun50i_afbc_disable(struct sun8i_mixer *mixer, unsigned int channel)
+{
+	u32 base = sun50i_afbc_get_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs, SUN50I_FBD_CTL(base), 0);
+}
diff --git a/drivers/gpu/drm/sun4i/sun50i_afbc.h b/drivers/gpu/drm/sun4i/sun50i_afbc.h
new file mode 100644
index 0000000000000..cea685c868550
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_afbc.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#ifndef _SUN50I_AFBC_H_
+#define _SUN50I_AFBC_H_
+
+#include <linux/types.h>
+
+#define SUN50I_AFBC_CH_OFFSET 0x300
+
+#define SUN50I_AFBC_RGBA_8888	0x02
+#define SUN50I_AFBC_RGB_888	0x08
+#define SUN50I_AFBC_RGB_565	0x0a
+#define SUN50I_AFBC_RGBA_4444	0x0e
+#define SUN50I_AFBC_RGBA_5551	0x12
+#define SUN50I_AFBC_RGBA1010102	0x16
+#define SUN50I_AFBC_YUV422	0x26
+#define SUN50I_AFBC_YUV420	0x2a
+#define SUN50I_AFBC_P010	0x30
+#define SUN50I_AFBC_P210	0x32
+
+#define SUN50I_FBD_CTL(base)			((base) + 0x00)
+#define SUN50I_FBD_CTL_GLB_ALPHA(v)		((v) << 24)
+#define SUN50I_FBD_CTL_CLK_GATE			BIT(4)
+#define SUN50I_FBD_CTL_ALPHA_MODE_PIXEL		((0) << 2)
+#define SUN50I_FBD_CTL_ALPHA_MODE_LAYER		((1) << 2)
+#define SUN50I_FBD_CTL_ALPHA_MODE_COMBINED	((2) << 2)
+#define SUN50I_FBD_CTL_FBD_FCEN			BIT(1)
+#define SUN50I_FBD_CTL_FBD_EN			BIT(0)
+
+#define SUN50I_FBD_SIZE(base)			((base) + 0x08)
+#define SUN50I_FBD_SIZE_HEIGHT(v)		(((v) - 1) << 16)
+#define SUN50I_FBD_SIZE_WIDTH(v)		(((v) - 1) << 0)
+
+#define SUN50I_FBD_BLK_SIZE(base)		((base) + 0x0c)
+#define SUN50I_FBD_BLK_SIZE_HEIGHT(v)		((v) << 16)
+#define SUN50I_FBD_BLK_SIZE_WIDTH(v)		((v) << 0)
+
+#define SUN50I_FBD_SRC_CROP(base)		((base) + 0x10)
+#define SUN50I_FBD_SRC_CROP_TOP(v)		((v) << 16)
+#define SUN50I_FBD_SRC_CROP_LEFT(v)		((v) << 0)
+
+#define SUN50I_FBD_LAY_CROP(base)		((base) + 0x14)
+#define SUN50I_FBD_LAY_CROP_TOP(v)		((v) << 16)
+#define SUN50I_FBD_LAY_CROP_LEFT(v)		((v) << 0)
+
+#define SUN50I_FBD_FMT(base)			((base) + 0x18)
+#define SUN50I_FBD_FMT_SBS1(v)			((v) << 18)
+#define SUN50I_FBD_FMT_SBS0(v)			((v) << 16)
+#define SUN50I_FBD_FMT_YUV_TRAN			BIT(7)
+#define SUN50I_FBD_FMT_IN_FMT(v)		((v) << 0)
+
+#define SUN50I_FBD_LADDR(base)			((base) + 0x20)
+#define SUN50I_FBD_HADDR(base)			((base) + 0x24)
+
+#define SUN50I_FBD_OVL_SIZE(base)		((base) + 0x30)
+#define SUN50I_FBD_OVL_SIZE_HEIGHT(v)		(((v) - 1) << 16)
+#define SUN50I_FBD_OVL_SIZE_WIDTH(v)		(((v) - 1) << 0)
+
+#define SUN50I_FBD_OVL_COOR(base)		((base) + 0x34)
+#define SUN50I_FBD_OVL_COOR_Y(v)		((v) << 16)
+#define SUN50I_FBD_OVL_COOR_X(v)		((v) << 0)
+
+#define SUN50I_FBD_OVL_BG_COLOR(base)		((base) + 0x38)
+#define SUN50I_FBD_OVL_FILL_COLOR(base)		((base) + 0x3c)
+
+#define SUN50I_FBD_DEFAULT_COLOR0(base)		((base) + 0x50)
+#define SUN50I_FBD_DEFAULT_COLOR0_ALPHA(v)	((v) << 16)
+#define SUN50I_FBD_DEFAULT_COLOR0_YR(v)		((v) << 0)
+
+#define SUN50I_FBD_DEFAULT_COLOR1(base)		((base) + 0x54)
+#define SUN50I_FBD_DEFAULT_COLOR1_VB(v)		((v) << 16)
+#define SUN50I_FBD_DEFAULT_COLOR1_UG(v)		((v) << 0)
+
+struct sun8i_mixer;
+struct drm_plane;
+
+bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
+				      u32 format, u64 modifier);
+
+void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
+			       struct drm_plane *plane);
+void sun50i_afbc_disable(struct sun8i_mixer *mixer, unsigned int channel);
+
+#endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 448a696df5c39..d8a97245cfe1e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -11,8 +11,10 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun50i_afbc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -101,7 +103,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+				       unsigned int zpos, bool afbc)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -186,7 +188,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 
 		required = src_h * 100 / dst_h;
 
-		if (ability < required) {
+		if (!afbc && ability < required) {
 			DRM_DEBUG_DRIVER("Using vertical coarse scaling\n");
 			vm = src_h;
 			vn = (u32)ability * dst_h / 100;
@@ -196,7 +198,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
 		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
 
-		if (src_w > scanline) {
+		if (!afbc && src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
 			hm = src_w;
 			hn = scanline;
@@ -359,6 +361,15 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
+static void sun8i_vi_layer_prepare_non_linear(struct sun8i_mixer *mixer,
+					      int channel, int overlay)
+{
+	u32 base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(base, overlay), 0);
+}
+
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
@@ -402,6 +413,8 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
 			      old_zpos);
+	if (mixer->cfg->de_type >= sun8i_mixer_de3)
+		sun50i_afbc_disable(mixer, layer->channel);
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
@@ -414,26 +427,53 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
+	struct drm_framebuffer *fb = plane->state->fb;
 	struct sun8i_mixer *mixer = layer->mixer;
+	bool afbc = drm_is_afbc(fb->modifier);
 
 	if (!new_state->visible) {
 		sun8i_vi_layer_enable(mixer, layer->channel,
 				      layer->overlay, false, 0, old_zpos);
+		if (mixer->cfg->de_type >= sun8i_mixer_de3)
+			sun50i_afbc_disable(mixer, layer->channel);
 		return;
 	}
 
+	if (afbc) {
+		u32 fmt_type;
+
+		sun8i_vi_layer_prepare_non_linear(mixer, layer->channel,
+						  layer->overlay);
+		sun50i_afbc_atomic_update(mixer, layer->channel, plane);
+
+		fmt_type = sun8i_vi_layer_get_format_type(fb->format);
+		sun8i_csc_set_ccsc(mixer, layer->channel, fmt_type,
+				   plane->state->color_encoding,
+				   plane->state->color_range);
+	} else {
+		if (mixer->cfg->de_type >= sun8i_mixer_de3)
+			sun50i_afbc_disable(mixer, layer->channel);
+		sun8i_vi_layer_update_alpha(mixer, layer->channel,
+					    layer->overlay, plane);
+		sun8i_vi_layer_update_formats(mixer, layer->channel,
+					      layer->overlay, plane);
+		sun8i_vi_layer_update_buffer(mixer, layer->channel,
+					     layer->overlay, plane);
+	}
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
-	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_vi_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
-	sun8i_vi_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+				    layer->overlay, plane, zpos, afbc);
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
 			      true, zpos, old_zpos);
 }
 
+static bool sun8i_vi_layer_format_mod_supported(struct drm_plane *plane,
+						u32 format, u64 modifier)
+{
+	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
+
+	return sun50i_afbc_format_mod_supported(layer->mixer, format, modifier);
+}
+
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
 	.atomic_check	= sun8i_vi_layer_atomic_check,
 	.atomic_disable	= sun8i_vi_layer_atomic_disable,
@@ -447,6 +487,7 @@ static const struct drm_plane_funcs sun8i_vi_layer_funcs = {
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
+	.format_mod_supported   = sun8i_vi_layer_format_mod_supported,
 };
 
 /*
@@ -530,6 +571,11 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU411,
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
+
+	/* AFBC only formats */
+	DRM_FORMAT_YUV420_8BIT,
+	DRM_FORMAT_YUV420_10BIT,
+	DRM_FORMAT_Y210,
 };
 
 static const uint64_t sun8i_layer_modifiers[] = {
@@ -537,6 +583,18 @@ static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static const uint64_t sun50i_layer_de3_modifiers[] = {
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					       struct sun8i_mixer *mixer,
 					       int index)
@@ -545,6 +603,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_vi_layer *layer;
+	const uint64_t *modifiers;
 	const u32 *formats;
 	int ret;
 
@@ -559,9 +618,11 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		modifiers = sun50i_layer_de3_modifiers;
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
+		modifiers = sun8i_layer_modifiers;
 	}
 
 	if (!mixer->cfg->ui_num && index == 0)
@@ -571,8 +632,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
 				       formats, format_count,
-				       sun8i_layer_modifiers,
-				       type, NULL);
+				       modifiers, type, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialize layer\n");
 		return ERR_PTR(ret);
-- 
2.45.2



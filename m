Return-Path: <linux-clk+bounces-12514-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AD989465
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC269B24FFB
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1C8143C77;
	Sun, 29 Sep 2024 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="OaBA17uZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jssl7r2d"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F142AB1;
	Sun, 29 Sep 2024 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601254; cv=none; b=TJHH/jWib7Xox1eByLp1MSCc3HW5g1JoSspdDxcs7gmK5LHHfPsVljJm0Q4yJY/ZhLLBiCP6wBKCGCnjyr04i94RkOMKr7qZ72MkUTepHM5NYIVvCKenblsWa3TyAEcU00vuxz0Ne3V39ptzx/r2cGlJhHgE+tCGJTCfAD807y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601254; c=relaxed/simple;
	bh=ZkTrTMmiNEECilvc5ncxev/LWoA+LJBe6tT3BuDWoAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYoS/UKk782n0wYYeo2P2zPUFCnrRqvrMrBiUwMe9l/AH9/QtxCOuoeb7ZbiStqyPGGE9RSI5HV1IVzILdiMSZVXKaizdPNh69w/iYGNmDqFiPIIx1AUXkdQoQsjtEn0ET6tPDYoJH/noVzwUUj6A7Wem+/TryjkKPXwC8aNbGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=OaBA17uZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jssl7r2d; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A760011402B9;
	Sun, 29 Sep 2024 05:14:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 05:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601251; x=
	1727687651; bh=QWeAcEx5ydjrPlUyYTxWYAwZbE8Bk7NgntmEsZsvBn8=; b=O
	aBA17uZj/L2pn0+yhz/qTixr61p+3X2jI/a/EJgqtLGacB1dDRcT9L88SMMqS7lD
	wPIdkieezyX2bg0gQ0oHq9sZNkhUncvM4ygL+KjgmzdvpQd7wpKiOE0TCn/H+/Bl
	TjzokP5e7EzyVZ+K7Nr97Nbdy0gynKezrbeEMcJo3qeAMZ/XfoKIzIy+ejiT+AhW
	00PqhW28I4V1CUF6RoF+lEjgJkpMUXEyJ9zUQz8xE9GwpVdhAbdCrnp+xt5DnqoX
	HbTFncKVu9F7IDD97VCI/H2XLh6SKfyuwqG0qUpR3mQrzZ6d75UddGmADHmrCMhI
	601P6IWN7sF9KgNFg9zXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601251; x=
	1727687651; bh=QWeAcEx5ydjrPlUyYTxWYAwZbE8Bk7NgntmEsZsvBn8=; b=j
	ssl7r2dZ/rLld/S4nVJisvUSxk+El2WOf8EqwYpZe4ONwytI7MhRVlYtUIDXSYCQ
	La/U/pssddI89ZxLI7QQ3jGX5Ks5hWUclN5yppHroWXR1/lpusxzhaY6oktLAg93
	UYSApGW8NagCDw/Ruat9FVV9G1rdW5MDEorftm8obai0l1WFv5EUB8ykxv2E55/1
	bej8Qqgl88GhnM7ud9BjdV9V/Ukgm/GGr2m9x2UwfF4NIemrypoHEdtoaIqy4EMD
	XRpOkeB8GjCSlRWyqnkj/Ya8PBEPf3XUa1IS9CyK1kohn2RpZdu8/5vSEYe9TDL6
	LQ920E4hA5keCLcy9xh+Q==
X-ME-Sender: <xms:Yxr5ZvK58zQrlO05h8OVkgoxV82nybifozVWleMv_ziFsciiqrUysQ>
    <xme:Yxr5ZjK04xOkcIQTsv7f9RtorzXyeZx1JIxuAlOicdMsJbYpaC4LEreFEcRxBn-t1
    0_byrKVN4GCrWFKxw>
X-ME-Received: <xmr:Yxr5Znv9UH3UHWmHtLsFdu16JqPjUN3yhOnZyx39kKAUdHlDcti6FZnQl81THjuRoTICDn7SBgMhzVqbfmOIknmKClJUF2h5_XK0TKK9IuJhc8-V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Yxr5Zobbf7uqLpr7QvG1CiwlsCa1LgWsBF83UI2PnHz9-2mXuyo6hw>
    <xmx:Yxr5ZmagdoQoaUPOSgi0087YX2egDWhnt51Ig3pbgefJ5SQ4ZL-yCQ>
    <xmx:Yxr5ZsCLjM39sNCNqwVJ0wvb0DNRpxoidjIjCZqjEqDghz73oif3oA>
    <xmx:Yxr5ZkaSA5Iwirfl9IRD-wUxgKTYYkjTc-_MBxp3dJJwWwvgULDcDA>
    <xmx:Yxr5ZowXiOObZl7P1MyBZ7WZnjQEBWYaBWo02ArbJORMmNcYf58NMDKW>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:14:05 -0400 (EDT)
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
Subject: [PATCH v5 26/26] drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
Date: Sun, 29 Sep 2024 22:04:58 +1300
Message-ID: <20240929091107.838023-27-ryan@testtoast.com>
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

Like earlier DE versions, the DE33 has a CSC (Color Space Correction)
module. which provides color space conversion between BT2020/BT709, and
dynamic range conversion between SDR/ST2084/HLG.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 96 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  3 +
 2 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 2d5a2cf7cba24..45bd1ca06400e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -238,6 +238,14 @@ static const u32 yuv2yuv_de3[2][3][3][12] = {
 	},
 };
 
+static u32 sun8i_csc_base(struct sun8i_mixer *mixer, int layer)
+{
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, layer) - 0x800;
+	else
+		return ccsc_base[mixer->cfg->ccsc][layer];
+}
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -358,6 +366,90 @@ static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct sun8i_mixer *mixer, int layer,
+				  enum format_type fmt_type,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val = 0, base, csc[15];
+	struct sunxi_engine *engine;
+	struct regmap *map;
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = sun8i_csc_base(mixer, layer);
+	engine = &mixer->engine;
+	map = engine->regs;
+
+	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(rgb2yuv_de3[engine->encoding], csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 			enum format_type fmt_type,
 			enum drm_color_encoding encoding,
@@ -369,6 +461,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
+	} else if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		sun8i_de33_ccsc_setup(mixer, layer, fmt_type,
+				      encoding, range);
+		return;
 	}
 
 	if (layer < mixer->cfg->vi_num) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index b7546e06e315c..2b762cb79f02c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -20,6 +20,9 @@ struct sun8i_mixer;
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 enum format_type {
-- 
2.46.1



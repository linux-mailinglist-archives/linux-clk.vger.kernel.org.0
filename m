Return-Path: <linux-clk+bounces-10790-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96625955A27
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBEE51C209C7
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25510155A5B;
	Sat, 17 Aug 2024 23:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="gOaUa+UG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M9v0NAri"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73068155A53;
	Sat, 17 Aug 2024 23:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936029; cv=none; b=phN1y/W4TgAg210HWVKb/wsLlSrix8UwmiBZdKdHyvmh4DAiEx6rsxorVhrusgA3D3kFFnE1DnQklFagHusLRP237Mr377Rp27LmYdjYudhPrmPTCA5EnfWE3+u6gCzYxj+0GdDWMDltbQ3DUQJR994GNi2UnhV99QefRtoPXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936029; c=relaxed/simple;
	bh=ZXWkXGV0HXlSA6GvTfKULmS78nf7OVAl0vcmhweOFI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqvfj2SRQC+909K7I2rnnzxuxGAGyxxj+IZWZm/KNRIjfWuOmgB792AJF0VW4wI1+1UdjqAXhUoAXF8fFqYqUgRiphn6grvKzLG4Wl8mDBFecQwV5RSi6I0foWD6FPlJqGYrRaVWxNCUfp8OOoSqdezG6jIJoTk1RBt8MC2T7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=gOaUa+UG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M9v0NAri; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CC9DB114EA5E;
	Sat, 17 Aug 2024 19:07:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 17 Aug 2024 19:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936025; x=
	1724022425; bh=hLXmBGIGTzpfGh4nufRckPFetKrZPnPMLikFvpTLJxk=; b=g
	OaUa+UGgxVUHCrn4S26+vtbAtNLFpPKpa9SZb4R3rAqyc7QDu1euMLc75+1jvRcr
	q2C99k7o3gz7vLnnJsJxRiTtYg3rT2ZyXjrxuRj4+jiExWclR9Bxt523hfdkR22t
	Zs82svkhr8tiTcbVBUsqA7n2jx/NikReo9cYnJgC4J5evRiJQ7MzXzHJ+k9AEUoz
	l7AVcGWclpApmsBbVXhh71JM1pv//+ZW33UjzK0IW22UOhWDnaeJuSYjk3ZLEfF4
	HOyNsjM+/bkfkdMXVkDiN0b0KSKwIDG34kyHF9eRa5eEwRKwUVIgkGnTuhiKyNmI
	jncfNgUr9VlVBuuHi/dag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936025; x=
	1724022425; bh=hLXmBGIGTzpfGh4nufRckPFetKrZPnPMLikFvpTLJxk=; b=M
	9v0NArirk86AAf5Uup46wFlPc5emcpElEF8BGjQ7+ota0os7rSAE6F5cRb4ehHhk
	wycyB37AzmQeev/6c/XqXwUKmNAUE0VIcgBIUE69v4HcZYwpVaadbJ4kC7CYcagO
	MWh2ZQtphGQANJiB+xml6cKBApCKIEklAz+cBLQCzEkG3vdFRIcm7GWdy048ctDG
	u0EVfl8uKsmOTfvPV4UaP16ayQ9IU/+sXh5xvpZukZ1BPCVtKDjLZmFRPDWqyrXM
	XlhHf6nfuYvjs40WGiVIfb73UMXXd21v6xFuNcFxbFXK37onJVSMt2iB5ejccnQ4
	Yca0rWeAY5E05lts45uOQ==
X-ME-Sender: <xms:GS3BZqPxzkjLgWrrVCWpLctm3ur9nSus6Egk3-NbJ5nRG2hGLhwfsQ>
    <xme:GS3BZo9wb1HXRqH6sh4qDxZNS7hFz5jZD-cHPu83ZpL_A8YC9Je7MrFb-uqvt96DU
    TqOejY9BIqCFJy6mA>
X-ME-Received: <xmr:GS3BZhS_x4gOB_8SZcg8m3TP2KYbLwnQiO_AX0Rm-I7H9kOwrxoqnNAL1h_q8ie0M0y72rpRPWuPaDOdwiS9UVZMfVi5PfcLzq8cmz3hG97CQn6->
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
X-ME-Proxy: <xmx:GS3BZqu_C3bXCMbzTkBQNKC8uHQT9Z9-mmndKbamvsy8PEP7u5-gDQ>
    <xmx:GS3BZicCHAljkUf1rhx-YBw0h7bbLUf7X6Vy5fIsToVZ6mfFDtaDNg>
    <xmx:GS3BZu2Qtlkg3CEuG7pdZe74WYKGVQgE4iky_WV_pkeliJy4hrsSxA>
    <xmx:GS3BZm80CswvQDb9AdEzte1B_WV6PXRKlZ9n80dNgqs83l3gUyzCXg>
    <xmx:GS3BZmOZBLkHf5Ryt3yX-R7P3ve0WCyXzGlyoCB9ithFJngLNisNc5UP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:58 -0400 (EDT)
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
Subject: [PATCH v3 12/26] drm: sun4i: support YUV formats in VI scaler
Date: Sun, 18 Aug 2024 10:45:59 +1200
Message-ID: <20240817230503.158889-13-ryan@testtoast.com>
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

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 85 +++++++++++++++++--------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9f..2e49a6e5f1f1c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -843,6 +843,11 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 		       DE2_VI_SCALER_UNIT_SIZE * channel;
 }
 
+static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
+{
+	return true;
+}
+
 static int sun8i_vi_scaler_coef_index(unsigned int step)
 {
 	unsigned int scale, int_part, float_part;
@@ -867,44 +872,65 @@ static int sun8i_vi_scaler_coef_index(unsigned int step)
 	}
 }
 
-static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
-				      u32 hstep, u32 vstep,
-				      const struct drm_format_info *format)
+static void sun8i_vi_scaler_set_coeff_vi(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
 {
 	const u32 *ch_left, *ch_right, *cy;
-	int offset, i;
+	int offset;
 
-	if (format->hsub == 1 && format->vsub == 1) {
-		ch_left = lan3coefftab32_left;
-		ch_right = lan3coefftab32_right;
-		cy = lan2coefftab32;
-	} else {
+	if (format->is_yuv) {
 		ch_left = bicubic8coefftab32_left;
 		ch_right = bicubic8coefftab32_right;
 		cy = bicubic4coefftab32;
+	} else {
+		ch_left = lan3coefftab32_left;
+		ch_right = lan3coefftab32_right;
+		cy = lan2coefftab32;
 	}
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, i),
-			     lan3coefftab32_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
-			     lan3coefftab32_right[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
-			     ch_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
-			     ch_right[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan3coefftab32_left[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, 0),
+			  &lan3coefftab32_right[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &ch_left[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, 0),
+			  &ch_right[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
-			     lan2coefftab32[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
-			     cy[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, 0),
+			  &cy[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+}
+
+static void sun8i_vi_scaler_set_coeff_ui(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
+{
+	const u32 *table;
+	int offset;
+
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	offset = sun8i_vi_scaler_coef_index(vstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+
+	table = format->is_yuv ? bicubic4coefftab32 : lan2coefftab32;
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &table[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 }
 
 void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
@@ -994,6 +1020,11 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		     SUN8I_SCALER_VSU_CHPHASE(base), chphase);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_SCALER_VSU_CVPHASE(base), cvphase);
-	sun8i_vi_scaler_set_coeff(mixer->engine.regs, base,
-				  hscale, vscale, format);
+
+	if (sun8i_vi_scaler_is_vi_plane(mixer, layer))
+		sun8i_vi_scaler_set_coeff_vi(mixer->engine.regs, base,
+					     hscale, vscale, format);
+	else
+		sun8i_vi_scaler_set_coeff_ui(mixer->engine.regs, base,
+					     hscale, vscale, format);
 }
-- 
2.46.0



Return-Path: <linux-clk+bounces-10802-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C2955A41
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47543B212BB
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D28156237;
	Sat, 17 Aug 2024 23:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="JcCS6X1F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uoi4D0FC"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94E13DB99;
	Sat, 17 Aug 2024 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936118; cv=none; b=fLXA+w0J2ixGlApj3BYB8YLjK0P8R1X1HWdpPOwga7Z7iOO+arbnMqWPHPAr2ipIx15KBE8uT/K0IoPcoBEVr4MTzbAWUVuqV72ALgad7FtRQNu2JZVQZEKuhVTYxi7DeCXLiFgQB6BmCibdil5cnXs7FVqx1C+u71Zmxmh9ghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936118; c=relaxed/simple;
	bh=9/1DKHvIroUOSvkQXDXaL4C+LcO26L4BXW6AEBX3loc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOh+yOIgM+hAZ4HzWdhh/JWk67gs9BDOjKL+CNklk5LPrNctWSuhtYXFSft5D4Am+skXVYsCPB0TdB+1qcHI9VHKk1qSU4JXSj9E4I/72IxT3sIomQtoQxTKRyMKONgR1gmHD757hwU5d/Hoc1OZCfhoCSphZ4u6oTznEwXN5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=JcCS6X1F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uoi4D0FC; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-07.internal (phl-compute-07.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CB895114F042;
	Sat, 17 Aug 2024 19:08:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 17 Aug 2024 19:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936114; x=
	1724022514; bh=ZOWASQUTLs5lmuWN3d5P+wrU+C6BCMz0P9CR5q7+zAU=; b=J
	cCS6X1FOF7Xk3Mqq9xTemPRYD8sKBIr4b9D25uSmLPT0LvEc2f+k9rnrLOkmId/J
	YdLkAlpaq/HUX/3lo9z3eww22y8Y19dnXiNVIphQPntdgTcKVlB7gLkO0KhiPpZW
	aVBRaCORwlfGwt12w/IGL5/BGr/GDGp94BJpa3/BYpPCwDO8Fqxc6/PU6aYWKmwB
	I+6ZWTBhH18HznYXpB2nKJelu2TvhFrDg2ORuL9RDk5qFtmmXFo05s6AEgQoBsKs
	nO3RFfs8Jz+XUgcZe7SDM+wASYIYXJLA4MclThwPG7WQPyVkCfcpuAc5gOfsCsSS
	hIPdiQUO/h/lmavFtKmHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936114; x=
	1724022514; bh=ZOWASQUTLs5lmuWN3d5P+wrU+C6BCMz0P9CR5q7+zAU=; b=u
	oi4D0FC6tLB0ERUrg3gw37lAhRKLZg+3qyl2I138AhIKJQTjAioDWl+ru2tpGVDr
	sHRPtDVFAjxa/zYQAAkPA2LYlP9aMRHHEnNuph5TwHwh3bLYYgKVwapNwwmIbG40
	DyUwiNlOhzZGYJL2rjm4K8Xg4jPmBKZXQ4tcr1q/gB1tHhJAN65+OEvZW0h9VIsN
	nE9gNLNVLoeTlmlKGUaq2z2TA/MLsHwhFdhZBNetu/dHZuZdljn/Hjpo/qAEOzLO
	pyxtIhtmYI8sABzVTbVGun2JzpKs63z3hQp1he3JhxwnMnHBNAQj1Q+yzBzx6W3m
	kPNR70j+GWL/Ph5wpDYGQ==
X-ME-Sender: <xms:ci3BZrQfP1KMKdXsxSYtcddoD2ujrXHeBZyFK_1CacwjfWBeQQP_VQ>
    <xme:ci3BZsxTQlW7wCO05tmEXNUKAkqDTou2FpEOPLur7J2Pk1Enu4xkoAzGbPSOAONKW
    k46by9fZAhojDJKLw>
X-ME-Received: <xmr:ci3BZg1O9wMwlfvhwt0FFeAvvZO4ha_mGEyt9fZrN2LMw1KdZ58D4-IAh1DUNZhr5xccpMKLLbjxs9TYnZIc8GXqbpDOPEUtGgmrBmhQ960xgqR_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ci3BZrBVS1_OuVfs9fNJbqUubXrVaZg39OeacxxzeQVgMdJgpbRfAw>
    <xmx:ci3BZkhgkxy6voVwScpqb4IcNFO-DhU05M7mk9HIvohqRVaaX3AY8A>
    <xmx:ci3BZvpKh0ZWowsQtgs_6npGiSdvCDicE6gutE37mAhfd0NgZ8W80g>
    <xmx:ci3BZvgZDfI5SkojGfyLi2jbmDloefuFOF_0gXCLm-JO6_FW68PBMw>
    <xmx:ci3BZvQj4k3qKlVgeSg8EMZo8Z0-Z11tDDztVoQduC-KZIQgJzSfF1lG>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:08:27 -0400 (EDT)
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
Subject: [PATCH v3 24/26] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Sun, 18 Aug 2024 10:46:11 +1200
Message-ID: <20240817230503.158889-25-ryan@testtoast.com>
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

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 19 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7f1231cf0f012..180be9d67d9c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -95,12 +95,23 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_disable(mixer, channel);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index e7242301b312c..9c7f6e7d71d50 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -845,6 +847,9 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 
 static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
 {
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] < mixer->cfg->vi_num;
+
 	return true;
 }
 
-- 
2.46.0



Return-Path: <linux-clk+bounces-10782-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC8955A18
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5D21C20B22
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEF6148855;
	Sat, 17 Aug 2024 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="FfXnyVEE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GoONJZ0t"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1311187;
	Sat, 17 Aug 2024 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935970; cv=none; b=c+eEpaIX6ta0kZ5SAM7Eb+Yyom07EiHLafp0HRxbXaX8h5CJNBol6FYufFj/uNeuusZ0FWJ/vyVXBYSqe0g927gt8NS/MI3EhDK0ysJhW6bKZXND46NtWScEC8akzJoxF9KXJnfLdvAVUqKXdWnaKbHYwrPxOgMWcDddxkz0Ui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935970; c=relaxed/simple;
	bh=mT5kPOrGdX+/KrMPPWCB090aYHQU1WVZt1Xy3EsaJT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SELQ9Jd1mZ/wEluFiDWgFVCVH0YuAfjoXOASgpKf8Nj8R2zkkC6/Di9c4GT7cnZ7k3Gq5304cIBr7RnRgAZQNu1y5my4X0rfhPP42U+7lIB4I1nYgFynVoYt5oFQ9oKg4isHLYdicgp63aHIdKdYqAZZl+8Q2uATPbQnJXxxLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=FfXnyVEE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GoONJZ0t; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 27D2C1150152;
	Sat, 17 Aug 2024 19:06:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723935967; x=
	1724022367; bh=qG2/uQfs+g0HVMch4QLUx6OeeZoxlVqfvaiVKsGcu3w=; b=F
	fXnyVEEa5CgKjPUP5oIkDFtm5P2epWyANxX+68IUk4ErOelFNZt5Hn29/0FcmKWE
	eZa/IaFFOcrhLvtGZqattG/fPQFKJS7TulXKSQ9vg3S5JUlFGuwkbk606uzbpgxe
	RXeqiZVBrcw3h5hc2gIKQND9645yEguUUpJyrz8FMT4KHzNzXxLvMKq0s6+HSrcN
	XgMK6QjFNRiVHwdJ+YC49TH+8cdI5o3xwY6kpJD6jmEKLEhuE9xjhAQSsfpKY+TD
	9Wkx0Jt3azjpZh6YXBjlKovryZTi8KadkCWJvG1fXXb16kUVrvL+RYDVNhnmMllB
	+B63KP681glKHJjryWSBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935967; x=
	1724022367; bh=qG2/uQfs+g0HVMch4QLUx6OeeZoxlVqfvaiVKsGcu3w=; b=G
	oONJZ0tg8AUQv+icT0AaPrKpKg2ChXaa8eT+n30yr1g9FurHHet2HI8UIQCYzkP6
	nff537V31kROgblSSA09IzrOculnnOvmIPaULVtdjOam7+4IG6oT2PYN2JqiDeai
	CW7JgVlDHBEu5W+JP9sH+JtkbY3KP6R0brGdZ8S6h/qoJMYw+JmlZbq7Bb4NAP+6
	AL55NqprH9Gc7MDb+2/hsSsav4j725VO3d5MAWwjVF0fQOAPdHJViMX/UuM+Usk+
	LCY4A+BoigYXCy4zOVYbfFX5sHJp2VEe5vShGMa7cJ3c++1eBscQ6V6YVT6KYN9N
	3NFMd4CZvVeO1coSl8n3Q==
X-ME-Sender: <xms:3izBZhGclOTxx4my1WN7oaAjyqbDo1nCzpI0zH2KKtzrPPtkjdgnZw>
    <xme:3izBZmXVH723BFK9k7q14EJUTOlZzZGUwEM6B-iJHdouUYXnB3LF88942jC_AlztT
    8-7LTCMxXTVrKrFNQ>
X-ME-Received: <xmr:3izBZjLywmYM0a-qSY6rquvyJYr8Ey3IZAa8j0ujVd91tyk2Ebg2dQenVdoRI3rL6BK5X_3cBrlIbrIGky_hRscZjyOKSF1Pd_o-parkON0YF8g9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:3yzBZnF3lc2w4OWdzaAytsdYR4uIwukwxiT5mdlR1NVLv-FdlVpeQw>
    <xmx:3yzBZnUlYyhLKqh--2wjw-cO7JpeS6dZTPiEtrai005y07qmJ2kVFg>
    <xmx:3yzBZiOtoMQ2aCnDsXrdywTLOMy5_gvZnR-2ab2yTUObBXPsVPmO9w>
    <xmx:3yzBZm272HyPsZg0l7myGIVHj-_h5j7pEbY0Bt3fIPbAuCJVGjiD7A>
    <xmx:3yzBZtESxjyjUvli2DjGJQ-_UUmzGiQMt7mGVpcYetK1la2IKvfIalF3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:00 -0400 (EDT)
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
Subject: [PATCH v3 04/26] drm: sun4i: de2: Initialize layer fields earlier
Date: Sun, 18 Aug 2024 10:45:51 +1200
Message-ID: <20240817230503.158889-5-ryan@testtoast.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index aa987bca1dbb9..cb9b694fef101 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -295,6 +295,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -325,10 +330,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f3a5329351caa..3c657b069d1f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -478,6 +478,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -536,10 +541,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.46.0



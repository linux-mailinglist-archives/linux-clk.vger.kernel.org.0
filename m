Return-Path: <linux-clk+bounces-8290-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49C9102A0
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 13:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1B7B2317C
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 11:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4951AB8EE;
	Thu, 20 Jun 2024 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="NunYtibv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N2ddD1k9"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9F1A4F09;
	Thu, 20 Jun 2024 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883154; cv=none; b=kyWdoplSJ1plG7V1xe/Vmvkks1HqVZtKcw003mBRV/Q6RLQ5PIZsRempg/xZzk7NKVkNpWIhqYPQSmg+K79WasNnQw7F9obfxnVH7g6pyYmaMvPI+vnmIw18K16P+ExjA6aCxjRHfHUck/AVWCCkLoIEUw1Vuwc+QVtmBC2x5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883154; c=relaxed/simple;
	bh=8YVfwSNlzB/6d5RaR+RT5eC2BqDILP0+FvJzvg4U7/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRDHX3UX8Sb7Y9qVA7QxWp+usRvWVMNoX7clbAcD4sKsHy0gzmlTecbxYHoen5IbSv6nSWzLX0fJ+72ODE5rGJS6CQNTx/pjYGcHwwUFJuijjxeyIOxRBGe2fzotXLVREFj1wAMHYVNoNMxwxseoI9B/TflRBNd7u5Wdam7EbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=NunYtibv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N2ddD1k9; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id C208613804D3;
	Thu, 20 Jun 2024 07:32:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883151; x=
	1718969551; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=N
	unYtibvf57bb/Ij8GEEGuOIe/ih5a8T4F5ro8IPDktqeg7jN4qW2KDEiBxXkueNK
	pSUUxGDe9loj+aVOQaeWx+5wxX5PY4mFMYsvxg8TNtT4CD58+H3mq/wWVo24EHX4
	TwcZvyV6GaAWBVbSuDrsEiZyihNKfLyUrvGoqEaJv3PN+PY1EltcQx7z9h9PxZsy
	jocwA0k1KAIZigd3z0eUtgcOZHzVLkIwf7I6w8jmKgMgnrKOY7Hu3UhYPybWRufm
	VkdBJBoJ9jtBb8XhDh4stqwOzQjjlDUev0X8NqnDIdDtYvaDeKIw+EAzlh8eAo+8
	e3yv3buIJ7TPva6yooW+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883151; x=
	1718969551; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=N
	2ddD1k9yer0LRPeb2zf+NlqWvWlvgBU7ZkkDgWrcx5RO3tQfv9j/8OoD3EH5LApe
	5GOP9tcNdeWBaeeqnm/Oha6R+FF8MbexF7lR1+btN2orOlNAm76p7bHlULyg5T3I
	vTeptEbBK38dsbi7C/LZojGJLRxKB972HYH10kEw2T5beiDdA6S+ZU+yWV0/MzQ3
	UrP0y+v3qGLRxbWt2y5TpozTill3zmcgv/S0gI5yCcfQFHct5mPgr+Gf1sA5ZXy3
	qs9NbA3qUwu/EouFUxoAQ4DpTMB/eTbbVwqKDRZTZ+PGaQZ/CoMg1amh87UtycGr
	xPai+P+ECgGCIhZIaPEGw==
X-ME-Sender: <xms:TxN0ZknBGPBdJlqSK3tBef9l3buZ6FCGRj70Y3E6qqNjU5yv5Zmq5g>
    <xme:TxN0Zj3-cz2OcUuUOzP8mHnwxIfmV9RLp9NRrZjXnWIEfxGidBQEON3_zIKoTp_W6
    NRdXEn-rBnwaMUGbw>
X-ME-Received: <xmr:TxN0Zipmap79B4gvCBrHp0CE0pLaLcoSVcYo4uv1n-_KTKaCqhoSgt8QqX_TLwH4dKlE250m-Z4tRqCvsOEVjVy9YfExdte9Bmc4ByLymUIDI5eB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:TxN0Zgmosurj4_IGSkRuB23v9LZ2X90y1xlL_QX6oNuFrTG-2o8TKA>
    <xmx:TxN0Zi1mmWMRDkH4S_QnzHb2T37s0zHsHJidp08lyPHyXIU534_OSw>
    <xmx:TxN0ZnuLf_JIeZwxxH1s2pw8qvx4ZZi4afLYApI_X3-o6oaA8sg1GA>
    <xmx:TxN0ZuV2oIlQ0S3G8Mkt8xFKtTEYCc4OxgNIhRbvrIVnRvZNy3ujXA>
    <xmx:TxN0Zgk0HQIQNApszSRcpOS9O7SjmZ0yt9a8hvKIS_s__55Ac3zTut8N>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:26 -0400 (EDT)
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
Subject: [PATCH 04/23] drm: sun4i: de2: Initialize layer fields earlier
Date: Thu, 20 Jun 2024 23:29:42 +1200
Message-ID: <20240620113150.83466-5-ryan@testtoast.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 884abe3cf773a..91781b5bbbbce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -365,6 +365,10 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -395,9 +399,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6ee3790a2a812..329e8bf8cd20d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -549,6 +549,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -607,9 +611,6 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.45.2



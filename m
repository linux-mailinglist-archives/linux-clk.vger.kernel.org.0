Return-Path: <linux-clk+bounces-18157-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A65A376E9
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 19:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 565263AF72B
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 18:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D661A0BC9;
	Sun, 16 Feb 2025 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="c++VGV0m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hszy5to4"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE5A1A08A3;
	Sun, 16 Feb 2025 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731259; cv=none; b=jbkksopcxm/6ZNw+UsFDbEYMfrtdW5Xw1uDo+ZEbEz+Sus2xTjiXnD8flWHmsl4wgHyT2EdXbWrCt11xOtLIUAsM0zPmD7mGEuRIXFhOj1e28YdCJmkfw27wqTuRkiHNpXcvwE1CkIAfNtB7hpXR86LzHAz69uZ6l6te844HkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731259; c=relaxed/simple;
	bh=QvaaEw1/bMvVxNHss/KH3wDZ2qgHg/A//EueXYa0HIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwO2R/QnMA58grWnkPUzBac7DTDEfmcd9BV4l2V0oG7JzFsKblL/GjxAD5xt4qTN1jHt7hmEOU52KaZA/Wi2nnnxy1VUS13KMR7hI941vGk4SJ02KP43vCI4kkwYKRO0tGVByWHd9S+dNMDiNeJNX5Zz1TROYumwLHM0EJXzO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=c++VGV0m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hszy5to4; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 224BF25400EC;
	Sun, 16 Feb 2025 13:40:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 16 Feb 2025 13:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731255; x=
	1739817655; bh=QjD1ZDjTlOdhXrU8c38PMPCZ6hMJn574nV8c+MDBJsM=; b=c
	++VGV0meB3oaRXQCdYncFUZgwKI48SzRnwGdc34rKclBmgPDNGwOB/dQBVhQdVTE
	cTejqNu/ld2m64eSvbEcBJffDFjejADdDSgWP3BWbO5Y6AAh2tivsY/4XPuLeKZb
	UhXkIgYhwuQdgoXb3ilT7KS40VV3VoIXbjejgePdXVGWzvUeYHmf53bpYV/27Yh1
	1MxUb9FQvdptEvUvy9fy3aCX/p1BhZRB4w2zY+iJGIUaTSLg5Bvcpp6VmfIOEdtH
	D6hzPuUxmkjGIXItFbnahXZnmIX43vAScdtrYVXD2JyXkwcKdFU6M9iY65jEI0lW
	iiBRHl/UJH9ei28OOGOMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731255; x=1739817655; bh=Q
	jD1ZDjTlOdhXrU8c38PMPCZ6hMJn574nV8c+MDBJsM=; b=Hszy5to4jGFtfMzu8
	WwpSp2PFaqtb85i/CWRaCS2kLUuA7qYc0Spl2WkHNrnut6voD82rsXv7xCy8FQ7/
	fc6Vx0XME5g3EpBha7MFzAp/cYm4lASTN7Sv+2I2aWDVYfQEnTIKeaGXQ3pGTqAK
	1rwdilxlP35yxaG/eP3gnayjQcthLzw7759LZkqfm5QVE9ATBPLg0xr8Ys+Wm5e1
	XeBymzdYU4loW9rajUYhLU0VXi8P9XcyBWUsbnXXb9vfYunJjYo2K52v92d0X+UP
	hsGdDVfijF0CGgeKDdUU4YKdnt91qxokvCXpjTCTIodmdsop+qbybuUZdHtclEW6
	/cOQA==
X-ME-Sender: <xms:NzGyZy8v6OQ7RW5e3ig79zTjaqjOTXrAncwjYz1ssiUMnvWuXYU1ew>
    <xme:NzGyZyttipp68XA17ixEwTjxZLAqTYYmOEGG-LuwYxiB6xbrfPrzhr422L2hcv_zx
    M2Rzxyx0C5i752ZYg>
X-ME-Received: <xmr:NzGyZ4B1CRBJU_gI4jxcR62b2HjROAHillnqH1ylI2XBCTnr-imu1RAEhr0bqhrPJgLpw2PQRP3sgTnrcSnJiJnp6M7fHHKS38KzHuV-RzCe>
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
X-ME-Proxy: <xmx:NzGyZ6dze-pVrqFWlrhN5y0JXrTgjRRGvdxuc1ELp5MGCsDhst3YTw>
    <xmx:NzGyZ3MMsGyzchVjBb63jCjVzKe8X8DmY1lBxzqEuwVayUKjP7J3gA>
    <xmx:NzGyZ0k7DydWSNs3t9CQuTxWpLa4z4QBPKMSAjdsCjPNPz-IMu8g7Q>
    <xmx:NzGyZ5tlqbgOqgYyglp-s1gRuf4BWQUw602DOQtg2kdhWJujh6s_JQ>
    <xmx:NzGyZ6cXWeHP5XJ126oIKzBcENycnL0Sc0Oiyx38AzJ4VccplsYephIh>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:48 -0500 (EST)
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
Subject: [PATCH v7 25/27] drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
Date: Mon, 17 Feb 2025 07:36:25 +1300
Message-ID: <20250216183710.8443-26-ryan@testtoast.com>
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
2.48.1



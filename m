Return-Path: <linux-clk+bounces-7856-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D3900177
	for <lists+linux-clk@lfdr.de>; Fri,  7 Jun 2024 13:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707172893D8
	for <lists+linux-clk@lfdr.de>; Fri,  7 Jun 2024 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A6B1862BD;
	Fri,  7 Jun 2024 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="t+NmQxuT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bOSWt2Um"
X-Original-To: linux-clk@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A16D1B9;
	Fri,  7 Jun 2024 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758197; cv=none; b=htqhI9M97KonERZU3LP8SNuxBby4pU/ofReEIBu52iQrYbL9kYkyIwzZpYj2vkcexpDxzNu2thN0+wOb/8SSUBGNyZDjBE7auR7XJm5VhPTGcw2K0nn26MNkVsNwQPP49zZ90EZ4yRLapX5Go//kauUiFnskMfpA0r7w6lmdewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758197; c=relaxed/simple;
	bh=VSS5mHkk+62jlTJiq62tjdDAJkEjBgcj14xCgj/4/KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gs1cEc5hqUXWz2dHjVLPXBFDu2rCsWk7X5t8/Ngo409DeIoZkLq62iuaYjrDR6klHnwKcqPSk19Xp4NowL1B+KaRMiIuq7/SkOGKkT7uT2MfljjY1Et4aT0M/u2QYxNnRj3rDPEZ/8j+MmG+ZCA8lS2gCdlEdIsVGu1Uyr23ceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=t+NmQxuT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bOSWt2Um; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 89B501C000F0;
	Fri,  7 Jun 2024 07:03:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 07 Jun 2024 07:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717758193; x=
	1717844593; bh=uxxj0kRytR4xUJkNxo0CSdi/jrBjbr/V1KlwzqO/4No=; b=t
	+NmQxuTOHWZxSmfCyflsnf4eNtvj8nQCCVi7+i1ne697tje5wW0Yq4Wscel5eiLo
	Ekx8VVNonz0FnoqapK6vamX0sJDU+uE/vTRdx676omgKrdlk091lUEvMXCdtO6ZN
	b+vbvH1ITPNrWUN2Dm0ZP8ooFECTiJ8Na+zd2IypA1qg95SuCG+jOjsdkWJdsX/+
	ItUHzbxo+rQLu4JENGqsJ2l+d5UZxxGkJAmGF8vHdP9BMF1K+b0lyRbxQ3TmaPFo
	i4rMFyv8E+lYJW78/WZowRhqi51ENMaTmBm7FNfh8L1uhC0hVPgxoZR/KHRclP7+
	9VIev8ax/YfmdhQsGcHeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758193; x=
	1717844593; bh=uxxj0kRytR4xUJkNxo0CSdi/jrBjbr/V1KlwzqO/4No=; b=b
	OSWt2UmN4v2NXNrMlrK0oRGvoY49ETpe5NnbulN9QVt5adHg8yL2MWaiomWQuP5L
	QwI/NtcDV54n4cP6rZesfqHa94tZXR785+eOxHUuJmFA9SfDv1MpMyUc7wn9PSip
	GrL2Mz1LoRpF7I19wb/IXcZ4oRNzYcwqFyjOyaLN8wup2lq9NDJlVY6T16VKNlP6
	2dPrzs4hfwD1h34Gf1veuuXiJJlmwgcSt0z+48pPrWC5FaDnf22ctA92s96+b+Nm
	8g3xfTZbeUxksLPIKqXaZ1r2IBGQyvgAejX7j0XFDpQXmRss5jU0GJV5IbP+ZaAX
	4OMWM4vSY9rCp7RnRCUow==
X-ME-Sender: <xms:7-hiZsIFzqwx2fFYj_ZBjRn86DQOz_arP4NykEiusN4g9Dv_SaMpzw>
    <xme:7-hiZsLbsn9AsN3W64AWSteKtNO4r_wSW9jD2vLAJlRWGiFRMCHEKfd4ZimfZjTEs
    BqvW1Zf7CY7yTHKVQ>
X-ME-Received: <xmr:7-hiZss10NptuRdQb12UxGF2xplpzX6jmVFU3GoKpIJq4FV5PubWbYsabwKrqzsAGgmYO-PGrapHFNJqLOIYAj8ZlBHin0-_ZZA5B2YRL72f9GFh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:8OhiZpa1AiHlU6RsOoMnrRyGHGFTsp5YN1QBQX9Pf5yjMnF8G6Dopw>
    <xmx:8OhiZjbZ1zPvQSbxNfy5P3j-Vr53nJHoHkEyHm57LRWFKY185tVSHA>
    <xmx:8OhiZlCcvJK2Lf1E3idAJtgUVIUwYq0_QBTVO9tRlQiJQEvv3gJikA>
    <xmx:8OhiZpb_G9vW79TfEDn5-X01zXO2NvOjL9mm_CHFfSf33sLdu5iNYw>
    <xmx:8ehiZrrUqt3M2hmzwr2YT4YXkxBBqFxZnjI5pUUBO_bLecqxza1RPBnZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:05 -0400 (EDT)
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
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 2/8] drm: sun4i: de2/de3: Change CSC argument
Date: Fri,  7 Jun 2024 22:59:58 +1200
Message-ID: <20240607110227.49848-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@siol.net>

Currently, CSC module takes care only for converting YUV to RGB.
However, DE3 is more suited to work in YUV color space. Change CSC mode
argument to format type to be more neutral. New argument only tells
layer format type and doesn't imply output type.

This commit doesn't make any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f704..6ebd1c3aa3ab5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -108,7 +108,7 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 };
 
 static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
+				       enum format_type fmt_type,
 				       enum drm_color_encoding encoding,
 				       enum drm_color_range range)
 {
@@ -118,12 +118,12 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 
 	table = yuv2rgb[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -141,7 +141,7 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 }
 
 static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
+					    enum format_type fmt_type,
 					    enum drm_color_encoding encoding,
 					    enum drm_color_range range)
 {
@@ -151,12 +151,12 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 
 	table = yuv2rgb_de3[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -206,7 +206,7 @@ static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
 }
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range)
 {
@@ -214,14 +214,14 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 
 	if (mixer->cfg->is_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+						fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
+				   fmt_type, encoding, range);
 }
 
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cabb..7322770f39f03 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -22,14 +22,14 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
+enum format_type {
+	FORMAT_TYPE_RGB,
+	FORMAT_TYPE_YUV,
+	FORMAT_TYPE_YVU,
 };
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range);
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f9c0a56d3a148..76e2d3ec0a78c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -242,19 +242,19 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
+static u32 sun8i_vi_layer_get_format_type(const struct drm_format_info *format)
 {
 	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
+		return FORMAT_TYPE_RGB;
 
 	switch (format->format) {
 	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
+		return FORMAT_TYPE_YVU;
 	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
+		return FORMAT_TYPE_YUV;
 	}
 }
 
@@ -262,7 +262,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
+	u32 val, ch_base, fmt_type, hw_fmt;
 	const struct drm_format_info *fmt;
 	int ret;
 
@@ -280,9 +280,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
+	fmt_type = sun8i_vi_layer_get_format_type(fmt);
+	if (fmt_type != FORMAT_TYPE_RGB) {
+		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
 						state->color_encoding,
 						state->color_range);
 		sun8i_csc_enable_ccsc(mixer, channel, true);
-- 
2.45.2



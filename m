Return-Path: <linux-clk+bounces-8298-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BD9102B9
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 13:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D376285618
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 11:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B631AB90B;
	Thu, 20 Jun 2024 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ux7p/gsS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sJmaSlpa"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BF1AB904;
	Thu, 20 Jun 2024 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883199; cv=none; b=QqnnA2OuniK5jZia2FkRWocFk7m8t0NUSLBObD6171niO4UoS4rfOpnUORSl73bVOBiYBfbQ7dZSaudOmBsRF6BSGqiwef8cTXzdacVliUc7E3aiPi/VoUNnYT1hxxshV50PyB/EP7fLWMrjIiEvmmYmzWLNPCz0ukqsQuwRk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883199; c=relaxed/simple;
	bh=ijqKQz374lJv+tJuAkL3ntcexmHm+jUoGgVMUaPyF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=od3Spc7INvML+DJe74m3qNAxCyoXHb3TGxcFabM+f6f3dKhvQc9bv5VntnPBykCu8QbILGS+kvCI5WSpyGhzSkqy/GcYHtMCKlr+xW+i6uK1KtZO4inoksAihEvUe9sppLnArlbFsfkXsq5wL8H5mCy1iy70kyBYdy3Bmyjs8Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ux7p/gsS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sJmaSlpa; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B87681140247;
	Thu, 20 Jun 2024 07:33:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 07:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883196; x=
	1718969596; bh=pvoMVK3QIwaGBCeZKDobPmSMyeTa4QTRiph2ffKgk4c=; b=u
	x7p/gsSVaNfznuSDSyfjUD1ec/9ADAw31pk9248HFrMSWQSqAB9ylNTN+U/RdQqq
	ZfJr4gReboxdS10OSInrzR0jns2JWHoFBuOIgukTEJ8zpIJfloz2xXC+JXeuf/TR
	WpL4D4R1Qc7P+DXNUOnnTwAeUkSzIUtFKuJ59zUpmh4BkBVaFg+p1p+8r/Zh9Ihk
	x2NlHeNlAVz3XB+M+BuFbEOgohtXJLbajBtBnJ/n5hPFYbcU6xBfz6iXWGMtspBE
	1S4FxjcHmk4jGFts/184kHK1xKgGIldWVzewrO3VHW43e2LEIOXDBTK7q/VCtfAy
	jHjPu1yOayDyvRiFp0BKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883196; x=
	1718969596; bh=pvoMVK3QIwaGBCeZKDobPmSMyeTa4QTRiph2ffKgk4c=; b=s
	JmaSlpazIrTtTOPtrvxhbbePxaH6IQfu1bbJKSKEdGX7XHdKItKAHaMJu64YbA0L
	/YNfWMbo3lAIAFd+W0kzolCZVcsyJlpM4CThTMT/TypECLbKQxafCCCIWFrWqZZR
	Ud+Fgw8Qe+u+cjse7GWPSkO0Ehg3FPD/LjYz9rIRDkVUaD9AfrLPzerjccFwqXdR
	BjPB0IgV2Wg4pOPIvX68Q1acqQbVD/yCt+e4ro/v9gZ8IJSbUtLzYUzDal3vzap0
	IpffVJanYxwl8bXkCfst0huqjibWQ/92S5jwcMr6sIFb6ZwhHwxMR4UJA6cPCU28
	XSYJwcxNZS5sHzoKVivOw==
X-ME-Sender: <xms:fBN0ZvA2SHERuKXP0NqmtK4YhasXL7rclOQUDAMAUBExBLtnl0jTGQ>
    <xme:fBN0ZlggUSptYRsGhnJ6Ruj1VW92IyTz0ddjU_ONUp4uDzIPZpe4jYI9DynxFWMSV
    k_cWXorTls7qHW58A>
X-ME-Received: <xmr:fBN0ZqktGgArf0OWzeRKdPqkTOOb1hjFXTIqXcj6rq7RCZ5XOsiNr3eszmyttOy1_7qbwhZNiItGjClwo0Y4JN0UKDtXPg9cEMS_q1P6QwS0lDiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:fBN0Zhyz2nrtfvfSPJMqEzWynVH8CnCy1zXB9ulgYMz40KBJiufnvw>
    <xmx:fBN0ZkQvHW5o1qRv0PJIlslv4jlkK3Nyl942yvW7ER8o_MlNuoTIBw>
    <xmx:fBN0ZkbUeiabfV7fXyBGirLExsbx3s-3Ns37rN_H-zcqdBlw6hfoDQ>
    <xmx:fBN0ZlTXKJQgO_LVF8nAEQKzA5GGt0asNjyvmBKVWkgzZk3QBeIfVw>
    <xmx:fBN0ZjCJ04ETAYkyhyG8cLKqiuwdntAgjwR600655fnm8ftSBywz8z8x>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:11 -0400 (EDT)
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
Subject: [PATCH 12/23] drm: sun4i: support YUV formats in VI scaler
Date: Thu, 20 Jun 2024 23:29:50 +1200
Message-ID: <20240620113150.83466-13-ryan@testtoast.com>
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
2.45.2



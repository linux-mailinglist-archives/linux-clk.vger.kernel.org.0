Return-Path: <linux-clk+bounces-10787-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B37955A21
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BBB11F213E4
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D2B15574D;
	Sat, 17 Aug 2024 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="TZsNH1u3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kBXEeOIE"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECF143886;
	Sat, 17 Aug 2024 23:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723936006; cv=none; b=l0/YseyJ9o7/O6vOhzjVE5MsGqWs1TEsDZeefMnRK1ERMQXuM2h7ZBF6nvZAXQW0Oli+mkkOB0Ii1QMipK4Nowb/vDOdvHAuBGNwAnD9riIw9e2KoPacwgyPgrrNFb/iJ/kz1tc0w7BeoxJeF/H1e/aQ/P4a4n4heRd+gG+gYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723936006; c=relaxed/simple;
	bh=ieituFjpZDwHwxpKxnZeHrufIXrFiQVONoiNLrBimkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmJ/7i14sFIQCDH2eHllrgzvmWSluw3r0UVeThiw1ZkLOdSkJR2T4IxEonbOzsQtMnMgAT+sI2g00MRobh7Ryu15wJFuFBrNvMt4fgK8p5ieOjnh+1sSWgVcYBBcy61Tha6CYIwVIYD+i9tCmq2UX61bunNxsO74bpjaOaFASRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=TZsNH1u3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kBXEeOIE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E384F114EA06;
	Sat, 17 Aug 2024 19:06:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723936003; x=
	1724022403; bh=YoOuJ0Qko9n+FlWYiYRYvBxdzTrHva9CmoGCPRGJ8rI=; b=T
	ZsNH1u35v6bi5+7rIqmswKklH6X+2g5St3iYWgznG33Z8fgoZ/fhmNjALDXBi8g6
	PaqbKwd4LkAMXiPN9vm8yTuJH39U9mEsI+i3VxnVGI8ounNfIw71A7wXI+v6SkWH
	e3mqS6nPUr7Z/HA7Q22LTr/aMn1Gh4IxEr/fJS0gbWqOwHLRipFL86kqJ2Omi9iE
	3hohgF5EbxTjojHicGuBjAVqU44u8+QaGw5zrOf9jO0AxsFYYjAqHyoXenhMK7qC
	k6eErnNNbabG94GVYf1P+MD/xDEYXkBiQavMrASZ5Zg0t6T+k5TMC248o5XCdgLR
	8BNrN/rDk0DtBxluvQK8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936003; x=
	1724022403; bh=YoOuJ0Qko9n+FlWYiYRYvBxdzTrHva9CmoGCPRGJ8rI=; b=k
	BXEeOIEr0rGml0hcV7DX7RuiytEVvnMFNtqlEPOFmCaQZJs8zDGvidPB8ui+5T/n
	oV2s5cShYFDDZ7NIPgtQU1w5iLAC7vUQr7dRtgNrJac3pfhC0kDWp5pPkgfvsEil
	8W/ZZAPffA7lJBlGvT9mFwmCzClmd9WTF7Qr4VAU4NL6rIvHJ/Hmm1XKZckFKxKj
	Fni1u2C/GOVHO/g/G/wLDE7PpVWlQVjUww7fWh5S3nlTRkzdWL1tTsKFMhoQPYFf
	l6S5rQ0dSCmynNNHoTH8wGCOxZMGeTkHAt8A1zOHjmflMyRhnCDF1OgM7h/ykKy+
	8Sl0PiSlZxqEsOB4MXs8w==
X-ME-Sender: <xms:Ay3BZjhwc53arRgn-KhMQU_QP_Yg03t5zOjRR4l_gW7r17kVGZUdBA>
    <xme:Ay3BZgA0jwxzbGaT2o1mpKDVcvv9MOCP0VZIoz_6ISrn26_1DnPRo0Xbw4YXueSAt
    pRwHif48DWefhQ-gg>
X-ME-Received: <xmr:Ay3BZjF8EemkXa9dYZfKrbTUc2wTE6RQ9d_VWpk63BrjrdWeNdyg0TSEFUEscJOhD1qvVNm4lvJMB-tsBlMaqVL8BmG51b1QQwC4aYVXGyRoZsoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Ay3BZgRTFTKmgCdVo5ywrZz1UFJnm2ZecGjZg4WoP_lG-B6eMN8QYQ>
    <xmx:Ay3BZgy1nbcpuThXa8rlP11Cu_k_VdNKZfDMGi5EuOQEZPaybil35w>
    <xmx:Ay3BZm56xa4jEH9hdrpiItDglAXIhxYpf56mAFX9SYq0YiOvTy28dA>
    <xmx:Ay3BZlyGGYq9b2DbyuQF2G_06MV0GF4sFVZkMMX0TVZ1s9Yznle4rg>
    <xmx:Ay3BZngGvfunA-H0jdCB_cWBrSUku9wkCOBIlZAa_ynTtA9GkSrhW8RP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:36 -0400 (EDT)
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
Subject: [PATCH v3 09/26] drm: sun4i: de3: pass engine reference to ccsc setup function
Date: Sun, 18 Aug 2024 10:45:56 +1200
Message-ID: <20240817230503.158889-10-ryan@testtoast.com>
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

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display engine by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 68d955c63b05b..8a336ccb27d33 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = engine->regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.46.0



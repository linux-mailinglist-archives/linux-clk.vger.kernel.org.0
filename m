Return-Path: <linux-clk+bounces-12273-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DB97DCA8
	for <lists+linux-clk@lfdr.de>; Sat, 21 Sep 2024 11:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 337E1B21265
	for <lists+linux-clk@lfdr.de>; Sat, 21 Sep 2024 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F530165F11;
	Sat, 21 Sep 2024 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ODIB9VBV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d2bscYA7"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB64161313;
	Sat, 21 Sep 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912446; cv=none; b=S7X1EFmxowJ3h8Jqy631IiveOUOL4v2oejvZfylbAC7vDkOMtB4F3VkITR8o/cedV00KXLZ7mifa01OQshN7PnF5skI8REuV+yGnThEFGP51ijZ+WjW1NBt8mVdQl4sfEFZGqQUfLE3EGKzm4WjS1WKYEXfpji3cIj3SppLoh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912446; c=relaxed/simple;
	bh=hyPojGGohhnXMO8b5gQwGhaz+6XqSf3SialaF5c9pDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRFMJYzXQrqMpbFltGKmmLS0PYAfKGGDPTPKsiB89Sj6vInWwOhB7m5D42LKC8xTN2kZmJcS4JNlqUz4PUbLci2WeVXRyp6+cOtgMc0uA5/AuKTrEWhg0pp/V9OZqd7A0rmlJsr9mSNSiqrHAak2jOfVHJm/0aDfy3BytcLMdDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ODIB9VBV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d2bscYA7; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2AD921140245;
	Sat, 21 Sep 2024 05:54:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 21 Sep 2024 05:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912444; x=
	1726998844; bh=vFAn77DPkhVmiFKjEXXB2+gUQSssJmHTL5ELI1Q/NII=; b=O
	DIB9VBVyRzM2YnTiFMxTqpWjbBiUsb02dkybBCp1hDiDcsAz6Gd8MflvS0WB+uhQ
	LcEPaoEziX/qePGRlmQr5gEaL12I7sCBdmol6mUS53U8BOSX/AAVf0rwUGtbXs2X
	QNDa0V/dNyPk6u/g0SgPXtdkljYrHCiK4Kx4P5yV3AxvZW2mg/kh0ezXI//8S9hx
	Cieqi2anBH4ohbJd0coNuFM3oInz/+NaFSzCrA5ooTmLjv68WDz1xqSUie1rE7bP
	DL7FFdDhx2Pdp7JVvLlFbNT8czE2oRulRjQTw4WP6GOufqeL2PVBVQ45GuOc1Vs2
	EYzMfXvOlp91bBhIIZUXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912444; x=
	1726998844; bh=vFAn77DPkhVmiFKjEXXB2+gUQSssJmHTL5ELI1Q/NII=; b=d
	2bscYA7jXk8Yq0x6tpx6g0fld/0PC6hkwY/e0ytqgjpgU4BHND0DygZCJLUpweHN
	cnj8eYCIkcvaIAwmJm8sBYt/B6mcgPvc5K974ljeO3wHW7z4iv5QcLucvM0w2SuT
	MeKeP2nlX49XaZYQz+iHXNwJzJAl4mLK7GbsUhu/WYFmtAc4RS4l7qv56a9/eMsA
	BSv5mNS9Q+BkMBOxl20N6gRxSTdzweEn5H+iytR3vZZ7HVOmlEGaSqb9GOU/Pib7
	o9R4DsJOCzMb1gUxiIfOWTGis1sJ5DAiTEVjnKgcIVW9Ubaf8PZJyNJpLI0ti8Y6
	Qy8fzZrD+89bqiE1w8/JA==
X-ME-Sender: <xms:u5fuZhTXFT4tet7BLlHbZi14meUpe6RVI17Qb01NC9MrsdCSUvwhaQ>
    <xme:u5fuZqyn7vRzQULnPzSrDTG8cuEmq1jXb7CaZZpiWbrtaXYaHj3gxHKX2uzRhWzBv
    ZqW_b23duZXbv2hAQ>
X-ME-Received: <xmr:u5fuZm1EMmaCCwMLBfSvsNai_yiZZWwVaFnwqzX0bLTe_9WYl_5BpvLOuPY7GuHVcefKUh2nCiVTC3dDC1lcnLC_QHY-fPdkhnuyctlfuQSuumya>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:vJfuZpB8QIz4Xk5E9gAd5nG6cpsAtLVqaqRLg8az_n38U8zWH3HacA>
    <xmx:vJfuZqgtYpjDubU5F20tYCfuq5ordR_2ds04sAOch7gQWEBZGdpm2Q>
    <xmx:vJfuZtr8mF72iLuWp0fWVQedk97O_qEE56mBO8hGx2gq9iEKPGLAnQ>
    <xmx:vJfuZlgW5VGDDYmbU3NRm7qQHgQQSnwhOhkLoZiCj1nIaBNyhpvoPw>
    <xmx:vJfuZlQLSG_av14ZoQntEAwE0WilFrLKkfkpaE8f8MFSbNe-2VhXtG5t>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:53:58 -0400 (EDT)
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
Subject: [PATCH v4 16/26] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sat, 21 Sep 2024 21:46:05 +1200
Message-ID: <20240921095153.213568-17-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 82956cb97cfd9..75facc7d1fa66 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -224,6 +224,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.46.1



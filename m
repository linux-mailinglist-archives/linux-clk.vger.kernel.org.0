Return-Path: <linux-clk+bounces-12504-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B998944D
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28C21F24A66
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E2F143C5A;
	Sun, 29 Sep 2024 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QDD2UbDO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aLp6WHj1"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34A1428E0;
	Sun, 29 Sep 2024 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601190; cv=none; b=TH8ELS/oxdpljYAmY5xvkWMNjeS1zLDTL1UfecXCFvaSxscSU2rbs3Q7LiNzaJiAUb+dq9U6V6/v8OqLFpv1EklM5GqJUbnEh/az5xSb8t7bRI16djEq8RB/1gRlaaL5MWyk+FxusLFCnGoWHVN47dHgiLiHxtYoFhmi5lMIgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601190; c=relaxed/simple;
	bh=hyPojGGohhnXMO8b5gQwGhaz+6XqSf3SialaF5c9pDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCTL8oKUQzgQfVde0j+SM/lIcY/L12jvbVTnWN3ICYuSi02xplsyNbYMva9xNR8KlYS/GKvsaHjgLDa9w2Rt7+G+rvec1jV+gHdp2tmIlFbG3lEAp9+/I/RrQfuWAmgltLlPLgXKcvcWPFVQjy3C9uqVnfnwB611iEV5CYPWqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QDD2UbDO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aLp6WHj1; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 36E9B11401FA;
	Sun, 29 Sep 2024 05:13:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601188; x=
	1727687588; bh=vFAn77DPkhVmiFKjEXXB2+gUQSssJmHTL5ELI1Q/NII=; b=Q
	DD2UbDOJVSJII4HdRQcjf28zoxFWmimDVPiKbBukQd3OVk1vuoaOOy54CWOwTfWZ
	pKOv1TPsWaZ90nMykM/lmmq5/HcCer2vS53YHqNOU2p50jBc3Xx97ng/2mBYz/ah
	r2CksODzNCSwvbN9p2uQg0irJcxSIJ7PtTJDTUwTjMjmqArcrvp6snyxQC/BhALV
	nDOuooanWimujf7Xw0exLmHCgLQXsihKBJXhegl6G0qlc7oSEFeVYq8aIxsQwj5r
	VWf+8WgThJzsIN/V6mwrcZ9gKndtH9P11stgLrCAIr7wRVkSVagRDjM7xh4nbZNP
	n+/VFFRVXAMHoAVghTRRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601188; x=
	1727687588; bh=vFAn77DPkhVmiFKjEXXB2+gUQSssJmHTL5ELI1Q/NII=; b=a
	Lp6WHj1YvAX2ehIa3ppY/LyA69sOkD+WR2Ozpd8fk4Q9jeC4YEZmf0ZQ4tIOhHRt
	KqFLzXWrrQHJN0x6LdHLBw21pOXK+v4YKAt5ulJ8GBokmavq7j5yI59KrSRtRkLI
	U2OEbobUsDPMdWk9C9V4ET5oP2BXNIKTfCLaEdt9NvcY82TjEKuv/+KoXX4hm0Xy
	+3VmNpOFzAXd+ASI4rl7gyY1K6TMzLVdoc6q5XdbXuzNaANYCRBMsCr6RWCc2mRG
	t/CGR447sBrKZx4IqneuDWyzfwBGd7/qSXwCVc1AmjiC2oWqkimYHQyQhac38wA1
	/aUBdm6ULwwwmZKEaMUUg==
X-ME-Sender: <xms:JBr5ZpAll3UJ7N7YTHLh1IjZ7OVfsuzk-MTEXxBl02Tx_m0y5rC12Q>
    <xme:JBr5Znh60KURYrCYxz7GdG9aWMQJYwIY_bv0c1r8lojMlnam6rFXM2_uLrdVYnTMT
    6QZjzX9KuEpARr8eQ>
X-ME-Received: <xmr:JBr5ZklNzNVJe-N3wmfltWdSrSrleDURYyXtoAi6kD_c5q8rQwMpgi92TkgMKDkaObCijrHoXj7q5R5Pvy1WdmIkjhVDako_2ENQEFIBsB19qRiS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JBr5Zjzqm2d4rSnJKqxNCBNgKQy8W0IUJjdI-Qk6apYFS46X0SlqhQ>
    <xmx:JBr5ZuRnaGV6hP9eFjTbdlLmdwpvWCDYcViQ8ggXjPm9R3IMgSmWsg>
    <xmx:JBr5Zmaw4fkR5WA7NV2jnlA7fTRc8XH5124RX8yLcRePhGlW23jJWA>
    <xmx:JBr5ZvRQOa6-oCaentV24LHSqgvDPdAe-w8odb1CaerTswxalEuerw>
    <xmx:JBr5ZuKpsJdDLWdRELEZVYUDuCdCjycdkpzo3mHMIakrLyNUoyP-3w6h>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:02 -0400 (EDT)
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
Subject: [PATCH v5 16/26] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 29 Sep 2024 22:04:48 +1300
Message-ID: <20240929091107.838023-17-ryan@testtoast.com>
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



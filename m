Return-Path: <linux-clk+bounces-12513-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFD989462
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D2B1F2498C
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D8714375C;
	Sun, 29 Sep 2024 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="DbQuizj3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hovh5/9f"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A513F431;
	Sun, 29 Sep 2024 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601247; cv=none; b=UfxBhq4XlanFxuczu6ZqnANhcQgIFnHMF6dAc+iWQ7BaBwTS70TEO34EFB0KPfiKV9VZ4LY8YVb6j1aRUUbJVMmNIKAdI/6/si2xEpMCtIGVAR9+Xs273oaHZGbMWAYo8bfzfvCkCXZTxJtyhWMtkEZh42z5cYkSNxGZ7nPlPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601247; c=relaxed/simple;
	bh=PtR2dOutclQZZ0L7SuOJXGKdz3iIOM9LA0sl+nRPmbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa90hiyqYejYtxg4ufCaqaUtrVEnYVO0oj1u+0puWkdXuC/0//H6dAp7VTZc/xQMdIk73OMzRtFu7NIULYEXvm/mrF5G1AmFacYGTGnBdAVI3UhRQTek5NK1AirW3MRrYcV74CW+U7WgXFr3do6+pDLjtyWVDOquY/J0GUpThE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=DbQuizj3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hovh5/9f; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 6BC7213802B6;
	Sun, 29 Sep 2024 05:14:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 05:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601245; x=
	1727687645; bh=t/hGwFMygrSXn+HOCQW8wOfax07KyzMGRR0fPCScM44=; b=D
	bQuizj3eKWlOwvk1lk4fmcqL1MLoqvE8sFIiDvatvrecxSb1lA4ziEMGh6Bi79EC
	D74hOLzaFsMFx6AKFBUQ4VW3HXzNzJfrs5L/yCCA6yxvTTS4V36bCDvWR6kxugaK
	+9ll7P+99VomWteom9cvQyZNFp4a+bTmNWYYWwaiiF8Am1ocUP5URRvO0NJ6VNXW
	QHrEQ58DBbG+sK+X8h5QZCFNNqOiIkz8gQLIp5pW7ie3HMfeMsJywJqnhclqyopl
	rOMLnnVpTK2vFS69tcJSmIi04G/8NM2HOpi9fmmobjbpw60dmjkx0PRVDvJNg3bj
	RoAXJcHq70zuf+1tuiGXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601245; x=
	1727687645; bh=t/hGwFMygrSXn+HOCQW8wOfax07KyzMGRR0fPCScM44=; b=h
	ovh5/9fsj7gqA8nVHzh3xRWSjii9lJT0yVef85JAZND+6zBUWatQxFrigQkeREAs
	/q+r7NamFfXESDjb3dQdXzJIZkNJp5tZBaP707gQ/22eimInzGgf+UgPTlLfbxsN
	0exRYgdJBz3kaJFP9BzH/SFBZukXmrrN+x6KiUseW3twsnCVdIcIBOBVasK+aZu2
	LbLvAcHfFl4YcOz7J7IZxdArbSdaZJTQHUbA/q692sVrRPqg9lNSXykCaLgIIsnH
	L+pKfrGVio2kVSxF9R8m1AuyPe59qqEJW9ReV1dkcH9se/u4BqbQ2q0EabAN94Li
	G2LSHmzTJuL8g6NZQLGWw==
X-ME-Sender: <xms:XRr5ZnYFq2zbta-xLinXpGGIiKmKvuBRe985BFVXcMf7va8MhG1i9g>
    <xme:XRr5ZmZzd5D0qN4rr0b6q98Hz5BNL3yOgR4iSjBFJ7rfNJx9BbdZY3J3etox6hE9V
    1xtHh70c6ZtCWo77Q>
X-ME-Received: <xmr:XRr5Zp8e8qGCr3CJbBUAFNvhcTOA_IuzhmUCa9Zs6cWXZ0zPIQNir71PxIcCPibCHVnGI5M7jQB8a7Ykujf9psZZ1nF0vXHLjsj7FGTk11Knf1rm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:XRr5ZtpPEd0mnmhfZWmOBSSdA1QZPKYVbOX3rpEiuOS0QHWXJ2IaRw>
    <xmx:XRr5ZiqgWJPyHuRHB-sHOzG1Y3YadcLuhNE0QN8sBJfzZFRQqN4CCw>
    <xmx:XRr5ZjSKQPBB4203cVSegmbLZvKBYM-jrkFsA2JyitQed999IpK8jw>
    <xmx:XRr5ZqohMzpLDJgv03Roh_dw2wqh7bpPFonV29LakDYypEIGAU75Gw>
    <xmx:XRr5ZqDIPJBbqtcSVMKCBVo09wLLUh31q7besayd_3p2ysXdvW3bK_h6>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:59 -0400 (EDT)
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
Subject: [PATCH v5 25/26] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
Date: Sun, 29 Sep 2024 22:04:57 +1300
Message-ID: <20240929091107.838023-26-ryan@testtoast.com>
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

Like the DE3, the DE33 has a FMT (formatter) module, which
provides YUV444 to YUV422/YUV420 conversion, format re-mapping and color
depth conversion, although the DE33 module appears significantly more
capable, including up to 4K video support.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 050a8716ae862..39682d4e6d208 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,6 +51,19 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 		      u16 height, u32 format)
 {
@@ -60,10 +73,14 @@ void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
-	base = SUN50I_FMT_DE3;
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
 	regs = sun8i_blender_regmap(mixer);
 
-	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
 	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 4127f7206aade..3e60d5c788b39 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -9,6 +9,7 @@
 #include "sun8i_mixer.h"
 
 #define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
 
 #define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
 #define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
-- 
2.46.1



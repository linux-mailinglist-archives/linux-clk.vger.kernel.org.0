Return-Path: <linux-clk+bounces-10784-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447EB955A1B
	for <lists+linux-clk@lfdr.de>; Sun, 18 Aug 2024 01:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9E9281DA3
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2024 23:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D0B1494BF;
	Sat, 17 Aug 2024 23:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="T6Nx/7ml";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c2cnee3Y"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEB14883F;
	Sat, 17 Aug 2024 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935984; cv=none; b=awqs2/4D0BQnf3J2Vea2lF1K0gdFsZ8iLpJZzMAhiox3c99XcV1r4/doARU8Va4GoLH6rp1r9MMvodiW4K0lFEW1Ac+5iUQJEjQR8NBilqqeHnWU7QKXGpLfz38GWFJv9HcVqPM8NKcl7o9JLC3R8Ja25x3qHIqfwIOMZXuSk6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935984; c=relaxed/simple;
	bh=+3l17QuIrDE65+V9NT3FZ+/fRdp3W2Z+kI88znjC1dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=od3q3hFrRFFc1ZcYYGSiWvHREWNWkvPml2XwK574Nr/HP7ZwiFpOxj8OYYjcqeyqcgI1apkfjNYUwLfYO6tH012ivTN7r2HftPfJIxfVBCjPucjeLmNHFd6dwpoBPMPSL3HKeinGuUcPh1sbYmVJRzr0lCXJUd5xEuxpVOvOEy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=T6Nx/7ml; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c2cnee3Y; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 07413114E9CF;
	Sat, 17 Aug 2024 19:06:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723935982; x=
	1724022382; bh=YwPvf6AeJbaiMr8lFFGtJ0nd+U5EM+Dq8voUwZ1tWak=; b=T
	6Nx/7mlkvNSl7WS7n0nObL5SQ3jdSw8bKt6deYKni2hXIz+y1FvIl6TcpNN5G62/
	UeiTuUuyZU9p47jYHFQhmfpw5n5xqqo+Vo0s5AovXmuUxFUj8XeeoB14d0wFpMHh
	Iw2DyzOqt17kt3fJtIw8dCGjroMEhBWfzx0AW2Ml4HyuZthEhYJ3oBEDHgcUAwpm
	CjZw1/TmNlAALbW1tGCu4ZwUQ4hLMr1MpzzCQ7JhG55hSJLpZ8oQNIokPt9zsUdx
	EvX/irqfz45Zx/9+fsGe6DQs4em/WttYsZPNqEKkbnDV3j0EBcdQRyI/HhqRPrVa
	w8ewI7EqDc04xZ4xoDJTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935982; x=
	1724022382; bh=YwPvf6AeJbaiMr8lFFGtJ0nd+U5EM+Dq8voUwZ1tWak=; b=c
	2cnee3YlXvy4J4rwdi9wDzeeVKKbbReJ/XyJ72gdAu1b4Bvkyz1iGSJMtsJGAFZ3
	bx3klaBY1r5Mj+uLA08VxPzvTf6hvmFntE8RxXfxHLwWF65wwINQe86GotFlkcwn
	Ex//WK/qWM0GzA4EtSQ5RROuiTqasokVXJsO65ZKNag6QjHgT4KtH8xQ0YDJ6gUC
	TEwA9Dn2/GfKOB2K1cBRrKOBEJWq1p1OvfxoL7TMQQT+8VzaXUy4UXTKski0i4sy
	Aa2dYPKh02K1fuHBEZb71cfprpHxTMwLhq72fhsvDERpPvEk1a7bQxNjJ8eNkO3L
	DUUlVmJl4K5sPHLEqNguQ==
X-ME-Sender: <xms:7SzBZtOBdRiYhR3SJsytwvQRfTCRYvM-kD6ScSfEUEiVmCXV3b7nGg>
    <xme:7SzBZv_0Je11pESAlQN8lgD8Px6HdwzGojIBKjhxSzy8dtf_VQqL9YqzjYuZqYnaK
    rhIBJ_2LTV0-z1v6A>
X-ME-Received: <xmr:7SzBZsTCugePPmid1HhdykEU31VmRzx_vhD_jpjI9Z8YIVC_Wnxmt3vS2KdOEeKMF6BCEKM7UMa3osnyX7Yu2wGXhPAx0yZSRPw2-MLb_RL47Fwm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7SzBZptxFN8D4dVaO-7a5eN6ZtJRNPyvhmHLPce336hXCyLCGuKpAg>
    <xmx:7SzBZldl7bobE__Nr3IQhoHdfX5tTSYrREe6FCLcNTbPDwOsk-GAJQ>
    <xmx:7SzBZl3sOj-V9lo6ZAdN4t3BtVqnPKJrvLk7WiWoVLQokWumOPgPTQ>
    <xmx:7SzBZh_Dy9reC5YgkyvyB4yu6XfKbOz9vilxbMsTL6VE_f92LMYsgw>
    <xmx:7izBZpMBp7u4grDIsDq2HOIKzHB3DmahLroTDIpW-w5DKcCnci8Bwrvd>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:14 -0400 (EDT)
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
Subject: [PATCH v3 06/26] drm: sun4i: de3: add format enumeration function to engine
Date: Sun, 18 Aug 2024 10:45:53 +1200
Message-ID: <20240817230503.158889-7-ryan@testtoast.com>
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

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec0c4932f15cf..c48cbc1aceb80 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -123,6 +123,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -215,4 +226,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.46.0



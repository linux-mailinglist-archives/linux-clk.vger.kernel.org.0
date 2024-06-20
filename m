Return-Path: <linux-clk+bounces-8295-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED19102AD
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A259C1F21CED
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5101AB907;
	Thu, 20 Jun 2024 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="0MyMjDbF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r23KsAA/"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC01AB90A;
	Thu, 20 Jun 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883182; cv=none; b=uD5mNC+/+Tx+sZMnzb6M7guZCVYzslJESoM8XkxjIEYMH3dB/qUs73XXjVq4/xGorDxCrYpMkv1V0VRTGjFA8T48KkGy0oOHWur7cHkhKv1EZ3CP8PJak8aJ9UK0dE+AhWKBWD/5HoG9xasmqdrmkywsPuc6KT8l3YZV758y8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883182; c=relaxed/simple;
	bh=b5GBD6jFHTqyvBAQvPltEszEjikBwv04jJxhu0tTQPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJHZZMpDA8AZXgwCxXs80o451aRp4YP5rGqi0ycvcRzXBukQdcfqPuRj2zFp5byB1LbuKJiHMk22AcCe6r8zUBQWk+Ks2vzNrD+hBRNFA8ZnP7mnZwnZW02NF4JKqDGmlDGNwPonCNyMfDLMP4z6Q45Uk9GsEm2TzwVP5EFV+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=0MyMjDbF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r23KsAA/; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id C577713800B7;
	Thu, 20 Jun 2024 07:32:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 20 Jun 2024 07:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883179; x=
	1718969579; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=0
	MyMjDbFvbSUSYpoyh483rfGEA7gSBDCVtJgK/XOcP6XMYrg86yf5//zuPkmud7EO
	pBFHI3ND8PuEeI330GO+WUfyhzvw2SsydKusFC9dPtg0sJe8WwKeyNrCdKtb4Aj8
	WWl6FoKLi+8uQfdlX9rk7bqzUEAzU7Xr+Nqd6UM8bGLVEayhEFmZfTtAQtuj1aZP
	0ioJHaoZK2jT6otudNamMtaZsXktcieL2CPBRa42b9Xf1slOrd0/JrV6LJn0QPqt
	bL3T4IsWOJLpe8fgzbO5Yuz+mhIFgdkUrJG+LcyEBFLXzCKZgcsaqia7gwMJxw25
	FQ5XElk7/yhnHYahmyjyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883179; x=
	1718969579; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=r
	23KsAA/WfBUfrdBA6mYRLm9pCmv/HAlj0lYb6zlcLVkveTtMo6Yx+F0e3somsQr0
	RP7iFASv3VsLY3CfM/9emJowCtb/gRmCUiSRIyMP60QAezbPqRHPGWaJDGX8zgH5
	Pcy5ccxsfkPQmfjEBiMxDSfUMcMWLDpaIibBRsNUJ2A4RTSuIeQa2+8hYvjmj6IS
	QdklS6AXPbSJBEWEkW7NAqIdqWy5c2zwL1iTT36EWBkUf+lNZO8dgNjvrA8qOaYH
	egmnE7DrPD5xSHAbB1cO44WzUC+Sfn5hH1cQ5xa3P4nFCSAc3NCtCqJKCCgfljI2
	ERD22em0UR0vUof8D6n7A==
X-ME-Sender: <xms:axN0ZodN8AA79bBvaYs6MNOvX_g_NpYfQhShhyw1BQL_XtfxROCZug>
    <xme:axN0ZqNoYh5iHc58YH95UpnYEQPi-GEDjibfyJYbWwDtqwEAaOajWLmGOJKAQC1Im
    K2oJvfoZ-NENqk2zw>
X-ME-Received: <xmr:axN0ZphXjSHPLAfNePw-mTa_iYnydjWCn2z5kYbKxNuh2DeaQDz5dhEp3LsDnTAT0R22R4y1kyoooglK5vRFtioPWW9EODneVj8iV-K3bVpfnPBL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:axN0Zt9H5BqNdupl_dZ9_z3KV2bF2S5pLv4Cm9n2sBGICfxO9ZPkNA>
    <xmx:axN0Zku4nGsp05iH72ccFh9FyQ7QK3MDfc8cDDTnj-3WZ2LP7Tvksg>
    <xmx:axN0ZkF2WA-wg0uChhmiv5wKGloFUSqoUDLPlSSwrUBifO3bLtZfAg>
    <xmx:axN0ZjNRctdi9tI8SojPNN7Zp1NFPCziQ0htRGGHo2bqyFTeeHK_Og>
    <xmx:axN0Zke3FRduIaTx7o9V4jwA-_aZSW9zeKA29aoQR-vsy1815U7YBXAj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:54 -0400 (EDT)
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
Subject: [PATCH 09/23] drm: sun4i: de3: pass engine reference to ccsc setup function
Date: Thu, 20 Jun 2024 23:29:47 +1200
Message-ID: <20240620113150.83466-10-ryan@testtoast.com>
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
2.45.2



Return-Path: <linux-clk+bounces-12491-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F3989416
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EFCC1C20616
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE351422BD;
	Sun, 29 Sep 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="yk++jg4p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hSEHRMj3"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1D1422C3;
	Sun, 29 Sep 2024 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601108; cv=none; b=CGDhp88BZilurpt8KdFDoOW91ZHxowglTaaIneuCo6oCbtZeoNe96UBnt6pE5JUrQNWkET2RW4PmSDjxqy8qwYlDtydupUiwA1Hi6zg07Ww4VxyrmwSB1mJKZlExnUWfsvLqhzwtVjw4YY7qADkuyAVwYBWHMRRPOiwycYO0icc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601108; c=relaxed/simple;
	bh=tPJ9Tui6obnlmYZAQz+oFV/G191xzjhDWCaH9JGS6I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4nAX1y4fWGUUbH+voLGdCF1sfz7ZPoN9ISNywZLDewXTYX915KvtwSjIqTTNRdnfquHm13LvH7HxAvPBxg5LOC/PV5kJ9Np5tDqnTFA1zBaaPE9sL8j4SmjpN0sJvvKwUnj04FYbPmuxdVCELUpj4+EeEWaD9nqXRYqbtfkmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=yk++jg4p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hSEHRMj3; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C19E13802BE;
	Sun, 29 Sep 2024 05:11:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 05:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601106; x=
	1727687506; bh=j39o6gjNS9OmLnvkrdvnX7rGkSbKds69G+QiPuGs8E4=; b=y
	k++jg4pU0DUXIdhZl2Xz1RQvdHiYKycEucRVTxJHFOwA1BX9sz999Pi1hy6PFHAd
	sH1i1gfkJ3M8NM/ntRO8xLc3gu+9bNA0bJsrIHMl/PJDkOzKsQN2sUcFga5x926x
	cs/doBNFonXZ+8/G9AjHaD46g4cEGQJbP48iBZvhAjQTvQuydWy+vQLDHWPti0+V
	0wt2ncrh+BAomzDCuBAFi9H1YUlauanPP3VxQK7rfIvhXtZoNn8g3Zekono5Z1kU
	f8JpXnol+uxWRuMH/nXV1qmc6OKRN1tKmxaggbyoxcdmhSUejW4A9iOOciCwNJgo
	r7+JUKfEmD+zvBY3v9UhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601106; x=
	1727687506; bh=j39o6gjNS9OmLnvkrdvnX7rGkSbKds69G+QiPuGs8E4=; b=h
	SEHRMj3SsQINB+c2rnIQtJtzifoMR1u/ryECL+L3pnz+ewA5rEooCVIUqLdnhhAk
	IU+EJRJ22k+YhUBW6hnHlon9jvLQk/KjPfbwMnetSgLM9dAuWwI1fFdsq2TKRFpH
	cxvhv+ASe+SVyu7IfKdjF9XqvHSjFQdpPnyU6LPhWISUCbhvh1tSgbO8pE+e7/mp
	OA1wcW2S43I0KLz+zex7M8CSnlhSUTZdaETZU9I5tZp4RbOBsNmP5MWGjq4OvklK
	cxMZRIboMqrD5zyZ+3+Vj0gsRanuONCtNJA3Ug3xboosdRed3eNkgjz1P593sHPQ
	2bhgYrxM7m3Isw6ANDVaA==
X-ME-Sender: <xms:0Rn5ZuyEqGCPSUEWG3rmedhxfa-ouo6fV7aJTSAeC6QxupF1AiFyJw>
    <xme:0Rn5ZqS8sggmVjjZ-RWap55Z5-pjyx3fsq0iohcZWDNNe-xLd5RLbzc3vinSIUyFn
    Af7i0YDXMbQh88lGA>
X-ME-Received: <xmr:0Rn5ZgUCJmCB8d39F0vkOQsSdFkd71IZJvdDsVKNXmkfKDMEprh1Iz1KFxHuH0nYSUO0ad-fGx-_eU2KhRAOKHKElVVh2Wenegx_2WVttfhmFz-G>
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
X-ME-Proxy: <xmx:0Rn5ZkjGfo2nbuOwuaefKUTLG7uc9FTUOwljHUjPAEw3RKButNLxig>
    <xmx:0Rn5ZgDhwpuPVH_M-052KeKflLf6yXUtPT_c-RgFTn-Demab9PjLtQ>
    <xmx:0Rn5ZlJpBlUhy2O2vNauhMYF358dCoT0zGNGcxEgpas81BLFczAHaw>
    <xmx:0Rn5ZnAVkJwu-7yat8D_0zF0PEt5TrNpfHgsS4F8spJ2M5_IiB3lnw>
    <xmx:0hn5Zi6zKknpV-8YqycPv4nU-jsjL0t1xAUTrYtIRG-DKyKs-g3V3sHR>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:11:40 -0400 (EDT)
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
Subject: [PATCH v5 03/26] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Sun, 29 Sep 2024 22:04:35 +1300
Message-ID: <20240929091107.838023-4-ryan@testtoast.com>
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

Currently, only VI layer calls CSC setup function. This comes from DE2
limitation, which doesn't have CSC unit for UI layers. However, DE3 has
separate CSC units for each layer. This allows display pipeline to make
output signal in different color spaces. To support both use cases, add
a call to CSC setup function also in UI layer code. For DE2, this will
be a no-op, but it will allow DE3 to output signal in multiple formats.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 8 +++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 0dcbc0866ae82..68d955c63b05b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -209,8 +209,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	if (layer < mixer->cfg->vi_num) {
+		base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
-			fmt_type, encoding, range);
+		sun8i_csc_setup(mixer->engine.regs, base,
+				fmt_type, encoding, range);
+	}
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e88..aa987bca1dbb9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -135,6 +136,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
 
+	/* Note: encoding and range arguments are ignored for RGB */
+	sun8i_csc_set_ccsc(mixer, channel, FORMAT_TYPE_RGB,
+			   DRM_COLOR_YCBCR_BT601,
+			   DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return 0;
 }
 
-- 
2.46.1



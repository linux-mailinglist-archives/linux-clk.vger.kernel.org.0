Return-Path: <linux-clk+bounces-8289-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585591029C
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 13:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1CDE2848C4
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985831AB8EA;
	Thu, 20 Jun 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="WSOBidXI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="knLp1JxG"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09180763F7;
	Thu, 20 Jun 2024 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883148; cv=none; b=W2qbS9tlJk04k42gCHZ3DGPznDT9y/PvXq8b0LQ7P5mEYkC2oMH2E0Iy3O27vnL+BnfGTEAdrQX5U0jExEg/LF7IPeWOaWVYJkhwPLHxoKsyLsTwxHXhTS812sPmMOpWPkxCP+azXNYq0BzFvmNAu7WkJuc0XAyY29Grq9rV9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883148; c=relaxed/simple;
	bh=HMODOo3A6QjA9V2GBeag+gD9yEIkvn2EhoX47FYjChU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLrZ35dTucg4ueVSNcpeXQWoewOF+nGbPje+3hRJSQjgPMjwdYeigR1+wfVTIoUKBRlkdLdAuj3OrTnadvblDp73Cu0qnhXC4buKfoJ+6M8gTllBuAEsdNq4x3/ACkWu9TP4D31BfA234nf4sB7Yb4VLVREU+VH+8B10AIu1vHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=WSOBidXI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=knLp1JxG; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 23DA51380490;
	Thu, 20 Jun 2024 07:32:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 20 Jun 2024 07:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883146; x=
	1718969546; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=W
	SOBidXIthpA+MsH8Gdb2E5d0T0qN4hT0IBc+jJfFLZFzkFseUbEX0waA2m82/ErP
	c8UyFYRMfrsAJQM8E3in8xEU8EhXiJoso8L2Z84bNGQ3XkCChPXD2RPOumhQVe2k
	ISP3PTl7xeFG/yVjdEBkUW+hPjY6OjOAbJI1Vz4AMJAEio14kHbmDaBww71V1mIw
	LM4l9UYRXNPmngFdFceh+o4012RiP/rbyyx80BPwUyOFFUmoexGvsEhbGceEDDtY
	LE7mtpiGSoHVXrryqrEc+vPaBsArP77E43JICC5gw9vmc5ECoL2fdjScPVQrhteZ
	6J/hYioxnswlyaGoMDovg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883146; x=
	1718969546; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=k
	nLp1JxGMTKD4PB5yThba4iTkC5a7Z9/BC08O+HdrZf0XAQLw2s9ZOlyiIjsKWXD2
	CBjYdwzFX7xoQjUrCPVP8adTIxhHzc5/D+rbG5FDm/ptSEddTB7fGwsCYQIdk7OW
	/VOWMcxe02bV/hxjC1GOrdEjd87w5kpFbcHCmUBu6Y4E1DBcLztO3ZP36pCt9IaW
	GsV+i36Uf5TYKBd4ThynSSr+aAuDpdR70/Vv6OirTBJeEWtQeqMNiyjTHCbZN9iY
	yfWAeFQKg4MM/lAracVFZHyTtc8/ZI5agEqHsTYFI73eCnQKWOxHhNP5bnazFzhY
	HYyUZSx1b16kTvvLsh25w==
X-ME-Sender: <xms:SRN0ZonkgNgG2OxqkyOfQ0XheEhH68hXyCYVd9QGdgyTUlPGGOkQ9g>
    <xme:SRN0Zn2AdsDUiZi9Ajrhh6FZXCwgMYCMBdLfAy6_Cfd-zBSxEWGUi90wCiUXRRDlF
    GIk0IyQvaOA1vPUKw>
X-ME-Received: <xmr:SRN0ZmpbgTrPfKWcsjT5-zzjyi0dTXb0Udin6VFeHE7zSVkrdi0kF-d8u_b5H-gRDi9amqsEgn0Oc2ZZO4vUMgO8jbJOWrpaAFmKzhhzopSYFI07>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:SRN0ZkmU0JeKwfYfLvyPb9jbly6rZPkt8H48_9wjo-MCqppZjE4fFg>
    <xmx:SRN0Zm19mEauSQToHc9URPWMNygsgonhvHDvJQ0b5ptFKcg3SJzirA>
    <xmx:SRN0Zrvx_7a8v-RZ7xyPPA0jNRlbLng2Kaw5h_VNJfGxfeI9QlqOog>
    <xmx:SRN0ZiWAKVORVXGPNEyTCXY229v2X00NrPfIQyexv7f0yWcbW4gYhg>
    <xmx:ShN0Zkn3l2MBiWNqOxhu3bk3F-UyrWeVKGehilT92HKbddP3BI1q0Cpc>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:20 -0400 (EDT)
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
Subject: [PATCH 03/23] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Thu, 20 Jun 2024 23:29:41 +1200
Message-ID: <20240620113150.83466-4-ryan@testtoast.com>
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
index ca75ca0835a63..884abe3cf773a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -184,6 +185,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
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
2.45.2



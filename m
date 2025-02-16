Return-Path: <linux-clk+bounces-18147-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B59BA376C6
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 19:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF4C3AF6B3
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 18:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08F81A00FA;
	Sun, 16 Feb 2025 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="pB4DyWYF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2URzKjC"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15019F471;
	Sun, 16 Feb 2025 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731178; cv=none; b=mA1DKu0+5iW9XxSZRpZm98YZJk7YribfPLdh75QiFkIwrsCfIM1syhpTx5+obxfvzB36w2mCzSQK7LssB1AsQ3pFqIP/DFXNmEl9tKxii8G2483CM5wYn9/QaiNYFxJ9LDsVd51Xk/CWfRmf3QQ+fLCy1qQIhSXbD0NbAgTQPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731178; c=relaxed/simple;
	bh=rJvT+4VpUip2piau7Iz5oqiXdeItr4msXZgZlzj0EeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOM1XBjIKm9G4Y+rGbxZJd/R3ZW0C7I1c9RDW0KQ41F1HxJZa8YkmZRaJziTfMM0vvbShJNz9VesdDntoob5A84njt/H0TjKHU6FcsXx8QGnjqWAQOQQsHmDJO3CLfp/ctwhSdbsKrnteQ7xh7OsPHLzbcTs/oxc8ebALwcLhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=pB4DyWYF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W2URzKjC; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 12F592540111;
	Sun, 16 Feb 2025 13:39:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731174; x=
	1739817574; bh=BNPX+KdnFL4esoxbEGM54umv5o7+XhVVNtr6t4NDn5w=; b=p
	B4DyWYFHlEYDVNmC9yTF4dn0hLrLl+CzYhBgAAF/hCH5P+YdcxHw3Mo/pqM7Dr5S
	o7QbZywkjI0BCEzJvvpoj0kMXQYkeA3lYPKHf911wqTeQ71YAG30taUUzGF/hKlb
	nCZH9Sf8/RzhVW4ryQGXT0ZuvzEbPzoI9DYdiEXs2uIKtGa+Y7K5P3anlFzdf8hJ
	6xZxr/1YwFdF+qF4hkcHR7eKnCdvFMpqPtUzQXH05/91GqfP720cgwXgyi+C9Vjl
	fzAv14leeEUgAHRXdjAd8YoWHBjFd064v7MjEOJGty54QqY2CIG+D6LYYSNvOWDX
	+3ykC/fwxwm1xf0+gnckA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731174; x=1739817574; bh=B
	NPX+KdnFL4esoxbEGM54umv5o7+XhVVNtr6t4NDn5w=; b=W2URzKjC5ssQySw3i
	xTWupVyX26Ya9UWTSxomcmKXuws0cBBIr/AZ3t8Lrj2Z0eNUpuxl9Z8qaVB66oyV
	lfCaZvjrE/pEVTy5tm0FdtBOJVEfprU/shMaUJmRxkmn3uWroy7Hu3AAZCYZPR7Q
	Fx6wA+Y673gxjdy3pPUMsOBdpE0x7DS60wOJiNsianAQjg1TRzxe8+DQ83/lzTPs
	KKvtRjr76WYZQ0vLccv3ESRqb5k2oExGxP8oqq+VhMkRjKwPpCfQFqQGaBO0NJaE
	emRfh4Qjv6F5Lv5GdfaI3SXV7fYgSXCr+I6kHNxm86TM5Qri1ZNtdy7JG6d88Y+N
	l45bg==
X-ME-Sender: <xms:5jCyZxCtWTWVPezSlXjkoRgN1o84w4287KKVjIxmvuI_L1pD4HooZA>
    <xme:5jCyZ_grYfscpwU_CEPGkedXIzxFmIeL2za-vZdAQLSc_VUKqeJ1c_8MKi_T0i79i
    Tr6QRKgzT7tLNVR6Q>
X-ME-Received: <xmr:5jCyZ8ng4OXxZNV6akoGhKUxhKph273L-3rvoethteOPtSBCeSFwqzVTeAGKJfTy3qlp2Ru75K9xqWtjpLTY6uh9619pYTLSYP8yTNkr4EEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5jCyZ7y347ZQESgZ3BWdh-C3LoiRnRewgVMP4v50cqqWQU4K2H2yTw>
    <xmx:5jCyZ2TnmxvG580p5fwKH_0DB0P4MXjwPBpV9sSg8gf8PV10OWwgCQ>
    <xmx:5jCyZ-b5W1xGE-5aDwQNAdPIolI0K5dluZcSHcXBmtzxNrPmZ5TWWg>
    <xmx:5jCyZ3ScUzzgW2Zu-cPxVQTzgtbxi9CR6UOtrId9tR9oexnMT-fLfA>
    <xmx:5jCyZ3Db3GPq9mXoEZuFibFdxDDzNj02vvZgyOsBuMkD6NoXMUEkBHJM>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:39:28 -0500 (EST)
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
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 15/27] drm: sun4i: de2/de3: refactor mixer initialisation
Date: Mon, 17 Feb 2025 07:36:15 +1300
Message-ID: <20250216183710.8443-16-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Now that the DE variant can be selected by enum, take the oppportunity
to factor out some common initialisation code to a separate function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---
Changelog v1..v2:
- Combine base register allocation and initialisation in sun8i_mixer_init
- Whitespace fix

Changelog v4..v5:
- Remove trailing whitespace
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 64 +++++++++++++++--------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ea1f477700d4a..acebbaa60785c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -467,6 +467,38 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 	return of_ep.id;
 }
 
+static void sun8i_mixer_init(struct sun8i_mixer *mixer)
+{
+	unsigned int base = sun8i_blender_base(mixer);
+	int plane_cnt, i;
+
+	/* Enable the mixer */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
+
+	/* Set background color to black */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+
+	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
+	for (i = 0; i < plane_cnt; i++)
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+}
+
 static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -475,8 +507,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
 	void __iomem *regs;
-	unsigned int base;
-	int plane_cnt;
 	int i, ret;
 
 	/*
@@ -581,8 +611,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-	base = sun8i_blender_base(mixer);
-
 	/* Reset registers and disable unused sub-engines */
 	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
@@ -598,7 +626,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
 		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
-	} else {
+	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
 		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -611,31 +639,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
 	}
 
-	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
-		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
-
-	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
-		     SUN8I_MIXER_BLEND_COLOR_BLACK);
-
-	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_MODE(base, i),
-			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+	sun8i_mixer_init(mixer);
 
 	return 0;
 
-- 
2.48.1



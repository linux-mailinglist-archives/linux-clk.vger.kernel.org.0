Return-Path: <linux-clk+bounces-12510-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8798945B
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 11:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D88B1F24AEF
	for <lists+linux-clk@lfdr.de>; Sun, 29 Sep 2024 09:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AB1143C5A;
	Sun, 29 Sep 2024 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="I5vF9Ll4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mqtt/oPf"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020D1428E4;
	Sun, 29 Sep 2024 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601228; cv=none; b=oQp5nI+xeAalfuriVcEDcLNyzJr7HvWgRwHj4uCBG+ESFUHIdtaFlgiFoSWnjSQk1FUz3jMiGiRJIjPCPEzAXNWDphacV1ZfjbWgHW6mn6I4NKZSJXIwT6i9FhynDgMq9lwD/kFf72uky+/nvpYkiNMJvJ2CVjWuV/79lj6OX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601228; c=relaxed/simple;
	bh=pnK2Fq50QxdCJeVI7i9GOJQ3UkJBUZTUVjPsSuA3bZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQeth24g5yeC9uQhs5acUAvTTJU2Xydru6zsdQZiPIe6Rj+i0U+tZQXIKxGPDeISpv4mdFo3Pwcxq//b6uOOHBeXJwwSTLyHwQHENEkuFdwgSkSUUtKN8LI4YgJP/JX0oKJ3/BWVQQUBTjry9eEa3DZqUqWWviw2if+AGVIP4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=I5vF9Ll4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mqtt/oPf; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 9AEF113802C0;
	Sun, 29 Sep 2024 05:13:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 05:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1727601226; x=
	1727687626; bh=yLZo7PUOT9aCWrwaZbTmXr5v+3hjbZkSf/GJyFKh78A=; b=I
	5vF9Ll4+3Px0mymIt3TDfHY6rFwhv7IwlC0MnGkTdHE7pNLHmTRq0mAavXO7KDoP
	UPCvbY39HEulJM6y+sP8HZb1YKEuw0gJhSb1ZT4LK7NnQFCE8bJt4PRKDEhNTumx
	nAK9aOXK804upGEvtwb2UCu617jVL7KTQLl/Ihfod0fcLXvo4ixXFG4yJB2Ysjb+
	kel8IhwZsdC48M0HgkpWdMNTZap+9c5vZ4obRNuK6q+gxwNUDa3T+iivQPWhxALC
	8PwucSaEOWbrGvk2jqbKRON5PuSpyvE2l1htCulw0XEqOTa9+TEAfxSnLkL0MfZ2
	BRkopA2L1xMsju39yX29w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601226; x=
	1727687626; bh=yLZo7PUOT9aCWrwaZbTmXr5v+3hjbZkSf/GJyFKh78A=; b=M
	qtt/oPfZYjmu+noB1SDPM3yc5n5cie3BNZrv23Z4K1tGt/CPXU4gImHHjcMjyNNB
	DLNvUa5/gfQxwKivW/lUlNIAukYwavnmpL+PaCka5a2we4PDoWuTf4VNxmyxPfXd
	9cNRfQIdC7kAOGcTB5SAmRVndwEkJdxKrndTlBQAEpFGY+Npg5zp1owawhm4e90G
	TwjzYe6X3by7zqXpG5SdeogJDplxvjvPEJG+P1dZHSs+foSB2iXf9usYVmBIN+ld
	iKkJ6FaKGaw0XRQ0EoT30Y6RyZ0l3CsT18zd70EIwIgv/aJD/vx2fuMtyMeyhT2e
	DHXZxuyJvb6NBNlsubwiA==
X-ME-Sender: <xms:Shr5ZjdbQmuJccEf3BWdBAJHahfFlq0yC872QrjiQdnqOGfg_SH5Tw>
    <xme:Shr5ZpNc3lkT84sK8Fx8AeB11z3q3IbnlequDvN75TCxU1nCCYKHgSyuPupfLhHvD
    UasftftdnF2rxia8w>
X-ME-Received: <xmr:Shr5ZsjUvdMi1C4aq6vk49LjJ6pel7yOMV_eD95JOvK6CnDAKdyRFt5x5W-dIbqX3tBUNB8-tDeuzurPnpZCXmOnCKuMEaOeaObz4voQ4WfNN5Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Shr5Zk-1QpK3hGxMWGi7RCnLRx_nDbysatif3l1RKdeJqvax6wIYOg>
    <xmx:Shr5ZvvwYxhqraFvmRBb8LT70mTEiu24tEf2Fdm_dBYLCralTVcHhA>
    <xmx:Shr5ZjG5WX-Mnid2JciLL3Mjhf_52xNo3Is9tof-__Ef7BCRTVk_QA>
    <xmx:Shr5ZmNxX39_wyfTED0VFvb8KFv0ZpKfq-07FCVdye0SNLF3vIpFZw>
    <xmx:Shr5ZkXnUYpGbXTkfTYK8ft47Vm96ejtVabfS76ks0jJ9PBzbL7fi6uJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:40 -0400 (EDT)
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
Subject: [PATCH v5 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Sun, 29 Sep 2024 22:04:54 +1300
Message-ID: <20240929091107.838023-23-ryan@testtoast.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

The DE33 in the H616 has mixer0 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v2..v3:
- Lowercase hex value

Changelog v2..v3:
- Correct #include for writel()

Changelog v4..v5:
- Whitespace fix
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 7683ea08d8e30..83eab6f132aad 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun8i_de2_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun50i_h5_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -291,6 +302,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_mod_clk;
 	}
 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000a980, reg + 0x28);
+	}
+
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
 		goto err_assert_reset;
@@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h6-de3-clk",
 		.data = &sun50i_h5_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
-- 
2.46.1



Return-Path: <linux-clk+bounces-12279-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32897DCB8
	for <lists+linux-clk@lfdr.de>; Sat, 21 Sep 2024 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52DEE1C210C7
	for <lists+linux-clk@lfdr.de>; Sat, 21 Sep 2024 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D48916BE20;
	Sat, 21 Sep 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LAzd2fKJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eoSaD4I3"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAD160884;
	Sat, 21 Sep 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912484; cv=none; b=hC6TUXymdiB5SYo33dEATaJqUT6WgWbivom/+N2DP+WbTRHsCfc7k3Hezcu0Po7KayQ8T7JYAPvz53vp0mbWCJlR2iKSK4EftGfZY2tNLPiuHssgWGJkPLEpudkvKTo7AATricvJjbxGUNmIdWcQ15/GuyOHhSDMKYez1P8zmtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912484; c=relaxed/simple;
	bh=fkChC7S3dHwKfxz5dBIG+ZW28mpOjMdUjYgacZBvAC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgX05xGjFpplUm1bJIDJZyQSbYQnujiDsKJv2/ukPKv9JAbYpeO/1lSpDkY42rlzXLQWBDyUNZRGhjcvsk7mAKnf298OhEgbnwbjl+anrix6bffosrIc/tCUYZrsJT0cBU1gLFNXbwPQMLDdd4V/Xu10z4Gk/HuM7w3nhNxoqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LAzd2fKJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eoSaD4I3; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6D6D01380302;
	Sat, 21 Sep 2024 05:54:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 21 Sep 2024 05:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912482; x=
	1726998882; bh=PppAslmDBAd1BzpdW1OiB9SCrWVv4GaxT/HFIYkf/sk=; b=L
	Azd2fKJfsULT/O8JCpwu0V+tZTE0I2b5CioZtKqKY5Eea+0xLR4ZEQvouVx6En/+
	o99A8yN7+y/9jjsoxcwbXDK3Dgjm3oSDhu0Wqeat6xVSwjV4MiVSmA3vYNNgC5uw
	z8EKkcHujkly3ehJq/ub6U0WipV1Acke6eQ1Tep7R2CTCX6iEQ9j4FgDr4yzZQh4
	yJTY5V1EorZ9l4e4/dQ0jsHyZ6y+mnyHp0vQoKt1HDgqMg/dMaRv8UWkzeyFsdK+
	IxlDHY4JRE5xeT/1LdgACpD5nM3UGnZ0myEkWDV4CGMiialIJNhapjrbJ7PnQizk
	PVDE1NtYWrysxm679pURA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912482; x=
	1726998882; bh=PppAslmDBAd1BzpdW1OiB9SCrWVv4GaxT/HFIYkf/sk=; b=e
	oSaD4I3GetUCrZvyi3L55kwIoVJWQEH+6/vJqWi/v/5kjw2AA+XehUAWxJimANgZ
	QjYfUQ6TAWqVJlUEhZ3Z58ekwS5J9CbkN/R5C8ZTWsJupyhQoLSL88sSnK7nTi2v
	5ZMG0tHz5x6u1LrNOtGJV316EHjAKnGRu8SB1QykAgDp5DPwBLPtv2GZQ3u7Ozb8
	2d6dJ+M2KPhJXDxb+bhoSypuJd97tGc5CFPy2Ngq3t/n+7DeIY+H4qtM6ybwKurf
	HVVPayjETL8wkKsoJ9UydZv6UN+098D4yNgTtTOcKCOHgZeusTGDQFTIjK7hw8TU
	xyUPsH66PLhLVEmwN9Qfg==
X-ME-Sender: <xms:4pfuZpaS2nz5uH8eBLTByQvZVOmONTMsFrotEUNeoIvbTFa1madbMw>
    <xme:4pfuZgZKAQdwBLR_1CHMxxz-aY8pLwso-4t2HExElNLp9XrEWoPH9i2B7lk3PtmKZ
    0nLcOH0fgLgX5CVdg>
X-ME-Received: <xmr:4pfuZr9A9ow807X7f6j5LBBpUk6SUn92GXH6oky_f0Oh0yybCQUbNu0QzO-ZGS37aPMCWc0q18Jhkv1BE8DfK54fTm-ugUrnmjYCtEm4k5bxVFNe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4pfuZnqX_NlAc0ANTnqgYkGtdkh-gDKJluTpyYaHLTzgf3wHwfspCg>
    <xmx:4pfuZkrfX219EvzSRfOXauc4Kfo91jTyaXpAfyL9HgoDZm-Rw2eDDw>
    <xmx:4pfuZtQqjTkYVgVE0uASz7OibLGkcyVXkYwMW4LkSROKqh0RCoQ8ig>
    <xmx:4pfuZspFoxuRuTQvA0XFR4M39_yPu9XjH7x_jpBxl6LZOuuaT8SmmQ>
    <xmx:4pfuZtavapqqb6q4rQ7LPOPULVIX1_CdniHXuJ1ewGWc6c3Ga0pnemLl>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:54:36 -0400 (EDT)
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
Subject: [PATCH v4 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Date: Sat, 21 Sep 2024 21:46:11 +1200
Message-ID: <20240921095153.213568-23-ryan@testtoast.com>
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

--
Changelog v2..v3:
- Lowercase hex value

Changelog v2..v3:
- Correct #include for writel()
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 7683ea08d8e30..2eb5bb2547e92 100644
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
@@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 			"Couldn't deassert reset control: %d\n", ret);
 		goto err_disable_mod_clk;
 	}
+ 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000a980, reg + 0x28);
+	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
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



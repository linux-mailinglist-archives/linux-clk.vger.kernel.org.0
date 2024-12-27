Return-Path: <linux-clk+bounces-16365-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 257799FD497
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 14:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40E41886AE1
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 13:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D415B1F7077;
	Fri, 27 Dec 2024 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="k78Klexl"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A61F7064
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304572; cv=none; b=hqZPcnh91HJstw4AKJLqZeG80GzK82m2E6soqEQo5880z8ftB1YfZclZpEbbwo+AGkNFd79wphm2+Rk5U26n6Tb8gnXIJHTE7r8uSk6kX5BdsO/idGSvKoZy16gfJ7us+gJ6aujJC/c4mhhwcZe7OZ2OQFjXvDwTKTLfXKPx8mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304572; c=relaxed/simple;
	bh=AkiOtlTE4u/lst3b/C31pu+RJ7eNIYaDQvfAJLBj/Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVixfFs6LH9E1zoTpOA6HgP5jvO94tALmk9tw7mb0mv7P0j1g6PHB12eQWplHAYTRwt6ERpCxfobFfNj+r+VRVNj8W0VxtNbSuRKDjG0/Eg3IxQ3BCWUMqrFdUn5nyP1pZP8Aepxqb6iBmMnw8hxWlq5TQykELMDpRzmfZW5OBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=k78Klexl; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id R6I0tXQ8mxoE1R9zPtlHg9; Fri, 27 Dec 2024 13:02:51 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9zMt7pfHlDL5R9zNtTXD8; Fri, 27 Dec 2024 13:02:50 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676ea57a
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=8YUH2e0Ys_Mie9xma7wA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YrLVykqlMMRYoAZ40Gm5GHLbrDBKpbvHh222+1nl1sg=; b=k78KlexlRsDbSTFOglO7/FlqPv
	EIdyYcPIF+kFRWvudNqD14Q0Q+uwKn38Ym4cE6YPfvW9zb7kGDKYPLr3XWua/r4gRZ9XQBv6G+Sok
	Yu9byCsBqtfqhRZoNDDNQGgilEH+Bx23CgMq0tMcH/opquRWI0HR2ze++61yejBKbpTMWmQjQfi8v
	4ETvxGFWV5ICcedNLEztA6Istuy7tSqqV0y8jSYpSkroNgXcigkPgBF2Uqw6+NAUZh9Q6hVD14RFN
	S+1ndwyHdMQokc8m8dcvLCb0WEHITjXpREf1w+97VX0nIYtbO2SSGAtzjLHSnqTlW4aEz31Nt/aOd
	uUOKa0aA==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9zD-002EaQ-15;
	Fri, 27 Dec 2024 18:32:39 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:31:04 +0530
Subject: [PATCH RESEND 15/22] clk: sunxi-ng: sun8i-de2: add pll-com clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-15-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=2447;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=AkiOtlTE4u/lst3b/C31pu+RJ7eNIYaDQvfAJLBj/Lc=;
 b=itsAgQbKjzCgMnc9eppPifulo7E1Tan+NiL1JiyWH64Fa6QHsGiXfPtaB4hMss8iKJkx3BMfy
 dUluYhgUb4rDIjhDJSMEhDl4UJChxd6+MJPobrt3G/gX2Id1J4dmVeY
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9zD-002EaQ-15
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 446
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMWImSQ/FLqX/nwLb9WrzBjhbnjNze9ZMskv+35g1H1GTsThyLlmqQ4iUXPA4Kh4D2aOnSV4lfXaroPjmwBKWXYsRefvseJEGbWqapzWYdi0mWW2Mb1l
 KcU8cV7cgLgfFONDpuIDZxJxIO8/Ne+iuUTSRXa1Jajbv8YqoQt2DVdSskI/C3mpzAho0Z0nhO36YIBfXo24cQyeil7L9v+/25U=

add optional pll-com support which is available in some platforms
like A100/A133, which is used by the display clock. There is no
documentation reference or details in DE 2.0 specification.

But these changes are needed to get the display clock to work and
this is inherited from the vendor BSP.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc2..3e28c32050e0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -241,7 +241,7 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
-	struct clk *bus_clk, *mod_clk;
+	struct clk *bus_clk, *mod_clk, *pll_clk;
 	struct reset_control *rstc;
 	void __iomem *reg;
 	const struct sunxi_ccu_desc *ccu_desc;
@@ -265,6 +265,11 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(mod_clk),
 				     "Couldn't get mod clk\n");
 
+	pll_clk = devm_clk_get_optional(&pdev->dev, "pll-com");
+	if (IS_ERR(pll_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pll_clk),
+				     "Couldn't get pll clk\n");
+
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
@@ -283,12 +288,20 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_bus_clk;
 	}
 
+	if (pll_clk) {
+		ret = clk_prepare_enable(pll_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable pll clk: %d\n", ret);
+			goto err_disable_mod_clk;
+		}
+	}
+
 	/* The reset control needs to be asserted for the controls to work */
 	ret = reset_control_deassert(rstc);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Couldn't deassert reset control: %d\n", ret);
-		goto err_disable_mod_clk;
+		goto err_disable_pll_clk;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
@@ -299,6 +312,8 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 
 err_assert_reset:
 	reset_control_assert(rstc);
+err_disable_pll_clk:
+	clk_disable_unprepare(pll_clk);
 err_disable_mod_clk:
 	clk_disable_unprepare(mod_clk);
 err_disable_bus_clk:

-- 
2.39.5



Return-Path: <linux-clk+bounces-16338-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E6C9FD3A2
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 12:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1815C188586A
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC141F2C4D;
	Fri, 27 Dec 2024 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="ThXseK5o"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD891F4286
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297763; cv=none; b=OSGOQGIcIDAcy+J1gP4COBSzHm6YNAU7m+v6ZVL2zX6q+Q5dJ3VF+cPBLQm8ZR5f6z3OxjpY3Ngk/UM3ATkDI8grIkX/gyfXgq5oV/Ol5PtWa9OM52ifZ8Xm0Fh3b9z3G6iIFIzgxaJ7kZqejR0VjS3TdBH7wwDNEkRlxnKYwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297763; c=relaxed/simple;
	bh=OF2xEirt2I4TWCuMHqY/Rfu3fQsoGOZ+4waicM8FC9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqQHBNNXkCf2wrRjD5rsVtpwJ+ykRmrlXl1Hv7d0H8sEQLMvPenWmKA94Rotpc2bH/TELIZGR08Ki5mUQkoI/3Zqcn94v0iaH2GVN7UboKp6+iU8bNnjHRH8vM2bvc24uj6SX3UCR7GA/te+NL7zdKov/00TL1jU5dc83QdhuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=ThXseK5o; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id QgZztXmPtnNFGR8DZtXDOf; Fri, 27 Dec 2024 11:09:21 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DWtoE2U2Zy0R8DYttMud; Fri, 27 Dec 2024 11:09:20 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=676e8ae0
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=VANPn-21L8UGAxZ6yr4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=phv7iVVXVzjakNqDgdbYw7zx5GFmWGAQJh9j37w1dWc=; b=ThXseK5od/f2R25+PRsd43PiM4
	cP8A/ZvhAybkT+LCINpqRQNduiMwq4RyglowjexUDqdJFJx/ekog1Jhz7eeULZJkNVNE/TtRu4lYR
	74F4vqYVts/i07DvN56m80IeiZMWc4Isgo2a0ZT+PizZAb42ama6zJ4+y0xYDYRNHARh2eKQGj1A2
	vkynkrdMtm3/vGrkvgiQlegBN+mbFKnL3r+uHkn0cDwoVsODlLiRtjrxJ8G/afYk2kcuR/vZ2ipnj
	ttIcQJQFKCzvQ5strteptQJNHvFT9pV3SI92qMUA1GxuKfjmXU5MlkZNdFXqxMKgdzzGcCi/OdBJw
	JWi0K/Sg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DP-000bEK-2q;
	Fri, 27 Dec 2024 16:39:11 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:58 +0530
Subject: [PATCH 11/22] drm/sun4i: Add support for a100/a133 display engine
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-11-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=915;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=OF2xEirt2I4TWCuMHqY/Rfu3fQsoGOZ+4waicM8FC9g=;
 b=fGp7v4SGTK0k7oY1nfO7iOPyXtT+W0sH/qCeqn4yRfELAjBZ2AytoCH4bQp52XB14uVa69J0o
 aCEINdrh3p7DQ9sPMwGkrEx6YufICcsAuyqeNObKpd1Q/R9jiYnQtO1
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
X-Exim-ID: 1tR8DP-000bEK-2q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 337
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM3SJm8HOLO/HbhhS/KJmhNT+j9fnTofylstnQC4QFznZn3TQDj6LlY0Nr15w2vKD0r+7lwnxeUVriSqzn+4dxwRf0MlF3gDbBoYiSbAoZU8VoqArnsQ
 OMtWB6V7R3ZBLM+WAQ02/UB8wv/ccV+dju6fXfsFtz8LhFcdy+JWNZpn46U/SrrwQPHN2x3vMmigpI+AHaK7urqxL0SxLIVl76k=

Display Engine(DE2) in Allwinner A100/A133 has one mixers and tcon.
The routing for mixer0 is through tcon0 and connected to
LVDS/RGB/MIPI-DSI controller.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 5eccf58f2e17..e012a6316bba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -436,6 +436,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-display-engine" },
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
+	{ .compatible = "allwinner,sun50i-a100-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
 	{ }
 };

-- 
2.39.5



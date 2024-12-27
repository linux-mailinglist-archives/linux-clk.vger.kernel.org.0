Return-Path: <linux-clk+bounces-16339-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956E9FD3A6
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 12:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90129164BA9
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 11:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BB21F470F;
	Fri, 27 Dec 2024 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="I3a0a9X5"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C31F2397
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297772; cv=none; b=D9yhu5XE2PxePUZfQH5kYACCCv7VUhf2MZmgYlTO2ZIkxKDeBZOVO9ANqz2Ncuymzv6cTw2IriEay8olespzRy5a4hbNLB+ckYLQT2BLywdSZpUliz3k16SCkU5GWQ8Hw1aEOOOcEft7vpOA2lO/RS5eacbcePZwFVoNdiblN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297772; c=relaxed/simple;
	bh=cEYXVRlHCL2jiFXMcJ1CyLQxMMvsOuDFr2JBco5EkAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUCMBT0Bm0REUG1vdkySteC728Ozm59DL1x7CMZm9SA2l9JshWcubqW98rjwY6RPA0R85Fwq0F/O44lPFVjI/Vatd+ePhOsaA6AfWnNkZJKrvmIQW3GrwILwFMJCukZUdefwHGoObaI5xdZ17mZhFRDB7HmssABojHcj72HROEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=I3a0a9X5; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id R1WCtEdZGvH7lR8DitJAbB; Fri, 27 Dec 2024 11:09:30 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DgtjD18bs9MR8DhtedFo; Fri, 27 Dec 2024 11:09:30 +0000
X-Authority-Analysis: v=2.4 cv=FY0xxo+6 c=1 sm=1 tr=0 ts=676e8aea
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=cKcOzP3ZHZptonc-xdQA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CrJYnGSuQ/C3gLGR8duqgqPICFRR6aXoD7bOvZZBy6U=; b=I3a0a9X5lI0wzRtsIdNOukklaO
	NIJpKEjQy++/uBFOIe8Kizt+V8Koz9IEkTVlIYn4u54R/kcnI8jsHLWyhMYE8ft6jFZxX7hL5kQ1b
	hXBYTDN3OeOA9ddEgV7LPBiauAdG9cBCYXAUZrM6wdCG9OWdr2XY87iplcSjUx0VaYO8ZLjv9s4gz
	++h8867cyxfG0wYjpGbK01v7iL7WZkPoJPW/weC0+EE+naSbgK4m8uhWf8aJiKLxASdKvzyYIaaGZ
	XilQ3cG86hEyVv//1BMdlqCOPNNWGU+3KO+qeq5OLIalnebZ/bEJ0Y5zmOg4TXE+yRkVDxplEfjfn
	Bkrp3AxQ==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DU-000bEK-0F;
	Fri, 27 Dec 2024 16:39:16 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:59 +0530
Subject: [PATCH 12/22] drm/sun4i: Add support for a100/a133 mixer
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-12-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1309;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=cEYXVRlHCL2jiFXMcJ1CyLQxMMvsOuDFr2JBco5EkAo=;
 b=5KgFwyFJwXRqgFb+1AwyCG4NVbHlAA+0Gud9ArI4tbsf+12Vwj4Zr4reY7LCTfJVGeOLZQ793
 +5jPpZU8HP9AFPy4qIGdA61FqeK5P1fJ6LWF8jgbIthvI5nYY09bmee
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
X-Exim-ID: 1tR8DU-000bEK-0F
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 373
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBqlt7P1lWquBcKqiCAThxhVRpXh9toxkXhXkUSu012dPHCzKeN6cnMjjrDFy4QXUmwHcKasf7Be9dbotkHpfA427IBjfjmFnFk+2DXlcZpoDkDCLLWd
 RN08WLHgNaEmj9/XwSAAHULB1q+2M20zE6k3Y51wP7U9xjZGgH5xt/1Uq7fhLOkSFZBs2FUX1UIIntxC3ZwsNFCycoDfTb4hEf8=

Mixers in Allwinner A100/A133 have similar capabilities as others
SoCs with DE2. Add support for them.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..0a1fccb87d5d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -714,6 +714,15 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_a100_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.mod_rate	= 300000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 2560,
+	.ui_num		= 2,
+	.vi_num		= 2,
+};
+
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
@@ -765,6 +774,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-a64-de2-mixer-1",
 		.data = &sun50i_a64_mixer1_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-a100-de2-mixer-0",
+		.data = &sun50i_a100_mixer0_cfg,
+	},
 	{
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,

-- 
2.39.5



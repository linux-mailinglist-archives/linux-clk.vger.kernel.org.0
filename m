Return-Path: <linux-clk+bounces-16355-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A389FD46F
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 14:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F03BA188500B
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 13:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34871F4720;
	Fri, 27 Dec 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="nrXAJRzM"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD31F4706
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304517; cv=none; b=NnjjDruglcGoA5ofxBumHQI//0o/S1D+SvOJEQSW3jqrBgfhQuRwLloVBv7Mdt5PW+W75jswMkRMMo6U9SSLsDlDddvDl81KGTV02WPat01lf1O9jAuTpH0p2WdA/pAKshE1Xm+1Zo+fycuCDby2LQdzxSd79EEsjxtqZLjJRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304517; c=relaxed/simple;
	bh=m2A1ofv8GeCezN3hco6q0KsR/PZlS1bM75pboayywLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0fsLB5vqSjpQ6e7xqzJI4WihxHkg9d/D0URZxLwDP1I/ZhEgCK/I8S09EcDSxtIonoV+dQQr2Wy4d9/ccP3pijaMiDBP/p7qUJr0pXEor9TOFo2K/Hv2D4Z4OpE4wYP2jYwCZ3VnuYiY+kttwq99GuhxDcHkHJdPuvRxG7dDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=nrXAJRzM; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTPS
	id R9fetXukTxoE1R9yVtlHFL; Fri, 27 Dec 2024 13:01:55 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yTtNq9Q827nR9yUtdd5P; Fri, 27 Dec 2024 13:01:55 +0000
X-Authority-Analysis: v=2.4 cv=GeTcnhXL c=1 sm=1 tr=0 ts=676ea543
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=WudEoZjip3EUb6QGksoA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GlbwVthHYeKY8tBVeUkULV/njVfk66cYvdQ4ontQNdE=; b=nrXAJRzMoHBUsBxqbM2zhzeZbD
	2CKn4oTWL4TV+k7Zulm3y33EWyGUoY3egVfYbH7K8aMcW4P1GtRUApoEj9YUvrmwg0udvGxsZ7pRD
	6icU9O+YzDICRx/IXpH8p7T6erqQZb5tsklsrA2q+qevGNvwHjew83dHq8I8kdAieeS0pewfTLPBv
	pRO0HRXgB6nU/dkvGN9iqHXHs2D2s+uocvW3Sckc/8fmlB+xRg0twTABRH9g7E7PnCUgjjLRLKNuw
	l17+B1zoZsmiL2qz8IBf019CNRiH95HLcLTtKYzfABUZF9Kzp4fIUZdrC40rIhabI4hTKUFbWI/dj
	AmUbIs2Q==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yJ-002EaQ-2v;
	Fri, 27 Dec 2024 18:31:43 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:54 +0530
Subject: [PATCH RESEND 05/22] dt-bindings: display: sun4i: add phy property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-5-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=924;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=m2A1ofv8GeCezN3hco6q0KsR/PZlS1bM75pboayywLg=;
 b=dX5VDlrYwRt2TY2dPygf9hCgTB1PBU/sdBgUXMX7+uP+gR5FxSZzPj3RvB9rI9l9oE9hCP3rU
 w4nE/xDzVu2D5sBVq/szgCDfdYaVpNm5Ll2sQBicywDpCuNINB3x+ON
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
X-Exim-ID: 1tR9yJ-002EaQ-2v
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 156
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB87zEb3ehLOnK+cHQYnEh0280/cVGZgZH03Y1xLxTjan6KQ4fGeOiJDe0GH3Nn8+XGKBL6NuhCWc7GieDEalX4ijH2tNcSLz3H+FKDkCMFXiZgDDA4P
 74bY+wjdJoD57j4AuqvrDyeJP8oRMujsuOcfl5WVUoBZOMlMYyioklfKtbzT9y+FNrWQYH7ApBzIYLKLwZosjlysoxrOwlNQsvs=

lvds in A100/A133 platform uses phy from DSI block, which needs
to be handled in phy driver. Add phy property to tcon with
generic name 'phy'.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..6d8ae781c230 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,6 +115,12 @@ properties:
           - const: edp
           - const: lvds
 
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: phy
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.39.5



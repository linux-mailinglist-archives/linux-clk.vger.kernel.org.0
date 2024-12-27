Return-Path: <linux-clk+bounces-16341-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9229FD3AF
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 12:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E5AA7A2514
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 11:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC471F4E45;
	Fri, 27 Dec 2024 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="N1YLZNk3"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDF1F37A9
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297779; cv=none; b=m95aZYRf+iC/YGzkP9wjftJ3JvuY4HNHWp5FdY+rzCuCER6g/R8wmOQMGU39PbvXyl6c3Ae6+heBnI0p3IY35B/OUQCFF/JQC5wsG8jIMFy4Bzbsjz4sLQOxUnsJOYuU8PhlL/uhI6hmGHpI139p/CROMCa91NbR6LfNSx+Geu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297779; c=relaxed/simple;
	bh=sSqsAP7aI8LtOIYP4k3+cQUQommzJizcH73kj4wGkh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKMfYClTlYVAjuMp7qnknhKPRwXZTEo3qEAkLmKYRs9pD1iAkS9c8SIjBEL0p1R57EohIC1vIj21hPO1bK54dLJuUhbfqzY7fPsh6gVf66Y7nbymguA5McYoJNhEIIugKYXRmscPp5fEyrjAeb7MhTlIUOEjSGFPw7Eu7I+HO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=N1YLZNk3; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id R46jt0aiFrKrbR8DqtWlxQ; Fri, 27 Dec 2024 11:09:38 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DmtdxOv8PtxR8DntlNpe; Fri, 27 Dec 2024 11:09:37 +0000
X-Authority-Analysis: v=2.4 cv=Fegxxo+6 c=1 sm=1 tr=0 ts=676e8af1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=zUiwhsQguGSo42tcF88A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2ZTlzpcY9Nrn1bF4NErKmO8JMU6UkWIH2f9/tcnoXh0=; b=N1YLZNk36kXkdZeCip1ee2uVXF
	a+VooNL6VWwd9Lqk3zXfttZKyP2YUmBLrtJT73QkxkXhu283hxj+CxOLIY6vtinrm/SfpkQQH3OdT
	kbRQBhyoeiLH1WUIhiNf9poj45SGlZr1YxbBM0hItqXqUAh8RO8/FGF/EHmSizO4f+xQY4t8SEpVa
	9j8PTh9hr9L6zeVXq/s2CYKEKYKe6MW/zO+uaLIl69PcoMWC49a3MYVqfgxILsh6AfLuC6+nBmbr7
	gRVSYtkepbMi0JuX7r/KURseuSbOVnt2BvH9KphngQJ9aHClHUzSxLwXsLhbPe5iKbwKkG+qZowZq
	r7/tPI6g==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Dd-000bEK-1y;
	Fri, 27 Dec 2024 16:39:25 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:01 +0530
Subject: [PATCH 14/22] drm/sun4i: add a100/a133 tcon top quirks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-14-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1225;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=sSqsAP7aI8LtOIYP4k3+cQUQommzJizcH73kj4wGkh0=;
 b=hKJUyEpYKYvGHwRhQmFQa8Mwv3Cpy612ASRC6nttQ+FM99Uud7cdJpw1tWBbS1cN/LG285qLm
 ag3/LaFKqb0B9yXmvGuOeU6wrLqNXswhPmc5JVbrrSMD0tmc3V4ETmN
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
X-Exim-ID: 1tR8Dd-000bEK-1y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 424
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP8kA8pZSoEOoDNdPJdN+4zJizH76jTOUKHGKvrsb4prszRae662MXuIRqac7IlV8RfdMR3KlcFAi7MQ7u+D4DDVBspGQY2LXehqGmXeG0ELClFXz2U9
 ZfwzoNEllzPbZs2yPgEr1K0I0uDI2YHFjnwTu88CEpy8RyVoKFCuiEyQMchFKIPpln/11fZiZUIJXLT3ii6K7sVk3CK2J51r6r0=

A100/A133 comes with 2 x LVDS, 1 x DSI without TV support. Add
quirks with tv0 disabled. DSI support is not added.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index bd9d0840ead7..a777b30ecea0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -280,6 +280,10 @@ static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
 	.has_dsi	= true,
 };
 
+static const struct sun8i_tcon_top_quirks sun50i_a100_tcon_top_quirks = {
+	/* TODO DSI support */
+};
+
 static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	.has_tcon_tv0	= true,
 };
@@ -294,6 +298,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun20i-d1-tcon-top",
 		.data = &sun20i_d1_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun50i-a100-tcon-top",
+		.data = &sun50i_a100_tcon_top_quirks
+	},
 	{
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks

-- 
2.39.5



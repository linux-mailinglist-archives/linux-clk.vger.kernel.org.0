Return-Path: <linux-clk+bounces-16336-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 373819FD39C
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 12:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1C03A1CA8
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 11:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52ED1F4261;
	Fri, 27 Dec 2024 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="J4Qefxrt"
X-Original-To: linux-clk@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118921F2372
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297757; cv=none; b=p2ivfDw6dlrnHrY14e4JG97XFZesdLytH/nBFWU5XvoOcYADqUUS+KbEs33lxRvPZpNa0bjEYBQPCXfPAGhiilWVuH38NCd6A7b6hf1SegN7IQrv/+A07bKNoZ9yDN/fX5apgqZ1r3geZA/DJ5Yt8Qy9rn/dOW3Y12ZpcByYihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297757; c=relaxed/simple;
	bh=P54KA5XqlT/VEM0AcqfRzSVceip5YpdV+G0SVeiVvo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8J3nTbinqPdG49HS+E3fQQdxu/ptbzWTNtgLim6Q7AaMiGXzcmVS+ega2rHJX029nYAKst6y5USQQ/fFUB+gmsp2zCu1zfAYdxS4st+BlJ0D/1SuQY8olPFgr6GGiuBj/7oD4eJsWQ8KLyHPPKitFl/Stu1A9wVUNMhqM6W2Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=J4Qefxrt; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id QxdttaOx3nNFGR8DTtXDMy; Fri, 27 Dec 2024 11:09:15 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DQteDqzWdNZR8DRtgakl; Fri, 27 Dec 2024 11:09:14 +0000
X-Authority-Analysis: v=2.4 cv=FtTO/Hrq c=1 sm=1 tr=0 ts=676e8ada
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=85KA4Hw53eMu32bbZw4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qiSM89V4SzYcC8gEAu73STXv5s6bgJIn4sStUDfq04o=; b=J4QefxrtzVqjYeIamTNA/XK3a8
	EUQY4FXxWmcMXS9Cka9KSJoGT4aUl+9J+XwYKutXSUtvF4JtaHnWgK4sOFV4QuswteKuVETasb9z5
	UMxJOG3kJukEkv+2Fx698ko9rITyYtsUhhiOfM0ITIpTZti6zuXd4Eh78LAwuuUNK3Xh+27AacZhI
	KutWJUmlV4AUJJjiAbiK2UEWICCZ4ivc6EmHHG7clPUznOEpW/FzMiE2EDnUYCB3Lq0jrE92NZNjE
	2qDuws5uhLSEX2xov5w84rx7veKtx7s3VdDVtJ9t6VsjOcP5e3t0HRXcCd5tIy1SiilAInHOreWzD
	NCgg6dFg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DG-000bEK-36;
	Fri, 27 Dec 2024 16:39:03 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:56 +0530
Subject: [PATCH 09/22] iommu: sun50i: make reset control optional
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=819;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=P54KA5XqlT/VEM0AcqfRzSVceip5YpdV+G0SVeiVvo8=;
 b=UAKOPo44BMV/nlZiP8v+e76CckorjVoG/W2zTYtocflHcdNVAdWd4W7oXYpdS7HcjLvh5atkb
 dkhixZP96ODA+J/PFzAhOqt0//04YhdWMSHngs7SyBFEGYTRfOPBf+I
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
X-Exim-ID: 1tR8DG-000bEK-36
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 279
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPlqIS5crq0SJvv+aQTmCBvK1VFWyzu7Tt6XOylVOHio9rCMvPsp7iuybphb5AubsOUSuUFIqcvgExAoVTZi4GeHvvd5zW2JrNgAqtmn/F/7qoTJe/wp
 ZM4Cio0TFaezqLnourfmbQGJvNAWBEi29Ca5B43eHb4Qw+Ft+pxbJaNSpQolzalLc01zzjxhmTf4vqJR8vpfgJeWLlXoNnxSJqw=

A133/A100 SoC doesn't have reset control from the CCU. Get reset
control line optionally.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/iommu/sun50i-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 8d8f11854676..2ba804d682dc 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -1030,7 +1030,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 		goto err_free_cache;
 	}
 
-	iommu->reset = devm_reset_control_get(&pdev->dev, NULL);
+	iommu->reset = devm_reset_control_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(iommu->reset)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line.\n");
 		ret = PTR_ERR(iommu->reset);

-- 
2.39.5



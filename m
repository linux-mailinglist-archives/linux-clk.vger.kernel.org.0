Return-Path: <linux-clk+bounces-14252-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4783D9BE086
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 09:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECF81F22724
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 08:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B203C1D5AC6;
	Wed,  6 Nov 2024 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IPxMBA+A"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64B1DE2BA
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881191; cv=none; b=NRMyvlRwelayp8qSMO3G3XBIpI/fVF5qyXwBqylP7OvxlBTEQkz1OEx65tSD3/4spmGhRfqu6ejnGSKIE3IKkngO88ef37ehgTat6oTnfdsjnWmLtY9K7rf02hzF6TwoZ50La+JHfY3bWzqC3q55N1Z7o1d2iexiW/yKmbO/eas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881191; c=relaxed/simple;
	bh=YID8IYH610Iing2cJZPx6UW3BF5bizj27YuaKHhCdes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBSy9pkE1M1qjn+XtiC/wAXdOPrqwfPyQ7PVNqwWNRf5FlPrNJJnNMerjB8AUcvYrIftW9ma/v7oIFnh8ePmQ54kFaWpI34VQc+WGjYYIHfa9N1NW3U3gaufa9wYQwt86VughHyI/K1xOpds3gAHtDk3ONvpIbEXQuswPEFUzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IPxMBA+A; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cec8c4e2f6so4779113a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881187; x=1731485987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/hWNG3HAgCOlQHhONRJpVCG0tqayFG3P4E3MIcwkoI=;
        b=IPxMBA+AqeE6Pmedv1wrTxNQAWZTCS3raqm0AVS/vhYB+DKEglnZDQ5oOv68CWB62H
         EMGOrWKRexw2dbP9RYgt9Ioa+ecTsrbrIDdcYV3xMm3QRtylu71aSiRrW6iZyyFDFXjg
         u9cvmds9c0tzwMCWmKQr8KVqhKGpGfpO9R2XG4Ba0cvgnPWE79IRXiS1itkQTrQAHHhM
         e+Hg/EKxxFlFgCh3Jo54Yw6bH2hcdjugoUOT+VtHtAhmIp6vGtUVsQ2Mi7JlnuQCxGVu
         a+MGIWhl6MOewmoo9TCtgz2TlfMliC4rSjmWbTQdxzWwDYy1r/ahT1p7IwFW/U+jjSnU
         QMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881187; x=1731485987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/hWNG3HAgCOlQHhONRJpVCG0tqayFG3P4E3MIcwkoI=;
        b=uaxFqGlMURoydHLxPTqxqS74CU1zsZOC07QzAkLdVJM5ZG+6DAEphTOLE+w5Cbl3xO
         +wNcrKOeMw0f78EZCUui0F4QWFMsRVGNl14sckoQftNaah5mAf4wny5xlJnkb6gX89qz
         mrMxoweXpnxs48yNk0/Z+JtIJXmYBeD+6KP+gUgP99KwduE0wCnl1OUfEwkvYzebsjc8
         eAjsCHHuMpGQrS/3u8mzAyM5220jnsJBJOsIJprpshEbLG5/7ThfKzo0+8CSdVXsJsrK
         jvPFpipxwHg5o7dOVRo1F92jojjJuIgAc87gSBlVOxiaA6mfmCLyS8jTmQOKr0armRAI
         Xv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXngJ2NQhFbRDXz4DjE9k69ALudXmooLDR3QEK7V+R6TKvBgl9q9ihrqWsQsdU4gn77TJkXO/7Ax0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSpM3uG3jCVAnPsvhstQjp/nJX5AQnpr+DaQrvi+0HuX8RlJn
	ygFxF1XOC7idOPrBp28MA9gOwsRFlhgSEHsjXj6h+318nGcPUM5jjKQPqoRDASE=
X-Google-Smtp-Source: AGHT+IGuHBRrgKxJoGl8Urt0/2Ht7js+NxyCMe7K+fJ5ezE6i8Xc31oLkZHGUMAc7oNBPDO8yDM+lQ==
X-Received: by 2002:a17:907:7e88:b0:a9a:4fd3:c35f with SMTP id a640c23a62f3a-a9e6553afbcmr1883561266b.9.1730881187433;
        Wed, 06 Nov 2024 00:19:47 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 15/31] ASoC: sh: rz-ssi: Use goto label names that specify their actions
Date: Wed,  6 Nov 2024 10:18:10 +0200
Message-Id: <20241106081826.1211088-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use goto label names that specify their action. In this way we can have
a better understanding of what is the action associated with the label
by just reading the label name.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 0b5bc973a23c..468fefdaa9c6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return ssi->irq_int;
+		ret = ssi->irq_int;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		goto err_release_dma_chs;
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1136,7 +1136,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	reset_control_deassert(ssi->rstc);
@@ -1152,17 +1152,17 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_snd_soc;
+		goto err_pm_put;
 	}
 
 	return 0;
 
-err_snd_soc:
+err_pm_put:
 	pm_runtime_put(dev);
 err_pm:
 	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
-err_reset:
+err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
 	return ret;
-- 
2.39.2



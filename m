Return-Path: <linux-clk+bounces-14645-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CE9C7102
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 14:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088161F27DCA
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AB7208975;
	Wed, 13 Nov 2024 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TEFSKpPJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7622076A0
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504983; cv=none; b=rY7sfD4nrtkBCmrU014V3KdgNI2fPfnH/zUVhafQuMosi34ZzDDV6rk3KpDnGpWabz9tsWpZOG/B87s19EPD9zUtYTeZtdyHH+rYiVDxGOcISxoNINzhgFdTsnXY55YTwM4LJe/Gsp8vP/qmjlOYUxanBGiHDA/b4LJX6NJotsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504983; c=relaxed/simple;
	bh=3/nMrplyu1CS26v3CmVThtiTMNI7VxBJOloy2v7mF0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hGvPC62zSdZ7bHg9YdJOvF8MwLCw6T5aW56JmIGHpYAZ9V1E8VicKbBlFN86SrQMrkBSTz5eZ34hGJtZ/cfKJmC3ApDCLyQC1ITNxYmjDjVpmn+7YsF66ipx0TdKkCMjNl8b5ZDlo8FnIEk4DnFN6SwLD+Pq9LvULg6lowheOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TEFSKpPJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53b34ed38easo6834159e87.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504980; x=1732109780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebvqXc3BNnaEmIYcV6FQ3/XHcONiwErht0FtwjiZBz0=;
        b=TEFSKpPJXuFvGQtQ3JP5pkMXuUxOnt26UbbwiH7A1s5ClkYTkfYKc2Z4jHjrxtdHec
         1hgvmsSgaRt9guu1yHSiTLm3wMWaz2MipuLoynb4sj6y6NVrXlWSnxDfoA9tOetGZZoY
         br7fQThtyQUhtWBh9MBGC6g8hGzDybgJMCxoaO3r05yqOKj32eNv1KvwO1/jVEjxaLtF
         IAp+GCM10fp9C1MZkCTfkhq+/fq3USGwH7OjP+vyIk8WYpAm9As/z+7j5WsiLImgFIzn
         TMyEGIOh2GhY+UHielG3tEw8D+hGt7PT6eX76Yre48Thai2ZXiEh9pMDkh11hRKE//Sf
         auPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504980; x=1732109780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebvqXc3BNnaEmIYcV6FQ3/XHcONiwErht0FtwjiZBz0=;
        b=qNdasjOAthyVn+Ba3PH3TvUpfQNrVTUFEMkqptTemzI35xkwQ0AGVJn7iiAWY5EbMA
         RVT1J8gEK7ezzTXc4Gl7hjEISNDaFis/yq4d4ipx+sqU6rYGoPEVLeVlKDIcNp+z0MOb
         GOzOB9/kvfkGQ3mcG20d8c3H6shKmteGbOHt2EYQO6gCjDX3fw7VuPj0+YV9AFZ0jwE5
         4NgxrWL+UcYGRSaLyQvYiPwLBLfJ5+zjeWqUYNMaPkMfeUABZ0g4FNfa0A7PoeMoEJLN
         TH2DHQgF316xWtBi6t2sWcNRGBcGLwYcZfG6/YIzlxU9788VL6bmOtgScdVpLM7s345+
         MTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZP8MP3vj5/oFM/SYJ1T0iqWCIO1zMR/jnNp3mspblr/6Fz72Tf/1/Y5OTRdi7fdswsPxemRAFv8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwN5xIMqrbDND6BrQw8X/oGLqrITe6sRzIk4qgQx5aq68PEY9x
	R4TPFH1O9Z174k1fQKrHACXSaoSC5MF34qRVssButvUS85Fv4uJJ5iQpBdl0lNk=
X-Google-Smtp-Source: AGHT+IGR1P7Lt4oB51b/DZ11e2JaXo0ni2pJ+vo336Q7wZP2XAQWNh1QSMMM2N1uppIPUB5UdQRn8w==
X-Received: by 2002:a05:6512:2248:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53d862bb5d5mr10522158e87.13.1731504979601;
        Wed, 13 Nov 2024 05:36:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:19 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 17/25] ASoC: renesas: rz-ssi: Add runtime PM support
Date: Wed, 13 Nov 2024 15:35:32 +0200
Message-Id: <20241113133540.2005850-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 01e8b6a4e8a8..d0e2665ec830 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2



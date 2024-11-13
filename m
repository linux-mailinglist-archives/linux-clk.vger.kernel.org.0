Return-Path: <linux-clk+bounces-14647-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E59C7128
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 14:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E39F8B318F8
	for <lists+linux-clk@lfdr.de>; Wed, 13 Nov 2024 13:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3604B20EA28;
	Wed, 13 Nov 2024 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="miJMegoR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA420B1F7
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504987; cv=none; b=hov+X6Xcbz6ZiKNzpuHCZnlUaQbuJ+0wq8I67lMe5z8eSjbU0PvdCSnIyzrMEP/3qKkF6LKIBuM8yvOYEZOpbG6ZDJ59A5RsfPu+KcReXJKwF+OLPBM5PvyYjT6JHHaTvZXcJrrOtpBFw6d7UYibiaoXbKYZtUDaPqxQFzSI7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504987; c=relaxed/simple;
	bh=LV91bwoXWlhlxgMQ4GB9XRzgGclzqP04XzJyr0ej6OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6+qfjSc1IlcGO1ia2iNgAWRaeISuE6JvIckLWO/XNfItn7sdQoZP1kKXpwjavKGrcGWXjyaKWH00S4PoHgcY5iPjB0HMCIa45LY7U4WXc1fdbkuFZHO/rmPaFsB52BPnWVHsWaKchtEAgrwTHF/31qSmg5wqbObyhgfQaP9wpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=miJMegoR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so56506645e9.1
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504983; x=1732109783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtUBr3jV38UFLkTXmRm1D/6voPjWdBhNnwQnsPaaUvc=;
        b=miJMegoRZX2wWOXV5qKzvk2mejN22iyKqrjZFgyNbdAxivvDi9xCrwcMT20zTMo1Sz
         EaWCA5iV1yrg8yPfoKd2IW2SsBtkCt4NxKPOmFgJfqC/Y5FxgYmkmUuaV1OltXUFYd0h
         nBdzQqTjIg9Z8IulwXn0ynJcYn389Zr17wogU5Uz50CZnu/rsQ63RoupHkvlLyft8Ecf
         BH0MnxawZJdm54e6kuMWdzBhqg1uIgyVdAY6UI3nl3la+/g9z6sKXvwz8spj5Ol5PV6c
         FwVw28zt+9qPfvqaaW4b0oy3NXMbrHIuY8Uxg3pxcPwTS3YA5/m39a4W3yMUWzbjBjLF
         3Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504983; x=1732109783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtUBr3jV38UFLkTXmRm1D/6voPjWdBhNnwQnsPaaUvc=;
        b=vncM0NRH57lFF2LtoBV4eGnUFKOnCZpZmaOQ8QVz9keusWAX7hsDLi+4hsiDp2EBsS
         o0p9ozM4D421dqx1f0oG+OarKiF7wezlOtdXogROqbyC9xfrG10P6ejAPnM7L3kxBg8N
         mP263YSDM1joo0rIOuuis6Ef/Yq8pgLuS3eJq8lDX67VwLzrFbHXlZOsuhDiIB7Io4Ef
         wTWb6dUWzVVWIbrDZlkWdLqrqd5YkWBu701VkNBkZZFyVXMEhv+9H3Dl+Wuwd37gDy32
         egzy2BDgddJiYa08DhkpVAngjnXaMoqREP1/9kAtkScfl9CeTAETKzmWB90klYxxU2T8
         0+6A==
X-Forwarded-Encrypted: i=1; AJvYcCXiWJKkP24Us8lCo/72Jm0F0Zd1MtKm46ZJQVHwsEtpvSsBCbbzXqY21SVKKXDHmmj9ezEzlm1UIS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywety5Onembl/bOFYs8BZ29Wc7OUsV9sBDxppCOgm/WhrDQwzWV
	zxIKIKXsJ43QUFDScro2o3MTGgQQV+jTBgdSgM3vTOTv5zOzgnPpaRm4kTfLQ74=
X-Google-Smtp-Source: AGHT+IHYaAB1VGO4IFn/DIJKzMAa0KUZXqhtBn2mZeUOrZECvdY2Hj48tOrHGijj+2dQBlDCVnwcjw==
X-Received: by 2002:a05:600c:1e12:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-432cd47db54mr53031255e9.33.1731504983374;
        Wed, 13 Nov 2024 05:36:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:22 -0800 (PST)
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
Subject: [PATCH v3 19/25] ASoC: renesas: rz-ssi: Add suspend to RAM support
Date: Wed, 13 Nov 2024 15:35:34 +0200
Message-Id: <20241113133540.2005850-20-claudiu.beznea.uj@bp.renesas.com>
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

The SSIF-2 IP is available on the Renesas RZ/G3S SoC. The Renesas RZ/G3S
SoC supports a power-saving mode where power to most of the SoC
components is turned off. Add suspend/resume support to the SSIF-2 driver
to support this power-saving mode.

On SNDRV_PCM_TRIGGER_SUSPEND trigger the SSI is stopped (the stream
user pointer is left untouched to avoid breaking user space and the dma
buffer pointer is set to zero), on SNDRV_PCM_TRIGGER_RESUME software reset
is issued for the SSIF-2 IP and the clocks are re-configured.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 10dd973a1c85..c6bedb58d3ae 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -782,6 +782,32 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+{
+	int ret;
+
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return 0;
+
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
+	return rz_ssi_clk_setup(ssi, ssi->hw_params_cache.rate,
+				ssi->hw_params_cache.channels);
+}
+
+static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
+{
+	if (rz_ssi_is_stream_running(&ssi->playback) ||
+	    rz_ssi_is_stream_running(&ssi->capture))
+		return;
+
+	ssi->playback.dma_buffer_pos = 0;
+	ssi->capture.dma_buffer_pos = 0;
+}
+
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -790,8 +816,16 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0, i, num_transfer = 1;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = rz_ssi_trigger_resume(ssi);
+		if (ret)
+			return ret;
+
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_START:
-		rz_ssi_stream_init(strm, substream);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
@@ -819,6 +853,12 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		ret = rz_ssi_start(ssi, strm);
 		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		rz_ssi_stop(ssi, strm);
+		rz_ssi_streams_suspend(ssi);
+		break;
+
 	case SNDRV_PCM_TRIGGER_STOP:
 		rz_ssi_stop(ssi, strm);
 		rz_ssi_stream_quit(ssi, strm);
@@ -958,7 +998,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
-				  SNDRV_PCM_INFO_MMAP_VALID,
+				  SNDRV_PCM_INFO_MMAP_VALID	|
+				  SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -1201,6 +1242,7 @@ static int rz_ssi_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops rz_ssi_pm_ops = {
 	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver rz_ssi_driver = {
-- 
2.39.2



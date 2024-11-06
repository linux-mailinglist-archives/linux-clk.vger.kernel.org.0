Return-Path: <linux-clk+bounces-14248-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC609BE070
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 09:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3857FB21CC3
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 08:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606A31DD552;
	Wed,  6 Nov 2024 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PHIUFqgc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A641DD0EB
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881182; cv=none; b=qtELDTMGrkY4ZfbyuJX9XKFSH98xjxT09Or8NyJiHo0um4Iw6Imp4hHY05SCb8sU0xW2ygqgcz9PG6CAbpKzYeSQ+ZCkcceGicyxzZuZo7Jb8mXiuMrbZNGjrQCk+O0YHPhoZZmsuo+vZBS7H7fizb2wY6rSYgaNXYmPuB7EXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881182; c=relaxed/simple;
	bh=FvHfkcoFRcdGgeRO0csLPELeXnRm8NAXFbb5lVzo6V8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6gx28tl+jitMY11LBnccclOFNkr+YXpZ4u25grB9e06ALFp94H21bP/+fKGewDqj9yG+z+WCNgZE/7XE4tVz5a+0zl13A5qtWtvWAk7abxtIfVxjfq1h7sqHJqeIjTA6XpIOp+dj103CeUcykVIBSAAcDcxXTW6pRy+QQe8aoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PHIUFqgc; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso55161601fa.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881179; x=1731485979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXlel/SvkVoTEjT+N6TrE9yJSliGmGXmOgOGBR7slxE=;
        b=PHIUFqgcHcpMKY6uvSQqq5CUa88nWS+/0yf8/x/JqxXkS5dW5km2A95ONn0+oHokqX
         qWw+mA5AIATGZumvA9hk1lfc9CKu5sG3HkLbDJSA4L+pp0nkYgrpCKSlKi6Q1ciElyaF
         NLm9dGinaJ6096SU7qWDJu8zny5Otk6kYmmghha6Y/NHbDvaZJQLUTUbfvMoILhZoMwE
         8C9Mo7CuJGzVqxTiAYtX9SSo7GN2LJUJI8e3jDO1OcmKdvb46uKRGeJ3eXddiDakGWDU
         FYBje/6zxg0eMN6kzwBpTW7Jyv8nMDtFwUAe8NQxN8DhmQnNShcwrhawb3mOCQzRVkn0
         DBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881179; x=1731485979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXlel/SvkVoTEjT+N6TrE9yJSliGmGXmOgOGBR7slxE=;
        b=DVqtSztPmOyF+S0xk0Pjwr5yLwdW54vcNgP3TcbXp9+3otNrAGmu/c9TdQCcYhkDq8
         xMXHtWNCMw3ZOBjIfjqGrFYatMAiXK7KjxI8inh5wI7ehHM9PaAdmjg8ZXGrxdtrFvef
         wduRvlA1bI9luntp117b8V3QuIaW79opQvDU3Z68+IQCEupCUcMqtU2NmEIjRHd/MENZ
         u4PIt0lgF6qe4EDC+ocJ1DM35NQZ0SjZ8KNEOXPMIuYey06nvBjuWI3Unu59T9QTbGWS
         ihQphrPUiJQrI5Rv2f5yO6+9LIosdECs6h0dmIFI7eb3D2hTR8Kcjnj4/xzjMtFH8RWG
         WJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5S7j15PSU4c0qecpKkeVJhbATXfCXTwUeKwhEaNSSkCgNI/fV23WeiQkzyRx1Jv8rSYTxJNQFadA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaa2fCtvVuXFXCSaM7Vr5PwOT4DCUhKNrBKHeJkX+ufivy+//k
	JedINw6ywAVxwzZyKDZtkkqd356fs6qf/F4LYVKcJ6fQxW1HAwsWe2JxrrQTrLg=
X-Google-Smtp-Source: AGHT+IGC71tLjtFqTQIuoFDDSZrzazipwnCmFv9E2NviCYNw1AygfQgtn8LiTJOzxLelw6cXGlOudQ==
X-Received: by 2002:a2e:a592:0:b0:2fb:6362:284e with SMTP id 38308e7fff4ca-2fedb796385mr157449751fa.8.1730881178719;
        Wed, 06 Nov 2024 00:19:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:37 -0800 (PST)
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
Subject: [PATCH 11/31] ASoC: sh: rz-ssi: Remove the 2nd argument of rz_ssi_stream_is_play()
Date: Wed,  6 Nov 2024 10:18:06 +0200
Message-Id: <20241106081826.1211088-12-claudiu.beznea.uj@bp.renesas.com>
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

The 2nd argument of the rz_ssi_stream_is_play() is not used. Remove it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4c33663a0ae4..f230d63339e8 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,8 +162,7 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
+static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 {
 	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 }
@@ -337,7 +336,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = rz_ssi_stream_is_play(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -674,7 +673,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = rz_ssi_stream_is_play(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -800,7 +799,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = rz_ssi_stream_is_play(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
-- 
2.39.2



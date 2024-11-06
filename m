Return-Path: <linux-clk+bounces-14260-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044E9BE0B5
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 09:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F04D1C234DA
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 08:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE1E1DF27A;
	Wed,  6 Nov 2024 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P0pLPNAa"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047691DF256
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881208; cv=none; b=qff+RaY2EoGp/VV2K9CcjqvY9egXJLABV96E5N44P4P2Ob87CztS675NQvMlMzPyfdg5r+kruB6eF36mgHDoYaoL5SHyLrVhlJmVfGssJO4JOk4yQ15w2Fjy4s8WEPYQofdqO8sMZt/RcO0bgcJb0+Cg6VNYpBDWLCleIWYXaQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881208; c=relaxed/simple;
	bh=3mgeWo9H+Ea/wgT6yghontuFY9KpbqYwCGWKEJ8OwHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=in8U/EgaGS421xEeyn9xXLgvn2maVFnl/sxSHyEdUrhpCZf99csRvUtnBWXze6tTc8aynKaKy7Nir9vL30Md/3ZJoHmjgajs74r6Dulb/9DBIcqJhYeybg9RQT52avezqXRt+yRughMOisTv4mINqNIAnxUGILNzM4V7RN6AGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P0pLPNAa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cec7cde922so6323875a12.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881205; x=1731486005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6uZ/GJNqZSaFJF0owpb3dr1c/B7qPoNYN81eJOhWss=;
        b=P0pLPNAaxSh7K+o9Ydklho2YEOYfdi3RqeuPg12PSoRf0e6MPx6ySclBqT1za+EG52
         Uk1FUSayiMa5mzG2II7DjrGpNrNGkmHO84rYsSENxhe3RZj1dKkr0e/RzN4HNpA3MbPf
         LLVQZiAW3YIK+Ps5ykG+2Uide81EtJRrLO3Hh7fCEdxYa2t8hc5FEzZz9FgYkgD4ljCf
         Nvf7ymfHUrpvp07bxnybfnuZxuQ8LIcPsTev4PmZqcUpmw/TkjlED5y8A23rEW1kVZWf
         35sb24H/m9IQ/vDPEj1wUPTNmLe9K80LUHg8CKcYLxDrhYyVMa7FbM/pBLXReNqWjSkx
         LuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881205; x=1731486005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6uZ/GJNqZSaFJF0owpb3dr1c/B7qPoNYN81eJOhWss=;
        b=r5UZw0MJI+Gk7F+4sPE7XgBFr2gqAxur5w61VM8JSeU/OMJ4LUZfgJSpGSZAt9C880
         bHBMlz5UORDv3K1t6RkXc/LCyHe4qNS2GEan44qJAw8J9NIFxWXyPVg2rXxUW9gpBz1N
         YDCqW6dIHkWsBAck0CWxWVXIGOwfpslwHLLQsc8U1zzCnFlRi6I+4elcVThRJJKbuiOE
         vfUeusGcakqSabSiwbZsUssO+hFzT2+6vmKCxlUyTYDs9SI/DBwItkj8WzZ9xgLvvCGM
         vsWka9LgkRZoHnGTPNfmAXmYboX61Uo5+6J7f1Q2PiISm/UT+ZzYb/W0z8AaIO0yzcqu
         2KGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvapD6N68flBvg2CUmVm9CxbrrMCw3xZMKgQ1l6ryj1rpPqXukB6wTB8Cjllrsru59Nr1nFZsK0AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjkGAhz3teikrHtf2c8ybFfXc4CkdPdd54bxd+riGLxeAc3P3j
	+eORMGBELaGVQ2/7Yz1QlM9gpl0GIOEpUK8g2MA9KULQhhnYZu+uMhX4lehTguM=
X-Google-Smtp-Source: AGHT+IHnjtY0UiA3/qwTD2Yq8zKTnc2HJdObiVxgkCsoMF1K8SoDYjBM4ZTa1RpLFO47Q2aZOqBasA==
X-Received: by 2002:a17:906:dc8f:b0:a99:374e:f3cb with SMTP id a640c23a62f3a-a9e3a6c8e6fmr2368863666b.46.1730881205325;
        Wed, 06 Nov 2024 00:20:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:04 -0800 (PST)
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
Subject: [PATCH 23/31] ASoC: da7213: Return directly the value of regcache_sync()
Date: Wed,  6 Nov 2024 10:18:18 +0200
Message-Id: <20241106081826.1211088-24-claudiu.beznea.uj@bp.renesas.com>
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

Return directly the value of the regcache_sync() in
da7213_runtime_resume(). In case of any failures this will inform the
runtime resume process.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 486db60bf2dd..4298ca77fa30 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2230,8 +2230,7 @@ static int __maybe_unused da7213_runtime_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 	regcache_cache_only(da7213->regmap, false);
-	regcache_sync(da7213->regmap);
-	return 0;
+	return regcache_sync(da7213->regmap);
 }
 
 static const struct dev_pm_ops da7213_pm = {
-- 
2.39.2



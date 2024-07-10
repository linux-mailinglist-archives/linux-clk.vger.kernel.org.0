Return-Path: <linux-clk+bounces-9458-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78B92D9F1
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 22:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06E4F1F23137
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 20:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F97E1953B9;
	Wed, 10 Jul 2024 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="GkTdVVPq"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE294F1E2
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720642765; cv=none; b=Mv/lMIN4s6VR8ZpIvPM6gHTO5j9lf9UnwKBLoOXzSteDjkpz2O67qZAuAq4Sx9CgQXolkTvjKLnEZ9Qpws3QHbW5HcXBMMDwn+XOGP7WJ56CGBMK8Zo/JaNQWyuWfaphng2fudR17pLfhTpXYZhdZwluvlSPBRzoemu+xfHTxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720642765; c=relaxed/simple;
	bh=OXLfCot59usikg06M9//dy2RjdT4nmd7cJlb8bgkcUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbFzMkyaNZ3uUOy77oI1mX2iWCaLuKn4cETMRetGUjFNRFKUUeqHC5u8vQPU2J9tWh9sylSe/ePRViCyKEqhG2U2r3ogJwLJ5mLO3b8wHI3ifKLDgnRAlMLrotnKbPVmt5WJ9J0bJSqKiNjIB1XVBRrF6uf+Ku0ELZkYpS1o7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=GkTdVVPq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367a23462e6so76708f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720642762; x=1721247562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeDKWgUV3TABZwMeLUKAHMPI5Gw67VPoIaG61SG92k4=;
        b=GkTdVVPq4l1oGoU71sEZbxDKQzqn/DkiD3iiMLFL/Mn9h8revHmeZdsTq8sLnuhyZS
         trl+ECqnPHDYAkPhsXlsE8kNroyiR7IqojvxRAVvv0AQWGwhRcf/KIS37ZSxAOHq7ppx
         O/gvx56TQuWCVyEZJ/nC+x4dLrIUUIfvsqOLZWQnAn4+zmsFSj+IguXSrNu1Lc9L/LE6
         vNR8AbBsJtcvr9umRadBEmEp7NFWpJtSdkJqcmH2X2T5mKi1ALWyx+2B9n69pdvNRjqf
         hWJvPnd6J0DKJy+rLd1aSlN/X+woAHnpA+vw+m8ze6SF1JhbA3JM8E2GpB7xdikPnRYu
         7Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720642762; x=1721247562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeDKWgUV3TABZwMeLUKAHMPI5Gw67VPoIaG61SG92k4=;
        b=a2NFeetRE5kLAUiMrdXuO/sIVom4yYeDsAMA0AwAhGcmWDSzgMHKV72+EInSeuFiao
         fcSl20rcQya/+gSl1TEQFha9hGuNFYuUx5fUAS/qYg8tnt5Q3iPC8NgiUGVUyJztlE+G
         FvxDA20g8EpV9Eb55j4EcwPTU6azRn1BKbYb4GiQcRQ2pN7elsfOKHnwmZh124kICk0i
         1CTfrN2x/VhWsDhya0wATq4K4lTZMtgWW/GjhJ0Mt+QawaVswStnLjEX+TpsIdEqX4Hy
         XmV44sGk4xUB0HselFKizAU7zU+dpJCMLj5uSXFvWJBpova8ZSDbXYK45vQulLUYcnKO
         ZVZw==
X-Gm-Message-State: AOJu0Yw6C1KinioFAAh55aKPv5q+o+7VD9YIerj1gC/Wm0z3VOJ/6bQK
	2lo3wB/vi9xgkO/TksuJNB6x1BqUMAbIbXxWgNv7z9LPYNt1Y3R9T1rqqxU6wrE=
X-Google-Smtp-Source: AGHT+IGV40aDIs+DCdPIzuNdtyZ6YT3z4j5MEe61ozH6tnUGN3IoCTBCb8i7S/7jgU9fPvKue1HMAg==
X-Received: by 2002:a5d:6601:0:b0:367:973c:aa75 with SMTP id ffacd0b85a97d-367cea964e1mr4090606f8f.42.1720642762137;
        Wed, 10 Jul 2024 13:19:22 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfb2327sm6077272f8f.116.2024.07.10.13.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:19:21 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	abel.vesa@linaro.org,
	dinguyen@kernel.org,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	christophe.jaillet@wanadoo.fr,
	erick.archer@gmx.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] clk: hisilicon: Remove unnecessary local variable
Date: Wed, 10 Jul 2024 22:18:45 +0200
Message-ID: <20240710201844.710365-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local u64 variable refdiv_val has the same value as the local u32
variable val and can be removed. Remove it and use val directly as the
divisor in do_div() to also remove the following Coccinelle/coccicheck
warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/clk/hisilicon/clk-hi3559a.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/clk-hi3559a.c
index c79a94f6d9d2..30d5a6ba8fa5 100644
--- a/drivers/clk/hisilicon/clk-hi3559a.c
+++ b/drivers/clk/hisilicon/clk-hi3559a.c
@@ -407,7 +407,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct hi3559av100_clk_pll *clk = to_pll_clk(hw);
-	u64 frac_val, fbdiv_val, refdiv_val;
+	u64 frac_val, fbdiv_val;
 	u32 postdiv1_val, postdiv2_val;
 	u32 val;
 	u64 tmp, rate;
@@ -435,13 +435,12 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	val = readl_relaxed(clk->ctrl_reg2);
 	val = val >> clk->refdiv_shift;
 	val &= ((1 << clk->refdiv_width) - 1);
-	refdiv_val = val;
 
 	/* rate = 24000000 * (fbdiv + frac / (1<<24) ) / refdiv  */
 	rate = 0;
 	tmp = 24000000 * fbdiv_val + (24000000 * frac_val) / (1 << 24);
 	rate += tmp;
-	do_div(rate, refdiv_val);
+	do_div(rate, val);
 	do_div(rate, postdiv1_val * postdiv2_val);
 
 	return rate;
-- 
2.45.2



Return-Path: <linux-clk+bounces-9572-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EE930A51
	for <lists+linux-clk@lfdr.de>; Sun, 14 Jul 2024 16:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F13311F213C4
	for <lists+linux-clk@lfdr.de>; Sun, 14 Jul 2024 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CA6130E4B;
	Sun, 14 Jul 2024 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hs9CEeBZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AA1BDD3
	for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720966402; cv=none; b=RVbYqi8WTxSNIgXv55eAUcMfB4EUKxPEQhbRnigXs/YFeK/q4URw+IpR/j7pHIAgN7HOiQr9KJ5Z3ir0Yl5WjyJlTMS5LTxE3MmuBLx7xN8WuciWR5TcIZMfGXHV3HfPjMSdboeWP9ePPeFnvkMaMit18XshrZf2P9PDeoReoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720966402; c=relaxed/simple;
	bh=OPE5WDRuE0r3OmEjeHcmTgXVymiouw2aegIlEsG9tOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T4LWq/FGRqkf40rtoXxhl0Kf8G5rlaOWzEfHZ76Md3IqOh4UhhGQlKkZllv/b6qLfeaH2AEO7pT6hWzGNQcV4BNnpScj9JaHz12w22rRUAwE8VZe747WKxhoNxNiTXMB3hbmYHUyhx+oZoyt0V2Xv7nq9/3apBHV7M81miqY5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hs9CEeBZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea1a69624so3579406e87.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720966398; x=1721571198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPemvKQipXI8Fajmb4L1Z0OCxTylC6aJHx822c7eIuw=;
        b=Hs9CEeBZayOfODfAnvQ1DdBp5/U6HRxV/T7kPM4QAeJdGVY2pQtUueXxSkGIz4TpC4
         j/RX4ZL2FEgLjOmRJyJbuZZ7NE9s+BY+vlv0eqr/A5ru67/AjessO5smydX9z/kliJkm
         up2LIJ6xnB+4giDOsK2yvnTk0cOT7oS/9lwZGdtTZ+yQBK2wSsjNHgVxhibzHOcdrQFj
         cToNfkx0Fe40eGN/NRweQ0nhfqtvqX1BTBb7+10uYwpBrNQ9YEV6UyJES7tkE+rwixEw
         SDm2E3t8pt9EJTivz8dlQjlg6xSo6CfbOEjTK0urOgoAVydjZVKAWedO+jxP3Du4gCLN
         xjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720966398; x=1721571198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPemvKQipXI8Fajmb4L1Z0OCxTylC6aJHx822c7eIuw=;
        b=RqhtDQg3kcOsk4bhFpLH2EAxclh4oLY2ZqmV4/jtpUgbxUZLqJGsBjU5sIzqaiEDr8
         78dPUgZ+BJET/0rEuLlRioz+/CkKpe8mtuekv6rBOwMO1WXy8M8BZw7xNLcchqaVfFDY
         TxDaSRgrLm65mR5txkMFW5b6PKXzQOe1IjE3oxD603H+3vT9sM7eIT6LrFKembSOhDhg
         cPUcOAlWsiqTWbly20bqEENRF08oHFR9mj+9cweNBhBckzwek36kQmw5j36fzkBm9nsb
         J3mcERYqVCGGHb27Y4NJ4K3uwijiCDfFMLwGt0g3XjwY3HaSj2dv8cxZqT5JkjpJmcsY
         07fA==
X-Gm-Message-State: AOJu0YzFllA2UMFXL2puRZH8LQaPpybxWQz9hWp3zpoIlD8PTpsDhDW5
	T0Vs5d+6jwb0bO+y61ba7zAyCB2ajw0HEA3XZ7qAkdpP/hNiwgzgRR901HB/kd4=
X-Google-Smtp-Source: AGHT+IGEDrDG8yo3MRE7jueSV+peLkjS+0MPg0DVEhfwYtsZaoBIL5p+ZRxyUu9Q/15yJv9uMT+brQ==
X-Received: by 2002:a05:6512:3e28:b0:52e:9b4f:cfdc with SMTP id 2adb3069b0e04-52eb9994387mr11409767e87.26.1720966398433;
        Sun, 14 Jul 2024 07:13:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f259761sm86533755e9.11.2024.07.14.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 07:13:18 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH] clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs
Date: Sun, 14 Jul 2024 17:13:15 +0300
Message-Id: <20240714141315.19480-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maximum number of PLL components on SAMA7G5 is 3 (one fractional
part and 2 dividers). Allocate the needed amount of memory for
sama7g5_plls 2d array. Previous code used to allocate 7 array entries for
each PLL. While at it, replace 3 with PLL_COMPID_MAX in the loop which
parses the sama7g5_plls 2d array.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/sama7g5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 6706d1305baa..8385badc1c70 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -51,6 +51,7 @@ enum pll_component_id {
 	PLL_COMPID_FRAC,
 	PLL_COMPID_DIV0,
 	PLL_COMPID_DIV1,
+	PLL_COMPID_MAX,
 };
 
 /*
@@ -157,7 +158,7 @@ static struct sama7g5_pll {
 	u8 t;
 	u8 eid;
 	u8 safe_div;
-} sama7g5_plls[][PLL_ID_MAX] = {
+} sama7g5_plls[][PLL_COMPID_MAX] = {
 	[PLL_ID_CPU] = {
 		[PLL_COMPID_FRAC] = {
 			.n = "cpupll_fracck",
@@ -1030,7 +1031,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	sama7g5_pmc->chws[PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
-		for (j = 0; j < 3; j++) {
+		for (j = 0; j < PLL_COMPID_MAX; j++) {
 			struct clk_hw *parent_hw;
 
 			if (!sama7g5_plls[i][j].n)
-- 
2.39.2



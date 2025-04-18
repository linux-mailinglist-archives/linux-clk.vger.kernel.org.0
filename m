Return-Path: <linux-clk+bounces-20782-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C5A938E4
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 16:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FD18E258A
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE5C1DE2C4;
	Fri, 18 Apr 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yJjm3nfG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F71D6DBF
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988053; cv=none; b=dhGTlyN7eo5IVJwS34B+MuXHb5uxUhQEndBBqGzYdTs7wzWT9nsptkAp1Q2LGA9pqNLXyODEqcB2Vsi8uvstk4O7hQEfZe28c/vRCUbqoZu9GbjMfkuF0QBH9eccuFm6tf+wQNPhKCDami9pltWhl61BfLWT8UVaxVjlC2TRz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988053; c=relaxed/simple;
	bh=pcYI/mBPHAIWHl1kcIeUbuno01L8luoMXUN7kqO9X+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtnqyMPtHXPWV15wEtM2fNgWJcdX4KDa0A4qE1YEWRamy9HE6nMIU9MOy0BXc0qXHTkjtWUXNOqO4dg6CWR+6GuD4Vq8CQKc+1OzE+7aSCu40Q3KrzpxsBcmUCPkOxPJb3ljyGYAdlle2BC+/odxCM1l4SElm7udUYj5GfYMzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yJjm3nfG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476a720e806so16510501cf.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988049; x=1745592849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=yJjm3nfGGFwCMhLTbM9QCdFKam47oKexNPthQejTVZCObvifVhqvEGpyyfOxfacI7L
         pOvtpELsUfeEjNRkJ2UuaQuCDKMKkawc2XwBRFIkfOHKcLPEOoH1QbPb4VoPDZ65c810
         m6RPritvZgWn7MkTq/odQF8MiNiYj8KUYYTAfz7LESSl6UyOWN6/caDzdnRbeUdCeyYv
         nRz6mGP8UlQfh9jmZJ6vfooeLz5apxa6gq3gcqz0YyJ4py/TBFXj8X2lw5qRb3WLGdnk
         lJA+LhM4KWWwrlo7laYz0i9EDLaBYp56twahWCKx0vIkAf82gyJHyRQpWq0NDDMLHeQo
         bKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988049; x=1745592849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=Oa64F1/QGSbRYSNP9opzMhudWrfSqX01ykrIxGieDUaaqsRe9mfzormiM0fecTwFyd
         Y/zeu1c8jHiPO2UZSd7ts/OcR5JQBSwLbh8CpXJDMnlXkzMld7OI3fkntT7svJXx9Rfa
         ZCtojIshfYTd491mJYS8OuSLEjGej2bbAqQggA/Dcnz0viNPyfnw0A9DEolqa6iLcP/3
         WbvTZQz6CWbhlnCknqs2JS/Glmd/aQoKAT7zrSlBHMoIIOeQ1mWMlj6J+AUiRDHcilXq
         FVFPZJN3K4ErCfGkZ6+XDAPz/E25d8VsWCQIgYYkbyPWdjNERHDT5bnOztBc/y0FIOjh
         iBeg==
X-Forwarded-Encrypted: i=1; AJvYcCU058CwmfHVJzo8eUmxoM2VPWTztIbmoiB5Clg0qJha2oqATHeANURN6wIvXkGhQUkTkHc94wcXlDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3u3tCqF3CxHY/TwEmXOOkdEzDc1hUo3sPST4CCvRBT6Flyq2
	wBEU0qxZjsFpNQAWZGAcw1TdYfD36McN2erE9G4J6VtOPI1JdAzYjojc9P09BM8=
X-Gm-Gg: ASbGnctk2k/lC5hGSGlXpCvS1GjDy4rng3kbRh1XBdpQ7KLY9Aiwt1quqHkf+xT17KF
	HaBqJ1kpD+judWI/z8GeJshQpGV8yR0slOajWAtNJ0CFeX9N380UynTrXZpYYEf+sPzR1S0cc18
	zqju1WWqn6jWmTdsuSBx6GhBHlB733xi0h4ilInDPnDq91P0+bchRAYDl1WTfwqOZ1f+IsVNZCX
	lLghemp7jU7JZ8GgOx0djRL1X+1V7wRJiQolGPbmM67RiU0hNvL9Ig3xn8SJ3+Pqmk9jEd6A6SS
	w2QM0qKPx2oRqqSD7SuWXSRqIpPuUFSh4rnwVkLEpfaxer5XuLDbqi2L12kb6wLGlRRdnGPHLfC
	hD5YU38hxj2umVA==
X-Google-Smtp-Source: AGHT+IHEqzlEJZsM9ibzpxY3pVimq3gvrY9lGtxVp45evTuL1ehJDJBIbt283Y62JHB4YPt3Xe3sXw==
X-Received: by 2002:a05:622a:1987:b0:472:133f:93ae with SMTP id d75a77b69052e-47aec4cf703mr39891641cf.48.1744988049055;
        Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Fri, 18 Apr 2025 09:53:54 -0500
Message-ID: <20250418145401.2603648-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..a7712d1681a11 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2



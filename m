Return-Path: <linux-clk+bounces-17946-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E500A32EBA
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 19:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30CC71610F9
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 18:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522C5256C6A;
	Wed, 12 Feb 2025 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="az8W7Jtv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474521129C
	for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739385180; cv=none; b=kMX2oKpn3Uah6bbw+Y8qXe4nRps1S0reGkiBVwkACiVVi04CGDUyqM0E6jGp2gI63DU1m2k+oCEMYOwHxfbMxdsX/K0SCDv8rQclFl8SOuI6m0npTVtYZTQ39uwcXkMBzcPQhqygGoUVjDli16EUcT3zDMqz4MO7hEsKkAbPYXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739385180; c=relaxed/simple;
	bh=DScHAAMLHvU4xu4O0WcfNhf84lXVnZDNRB2q3PdUj1M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qE5/LqYKLCIgL/VToO3K4//YgyYsskZrMt1Fgh5KfDJ9yftkUYemQiV/HMEwDHWbzg0A8cPaHVlmLt8p2J9FN/tUzFS9BF5IjHAbvj+aXgxzHmaN70438zmE4LqS//o5D56tOy7F6KOcynM47jFBd0KHw5HTG0gHynCmT2C3z/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=az8W7Jtv; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-220cad2206eso7880065ad.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 10:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739385178; x=1739989978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYmiCJ+R7Juy7BxO4gHWUFDYWab8Kg8RAmIlcH74Szk=;
        b=az8W7Jtv/DJtnL1epuGG+ZQiIdarzAKDUm/H/k6smcA0DM/eJikQFF8dKqXotbugUx
         p1VJyL0xYJgB460ioVaLlJfLER9wnHM7rTkBeBASXm5XQRLSF0ygGnTLp6ZxcYkz6VrH
         dNaHwLjUmEliH9e01MGo4bh2x/T++GDUX5v1SFJUr/lU8cCQi/p87S8gXStATBw8XV6K
         m3SgdgBQhuG3/MThSZgNLmo8ejN6sOimSBG6dgY61PejtzWjeGkUq/wZ2tUwDmn/4UK0
         M+Ag6jjyltrn+34xhMgHirHOK8yJxtRMMdhxkzhaB5pFkGI42EQ07TnOtrnEb3+VUF52
         dOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739385178; x=1739989978;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYmiCJ+R7Juy7BxO4gHWUFDYWab8Kg8RAmIlcH74Szk=;
        b=uTkpwyHdhYRt/cuL+P7MmmLILS5z/DR38zln1AnKgVY7CTz2L6/Gn+7sTiDogpOwV7
         kXDAr9LJ3K4XAqezFBvm9HqNV9UoaAiIcnJgx7IPnWmZYhOZpptTyBw3ZkGgkTvH2WMz
         zexBhFf+G+d61WfQ2xgIkaQP7VQ9ovkAlBo+SlljuuLtvzOfyNI0OYeiKFvk0+76LcMG
         Zu2HAAEGDx8fLkCqJVrxd4/6CCUxhWJAboXm+0hpqTArFll57cv0VQRWob/PJ60cOlj/
         Jc0LztIXwMY9hNuibc3g0qu1I0fZbKmukxYHa2b8BhM0mXJv2WZv9fOKp1YBlLuV5pLW
         lmfA==
X-Forwarded-Encrypted: i=1; AJvYcCWrBk29cO7BJ4QxiSxj9c3G7a6Yl/y6jDdUSxpTkugM6Evi+w3T4IQfkK4LtpnMO1f4+o8yEWDpZUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyes6S+CAepc+z3yUElegARVcaXjxKiZGKJAQ8TIP444oP7ykzw
	pZwQYadLqWD8IXhST36/CrMk5WcIUity2lojclLJ1jR1pr2LJgieEKq7tKH6BYijlJ65QZ4fSW8
	m5qE/NojX6eFOK8uEocu9te9EKA==
X-Google-Smtp-Source: AGHT+IECDfJK531HNRGV3syvC/DgBgcGWiTf33LlelsMxeULH9/uMoeKotioRlyy2DZQ3lTimCD19P4P0Lz7bGElf8A=
X-Received: from plbmn14.prod.google.com ([2002:a17:903:a4e:b0:21f:44cd:af62])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef52:b0:220:cd9f:a186 with SMTP id d9443c01a7336-220d1afdd64mr7208785ad.0.1739385178165;
 Wed, 12 Feb 2025 10:32:58 -0800 (PST)
Date: Wed, 12 Feb 2025 10:32:52 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250212183253.509771-1-willmcvicker@google.com>
Subject: [PATCH] clk: samsung: Fix UBSAN panic in samsung_clk_init()
From: Will McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Stephen Kitt <steve@sk2.org>, 
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With UBSAN_ARRAY_BOUNDS=y, I'm hitting the below panic due to
dereferencing `ctx->clk_data.hws` before setting
`ctx->clk_data.num = nr_clks`. Move that up to fix the crash.

  UBSAN: array index out of bounds: 00000000f2005512 [#1] PREEMPT SMP
  <snip>
  Call trace:
   samsung_clk_init+0x110/0x124 (P)
   samsung_clk_init+0x48/0x124 (L)
   samsung_cmu_register_one+0x3c/0xa0
   exynos_arm64_register_cmu+0x54/0x64
   __gs101_cmu_top_of_clk_init_declare+0x28/0x60
   ...

Fixes: e620a1e061c4 ("drivers/clk: convert VL struct to struct_size")
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 283c523763e6..8d440cf56bd4 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -74,12 +74,12 @@ struct samsung_clk_provider * __init samsung_clk_init(struct device *dev,
 	if (!ctx)
 		panic("could not allocate clock provider context.\n");
 
+	ctx->clk_data.num = nr_clks;
 	for (i = 0; i < nr_clks; ++i)
 		ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
 
 	ctx->dev = dev;
 	ctx->reg_base = base;
-	ctx->clk_data.num = nr_clks;
 	spin_lock_init(&ctx->lock);
 
 	return ctx;

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.502.g6dc24dfdaf-goog



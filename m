Return-Path: <linux-clk+bounces-24111-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189BAF8424
	for <lists+linux-clk@lfdr.de>; Fri,  4 Jul 2025 01:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68479561B8C
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jul 2025 23:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA9D2E06C9;
	Thu,  3 Jul 2025 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1zsdK0Y"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC12A2DCC03
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585006; cv=none; b=q1I5GyxN6hTi2zA09BhqpVWINh5g1XOcHrI1iJ+zlG2ogNGMjsmsrhqS3QJ0uVgq5h5Y35Q2b/RIf0mP4CRIeCckcIQ5BJ3yiGTB8xzMk6v25a5pBStUl4qLqN8EoeEdAaQDIxzF9RrPxLIDaCVtCmcGxdbqRRlSaxqdwlvzW38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585006; c=relaxed/simple;
	bh=yI2SIQSpfv11yROCqsNTigI0LZL/+DeyReURO7gHFTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLy+pII2hXFmVOeqnM8Zz7cweogchKpX92bBuE9DwvHuSOmZlPh+9PGjzUD85vxmlyl09ttWYNxk9zfIpQJQr9JrxssMnz1OYSAr0772Wnz4I/6RPJgKqDjKm1zRspjO6UgEhG08cEIaPA2g7n9420Bq8x9pht4PA4xJitT7T3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1zsdK0Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
	b=g1zsdK0Y55cOQ2n7XSXEaoF/PDt86dE2UsMnWqGMNtJnsjhSJlUzG0V5P08wgENaNV8boC
	AVpes8tZ09YB6hgzdfezIS7M8lLDpCnXB+RHt0qxrUsjCgzneMoVKWxmvrnY035DinEtGm
	y5THOP1/txieB14WlaGs68uhsnHTcKA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-h6Vmua_JNJu-Hpg3yVnr9g-1; Thu, 03 Jul 2025 19:23:22 -0400
X-MC-Unique: h6Vmua_JNJu-Hpg3yVnr9g-1
X-Mimecast-MFC-AGG-ID: h6Vmua_JNJu-Hpg3yVnr9g_1751585002
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so4274306d6.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585002; x=1752189802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
        b=GptbIEfbl7h1JjUb1945d5x02n+wZkg8+FlkE5p6xWey6Mtne4Q58NC/KfUtsIVccP
         AkjPPg5EK+bdMuimdF5jJSqI1AXh03+nQyWCjZF2BCu4Qg3Y++b4V/rXVhE+km0jBFCi
         JjhGXM3kijpmY/RNSHL6QDQzpfrZ3yw/kVwHe6ksKOAO0H5b4uIigPDgJW0/rATdiEKA
         eV4iLeZvFc+VeH2dZpG17F9gMwkO0YuZLMwmRIwI9ff9Wn8fiLWbfY5vuUjy8bgXzQ42
         UdhkWR1g4mGoG+9Y05GlXtQvQkSXuvd/k3epebMiyt0AnLeqOrqhD3Dqae0/jaOi4j3R
         HoMg==
X-Gm-Message-State: AOJu0YzXCjise6Tm5vaaY9dgWMUuF7j2RsMV6DZJx6JfwcI8oMX5woiT
	VOgqyuYyegCVVAPsjuR6KnUifaqNRyLTKrVVj5T9efTEPbK1Wt/G5b+yMfR9ZXA+VLmZ1LvVsLw
	t7q5sI7iMdXzDizZslq+DXb9JzXiYflRaGVxXIuICc+A3KJ7VD74ZBlhRfvh8LA==
X-Gm-Gg: ASbGnctBcls48ok1pDkIzi1hyLzNwbkYzps76kpx+6XNRkhuOHUabaJb/6/Hy7YcPwA
	8ceD7hqN2jq9Gw3ZdtYar763tmMmlYLXqG60q4U2wBNJFx+6XbA0BnpVp7t4qT0coCiLhgSHezW
	2xK4jRzai/DVdsPxp/2w1qK0TSHHFJp3TnhGmyyAAACTcfdNuGP3RDPT9kSXn80JGF/HP2wzzfI
	5N10xg3QPyJ3BNeUbaWPU3rYoXpYxIATyVv4zgQuZY3D6OjoELLAKMV/P5GphgbHVubUQcPs9k0
	XfjjjA2ORZBErX4KL4ekCkirNr0EhLRMg6kgFgQRk8yhwYvDzxW+ik7DOZ9sVw==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912686d6.10.1751585002079;
        Thu, 03 Jul 2025 16:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz3rcs3pEbfi+i10yC2fv924P24DnAprgiwcA1Xos8lcGEnsQWq4OIG7/Hd2meAunlCE03sA==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912326d6.10.1751585001708;
        Thu, 03 Jul 2025 16:23:21 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:31 -0400
Subject: [PATCH 07/10] clk: sunxi-ng: ccu_gate: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1958;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=yI2SIQSpfv11yROCqsNTigI0LZL/+DeyReURO7gHFTk=;
 b=FBh/28zlwskIaAbPO2b+tu7E0IGz0egaTdlYzpasdj3/eWmqI5c+jiwwjhb0UWS08yNR6Uiei
 jR4ac0pocwYBwf2SDC9OhHItWpS1RcSUFKjbL5CgqDeWzQZ8d1jP7ws
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_gate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index 474a9e8831f87ffcec7712c14ecb55b8523f05a6..30673fe4e3c2cd2c86f94a21929b144ba4cf01fe 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -91,8 +91,8 @@ static unsigned long ccu_gate_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int ccu_gate_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_gate *cg = hw_to_ccu_gate(hw);
 	int div = 1;
@@ -101,14 +101,16 @@ static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = cg->common.prediv;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent = rate;
+		unsigned long best_parent = req->rate;
 
 		if (cg->common.features & CCU_FEATURE_ALL_PREDIV)
 			best_parent *= div;
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int ccu_gate_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +129,7 @@ const struct clk_ops ccu_gate_ops = {
 	.disable	= ccu_gate_disable,
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
-	.round_rate	= ccu_gate_round_rate,
+	.determine_rate = ccu_gate_determine_rate,
 	.set_rate	= ccu_gate_set_rate,
 	.recalc_rate	= ccu_gate_recalc_rate,
 };

-- 
2.50.0



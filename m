Return-Path: <linux-clk+bounces-2279-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BEC828577
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 12:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3401C23A52
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 11:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F241E381D9;
	Tue,  9 Jan 2024 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLGg2FIW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF03C374EB
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d88fff7faso29900245e9.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jan 2024 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704800953; x=1705405753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vxZPYMLwuWJ+eepzh5PLOjCCW10GHjaMLnopFe+mnk=;
        b=qLGg2FIWNFJTO5duNtKFA/I8DDtipQG6/nqKK6zscYp09jWjiVC00IFBzxw+9WRm76
         WtWQeV2k4jg8HBysaF56THI+rHgCuvFfiIybs4AliIeVPoKy3rXfC7KT6eZ8yUaa50HK
         QV6qMYPgRni6XXvP1ETIzcLJbcnnI54B8f2mQg9l4dMGUgMn5m2KdeLineA4NJ9QfjdV
         uoGHHQVPW+dAsMyrMlRjGvJVuVIuombswGIMlKa4MoYetRV5RWcNJKvhzZF82zizgTsI
         TaOrVrJv5R90amXiv7iRUZFq1LpE2XqBkBYXnv7ataQ1mSOCp7yjXOhWr9HarZexme9p
         uULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800953; x=1705405753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vxZPYMLwuWJ+eepzh5PLOjCCW10GHjaMLnopFe+mnk=;
        b=EB6pbTSNjXWZmwE8hhLC+MPUlOgPCP+p1HvUw1WN0oRgMMi9dQfZi3mQBikrEYYAe2
         qR5BOmzccQJy1RNI7PhfnN+Dfho9E3Q3L3ihxaCPrqbd+V8EGh/f7ZVBKILIqh9FxD2R
         t7t5kXcRVcUl09Z4ZzrmSEyy/29TaGMp6cR1xy2wLXLSy0CCacEIpwrqsWI/Yy4JsH/p
         9mMRaxUrVJE6BseKEnJQNTGOFZK/3hksC6LeJ/CQyHzfJFEaIJKlpI49zOmc+6pNNsG8
         ThEhNGFwRdKD+UNJWOig9F6Zo8bnTFrY40GgAdKrPMA59LELiog8bFsyvRby6P25yxVj
         GWng==
X-Gm-Message-State: AOJu0YyF49YJ1BGzza/k9j7ypYC8Y31eRcKXmkNogbFjduKyJAYrWcDC
	GfktV3yWzj0xTStSpfkNTkzCizN5Wu67Kg==
X-Google-Smtp-Source: AGHT+IG1DOBapLm3Ix9ZZOZXmRqJWhnU66aeD96cCxaEOIOxQjR2abCWNOUTUmzYv57H2br2SAfcqA==
X-Received: by 2002:a05:600c:3b89:b0:40e:3a41:5f31 with SMTP id n9-20020a05600c3b8900b0040e3a415f31mr1412996wms.190.1704800953330;
        Tue, 09 Jan 2024 03:49:13 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b0040d62f89381sm3335699wmb.35.2024.01.09.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:49:12 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	peter.griffin@linaro.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names
Date: Tue,  9 Jan 2024 11:49:08 +0000
Message-ID: <20240109114908.3623645-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmu_misc clock-names were renamed to just "bus" and "sss" because
naming is local to the module, so cmu_misc is implied. As the bindings
and the device tree have not made a release yet, comply with the
renamed clocks.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 0964bb11657f..782993951fff 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2475,7 +2475,7 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
-	.clk_name		= "dout_cmu_misc_bus",
+	.clk_name		= "bus",
 };
 
 /* ---- platform_driver ----------------------------------------------------- */
-- 
2.43.0.472.g3155946c3a-goog



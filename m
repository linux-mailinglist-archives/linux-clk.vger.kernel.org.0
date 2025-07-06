Return-Path: <linux-clk+bounces-23996-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C76AF5D11
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 17:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F50B487F92
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 15:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EA72E7BC9;
	Wed,  2 Jul 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KJFWatgH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367102D7805
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470054; cv=none; b=X6cbwMVPkxH5cx15z+oi2PbriVXu81OPeuieYnaB/QFWufLDRJzEdlqJsEtVO37z2UZPVLNG2gDd4/Qcl8l6JY2XCOaG3meEsKR9SpGh5VEgPi8oygdOr/B15qlhDubPMK8ee77NQbigHEmdm0PaMLqTmVC67poyDYPMUCBpyQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470054; c=relaxed/simple;
	bh=GoRUGsUnjViszPLATa2jyFADH3UQuWxdu+h4Qd6gJsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hR3+hGQmThtQSCK6ICDbi8vpCL7GbEdiY1RmPO36DNqNNkDZsBvgv/faik+3eOVCcJ8MOC+8lbfnQl1vFOGmKoJqNGUt1X9NXxteXVjNxIqje3H1PvgKjeVrengMLO2LjJqcFqI3VwrlUtJpL1aVHVhXGfJ0s7bOebdzqrneTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KJFWatgH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ce671a08so30708115e9.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470048; x=1752074848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/rEMnGeD4qvZyBGNuDDr/e/nsVy27ZDZfCTdz4n+TQ=;
        b=KJFWatgHzoNdFsrbUztWqX05A1il5wChVzJTS8bsO4w1BjlHgv2UXI4OFtDKlyE3Bn
         0JwVaSjTEDIyqVG5SylY7tlohGiu6F0D/hhBqwAMgjUyl9lKuKbbE/VfeGFibvbiKu+J
         bqAqrLxWDBo2wRqq9H4qZkxeUl3jf476JZ+Wprjd83W3SOjpGmScRUHE02iiThe8hcW3
         xLadPqWi4EX357MGxZpIrtNk0Nz3Uw3H+oEm8p1EM7BQkU0nwQgRGnidhv71e2cOMoCE
         fLt8Zfiu1VVYC+kezNBvguG3CQfeBYaAcqIXzHnBkhTawpgzu803orFgS1WDg9ajjxC6
         qJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470048; x=1752074848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/rEMnGeD4qvZyBGNuDDr/e/nsVy27ZDZfCTdz4n+TQ=;
        b=HbmsvEhe7yuCewRiXvk5pSe1/3OZI8MgS+OXKc09KYvHDDyMqoyU+v2g4Zg+UsUkNQ
         ICi62z1P9CGH25lhe1Twr0El6wyUJlM/kJmbfvqUIglVXmMPtR39XF9K2idz1X+aYVwB
         YGcD6udnfTJq1RWGEBA+X9tD6fTc9dlES4+hUszm1YXVu8U0yVbO6turfXjiwjhwzBvQ
         j5vnMFZHQV7Y7jgrnkXpHM1OmrSnwQNojCacMgmo20zGmb989PUHrbf9dC1kBE55d0Br
         ZedEDLdRHhNnOUyMSSelUkI3msHU/3FUMQMpRXIYYnuRRy+sRk1SS3IIeiQv3NtQ4XAP
         dM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+w71rfsBWbKwIojZcays321zigzRJoFPiR0s+y+fva2PyThiiTzlRa8DVUpjYIBFlgtbybutRd/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8uNcqLryJZ/G0LRqEnauIwpo9bPV+ia9cdyLPqFX7UHV2NUw
	5IFI6f86o8CeKcGkkS/7zssTUgVBJsbpDfMVdYlIGMZLqoAtdEiIGYxX3WWqiE6su1U=
X-Gm-Gg: ASbGncsQbxM8cX9bj3rryDAlabDNcWQ9E4qB9OpVRrl5Qvo5iwBP56mrddweo+8WoM3
	L+K4ndtB0Eun0IeX7Ugs/yFS7hND68B660UD98FN2tBVasu/ppJ8+9cYWmP60uB2a4/VQBW59L9
	LJaW7INWCDMWil/YuxWCVaH2HEhjTquiQc2t5xA+Ee1hIqEn3kZ51zxYLeJZ9yKq6RzmdIF/IFm
	M+3oeTk8so21EDYcv0s3ETIqWtiRC/IyRDuhwxAGFJMY/Qo4Y8ASfuPXoZidXjGR9F/DvgEMLET
	8zxBwDHnl0hXZSPledOKvvbn9gaD57/3/wGlFswTbHVo62n/rQ6IUaxeCIdUkBbRTaowbUYXMiA
	Z
X-Google-Smtp-Source: AGHT+IHahoxmKnDB02LYfoZM5uHtVJlqRyi8ul0wrW+Qb+0qZK32tlqLlnVRa8VTgImck9/poeHQlg==
X-Received: by 2002:a05:600c:4e90:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454a373b017mr35366795e9.33.1751470048195;
        Wed, 02 Jul 2025 08:27:28 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:12 +0200
Subject: [PATCH 14/26] clk: amlogic: meson8-ddr: naming consistency
 alignment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-14-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=GoRUGsUnjViszPLATa2jyFADH3UQuWxdu+h4Qd6gJsw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/DPxkoHZIJ97lDN9ytfXkN1hQtyq0tH90Ab
 EBAvpbwlL6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwwAKCRDm/A8cN/La
 hQmxD/45yEiAXoag5hm097lT1KWnHb/uEVW0SgXHcEbpGveuEqrnsPx7DgMWESiWGwtINokytBJ
 RUvOsuMELTM8XbSiYKbspLcj0MSah1NyPrl+e8F9nvwEMmIgfXFsk8fkGJpvLpnwuq7zYIZpsDx
 Frm7J5ZkCN0Tq1aPuMvPcEQAKG7b1Oc+L/MhXR6Gat/RY/rnmFywkvshMBHFNp/A9d8iKQAe2TS
 ZRTuErqcQxBIShHvjeQTJC0jquA8RuvwcMj3Ozq6n8OuphQrXBvSTzp9BNnfR0lu6KyrvkbGtOx
 f6EW56HQ0mscED3PdVyTrJOuihA/qUfGi9pnL92d8iKmE2WKeYGue2AibpCQzt9mvJT4Ic0UrVB
 tlW2OcG8/gshyciD5gOrsEQ1XqZfij1tn4XMcZyTOmqt0vweD/eqdJnp+faLPFSYG/Y+9UtGLSB
 /g8BzAtZr1SRfKIMp4eO+qk1iT4LRgyHmxWbnvnYbpbwDNQ25tHW9jPamX0NtQS4CZUaQidYs6b
 7r/839QzdtFV+iasInyGTKRt6g08z0mqxxd+yCu/3gT0v7eLCBzyfeIDqkp+HhK0jjFv9dTWz7T
 a0Gd/C3BxqceA01Uc4O2770E4SLjmZhvci2CSnO17G01/SggnjOcRxuwMLBPSsvZ50UA2ejhT4W
 K0FmExSB5zCEZSA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8-ddr.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
index 1975fc3987e2cb28823ffd69a5e2aa7b33f4853e..6a9efde9b570d8a2609c118d7d38334a3b4a5dcc 100644
--- a/drivers/clk/meson/meson8-ddr.c
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -12,6 +12,7 @@
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
+#include "meson-clkc-utils.h"
 
 #define AM_DDR_PLL_CNTL			0x00
 #define AM_DDR_PLL_CNTL1		0x04
@@ -77,15 +78,17 @@ static struct clk_regmap meson8_ddr_pll = {
 	},
 };
 
-static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
-	.hws = {
-		[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
-		[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
-	},
-	.num = 2,
+static struct clk_hw *meson8_ddr_hw_clks[] = {
+	[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
+	[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
+};
+
+static struct meson_clk_hw_data meson8_ddr_clks = {
+	.hws = meson8_ddr_hw_clks,
+	.num = ARRAY_SIZE(meson8_ddr_hw_clks),
 };
 
-static const struct regmap_config meson8_ddr_clkc_regmap_config = {
+static const struct regmap_config meson8_ddr_regmap_cfg = {
 	.reg_bits = 8,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -104,13 +107,13 @@ static int meson8_ddr_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	regmap = devm_regmap_init_mmio(&pdev->dev, base,
-				       &meson8_ddr_clkc_regmap_config);
+				       &meson8_ddr_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
 	/* Register all clks */
-	for (i = 0; i < meson8_ddr_clk_hw_onecell_data.num; i++) {
-		hw = meson8_ddr_clk_hw_onecell_data.hws[i];
+	for (i = 0; i < meson8_ddr_clks.num; i++) {
+		hw = meson8_ddr_clks.hws[i];
 
 		ret = devm_clk_hw_register(&pdev->dev, hw);
 		if (ret) {
@@ -119,8 +122,8 @@ static int meson8_ddr_clkc_probe(struct platform_device *pdev)
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					   &meson8_ddr_clk_hw_onecell_data);
+	return devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
+					   &meson8_ddr_clks);
 }
 
 static const struct of_device_id meson8_ddr_clkc_match_table[] = {

-- 
2.47.2



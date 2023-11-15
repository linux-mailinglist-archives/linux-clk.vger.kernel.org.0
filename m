Return-Path: <linux-clk+bounces-177-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585A7EA5F8
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 23:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0A1BB20926
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 22:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83643C060;
	Mon, 13 Nov 2023 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZjWZs81l";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DleaP8z/"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E730FA9;
	Mon, 13 Nov 2023 22:20:22 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06F2D57;
	Mon, 13 Nov 2023 14:20:18 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4STkQ92LxWz9smv;
	Mon, 13 Nov 2023 23:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcMuJA8F8tu8bD8DWsZ8RKrQ4aWARHioWYcOLvOY+eA=;
	b=ZjWZs81l3G4qEVP1AS9eWj01WzOM9ASpMJahr338o9rdqWuhnT0OuPaneELVx0VF03/gG2
	ZjbEpkLDTob3/bmJOpiyKUu6flumVKVJ9I+I/GhInfa2014ckKhkmskNDrwUj8hQ9LNwuO
	k+xZ5F17RgQ6wjxepDeDA3o85Pi+BMPtIE7x5jm9wW2NPsqWW/bN12Tp7ttY7KeE1qX20a
	3s1jegn+0wSfvN+ldeV143tghpPL+2bIJifLhwT0RYHFuAQISDAmGTKtNLJnm3qmmkGm/P
	uTt8ImItaobksRu4fYzo6a0260nndj6v/7HbIUKsXuw1AovfxD3WmfSR7MA9VQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcMuJA8F8tu8bD8DWsZ8RKrQ4aWARHioWYcOLvOY+eA=;
	b=DleaP8z/xbTgC5kuFn1hsYqOs3yyLC0uS1ZMjCdJ7Z2gL6TTICyVALUGNttxD32mPGnEf0
	C3W66PRJ1yfSu6rOnqtAZFDB6untImQGz5ILG7XMiK+hQuooXfF3BeHXYU4oe2O6iuNuUx
	UDsv9Qgh3tl5JRZIz+mjkOyb81pdg+dL3QWLwwTN7gd/9LKyVcLFOTsLlF6UlB6SA7Bkcc
	NHoDUOGiI8I8aKpdb3ZLEMFgK9REgJZB1e7IbqLQ7eTiYnN/1STyRQmCYtvqsTYhe7Ioty
	7pQmAeWcWhnpj9cvqBEij+JbyfnnlsIEq0LKDGj4pNnPeqseyc/L8pkqNQGWuw==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/4] clk: rs9: Add support for 9FGV0841
Date: Mon, 13 Nov 2023 23:18:54 +0100
Message-ID: <20231113221949.111964-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
References: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8045b967857f787219b
X-MBO-RS-META: 4p3edruhxtgqnhnk5g96usirfzcijczb
X-Rspamd-Queue-Id: 4STkQ92LxWz9smv

This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
except this chip has 8 outputs.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Update on top of 2/4 and 3/4
V3: - Update on top of 3/4
    - Add RB from Biju
---
 drivers/clk/clk-renesas-pcie.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index e86c2911ceb4..53e21ac302e6 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -7,6 +7,7 @@
  * Currently supported:
  *   - 9FGV0241
  *   - 9FGV0441
+ *   - 9FGV0841
  *
  * Copyright (C) 2022 Marek Vasut <marex@denx.de>
  */
@@ -385,9 +386,16 @@ static const struct rs9_chip_info renesas_9fgv0441_info = {
 	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
 };
 
+static const struct rs9_chip_info renesas_9fgv0841_info = {
+	.num_clks	= 8,
+	.outshift	= 0,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x08,
+};
+
 static const struct i2c_device_id rs9_id[] = {
 	{ "9fgv0241", .driver_data = (kernel_ulong_t)&renesas_9fgv0241_info },
 	{ "9fgv0441", .driver_data = (kernel_ulong_t)&renesas_9fgv0441_info },
+	{ "9fgv0841", .driver_data = (kernel_ulong_t)&renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs9_id);
@@ -395,6 +403,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);
 static const struct of_device_id clk_rs9_of_match[] = {
 	{ .compatible = "renesas,9fgv0241", .data = &renesas_9fgv0241_info },
 	{ .compatible = "renesas,9fgv0441", .data = &renesas_9fgv0441_info },
+	{ .compatible = "renesas,9fgv0841", .data = &renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
-- 
2.42.0



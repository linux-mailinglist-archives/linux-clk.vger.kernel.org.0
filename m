Return-Path: <linux-clk+bounces-142-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055297E8B7E
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 17:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9AC280EFA
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B06F18AFA;
	Sat, 11 Nov 2023 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uO0JlitU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gW2rU8Bf"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ECB1864C;
	Sat, 11 Nov 2023 16:08:33 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEC33A81;
	Sat, 11 Nov 2023 08:08:31 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SSLG56ysjz9ssZ;
	Sat, 11 Nov 2023 17:08:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YDiSCEhtqmiRnxCY7iMO5iFXIi0t3xSAQ0Qcz9bM4I=;
	b=uO0JlitUFM5QUGSSqfhaTiSxLl5owztG5rjVpxLQ9C+lEDlueQV0FXBZVZZBCt7HZxJVzW
	k+n/A7k+AcEu2K3PL69KpjfXB6/TrVRSyqVLRHU7A94Edx2puAFv22uRZQmmsV/LNHI1TT
	5+ZcwJcuu/HO7BfjOaAqJMA6Zdl2CSc9AKWYAG8cVgoxNzHTdnq3wjEXPqx0YT9Gh0Ag4M
	0j86K2oJGrA0IXP8DH2FBmvhgDbBxv1ICYmi7Vy+MToT1ZAvdaQTXasl4gscopD1oNdHNw
	Y1W+ZenCY/sAIyj41QzyOP2LGH8O+ZzgaMpVeKmH0G5GuJ5rIaeALlp0q8w1lQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YDiSCEhtqmiRnxCY7iMO5iFXIi0t3xSAQ0Qcz9bM4I=;
	b=gW2rU8BfGtnQ0ukxNTh7mtYyi7LDVWIrw2VovSVwwRHVw2VTPh8I/igvY5YSU8GX2kyduQ
	R1c52ZwItwdQ4ui7EcbKxgJ/6UD/ygB/qg2jIMH+0A+6YEh4JjGOeSgx6r3BiU5wTcsrBR
	0nDEkxzAYYSVCZyq0iX13pjG78zgYUU2ptkpf79g3pcjOe6MZEA8EkHKFMvL8RiV+98Vlg
	9C4Uli1W1BYG0eroCMhx0LdLUFGT/mM+PRcys0YMlUlQgUgTruTGpT3BtCqCgA2TtuvOUf
	hXvfNi+Yd7znMrb1LmMFJDwtclQUK9Om/6Rg9WEv1bPBPe6iuGpl+kMYzptt/g==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0841
Date: Sat, 11 Nov 2023 17:07:02 +0100
Message-ID: <20231111160806.32954-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f3e480226b32c0e919c
X-MBO-RS-META: as1prqd7ng9anjk5s3b79rqy47ytnysn
X-Rspamd-Queue-Id: 4SSLG56ysjz9ssZ

This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
except this chip has 8 outputs.

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
---
 drivers/clk/clk-renesas-pcie.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 5064016afbc3..6d494e5f8fa7 100644
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
@@ -54,6 +55,7 @@
 enum rs9_model {
 	RENESAS_9FGV0241,
 	RENESAS_9FGV0441,
+	RENESAS_9FGV0841,
 };
 
 /* Structure to describe features of a particular 9-series model */
@@ -391,9 +393,16 @@ static const struct rs9_chip_info renesas_9fgv0441_info = {
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
@@ -401,6 +410,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);
 static const struct of_device_id clk_rs9_of_match[] = {
 	{ .compatible = "renesas,9fgv0241", .data = &renesas_9fgv0241_info },
 	{ .compatible = "renesas,9fgv0441", .data = &renesas_9fgv0441_info },
+	{ .compatible = "renesas,9fgv0841", .data = &renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
-- 
2.42.0



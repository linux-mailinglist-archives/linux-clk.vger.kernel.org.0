Return-Path: <linux-clk+bounces-176-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58D7EA5F5
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 23:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89BBDB209FC
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 22:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A4D3B798;
	Mon, 13 Nov 2023 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qamiiVZ3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T6Banqz+"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F52E62F;
	Mon, 13 Nov 2023 22:20:21 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D80D51;
	Mon, 13 Nov 2023 14:20:17 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4STkQ7368bz9sQm;
	Mon, 13 Nov 2023 23:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDJd7CBpDDwtdZoLDWV057mrZmwfQaR3lxbfo4GP/AA=;
	b=qamiiVZ3Emyi6Zud41Z6QP5rcHZHbp1lNF7V+paw233iyYKaJAe+Jsi6Rp1QIfRm2cazBq
	QufTlgOrXuL/OC7s06auRckjawb31Cai45tpQJ2frdAeknhg3izONN3GZUawhMCcfhT+FI
	kEK0h2QfeRAXSwa3bvfA6P+eUber5ghN3LvRCQdv7qPNUHjXs8jQiGKCOVZKkyqmBh6aO4
	LnZH1997KfcFMv8b5QBr1+LH9C5XWnVkG2Gl9mD5AuoldSlQJ4fzWY1YGzPmG/UD/RKbmB
	zrK5km1xflPhUnMMF7YBUiUCS7TqVIpLCCT4AStghSMm2gC8hzwyV5w7SnU84g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDJd7CBpDDwtdZoLDWV057mrZmwfQaR3lxbfo4GP/AA=;
	b=T6Banqz+lSL74bxilbK/ICy073LeuqT3XeAeqDOtt/SRxBYJTFfPUXzWhBi00BWeO5FG0E
	NJcXEUkfLow93cHpQh9F/Ntp5pqFJY43fjzOIjbJenoSbiYXuSohd0RUmJohjwGz4pYYTu
	TFpe8xYIgePdv1fe9Kr75UtwkNtQbSU2868JofP3/ZRO5d1A80hcqpUVmFPeuBSI3MoEzW
	4cIPkbHl9IbS8rEpdhhBdPv3A12sD0P1auG/C5E1atI9vW7Rd9U01jTAQL2MRh/9Fj42Bo
	64nuhytMKr+zQcSO1MFE3Nh8lMM7jTazv/JO6xygcHigAc/dbN9H4UwM2APwzg==
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
Subject: [PATCH v3 3/4] clk: rs9: Replace model check with bitshift from chip data
Date: Mon, 13 Nov 2023 23:18:53 +0100
Message-ID: <20231113221949.111964-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
References: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: uyrr57fjswkdbg7gogkhzmk7usibycnq
X-MBO-RS-ID: a62cc8900b33ada1d05
X-Rspamd-Queue-Id: 4STkQ7368bz9sQm

Adjust rs9_calc_dif() to special-case the 9FGV0241 where DIFx bits
start at 1, encode this shift into chip data and drop the model
check entirely.

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
V2: New patch
V3: Drop enum rs9_model
---
 drivers/clk/clk-renesas-pcie.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index b5c430e4899c..e86c2911ceb4 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -50,16 +50,10 @@
 #define RS9_REG_DID_TYPE_DMV			(0x2 << RS9_REG_DID_TYPE_SHIFT)
 #define RS9_REG_DID_TYPE_SHIFT			0x6
 
-/* Supported Renesas 9-series models. */
-enum rs9_model {
-	RENESAS_9FGV0241,
-	RENESAS_9FGV0441,
-};
-
 /* Structure to describe features of a particular 9-series model */
 struct rs9_chip_info {
-	const enum rs9_model	model;
 	unsigned int		num_clks;
+	u8			outshift;
 	u8			did;
 };
 
@@ -161,14 +155,12 @@ static const struct regmap_config rs9_regmap_config = {
 
 static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 {
-	enum rs9_model model = rs9->chip_info->model;
-
-	if (model == RENESAS_9FGV0241)
-		return BIT(idx + 1);
-	else if (model == RENESAS_9FGV0441)
-		return BIT(idx);
-
-	return 0;
+	/*
+	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
+	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
+	 * Increment the index in the 9FGV0241 special case here.
+	 */
+	return BIT(idx + rs9->chip_info->outshift);
 }
 
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
@@ -382,14 +374,14 @@ static int __maybe_unused rs9_resume(struct device *dev)
 }
 
 static const struct rs9_chip_info renesas_9fgv0241_info = {
-	.model		= RENESAS_9FGV0241,
 	.num_clks	= 2,
+	.outshift	= 1,
 	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
 };
 
 static const struct rs9_chip_info renesas_9fgv0441_info = {
-	.model		= RENESAS_9FGV0441,
 	.num_clks	= 4,
+	.outshift	= 0,
 	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
 };
 
-- 
2.42.0



Return-Path: <linux-clk+bounces-30183-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803CBC27A36
	for <lists+linux-clk@lfdr.de>; Sat, 01 Nov 2025 09:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1BF11A2652F
	for <lists+linux-clk@lfdr.de>; Sat,  1 Nov 2025 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D329E113;
	Sat,  1 Nov 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uKR9LFir"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D082C0271
	for <linux-clk@vger.kernel.org>; Sat,  1 Nov 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761987247; cv=none; b=S9iGHZYLmQ0xFJqUxnyIjbjcr0T2Ks9iAGoD7BYmkqdJLlGhNwRguorh6TrRQzKXWYxa/wQrOxWEBt3r1jB3DetLXq1PV4UjZ5hjj7GqVji0978M9J0nyUzH3TJh0xQ+NkYHPBvnqPB22hqmju1rUlOHB+O373oJS1mTIL54bSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761987247; c=relaxed/simple;
	bh=rgtM81TJHrWSLfa7vgXN8x+VRWEr3crk3rI32ufCnI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVlaDK3dkWDqUkmRupOr8fWKzXJSHgQRKsFnB9Rj6XhonIEC4uUESGVtDlpFKAZzWcxZqtOJbtFZRxdDt/o6Yb90OCpfPU7ohNLGnYuT8Y19b3one4YISY1EQXZzV77NVySsa0xWx0+IEE8u8GCrwQmfkxC9evlsaDhENrL7tT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uKR9LFir; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E63061A17DF;
	Sat,  1 Nov 2025 08:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC9F76070B;
	Sat,  1 Nov 2025 08:54:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E8E91181ABE2;
	Sat,  1 Nov 2025 09:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761987241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rXG4FkA1j+W5VMPKCg2jc3dsIgNY9MiT6EY2h7XkH50=;
	b=uKR9LFirouVZ+/YEKLS5DrpGVjyj6wy3mG+sqpAwX/+fjT+bxJ9RrJYZ3EGR+CfVBRTTsK
	vmX5JNNlY51rlr9uuBcT+1WCyiBplJc5KBXeubdUnr0f/4a/sPDX5QlWCUhCojrU+SqWqH
	YUOLXRi8M4boVLeatWm2b3bbRwUxHTsg1OMK6kiROneZ8xUfmwEgYrOtSkUTDdKPEUqgGb
	Pkly8oBn/XYDBCDfktfSPJCnGZWPJTwxDnYB7Fib9aYL0IXAB2PdKJ9Ozg9ANNV9TU30W/
	VL1NYoI56tP4aT0/dO20j/0jYI9WPtqJ7p971bbOgHl/OddoLLdZBovS387EDw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Sat, 01 Nov 2025 09:53:33 +0100
Subject: [PATCH v2 5/7] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251101-macb-phy-v2-5-c1519eef16d3@bootlin.com>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
In-Reply-To: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 2d3998368a1c..8018fa895427 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -410,13 +410,6 @@ static int eqr_of_xlate_twocells(struct reset_controller_dev *rcdev,
 	return eqr_of_xlate_internal(rcdev, reset_spec->args[0], reset_spec->args[1]);
 }
 
-static void eqr_of_node_put(void *_dev)
-{
-	struct device *dev = _dev;
-
-	of_node_put(dev->of_node);
-}
-
 static int eqr_probe(struct auxiliary_device *adev,
 		     const struct auxiliary_device_id *id)
 {
@@ -427,21 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	ret = devm_add_action_or_reset(dev, eqr_of_node_put, dev);
-	if (ret)
-		return ret;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.51.1



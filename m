Return-Path: <linux-clk+bounces-1412-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE2812D87
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 11:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAA22826FF
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 10:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608DD3E496;
	Thu, 14 Dec 2023 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUg91Jw5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4587F18D
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 02:52:58 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c2718a768so77651835e9.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 02:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551176; x=1703155976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xcopqDHmkhwhZiddcnv/4oqDnf2f2C/EfKwZNlZ0qw=;
        b=hUg91Jw5utLpyY8E5CDdi/IaLvyeX0Y0EjDQzG/iXoXcPl49mRrpQKxyr1hIszPB90
         K96OtV50cQ0BFgtgMjFXXvyd9y0PMBTJFqCub65yjlpfaguHH9eptI1C2VHeAUJWGF5g
         JvDuidXOqpSolEOQu/zGoXqs/NsPiASXms+GYVj/H4rx7efIrkc9y+LgScmkUyTjAndg
         tmepwkVmlGOSfXqm4T4JDNEHhz2ny7sf48EWaZcznpt+VaXNy/vAWIX0VluNSK/2Jnn+
         0PtGNRfLvurQlW2YLtcrcb8lAIoJTdZJmHQ0wtPI70QelPCDQ19lyLVuw0MNY4+sdSuC
         pHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551176; x=1703155976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xcopqDHmkhwhZiddcnv/4oqDnf2f2C/EfKwZNlZ0qw=;
        b=n4zeufahmUJhnU7hjyMEnOgypYxKbkpIvE119ccc1Spki/dW6wya6yL4jGyMIIgoiq
         5pFlKAWvxERuVc5tNYAKocUvJmPIpPpy5PJ/uFqRrihDt24MJM5ke5R5b1089TOGLNSm
         sOdx0cxWIsgHUkY80OclQXIOLtldMIO6rB4/oXXdbWXqkrPlz+v1IZnDoD6nNwvo2jkQ
         o/IRKAZJ/q4Cl5xViwnjdC75IZ642Fj5a9fgdH/AMS3eW8PN7W+z1/9CkjwiEo9OO10v
         GdctpnpwlJ9SOLUgzOzr3LVXTpkmkonV5R9fJebVIg9IMozKUaUgu4FoxxzY21dW2Wxg
         jubw==
X-Gm-Message-State: AOJu0YzQxchTUZCbY5ETMGNWGwUGARNfQpCLXWVlqQ1m/CE446lIawyo
	nQi2hwqPMNyJ9BpgGulF1UHu0g==
X-Google-Smtp-Source: AGHT+IFoOjFMWtrSQgxb2NLW2t0CuX+poAGfnV283P6BxnO1HFB3lfJ/1vp1DW3s4vZF+aaQfp5C7g==
X-Received: by 2002:a1c:7411:0:b0:40c:30f8:dcf0 with SMTP id p17-20020a1c7411000000b0040c30f8dcf0mr5564669wmc.64.1702551176443;
        Thu, 14 Dec 2023 02:52:56 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 05/13] tty: serial: samsung: add gs101 earlycon support
Date: Thu, 14 Dec 2023 10:52:35 +0000
Message-ID: <20231214105243.3707730-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 only allows 32-bit register accesses. If using 8-bit register
accesses on gs101, a SError Interrupt is raised causing the system
unusable.

Force the reg accesses to MMIO32 regardless of the user's settings.
This is a common practice for such earlycons (bcm2835aux, uniphier,
lpuart32), in order to avoid crashing the kernel with a wrong early
console definition.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 66bd6c090ace..19cd3e6a9b6e 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2787,6 +2787,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
 
+static int __init gs101_early_console_setup(struct earlycon_device *device,
+					    const char *opt)
+{
+	/* gs101 always expects MMIO32 register accesses. */
+	device->port.iotype = UPIO_MEM32;
+
+	return s5pv210_early_console_setup(device, opt);
+}
+
+OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
+
 /* Apple S5L */
 static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 						const char *opt)
-- 
2.43.0.472.g3155946c3a-goog



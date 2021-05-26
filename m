Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EEF391DD9
	for <lists+linux-clk@lfdr.de>; Wed, 26 May 2021 19:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbhEZRWf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 May 2021 13:22:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36741 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234490AbhEZRW1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 13:22:27 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDC-0003Xm-Si
        for linux-clk@vger.kernel.org; Wed, 26 May 2021 17:20:55 +0000
Received: by mail-ua1-f69.google.com with SMTP id i33-20020ab042240000b029020adb6e9ffcso1079531uai.23
        for <linux-clk@vger.kernel.org>; Wed, 26 May 2021 10:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n51+iZBJFEKTpd4H5RsiqOX4EmYJ/qwnjVcD0oxhR00=;
        b=dVnJb9VeDqEf96SkZWOqsEVf/JLmo4F74mxiodB2BZBlsPn+uPpaPLcpT68bhJxT4j
         C29gPOjgyBlhIoqbv/S+f6mhua1MArk3txLw7CMua8q4qDtnOEnv+8XWMjx2vTgEp+B8
         DwjVZoRFmHrHlEwGt/UAc7J7qnuGVbAF+1eybUOq3+Cu0YWx9kh4uQFVv8lvO3UqNRdV
         wGTJHQn21OmWZhEPUcaZYAzNRVizvSzM9yA6pTmY+LsKhKgKajtog5Rlxtm8NN5Y4UKV
         QMu4CETkxuI+0B96VPJuqKR1soFaVJ5LaEIBNpSmfUTEolc+UowPK4Pa5I4LuoJaoS10
         GKxg==
X-Gm-Message-State: AOAM533YM4WG4Kj8kTSm5Gg4ekUKwtvYVHS+75ibFMjDnowpe20WabAF
        6UBm3f4BCnlhCzg2NW7RL/W06wQB0Z+jOCPG/EoxgThjCHaObkpXhHWyMyX9WPlTkBN7IYHPPYv
        TxE3Tb73rgSX6kDg4wJXW/K6fBKFr8AGc/iIQ3w==
X-Received: by 2002:a9f:3624:: with SMTP id r33mr34092715uad.66.1622049653614;
        Wed, 26 May 2021 10:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHZU50VG+nCX6FzJS9FPiUsgoOyUktGbP4eh0jiRweuFMnQ5d7pabHfuFMw+F1GN2DaHP2IQ==
X-Received: by 2002:a9f:3624:: with SMTP id r33mr34092695uad.66.1622049653440;
        Wed, 26 May 2021 10:20:53 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:20:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/7] mfd: max77693: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:32 -0400
Message-Id: <20210526172036.183223-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 77693 datasheet describes the interrupt line as active low
with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add ack.
---
 Documentation/devicetree/bindings/mfd/max77693.txt |  2 +-
 drivers/mfd/max77693.c                             | 12 ++++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
index 0ced96e16c16..1032df14498b 100644
--- a/Documentation/devicetree/bindings/mfd/max77693.txt
+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
@@ -139,7 +139,7 @@ Example:
 		compatible = "maxim,max77693";
 		reg = <0x66>;
 		interrupt-parent = <&gpx1>;
-		interrupts = <5 2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			esafeout@1 {
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 596ed85cab3b..4e6244e17559 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -222,8 +222,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_add_irq_chip(max77693->regmap, max77693->irq,
-				IRQF_ONESHOT | IRQF_SHARED |
-				IRQF_TRIGGER_FALLING, 0,
+				IRQF_ONESHOT | IRQF_SHARED, 0,
 				&max77693_led_irq_chip,
 				&max77693->irq_data_led);
 	if (ret) {
@@ -232,8 +231,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_add_irq_chip(max77693->regmap, max77693->irq,
-				IRQF_ONESHOT | IRQF_SHARED |
-				IRQF_TRIGGER_FALLING, 0,
+				IRQF_ONESHOT | IRQF_SHARED, 0,
 				&max77693_topsys_irq_chip,
 				&max77693->irq_data_topsys);
 	if (ret) {
@@ -242,8 +240,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_add_irq_chip(max77693->regmap, max77693->irq,
-				IRQF_ONESHOT | IRQF_SHARED |
-				IRQF_TRIGGER_FALLING, 0,
+				IRQF_ONESHOT | IRQF_SHARED, 0,
 				&max77693_charger_irq_chip,
 				&max77693->irq_data_chg);
 	if (ret) {
@@ -252,8 +249,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_add_irq_chip(max77693->regmap_muic, max77693->irq,
-				IRQF_ONESHOT | IRQF_SHARED |
-				IRQF_TRIGGER_FALLING, 0,
+				IRQF_ONESHOT | IRQF_SHARED, 0,
 				&max77693_muic_irq_chip,
 				&max77693->irq_data_muic);
 	if (ret) {
-- 
2.27.0


Return-Path: <linux-clk+bounces-1010-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31F80819A
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 08:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D97DB2152A
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 07:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5720A1E4BD;
	Thu,  7 Dec 2023 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g/FdR8q3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D521705
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 23:08:28 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54dcfca54e0so201152a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Dec 2023 23:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932907; x=1702537707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkghlNv0V/SuTZPxwTXU6oUm+Z1UHMMmkJLyVfH/CTs=;
        b=g/FdR8q3/4gaKLPC8MwlRS/lbel73uuZR48NvnIibK2EOkCYK2zG1KKQqgbedZ+QYg
         QZl7U+t6GYvkqgyy0UHteWcQXtZNAiYkxgKUAggwFp5R2HbUj84Js79Wk5z8NdwR9Qws
         QO1o5UuUGDa7FOyCAQ0iElD31ChRCVEMmmmR5pZ3cCPZvWmg5SkJFYEgc2MH61vOWFtg
         jj8bernaxRzi9DBWC1jmRsdflj8tBILAXKyV1BgNuubyGy0UnDCvcEyK/w4hXE8kqe+B
         vT/VoVHjbRXu88yhGKI4IvLCO4taRoPGOrhuWipA7rf6pE3qJV/o0lrhoN+D7UEYvNPv
         8Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932907; x=1702537707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkghlNv0V/SuTZPxwTXU6oUm+Z1UHMMmkJLyVfH/CTs=;
        b=kjn5avka5y6w5QN8/BZbVJDfkKzt24N7GJt7/v9U1qF4DrglWwHEW5ZW9eYyn4ISnv
         tErPsiizz4ZM9CVp5ahwPjDTQ7VmX/BNbTKISIlBLxEKOFpAckZs52ypDkMywxANUMzQ
         /POWGIxPbUa3eNBTXVdS8IwVA2HM8GhOUzTPhehb0NWB3UDDDUI/CqzaaVLopRRj9QTn
         w4UQOCYRXjN9Y53PAuGBjQ0yq8v9uQ3MTy7S0nmighYDNvozpTZ8HjNJpID63oKD8CyA
         BHgyHWGgIhUoG+jkTGRouOdJdeOfd0jRw1gcrgSZygQx2L9VtCQLkvcPGEuvvsza98xU
         qJ7Q==
X-Gm-Message-State: AOJu0YwY89YmAHrEfi2VeL1oFPREzOn+c09DX1L5R+4szbj0sKXle/CB
	IZvt/xM87vNTT4u7WLPown4SIw==
X-Google-Smtp-Source: AGHT+IF47v7X3q8qD6gB4ZCRiRsvI7r4bTbz5pfTw8z2mVo3VWRWVZ6UtqKRrNoxLAAITVBzD5hyZg==
X-Received: by 2002:a50:f692:0:b0:54c:4837:a65d with SMTP id d18-20020a50f692000000b0054c4837a65dmr1419834edn.74.1701932907528;
        Wed, 06 Dec 2023 23:08:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/11] arm64: renesas: rzg3s-smarc-som: Use switches' names to select on-board functionalities
Date: Thu,  7 Dec 2023 09:06:59 +0200
Message-Id: <20231207070700.4156557-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The intention of the SW_SD0_DEV_SEL and SW_SD2_EN macros was to reflect the
state of SW_CONFIG individual switches available on the RZ/G3S Smarc Module
and at the same time to have a descriptive name for the switch itself.
Each individual switch is associated with a signal name, which might be
active-low or not on the board. Using signal names instead of SW_CONFIG
switch names may be confusing for a user who just playes with switches to
select individual functionalities, but also for the advanced user that
looks over schematics. To avoid even further confusions, use the switches'
names here and instantitate them with an ON/OFF state. This should be
simpler, even though the name of the switch is not that intuitive. The
switch names documentation reflects the switch's purpose.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new and aims to replace patch "arm64: renesas: rzg3s-smarc-som:
  Invert the logic of the SW_SD2_EN macro" from v1


 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 01a4a9da7afc..f59094701a4a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -9,23 +9,31 @@
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 /*
- * Signals of SW_CONFIG switches:
- * @SW_SD0_DEV_SEL:
- *	0 - SD0 is connected to eMMC
- *	1 - SD0 is connected to uSD0 card
- * @SW_SD2_EN:
- *	0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
- *	1 - SD2 is connected to SoC
+ * On-board switches' states:
+ * @SW_OFF: switch's state is OFF
+ * @SW_ON:  switch's state is ON
  */
-#define SW_SD0_DEV_SEL	1
-#define SW_SD2_EN	1
+#define SW_OFF		0
+#define SW_ON		1
+
+/*
+ * SW_CONFIG[x] switches' states:
+ * @SW_CONFIG2:
+ *	SW_OFF - SD0 is connected to eMMC
+ *	SW_ON  - SD0 is connected to uSD0 card
+ * @SW_CONFIG3:
+ *	SW_OFF - SD2 is connected to SoC
+ *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
+ */
+#define SW_CONFIG2	SW_ON
+#define SW_CONFIG3	SW_OFF
 
 / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
 		mmc0 = &sdhi0;
-#if SW_SD2_EN
+#if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
 #endif
 	};
@@ -50,7 +58,7 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_SD0_DEV_SEL
+#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -85,7 +93,7 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
-#if SW_SD0_DEV_SEL
+#if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
@@ -116,7 +124,7 @@ &sdhi0 {
 };
 #endif
 
-#if SW_SD2_EN
+#if SW_CONFIG3 == SW_OFF
 &sdhi2 {
 	pinctrl-0 = <&sdhi2_pins>;
 	pinctrl-names = "default";
-- 
2.39.2



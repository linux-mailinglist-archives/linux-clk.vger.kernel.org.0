Return-Path: <linux-clk+bounces-14752-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC89CE092
	for <lists+linux-clk@lfdr.de>; Fri, 15 Nov 2024 14:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC591F23F93
	for <lists+linux-clk@lfdr.de>; Fri, 15 Nov 2024 13:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A471B1D6187;
	Fri, 15 Nov 2024 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d47pbgHn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117C1D5CC5
	for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678267; cv=none; b=R5olHavqjqSWWuYDzVfgyeFf784e5diwkUAYjGbyzEaJPEBqM7UwBALJle9nJLFdIequQA5r32xsOORw/bK9vRyKIX8Wx0ZOY9n0VzbqK5ampDNplrfPrqwxNCGDTIZkGJMcmfbvDOpm5iUJnIERTxOSVjUFU80fg0H2CxhNvlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678267; c=relaxed/simple;
	bh=LrCs+Ft93mkejJjJfAZXNdagefh5tGGc4YtY6FNYOrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUZnJpGPc6c0okTOzdXmEIjCYaSLGqdwBXuN0k7qtkSkW5vVBWBtdR/btavUf/9AJxq27pHfLzIgYbAN3VEeY5lvcENKCf558NVWN3GwrmLC3x+I+QOs2Fkeq8x92REz5MJTCflLeTiuvOQASc/G3E/NqijL1cjajWBIFqEdmQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d47pbgHn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so5772405e9.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731678264; x=1732283064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbikK54OyStuo16iZrOIOl8rBYONkOS/JF88KYtuMkg=;
        b=d47pbgHn8v+kjUS8Dq7DO6zGQ1KQMsW8yLiNrwqzfU+m0WirSU/Uh9Q42sP/ddZQb0
         ceaRbwRTP0XirehB9tkzHOvOzHbFM+ujatYB2u3qvwYBEA/1uihIUGU0QI3y6IUuNmYO
         JZfQWalOLMPv6xlEAXjr8RhIAaSKpDGUD/k9yUfvwxInsP1a5Kg79Dl244rwxSWmAi6k
         FPBz5qcYpLJTv6R/TTMtohI6QzPycYiRejLAxfFCqsPR3AUhGHuIQ83OGxP4tZukyZs/
         c9bka1dkJTVEfUEDtB7kS6gfPw0eSKKwJ+zYIUyjQRq8zr5K6eVrD2OaeV9wUQt/+uh5
         wyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678264; x=1732283064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbikK54OyStuo16iZrOIOl8rBYONkOS/JF88KYtuMkg=;
        b=fxOzBU6nkI/PgB9MwtvtGu8qRVfk3tF2NNr6Xoe9tN2vIiyBfJBExVAw3hLW8lu1sd
         bXnIlgB9MTw46Jdra+dXrFbucpfgdt31KnL6W3l8gYCuuR/FJbDzBqdKWWdPlOysSw11
         4/j6Et9yAP12tOtLO4jBwOzszLcsFDJCaZVdasa4wHPYsCfugevf8Z8jck6cAQF7QbRa
         fAwxFtX8O7WeWGXVzf/T+z+PL7/USHo9ktSimy2piqe+ldy5/XD6qk7Z38pCg6s3XhRm
         yHH/MK8TJUHFKnNnB5WnSb2oO1cGgBhmVC353DGDZKVfPyYYvHIiD04dmMOQav99u6U6
         ZZHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxwHiy15yMawUuIH/HI7FhY+4uv033LPSx303hTFhdOXTmXrNWOl/vqIgSb193+goxtM4eyd7VaUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y7+GkrwptEaYAphJfDSzz32syejtUfCuNHS6rJ/2Penyuyxz
	01h0DjFw1dfLLuuIrA2m1IDt9+zVKpqIrfnJWGjyyEx7spoyf/+xpQehqbXnj8w=
X-Google-Smtp-Source: AGHT+IGrZltzKer/dm8m8qYDs7z7mwJoTu/1frSmXqBSSagNZ5FvyYqOjugYq2GKqHZ+Vm6ZI9Uk1Q==
X-Received: by 2002:a05:600c:3aca:b0:432:c774:2e24 with SMTP id 5b1f17b1804b1-432df72514fmr22784765e9.9.1731678264401;
        Fri, 15 Nov 2024 05:44:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3fc9sm4378016f8f.20.2024.11.15.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:44:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 7/8] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
Date: Fri, 15 Nov 2024 15:44:00 +0200
Message-Id: <20241115134401.3893008-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SCIF3. It is routed on the RZ SMARC Carrier II board on SER1_UART
interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 33b9873b225a..1be21ece131e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -9,9 +9,14 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
+#include "rzg3s-smarc-switches.h"
+
 / {
 	aliases {
 		i2c0 = &i2c0;
+#if SW_CONFIG3 == SW_ON
+		serial1 = &scif3;
+#endif
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -102,6 +107,11 @@ scif0_pins: scif0 {
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
 	};
 
+	scif3_pins: scif3 {
+		pinmux = <RZG2L_PORT_PINMUX(17, 2, 7)>, /* RXD */
+			 <RZG2L_PORT_PINMUX(17, 3, 7)>; /* TXD */
+	};
+
 	sdhi1_pins: sd1 {
 		data {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
@@ -141,6 +151,14 @@ &scif0 {
 	status = "okay";
 };
 
+#if SW_CONFIG3 == SW_ON
+&scif3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif3_pins>;
+	status = "okay";
+};
+#endif
+
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins_uhs>;
-- 
2.39.2



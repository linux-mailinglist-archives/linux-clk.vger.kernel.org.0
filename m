Return-Path: <linux-clk+bounces-14421-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49F9C19F5
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0230B24576
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9731E570E;
	Fri,  8 Nov 2024 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QVKM/p8b"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F51E492C
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060345; cv=none; b=qXu1wjvoBrMhRMRp1r7ZU89rOXB6nnUl+DuxdtkB17R8N/j3PzhOvSsA9MyDzxW4cgYf6X9PEDIsV3l2Pp9rc+i17xXVq1tm2IAg6ePOfRxl22128+jlHVu1FRYOW7D4ZRiGscBXz5GDZyGU+IK3kpTMcCIPe0e22P9rFjgCKBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060345; c=relaxed/simple;
	bh=Z2tb/vC/liM3lvGpdrdtmL0ddtGw6sNDFl2J3gl/M+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBqW8ZJbqBRbpZs2KEgwVOwquhX90rLw/tQbI5eCVqh6c/lxksYylh9l9WRVGFoaEPAqCneD0AqeIuPbhhQ/ANBg0Ck2jzFEZn6k/ks9uoOFpoVmDWYFpgf3V+GbuI9c1d1Ii9mG/0F1rkj//lSY+sgpIsmBmGI9k/fr87BvT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QVKM/p8b; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so284455566b.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060342; x=1731665142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKrZynwicqxo1yfu93+nsEDR+MRiX9ulp6Qb0mIB22s=;
        b=QVKM/p8bJ+m7jDi8gjNVtytteNGzS/pOZ7SfpIrB4Rnihal69zeOkHdv5BKkyxYS70
         tc9tbxpR6H4F2yTyb0HTmd3MWUVM02WzLDM3zopi5d+LlW9Qz6a0ayPQ8MLRF6GN0Px0
         N/yIOjIWDbxtKnqjyC94kwaZCnvrvxAvYZmoqF3dWzItgaG4TGYrEVIC2S6COqZCJdo0
         NPimLOWY22McXVA1nL7XC0yiycHihXXTg8y7xLomgMn87ryrFMnKrYeRMHscA4PZ/BT1
         5bDz7Hn1nrkrrx1dxMCICkqzkmTooPcoWzP//ZpM4Qmb8Bbg2eJUdBne41+jr3eHEMyb
         Cb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060342; x=1731665142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKrZynwicqxo1yfu93+nsEDR+MRiX9ulp6Qb0mIB22s=;
        b=tvXWRmI9MJ7uk5xRXQqTcnZUmml1srnkWfS2IOzCz4wePS7tDRQva8bVltMncKSQ77
         IttY+zICtL8Gxtp8BVeHZxHKMuWPoAfe71bP1VVThzTOpwACD6vS6D1V/ix+40n0fEQg
         kSf2sIhtzTXbk79g1M9/rwUppG/g9at/1DXlL1J4JKdKUcLmj2h/i7fA7LgMtpuc/bEF
         mes2TRMRe9dZYBT1vYrJB74WDhXQGqmGh9JZMv6q0IEKefp7vV4BS7a9Ida7gk7WpE92
         rKYbEIep7SG3GO2iG2Waa//viM29Cqo5xyytpNIpTeXXJJ+GZJEGHwTKiVWznoB6YrIr
         TOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiRGNUsFv8tzgfmq3GF54xbUVvp4XB0XYnVO3NrkwRVi9yNKQ5DyjG+JHXQMu64Rbt+rnqiw0mrmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DUdusTjnNLcMBZirsDxC02kg4Hn0xpDcH1FvriRP2xDXbLnF
	os427TS1pC1DRuxxjcxPPl2dtw/0LFit9j8cePncOQJ0E3pRp3FlejGLkQQEiyw=
X-Google-Smtp-Source: AGHT+IHv2DNDgVcjRFJGreV+5UAXbde6rObAUQ0eu7AfLIMiqBcc4T+3lub+OwQbaeVt96soMj8u/w==
X-Received: by 2002:a17:906:db04:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-a9eeff3a983mr196643166b.33.1731060342322;
        Fri, 08 Nov 2024 02:05:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:41 -0800 (PST)
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
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1
Date: Fri,  8 Nov 2024 12:05:13 +0200
Message-Id: <20241108100513.2814957-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DT overlay for SCIF1 (of the Renesas RZ/G3S SoC) routed through the
PMOD1_3A interface available on the Renesas RZ SMARC Carrier II board.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/Makefile          |  3 ++
 .../dts/renesas/r9a08g045s33-smarc-pmod.dtso  | 48 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c..7ad52630d350 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -137,6 +137,9 @@ r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a08g045s33-smarc-pmod.dtbo
+r9a08g045s33-smarc-pmod-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-smarc-pmod.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a08g045s33-smarc-pmod.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso b/arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
new file mode 100644
index 000000000000..7d637ab110e1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G3S SMARC Carrier II EVK PMOD parts
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ *
+ *
+ * [Connection]
+ *
+ * SMARC Carrier II EVK
+ * +--------------------------------------------+
+ * |PMOD1_3A (PMOD1 PIN HEADER)			|
+ * |	SCIF1_CTS# (pin1)  (pin7)  PMOD1_GPIO10	|
+ * |	SCIF1_TXD  (pin2)  (pin8)  PMOD1_GPIO11	|
+ * |	SCIF1_RXD  (pin3)  (pin9)  PMOD1_GPIO12	|
+ * |	SCIF1_RTS# (pin4)  (pin10) PMOD1_GPIO13	|
+ * |	GND	   (pin5)  (pin11) GND		|
+ * |	PWR_PMOD1  (pin6)  (pin12) GND		|
+ * +--------------------------------------------+
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&{/} {
+	aliases {
+		serial0 = "/soc/serial@1004bc00";
+	};
+};
+
+&pinctrl {
+	scif1_pins: scif1-pins {
+		pinmux = <RZG2L_PORT_PINMUX(14, 0, 1)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(14, 1, 1)>, /* RXD */
+			 <RZG2L_PORT_PINMUX(16, 0, 1)>, /* CTS */
+			 <RZG2L_PORT_PINMUX(16, 1, 1)>; /* RTS */
+	};
+};
+
+&scif1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif1_pins>;
+	uart-has-rtscts;
+	status = "okay";
+};
-- 
2.39.2



Return-Path: <linux-clk+bounces-14448-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADD9C1B8F
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B970A1C266FA
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8711F80CA;
	Fri,  8 Nov 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YnuNyk3m"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7F1E5713
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063070; cv=none; b=imfXujuu+P6fdMv5F+CVymKe6CN9KA+R/GmI+AET2b5QRGfBAqJh3grKeeibdLjwIiIjLa7yUJP0SfNWu0B+mwYuv4miLQvIfVY0qEN2G+VNP4fpYisEAcnp1D2eWeF6SoXGBzTdMCrWDTwwd1ruGX50sR8/fHcWU/1dgVCd8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063070; c=relaxed/simple;
	bh=5R/kbi91DW/+YOWu/nBiwMSuOtCvIhihiX7sqnIwlYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xntw/r1PtFzPW1eD7o2Q0cqobk8r3Skqq/JpCu+9/D4CnNlaCoMeFe9Wg0fslznzkbiyP63q0zUB1fr7L6ViYwoA3z0OYt0bkpUn5wJr/2CtKQjchItFV36XP9nXhrAH87xSVUZQngJg3PDnBrRNZsPu1yRjDJW4qe/ttgFQiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YnuNyk3m; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso324128666b.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063066; x=1731667866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/e38PQFjeFG209Rga4nKvvbj7y/1sdDyJVGbXYbeis=;
        b=YnuNyk3mSQywjwo9HIHwQsz4lyBRZM57OOvX136IGl1zgia4rjTQ3rqFhIwykL3Rtu
         An3Lv/5/GrigxGt222Z3qCPlq7zr4ONYIUNk5HxDtfv4lmzDgdYmnSptIACjBlbtFWMK
         176+nRktwL+zZBZz7gfcfm67iQY5Ew/dUvpQhgfJRGjAEoMXG1T13eWOAuo5231QSH+/
         SHn+/ZGz/k+dcKfX6vnEDoVf+BD1eMFrwZiVGS3BGylLpzpluPwOgvaMx9/gMi4LC+b8
         uCEJYZMnSoY6u0Yeq0vcXpSMaHWBox4nUhKzYMBAUSA5fUPIs+4eGBy6aiYNdXxkwGl0
         FXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063066; x=1731667866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/e38PQFjeFG209Rga4nKvvbj7y/1sdDyJVGbXYbeis=;
        b=kIDIs58VsuUBNZpsap/Ud5D6ThBu2MjPZA9nylk6ffdG1yEz83J0v2Zfcu2QStQcjA
         mAEzfiJ8G8Ta0DwknmgPJTh2kVHJxzTdoWwUG6xby7ByKJJAZ1GPm2h4flPbamTsWvSc
         3IQvoidEftrHMvLGPk+TONuwtZH67KGisqC+DKF4ABudlaLjobT+1ZLKEuaFvYCPpsTa
         S5nMradmjR6DZ8YZ2GAsNEdNEzhcPUD5h2MyRy49RPaD+cSzc8U3GGGqo5i+j0zMY5VJ
         iOjeAQKtRLYytzdKoHLOBQTEOcBfg+609okQvHaMauIf++Nr2lpWbvFMbQtzazv9fpa5
         +c7A==
X-Forwarded-Encrypted: i=1; AJvYcCXZ0C2FTonRiYxm8+9L42MRnUEVA5HfBXpviajirYMtfzHK3KYRpZOvhU2sbbx4vqPn4KQU48Vgpg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cj7bPN1NwStjS43eLe537dPEstAQqeGxebvLwxppsWmmCXQW
	ZhFFH/ZAOofqMCAsKjVgi0bHsmdR0oXicuLGtMXf0ibasFDHhQL1alcctOYkCig=
X-Google-Smtp-Source: AGHT+IEROX9KaO6d/u0xO2QIjRrzXqnBo50+cssH572zzI8DNVKAplSUbSI9A0zYuxHxBmSPI6CWtA==
X-Received: by 2002:a17:907:3e1d:b0:a99:4aa7:4d6f with SMTP id a640c23a62f3a-a9eefebc409mr218811466b.12.1731063065775;
        Fri, 08 Nov 2024 02:51:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:05 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 21/25] arm64: dts: renesas: r9a08g045: Add SSI nodes
Date: Fri,  8 Nov 2024 12:49:54 +0200
Message-Id: <20241108104958.2931943-22-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DT nodes for the SSI IPs available on the Renesas RZ/G3S SoC. Along
with it external audio clocks were added. Board device tree could use it
and update the frequencies.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index be8a0a768c65..24c6388cd0d5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -14,6 +14,22 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	audio_clk1: audio-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
+
+	audio_clk2: audio-clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -187,6 +203,86 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		ssi0: ssi@100a8000 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8000 0 0x400>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 242 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI0_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI0_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x2665>, <&dmac 0x2666>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi1: ssi@100a8400 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8400 0 0x400>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 244 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 245 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI1_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI1_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x2669>, <&dmac 0x266a>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi2: ssi@100a8800 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8800 0 0x400>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 248 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI2_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI2_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x266d>, <&dmac 0x266e>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi3: ssi@100a8c00 {
+			compatible = "renesas,r9a08g045-ssi",
+				     "renesas,rz-ssi";
+			reg = <0 0x100a8c00 0 0x400>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 251 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+				 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G045_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x2671>, <&dmac 0x2672>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.39.2



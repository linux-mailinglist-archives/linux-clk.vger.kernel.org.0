Return-Path: <linux-clk+bounces-9666-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1053932406
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 12:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBCB51C21F4C
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDF4199E88;
	Tue, 16 Jul 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="McCHhfkb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9C1993A3
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125850; cv=none; b=SGuFjmsptkxhbw+deLyWxv97f3I2+YUsm5+hAmVX7iQs61dGb0EUg2Eo7R7QcMN9de/3ecH1HkIMAzJfzhmrZka1DRiFwKGigLQpK0BVg+i+gzdafntVqpvuXcpKpXQuB0sr9YR6AyZovq/iDAiVuJAykYd3CZHjWwB3sIIrbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125850; c=relaxed/simple;
	bh=+Mc+13b2z80oCG9v0Z12Pko9uuqMsx9D9wsAYYdr2Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AMvSjJkeCwuREllXyyuMOeBPGrTHr3TuTrgDb+I9Oa/C7J2vrYeczHqsbLRhml5m0hcVdYWO4u7voT2wlBjnkSQmmxmTi/hJao/W18BE/B57bdL52BLjZO/Mo1olnam2C+XG66FHalBS57Su5YCfN+LuKXOAUBN+Z4gKb1GlhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=McCHhfkb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-368255de9ebso359853f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125847; x=1721730647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=havjViSFqkpX2ZEw/deHEcNpYtCxaTiY0eUvmPFnuY4=;
        b=McCHhfkbz6e4ZnwGv0BIMeRF7vJSGQ768vJCGG2+FWKdVbQzTjbfU/V5egZYAtbHE7
         /nyA5AbPC/r4EsicYZubvKuUepjpU4/Uwoxetq8Y/TvCEJxZLyDNChvBpPLXO0COLrE4
         a5ybVmxe2LamqOssrVTEsVQW1DNytqoonwc4h2I4MaROap1rIuX+N2YzFyebwHrxPGFi
         +YwhKi2quhIdKOA1AIUFEY/wH3d+aHszhQlOSrOn2z2GvpMMWYxpdBG/ttppdSCx3MDl
         afgYA72SlahfQNwNlwoP4zvzpbxG1z4XBtx1zkE6jUWjthJNb6iPx4wyr7agKhMfiPL/
         Q8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125847; x=1721730647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=havjViSFqkpX2ZEw/deHEcNpYtCxaTiY0eUvmPFnuY4=;
        b=E70VbZ2YwvTbyeyahU+ZCY+clanh2jxoatgQq9j0XNrTjpyAVWarSuUspQ2IDCtIUf
         ELzJZokMndXDEea/++uU/zC2lyrA+TfaaTF50sFs+zXxw5ZYnuXfTiN4YKwP6WS3ITxF
         sqcjCWG+LL+q5R6RURx6WIbmrVzvmMee/5XoxYASjnaZJf2Dd+77Me1Jic5wF1JnzLJo
         tTIUGk/tsS4LxWgOJHtaAGpZt/+BqQztD9rn0fTWCIXQCUx5sVsIn+aAb0tj+DZmVN7N
         pnNQWA8JOrAz4GVx0Vzl4/LEB6c59s9gnw41RttKGWRi9FLbRuPw2tHaXA1wp6sSr51x
         T2tw==
X-Forwarded-Encrypted: i=1; AJvYcCV4SWswn9n90pjUNM6839T7K6cwg4yhflGc8TlV5RkytFOcNNn24Z+2W9deVvAKoYYCepjNK4rrK8rMRXMMUrsV1x5v6oCsr7CA
X-Gm-Message-State: AOJu0YzTJlhloLWsiCQy9IzzA5czPihNEqWwAiV7JDPyuuZTFVbaQIr2
	AjKGo6ASoKBdYniVhvZIHfeTqvfkicC9XsiYlhNRTHXv1cqmCey4QrRJ0XlL6do=
X-Google-Smtp-Source: AGHT+IG5nj05P3SaIbAeAjYYqU7ltlxGNASeUqz3/IbArKcpEVPxuAGunWSshG97PaegXbchwypLPA==
X-Received: by 2002:a5d:6d0f:0:b0:362:ff95:5697 with SMTP id ffacd0b85a97d-36827591cafmr1044592f8f.28.1721125847401;
        Tue, 16 Jul 2024 03:30:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 07/11] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Tue, 16 Jul 2024 13:30:21 +0300
Message-Id: <20240716103025.1198495-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated compatibles

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 78b4e088a3a5..22008407848c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&vbattclk>;
+			clock-names = "counter";
+			status = "disabled";
+		};
+
 		vbattb: vbattb@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2



Return-Path: <linux-clk+bounces-3452-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA384E111
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 13:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC7328C022
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 12:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9FA7D3E4;
	Thu,  8 Feb 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hyYCBCdm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875237CF24
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396253; cv=none; b=Ge2YBJqGT10ThZ1hXJk2dbi3ztSGOgbXVOo+qzl+SBO9b4qXvB6NmtNBoNp4vNWbrnissSY6J30eJGWqxNN09zRKIs509UaAWPcWE1zvE0BXnr0kZKJvuzEQ47KMUZyZKKi1PldoVTVQOw82GroWeJbKqYoVjCypjonzBr1Z5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396253; c=relaxed/simple;
	bh=QBxy2EnAA/OjW6Ak9KJdT0nTXRdbFAC1gRDLVJJpqB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kq3Svm7IID4slTRa7N4qkhgQsjGRbV33UPlPK3sL0BBirn0KER7KpubnGW8X+sg+xgiS5/IhwTjioo3l33+1hISSOjODJglWUfAc9xpKNdI3VRxIK/6Ko97TBj6AdWJUobljln5IqTGCu05+7GVzhnMUxdCYgL6GoyeprmW846g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hyYCBCdm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so5149755e9.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 04:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396250; x=1708001050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McJKLtshO3D7dPz7Uw3van7kyM1Ng7QWriaUI03VR+Q=;
        b=hyYCBCdmsa2I4lWTk9r2SoZhnPhq5SGI9AXm7VHuHd/Am5yraxgoP2RYRMyauFTRdd
         yfRtHtubYyx+nAu0Z1cABEtgcGRDKHTFp+5YI//u9qNi2DOOjrEi0NqGVevy7hIz6d3I
         DZq6Nt/h9yCwuIXWy6SqbigtwuyECsh/7z5Kzqs4je/2MnDKGBSFit+Ua/X4OlCTD39Z
         GMMT88KzIMSUOhVyR3Cq2KLFjycEC3CIFSD4V0efv6AhposoWoZyL4fFCuK81q0N6wWK
         /hfXho6pALGnIANXRPy3efBwm+JrQzyBJ+6yAB3y37zWUzZKvtT0BsYev5vGria1uC6K
         HqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396250; x=1708001050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McJKLtshO3D7dPz7Uw3van7kyM1Ng7QWriaUI03VR+Q=;
        b=lhkxFNVTMnY09jmjFkrdT+OnSjWw1SKqdX/OwW21Tv2H2b9OsiqJ7edZ/lH/XgNgN9
         sVH4B67Lohat1PAZSec0tQbiYz6ZUxAD/Tmsph4ThDEbu+YBlh93TC2r53LDiw7qIrEV
         XN/BUthoi24/BY8JOpTp+AfR5dLO85ycB+238D6PupYgvyiyAwhYTDyJFefJcCVQhSgT
         O/oFXtZ8wWnfY4D/PmoR0gkVLOSVvHw7ssh4K5oyOg2zr5HBNRNq4NVRpua22aFezKH2
         fWxC6C0whrKX82TlapnQ40Fo9bOy2HN0AEpG4CzLLNWZIfuWppFnCdl7ldUMAKkLt4ws
         zETw==
X-Forwarded-Encrypted: i=1; AJvYcCVmFSdXr7lr6v5svMBdEVFC4uwxzx39Ow8Qhh4SN4Jz/mZ2QdcpEn1ur6h/fvWggXrOj+05MjKZWlEqQnvIinIH7mIc/Zu949Dn
X-Gm-Message-State: AOJu0Yy9ADG0Eo7aM1jOIcvRFq83YW0N/C3dZsfjaLhKO++qT7BUpX9u
	f2622FlZqLN4VzS5pRGaWmIivsevtVXheEgIIvLuciiwHdQObMKgoqSz2d2E9JE=
X-Google-Smtp-Source: AGHT+IHqJVPSXIx9zTm2sfCHEO4bGqRxWj/L31Fi+6P/XBaLnbH3QSlrjpSAnQgVZ0l2gpyjJ5YqVg==
X-Received: by 2002:a05:600c:1c17:b0:410:2975:cb05 with SMTP id j23-20020a05600c1c1700b004102975cb05mr1958906wms.19.1707396249979;
        Thu, 08 Feb 2024 04:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoiCqTbyl47pwC14HtcXzPMz44Gm6yb/nEUCELzy+BV/Axcoq9C92rydDNjm6ZJsUwtFYlNkf6Dnd9fDwpYkBn3RXEY9MMkTat3u7c/KTe+75xd0PnWSpVYuNP/BbCKoqGpK70xWYtHQr9rfUJbSb43myzOqXNMrY/H7zkSNHPpRz9nqQIyEwLWP9pErkSTaUUTQNLxnlUz9irTs9BCe9Si/OZWdth8LChjZb61VKx23+BaXVtWOgz4AAzS6LSt+cIkYKdNBr1WDvtmNSXqkrzuVInHcE3zRWzSMxTHV3AL/3Mh3hxBIsT2ANfP32/3HOd29eLSQdUsD6eF5+d2tlfGxAHG5a4CKXoDDBX7TdC9QiirOuPswZGyRUUXMtDqGgcXZOzlx6mBHElPMfmHZ559p60MHpfTytFDAhtjVvEuE5zstw+VsoHpvFJYq1NVTVHw8lK3AAZwj3W2Z8QJlg3vM1ZyDr0kSXq8pl8gL8r6E2cslkR9iehDygOM9YEfoQ4+87Z5aCE/qXoUFjDRZd7aSfPS4g0VIFfKRi/AQSgrg053XLXW1SPXRqEQgGsMHE=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ GPIOs with proper flags
Date: Thu,  8 Feb 2024 14:42:55 +0200
Message-Id: <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Ethernet IRQ GPIOs are marked as gpio-hog. Thus, these GPIOs are requested
at probe w/o considering if there are other peripherals that needs them.
The Ethernet IRQ GPIOs are shared w/ SDHI2. Selection b/w Ethernet and
SDHI2 is done through a hardware switch. To avoid scenarios where one wants
to boot with SDHI2 support and some SDHI pins are not propertly configured
because of gpio-hog guard Ethernet IRQ GPIO with proper build flag.

Fixes: 932ff0c802c6 ("arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2b7fa5817d58..acac4666ae59 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -193,12 +193,14 @@ &sdhi2 {
 #endif
 
 &pinctrl {
+#if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(12, 0) GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "eth0-phy-irq";
 	};
+#endif
 
 	eth0_pins: eth0 {
 		txc {
@@ -234,12 +236,14 @@ mux {
 		};
 	};
 
+#if SW_CONFIG3 == SW_ON
 	eth1-phy-irq-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "eth1-phy-irq";
 	};
+#endif
 
 	eth1_pins: eth1 {
 		txc {
-- 
2.39.2



Return-Path: <linux-clk+bounces-17-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606447E44AD
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 16:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910531C20C7E
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 15:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF70531A87;
	Tue,  7 Nov 2023 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pDsPALb0"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71DE31A98
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 15:55:54 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38515479B
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 07:55:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5079f6efd64so7217317e87.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Nov 2023 07:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699372552; x=1699977352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdPLm4V5Hkn6PmKk4G4TX5qad8wgg2qashR0qo8Jkhg=;
        b=pDsPALb0e6J1a1jCURrRD9/tXYB1gEpZMaylUGGaYQsiiUgRGOqi/IcW3qs42ixF4r
         CqDFd2DRdX2zRBRAzYMweHNnofPMJ3IOL5YsqGfjNFFWz8hXgggMHQWsPJsrcS9cBgFZ
         IoPJu2BHW0CX/3tOh9fIWXAkwLaq6nb2+2vAUbTWh7on34eZNvJZsKcsBWocChsFjkhJ
         hpOv1RnGrkUf+8plzdhM13sEHK3uTZeOlFRI2xeuzOnF6s19d53kSrzBdX/hsRGiWPRu
         zWVh996Vek1+lRwalCgGE5ObE3RR14iKNoFcwK5EF/nDvu6y7dZ9nGSaPig94WR1ro2A
         gBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372552; x=1699977352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdPLm4V5Hkn6PmKk4G4TX5qad8wgg2qashR0qo8Jkhg=;
        b=aBpPkjKwfOtmGHSgW94k96IoKWGXIxVJFmpVJpG49NdbymXc3nwDqy7zS3XzYra0ca
         lDKMmccDH+dhvyVqHRR/bgZkhjFq8ZG+o4DXz3MV1vkGgM4A7QObOgMcThay9fpRCgSd
         0RjlHwXSxa3kdYsG8d7VwDMmr9gqm4A2xeCmQSxzpzXNqe4uebv6vdzUHJu2x36BtCuq
         1Wcd5fdjxO17H+iki0x/vzW5MHbJpVib8CmoAGFxY+NLPDlpX/dMXbMmyK1+ri5eln3c
         38/VntvbE1HYl06LsuGMT8YP1pTXbnTwyChwuewV+7oFd07fs6Chj86yOFaT2aN0WrlD
         PbMw==
X-Gm-Message-State: AOJu0YwObsTn+VcM1NsZgZs9zQ7DWtJ6o3Vt/BLUARL8qJpcRK7i2ekP
	K9umWEGdYBNj9hkXHeDhUQ2kOA==
X-Google-Smtp-Source: AGHT+IEdPqFLLB97FsJn9HE6PuUCXYD1MUIYJLqs8/8KgotwzZO95QNjFhJZQBPn7vpBWJhUDXeo1w==
X-Received: by 2002:ac2:5234:0:b0:508:264e:2ded with SMTP id i20-20020ac25234000000b00508264e2dedmr24676229lfl.38.1699372552470;
        Tue, 07 Nov 2023 07:55:52 -0800 (PST)
Received: from arnold.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm16579085wmq.11.2023.11.07.07.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:55:51 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net,
	heiko@sntech.de,
	herbert@gondor.apana.org.au,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	sboyd@kernel.org
Cc: ricardo@pardini.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/6] ARM64: dts: rk356x: add crypto node
Date: Tue,  7 Nov 2023 15:55:30 +0000
Message-Id: <20231107155532.3747113-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107155532.3747113-1-clabbe@baylibre.com>
References: <20231107155532.3747113-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both RK3566 and RK3568 have a crypto IP handled by the rk3588 crypto driver so adds a
node for it.

Tested-by: Ricardo Pardini <ricardo@pardini.net>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 0964761e3ce9..c94a1b535c32 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -1070,6 +1070,18 @@ sdhci: mmc@fe310000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe380000 {
+		compatible = "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe380000 0x0 0x2000>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CRYPTO_NS>, <&cru HCLK_CRYPTO_NS>,
+			 <&cru CLK_CRYPTO_NS_CORE>;
+		clock-names = "aclk", "hclk", "core";
+		resets = <&cru SRST_CRYPTO_NS_CORE>;
+		reset-names = "core";
+		status = "okay";
+	};
+
 	i2s0_8ch: i2s@fe400000 {
 		compatible = "rockchip,rk3568-i2s-tdm";
 		reg = <0x0 0xfe400000 0x0 0x1000>;
-- 
2.41.0



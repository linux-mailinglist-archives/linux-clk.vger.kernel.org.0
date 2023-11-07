Return-Path: <linux-clk+bounces-16-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3A7E44B0
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 16:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B56CB20FD5
	for <lists+linux-clk@lfdr.de>; Tue,  7 Nov 2023 15:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E729931A9C;
	Tue,  7 Nov 2023 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lVDSo+hw"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1EC31A8F
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 15:55:52 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3132A478D
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 07:55:52 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso36583005e9.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Nov 2023 07:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699372550; x=1699977350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+UV3k4yizYTMdoa5VrKE6ofk04X3OR5xKj9uFZuHk4=;
        b=lVDSo+hwfrXEtn8u9vZOOnxf4KRs0For6f7dFb4P0JC4AHFlXPHjRSmIXEvmXounHu
         v0uTKkjeXjGatJp3NMBWy/zpdDsSZqwAHvNmOG0qVxAkEMUDtsS/xw948KYJu2Z2ZbSK
         drin7q9Allj8aM68qBi51qemPiud7aGC5hmh3IAs49Ry3Ep0hi3iip4JQA9OMLJesF2t
         vJ0hZDN5rBtlOQOUrmCd3UirooFgQobEr3rhH5NCwisxnwmvQlbJlUtvrzO6e7n/6GVk
         d+E5vpe21xkUYIpfzmNorTEnTpn3gCKuJ59AdVzzFndSc5yvLrDAlHbLKTsaw3rIeDAA
         r1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372550; x=1699977350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+UV3k4yizYTMdoa5VrKE6ofk04X3OR5xKj9uFZuHk4=;
        b=ka3Q6A0SwxU3fM9ovwLYVTSqYLXLcWagUP6Hjy/0bA1YtsTHaG7XRuSfKbKhzwRx4i
         oTjhwNYgi1rtIxcZPkqUsGWHC7S8prCMcXybOqOtnXGNhhubJqjXmEOkU5hyXPSPST+M
         LR92h9KGXoCCuqv3kneu4050sFGjhMnXMiAZJ5XBvMCQVYLDhv+P2JsnfCZz7BoEaDzp
         rtiPTNQLtwBgNBCaO/jiF2+eGklfjzNRPjhGlZO9hmqUZYvaBA6jLJnby7fX3sn9zpMI
         wo1XudHXUWphyukPzJQIoOYbvDip0llVh4XizFoNaGOrzWf1Bp/6Xo6Fuv1p+qD9RU5H
         uxyw==
X-Gm-Message-State: AOJu0YzZNKkuyXLA0TqRec9zp42Oas1VdRv2ob7/49LdlMWw9qfd9ZX4
	rZtJQDTVKNEuyI3EjDygqrpXPw==
X-Google-Smtp-Source: AGHT+IHkZ5GDVZhysvqM4521kZZywfOXQBII4ImWf3CF24yhLceufV+jdRnRjPS4MYfSNa8U4v6jHw==
X-Received: by 2002:a05:600c:548e:b0:405:4daa:6e3d with SMTP id iv14-20020a05600c548e00b004054daa6e3dmr2628006wmb.39.1699372550578;
        Tue, 07 Nov 2023 07:55:50 -0800 (PST)
Received: from arnold.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm16579085wmq.11.2023.11.07.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:55:49 -0800 (PST)
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
Subject: [PATCH 3/6] ARM64: dts: rk3588: add crypto node
Date: Tue,  7 Nov 2023 15:55:29 +0000
Message-Id: <20231107155532.3747113-4-clabbe@baylibre.com>
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

The rk3588 has a crypto IP handled by the rk3588 crypto driver so adds a
node for it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 7064c0e9179f..a2ba5ebec38d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1523,6 +1523,18 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SRST_CRYPTO_CORE>;
+		reset-names = "core";
+		status = "okay";
+	};
+
 	i2s0_8ch: i2s@fe470000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfe470000 0x0 0x1000>;
-- 
2.41.0



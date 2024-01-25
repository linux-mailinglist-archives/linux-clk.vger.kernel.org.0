Return-Path: <linux-clk+bounces-2857-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769283B6C1
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 02:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC9C0280FA5
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 01:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1636FC3;
	Thu, 25 Jan 2024 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CrT3WOLd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E51388
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146744; cv=none; b=gJo3NZ0OzCm3+V8+SiS0o8loEKayje4xatZsdXt8Y8sLySInYFN4TpY7beT+vzl2kqXoiJSwm23Cxeos7jvwkIpV/GVWSLxKJfCsAtjiF69gax9eW8yMT+ETAkScKdvwPseCDS72F7ugP0P0XVNZJsuBZvlZBeUigcNGotgEQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146744; c=relaxed/simple;
	bh=6FIShmpWgOIrxPG+MyJHb07uPDYh/gBRSLhspWB4bvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rjp0QQp7DCBm2Fc/zLZkswDe3/DsNaEdPrqH94muoJLDvU0FQCBq8DG/cyQ6lQ69eYRVD1ZZP/5jbqibQKTGt0hsePUBzTmkrbWYVV9MPbvLkjFLS7EIP9OYCiLf0FT/UO/d84eIHv1t1CEtYUKjUtZ2c2GiIAsgux6t40scNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CrT3WOLd; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dde5d308c6so3537738a34.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 17:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146742; x=1706751542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjPexQC8ty5Ziu/bGc5xDaPIP0Ca5UrAvRlV4O1huCs=;
        b=CrT3WOLdtkIvOGywc49O9A3/mwJv+yDGM//Y1v1hKZsKQgEJViZOovNDjznLdOfunE
         y+Hy0S78y/QH3DhOiFXH2D/53ppnm0hqVBuLDjLNFFynkHLBV1/4S53XsUs/eNVj7B41
         W0VyF6ToTu50GqPRkLJNAUV2esNJ81+ZSXlZql03VWMWZdUnfRsk1HSvX7qMm7f8nY99
         htfCBgM+n3lr53Fsqw/QA2HzA5nDEB+74JiTXSSaILN1PI2o0nmCFQFCGfrB3Vk1h09Z
         ZI6zSlcd5X3LRz7El5R9TU2Y7E2QMAx9mETtNFxmt7LPkXWgaW67CBX/N1wUZQ4XWqBA
         C4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146742; x=1706751542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjPexQC8ty5Ziu/bGc5xDaPIP0Ca5UrAvRlV4O1huCs=;
        b=TXlG33np/74Grh/oDs0nsApCAy96NkacfJ0Xb0asB4PCSqiPPoKaORmytlNsfEeQKw
         fzAQoHLGGUbObEEuWyTgnmWVZ8a5+lyh4x4KuZGkKzUXu+dc4jUj9C8y+TIDhWGoqIdX
         7xpLhR154nDnJVzQJXn3UMPSbS85g2AgVD4l9LmL+IoY+BtlrfLLOKMihQUc5mvSrHsO
         PY9fEftbfgB91na5qbT0UAZx2aam/Qv+DYHG2aj69MxLFRpJz/8yp89Guhv13WhmSvr4
         +qiy2BDDb2dyCXe0Tmd2jG/6mtB/9DvT3uvCgoyP4fKn0hdBfKU0FzAoeeGLzT9IYdFD
         Y4dA==
X-Gm-Message-State: AOJu0Yzxuh4aSj96Az3Jo1XwBiaqEMMP4SDQJ1pMeiftuyFvHaFm1wCM
	Kw6HZgqpiSVzPGTSMMjITDX1vVXAntPEsGkm4mLcEPLqvwR6wsYqtEi22RrBKlE=
X-Google-Smtp-Source: AGHT+IF+y+tlqblJCyThtSQ4rGmzUP9A2lBfd2on5oJmlWIXhHXRv7FokwkLpB+H8no/+5JOqFomyA==
X-Received: by 2002:a05:6830:2806:b0:6e1:367:4485 with SMTP id w6-20020a056830280600b006e103674485mr149294otu.18.1706146741893;
        Wed, 24 Jan 2024 17:39:01 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id dp3-20020a0568300e8300b006dc0414920csm2860585otb.28.2024.01.24.17.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:39:01 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
Date: Wed, 24 Jan 2024 19:38:58 -0600
Message-Id: <20240125013858.3986-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125013858.3986-1-semen.protsenko@linaro.org>
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some USI blocks can be configured as SPI controllers. Add corresponding
SPI nodes to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Sorted pinctrl properties properly

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 618bc674896e..ca257da74b50 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -738,6 +738,24 @@ usi_spi_0: usi@139400c0 {
 				 <&cmu_peri CLK_GOUT_SPI0_IPCLK>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
+
+			spi_0: spi@13940000 {
+				compatible = "samsung,exynos850-spi";
+				reg = <0x13940000 0x30>;
+				interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi0_pins>;
+				pinctrl-names = "default";
+				clocks = <&cmu_peri CLK_GOUT_SPI0_IPCLK>,
+					 <&cmu_peri CLK_GOUT_SPI0_PCLK>;
+				clock-names = "spi_busclk0", "spi";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 5>, <&pdma0 4>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_cmgp0: usi@11d000c0 {
@@ -779,6 +797,24 @@ serial_1: serial@11d00000 {
 				clock-names = "uart", "clk_uart_baud0";
 				status = "disabled";
 			};
+
+			spi_1: spi@11d00000 {
+				compatible = "samsung,exynos850-spi";
+				reg = <0x11d00000 0x30>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi1_pins>;
+				pinctrl-names = "default";
+				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI0_IPCLK>,
+					 <&cmu_cmgp CLK_GOUT_CMGP_USI0_PCLK>;
+				clock-names = "spi_busclk0", "spi";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 12>, <&pdma0 13>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		usi_cmgp1: usi@11d200c0 {
@@ -820,6 +856,24 @@ serial_2: serial@11d20000 {
 				clock-names = "uart", "clk_uart_baud0";
 				status = "disabled";
 			};
+
+			spi_2: spi@11d20000 {
+				compatible = "samsung,exynos850-spi";
+				reg = <0x11d20000 0x30>;
+				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&spi2_pins>;
+				pinctrl-names = "default";
+				clocks = <&cmu_cmgp CLK_GOUT_CMGP_USI1_IPCLK>,
+					 <&cmu_cmgp CLK_GOUT_CMGP_USI1_PCLK>;
+				clock-names = "spi_busclk0", "spi";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 14>, <&pdma0 15>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.39.2



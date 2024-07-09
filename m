Return-Path: <linux-clk+bounces-9337-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A092B98B
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 14:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F06B3287039
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 12:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A080716133E;
	Tue,  9 Jul 2024 12:31:54 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D2160877;
	Tue,  9 Jul 2024 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528314; cv=none; b=Cd/ftLcVv1GWFYxH3upMhNeaVa0txoo2ODQRNLjB2dqmK/1cN54LciDVzUROs8yhbkES/wG+9iERN5IXMueZhno21bbrTtYArcgohQlpYrSAJ3gkX4MILTtScglvEjDqbz/RK3ZZwdQjkIOhsi4ydc9TFf0Rvdp3x0l9iyfQrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528314; c=relaxed/simple;
	bh=tmZ6Uxzkf014Hxr8KQ0Tk9d1gGCwXt2cJ4n2Co2Nmz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EPVTfCDqlTME06dOkF8xLI9IcjBF47Mtl4othpSiLaiy2AbNuP/CkzRgYa1ZN7NofJYcBNvSIOHo4gjiDcbFDugoY5VbzbJPiDv8v89jDsEO8uL72KMV782q6kZy9xOpGGbz/JmNdAEDYkwP5B5ZrKRoqcZyTrD0JZd5g+P6Scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sRA0U-00074P-Or; Tue, 09 Jul 2024 14:31:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 4/6] arm64: dts: rockchip: use clock-generator for pcie-refclk on rk3588-jaguar
Date: Tue,  9 Jul 2024 14:31:19 +0200
Message-Id: <20240709123121.1452394-5-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709123121.1452394-1-heiko@sntech.de>
References: <20240709123121.1452394-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using a combination of fixed clock and gpio-gate clock works but does
not describe the actual hardware. Use the new clock-generator binding
to describe this in a nicer way.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 71999f4f170af..b3c2aaedacf57 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -88,21 +88,16 @@ led-1 {
 	 * 100MHz reference clock for PCIe peripherals from PI6C557-05BLE
 	 * clock generator.
 	 * The clock output is gated via the OE pin on the clock generator.
-	 * This is modeled as a fixed-clock plus a gpio-gate-clock.
 	 */
-	pcie_refclk_gen: pcie-refclk-gen-clock {
-		compatible = "fixed-clock";
+	pcie_refclk: pcie-clock-generator {
+		compatible = "diodes,pi6c557-05b", "clock-generator";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
-	};
-
-	pcie_refclk: pcie-refclk-clock {
-		compatible = "gpio-gate-clock";
-		clocks = <&pcie_refclk_gen>;
-		#clock-cells = <0>;
+		clock-output-names = "pcie3_refclk";
 		enable-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>; /* PCIE30X4_CLKREQN_M0 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie30x4_clkreqn_m0>;
+		vdd-supply = <&vcca_3v3_s0>;
 	};
 
 	pps {
-- 
2.39.2



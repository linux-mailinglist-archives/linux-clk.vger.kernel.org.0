Return-Path: <linux-clk+bounces-9336-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B392B987
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 14:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5901F2409A
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jul 2024 12:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263F715DBB9;
	Tue,  9 Jul 2024 12:31:51 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607C158203;
	Tue,  9 Jul 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528311; cv=none; b=gFFpE5+U8frQgF5gFPy+SiztGBxEXFCzbJFrpkNKejEtPpU6BVPWylq12InNefCmafib4qLOYVFoViejjjQUyY69ejb7XfpKnI493wPwNazkIJbhm3taac96a0Q5SP/rwdDf/pI6B/t6r5G6KkFjs4NF83I0WAuuwPAinKL70uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528311; c=relaxed/simple;
	bh=+q/lfmSkbMx1KbBQRYdQ9l6EhpiAU0lwIrUJmWJac04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tmrl6LAriqPW4i2sB77KwD6SVU1tJMD6yBRky/O7mkKDpNTf5UhF2IGQUCr5WXWRgMnoUnwsonqoK/SP//caWAJE1dOky3lWmw0d6fLrclCmi8Q7Fhcc7iqS6fQ/5PA+hIVAJZ+LoY0C6GRdX1cD/wsassn+xIryFswrM+0hVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sRA0V-00074P-Sp; Tue, 09 Jul 2024 14:31:43 +0200
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
Subject: [PATCH 6/6] arm64: dts: rockchip: add pinctrl for clk-generator gpio on rk3588-tiger
Date: Tue,  9 Jul 2024 14:31:21 +0200
Message-Id: <20240709123121.1452394-7-heiko@sntech.de>
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

Having pinctrl entries defined for used gpios is helpful as it makes
sure the pin isn't used anywhere else.

The somewhat similar rk3588-jaguar board has a pinctrl entry already,
so add the same for rk3588-tiger.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 4c5be356fa7fe..fb5f1fa25fb9e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -56,6 +56,8 @@ pcie_refclk: pcie-clock-generator {
 		clock-frequency = <100000000>;
 		clock-output-names = "pcie3_refclk";
 		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie30x4_clkreqn_m1_l>;
 		vdd-supply = <&vcca_3v3_s0>;
 	};
 
@@ -339,6 +341,12 @@ module_led_pin: module-led-pin {
 		};
 	};
 
+	pcie30x4 {
+		pcie30x4_clkreqn_m1_l: pcie30x4-clkreqn-m1-l {
+			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb3 {
 		usb3_id: usb3-id {
 			rockchip,pins =
-- 
2.39.2



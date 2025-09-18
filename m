Return-Path: <linux-clk+bounces-26941-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72477B3BCFC
	for <lists+linux-clk@lfdr.de>; Fri, 29 Aug 2025 15:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F33566E40
	for <lists+linux-clk@lfdr.de>; Fri, 29 Aug 2025 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F63320392;
	Fri, 29 Aug 2025 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QHymAVN5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBB31E110
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756475835; cv=none; b=Wsogo1K2NZdMmTi/Ajapb0bYp0o9VmmOv6UGRU/NBsjm0hj2uIM9/LfGI8C3x7eNeTiNmLrU8BLfcRWLvGcFAWjbKo/un1QkZAlbcwGXXhxAYrsgoBmA59YEQqGrxSBKR85prNzliyNzUX3oBkTrwTnQRhAvz33umsOZbGEF1Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756475835; c=relaxed/simple;
	bh=vFyDBnfP53DD4DU5Rcby9ynhNajWyoGdaF1Ez5xb7KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=tGIf7DRkn9rGuYrH9dgxHN8CxIwZIn73BfMTy8dMN0kMwMCWCuPNP3ocAZU7bRIZOCNsI1VgsB8D4j8I142uJHhN3d3IeZVpUCCBzTCNghjZ03wGCkxP5ZZ7VEXKqhZixrebp1OyMXOyFhWUSOsAWRCubO8pRuIYCuGEbu+x6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QHymAVN5; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250829135710epoutp036bd0628b6b931adcd76d94ae9c04edd0~gQXYWzRUJ2845528455epoutp03D
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 13:57:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250829135710epoutp036bd0628b6b931adcd76d94ae9c04edd0~gQXYWzRUJ2845528455epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475830;
	bh=zsNJV5XBOk2XFH4BrVvHECkoQB0m4MGPZolqolvJYUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHymAVN5MXFJx36XUG0nkx5WaCqHP3o9HFl7EiZIbfgAVN9es+/q00yxYPY2HpzjA
	 ECK1Hl51NW2+S6I80Wx7AisXwVB3jOd68XSIlyISflyjfFwmH5+Eln6N6NFEFc0UT+
	 wruBwzN9SiNf8lxj87cWtNzNqV3JzrJualkreoaM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829135709epcas5p23ba392fdce0bc20be5002ea41052af04~gQXX6jm0w1958719587epcas5p2e;
	Fri, 29 Aug 2025 13:57:09 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0FJ70Gjz6B9m5; Fri, 29 Aug
	2025 13:57:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f~gQXWnylAw0508305083epcas5p1J;
	Fri, 29 Aug 2025 13:57:08 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135706epsmtip25ca5f73ca9f7b0fde2d6f80c634f7b01~gQXVB7a6l1416014160epsmtip23;
	Fri, 29 Aug 2025 13:57:06 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 2/2] arm64: dts: fsd: Fix Clock handle for WDT
Date: Fri, 29 Aug 2025 19:26:43 +0530
Message-ID: <20250829135643.105406-3-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829135643.105406-1-v.pavani@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f
References: <20250829135643.105406-1-v.pavani@samsung.com>
	<CGME20250829135708epcas5p1b62d44f8a712b1c865fd82d26e89896f@epcas5p1.samsung.com>

FSD SoC WDT has few changes when compared to exynos7 interms of Clocks,
PMU register bits for each cluster. So use "tesla,fsd-wdt"
compatibility for using correct driver data.
FSD supports 2 Clocks for WDT (PCLK and CLK).
- use fin_pll source Clock for all timer related calculations.
- use bus Clock (IMEM_WDT0_IPCLKPORT_PCLK) to gate/ungate the register
interface. Update both as per WDT UM.

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..ff031a630f10 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -624,30 +624,36 @@ pmu_system_controller: system-controller@11400000 {
 		};
 
 		watchdog_0: watchdog@100a0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100a0000 0x0 0x100>;
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT0_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <0>;
 		};
 
 		watchdog_1: watchdog@100b0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100b0000 0x0 0x100>;
 			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT1_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <1>;
 		};
 
 		watchdog_2: watchdog@100c0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt";
 			reg = <0x0 0x100c0000 0x0 0x100>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
+			clocks = <&clock_imem IMEM_WDT2_IPCLKPORT_PCLK>,
+				<&fin_pll>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,cluster-index = <2>;
 		};
 
 		pwm_0: pwm@14100000 {
-- 
2.49.0



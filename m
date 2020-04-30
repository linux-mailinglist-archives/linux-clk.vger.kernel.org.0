Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4D91BF749
	for <lists+linux-clk@lfdr.de>; Thu, 30 Apr 2020 13:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgD3L5S (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Apr 2020 07:57:18 -0400
Received: from plaes.org ([188.166.43.21]:37054 "EHLO plaes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD3L5R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Apr 2020 07:57:17 -0400
Received: from localhost (unknown [IPv6:2001:1530:1000:d397:940e:6b9e:3deb:3])
        by plaes.org (Postfix) with ESMTPSA id 607F840020;
        Thu, 30 Apr 2020 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plaes.org; s=mail;
        t=1588247835; bh=4Nyq2+q+6gFl8xdUXrX7ogdDuJtGtGSha4s+xAB0G6E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GIzah/igz/6ft4ru3lV5D5c3bsMXMumCwGjWVJaI52sdUTMGYdE8+nW3NvTcUXTBB
         9gHwzsr6ftIAG7Q4HcwQ8UHdsKsnzCqqV0vc4SlkYprADklbnLZ/6afQfW2DFxxdg2
         NXCaKOA87yuer1mL2E3sQSBXw88I2rWvjNaAYJMkn7/81ADG33H0F2tUPUkotOmWs0
         d8kPVN/4VcD3181OtT2fj4JEW/oMV0iKkycnAoxdmQxgmr9PaSOXLgdR3pCNArXni+
         LKBy/4Bij51sIQEDhKHo+jUBS1ERZYYLM4JXkubmax7eXXagYwcCDlDgOuXEWI4qJp
         41rfFL+pHDHBw==
From:   Priit Laes <plaes@plaes.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Priit Laes <plaes@plaes.org>
Subject: [PATCH v3 5/6] ARM: dts: sun7i: Use syscon-based implementation for gmac
Date:   Thu, 30 Apr 2020 14:57:01 +0300
Message-Id: <20200430115702.5768-6-plaes@plaes.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430115702.5768-1-plaes@plaes.org>
References: <20200430115702.5768-1-plaes@plaes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use syscon-based approach to access gmac clock configuration
register, instead of relying on a custom clock driver.

As a bonus, we can now drop the custom clock implementation
and dummy clocks making sun7i fully CCU-compatible.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 36 +++-----------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index ffe1d10a1a84..750962a94fad 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -219,37 +219,6 @@ osc32k: clk-32k {
 			clock-frequency = <32768>;
 			clock-output-names = "osc32k";
 		};
-
-		/*
-		 * The following two are dummy clocks, placeholders
-		 * used in the gmac_tx clock. The gmac driver will
-		 * choose one parent depending on the PHY interface
-		 * mode, using clk_set_rate auto-reparenting.
-		 *
-		 * The actual TX clock rate is not controlled by the
-		 * gmac_tx clock.
-		 */
-		mii_phy_tx_clk: clk-mii-phy-tx {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <25000000>;
-			clock-output-names = "mii_phy_tx";
-		};
-
-		gmac_int_tx_clk: clk-gmac-int-tx {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <125000000>;
-			clock-output-names = "gmac_int_tx";
-		};
-
-		gmac_tx_clk: clk@1c20164 {
-			#clock-cells = <0>;
-			compatible = "allwinner,sun7i-a20-gmac-clk";
-			reg = <0x01c20164 0x4>;
-			clocks = <&mii_phy_tx_clk>, <&gmac_int_tx_clk>;
-			clock-output-names = "gmac_tx";
-		};
 	};
 
 
@@ -1511,11 +1480,12 @@ mali: gpu@1c40000 {
 
 		gmac: ethernet@1c50000 {
 			compatible = "allwinner,sun7i-a20-gmac";
+			syscon = <&ccu>;
 			reg = <0x01c50000 0x10000>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-			clocks = <&ccu CLK_AHB_GMAC>, <&gmac_tx_clk>;
-			clock-names = "stmmaceth", "allwinner_gmac_tx";
+			clocks = <&ccu CLK_AHB_GMAC>;
+			clock-names = "stmmaceth";
 			snps,pbl = <2>;
 			snps,fixed-burst;
 			snps,force_sf_dma_mode;
-- 
2.26.2


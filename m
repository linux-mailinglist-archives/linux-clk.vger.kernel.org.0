Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F142D7A3
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2019 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfE2IWM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 May 2019 04:22:12 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11412 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfE2IWM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 04:22:12 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee41330000>; Wed, 29 May 2019 01:22:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:22:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 01:22:11 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:22:11 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:22:11 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee41310002>; Wed, 29 May 2019 01:22:10 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 8/8] arm64: tegra: Add external memory controller node for Tegra210
Date:   Wed, 29 May 2019 16:21:39 +0800
Message-ID: <20190529082139.5581-9-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529082139.5581-1-josephl@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118131; bh=Abu9+xNYNnzs1jtOHYXGFgLqFOQAdhULT1UYXsUjjjs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Xy2AqPWd8rCp5dCumRjNKedZ+IoAjLSAHLFfxxoI8Gynn+0HVM4EzurieQdBuYrrx
         J9ED9t3J3y0lQ1vhm72aK99foTCzWg7CWRFM5y68BRSgl6XZYHg0hDK+hmBloi/bkJ
         L4Q0onodSn/jp9xO2mrp0XtqZK/hokua9UDhuaVN0sWTTDuczMq3shDm6L0r1BAnDk
         GSBzl5OAXcfbTbY5sTOwUm+nvhwCkhtMLOzeB1QA+y5vHiZcZx8l+vOV9ifoUXELcY
         16EjzwXpB0bNrcIjLYQC0s/Vzv5zPpey5jPuf+di2nNPHWjqLrFbk9U61rNXn0U8Yk
         BjZGYDgce0WGw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add external memory controller (EMC) node for Tegra210

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v4:
- no change.
v3:
- apply memory-region for emc_table. And add reserved-memory node with
  it.
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index bc71ef8f9a09..b9ccfee39ed2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -872,6 +872,27 @@
 		#iommu-cells =3D <1>;
 	};
=20
+	external-memory-controller@7001b000 {
+		compatible =3D "nvidia,tegra210-emc";
+		reg =3D <0x0 0x7001b000 0x0 0x1000>,
+		      <0x0 0x7001e000 0x0 0x1000>,
+		      <0x0 0x7001f000 0x0 0x1000>;
+		clocks =3D <&tegra_car TEGRA210_CLK_EMC>,
+			 <&tegra_car TEGRA210_CLK_PLL_M>,
+			 <&tegra_car TEGRA210_CLK_PLL_C>,
+			 <&tegra_car TEGRA210_CLK_PLL_P>,
+			 <&tegra_car TEGRA210_CLK_CLK_M>,
+			 <&tegra_car TEGRA210_CLK_PLL_M_UD>,
+			 <&tegra_car TEGRA210_CLK_PLL_MB_UD>,
+			 <&tegra_car TEGRA210_CLK_PLL_MB>,
+			 <&tegra_car TEGRA210_CLK_PLL_P_UD>;
+		clock-names =3D "emc", "pll_m", "pll_c", "pll_p", "clk_m",
+			      "pll_m_ud", "pll_mb_ud", "pll_mb", "pll_p_ud";
+		interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		memory-region =3D <&emc_table>;
+		nvidia,memory-controller =3D <&mc>;
+	};
+
 	sata@70020000 {
 		compatible =3D "nvidia,tegra210-ahci";
 		reg =3D <0x0 0x70027000 0x0 0x2000>, /* AHCI */
@@ -1431,6 +1452,18 @@
 		};
 	};
=20
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		emc_table: emc-table@8be00000 {
+			compatible =3D "nvidia,tegra210-emc-table";
+			reg =3D <0x0 0x8be00000 0x0 0x10000>;
+			status =3D "disabled";
+		};
+	};
+
 	timer {
 		compatible =3D "arm,armv8-timer";
 		interrupts =3D <GIC_PPI 13
--=20
2.21.0


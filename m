Return-Path: <linux-clk+bounces-18251-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA8A3A572
	for <lists+linux-clk@lfdr.de>; Tue, 18 Feb 2025 19:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E85173075
	for <lists+linux-clk@lfdr.de>; Tue, 18 Feb 2025 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284E12356BA;
	Tue, 18 Feb 2025 18:27:00 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4C2356B3
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739903220; cv=none; b=G7ADCGqDTO6jfVdgK5lF2kYxWw6bO3wF57sU54VRfCx6ac5hPncH9LangO6WnKZjwMOCj8jgNOqyVkuB3E9W9LDBDR7tS3mX5zY27vnScCqMWb6miJI3ln1B7XFc3qQNcJLVPNqYo2Z8vCMnU7z3eifz5x+2A7i7ffDVY0/wdnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739903220; c=relaxed/simple;
	bh=Juc2Akbil/KjIj7GVAhkfHO1s/KyIG4/hSAIW20NKvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOilmg0HfKIL/26p9NO/FWCReKtU6fqoqM/YAIEIZ6Ufw4V7iCK8gl6OMvQcTzA7tDhuS6NCdD7hZpD0qyEAVtyXAuZ3OqR2KZwnaJo2UzNhaN9EAb5ZSbD298OT4OfOUC3Le764l1WI+bzANg3D4z0w9xQYqb2GUEF89t/k5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSIy-0006Bk-0v; Tue, 18 Feb 2025 19:26:48 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSIx-001dVB-1e;
	Tue, 18 Feb 2025 19:26:47 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSIx-00A9Hm-1C;
	Tue, 18 Feb 2025 19:26:47 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 18 Feb 2025 19:26:42 +0100
Subject: [PATCH v4 2/6] arm64: dts: imx8mp: Add optional nominal drive mode
 DTSI
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-imx8m-clk-v4-2-b7697dc2dcd0@pengutronix.de>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
In-Reply-To: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the device tree for
the i.MX8MP configures some clocks at frequencies that are only validated
for overdrive mode, i.e. when VDD_SOC is 950 mV.

Boards may want to run their SoC at the lower voltage of 850 mV though
to reduce heat generation and power usage. For this to work, clock rates
need to adhere to the limits of the nominal drive mode.

Add an optional DTSI file which can be included by various boards to run
in this mode.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 63 +++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f9a82a663033a1dfb72163eebb62e4aee66cee2f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Pengutronix, Ahmad Fatoum <kernel@pengutronix.de>
+ */
+
+&clk {
+	assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
+			  <&clk IMX8MP_CLK_A53_CORE>,
+			  <&clk IMX8MP_SYS_PLL3>,
+			  <&clk IMX8MP_CLK_NOC>,
+			  <&clk IMX8MP_CLK_NOC_IO>,
+			  <&clk IMX8MP_CLK_GIC>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_ARM_PLL_OUT>,
+				 <0>,
+				 <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL3_OUT>,
+				 <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <0>, <0>,
+			       <600000000>,
+			       <800000000>,
+			       <600000000>,
+			       <400000000>;
+};
+
+&pgc_hdmimix {
+	assigned-clocks = <&clk IMX8MP_CLK_HDMI_AXI>,
+			  <&clk IMX8MP_CLK_HDMI_APB>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL1_133M>;
+	assigned-clock-rates = <400000000>, <133000000>;
+};
+
+&pgc_hsiomix {
+	assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <400000000>;
+};
+
+&pgc_gpumix {
+	assigned-clocks = <&clk IMX8MP_CLK_GPU_AXI>,
+			  <&clk IMX8MP_CLK_GPU_AHB>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL3_OUT>,
+				 <&clk IMX8MP_SYS_PLL3_OUT>;
+	assigned-clock-rates = <600000000>, <300000000>;
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
+			  <&clk IMX8MP_CLK_MEDIA_APB>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
+			  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
+			  <&clk IMX8MP_CLK_MEDIA_ISP>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_VIDEO_PLL1_OUT>,
+				 <&clk IMX8MP_VIDEO_PLL1_OUT>,
+				 <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <400000000>, <200000000>,
+			       <0>, <0>, <400000000>,
+			       <1039500000>;
+};

-- 
2.39.5



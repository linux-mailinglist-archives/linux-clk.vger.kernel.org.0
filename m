Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0774348AA9
	for <lists+linux-clk@lfdr.de>; Thu, 25 Mar 2021 08:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCYHwi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Mar 2021 03:52:38 -0400
Received: from st43p00im-ztbu10063701.me.com ([17.58.63.178]:58534 "EHLO
        st43p00im-ztbu10063701.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230155AbhCYHwK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 03:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1616658727; bh=Q2D+GfnSz9xlfYItrPsH8bhVvd92JdmC7OMWqbsn6Zw=;
        h=From:To:Subject:Date:Message-Id;
        b=JB2a7Vk57hbM5PusKVwy3/NV3OcG7MZcxgnYPs+qUZlWw8NBWuvo5WteFvM1fOHeE
         sxaMSAHk6hHXHCBOC7GH+YJFbvFKQ/Fnglw4x75ZXd3kZh5PTDIpcdXTWQZTGO8lgQ
         UKCi8qMFGQw/ePw2giP/pXqASF1L6MT9uT4B8D1cPGVaRSQE189/ZPn1WjvMOQ9+LY
         wl7SN6PSFWh+9vJ6euQ5ONDH0xv3x3YDk9kFopOT3Q0ksQnk7YLFYdDsHXakk8oR/V
         t4tYT6MCBMjZfSXiPKcxudH0d2t/aRDK1P+8S0EJ1puAfTjkfj5TRH40AX3N0gYzPk
         gNYBujYbYuKFw==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztbu10063701.me.com (Postfix) with ESMTPSA id 904259A03E7;
        Thu, 25 Mar 2021 07:52:06 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH v2 13/16] ARM: dts: sti: update clkgen-pll entries in stih418-clock
Date:   Thu, 25 Mar 2021 08:50:15 +0100
Message-Id: <20210325075018.6598-14-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325075018.6598-1-avolmat@me.com>
References: <20210325075018.6598-1-avolmat@me.com>
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.369,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-03-24=5F14:2021-03-24=5F02,2021-03-24=5F14,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250059
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clkgen-pll driver now embed the clock names (assuming the
right compatible is used). Remove all clock-output-names property
and update when necessary the compatible.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih418-clock.dtsi | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index 35d12979cdf4..d628e656458d 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -39,8 +39,6 @@
 				compatible = "st,stih418-clkgen-plla9";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clockgen-a9-pll-odf";
 			};
 		};
 
@@ -75,11 +73,9 @@
 
 			clk_s_a0_pll: clk-s-a0-pll {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0";
+				compatible = "st,clkgen-pll0-a0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-a0-pll-ofd-0";
 			};
 
 			clk_s_a0_flexgen: clk-s-a0-flexgen {
@@ -111,20 +107,16 @@
 
 			clk_s_c0_pll0: clk-s-c0-pll0 {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll0";
+				compatible = "st,clkgen-pll0-c0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-c0-pll0-odf-0";
 			};
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
 				#clock-cells = <1>;
-				compatible = "st,clkgen-pll1";
+				compatible = "st,clkgen-pll1-c0";
 
 				clocks = <&clk_sysin>;
-
-				clock-output-names = "clk-s-c0-pll1-odf-0";
 			};
 
 			clk_s_c0_flexgen: clk-s-c0-flexgen {
-- 
2.17.1


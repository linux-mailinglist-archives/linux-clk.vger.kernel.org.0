Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86947520BFF
	for <lists+linux-clk@lfdr.de>; Tue, 10 May 2022 05:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbiEJDaX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 May 2022 23:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235400AbiEJDaV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 23:30:21 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0AE6F57140;
        Mon,  9 May 2022 20:26:07 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id C2BFB1C811BA;
        Tue, 10 May 2022 11:26:06 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 10 May
 2022 11:26:06 +0800
Received: from localhost.localdomain (172.19.1.47) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 10 May 2022 11:26:06 +0800
From:   Jacky Huang <ychuang3@nuvoton.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <ychuang570808@gmail.com>
CC:     <robh+dt@kernel.org>, <sboyd@kernel.org>, <krzk+dt@kernel.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <soc@kernel.org>, <cfli0@nuvoton.com>,
        Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH V4 4/5] arm64: Kconfig: nuvoton: Introduce CONFIG_ARCH_NUVOTON
Date:   Tue, 10 May 2022 11:25:57 +0800
Message-ID: <20220510032558.10304-5-ychuang3@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510032558.10304-1-ychuang3@nuvoton.com>
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds a Kconfig option to toggle support for ARMv8 based
Nuvoton SoCs.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 arch/arm64/Kconfig.platforms | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 30b123cde02c..a6a232b9bda8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -203,6 +203,16 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_NUVOTON
+	bool "Nuvoton Platforms"
+	select PINCTRL
+	select PM
+	select GPIOLIB
+	select SOC_BUS
+	help
+	  This enables support for the ARMv8 based Nuvoton SoCs such
+	  as MA35D1.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.30.2


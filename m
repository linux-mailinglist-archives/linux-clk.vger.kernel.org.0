Return-Path: <linux-clk+bounces-448-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D747F47AF
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 14:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0672E2810D4
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 13:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E4C54BC4;
	Wed, 22 Nov 2023 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wVhEuLx9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421B3193;
	Wed, 22 Nov 2023 05:23:21 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AMD7TjJ013930;
	Wed, 22 Nov 2023 14:22:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=1qGFaBcs+OGg0vqscD04cfo2vPPfTvTMkHJAI0v67YY=; b=wV
	hEuLx9Xs6w6mqPDY3CLBI0sQsjOLBPr2sqYlYAieeljcGWfak9zoagiDxqMOVxqN
	RzWfR3eg10SFu72uJJrhdFjFzniFXQ1zHA3/WLNIFN0iudf3RsuNnC609hBAeEVL
	6Oi06LJEt8+bOnurCoNowMPENbHS5yiAcHSNdojLz5yRNziLH5HJ/YyziKXb9LPY
	V8/U6XnJm5VghVCcswyVKls55jYHG2uprsg4Lp4U2ijc1TUsucbYXdUFoVuQeFXd
	SJlctl+Gy64hKx8z5d6PolYP7clwM85dEvW5uItxxWUXf5UDnvBYoe7tlLR68/47
	03qauN6RSM/J9FmazPhg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ugwu3xn4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:22:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1387010003E;
	Wed, 22 Nov 2023 14:22:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09FA722A6C2;
	Wed, 22 Nov 2023 14:22:27 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 22 Nov
 2023 14:22:26 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] clk: stm32mp1: move stm32mp1 clock driver into stm32 directory
Date: Wed, 22 Nov 2023 14:21:52 +0100
Message-ID: <20231122132156.158103-2-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122132156.158103-1-gabriel.fernandez@foss.st.com>
References: <20231122132156.158103-1-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Move all STM32MP clock drivers into same directory (stm32).

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/Kconfig                    | 11 +---------
 drivers/clk/Makefile                   |  1 -
 drivers/clk/stm32/Kconfig              | 29 ++++++++++++++++++++++++++
 drivers/clk/stm32/Makefile             |  1 +
 drivers/clk/{ => stm32}/clk-stm32mp1.c |  0
 5 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/stm32/Kconfig
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (100%)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c30d0d396f7a..50af5fc7f570 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -414,16 +414,6 @@ config COMMON_CLK_VC7
 	  Renesas Versaclock7 is a family of configurable clock generator
 	  and jitter attenuator ICs with fractional and integer dividers.
 
-config COMMON_CLK_STM32MP135
-	def_bool COMMON_CLK && MACH_STM32MP13
-	help
-	  Support for stm32mp135 SoC family clocks
-
-config COMMON_CLK_STM32MP157
-	def_bool COMMON_CLK && MACH_STM32MP157
-	help
-	  Support for stm32mp157 SoC family clocks
-
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
@@ -504,6 +494,7 @@ source "drivers/clk/starfive/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
+source "drivers/clk/stm32/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index ed71f2e0ee36..14fa8d4ecc1f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -70,7 +70,6 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
-obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
new file mode 100644
index 000000000000..3c8493a94a11
--- /dev/null
+++ b/drivers/clk/stm32/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# common clock support for STMicroelectronics SoC family.
+
+menuconfig COMMON_CLK_STM32MP
+	bool "Clock support for common STM32MP clocks"
+	depends on ARCH_STM32 || COMPILE_TEST
+	default y
+	select RESET_CONTROLLER
+	help
+	  Support for STM32MP SoC family clocks.
+
+if COMMON_CLK_STM32MP
+
+config COMMON_CLK_STM32MP135
+	bool "Clock driver for stm32mp13x clocks"
+	depends on ARM || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp13x SoC family clocks.
+
+config COMMON_CLK_STM32MP157
+	bool "Clock driver for stm32mp15x clocks"
+	depends on ARM || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp15x SoC family clocks.
+
+endif
+
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 95bd2230bba0..c154ef3e88f9 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
similarity index 100%
rename from drivers/clk/clk-stm32mp1.c
rename to drivers/clk/stm32/clk-stm32mp1.c
-- 
2.25.1



Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA853046B0
	for <lists+linux-clk@lfdr.de>; Tue, 26 Jan 2021 19:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391088AbhAZRVk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Jan 2021 12:21:40 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41666 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730085AbhAZJFd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 04:05:33 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10Q8tdYR000542;
        Tue, 26 Jan 2021 10:04:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=kRCOrBeFGjNMGabv3jnFxPA/ESyauEQxaJvQYb9duZA=;
 b=k4Yp9VUvvFZcZ24vb2fNsOgkTyE8tyH8MguISDncLdyKHf2BfB7tV8dPtwTYuOPCLOy1
 hlwE+Y7N8+UVZoUcIFCxMiBfDbIFFNiaW3aBf0jQyNY4YTNcJjNOZtJNrKczP0oTyaIG
 Qo+fX4yUWFYaO08zMpRfil9DeFBwS2DdWHrK/OEa6ijWRNmm/nAZAxEofUHM7GotKiZ+
 999cS52om6EPYC5D8G+yIW2JrgwcD0ITuJUL5d/y7KWd/T+BHb17FvGvmMva4XrZhH1b
 IXF/pGv6en3lyxWbAD7qE68xO/TthVIyrorLwBJOKyscQIa4GIFDalrxICNfpuV4IOlt aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368c15qgjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 10:04:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5815D10002A;
        Tue, 26 Jan 2021 10:04:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 412832288C8;
        Tue, 26 Jan 2021 10:04:40 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Jan 2021 10:04:39
 +0100
From:   <gabriel.fernandez@foss.st.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Etienne Carriere <etienne.carriere@st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        <marex@denx.de>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/14] clk: stm32mp1: new compatible for secure RCC support
Date:   Tue, 26 Jan 2021 10:01:16 +0100
Message-ID: <20210126090120.19900-11-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_06:2021-01-25,2021-01-26 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Platform STM32MP1 can be used in configuration where some clock
resources cannot be accessed by Linux kernel when executing in non-secure
state of the CPU(s).
In such configuration, the RCC clock driver must not register clocks
it cannot access.
They are expected to be registered from another clock driver such
as the SCMI clock driver.
This change uses specific compatible string "st,stm32mp1-rcc-secure"
to specify RCC clock driver configuration where RCC is secure.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/Kconfig        |  10 ++++
 drivers/clk/clk-stm32mp1.c | 101 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff506c..52e9cf36731c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -334,6 +334,16 @@ config COMMON_CLK_STM32MP157
 	help
 	  Support for stm32mp157 SoC family clocks
 
+config COMMON_CLK_STM32MP157_SCMI
+	bool "stm32mp157 Clock driver with Trusted Firmware"
+	depends on COMMON_CLK_STM32MP157
+	select COMMON_CLK_SCMI
+	select ARM_SCMI_PROTOCOL
+	default y
+	help
+	  Support for stm32mp157 SoC family clocks with Trusted Firmware using
+	  SCMI protocol.
+
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 25e3f272344c..132e1dd42dbd 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -2051,11 +2051,61 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 		  _DIV(RCC_DBGCFGR, 0, 3, 0, ck_trace_div_table)),
 };
 
+static const u32 stm32mp1_clock_secured[] = {
+	CK_HSE,
+	CK_HSI,
+	CK_CSI,
+	CK_LSI,
+	CK_LSE,
+	PLL1,
+	PLL2,
+	PLL1_P,
+	PLL2_P,
+	PLL2_Q,
+	PLL2_R,
+	CK_MPU,
+	CK_AXI,
+	SPI6,
+	I2C4,
+	I2C6,
+	USART1,
+	RTCAPB,
+	TZC1,
+	TZC2,
+	TZPC,
+	IWDG1,
+	BSEC,
+	STGEN,
+	GPIOZ,
+	CRYP1,
+	HASH1,
+	RNG1,
+	BKPSRAM,
+	RNG1_K,
+	STGEN_K,
+	SPI6_K,
+	I2C4_K,
+	I2C6_K,
+	USART1_K,
+	RTC,
+};
+
+static bool stm32_check_security(const struct clock_config *cfg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(stm32mp1_clock_secured); i++)
+		if (cfg->id == stm32mp1_clock_secured[i])
+			return true;
+	return false;
+}
+
 struct stm32_rcc_match_data {
 	const struct clock_config *cfg;
 	unsigned int num;
 	unsigned int maxbinding;
 	u32 clear_offset;
+	bool (*check_security)(const struct clock_config *cfg);
 };
 
 static struct stm32_rcc_match_data stm32mp1_data = {
@@ -2065,11 +2115,23 @@ static struct stm32_rcc_match_data stm32mp1_data = {
 	.clear_offset	= RCC_CLR,
 };
 
+static struct stm32_rcc_match_data stm32mp1_data_secure = {
+	.cfg		= stm32mp1_clock_cfg,
+	.num		= ARRAY_SIZE(stm32mp1_clock_cfg),
+	.maxbinding	= STM32MP1_LAST_CLK,
+	.clear_offset	= RCC_CLR,
+	.check_security = &stm32_check_security
+};
+
 static const struct of_device_id stm32mp1_match_data[] = {
 	{
 		.compatible = "st,stm32mp1-rcc",
 		.data = &stm32mp1_data,
 	},
+	{
+		.compatible = "st,stm32mp1-rcc-secure",
+		.data = &stm32mp1_data_secure,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32mp1_match_data);
@@ -2229,6 +2291,9 @@ static int stm32_rcc_clock_init(struct device *dev, void __iomem *base,
 		hws[n] = ERR_PTR(-ENOENT);
 
 	for (n = 0; n < data->num; n++) {
+		if (data->check_security && data->check_security(&data->cfg[n]))
+			continue;
+
 		err = stm32_register_hw_clk(dev, clk_data, base, &rlock,
 					    &data->cfg[n]);
 		if (err) {
@@ -2296,11 +2361,45 @@ static int stm32mp1_rcc_init(struct device *dev)
 	return ret;
 }
 
+static int get_clock_deps(struct device *dev)
+{
+	static const char * const clock_deps_name[] = {
+		"hsi", "hse", "csi", "lsi", "lse",
+	};
+	size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
+	struct clk **clk_deps;
+	int i;
+
+	clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
+	if (!clk_deps)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(clock_deps_name); i++) {
+		struct clk *clk = of_clk_get_by_name(dev_of_node(dev),
+						     clock_deps_name[i]);
+
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EINVAL && PTR_ERR(clk) != -ENOENT)
+				return PTR_ERR(clk);
+		} else {
+			/* Device gets a reference count on the clock */
+			clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 static int stm32mp1_rcc_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int ret = get_clock_deps(dev);
+
+	if (!ret)
+		ret = stm32mp1_rcc_init(dev);
 
-	return stm32mp1_rcc_init(dev);
+	return ret;
 }
 
 static int stm32mp1_rcc_clocks_remove(struct platform_device *pdev)
-- 
2.17.1


Return-Path: <linux-clk+bounces-626-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117707FBF88
	for <lists+linux-clk@lfdr.de>; Tue, 28 Nov 2023 17:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D951C20CA5
	for <lists+linux-clk@lfdr.de>; Tue, 28 Nov 2023 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BC658118;
	Tue, 28 Nov 2023 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XFXmZCbT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7B8D6;
	Tue, 28 Nov 2023 08:49:33 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ASESCr1023439;
	Tue, 28 Nov 2023 17:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=+FBqqQBhdYWt2/1e7fszfSaeyVgzQ15Wn2YoYk3WAfI=; b=XF
	XmZCbTDr1BjYMXbEhOEYxidyC1ACEU//2i8Cp+soz0HpvJdb+28SCPpLolc1vPT2
	6Q/0UEGH+oOGzGasckx9jBzVTAd70Iqid0CQfselgNvDIo6JvpIycFbyaHveo/Hc
	8CZDwteyMDjZf6jJNTHqntlCxWWkclGGipepdcLMzZpnC9hverB/Gf+iu2TTFsye
	4U7nx7vpY1QS8+Z/jntlo7Sor5CB/0kgf/GJyfSjloNKCA/x8/rUpe+eP8D4yF4H
	DlJwkJLDlym2pCJWbO4iPnX16lzxg9HwXC9OHsV1WBvz/f4b4tpNv4Y+Ie9gfLEF
	kbeLGlN18m9cpqds6N+Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjw5mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 17:49:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE41810005A;
	Tue, 28 Nov 2023 17:49:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D57D326028A;
	Tue, 28 Nov 2023 17:49:07 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 28 Nov
 2023 17:49:07 +0100
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
Subject: [PATCH v4 2/5] clk: stm32mp1: use stm32mp13 reset driver
Date: Tue, 28 Nov 2023 17:48:48 +0100
Message-ID: <20231128164851.588315-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128164851.588315-1-gabriel.fernandez@foss.st.com>
References: <20231128164851.588315-1-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_18,2023-11-27_01,2023-05-22_02

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

STM32MP15 is now using the same reset driver as STM32MP13 as they
have the same binding requirement.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Makefile         |   2 +-
 drivers/clk/stm32/clk-stm32-core.c |   5 +-
 drivers/clk/stm32/clk-stm32-core.h |   5 +-
 drivers/clk/stm32/clk-stm32mp1.c   | 127 ++++-------------------------
 drivers/clk/stm32/clk-stm32mp13.c  |   9 +-
 drivers/clk/stm32/reset-stm32.c    |  14 ++--
 drivers/clk/stm32/reset-stm32.h    |   8 +-
 7 files changed, 42 insertions(+), 128 deletions(-)

diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index c154ef3e88f9..5ced7fe3ddec 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1,2 +1,2 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
-obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
+obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 067b918a8894..58705fcad334 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -70,6 +70,7 @@ static int stm32_rcc_clock_init(struct device *dev,
 int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 		   void __iomem *base)
 {
+	const struct stm32_rcc_match_data *rcc_match_data;
 	const struct of_device_id *match;
 	int err;
 
@@ -79,8 +80,10 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 		return -ENODEV;
 	}
 
+	rcc_match_data = match->data;
+
 	/* RCC Reset Configuration */
-	err = stm32_rcc_reset_init(dev, match, base);
+	err = stm32_rcc_reset_init(dev, rcc_match_data->reset_data, base);
 	if (err) {
 		pr_err("stm32 reset failed to initialize\n");
 		return err;
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 76cffda02308..bb5aa19a792d 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -70,15 +70,12 @@ struct stm32_rcc_match_data {
 	const struct clock_config	*tab_clocks;
 	unsigned int			maxbinding;
 	struct clk_stm32_clock_data	*clock_data;
-	u32				clear_offset;
+	struct clk_stm32_reset_data	*reset_data;
 	int (*check_security)(void __iomem *base,
 			      const struct clock_config *cfg);
 	int (*multi_mux)(void __iomem *base, const struct clock_config *cfg);
 };
 
-int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
-			 void __iomem *base);
-
 int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 		   void __iomem *base);
 
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 939779f66867..c7cbd3488aab 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -20,6 +20,10 @@
 
 #include <dt-bindings/clock/stm32mp1-clks.h>
 
+#include "reset-stm32.h"
+
+#define STM32MP1_RESET_ID_MASK GENMASK(15, 0)
+
 static DEFINE_SPINLOCK(rlock);
 
 #define RCC_OCENSETR		0x0C
@@ -2137,22 +2141,27 @@ struct stm32_rcc_match_data {
 	const struct clock_config *cfg;
 	unsigned int num;
 	unsigned int maxbinding;
-	u32 clear_offset;
+	struct clk_stm32_reset_data *reset_data;
 	bool (*check_security)(const struct clock_config *cfg);
 };
 
+struct clk_stm32_reset_data stm32mp1_reset_data = {
+	.nr_lines	= STM32MP1_RESET_ID_MASK,
+	.clear_offset	= RCC_CLR,
+};
+
 static struct stm32_rcc_match_data stm32mp1_data = {
 	.cfg		= stm32mp1_clock_cfg,
 	.num		= ARRAY_SIZE(stm32mp1_clock_cfg),
 	.maxbinding	= STM32MP1_LAST_CLK,
-	.clear_offset	= RCC_CLR,
+	.reset_data	= &stm32mp1_reset_data,
 };
 
 static struct stm32_rcc_match_data stm32mp1_data_secure = {
 	.cfg		= stm32mp1_clock_cfg,
 	.num		= ARRAY_SIZE(stm32mp1_clock_cfg),
 	.maxbinding	= STM32MP1_LAST_CLK,
-	.clear_offset	= RCC_CLR,
+	.reset_data	= &stm32mp1_reset_data,
 	.check_security = &stm32_check_security
 };
 
@@ -2193,113 +2202,6 @@ static int stm32_register_hw_clk(struct device *dev,
 	return 0;
 }
 
-#define STM32_RESET_ID_MASK GENMASK(15, 0)
-
-struct stm32_reset_data {
-	/* reset lock */
-	spinlock_t			lock;
-	struct reset_controller_dev	rcdev;
-	void __iomem			*membase;
-	u32				clear_offset;
-};
-
-static inline struct stm32_reset_data *
-to_stm32_reset_data(struct reset_controller_dev *rcdev)
-{
-	return container_of(rcdev, struct stm32_reset_data, rcdev);
-}
-
-static int stm32_reset_update(struct reset_controller_dev *rcdev,
-			      unsigned long id, bool assert)
-{
-	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
-
-	if (data->clear_offset) {
-		void __iomem *addr;
-
-		addr = data->membase + (bank * reg_width);
-		if (!assert)
-			addr += data->clear_offset;
-
-		writel(BIT(offset), addr);
-
-	} else {
-		unsigned long flags;
-		u32 reg;
-
-		spin_lock_irqsave(&data->lock, flags);
-
-		reg = readl(data->membase + (bank * reg_width));
-
-		if (assert)
-			reg |= BIT(offset);
-		else
-			reg &= ~BIT(offset);
-
-		writel(reg, data->membase + (bank * reg_width));
-
-		spin_unlock_irqrestore(&data->lock, flags);
-	}
-
-	return 0;
-}
-
-static int stm32_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	return stm32_reset_update(rcdev, id, true);
-}
-
-static int stm32_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return stm32_reset_update(rcdev, id, false);
-}
-
-static int stm32_reset_status(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
-	int reg_width = sizeof(u32);
-	int bank = id / (reg_width * BITS_PER_BYTE);
-	int offset = id % (reg_width * BITS_PER_BYTE);
-	u32 reg;
-
-	reg = readl(data->membase + (bank * reg_width));
-
-	return !!(reg & BIT(offset));
-}
-
-static const struct reset_control_ops stm32_reset_ops = {
-	.assert		= stm32_reset_assert,
-	.deassert	= stm32_reset_deassert,
-	.status		= stm32_reset_status,
-};
-
-static int stm32_rcc_reset_init(struct device *dev, void __iomem *base,
-				const struct of_device_id *match)
-{
-	const struct stm32_rcc_match_data *data = match->data;
-	struct stm32_reset_data *reset_data = NULL;
-
-	reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL);
-	if (!reset_data)
-		return -ENOMEM;
-
-	spin_lock_init(&reset_data->lock);
-	reset_data->membase = base;
-	reset_data->rcdev.owner = THIS_MODULE;
-	reset_data->rcdev.ops = &stm32_reset_ops;
-	reset_data->rcdev.of_node = dev_of_node(dev);
-	reset_data->rcdev.nr_resets = STM32_RESET_ID_MASK;
-	reset_data->clear_offset = data->clear_offset;
-
-	return reset_controller_register(&reset_data->rcdev);
-}
-
 static int stm32_rcc_clock_init(struct device *dev, void __iomem *base,
 				const struct of_device_id *match)
 {
@@ -2342,6 +2244,7 @@ static int stm32_rcc_clock_init(struct device *dev, void __iomem *base,
 static int stm32_rcc_init(struct device *dev, void __iomem *base,
 			  const struct of_device_id *match_data)
 {
+	const struct stm32_rcc_match_data *rcc_match_data;
 	const struct of_device_id *match;
 	int err;
 
@@ -2351,8 +2254,10 @@ static int stm32_rcc_init(struct device *dev, void __iomem *base,
 		return -ENODEV;
 	}
 
+	rcc_match_data = match->data;
+
 	/* RCC Reset Configuration */
-	err = stm32_rcc_reset_init(dev, base, match);
+	err = stm32_rcc_reset_init(dev, rcc_match_data->reset_data, base);
 	if (err) {
 		pr_err("stm32mp1 reset failed to initialize\n");
 		return err;
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index c4a737482fe5..7a1f4003227f 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -10,8 +10,10 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include "clk-stm32-core.h"
+#include "reset-stm32.h"
 #include "stm32mp13_rcc.h"
 
+#define STM32MP1_RESET_ID_MASK GENMASK(15, 0)
 #define RCC_CLR_OFFSET		0x4
 
 /* STM32 Gates definition */
@@ -1511,13 +1513,18 @@ static struct clk_stm32_clock_data stm32mp13_clock_data = {
 	.is_multi_mux	= stm32mp13_is_multi_mux,
 };
 
+struct clk_stm32_reset_data stm32mp13_reset_data = {
+	.nr_lines	= STM32MP1_RESET_ID_MASK,
+	.clear_offset	= RCC_CLR_OFFSET,
+};
+
 static const struct stm32_rcc_match_data stm32mp13_data = {
 	.tab_clocks	= stm32mp13_clock_cfg,
 	.num_clocks	= ARRAY_SIZE(stm32mp13_clock_cfg),
 	.clock_data	= &stm32mp13_clock_data,
 	.check_security = &stm32mp13_clock_is_provided_by_secure,
 	.maxbinding	= STM32MP1_LAST_CLK,
-	.clear_offset	= RCC_CLR_OFFSET,
+	.reset_data	= &stm32mp13_reset_data,
 };
 
 static const struct of_device_id stm32mp13_match_data[] = {
diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index e89381528af9..14c2ee1eebee 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -11,9 +11,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include "clk-stm32-core.h"
-
-#define STM32_RESET_ID_MASK GENMASK(15, 0)
+#include "reset-stm32.h"
 
 struct stm32_reset_data {
 	/* reset lock */
@@ -99,24 +97,22 @@ static const struct reset_control_ops stm32_reset_ops = {
 	.status		= stm32_reset_status,
 };
 
-int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
+int stm32_rcc_reset_init(struct device *dev, struct clk_stm32_reset_data *data,
 			 void __iomem *base)
 {
-	const struct stm32_rcc_match_data *data = match->data;
-	struct stm32_reset_data *reset_data = NULL;
-
-	data = match->data;
+	struct stm32_reset_data *reset_data;
 
 	reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL);
 	if (!reset_data)
 		return -ENOMEM;
 
 	spin_lock_init(&reset_data->lock);
+
 	reset_data->membase = base;
 	reset_data->rcdev.owner = THIS_MODULE;
 	reset_data->rcdev.ops = &stm32_reset_ops;
 	reset_data->rcdev.of_node = dev_of_node(dev);
-	reset_data->rcdev.nr_resets = STM32_RESET_ID_MASK;
+	reset_data->rcdev.nr_resets = data->nr_lines;
 	reset_data->clear_offset = data->clear_offset;
 
 	return reset_controller_register(&reset_data->rcdev);
diff --git a/drivers/clk/stm32/reset-stm32.h b/drivers/clk/stm32/reset-stm32.h
index 6eb6ea4b55ab..8cf1cc9be480 100644
--- a/drivers/clk/stm32/reset-stm32.h
+++ b/drivers/clk/stm32/reset-stm32.h
@@ -4,5 +4,11 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
-int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
+struct clk_stm32_reset_data {
+	const struct reset_control_ops *ops;
+	unsigned int nr_lines;
+	u32 clear_offset;
+};
+
+int stm32_rcc_reset_init(struct device *dev, struct clk_stm32_reset_data *data,
 			 void __iomem *base);
-- 
2.25.1



Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF646B59D5
	for <lists+linux-clk@lfdr.de>; Sat, 11 Mar 2023 10:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCKJJX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Sat, 11 Mar 2023 04:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjCKJIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Mar 2023 04:08:09 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6DFE057;
        Sat, 11 Mar 2023 01:07:59 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 4247B24E1BA;
        Sat, 11 Mar 2023 17:07:45 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:45 +0800
Received: from ubuntu.localdomain (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:44 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 10/21] reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
Date:   Sat, 11 Mar 2023 17:07:22 +0800
Message-ID: <20230311090733.56918-11-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311090733.56918-1-hal.feng@starfivetech.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Emil Renner Berthing <kernel@esmil.dk>

We currently use 64bit I/O on the 32bit registers. This works because
there are an even number of assert and status registers, so they're only
ever accessed in pairs on 64bit boundaries.

There are however other reset controllers for audio and video on the
JH7100 SoC with only one status register that isn't 64bit aligned so
64bit I/O results in an unaligned access exception.

Switch to 32bit I/O in preparation for supporting these resets too.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh7100.c    | 14 ++++-----
 .../reset/starfive/reset-starfive-jh71x0.c    | 31 +++++++++----------
 .../reset/starfive/reset-starfive-jh71x0.h    |  2 +-
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 5f06e5ae3346..2a56f7fd4ba7 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -30,16 +30,16 @@
  * lines don't though, so store the expected value of the status registers when
  * all lines are asserted.
  */
-static const u64 jh7100_reset_asserted[2] = {
+static const u32 jh7100_reset_asserted[4] = {
 	/* STATUS0 */
-	BIT_ULL_MASK(JH7100_RST_U74) |
-	BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
+	BIT(JH7100_RST_U74 % 32) |
+	BIT(JH7100_RST_VP6_DRESET % 32) |
+	BIT(JH7100_RST_VP6_BRESET % 32),
 	/* STATUS1 */
-	BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET),
+	BIT(JH7100_RST_HIFI4_DRESET % 32) |
+	BIT(JH7100_RST_HIFI4_BRESET % 32),
 	/* STATUS2 */
-	BIT_ULL_MASK(JH7100_RST_E24) |
+	BIT(JH7100_RST_E24 % 32),
 	/* STATUS3 */
 	0,
 };
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index a689f4730ed7..55bbbd2de52c 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -8,7 +8,6 @@
 #include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/io.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
@@ -21,7 +20,7 @@ struct jh71x0_reset {
 	spinlock_t lock;
 	void __iomem *assert;
 	void __iomem *status;
-	const u64 *asserted;
+	const u32 *asserted;
 };
 
 static inline struct jh71x0_reset *
@@ -34,12 +33,12 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_assert = data->assert + offset * sizeof(u64);
-	void __iomem *reg_status = data->status + offset * sizeof(u64);
-	u64 done = data->asserted ? data->asserted[offset] & mask : 0;
-	u64 value;
+	unsigned long offset = id / 32;
+	u32 mask = BIT(id % 32);
+	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
+	void __iomem *reg_status = data->status + offset * sizeof(u32);
+	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
+	u32 value;
 	unsigned long flags;
 	int ret;
 
@@ -48,15 +47,15 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	value = readq(reg_assert);
+	value = readl(reg_assert);
 	if (assert)
 		value |= mask;
 	else
 		value &= ~mask;
-	writeq(value, reg_assert);
+	writel(value, reg_assert);
 
 	/* if the associated clock is gated, deasserting might otherwise hang forever */
-	ret = readq_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
+	ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
 
 	spin_unlock_irqrestore(&data->lock, flags);
 	return ret;
@@ -90,10 +89,10 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_status = data->status + offset * sizeof(u64);
-	u64 value = readq(reg_status);
+	unsigned long offset = id / 32;
+	u32 mask = BIT(id % 32);
+	void __iomem *reg_status = data->status + offset * sizeof(u32);
+	u32 value = readl(reg_status);
 
 	return !((value ^ data->asserted[offset]) & mask);
 }
@@ -107,7 +106,7 @@ static const struct reset_control_ops jh71x0_reset_ops = {
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
-				   const u64 *asserted, unsigned int nr_resets,
+				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner)
 {
 	struct jh71x0_reset *data;
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index ac9e80dd3f59..db7d39a87f87 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -8,7 +8,7 @@
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
-				   const u64 *asserted, unsigned int nr_resets,
+				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.38.1


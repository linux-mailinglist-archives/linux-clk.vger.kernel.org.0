Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6A34DB078
	for <lists+linux-clk@lfdr.de>; Wed, 16 Mar 2022 14:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356032AbiCPNLi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Mar 2022 09:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244274AbiCPNLi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 09:11:38 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784475F4E6;
        Wed, 16 Mar 2022 06:10:23 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GA4hbf004866;
        Wed, 16 Mar 2022 14:10:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ZiRrRo4KPczvg2JBhLVWSWvGKQYYdComXd2P4kRbhpU=;
 b=3f/ccuiZwjtpQDClKeDnTkdVBRtKOoORiQwmw3cpob6Jn+aoScsc6tgbNBRrjCkEuc55
 McD3HJ90wYkInblg0WQJh9wHLf+Iz3ZCpHkOGPXCOurS+x+pzZ5/n+RTSyH/3/QBK6n4
 50eGoMNFMfCefgjG8Sv2TdiM6UYQidmoWnz5YcP9U4Sg/NhBAcq3D8bY7VLBrEexhKwt
 EXKxXK7pb4XtY0tfGGggo4t1tSw3nRzHjVg2a8hdMCw4wPHLfDqz6CrW4L2WVayBWLMg
 m/3z7V5QGEaeG3KFj7JY3IsKl3a+igIgKpjZe8/Ghfgw3fQqEYPmPQMD25P75uWHY1pV ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63j5pdn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Mar 2022 14:10:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AE1A100034;
        Wed, 16 Mar 2022 14:10:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 348982291A2;
        Wed, 16 Mar 2022 14:10:10 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 16 Mar 2022 14:10:09
 +0100
From:   <gabriel.fernandez@foss.st.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v3 03/13] clk: stm32mp13: add stm32_mux clock management
Date:   Wed, 16 Mar 2022 14:09:50 +0100
Message-ID: <20220316131000.9874-4-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316131000.9874-1-gabriel.fernandez@foss.st.com>
References: <20220316131000.9874-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_04,2022-03-15_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Just to introduce management of a stm32 mux clock.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32-core.c | 79 ++++++++++++++++++++++++++++++
 drivers/clk/stm32/clk-stm32-core.h | 24 +++++++++
 drivers/clk/stm32/clk-stm32mp13.c  | 11 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 0fab4a5a8c66..98699093eb21 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -91,3 +91,82 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 
 	return 0;
 }
+
+static u8 stm32_mux_get_parent(void __iomem *base,
+			       struct clk_stm32_clock_data *data,
+			       u16 mux_id)
+{
+	const struct stm32_mux_cfg *mux = &data->muxes[mux_id];
+	u32 mask = BIT(mux->width) - 1;
+	u32 val;
+
+	val = readl(base + mux->offset) >> mux->shift;
+	val &= mask;
+
+	return val;
+}
+
+static int stm32_mux_set_parent(void __iomem *base,
+				struct clk_stm32_clock_data *data,
+				u16 mux_id, u8 index)
+{
+	const struct stm32_mux_cfg *mux = &data->muxes[mux_id];
+
+	u32 mask = BIT(mux->width) - 1;
+	u32 reg = readl(base + mux->offset);
+	u32 val = index << mux->shift;
+
+	reg &= ~(mask << mux->shift);
+	reg |= val;
+
+	writel(reg, base + mux->offset);
+
+	return 0;
+}
+
+static u8 clk_stm32_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_stm32_mux *mux = to_clk_stm32_mux(hw);
+
+	return stm32_mux_get_parent(mux->base, mux->clock_data, mux->mux_id);
+}
+
+static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_stm32_mux *mux = to_clk_stm32_mux(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(mux->lock, flags);
+
+	stm32_mux_set_parent(mux->base, mux->clock_data, mux->mux_id, index);
+
+	spin_unlock_irqrestore(mux->lock, flags);
+
+	return 0;
+}
+
+const struct clk_ops clk_stm32_mux_ops = {
+	.get_parent	= clk_stm32_mux_get_parent,
+	.set_parent	= clk_stm32_mux_set_parent,
+};
+
+struct clk_hw *clk_stm32_mux_register(struct device *dev,
+				      const struct stm32_rcc_match_data *data,
+				      void __iomem *base,
+				      spinlock_t *lock,
+				      const struct clock_config *cfg)
+{
+	struct clk_stm32_mux *mux = cfg->clock_cfg;
+	struct clk_hw *hw = &mux->hw;
+	int err;
+
+	mux->base = base;
+	mux->lock = lock;
+	mux->clock_data = data->clock_data;
+
+	err = clk_hw_register(dev, hw);
+	if (err)
+		return ERR_PTR(err);
+
+	return hw;
+}
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 519723ae97eb..8563e6e1c91a 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -83,10 +83,34 @@ int stm32_rcc_init(struct device *dev, const struct of_device_id *match_data,
 /* DIV define */
 #define DIV_NO_RDY		0xFF
 
+/* Definition of clock structure */
+struct clk_stm32_mux {
+	u16 mux_id;
+	struct clk_hw hw;
+	void __iomem *base;
+	struct clk_stm32_clock_data *clock_data;
+	spinlock_t *lock; /* spin lock */
+};
+
+#define to_clk_stm32_mux(_hw) container_of(_hw, struct clk_stm32_mux, hw)
+
+/* Clock operators */
+extern const struct clk_ops clk_stm32_mux_ops;
+
 /* Clock registering */
+struct clk_hw *clk_stm32_mux_register(struct device *dev,
+				      const struct stm32_rcc_match_data *data,
+				      void __iomem *base,
+				      spinlock_t *lock,
+				      const struct clock_config *cfg);
+
 #define STM32_CLOCK_CFG(_binding, _clk, _struct, _register)\
 {\
 	.id		= (_binding),\
 	.clock_cfg	= (_struct) {_clk},\
 	.func		= (_register),\
 }
+
+#define STM32_MUX_CFG(_binding, _clk)\
+	STM32_CLOCK_CFG(_binding, &(_clk), struct clk_stm32_mux *,\
+			&clk_stm32_mux_register)
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index a2a6bbb4ace5..40568a676111 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -400,7 +400,18 @@ static const struct stm32_mux_cfg stm32mp13_muxes[] = {
 	CFG_MUX(MUX_SDMMC2,	RCC_SDMMC12CKSELR,	3, 3),
 };
 
+static const char * const eth12_src[] = {
+	"pll4_p", "pll3_q"
+};
+
+static struct clk_stm32_mux ck_ker_eth1 = {
+	.mux_id = MUX_ETH1,
+	.hw.init = CLK_HW_INIT_PARENTS("ck_ker_eth1", eth12_src, &clk_stm32_mux_ops,
+				       CLK_OPS_PARENT_ENABLE | CLK_SET_RATE_NO_REPARENT),
+};
+
 static const struct clock_config stm32mp13_clock_cfg[] = {
+	STM32_MUX_CFG(NO_ID, ck_ker_eth1),
 };
 
 static u16 stm32mp13_cpt_gate[GATE_NB];
-- 
2.25.1


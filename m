Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CA55654BD
	for <lists+linux-clk@lfdr.de>; Mon,  4 Jul 2022 14:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbiGDMQd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 Jul 2022 08:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbiGDMQ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 08:16:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D3B5FD1;
        Mon,  4 Jul 2022 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656936986; x=1688472986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OXB45vMtUs1nfpYjQaPxWOb/6F6yUpAgZPrlzrfPAk4=;
  b=pJtHMdf6ZniIEw0IAS6In39v7+tcxx3RqVMwnZnNZpT36f8OKit/YPlc
   bOkFv/2+kVeoPaYJav8An2vzkMCEEzXkpCr7C8ohcbEiSF8LQY0JxRk/E
   rHARRg0E1QJ0pjvQsOBHPGauqQ2+Xf/e0DCt7pbhqkbUgIIYch1Ni/sxR
   quMkbwCJjc7tL0EEXOkU/3fZCFlsbCn0gV8NtfXa3nFlikYWBcrYLVqTv
   M6aw3pN2tBC36QDKvlkruN1KHy7IH8E0XsS3yhfO4Jp+crVzPlfB8alTj
   VY6Wt4Xn0ckNvfs86Aq1YO4zKWY5ZgkxGoutMqfKw3sap1q02d3Tb9XAR
   g==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="180647863"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:22 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daire McNamara <daire.mcnamara@microchip.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 02/12] clk: microchip: mpfs: add reset controller
Date:   Mon, 4 Jul 2022 13:15:49 +0100
Message-ID: <20220704121558.2088698-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a reset controller to PolarFire SoC's clock driver. This reset
controller is registered as an aux device and read/write functions
exported to the drivers namespace so that the reset controller can
access the peripheral device reset register.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig    |   1 +
 drivers/clk/microchip/clk-mpfs.c | 116 ++++++++++++++++++++++++++++---
 include/soc/microchip/mpfs.h     |   8 +++
 3 files changed, 114 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index a5a99873c4f5..b46e864b3bd8 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -6,5 +6,6 @@ config COMMON_CLK_PIC32
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
 	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 070c3b896559..a93f78619dc3 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -3,12 +3,14 @@
  * Daire McNamara,<daire.mcnamara@microchip.com>
  * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
  */
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/microchip,mpfs-clock.h>
+#include <soc/microchip/mpfs.h>
 
 /* address offset of control registers */
 #define REG_MSSPLL_REF_CR	0x08u
@@ -28,6 +30,7 @@
 #define MSSPLL_FIXED_DIV	4u
 
 struct mpfs_clock_data {
+	struct device *dev;
 	void __iomem *base;
 	void __iomem *msspll_base;
 	struct clk_hw_onecell_data hw_data;
@@ -302,10 +305,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg | (1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -339,12 +338,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
 	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg;
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	if ((reg & (1u << periph->shift)) == 0u) {
-		reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
-		if (reg & (1u << periph->shift))
-			return 1;
-	}
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	if (reg & (1u << periph->shift))
+		return 1;
 
 	return 0;
 }
@@ -438,6 +434,98 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 	return 0;
 }
 
+/*
+ * Peripheral clock resets
+ */
+
+#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
+
+u32 mpfs_reset_read(struct device *dev)
+{
+	struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
+
+	return readl_relaxed(clock_data->base + REG_SUBBLK_RESET_CR);
+}
+EXPORT_SYMBOL_NS_GPL(mpfs_reset_read, MCHP_CLK_MPFS);
+
+void mpfs_reset_write(struct device *dev, u32 val)
+{
+	struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
+
+	writel_relaxed(val, clock_data->base + REG_SUBBLK_RESET_CR);
+}
+EXPORT_SYMBOL_NS_GPL(mpfs_reset_write, MCHP_CLK_MPFS);
+
+static void mpfs_reset_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+}
+
+static void mpfs_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	auxiliary_device_uninit(adev);
+
+	kfree(adev);
+}
+
+static struct auxiliary_device *mpfs_reset_adev_alloc(struct mpfs_clock_data *clk_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	adev->name = "reset-mpfs";
+	adev->dev.parent = clk_data->dev;
+	adev->dev.release = mpfs_reset_adev_release;
+	adev->id = 666u;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	return adev;
+}
+
+static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = mpfs_reset_adev_alloc(clk_data);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev, adev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+#else /* !CONFIG_RESET_CONTROLLER */
+
+static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
+{
+	return 0;
+}
+
+#endif /* !CONFIG_RESET_CONTROLLER */
+
 static int mpfs_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -462,6 +550,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(clk_data->msspll_base);
 
 	clk_data->hw_data.num = num_clks;
+	clk_data->dev = dev;
+	dev_set_drvdata(dev, clk_data);
 
 	ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
 					clk_data);
@@ -481,6 +571,10 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mpfs_reset_controller_register(clk_data);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
@@ -488,7 +582,7 @@ static const struct of_device_id mpfs_clk_of_match_table[] = {
 	{ .compatible = "microchip,mpfs-clkcfg", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
+MODULE_DEVICE_TABLE(of, mpfs_clk_of_match_table);
 
 static struct platform_driver mpfs_clk_driver = {
 	.probe = mpfs_clk_probe,
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 6466515262bd..f916dcde457f 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -40,4 +40,12 @@ struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
+#if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
+
+u32 mpfs_reset_read(struct device *dev);
+
+void mpfs_reset_write(struct device *dev, u32 val);
+
+#endif /* if IS_ENABLED(CONFIG_MCHP_CLK_MPFS) */
+
 #endif /* __SOC_MPFS_H__ */
-- 
2.36.1


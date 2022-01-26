Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF71549D54C
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jan 2022 23:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbiAZWSp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jan 2022 17:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiAZWSo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jan 2022 17:18:44 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EED8C061755
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 14:18:43 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id x11so840284plg.6
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 14:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T59xVJJlA+EwlaGRXk+Mubmt7OJZ+aefRvmsTWRIfZk=;
        b=FjfwCepDMrYAl6cCQD3rTG90tWvm4oH3qlX5wwVVkPEIBawz6MUHPMYMTquz6QlXwl
         K8CrGGnp9o9CPKcKgRwD9rz5wD1jsLZblhej6ErYoMLGnUcInvyLrJASj9P5Kvy0n+t0
         4A+tNHI3fZ7AG9KzEpahJ9I8h6kXrgzUnCson4AgyTaQy4mjDdRe3kpHFXkcHOGZd+G4
         rS6dIj1fAs77BFvg8S09qxS6IFXmT0sNKgy1WHRz0Le/t56zoH8Npu5rDfQWnLVtp3bK
         PwVMDMjVaRwGroM+DDfceUlAgGVyjOR5QL4LNW2eD8FWqVLpDqzrJ5eJ/OxGvvzr3Fb3
         CPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T59xVJJlA+EwlaGRXk+Mubmt7OJZ+aefRvmsTWRIfZk=;
        b=yaL0/c6Xlg+uPGuqwmmkAk8MdEJBnQGnatIy7hqUMxljIXnUGPv5WWPTeTkH8H7AI1
         N77F78zvbiPwMVsV96fbX1Luu5X6x8TWKyP5NL7Nl1CWTxXLcn7pF2Gwwd/3UGFz7pUT
         Z2Ltp9IPUim4H6+zdtN0vn+c720eAX5sCE6OOAukSD4m4fVqY+ejijGVD96pUnrSKf2U
         HmwSILdAh+eu6CpwX1qU5CPxgIgEuwGCl3SnZxQ+o/mivwaux/Gr4VDkq9gL8TIYQfb6
         g3QCq2aSvA7AUUXZv4aDZrfLjrPn2y2XhWd79kjXZg+Wlr6Vg1/bkk1dmUqLwRK3J6Ed
         +Z/A==
X-Gm-Message-State: AOAM531mljMBJrGtLuoApr8VpfcvD2wjuEtncxGgZFz8+eDbuhJ4UJC9
        H3ilVlsAtNyo9d61CcKXxEB7Lw==
X-Google-Smtp-Source: ABdhPJx6TCHpA/COkQuYUbezUZQALiNNu+l8B0//dp5HGfF1iL4HjnTbxsufWle4aMkApq99SMVzWQ==
X-Received: by 2002:a17:90a:6585:: with SMTP id k5mr10847701pjj.94.1643235522915;
        Wed, 26 Jan 2022 14:18:42 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:42 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH 6/8] net: stmmac: dwmac-qcom-ethqos: Adjust rgmii loopback_en per platform
Date:   Thu, 27 Jan 2022 03:47:23 +0530
Message-Id: <20220126221725.710167-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Not all platforms should have RGMII_CONFIG_LOOPBACK_EN and the result it
about 50% packet loss on incoming messages. So make it possile to
configure this per compatible and enable it for QCS404.

Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8cdba9d521ec..0cc28c79cc61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -78,6 +78,7 @@ struct ethqos_emac_por {
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
+	bool rgmii_config_looback_en;
 };
 
 struct qcom_ethqos {
@@ -90,6 +91,7 @@ struct qcom_ethqos {
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
+	bool rgmii_config_looback_en;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -181,6 +183,7 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.por = emac_v2_3_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
+	.rgmii_config_looback_en = true,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -195,6 +198,7 @@ static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.por = emac_v2_1_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+	.rgmii_config_looback_en = false,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -311,8 +315,12 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+		if (ethqos->rgmii_config_looback_en)
+			rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+				      RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+				      0, RGMII_IO_MACRO_CONFIG);
 		break;
 
 	case SPEED_100:
@@ -345,8 +353,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+		if (ethqos->rgmii_config_looback_en)
+			rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+				      RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+				      0, RGMII_IO_MACRO_CONFIG);
+
 		break;
 
 	case SPEED_10:
@@ -518,6 +531,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	data = of_device_get_match_data(&pdev->dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
+	ethqos->rgmii_config_looback_en = data->rgmii_config_looback_en;
 
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
-- 
2.34.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAE86C24A1
	for <lists+linux-clk@lfdr.de>; Mon, 20 Mar 2023 23:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjCTWT0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Mar 2023 18:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjCTWSj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 18:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB22366AB
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6mAYxo5czKjIWVyAG97r5+Dwem7hjuC7SmdROQurOmg=;
        b=DXdzwp45fKKTxiJQMa2+GPSJZLPp7iFLTzcFa+pTiWeYaG+04BUX3Py1jqHx6cuhAcTwMG
        T1wkfLS6ncLik5dO+01oL3Vl5BK6kD9I+i9jTBD/JcUfWAaYN8RzyCUxcaQkpxR9RENd0D
        R8cwVMsXMtL5vgubYuL8pXeq7oxRTx4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-JVSw3FNNPVasOClNBbgfEg-1; Mon, 20 Mar 2023 18:17:22 -0400
X-MC-Unique: JVSw3FNNPVasOClNBbgfEg-1
Received: by mail-ot1-f71.google.com with SMTP id a15-20020a0568300b8f00b0069965814cf7so6384328otv.15
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 15:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mAYxo5czKjIWVyAG97r5+Dwem7hjuC7SmdROQurOmg=;
        b=gBxJZBFf3UNZXAid0NbyprmvaM22x+8LpVjqbsuKCV3UQwK2e2r8N1uQOvRf/bKFgg
         vFPpRVcSKOZlYI/O56BsA7CNajUyyFjosCN7tLO9RAU5kM3ZW8EJReyLbQm+O6AZRVMB
         cJQELLuQyrw93FFJNHeRO+zYJ+5YKbJ4VG9uI6X+JfrxNQSzUOgLybzv5ob+EY554tI0
         GM4sOKqTaCckjE1pwHaaLtVG6Hj21rt1Iu1LCWk0hzaffG1eqlZpLhHPyLaQJXS9acdB
         YSrqn0p2W0BVeyhkBm5imu4SzZLED8FAie+t4tzVrzqAUDlymHXj8ej5/LXXptQKvX5I
         jE4g==
X-Gm-Message-State: AO0yUKUs22soZ1kpEC0LCiEfnwD/7bDdkhIPozcUctoLDRByEmhCQzXE
        BqjNTbffFiPh6h+mc0tq84vJiH4UhzBEk/+9nxXtyAOKJJZr+NVx4UYUR4pAxrkxoIy8ixKNgTt
        0b9obqwD7RjcvwD0Cg1AR
X-Received: by 2002:a05:6808:1455:b0:386:cbb7:fd34 with SMTP id x21-20020a056808145500b00386cbb7fd34mr907295oiv.57.1679350641888;
        Mon, 20 Mar 2023 15:17:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set/RPMw/4dqYIQwLU8hOZP75EGO+7zdFukaYHz8sVO/zWvrU5i4JX8duj3sLervZuK2KiyF5Eg==
X-Received: by 2002:a05:6808:1455:b0:386:cbb7:fd34 with SMTP id x21-20020a056808145500b00386cbb7fd34mr907277oiv.57.1679350641625;
        Mon, 20 Mar 2023 15:17:21 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:17:21 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 12/12] net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support
Date:   Mon, 20 Mar 2023 17:16:17 -0500
Message-Id: <20230320221617.236323-13-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the new programming sequence needed for EMAC3 based platforms such
as the sc8280xp family.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* None

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 106 ++++++++++++++----
 1 file changed, 84 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 41e6f4fa92f3..1fe8563b9c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -11,6 +11,7 @@
 
 #define RGMII_IO_MACRO_CONFIG		0x0
 #define SDCC_HC_REG_DLL_CONFIG		0x4
+#define SDCC_TEST_CTL			0x8
 #define SDCC_HC_REG_DDR_CONFIG		0xC
 #define SDCC_HC_REG_DLL_CONFIG2		0x10
 #define SDC4_STATUS			0x14
@@ -49,6 +50,7 @@
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY	GENMASK(26, 21)
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE	GENMASK(29, 27)
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN	BIT(30)
+#define SDCC_DDR_CONFIG_TCXO_CYCLES_CNT		GENMASK(11, 9)
 #define SDCC_DDR_CONFIG_PRG_RCLK_DLY		GENMASK(8, 0)
 
 /* SDCC_HC_REG_DLL_CONFIG2 fields */
@@ -79,6 +81,7 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
+	bool has_emac3;
 };
 
 struct qcom_ethqos {
@@ -92,6 +95,7 @@ struct qcom_ethqos {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
+	bool has_emac3;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -184,6 +188,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.por = emac_v2_3_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
+	.has_emac3 = false,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -199,6 +204,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.por = emac_v2_1_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
+	.has_emac3 = false,
+};
+
+static const struct ethqos_emac_por emac_v3_0_0_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x80040800 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
+	.por = emac_v3_0_0_por,
+	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_config_loopback_en = false,
+	.has_emac3 = true,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -222,11 +244,13 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
 		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
-		      0, SDCC_HC_REG_DLL_CONFIG);
+	if (!ethqos->has_emac3) {
+		rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
+			      0, SDCC_HC_REG_DLL_CONFIG);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CDR_FINE_PHASE,
-		      0, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_updatel(ethqos, SDCC_DLL_CDR_FINE_PHASE,
+			      0, SDCC_HC_REG_DLL_CONFIG);
+	}
 
 	/* Wait for CK_OUT_EN clear */
 	do {
@@ -261,18 +285,20 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_DLL_CONFIG2_DDR_CAL_EN, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
-		      0, SDCC_HC_REG_DLL_CONFIG2);
+	if (!ethqos->has_emac3) {
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
+			      0, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
-		      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
+			      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
-		      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
+			      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
-		      SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
-		      SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
+			      SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
+			      SDCC_HC_REG_DLL_CONFIG2);
+	}
 
 	return 0;
 }
@@ -326,9 +352,17 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
-		/* Set PRG_RCLK_DLY to 57 for 1.8 ns delay */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-			      57, SDCC_HC_REG_DDR_CONFIG);
+		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
+		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
+		 */
+		if (ethqos->has_emac3)
+			/* 0.9 ns */
+			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+				      115, SDCC_HC_REG_DDR_CONFIG);
+		else
+			/* 1.8 ns */
+			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+				      57, SDCC_HC_REG_DDR_CONFIG);
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
@@ -354,8 +388,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG2);
+
+		if (ethqos->has_emac3)
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      0, RGMII_IO_MACRO_CONFIG2);
+
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
@@ -388,8 +429,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		if (ethqos->has_emac3)
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      0, RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
@@ -432,6 +478,17 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
 
+	if (ethqos->has_emac3) {
+		if (ethqos->speed == SPEED_1000) {
+			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
+			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
+			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
+		} else {
+			rgmii_writel(ethqos, 0x40010800, SDCC_USR_CTL);
+			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
+		}
+	}
+
 	/* Clear DLL_RST */
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_RST, 0,
 		      SDCC_HC_REG_DLL_CONFIG);
@@ -451,7 +508,9 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26), SDCC_USR_CTL);
+		if (!ethqos->has_emac3)
+			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
+				      SDCC_USR_CTL);
 
 		/* wait for DLL LOCK */
 		do {
@@ -546,6 +605,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
+	ethqos->has_emac3 = data->has_emac3;
 
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
@@ -564,7 +624,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
-	plat_dat->has_gmac4 = 1;
+	plat_dat->has_gmac4 = !data->has_emac3;
+	plat_dat->has_emac3 = data->has_emac3;
 	plat_dat->pmt = 1;
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
@@ -603,6 +664,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", &emac_v3_0_0_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
-- 
2.39.2


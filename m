Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695DF1C820D
	for <lists+linux-clk@lfdr.de>; Thu,  7 May 2020 08:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgEGGGG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 May 2020 02:06:06 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:22990
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbgEGGGE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 May 2020 02:06:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSanvfv9lCSu7Ku6u/+c2rqM0Pc9IwcYvc9op/zipnEwI1tx3azgrizs+U9GoCoW8KghRBWFqw5a1IYe61WOhkprx20oBZPNw++US6YtOjOUt5jCcyTP2HsLcsmCqtTeA3/rsAKEgM8UOqCDpPXlRamQxlhrRgbsPvy0WWmVtq9VCibRnfkVid/u8sS6IDukcSimK0udd+UHg0nr3lgfMwSBmyQ912XbgbxPCR/vni5rQ+n5xEGaCpcT+ndOyu889v1BOnjIkGB8MxanKEQC0Sci2COySFYj9dCsGpWKPExcOKuXtPe9ZCfn87k14WufVc+VjhdTGVQ8Rsd+8f9WSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPYsraF+pd3lHpWcqd44fdJQ8+1LVjYcDqEL/qD+DhI=;
 b=CRXXzqG3IsrF/W7ED9HKxx2qqv9Ybazh0YMCMhkp0spjoB83e9TmYGtW7Otf1C0mLZp8AvUa0ZBDPQ3NCiiNTycKrxKwlXz9yTgn/56gcE5Uctpdh41IkU1LRiIK+VqEAFsp6wdiUqlEPNOsyE4t6JDPQr+aGN8A9AozDlQKRMatKnFEanpMNAaOJXB+xkuowjJxhtI7zYvgE1ShwYDInTqQszY1OxqZQ9Ox4AgZ4eqL0kIH7hk3ZQAfvN3YEzE/1fnxNSZab0wDFPHybcB2D5AlzDGhs7ATFVEfsR5GBXX1jV32BgQTlvUh7qaney+xgk8HYVrbT8+oR6PHl97ruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPYsraF+pd3lHpWcqd44fdJQ8+1LVjYcDqEL/qD+DhI=;
 b=SIUmbzUrBcw94VMOyEuM0SAfy37c1KcxxX/92AcaDabmn0p0K9qWTvV6t2FD9ImJ73ydyB/ohmMgeB8znLh3I+8RR2OBVH5fjT1xjHNKNWH1PftBxc8Smog+yg3A1TJS/rTz8w0U1qlp4UdiPeEtDM7Q8UccVwv3THphd8JSo2M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2710.eurprd04.prod.outlook.com (2603:10a6:4:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 06:05:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 06:05:57 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, s.hauer@pengutronix.de,
        leonard.crestez@nxp.com, abel.vesa@nxp.com, aisheng.dong@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 05/10] clk: imx8mp: use imx8m_clk_hw_composite_core to simplify code
Date:   Thu,  7 May 2020 13:56:14 +0800
Message-Id: <1588830979-11586-6-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
References: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0147.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 06:05:53 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77bab093-8042-41ea-925a-08d7f24cb55e
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2710:|DB6PR0402MB2710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB271044EC4CABC20D524C125888A50@DB6PR0402MB2710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0J17hk+yP1U0G4Wsk75SB71HKeEeMib8XYq/wScIXHSuUr0aXQB55NCuhUaO0cWl35QNvvgO1w1Lt0+HptPR9sPxjs4T1EsdHs0RFCSOrT6PtlooHy+2lMYd0eILH5RusAkHifPbXNSIDdOh8c1IbEEkdLAQSqY68NEfBOAEn8rIN1IqqEoBW6tUKgUM651rBt+WlxVCXyhUwCFwXwzzGbg8jLhEtodQqf5zsiAYZH4zw3GBx3uKRCTaeEVUXjT06107tCQYtsnffRyLN4GPj5jbdOOVu3mi4Wfe9V5TQA0UUdiAxevJ8UsObW9JMDSLL3tWaPCY52gNZcVP9uoTHq7y9V+W2qP/VTabu94jMUMo+coBuPnOBMJJaosjrkOQ8nD0MsHhiWNubZr0yjKSKp4v412ofJDGQhazdKetaTX+GjBz20xVmdvarIHxa9CcqpC7yTxuwfNw0kUKM9Fwb+M832riQiLhYdheYEFbx1bND8gvqdPfNBGHpF48aebfsSmjL9G5+0dE0uLkBg8pVzUvP2K1M8a7SiDjzfP/TrckSdAXy7Jboit8jFz9Vj/6vF5xs092/F3GZll8VQPVGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(33430700001)(316002)(33440700001)(478600001)(2616005)(16526019)(69590400007)(6666004)(4326008)(66476007)(66946007)(86362001)(2906002)(66556008)(956004)(6486002)(52116002)(36756003)(8676002)(26005)(6506007)(8936002)(5660300002)(186003)(6512007)(9686003)(83320400001)(83280400001)(83300400001)(83310400001)(83290400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kbTT0bVxwrBZBAThBvNwHIYi4BZrL7yYalzVV9IeWSNaqTkzp+1i9P1bvjwSTn3G5Ckht1wXrLdOom3P4zUvaEko5C7SYA4tMp4W7vFifgKjaHc9QzQQVs2B9ZWf9hBPWLuOyIDvvf0x99n1czkY29kduQIlB1eZL68TZ0IjVjH5OqRUQXjQOqaWswYnQi/3curzJWaGfz54xBsIh1L1RBcTRFH4ZbSctmp80qymRd+JA04JbTmXOFAXdQsbRhy+Kq/nMdlKOPjehVHiy2CZ8Mn2fkGFA3tzpUrQrxS8EhGs+mbYTV3LFmZetcGKB5+gYKm1FXDr758F5VkgqWbGu6Bi85i6lxSDsKubztR46Bl0CulxBe4HssIYY39wiXL6WpkIlpXc8RnyNxbnGOOE0WvteKX4lQrRuS3jm6s/y1ect81dHHB8o2LxS/MlIUkmiQ+cB/K9GIP8wek9pM7z/nnRyTIBz4pXhsR2cEVJC+qQl77zsgQmXIVusIQpJUNomMwacgwVvQxY46jGZGivbathOjcyidMsQfTJrbIkkvm/6uX99rjg5k/A2aqwZMYN4QKtA/EpkFLax32Uy2tWUo6IE+gLfVCYIIGV/z+8snXD8rXjAleyTsOFpesEiMw2VxdVW1bnBTMY5fgtL3j/qzc4qIerP68Ou/S3CNAh0+9fboS/lQKGjQk3iK0SzEn2XRXcMSK4bfJd05TTTWcwzo6tBEbpo92QCf3XFuQ/zYC9ZhLu9Gz+rkf5wcQPExNAnOGFA5eFoT69Nopwdn7H8nIEpZftWi9ABzwbozn6MZ0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bab093-8042-41ea-925a-08d7f24cb55e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 06:05:57.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd86S8wlcDh6TS6HwjDBXioJvMP4G0q4fCDseXKL7Of/5izJ9/EfePyatJhmhj/8wuiYU1onp21RQTIqjfNBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2710
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use imx8m_clk_hw_composite_core to simpliy clks that belong to
core clk slice.

Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c             | 47 +++++++++++---------------------
 include/dt-bindings/clock/imx8mp-clock.h | 11 +++++++-
 2 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index a7613c7355c8..998e9e63f831 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -546,33 +546,18 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
 	hws[IMX8MP_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
 
-	hws[IMX8MP_CLK_A53_SRC] = imx_clk_hw_mux2("arm_a53_src", ccm_base + 0x8000, 24, 3, imx8mp_a53_sels, ARRAY_SIZE(imx8mp_a53_sels));
-	hws[IMX8MP_CLK_M7_SRC] = imx_clk_hw_mux2("arm_m7_src", ccm_base + 0x8080, 24, 3, imx8mp_m7_sels, ARRAY_SIZE(imx8mp_m7_sels));
-	hws[IMX8MP_CLK_ML_SRC] = imx_clk_hw_mux2("ml_src", ccm_base + 0x8100, 24, 3, imx8mp_ml_sels, ARRAY_SIZE(imx8mp_ml_sels));
-	hws[IMX8MP_CLK_GPU3D_CORE_SRC] = imx_clk_hw_mux2("gpu3d_core_src", ccm_base + 0x8180, 24, 3,  imx8mp_gpu3d_core_sels, ARRAY_SIZE(imx8mp_gpu3d_core_sels));
-	hws[IMX8MP_CLK_GPU3D_SHADER_SRC] = imx_clk_hw_mux2("gpu3d_shader_src", ccm_base + 0x8200, 24, 3, imx8mp_gpu3d_shader_sels, ARRAY_SIZE(imx8mp_gpu3d_shader_sels));
-	hws[IMX8MP_CLK_GPU2D_SRC] = imx_clk_hw_mux2("gpu2d_src", ccm_base + 0x8280, 24, 3, imx8mp_gpu2d_sels, ARRAY_SIZE(imx8mp_gpu2d_sels));
-	hws[IMX8MP_CLK_AUDIO_AXI_SRC] = imx_clk_hw_mux2("audio_axi_src", ccm_base + 0x8300, 24, 3, imx8mp_audio_axi_sels, ARRAY_SIZE(imx8mp_audio_axi_sels));
-	hws[IMX8MP_CLK_HSIO_AXI_SRC] = imx_clk_hw_mux2("hsio_axi_src", ccm_base + 0x8380, 24, 3, imx8mp_hsio_axi_sels, ARRAY_SIZE(imx8mp_hsio_axi_sels));
-	hws[IMX8MP_CLK_MEDIA_ISP_SRC] = imx_clk_hw_mux2("media_isp_src", ccm_base + 0x8400, 24, 3, imx8mp_media_isp_sels, ARRAY_SIZE(imx8mp_media_isp_sels));
-	hws[IMX8MP_CLK_A53_CG] = imx_clk_hw_gate3("arm_a53_cg", "arm_a53_src", ccm_base + 0x8000, 28);
-	hws[IMX8MP_CLK_M4_CG] = imx_clk_hw_gate3("arm_m7_cg", "arm_m7_src", ccm_base + 0x8080, 28);
-	hws[IMX8MP_CLK_ML_CG] = imx_clk_hw_gate3("ml_cg", "ml_src", ccm_base + 0x8100, 28);
-	hws[IMX8MP_CLK_GPU3D_CORE_CG] = imx_clk_hw_gate3("gpu3d_core_cg", "gpu3d_core_src", ccm_base + 0x8180, 28);
-	hws[IMX8MP_CLK_GPU3D_SHADER_CG] = imx_clk_hw_gate3("gpu3d_shader_cg", "gpu3d_shader_src", ccm_base + 0x8200, 28);
-	hws[IMX8MP_CLK_GPU2D_CG] = imx_clk_hw_gate3("gpu2d_cg", "gpu2d_src", ccm_base + 0x8280, 28);
-	hws[IMX8MP_CLK_AUDIO_AXI_CG] = imx_clk_hw_gate3("audio_axi_cg", "audio_axi_src", ccm_base + 0x8300, 28);
-	hws[IMX8MP_CLK_HSIO_AXI_CG] = imx_clk_hw_gate3("hsio_axi_cg", "hsio_axi_src", ccm_base + 0x8380, 28);
-	hws[IMX8MP_CLK_MEDIA_ISP_CG] = imx_clk_hw_gate3("media_isp_cg", "media_isp_src", ccm_base + 0x8400, 28);
-	hws[IMX8MP_CLK_A53_DIV] = imx_clk_hw_divider2("arm_a53_div", "arm_a53_cg", ccm_base + 0x8000, 0, 3);
-	hws[IMX8MP_CLK_M7_DIV] = imx_clk_hw_divider2("arm_m7_div", "arm_m7_cg", ccm_base + 0x8080, 0, 3);
-	hws[IMX8MP_CLK_ML_DIV] = imx_clk_hw_divider2("ml_div", "ml_cg", ccm_base + 0x8100, 0, 3);
-	hws[IMX8MP_CLK_GPU3D_CORE_DIV] = imx_clk_hw_divider2("gpu3d_core_div", "gpu3d_core_cg", ccm_base + 0x8180, 0, 3);
-	hws[IMX8MP_CLK_GPU3D_SHADER_DIV] = imx_clk_hw_divider2("gpu3d_shader_div", "gpu3d_shader_cg", ccm_base + 0x8200, 0, 3);
-	hws[IMX8MP_CLK_GPU2D_DIV] = imx_clk_hw_divider2("gpu2d_div", "gpu2d_cg", ccm_base + 0x8280, 0, 3);
-	hws[IMX8MP_CLK_AUDIO_AXI_DIV] = imx_clk_hw_divider2("audio_axi_div", "audio_axi_cg", ccm_base + 0x8300, 0, 3);
-	hws[IMX8MP_CLK_HSIO_AXI_DIV] = imx_clk_hw_divider2("hsio_axi_div", "hsio_axi_cg", ccm_base + 0x8380, 0, 3);
-	hws[IMX8MP_CLK_MEDIA_ISP_DIV] = imx_clk_hw_divider2("media_isp_div", "media_isp_cg", ccm_base + 0x8400, 0, 3);
+	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
+	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
+	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
+	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
+	hws[IMX8MP_CLK_ML_CORE] = imx8m_clk_hw_composite_core("ml_core", imx8mp_ml_sels, ccm_base + 0x8100);
+	hws[IMX8MP_CLK_GPU3D_CORE] = imx8m_clk_hw_composite_core("gpu3d_core", imx8mp_gpu3d_core_sels, ccm_base + 0x8180);
+	hws[IMX8MP_CLK_GPU3D_SHADER_CORE] = imx8m_clk_hw_composite("gpu3d_shader_core", imx8mp_gpu3d_shader_sels, ccm_base + 0x8200);
+	hws[IMX8MP_CLK_GPU2D_CORE] = imx8m_clk_hw_composite("gpu2d_core", imx8mp_gpu2d_sels, ccm_base + 0x8280);
+	hws[IMX8MP_CLK_AUDIO_AXI] = imx8m_clk_hw_composite("audio_axi", imx8mp_audio_axi_sels, ccm_base + 0x8300);
+	hws[IMX8MP_CLK_AUDIO_AXI_SRC] = hws[IMX8MP_CLK_AUDIO_AXI];
+	hws[IMX8MP_CLK_HSIO_AXI] = imx8m_clk_hw_composite("hsio_axi", imx8mp_hsio_axi_sels, ccm_base + 0x8380);
+	hws[IMX8MP_CLK_MEDIA_ISP] = imx8m_clk_hw_composite("media_isp", imx8mp_media_isp_sels, ccm_base + 0x8400);
 
 	/* CORE SEL */
 	hws[IMX8MP_CLK_A53_CORE] = imx_clk_hw_mux2("arm_a53_core", ccm_base + 0x9880, 24, 1, imx8mp_a53_core_sels, ARRAY_SIZE(imx8mp_a53_core_sels));
@@ -713,8 +698,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_SDMA1_ROOT] = imx_clk_hw_gate4("sdma1_root_clk", "ipg_root", ccm_base + 0x43a0, 0);
 	hws[IMX8MP_CLK_ENET_QOS_ROOT] = imx_clk_hw_gate4("enet_qos_root_clk", "sim_enet_root_clk", ccm_base + 0x43b0, 0);
 	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
-	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_div", ccm_base + 0x4450, 0);
-	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core_div", ccm_base + 0x4460, 0);
+	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
+	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
 	hws[IMX8MP_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0);
 	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
 	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
@@ -731,7 +716,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_GPU_ROOT] = imx_clk_hw_gate4("gpu_root_clk", "gpu_axi", ccm_base + 0x4570, 0);
 	hws[IMX8MP_CLK_VPU_VC8KE_ROOT] = imx_clk_hw_gate4("vpu_vc8ke_root_clk", "vpu_vc8000e", ccm_base + 0x4590, 0);
 	hws[IMX8MP_CLK_VPU_G2_ROOT] = imx_clk_hw_gate4("vpu_g2_root_clk", "vpu_g2", ccm_base + 0x45a0, 0);
-	hws[IMX8MP_CLK_NPU_ROOT] = imx_clk_hw_gate4("npu_root_clk", "ml_div", ccm_base + 0x45b0, 0);
+	hws[IMX8MP_CLK_NPU_ROOT] = imx_clk_hw_gate4("npu_root_clk", "ml_core", ccm_base + 0x45b0, 0);
 	hws[IMX8MP_CLK_HSIO_ROOT] = imx_clk_hw_gate4("hsio_root_clk", "ipg_root", ccm_base + 0x45c0, 0);
 	hws[IMX8MP_CLK_MEDIA_APB_ROOT] = imx_clk_hw_gate2_shared2("media_apb_root_clk", "media_apb", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_AXI_ROOT] = imx_clk_hw_gate2_shared2("media_axi_root_clk", "media_axi", ccm_base + 0x45d0, 0, &share_count_media);
@@ -739,7 +724,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp_div", ccm_base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
 
 	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
 	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 3a8c55a11c1e..7a23f289b27f 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -313,7 +313,16 @@
 #define IMX8MP_SYS_PLL2_333M_CG			303
 #define IMX8MP_SYS_PLL2_500M_CG			304
 
-#define IMX8MP_CLK_END				305
+#define IMX8MP_CLK_M7_CORE			305
+#define IMX8MP_CLK_ML_CORE			306
+#define IMX8MP_CLK_GPU3D_CORE			307
+#define IMX8MP_CLK_GPU3D_SHADER_CORE		308
+#define IMX8MP_CLK_GPU2D_CORE			309
+#define IMX8MP_CLK_AUDIO_AXI			310
+#define IMX8MP_CLK_HSIO_AXI			311
+#define IMX8MP_CLK_MEDIA_ISP			312
+
+#define IMX8MP_CLK_END				313
 
 #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
 #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
-- 
2.16.4


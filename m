Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C96C1C8213
	for <lists+linux-clk@lfdr.de>; Thu,  7 May 2020 08:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGGGL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 May 2020 02:06:11 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:22990
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725793AbgEGGGK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 May 2020 02:06:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj1Loinvuxi9UwXiM1I2ia0LrkIN31bTkIIX7DA+TdoKfAek3/CazWaQy1cEWnYZ1j18m3BjrJB53eWPUS6wp20aruvrjwHKENzWg6FVXgsoRPfDNkAfo2E8EEMc185DZLq4YZ5VTy/ojh0SWW8LbwTJbi8/K80alrfPrvYNBOJWirawm+6o0sKfOgfrotkp2QRjVqdGazIdqLwi6RHwn6XlgwoWStPWJTLR6xPS3pIcv0YrF07t5Yj6fQnCyPnl/R9HfbIASP717l0SW8Ihd3+827bwzP0exyaf6A5T6M4LJ8C/Z8alfdKwT3DoTZnGF15KPWRDOCDZmBfQAOLXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Egvlz0zwWwlkbfqTD0jSGOS09HnvpPeoSng+Y6EE4=;
 b=Nptsg/eMnobf33brrk/qlpBh6dNvJfu8eS+/CctmmrNTaSH5YXx+RdM38yiRCUef3hLUCwwBW/uV49YE7ETvvQ1vW8WbIDuDoNs8IEB1yKn9CFdxq5lirVpikT4XvmIyZGlm2GlEKGhQnqdsGq39OKhSyPDaBqrnXLkTyq02QXjhWAcIbEtP/HjNK5v4Pbt4xo4q+TumKe+yuaiTExLqwjkIyxizeRggsTc/JbaYRLfBV+H+23ZLw67Uw2uydPl17f7HegjitQC01OvHt4B577/fhPRq1A92YQTEjYI2oxiPmtLGcEnS31WtEQ1SxNCTXIJOpMYyrJtexw0Wo4fZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Egvlz0zwWwlkbfqTD0jSGOS09HnvpPeoSng+Y6EE4=;
 b=U+L5GQkh/hO+Lbwx7m4UDd6hbnDwgWTabUKRiDYCfLFDj6WBG2TelHZSBFzteb3XRSFUMuaTHaZnmCSiYheVX8y87TvLSs3SE+EFG4Je2Bk8x2pbQvaff+6uc8co4130WftODV+HvREw+v+aOaobYxK+DtBH9CtbGkawwN/KTLE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2710.eurprd04.prod.outlook.com (2603:10a6:4:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 06:06:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 06:06:01 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, s.hauer@pengutronix.de,
        leonard.crestez@nxp.com, abel.vesa@nxp.com, aisheng.dong@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 06/10] clk: imx8m: migrate A53 clk root to use composite core
Date:   Thu,  7 May 2020 13:56:15 +0800
Message-Id: <1588830979-11586-7-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
References: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0147.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 06:05:57 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fa1602f-f123-4dba-16da-08d7f24cb812
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2710:|DB6PR0402MB2710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB27108A43255AF76C62C70C5A88A50@DB6PR0402MB2710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Njye2IHfM68RVjUiUTnh6ufI7kbJhsv5P3TMpHDHpGYelAxsRYnzRirJ7niqzTyQhvWrcOV/4MrRfaSgA653Epc7UfaPGUKp93knfPgVa320gT01KfATnJ+f+cHHLsqUmGZ5XdujiC0P/Xmu6fLMhPJYp7mDCBvLDSi4Q9akao492wkgT+bg0su+gc+d8IiYBqiexZX25XDJwRUlmAd3cpMiCxPONsZOUB2DL6DxGsdct6wp1xPSOnxLAE18W4DQ0nMQmIZqE9L6Fr+6Stswe646lKwSKRSrSFmuMOqT6vFyQryOscu21P6UNsOBVULgOto5hglCvAcFjA6keQ18yQ3wcQRPzIrC60MY0JBCd6lavBy3LDXBdsPkuypEpaJIzV3zJ0OcZsmD7qqAF9WS9SOa1dRk3/bs5hNdrFjlpc1ZsBNhjIEDZ1JysJZWe+zdmLk6SNhUbH4iJEHJx/cbiCp/qX6yVrTu/N1RctsLKhSqZvv3aGvcHFxSDSUJe8OoOh6DnVx4ImJa7Vh+j9E8aax8Qj/PTiQ1giathQNM6unsU44DbjTA4sXhDbVB0qwK2dCjVeLyc4l1PJAh6Vc4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(33430700001)(316002)(33440700001)(478600001)(2616005)(16526019)(69590400007)(6666004)(4326008)(66476007)(66946007)(86362001)(2906002)(66556008)(956004)(6486002)(52116002)(36756003)(8676002)(26005)(6506007)(8936002)(5660300002)(186003)(6512007)(9686003)(83320400001)(83280400001)(83300400001)(83310400001)(83290400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 9navhaoSL18UZ3wooETA3NEuWwRGvR6TJ1UTJOjuFuyWko2dP7lPHLgGeVvUqX5rh6kXAuedSVOCq6XNRdxal6VNMBB/t/Auc/mZqCeL4RZn6zmiq2NbHEUF/ZCJUWAXKNkGep24l/bRCxuZMMzw5hUMdsnTVIboAjBl/MKit11F0WcPstW/qblU9loH6IwG43AnoQBbebNZdVDztHH26lhIRY594mDEi4cJ6Z2/vsGJ6xX891gf9KCAqwXrgQRVEtGASDya5kWDQbo8YMQ8KIqW4hjwWY9gnDC/URCIIpN98DLMUOjhVNd2LJ39e+UIRzMZ9/CX3ySHUmpNun91nfaTk4Cm8+7AGAWjfPAUNHLAVYNe0kRks63nLkavXdze/FJ5ikahZqsImObyn9xEo1uZGQQGpYAqqpE+Ga2xfvQMXfLzYRJfgnkJzUnYHtsd5+3WCmkxY/NgApJbAFEEjgYvhNq6uLv9lvu/O1xV6P+E0e12VxY4cJDsnCTlt79L0Dz5AryMAaFVGoPM7kYgordOtp66L7OJR8E/LWtQR7o788Vr8lxQh9trSSAqYrjMTNjNEDKKxE1ZIf5X0w/Dz//pYHFjfqH9PFGmrhNXvnLwg1xFzuJHpuqaDvM5AWZ5cU7dvW7YfN5Yw2Z1XdEVNd+40TjZAXRv7euzdvsq/bT/XB9rOFDgG2rTORCMRbD/KwJaFsjtxfCELuQznKl0fOkCJsyhECzaYx/Zu/eUA0Cu5Yl+HPY4dDL1UECzIGh6XpWnUgFRxzAI9NdOKz92wUo5bzBpI4c9Z/zv8MsejLo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa1602f-f123-4dba-16da-08d7f24cb812
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 06:06:01.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYlfEOP96awtvnzGCebjin5uqrbI5YSgiSq3th6kwP+5xMz8Njgg+IjXwMCApLWWPgBzONCUY54mX21Mkeui5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2710
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Migrate A53 clk root to use composite core clk type. It
will simplify code and make it easy to use composite
specific mux operation.

Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 6 +++---
 drivers/clk/imx/clk-imx8mn.c | 6 +++---
 drivers/clk/imx/clk-imx8mq.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 5435042a06e3..12443e06f329 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -416,9 +416,9 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	/* Core Slice */
-	hws[IMX8MM_CLK_A53_SRC] = imx_clk_hw_mux2("arm_a53_src", base + 0x8000, 24, 3, imx8mm_a53_sels, ARRAY_SIZE(imx8mm_a53_sels));
-	hws[IMX8MM_CLK_A53_CG] = imx_clk_hw_gate3("arm_a53_cg", "arm_a53_src", base + 0x8000, 28);
-	hws[IMX8MM_CLK_A53_DIV] = imx_clk_hw_divider2("arm_a53_div", "arm_a53_cg", base + 0x8000, 0, 3);
+	hws[IMX8MM_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mm_a53_sels, base + 0x8000);
+	hws[IMX8MM_CLK_A53_CG] = hws[IMX8MM_CLK_A53_DIV];
+	hws[IMX8MM_CLK_A53_SRC] = hws[IMX8MM_CLK_A53_DIV];
 
 	hws[IMX8MM_CLK_M4_CORE] = imx8m_clk_hw_composite_core("arm_m4_core", imx8mm_m4_sels, base + 0x8080);
 	hws[IMX8MM_CLK_VPU_CORE] = imx8m_clk_hw_composite_core("vpu_core", imx8mm_vpu_sels, base + 0x8100);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 6cac6ca03e12..bd3759b4afd0 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -413,9 +413,9 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	}
 
 	/* CORE */
-	hws[IMX8MN_CLK_A53_SRC] = imx_clk_hw_mux2("arm_a53_src", base + 0x8000, 24, 3, imx8mn_a53_sels, ARRAY_SIZE(imx8mn_a53_sels));
-	hws[IMX8MN_CLK_A53_CG] = imx_clk_hw_gate3("arm_a53_cg", "arm_a53_src", base + 0x8000, 28);
-	hws[IMX8MN_CLK_A53_DIV] = imx_clk_hw_divider2("arm_a53_div", "arm_a53_cg", base + 0x8000, 0, 3);
+	hws[IMX8MN_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mn_a53_sels, base + 0x8000);
+	hws[IMX8MN_CLK_A53_SRC] = hws[IMX8MN_CLK_A53_DIV];
+	hws[IMX8MN_CLK_A53_CG] = hws[IMX8MN_CLK_A53_DIV];
 
 	hws[IMX8MN_CLK_GPU_CORE] = imx8m_clk_hw_composite_core("gpu_core", imx8mn_gpu_core_sels, base + 0x8180);
 	hws[IMX8MN_CLK_GPU_SHADER] = imx8m_clk_hw_composite_core("gpu_shader", imx8mn_gpu_shader_sels, base + 0x8200);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 201c7bbb201f..91309ff65441 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -405,9 +405,9 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	/* CORE */
-	hws[IMX8MQ_CLK_A53_SRC] = imx_clk_hw_mux2("arm_a53_src", base + 0x8000, 24, 3, imx8mq_a53_sels, ARRAY_SIZE(imx8mq_a53_sels));
-	hws[IMX8MQ_CLK_A53_CG] = imx_clk_hw_gate3_flags("arm_a53_cg", "arm_a53_src", base + 0x8000, 28, CLK_IS_CRITICAL);
-	hws[IMX8MQ_CLK_A53_DIV] = imx_clk_hw_divider2("arm_a53_div", "arm_a53_cg", base + 0x8000, 0, 3);
+	hws[IMX8MQ_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mq_a53_sels, base + 0x8000);
+	hws[IMX8MQ_CLK_A53_CG] = hws[IMX8MQ_CLK_A53_DIV];
+	hws[IMX8MQ_CLK_A53_SRC] = hws[IMX8MQ_CLK_A53_DIV];
 
 	hws[IMX8MQ_CLK_M4_CORE] = imx8m_clk_hw_composite_core("arm_m4_core", imx8mq_arm_m4_sels, base + 0x8080);
 	hws[IMX8MQ_CLK_VPU_CORE] = imx8m_clk_hw_composite_core("vpu_core", imx8mq_vpu_sels, base + 0x8100);
-- 
2.16.4


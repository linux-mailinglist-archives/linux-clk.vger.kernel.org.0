Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D770C1C8202
	for <lists+linux-clk@lfdr.de>; Thu,  7 May 2020 08:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgEGGFu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 May 2020 02:05:50 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:22990
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725969AbgEGGFt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 May 2020 02:05:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwx63zJlzHlYTiOVHCozlJKHYGtWziSagn0fpF86n8p6dX2d+n5WubmMycaAP07/g0YUOVOtcbxJCmwU5gl+OfPzpKSd2nPWyYCpYDUAe6JtVrROYoZBbqpz7sClwQJMMCm4AddJ0YaRQJ3NN7MD10231LUXNHNOXWAaM+IyniOmWQM6o927IJ9UIh3fcpHXpeCXJagXANPz0kOrkflk2gEZQgqFwiv1rlD+NFv/NkZlNjKLch59ZF6CNO+scTV8n025trx5tD9W9aP3pBqY2gC1sMij7ROr6bVEw97TFTOCrhfRVLnMZHV9kzViemID2Sah1EQNCqbIUhIdAn8yJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/kBqehtXwv5r1trY4CEvgj+oRVZ7IzUh0jwcEFxkxs=;
 b=et+YWN72mEbQsz47ekC6SbZ3IgNHL8acyDwxngvu/7RPDx5U6KgOz2DEaKoQuyF6+wfdq+EA6NQWWMfwVwaEjM4rDDxbuJBCy8VI8W16kSXXJteFHZX0y088Gt6R9sJpVzdgt7IbmfqNKkx/4HjO414rnfTGG71Ix4fCe+XzvJFfoKU/ZNzSH/HgXf8hZAp1577VImgLzYfqSYtL89Fll2MtFq+N7oedBgakpRkU+Zcc3I20MPxO8zghH5mO0PwpJwXen3oqj2jJWLvPCGS2bqWN1OoLbIigNjgYY2CelWsU/trFac12bt3JxD+6nUI6W7SL+0O9CxVXoT9NYagUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/kBqehtXwv5r1trY4CEvgj+oRVZ7IzUh0jwcEFxkxs=;
 b=Pe6iLzASP7vejmPIMPixnpsyLV3KgEJD89Cz7j04XXNtqjrtriIFQHCAQyA7Yd11US2Q+rA+v4oHe1MjYonn6m+LLCPctccIBDFWEq2yN2PKrsheItu2dnBYgBTfePbroiGzjAZZecV4Vy5hCeYBy0ijKGeL79BQ66bqlj81I+c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2710.eurprd04.prod.outlook.com (2603:10a6:4:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 06:05:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 06:05:44 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, s.hauer@pengutronix.de,
        leonard.crestez@nxp.com, abel.vesa@nxp.com, aisheng.dong@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 02/10] clk: imx8m: drop clk_hw_set_parent for A53
Date:   Thu,  7 May 2020 13:56:11 +0800
Message-Id: <1588830979-11586-3-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
References: <1588830979-11586-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0147.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 06:05:39 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4d0d8d5-b8d4-45ac-2e93-08d7f24cad6f
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2710:|DB6PR0402MB2710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2710460F58C5C920A13F9C6B88A50@DB6PR0402MB2710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrjbX+yGNmJx92HssclyMSxkZbCtAh8LOEBibrLzGq393cKj7x7gqIY7MloelkzD8k+PE6Fk085u+wsv3W/dC72GyE1xxK66hO8AMIuR4zYIAOiCR82/PkxXOmr23kDLFuKmXTHnSIY1YgeLi4Qu3KCQwvHcjP7pZM00NOdMnLoHFVSqLpitmmcs6kpfC+mInenOarcAlKfQPhgUX79YvHAB/ZVJCUm5HVI3ij9he8CDDuuKhu3EXC7O9dSAVTHIbr3Oitr7vMJPeo7uxm3VpN4D+SHWcuwIgDEQy8w7yQ6wuHg1W3Gqn95oX07P4XjC8JW8HGQWxB0Rin7sCFd63PkNzTUFlZrIDlzdJfCUrYmvR+SamcKz8MVEi4Tx4/0EDrc/TQHPK/InTWFcl4GRtFijWaQNs7A7Wr89ufNOgmPFQeJUOxuv6w9cUSw6mhtmI1wjA3t5tUVfdfQ+fz/SOIjkKZsdp4Fr7SRyTh+A8XvZbd6DhE7SW6mkrDRrJfeX+sXBVUN9F5JkqTffWHbG6WTJ+/s16aMbfhjUiqliFpzy0tsZUPComF4EUwt7rhIMAIfePExapG81y3Ha5C/Kaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(33430700001)(316002)(33440700001)(478600001)(2616005)(16526019)(69590400007)(6666004)(4326008)(66476007)(66946007)(86362001)(2906002)(66556008)(956004)(6486002)(52116002)(36756003)(8676002)(26005)(6506007)(8936002)(5660300002)(186003)(6512007)(9686003)(83320400001)(83280400001)(83300400001)(83310400001)(83290400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KdeG5KUyP4qdFTQqK0u/xwVC/JJiZLTRf6vhZUYSB/g5VNLtRj4jXkvC5ltRTLGX+ejy69YPkOQaJG5x2i4E0PSgOGaHgg9wwGqWUJdTiK3zyXZLqhEfdY1Ri9nQxfiXlr14NEZnT5F8gPTNXJjhMpGKrbQQWL5pDnW5TOC+21MWCfrE0WSsR+GCdgSuXBV/LqrrERFVTl124hNCLFUcjU7slrNEyuQMgDihGXXro8t/l0z2vb1+fny0oI4nFMPUjSB/Nrp7NhMnrDii9YaYTlPawNjhSO21T4o9KAoxiopQ1pqQB6+F/hTm+3cE4DT5XRmh7Wkx16Uu5J2sVwKk3F73szpn2KagPs+Xx6JGoA/7iJ3SZx0wmKimFwDQsCjnz3LmGRhC9ClFdpevbD1MCLzzXHsHVCpDGcHRYtx02lpAWhPZVFTXL4XfGpIXmEooX6srTu/JiiClB9Ij7v4sWVpEitL9OAEJzXv+kghMpj/NYiQtS4PLEWwHBsuYU1kQJ1hb6+1zE0K9I6eBVt/qZYUiad0kfulOnrBsipDNZXDEefBGOuGdk3ImdXcZX0lK1pWO6ylD/O7q1lKO8Pye9xixiSoxRWOuTcc9xYYPV3S/YN4syd26sXOdN7oV9CtCbVq5+FIWy1N5cO6hCweQg8D7+JDG/IC8qspVQt38IWZPwtFGqAA4tu4B172qYxxYfdnqCwUrUyixHJi9NJ+K/ZJU1QpWWsqYB1wFufPlaE/n4J9BzGb7E0fs4FB8Z7xJGPEFLkBBeugQskStHC8h3J8h0t0Qo42zeDyeUfOf8R0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d0d8d5-b8d4-45ac-2e93-08d7f24cad6f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 06:05:43.9484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBVlAs6XbTRWJak05ff5IbPiNw4uiWgqpa5QeTiNSl1pxTnoSRUQD7VsvzYKxvUs8KMpRYdMnigRZPRGwqTgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2710
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The parent settings have been moved to dtsi, we no need to
set parent here. And clk_hw_set_parent will trigger lockdep warning,
because this api not have prepare_lock.

Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 3 ---
 drivers/clk/imx/clk-imx8mn.c | 3 ---
 drivers/clk/imx/clk-imx8mp.c | 3 ---
 drivers/clk/imx/clk-imx8mq.c | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 925670438f23..5435042a06e3 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -614,9 +614,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 					   hws[IMX8MM_ARM_PLL_OUT]->clk,
 					   hws[IMX8MM_CLK_A53_DIV]->clk);
 
-	clk_hw_set_parent(hws[IMX8MM_CLK_A53_SRC], hws[IMX8MM_SYS_PLL1_800M]);
-	clk_hw_set_parent(hws[IMX8MM_CLK_A53_CORE], hws[IMX8MM_ARM_PLL_OUT]);
-
 	imx_check_clk_hws(hws, IMX8MM_CLK_END);
 
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 0bc7070235bd..6cac6ca03e12 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -565,9 +565,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 					   hws[IMX8MN_ARM_PLL_OUT]->clk,
 					   hws[IMX8MN_CLK_A53_DIV]->clk);
 
-	clk_hw_set_parent(hws[IMX8MN_CLK_A53_SRC], hws[IMX8MN_SYS_PLL1_800M]);
-	clk_hw_set_parent(hws[IMX8MN_CLK_A53_CORE], hws[IMX8MN_ARM_PLL_OUT]);
-
 	imx_check_clk_hws(hws, IMX8MN_CLK_END);
 
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 41469e2cc3de..e05ec56df285 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -735,9 +735,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 					     hws[IMX8MP_ARM_PLL_OUT]->clk,
 					     hws[IMX8MP_CLK_A53_DIV]->clk);
 
-	clk_hw_set_parent(hws[IMX8MP_CLK_A53_SRC], hws[IMX8MP_SYS_PLL1_800M]);
-	clk_hw_set_parent(hws[IMX8MP_CLK_A53_CORE], hws[IMX8MP_ARM_PLL_OUT]);
-
 	imx_check_clk_hws(hws, IMX8MP_CLK_END);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index fdc68db68de5..201c7bbb201f 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -599,9 +599,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 					   hws[IMX8MQ_ARM_PLL_OUT]->clk,
 					   hws[IMX8MQ_CLK_A53_DIV]->clk);
 
-	clk_hw_set_parent(hws[IMX8MQ_CLK_A53_SRC], hws[IMX8MQ_SYS1_PLL_800M]);
-	clk_hw_set_parent(hws[IMX8MQ_CLK_A53_CORE], hws[IMX8MQ_ARM_PLL_OUT]);
-
 	imx_check_clk_hws(hws, IMX8MQ_CLK_END);
 
 	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
-- 
2.16.4


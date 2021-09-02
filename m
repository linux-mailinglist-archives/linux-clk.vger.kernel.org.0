Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6643FEA57
	for <lists+linux-clk@lfdr.de>; Thu,  2 Sep 2021 10:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbhIBIDN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 2 Sep 2021 04:03:13 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:48372 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233362AbhIBIDN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Sep 2021 04:03:13 -0400
X-UUID: ad9677fad92543eab8de0177812a540f-20210902
X-UUID: ad9677fad92543eab8de0177812a540f-20210902
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 56561524; Thu, 02 Sep 2021 16:02:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 16:02:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 16:02:12 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] clk: imx: use module_platform_driver
Date:   Thu, 2 Sep 2021 16:02:11 +0800
Message-ID: <20210902080211.7922-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace builtin_platform_driver_probe with module_platform_driver_probe
because that CONFIG_CLK_IMX8QXP can be set to =m (kernel module).

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 drivers/clk/imx/clk-imx8qxp.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index d3e905cf867d..b23758083ce5 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -370,7 +370,7 @@ static struct platform_driver imx8qxp_lpcg_clk_driver = {
 	.probe = imx8qxp_lpcg_clk_probe,
 };
 
-builtin_platform_driver(imx8qxp_lpcg_clk_driver);
+module_platform_driver(imx8qxp_lpcg_clk_driver);
 
 MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8QXP LPCG clock driver");
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index c53a688d8ccc..40a2efb1329b 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -308,7 +308,7 @@ static struct platform_driver imx8qxp_clk_driver = {
 	},
 	.probe = imx8qxp_clk_probe,
 };
-builtin_platform_driver(imx8qxp_clk_driver);
+module_platform_driver(imx8qxp_clk_driver);
 
 MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
-- 
2.18.0


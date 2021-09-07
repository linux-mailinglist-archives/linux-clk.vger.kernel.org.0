Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E1140255C
	for <lists+linux-clk@lfdr.de>; Tue,  7 Sep 2021 10:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243034AbhIGIsJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Sep 2021 04:48:09 -0400
Received: from mx21.baidu.com ([220.181.3.85]:58584 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242641AbhIGIsI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 7 Sep 2021 04:48:08 -0400
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
        by Forcepoint Email with ESMTPS id DBF875D544D62974E80F;
        Tue,  7 Sep 2021 16:46:59 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 7 Sep 2021 16:46:59 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 16:46:59 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-actions@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: actions: Make use of the helper function devm_platform_ioremap_resource()
Date:   Tue, 7 Sep 2021 16:46:53 +0800
Message-ID: <20210907084653.3438-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/clk/actions/owl-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-common.c
index 4de97cc7cb54..9e98e8a92ad7 100644
--- a/drivers/clk/actions/owl-common.c
+++ b/drivers/clk/actions/owl-common.c
@@ -43,10 +43,8 @@ int owl_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct regmap *regmap;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.25.1


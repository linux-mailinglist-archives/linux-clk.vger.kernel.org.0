Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2873D557484
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jun 2022 09:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiFWHvx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jun 2022 03:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiFWHvw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 03:51:52 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C972983A;
        Thu, 23 Jun 2022 00:51:51 -0700 (PDT)
Received: from dslb-188-096-142-050.188.096.pools.vodafone-ip.de ([188.96.142.50] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1o4Hcx-0006sS-BK; Thu, 23 Jun 2022 09:51:47 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/2] clk: imx25: make __mx25_clocks_init return void
Date:   Thu, 23 Jun 2022 09:51:04 +0200
Message-Id: <20220623075104.166529-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623075104.166529-1-martin@kaiser.cx>
References: <20220602080344.208702-1-martin@kaiser.cx>
 <20220623075104.166529-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The __mx25_clocks_init function always returns 0 and its only
caller does not check the return value. Let's remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2:
- send the patch to the clk maintainers

 drivers/clk/imx/clk-imx25.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index 263409fca1eb..72b30dd7f05f 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -74,7 +74,7 @@ enum mx25_clks {
 
 static struct clk *clk[clk_max];
 
-static int __init __mx25_clocks_init(void __iomem *ccm_base)
+static void __init __mx25_clocks_init(void __iomem *ccm_base)
 {
 	BUG_ON(!ccm_base);
 
@@ -222,8 +222,6 @@ static int __init __mx25_clocks_init(void __iomem *ccm_base)
 	imx_register_uart_clocks(6);
 
 	imx_print_silicon_rev("i.MX25", mx25_revision());
-
-	return 0;
 }
 
 static void __init mx25_clocks_init_dt(struct device_node *np)
-- 
2.30.2


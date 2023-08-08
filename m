Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3367744B0
	for <lists+linux-clk@lfdr.de>; Tue,  8 Aug 2023 20:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbjHHS0y (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Aug 2023 14:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235831AbjHHS0e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:26:34 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7E52334E
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:41:14 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RKtQQ3SVWz1L96Y;
        Tue,  8 Aug 2023 20:53:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 20:54:12 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] clk: cdce925: Remove redundant of_match_ptr()
Date:   Tue, 8 Aug 2023 20:53:41 +0800
Message-ID: <20230808125341.4073115-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/clk/clk-cdce925.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 96ac90364847..cdee4958f26d 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -834,7 +834,7 @@ MODULE_DEVICE_TABLE(of, clk_cdce925_of_match);
 static struct i2c_driver cdce925_driver = {
 	.driver = {
 		.name = "cdce925",
-		.of_match_table = of_match_ptr(clk_cdce925_of_match),
+		.of_match_table = clk_cdce925_of_match,
 	},
 	.probe		= cdce925_probe,
 	.id_table	= cdce925_id,
-- 
2.34.1


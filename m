Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C460354226C
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jun 2022 08:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbiFHFDZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Jun 2022 01:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbiFHFDR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jun 2022 01:03:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073F62DC209;
        Tue,  7 Jun 2022 18:53:54 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHqw05xKSzgcdJ;
        Wed,  8 Jun 2022 09:51:44 +0800 (CST)
Received: from CHINA (10.175.102.38) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 8 Jun
 2022 09:53:32 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] clk: stm32: rcc_reset: Fix missing spin_lock_init()
Date:   Wed, 8 Jun 2022 02:11:54 +0000
Message-ID: <20220608021154.990347-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver allocates the spinlock but not initialize it.
Use spin_lock_init() on it to initialize it correctly.

Fixes: 637cee5ffc71 ("clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/stm32/reset-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index 040870130e4b..e89381528af9 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -111,6 +111,7 @@ int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
 	if (!reset_data)
 		return -ENOMEM;
 
+	spin_lock_init(&reset_data->lock);
 	reset_data->membase = base;
 	reset_data->rcdev.owner = THIS_MODULE;
 	reset_data->rcdev.ops = &stm32_reset_ops;


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF44345B7A
	for <lists+linux-clk@lfdr.de>; Tue, 23 Mar 2021 10:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCWJ6R (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 23 Mar 2021 05:58:17 -0400
Received: from m12-13.163.com ([220.181.12.13]:36324 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhCWJ5n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Mar 2021 05:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=LP3PtY05qoq7MHAofL
        2YGDC7WPTkoWtnZxuEgxWNOHM=; b=iowCw/rrDjyinriryH7O+baKez7tqD8enq
        Ts/6Ghc5ziwgWOEDP9V+J2n/zZ9TlADyUFYj6N0dIAenyqmJYm4J0ta6yzdfrOux
        vLNqwKB3+vJBdunMY5E6BdkDphmWDKLgmHNXDQAIY9yGO1cgTOnxQS0zoi9bh6VJ
        +i5Q4sCgs=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
        by smtp9 (Coremail) with SMTP id DcCowAB33k4kl1lg8gZQCg--.11268S2;
        Tue, 23 Mar 2021 15:22:19 +0800 (CST)
From:   Jian Dong <dj0227@163.com>
To:     david@lechnology.com, nsekhar@ti.com, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, huyue2@yulong.com,
        Jian Dong <dongjian@yulong.com>
Subject: [PATCH] clk: davinci: fix regmap use PTR_ERR after initial
Date:   Tue, 23 Mar 2021 15:22:06 +0800
Message-Id: <1616484126-131947-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: DcCowAB33k4kl1lg8gZQCg--.11268S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF15Wr4rAFW8ZF48GrWDCFg_yoWftFb_Cr
        18XFsFgr10gF1UAr4rGFWxZFZYyF4a9F9I9F4SqrsIq34UZF1avFykXwnrCw45Wry2qr9r
        Ga42gr4ak3WUJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0oa0PUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/1tbiqAte3Vc7UAq0cQAAsT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jian Dong <dongjian@yulong.com>

fixes coccicheck ERROR:

drivers/clk/davinci/da8xx-cfgchip.c:768:18-25: ERROR:
PTR_ERR applied after initialization to constant on line 746

Signed-off-by: Jian Dong <dongjian@yulong.com>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 77d1827..f57ba1b 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -743,7 +743,7 @@ static int da8xx_cfgchip_probe(struct platform_device *pdev)
 	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
 	const struct of_device_id *of_id;
 	da8xx_cfgchip_init clk_init = NULL;
-	struct regmap *regmap = NULL;
+	struct regmap *regmap;
 
 	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
 	if (of_id) {
-- 
1.9.1



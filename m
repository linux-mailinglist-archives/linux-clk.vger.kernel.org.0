Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FD75628FC
	for <lists+linux-clk@lfdr.de>; Fri,  1 Jul 2022 04:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiGAC3c (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Jun 2022 22:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiGAC3c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 22:29:32 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25B654D15F
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Cg96k
        4Jhou0N5k1a1X1NVFJEpoaXfZjdkCGMI7X2Fq8=; b=Wwi3l2KUMt5ir3sfl8pOW
        xhAWb+wToorJvEwkgmda0z5cVs2bM+Z8mGQK3eIxIXTTDp0BWATI3pE9g6jNtph8
        p5qC8nDWIygbM38RRDJtSsZB7vnXAt4fBPpMjZaiOuXzxyKd3Mg+SeiBEBwLZrM3
        0ZFn7nIowGDckkvmPynvQQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACX2Pf4W75ixuX8EA--.43467S2;
        Fri, 01 Jul 2022 10:29:13 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v3] clk: sprd: Hold reference returned by of_get_parent()
Date:   Fri,  1 Jul 2022 10:29:12 +0800
Message-Id: <20220701022912.221772-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACX2Pf4W75ixuX8EA--.43467S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4xKFWUGF4DZr1fWFg_yoW8CrWfpa
        48WFW5ZFsrWrW8Wrs2yF95ZFyFq342qayF934xC3Za9wnxtF18Ww1F9Fy5urZ0yF95Ca45
        Jryqy3y8Ja1UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uxl19UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgIxF1-HZal8sQAAsn
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_put() for refcount balance.

Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
     (2) fix typo in commit-log: of_node_out --> of_node_put
 v2: minimize the effective range of of_get_parent() advised by Orson
 v1: hold reference returned by of_get_parent()

 v2-link: https://lore.kernel.org/all/20220628135230.166601-1-windhl@126.com/
 v1-link: https://lore.kernel.org/all/20220624103809.4167753-1-windhl@126.com/

 Patched file has been compiled test in 5.19rc2.


 drivers/clk/sprd/common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index d620bbbcdfc8..bbe691d6a9a8 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
+	struct device_node *node = dev->of_node, *np;
 	struct regmap *regmap;
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
@@ -50,8 +50,9 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			pr_err("%s: failed to get syscon regmap\n", __func__);
 			return PTR_ERR(regmap);
 		}
-	} else if (of_device_is_compatible(of_get_parent(dev->of_node),
-			   "syscon")) {
+	} else if (of_device_is_compatible(np =
+	of_get_parent(dev->of_node), "syscon")
+			   || (of_node_put(np), 0)) {
 		regmap = device_node_to_regmap(of_get_parent(dev->of_node));
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "failed to get regmap from its parent.\n");
-- 
2.25.1


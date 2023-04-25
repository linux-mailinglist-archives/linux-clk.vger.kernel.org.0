Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73EA16EE2FA
	for <lists+linux-clk@lfdr.de>; Tue, 25 Apr 2023 15:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbjDYN2f (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Apr 2023 09:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbjDYN2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2023 09:28:34 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37296CC08;
        Tue, 25 Apr 2023 06:28:31 -0700 (PDT)
Received: from localhost.localdomain ([172.16.0.254])
        (user=ziqin_l@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 33PDQ3id031077-33PDQ3ie031077
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Tue, 25 Apr 2023 21:26:21 +0800
From:   Ziqin Liu <ziqin_l@hust.edu.cn>
To:     dzm91@hust.edu.cn, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Ziqin Liu <ziqin_l@hust.edu.cn>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173: fix memory leak in clk_mt8173_apmixed_probe
Date:   Tue, 25 Apr 2023 21:26:00 +0800
Message-Id: <20230425132601.106181-1-ziqin_l@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: ziqin_l@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'base' from of_iomap() is not released until the prode function returns,
a memory leak will occur in some case, so use devm_of_iomap() instead of
of_iomap() to automatically handle the unused ioremap region.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Ziqin Liu <ziqin_l@hust.edu.cn>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index a56c5845d07a..f80de9e60b21 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
+	base = devm_of_iomap(pdev->dev, node, 0, NULL);
 	if (!base)
 		return PTR_ERR(base);
 
-- 
2.25.1


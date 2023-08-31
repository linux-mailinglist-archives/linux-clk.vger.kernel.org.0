Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7554678EB2F
	for <lists+linux-clk@lfdr.de>; Thu, 31 Aug 2023 12:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbjHaK60 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 31 Aug 2023 06:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbjHaK60 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 06:58:26 -0400
X-Greylist: delayed 998 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 31 Aug 2023 03:58:22 PDT
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC75CF4
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 03:58:22 -0700 (PDT)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id B453A440E97;
        Thu, 31 Aug 2023 13:40:54 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1693478454;
        bh=gmLsht0AfTMiYjFBJexACC/YbakFqRYgTpdOTxdg1PQ=;
        h=From:To:Cc:Subject:Date:From;
        b=TsCuqpvLS68qpDZHSkeW5uN8qMayeF08hTuYk2Smk7RPsYxJh+a9LHMqt+Rn+b1iC
         vc+WSw3cSVmzOJkqzC2e9dc1HKetbd+1AVYlz8yrv87pXrcMrjvohTQQXKZ4FjFYt6
         bn2emXiLWC9uWp9QSomkwvw8I10NxLTYlsW7+8CZzXqDz7JtRaBSMY/iUoaKC89nfA
         pPKUXzX66K5GSymDgXr8wo4pvzsmv+0O6ublcNsu8/BTtPcoKIxCCm8qade7Ur9ED8
         SAN2unu8RfqdazdAD7t9dytjcrL2Pxu9z6fWvXyN1Rj8beYBDqwq2V4MPtny7CiOd/
         FMB/8F2nNs9ug==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] clk: gate: fix comment typo
Date:   Thu, 31 Aug 2023 13:41:18 +0300
Message-Id: <7dfbd302399d8f0c1430151633bc734e64ee348b.1693478478.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/clk/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 64283807600b..f4f5b489a1f2 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -15,7 +15,7 @@
 #include <linux/string.h>
 
 /**
- * DOC: basic gatable clock which can gate and ungate it's ouput
+ * DOC: basic gatable clock which can gate and ungate it's output
  *
  * Traits of this clock:
  * prepare - clk_(un)prepare only ensures parent is (un)prepared
-- 
2.40.1


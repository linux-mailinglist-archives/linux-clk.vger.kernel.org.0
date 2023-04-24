Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CF76D3277
	for <lists+linux-clk@lfdr.de>; Sat,  1 Apr 2023 17:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjDAPwX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 1 Apr 2023 11:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjDAPwW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Apr 2023 11:52:22 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101F522E90
        for <linux-clk@vger.kernel.org>; Sat,  1 Apr 2023 08:52:20 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id idWapMwyLusWfidWap27kk; Sat, 01 Apr 2023 17:52:19 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 01 Apr 2023 17:52:19 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: stm32h7: Remove an unused field in struct stm32_fractional_divider
Date:   Sat,  1 Apr 2023 17:52:12 +0200
Message-Id: <e08a470fbd6151ebd83a548714c08807a80a8ad0.1680364296.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'mmask' has never been used in this driver.
Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/clk-stm32h7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-stm32h7.c b/drivers/clk/clk-stm32h7.c
index 1a701eada0c1..04c18a1d45d3 100644
--- a/drivers/clk/clk-stm32h7.c
+++ b/drivers/clk/clk-stm32h7.c
@@ -667,7 +667,6 @@ struct stm32_fractional_divider {
 	void __iomem	*mreg;
 	u8		mshift;
 	u8		mwidth;
-	u32		mmask;
 
 	void __iomem	*nreg;
 	u8		nshift;
-- 
2.34.1


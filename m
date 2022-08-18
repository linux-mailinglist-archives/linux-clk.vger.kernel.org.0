Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87F5598E80
	for <lists+linux-clk@lfdr.de>; Thu, 18 Aug 2022 23:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346306AbiHRVAz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Aug 2022 17:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346197AbiHRVAK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 17:00:10 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11FDD34E1
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=SHA4hd2cUXkZXhzTqpB70Kl4pAm
        N1KSped5g6UY1HzY=; b=nKpiY4GLvo6KjLX5QPQS9eSYs1un+yVlj9nJLig/9aS
        NpFaXuVLkhumLzrZ/BOz2LUNRwfQvIIRuwotxMWpDc3D4fbWH28+jDTiAvhbITja
        JP4IZ4QX7gemh6P33Q39mq9Gx4mHsOfHATHi0uRd5t+x8/1nSR54eLqmGQzQ/3eg
        =
Received: (qmail 3959590 invoked from network); 18 Aug 2022 23:00:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2022 23:00:01 +0200
X-UD-Smtp-Session: l3s3148p1@m4TNQ4rm2bkucref
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] clk: move from strlcpy with unused retval to strscpy
Date:   Thu, 18 Aug 2022 23:00:00 +0200
Message-Id: <20220818210000.6600-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/clkdev.c             | 2 +-
 drivers/clk/mvebu/dove-divider.c | 2 +-
 drivers/clk/tegra/clk-bpmp.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 67f601a41023..a4d4bd3f5be5 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -165,7 +165,7 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 
 	cla->cl.clk_hw = hw;
 	if (con_id) {
-		strlcpy(cla->con_id, con_id, sizeof(cla->con_id));
+		strscpy(cla->con_id, con_id, sizeof(cla->con_id));
 		cla->cl.con_id = cla->con_id;
 	}
 
diff --git a/drivers/clk/mvebu/dove-divider.c b/drivers/clk/mvebu/dove-divider.c
index 7e35c891e168..0a90452ee808 100644
--- a/drivers/clk/mvebu/dove-divider.c
+++ b/drivers/clk/mvebu/dove-divider.c
@@ -170,7 +170,7 @@ static struct clk *clk_register_dove_divider(struct device *dev,
 		.num_parents = num_parents,
 	};
 
-	strlcpy(name, dc->name, sizeof(name));
+	strscpy(name, dc->name, sizeof(name));
 
 	dc->hw.init = &init;
 	dc->base = base;
diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 3748a39dae7c..d82a71f10c2c 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -349,7 +349,7 @@ static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
 	if (err < 0)
 		return err;
 
-	strlcpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
+	strscpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
 	info->num_parents = response.num_parents;
 
 	for (i = 0; i < info->num_parents; i++)
-- 
2.35.1


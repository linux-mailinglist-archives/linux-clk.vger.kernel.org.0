Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A6B4F67FB
	for <lists+linux-clk@lfdr.de>; Wed,  6 Apr 2022 19:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239809AbiDFR6K (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Apr 2022 13:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240097AbiDFR5u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 13:57:50 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D184100A71;
        Wed,  6 Apr 2022 09:19:15 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 272B020016;
        Wed,  6 Apr 2022 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649261954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zAtIbUPsxkJ2Vkxs0B9jhzXSzY5HA+HvzfhgI4EksRw=;
        b=aozyhlsfUIrPIQ3htCEJuWfOJ/YAydIMgJrrru5uol0KIelXu/kFf8rFRc93KTKHJCZP3B
        vOTM6ytoHROdeUg/uBCaR44mvPAdDAvRpJ2SZRYKjRq6YzgK/3NSeOlHCph8eZy0a18D4C
        usY5GIyhdnXWJBxPsbbQ7rUe2/shPRemS2RJi1YYwkSIfTzbM5MtcHVZkN2jmUL7RhAMa9
        gahUR3+lpG1+/Q9RBuyh6U5g8+Nsnc+eTwB+cd13WsKgp2Uk7yaIl/K0ZqN90HJBv6cim8
        Hfjd2ilRe4UXSb0IG/IP9+EE+nRSyfV8i/DtGSTJ6XEh4//kDUlMk+F4IqI86w==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v8 6/9] clk: renesas: r9a06g032: Probe possible children
Date:   Wed,  6 Apr 2022 18:18:53 +0200
Message-Id: <20220406161856.1669069-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220406161856.1669069-1-miquel.raynal@bootlin.com>
References: <20220406161856.1669069-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock controller device on r9a06g032 takes all the memory range that
is described as being a system controller. This range contains many
different (unrelated?) registers besides the ones belonging to the clock
controller, that can necessitate to be accessed from other peripherals.

For instance, the dmamux registers are there. The dmamux "device" will
be described as a child node of the clock/system controller node, which
means we need the top device driver (the clock controller driver in this
case) to populate its children manually.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 052d99059981..1df56d7ab3e1 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -16,6 +16,7 @@
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
@@ -996,7 +997,7 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 
 	sysctrl_priv = clocks;
 
-	return 0;
+	return of_platform_populate(np, NULL, NULL, dev);
 }
 
 static const struct of_device_id r9a06g032_match[] = {
-- 
2.27.0


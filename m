Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C93D61A3B9
	for <lists+linux-clk@lfdr.de>; Fri,  4 Nov 2022 22:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiKDVzg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Nov 2022 17:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiKDVzf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:55:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A97DEF3
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:55:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1or4em-0000sJ-Ap; Fri, 04 Nov 2022 22:55:20 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1or4ek-002LHf-8j; Fri, 04 Nov 2022 22:55:19 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1or4ek-00C3v2-47; Fri, 04 Nov 2022 22:55:18 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, claudiu.beznea@microchip.com,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 2/4] clk: at91: rm9200: fix usb device clock id
Date:   Fri,  4 Nov 2022 22:55:14 +0100
Message-Id: <20221104215516.2874922-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221104215516.2874922-1-m.grzeschik@pengutronix.de>
References: <20221104215516.2874922-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Referring to the datasheet the index 2 is the MCKUDP. When enabled, it
"Enables the automatic disable of the Master Clock of the USB Device
Port when a suspend condition occurs". We fix the index to the real UDP
id which "Enables the 48 MHz clock of the USB Device Port".

Cc: mturquette@baylibre.com
Cc: sboyd@kernel.org
Cc: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: ludovic.desroches@microchip.com
Cc: claudiu.beznea@microchip.com
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de
Fixes: 02ff48e4d7f7 (clk: at91: add at91rm9200 pmc driver)
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - removed ; from patch description
          - added fixes tag

 drivers/clk/at91/at91rm9200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index b174f727a8ef8d..16870943a13e54 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -40,7 +40,7 @@ static const struct clk_pll_characteristics rm9200_pll_characteristics = {
 };
 
 static const struct sck at91rm9200_systemck[] = {
-	{ .n = "udpck", .p = "usbck",    .id = 2 },
+	{ .n = "udpck", .p = "usbck",    .id = 1 },
 	{ .n = "uhpck", .p = "usbck",    .id = 4 },
 	{ .n = "pck0",  .p = "prog0",    .id = 8 },
 	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A864F868B
	for <lists+linux-clk@lfdr.de>; Thu,  7 Apr 2022 19:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiDGRu0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 Apr 2022 13:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbiDGRuZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 13:50:25 -0400
X-Greylist: delayed 7793 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 10:48:05 PDT
Received: from 6.mo582.mail-out.ovh.net (6.mo582.mail-out.ovh.net [87.98.177.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECF1184B46
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 10:48:05 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.109.143.72])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id E916723E90
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 15:19:52 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id 7E7F629330054;
        Thu,  7 Apr 2022 15:19:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003d3dd2c8b-474f-437f-be15-a227636e2f9d,
                    5995496A90EC26C6A3824F4C00BBD29EFE55D398) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 03/10] clk: cs2000-cp: use simple i2c probe function
Date:   Thu,  7 Apr 2022 17:18:24 +0200
Message-Id: <20220407151831.2371706-4-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407151831.2371706-1-steve@sk2.org>
References: <20220407151831.2371706-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 78812996052420230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeejleelvdefieeiuddtfeevkeegueehkeekvdffgedvhedugeekgfejjeekgfeugeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE,
        T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The i2c probe function here doesn't use the id information provided in
its second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/clk/clk-cs2000-cp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index dc5040a84dcc..aa5c72bab83e 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -570,8 +570,7 @@ static int cs2000_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int cs2000_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int cs2000_probe(struct i2c_client *client)
 {
 	struct cs2000_priv *priv;
 	struct device *dev = &client->dev;
@@ -625,7 +624,7 @@ static struct i2c_driver cs2000_driver = {
 		.pm	= &cs2000_pm_ops,
 		.of_match_table = cs2000_of_match,
 	},
-	.probe		= cs2000_probe,
+	.probe_new	= cs2000_probe,
 	.remove		= cs2000_remove,
 	.id_table	= cs2000_id,
 };
-- 
2.27.0


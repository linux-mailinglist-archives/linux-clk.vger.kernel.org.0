Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E54E4F8695
	for <lists+linux-clk@lfdr.de>; Thu,  7 Apr 2022 19:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346587AbiDGRvN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 Apr 2022 13:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346623AbiDGRvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 13:51:13 -0400
X-Greylist: delayed 8442 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 10:49:12 PDT
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net [178.32.119.250])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3332222EBC4
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 10:49:11 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.108.1.146])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id 24D2022C24
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 15:19:39 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id 33AA82932FF73;
        Thu,  7 Apr 2022 15:19:30 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G00317a306e9-b8ed-4920-a317-7c45dbaba21a,
                    5995496A90EC26C6A3824F4C00BBD29EFE55D398) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 01/10] clk: cdce706: use simple i2c probe function
Date:   Thu,  7 Apr 2022 17:18:22 +0200
Message-Id: <20220407151831.2371706-2-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407151831.2371706-1-steve@sk2.org>
References: <20220407151831.2371706-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 75153822891935366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeejleelvdefieeiuddtfeevkeegueehkeekvdffgedvhedugeekgfejjeekgfeugeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/clk/clk-cdce706.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index c91e9096b070..5467d941ddfd 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -627,8 +627,7 @@ of_clk_cdce_get(struct of_phandle_args *clkspec, void *data)
 	return &cdce->clkout[idx].hw;
 }
 
-static int cdce706_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int cdce706_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct cdce706_dev_data *cdce;
@@ -692,7 +691,7 @@ static struct i2c_driver cdce706_i2c_driver = {
 		.name	= "cdce706",
 		.of_match_table = of_match_ptr(cdce706_dt_match),
 	},
-	.probe		= cdce706_probe,
+	.probe_new	= cdce706_probe,
 	.remove		= cdce706_remove,
 	.id_table	= cdce706_id,
 };
-- 
2.27.0


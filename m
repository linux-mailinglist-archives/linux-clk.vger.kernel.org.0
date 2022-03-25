Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307A24E7173
	for <lists+linux-clk@lfdr.de>; Fri, 25 Mar 2022 11:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbiCYKoe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Mar 2022 06:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236476AbiCYKod (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 06:44:33 -0400
X-Greylist: delayed 730 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Mar 2022 03:42:59 PDT
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A60CC50B
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1648204977;
        bh=r7MTF35xCe4CtzCMUlH4AuHMMOLVBgWolF8Nu+I39t8=;
        h=From:To:Cc:Subject:Date;
        b=BsL/tmQi5bgyRV2NoO5Slo7/xj0Og1YxzLKe6PO3g309jBb9XKq/UZs7/6dzVcw3j
         qn0RPuUVvwCi17ze6Wwc4wz32rtrj0Uo3dq+Jh/SKCoAjPNqNHXiBnJLeJaD65pqfN
         dB4HdI+woNtMbWeNLlnghvQ4rLAp3FBcgQZ1ad9A=
Received: from localhost.localdomain ([218.197.153.188])
        by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
        id 6DFA0EBB; Fri, 25 Mar 2022 18:27:31 +0800
X-QQ-mid: xmsmtpt1648204051tp1m08xmo
Message-ID: <tencent_C0622B5C4209E83F1C6495D926979F239D05@qq.com>
X-QQ-XMAILINFO: OOWntbL6xj16UYjmDCYdk3zdV6AkUlVJYVXvFXwyqwiwhHIj+QucYg/rjcEuOt
         YO7j/eprBmyc4h2c06wgdcYMWSep4SXwq7n+QGxdcp6ICsFbd9yTBd2y9WzUKB2YwYvs/h8Mu+NF
         3O/awHA4MLl1CeBeM8HFfgPZWH4/vqzvwiDrMgaZ1iu7C+gGmhfen9xCWY78+E9vsdumUiwchXp4
         mJ73wtlnQeZQVQvB0aU6xAs+7niZUpJswpFFx/U+6co38r4urXkGPe7qIJSEtptS8cCk3XI76bTp
         GBE+6cG8pXUfIhIIY9a7UwUFabdQ/611P/rXY4ZbxNXiy8imWSu0q73DKFp1Msl/Pa6B+f5RKrac
         sSm5Px8sotmHtHcqLRGQL365aXb8G3bBusnZsNdweoK6RnKfba5j1ExXohhWM3FWaZVb01iUwIjO
         pT0uKiE2iQVbdhmVfWnzg2WAg+6AXI+v+dsz4HXd4ir0CpdQyG4Mib4UAQ2w64jYH+G2tUmzeiO9
         9N+Ovt6E8HcR0Tgr/s+oXNSDCJh9CgsVSGZnTQUqi93ePXrydTOfbWsoZ0bm/3w7cdnlXn6pNOF9
         40+wNNghlHZdV0tlfWByU4qL02Q62qlEokvhYrJA08qEVbWsPgtdDnFlY2pEOyogx28ge0OdJ2+m
         uVRokNyTXZOSXJFejgBRQH3MwBIxrMvlEuN81q5FUuHsBCfxmqKB3NrQcjYDGNjsWOA7q/UFbbU8
         0RgF7ducb3U9hMY0DCyV5rs3grDP+0m82+2Fxk+Bgc47ZWsWcTGnKI23eMDlfDInZFmuP8CXDGfo
         3F5LJfdBoqKuPXyuapA6uM02us/UpXvP6ex3EJV25oaVzPNcIvty5n3vPl95GMhOiXT+jqXPdXYX
         uhv4HuJcsBQ3Sq8KD4AmLy27zc0kW4D6QVRKYYc1Ma8FrYOrL8GxLkNokTZ7YcnIA0Tdh2vAxPmH
         erom5GfnM=
From:   xkernel.wang@foxmail.com
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] clk: pxa: add a check for the return value of kzalloc()
Date:   Fri, 25 Mar 2022 18:27:20 +0800
X-OQ-MSGID: <20220325102720.4155-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/clk/pxa/clk-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index cfc79f9..d0df104 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -102,6 +102,8 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks)
 
 	for (i = 0; i < nb_clks; i++) {
 		pxa_clk = kzalloc(sizeof(*pxa_clk), GFP_KERNEL);
+		if (!pxa_clk)
+			continue;
 		pxa_clk->is_in_low_power = clks[i].is_in_low_power;
 		pxa_clk->lp = clks[i].lp;
 		pxa_clk->hp = clks[i].hp;
-- 

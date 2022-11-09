Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163D26232D1
	for <lists+linux-clk@lfdr.de>; Wed,  9 Nov 2022 19:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiKISpP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 9 Nov 2022 13:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbiKISpA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 13:45:00 -0500
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67E165CB
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 10:44:22 -0800 (PST)
Date:   Wed, 09 Nov 2022 18:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skothe.de;
        s=protonmail; t=1668019445; x=1668278645;
        bh=tArBFYxIU8rbGdc3B/KNaqlX3OdHDKjOAiShTGewKg8=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=eQupFHc6pq1c8eC1zGUovZetU9NBkOcVbGpzGok5LlvgD7DpySYsBGFVReJoUJCVa
         SfrWJXdGWjR1JMbjqqIfohBzxjAYC/1/ZOcORi1iQfnEe7BqKTrCV/6fTGVzaBhUfI
         qsY3GIOG+8NoQWF0jwC3sQzNFsSUh9703knnGB2TP0bOcTAfKNRK/yy4lDfeucWB3D
         K0tvunJVmSGMc7ovZ535D4bJd1q9zmRP7ZUtNMj4oifT4wQfmd+u71Pxi6SNiWB4Z0
         gxyKXlF+WDBUnI7UBbVeH8UNlsnzLKpY3wz2lHqORzdaZweyRkLuc8uFc7qFdsBowS
         hUARvukQZCtJA==
To:     mturquette@baylibre.com, sboyd@kernel.org
From:   Steffen Kothe <steffen.kothe@skothe.de>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steffen Kothe <steffen.kothe@skothe.de>
Subject: [PATCH] drivers: clk: clk-conf.c: Move err to warn msg for clk re-parenting
Message-ID: <20221109184253.40531-1-steffen.kothe@skothe.de>
Feedback-ID: 55345914:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Failed clock re-parenting does not necessarily imply critical errors
since systems can initialize clocks which prohibit it by default and
purpose.

The error does not even imply any required handling which should treat
as a warning then.

Signed-off-by: Steffen Kothe <steffen.kothe@skothe.de>
---
 drivers/clk/clk-conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 2ef819606c417..d83591dc22356 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -62,7 +62,7 @@ static int __set_clk_parents(struct device_node *node, bo=
ol clk_supplier)

 =09=09rc =3D clk_set_parent(clk, pclk);
 =09=09if (rc < 0)
-=09=09=09pr_err("clk: failed to reparent %s to %s: %d\n",
+=09=09=09pr_warn("clk: failed to reparent %s to %s: %d\n",
 =09=09=09       __clk_get_name(clk), __clk_get_name(pclk), rc);
 =09=09clk_put(clk);
 =09=09clk_put(pclk);
--
2.30.2



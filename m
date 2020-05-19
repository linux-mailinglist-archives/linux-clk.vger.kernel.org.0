Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7455B1DA4D5
	for <lists+linux-clk@lfdr.de>; Wed, 20 May 2020 00:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgESWmh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 May 2020 18:42:37 -0400
Received: from v6.sk ([167.172.42.174]:58676 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728191AbgESWmg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 May 2020 18:42:36 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 18704610DD;
        Tue, 19 May 2020 22:42:05 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 06/13] clk: mmp2: Rename mmp2_pll_init() to mmp2_main_clk_init()
Date:   Wed, 20 May 2020 00:41:44 +0200
Message-Id: <20200519224151.2074597-7-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519224151.2074597-1-lkundrak@v3.sk>
References: <20200519224151.2074597-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a trivial rename for a routine that registers more clock sources
than the PLLs -- there's also a XO.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/clk/mmp/clk-of-mmp2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
index 524574187c17..ac88ea99b7c6 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -139,7 +139,7 @@ static struct mmp_clk_factor_tbl uart_factor_tbl[] = {
 	{.num = 3521, .den = 689},	/*19.23MHZ */
 };
 
-static void mmp2_pll_init(struct mmp2_clk_unit *pxa_unit)
+static void mmp2_main_clk_init(struct mmp2_clk_unit *pxa_unit)
 {
 	struct clk *clk;
 	struct mmp_clk_unit *unit = &pxa_unit->unit;
@@ -456,7 +456,7 @@ static void __init mmp2_clk_init(struct device_node *np)
 
 	mmp_clk_init(np, &pxa_unit->unit, MMP2_NR_CLKS);
 
-	mmp2_pll_init(pxa_unit);
+	mmp2_main_clk_init(pxa_unit);
 
 	mmp2_apb_periph_clk_init(pxa_unit);
 
-- 
2.26.2


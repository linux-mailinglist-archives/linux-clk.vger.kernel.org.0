Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC4381893CE
	for <lists+linux-clk@lfdr.de>; Wed, 18 Mar 2020 02:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgCRBqV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Mar 2020 21:46:21 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58796 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgCRBqV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Mar 2020 21:46:21 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 290C620038E;
        Wed, 18 Mar 2020 02:46:19 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 872B8200A1E;
        Wed, 18 Mar 2020 02:46:12 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B590D40302;
        Wed, 18 Mar 2020 09:46:04 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        abel.vesa@nxp.com, t-kristo@ti.com, jonas.gorski@gmail.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] clk: imx: clk-sscg-pll: Remove unnecessary blank lines
Date:   Wed, 18 Mar 2020 09:39:25 +0800
Message-Id: <1584495566-15110-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove many unnecessary blank lines for cleanup.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-sscg-pll.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/imx/clk-sscg-pll.c b/drivers/clk/imx/clk-sscg-pll.c
index d4a2be1..773d8a5 100644
--- a/drivers/clk/imx/clk-sscg-pll.c
+++ b/drivers/clk/imx/clk-sscg-pll.c
@@ -72,7 +72,6 @@ struct clk_sscg_pll_setup {
 	int divr2, divf2;
 	int divq;
 	int bypass;
-
 	uint64_t vco1;
 	uint64_t vco2;
 	uint64_t fout;
@@ -86,11 +85,8 @@ struct clk_sscg_pll_setup {
 struct clk_sscg_pll {
 	struct clk_hw	hw;
 	const struct clk_ops  ops;
-
 	void __iomem *base;
-
 	struct clk_sscg_pll_setup setup;
-
 	u8 parent;
 	u8 bypass1;
 	u8 bypass2;
@@ -194,7 +190,6 @@ static int clk_sscg_pll2_find_setup(struct clk_sscg_pll_setup *setup,
 					struct clk_sscg_pll_setup *temp_setup,
 					uint64_t ref)
 {
-
 	int ret;
 
 	if (ref < PLL_STAGE1_MIN_FREQ || ref > PLL_STAGE1_MAX_FREQ)
@@ -253,7 +248,6 @@ static int clk_sscg_pll1_find_setup(struct clk_sscg_pll_setup *setup,
 					struct clk_sscg_pll_setup *temp_setup,
 					uint64_t ref)
 {
-
 	int ret;
 
 	if (ref < PLL_REF_MIN_FREQ || ref > PLL_REF_MAX_FREQ)
@@ -280,7 +274,6 @@ static int clk_sscg_pll_find_setup(struct clk_sscg_pll_setup *setup,
 	temp_setup.fout_request = rate;
 
 	switch (try_bypass) {
-
 	case PLL_BYPASS2:
 		if (prate == rate) {
 			setup->bypass = PLL_BYPASS2;
@@ -288,11 +281,9 @@ static int clk_sscg_pll_find_setup(struct clk_sscg_pll_setup *setup,
 			ret = 0;
 		}
 		break;
-
 	case PLL_BYPASS1:
 		ret = clk_sscg_pll2_find_setup(setup, &temp_setup, prate);
 		break;
-
 	case PLL_BYPASS_NONE:
 		ret = clk_sscg_pll1_find_setup(setup, &temp_setup, prate);
 		break;
@@ -301,7 +292,6 @@ static int clk_sscg_pll_find_setup(struct clk_sscg_pll_setup *setup,
 	return ret;
 }
 
-
 static int clk_sscg_pll_is_prepared(struct clk_hw *hw)
 {
 	struct clk_sscg_pll *pll = to_clk_sscg_pll(hw);
-- 
2.7.4


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A88EBCED5
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 19:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410501AbfIXQs0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 12:48:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:40112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405771AbfIXQs0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Sep 2019 12:48:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17CF420673;
        Tue, 24 Sep 2019 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569343704;
        bh=VuxlzBzhQeFjKHVvyyE52Ljx9pPrF9R8j1sj9Gw04SM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ux0qtR1PaP9GPAzLpgwbWurZ5oAy/6We91QP1meKxSwlVzO+N1LY8v31NzMtV7/sp
         WRlO+zQdMY0sz1FjH14Jk5yf3P7xHqISyNFnvQ9/dHEU9PWdnf6/bIAZsUdsfR1vcL
         BZ6v6KPB+Na0c3onqlKa1mxRQwPlv+ABIs7ZWc4w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 60/70] clk: imx: pll14xx: avoid glitch when set rate
Date:   Tue, 24 Sep 2019 12:45:39 -0400
Message-Id: <20190924164549.27058-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit dee1bc9c23cd41fe32549c0adbe6cb57cab02282 ]

According to PLL1443XA and PLL1416X spec,
"When BYPASS is 0 and RESETB is changed from 0 to 1, FOUT starts to
output unstable clock until lock time passes. PLL1416X/PLL1443XA may
generate a glitch at FOUT."

So set BYPASS when RESETB is changed from 0 to 1 to avoid glitch.
In the end of set rate, BYPASS will be cleared.

When prepare clock, also need to take care to avoid glitch. So
we also follow Spec to set BYPASS before RESETB changed from 0 to 1.
And add a check if the RESETB is already 0, directly return 0;

Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Link: https://lkml.kernel.org/r/1568043491-20680-2-git-send-email-peng.fan@nxp.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/imx/clk-pll14xx.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b7213023b238f..656f48b002dd3 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -191,6 +191,10 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp &= ~RST_MASK;
 	writel_relaxed(tmp, pll->base);
 
+	/* Enable BYPASS */
+	tmp |= BYPASS_MASK;
+	writel(tmp, pll->base);
+
 	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
 		(rate->sdiv << SDIV_SHIFT);
 	writel_relaxed(div_val, pll->base + 0x4);
@@ -250,6 +254,10 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp &= ~RST_MASK;
 	writel_relaxed(tmp, pll->base);
 
+	/* Enable BYPASS */
+	tmp |= BYPASS_MASK;
+	writel_relaxed(tmp, pll->base);
+
 	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
 		(rate->sdiv << SDIV_SHIFT);
 	writel_relaxed(div_val, pll->base + 0x4);
@@ -283,16 +291,28 @@ static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	u32 val;
+	int ret;
 
 	/*
 	 * RESETB = 1 from 0, PLL starts its normal
 	 * operation after lock time
 	 */
 	val = readl_relaxed(pll->base + GNRL_CTL);
+	if (val & RST_MASK)
+		return 0;
+	val |= BYPASS_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
 	val |= RST_MASK;
 	writel_relaxed(val, pll->base + GNRL_CTL);
 
-	return clk_pll14xx_wait_lock(pll);
+	ret = clk_pll14xx_wait_lock(pll);
+	if (ret)
+		return ret;
+
+	val &= ~BYPASS_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
+
+	return 0;
 }
 
 static int clk_pll14xx_is_prepared(struct clk_hw *hw)
-- 
2.20.1


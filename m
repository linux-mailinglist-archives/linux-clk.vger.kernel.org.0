Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E276417F59
	for <lists+linux-clk@lfdr.de>; Sat, 25 Sep 2021 04:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347645AbhIYC0J (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Sep 2021 22:26:09 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:61775 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343687AbhIYC0J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Sep 2021 22:26:09 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 18P23U9V067638;
        Sat, 25 Sep 2021 10:03:30 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 25 Sep
 2021 10:23:59 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     ryan_chen <ryan_chen@aspeedtech.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCHv3] clk:aspeed:Fix AST2600 hpll calculate formula
Date:   Sat, 25 Sep 2021 10:23:54 +0800
Message-ID: <20210925022354.10297-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18P23U9V067638
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v2 -> v3: change else than if to directly else if
v1 -> v2: add Fixes commit hash

AST2600 HPLL calculate formula [SCU200]
HPLL Numerator(M): have fixed value depend on SCU strap.
M = SCU500[10] ? 0x5F : SCU500[8] ? 0xBF : SCU200[12:0]

if SCU500[10] = 1, M=0x5F.
else if SCU500[10]=0 & SCU500[8]=1, M=0xBF.
others (SCU510[10]=0 and SCU510[8]=0)
depend on SCU200[12:0] (default 0x8F) register setting.

HPLL Denumerator (N) =  SCU200[18:13] (default 0x2)
HPLL Divider (P)         =      SCU200[22:19] (default 0x0)

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/clk/clk-ast2600.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 085d0a18b2b6..d30188355aaf 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -169,6 +169,32 @@ static const struct clk_div_table ast2600_div_table[] = {
 };
 
 /* For hpll/dpll/epll/mpll */
+static struct clk_hw *ast2600_calc_hpll(const char *name, u32 val)
+{
+	unsigned int mult, div;
+	u32 hwstrap = readl(scu_g6_base + ASPEED_G6_STRAP1);
+
+	if (val & BIT(24)) {
+		/* Pass through mode */
+		mult = div = 1;
+	} else {
+		/* F = 25Mhz * [(M + 2) / (n + 1)] / (p + 1) */
+		u32 m = val  & 0x1fff;
+		u32 n = (val >> 13) & 0x3f;
+		u32 p = (val >> 19) & 0xf;
+
+		if (hwstrap & BIT(10))
+			m = 0x5F;
+		else if (hwstrap & BIT(8))
+			m = 0xBF;
+
+		mult = (m + 1) / (n + 1);
+		div = (p + 1);
+	}
+	return clk_hw_register_fixed_factor(NULL, name, "clkin", 0,
+			mult, div);
+};
+
 static struct clk_hw *ast2600_calc_pll(const char *name, u32 val)
 {
 	unsigned int mult, div;
@@ -716,7 +742,7 @@ static void __init aspeed_g6_cc(struct regmap *map)
 	 * and we assume that it is enabled
 	 */
 	regmap_read(map, ASPEED_HPLL_PARAM, &val);
-	aspeed_g6_clk_data->hws[ASPEED_CLK_HPLL] = ast2600_calc_pll("hpll", val);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_HPLL] = ast2600_calc_hpll("hpll", val);
 
 	regmap_read(map, ASPEED_MPLL_PARAM, &val);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_MPLL] = ast2600_calc_pll("mpll", val);
-- 
2.17.1


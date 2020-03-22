Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA81C18E790
	for <lists+linux-clk@lfdr.de>; Sun, 22 Mar 2020 09:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgCVIV5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 22 Mar 2020 04:21:57 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:34414 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgCVIV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Mar 2020 04:21:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07504185|-1;CH=green;DM=||false|;DS=CONTINUE|ham_system_inform|0.345318-0.00103386-0.653648;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16370;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.H3MM99h_1584865287;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.H3MM99h_1584865287)
          by smtp.aliyun-inc.com(10.147.40.200);
          Sun, 22 Mar 2020 16:21:35 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v6 1/6] clk: Ingenic: Remove unnecessary spinlock when reading registers.
Date:   Sun, 22 Mar 2020 16:20:57 +0800
Message-Id: <1584865262-25297-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584865262-25297-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1584865262-25297-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It is not necessary to use spinlock when reading registers,
so remove it from cgu.c.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Adjust order from [5/5] in v2 to [1/5] in v3.
    
    v3->v4:
    Remove the spinlock around ingenic_cgu_gate_get().
    
    v4->v5:
    Rebase on top of kernel 5.6-rc1.
    
    v5->v6:
    No change.

 drivers/clk/ingenic/cgu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 6e96303..ab1302a 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -76,16 +76,13 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	const struct ingenic_cgu_pll_info *pll_info;
 	unsigned m, n, od_enc, od;
 	bool bypass;
-	unsigned long flags;
 	u32 ctl;
 
 	clk_info = &cgu->clock_info[ingenic_clk->idx];
 	BUG_ON(clk_info->type != CGU_CLK_PLL);
 	pll_info = &clk_info->pll;
 
-	spin_lock_irqsave(&cgu->lock, flags);
 	ctl = readl(cgu->base + pll_info->reg);
-	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
 	m += pll_info->m_offset;
@@ -259,12 +256,9 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
-	unsigned long flags;
 	u32 ctl;
 
-	spin_lock_irqsave(&cgu->lock, flags);
 	ctl = readl(cgu->base + pll_info->reg);
-	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	return !!(ctl & BIT(pll_info->enable_bit));
 }
@@ -562,16 +556,12 @@ static int ingenic_clk_is_enabled(struct clk_hw *hw)
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	const struct ingenic_cgu_clk_info *clk_info;
-	unsigned long flags;
 	int enabled = 1;
 
 	clk_info = &cgu->clock_info[ingenic_clk->idx];
 
-	if (clk_info->type & CGU_CLK_GATE) {
-		spin_lock_irqsave(&cgu->lock, flags);
+	if (clk_info->type & CGU_CLK_GATE)
 		enabled = !ingenic_cgu_gate_get(cgu, &clk_info->gate);
-		spin_unlock_irqrestore(&cgu->lock, flags);
-	}
 
 	return enabled;
 }
-- 
2.7.4


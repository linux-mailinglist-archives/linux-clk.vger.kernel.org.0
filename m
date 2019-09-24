Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F172BCEB3
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 19:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410220AbfIXQq7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 12:46:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410186AbfIXQq5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Sep 2019 12:46:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DF78217D9;
        Tue, 24 Sep 2019 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569343617;
        bh=BwH26qSMRuY2Or+00XXUuLtnuq5qjhb/CwLUsd9ahE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k0+45jSxHbxq3Q/CXduOUK0J1RUXZzZVU09YIiFac1L91g88X/6w9dM3vgzXFweHI
         EIYX8GnR9aMxITsZUloe3LXxr+ShgIrA8yXBDJWKVB11bGKV5SRHpIvRx/zjCLev64
         XcuS2iUeWOEB+urponEi0iFswZyJVSrEMTpKo11Q=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Guo Zeng <Guo.Zeng@csr.com>,
        Barry Song <Baohua.Song@csr.com>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 28/70] clk: sirf: Don't reference clk_init_data after registration
Date:   Tue, 24 Sep 2019 12:45:07 -0400
Message-Id: <20190924164549.27058-28-sashal@kernel.org>
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

From: Stephen Boyd <sboyd@kernel.org>

[ Upstream commit af55dadfbce35b4f4c6247244ce3e44b2e242b84 ]

A future patch is going to change semantics of clk_register() so that
clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
referencing this member here so that we don't run into NULL pointer
exceptions.

Cc: Guo Zeng <Guo.Zeng@csr.com>
Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lkml.kernel.org/r/20190731193517.237136-6-sboyd@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sirf/clk-common.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sirf/clk-common.c b/drivers/clk/sirf/clk-common.c
index ad7951b6b285e..dcf4e25a02168 100644
--- a/drivers/clk/sirf/clk-common.c
+++ b/drivers/clk/sirf/clk-common.c
@@ -297,9 +297,10 @@ static u8 dmn_clk_get_parent(struct clk_hw *hw)
 {
 	struct clk_dmn *clk = to_dmnclk(hw);
 	u32 cfg = clkc_readl(clk->regofs);
+	const char *name = clk_hw_get_name(hw);
 
 	/* parent of io domain can only be pll3 */
-	if (strcmp(hw->init->name, "io") == 0)
+	if (strcmp(name, "io") == 0)
 		return 4;
 
 	WARN_ON((cfg & (BIT(3) - 1)) > 4);
@@ -311,9 +312,10 @@ static int dmn_clk_set_parent(struct clk_hw *hw, u8 parent)
 {
 	struct clk_dmn *clk = to_dmnclk(hw);
 	u32 cfg = clkc_readl(clk->regofs);
+	const char *name = clk_hw_get_name(hw);
 
 	/* parent of io domain can only be pll3 */
-	if (strcmp(hw->init->name, "io") == 0)
+	if (strcmp(name, "io") == 0)
 		return -EINVAL;
 
 	cfg &= ~(BIT(3) - 1);
@@ -353,7 +355,8 @@ static long dmn_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	unsigned long fin;
 	unsigned ratio, wait, hold;
-	unsigned bits = (strcmp(hw->init->name, "mem") == 0) ? 3 : 4;
+	const char *name = clk_hw_get_name(hw);
+	unsigned bits = (strcmp(name, "mem") == 0) ? 3 : 4;
 
 	fin = *parent_rate;
 	ratio = fin / rate;
@@ -375,7 +378,8 @@ static int dmn_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_dmn *clk = to_dmnclk(hw);
 	unsigned long fin;
 	unsigned ratio, wait, hold, reg;
-	unsigned bits = (strcmp(hw->init->name, "mem") == 0) ? 3 : 4;
+	const char *name = clk_hw_get_name(hw);
+	unsigned bits = (strcmp(name, "mem") == 0) ? 3 : 4;
 
 	fin = parent_rate;
 	ratio = fin / rate;
-- 
2.20.1


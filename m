Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898FC1487AB
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jan 2020 15:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbgAXOYa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jan 2020 09:24:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:44170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731273AbgAXOWH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jan 2020 09:22:07 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D034222C2;
        Fri, 24 Jan 2020 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579875727;
        bh=bJcSbVFWMcIYPUMH8AzaeCu2T16ojXqRV9/OkWShTkU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nRteX2xExRwynXhmA0D1wadfNF59dCLb8BK74HStP3v5Gz6Jsc1+GeWfdido7FGj3
         pqNDbWMBt2gJr637UVMrfpo6Ym1jlVqaReI5Dw2j8LKfEe9N6P+SKikN3K6f+gVGBD
         QjTET/HqE3Z5Tm7rWhZs3m7OhqAe6SJu2rPli5Lk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Stephen Boyd <sboyd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/18] clk: mmp2: Fix the order of timer mux parents
Date:   Fri, 24 Jan 2020 09:21:46 -0500
Message-Id: <20200124142157.30931-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124142157.30931-1-sashal@kernel.org>
References: <20200124142157.30931-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Lubomir Rintel <lkundrak@v3.sk>

[ Upstream commit 8bea5ac0fbc5b2103f8779ddff216122e3c2e1ad ]

Determined empirically, no documentation is available.

The OLPC XO-1.75 laptop used parent 1, that one being VCTCXO/4 (65MHz), but
thought it's a VCTCXO/2 (130MHz). The mmp2 timer driver, not knowing
what is going on, ended up just dividing the rate as of
commit f36797ee4380 ("ARM: mmp/mmp2: dt: enable the clock")'

Link: https://lore.kernel.org/r/20191218190454.420358-3-lkundrak@v3.sk
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mmp/clk-of-mmp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
index 061a9f10218b3..20cfdf837bfab 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -134,7 +134,7 @@ static DEFINE_SPINLOCK(ssp3_lock);
 static const char *ssp_parent_names[] = {"vctcxo_4", "vctcxo_2", "vctcxo", "pll1_16"};
 
 static DEFINE_SPINLOCK(timer_lock);
-static const char *timer_parent_names[] = {"clk32", "vctcxo_2", "vctcxo_4", "vctcxo"};
+static const char *timer_parent_names[] = {"clk32", "vctcxo_4", "vctcxo_2", "vctcxo"};
 
 static DEFINE_SPINLOCK(reset_lock);
 
-- 
2.20.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0651A9E80
	for <lists+linux-clk@lfdr.de>; Wed, 15 Apr 2020 13:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409667AbgDOL4t (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Apr 2020 07:56:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:43460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409400AbgDOLrx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Apr 2020 07:47:53 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC43B2137B;
        Wed, 15 Apr 2020 11:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586951272;
        bh=diZCH/Mg8n9hXnJ0WhmZgAaGP/vFOO2uGKOad9Enxpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k6JGzRWmG059w7EXAz8TGhThLULVatYwILZgRyT/ErgKlvyYt1lPJ5jCZJmMaouQM
         zQSVTw8m8KC/lp+WbVAkFlKA+R0YKOOsD++IeGHctvkqi3cPqa1uFv/pmPw7fjynvd
         KELttE8vB051nYOICcKx4sjx1bkAnS4fK4OV05sM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 03/21] clk: tegra: Fix Tegra PMC clock out parents
Date:   Wed, 15 Apr 2020 07:47:30 -0400
Message-Id: <20200415114748.15713-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114748.15713-1-sashal@kernel.org>
References: <20200415114748.15713-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Sowjanya Komatineni <skomatineni@nvidia.com>

[ Upstream commit 6fe38aa8cac3a5db38154331742835a4d9740788 ]

Tegra PMC clocks clk_out_1, clk_out_2, and clk_out_3 supported parents
are osc, osc_div2, osc_div4 and extern clock.

Clock driver is using incorrect parents clk_m, clk_m_div2, clk_m_div4
for PMC clocks.

This patch fixes this.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 91377abfefa19..17a04300f93bf 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -60,16 +60,16 @@ struct pmc_clk_init_data {
 
 static DEFINE_SPINLOCK(clk_out_lock);
 
-static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern1",
+static const char *clk_out1_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern1",
 };
 
-static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern2",
+static const char *clk_out2_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern2",
 };
 
-static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern3",
+static const char *clk_out3_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern3",
 };
 
 static struct pmc_clk_init_data pmc_clks[] = {
-- 
2.20.1


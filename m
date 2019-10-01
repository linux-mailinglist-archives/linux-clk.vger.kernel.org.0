Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48611C4293
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 23:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfJAVVv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 17:21:51 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:40806 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbfJAVVu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 17:21:50 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 411071C0162;
        Tue,  1 Oct 2019 15:14:02 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
From:   Stephen Warren <swarren@wwwdotorg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
Date:   Tue,  1 Oct 2019 15:13:43 -0600
Message-Id: <20191001211346.104400-1-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

For a little over a year, U-Boot has configured the flow controller to
perform automatic RAM re-repair on off->on power transitions of the CPU
rail1]. This is mandatory for correct operation of Tegra124. However, RAM
re-repair relies on certain clocks, which the kernel must enable and
leave running. The fuse clock is one of those clocks. Enable this clock
so that LP1 power mode (system suspend) operates correctly.

[1] 3cc7942a4ae5 ARM: tegra: implement RAM repair

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 0224fdc4766f..f53f6315c646 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 };
 
 static struct tegra_clk_init_table tegra124_init_table[] __initdata = {
+	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
 	{ TEGRA124_CLK_SOC_THERM, TEGRA124_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA124_CLK_CCLK_G, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_HDA, TEGRA124_CLK_PLL_P, 102000000, 0 },
-- 
2.23.0


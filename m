Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C83CB06F
	for <lists+linux-clk@lfdr.de>; Thu,  3 Oct 2019 22:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJCUuh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Oct 2019 16:50:37 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:50462 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJCUuh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 16:50:37 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 232B21C0728;
        Thu,  3 Oct 2019 14:50:36 -0600 (MDT)
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
Subject: [PATCH V3 1/4] clk: tegra: mark fuse clock as critical
Date:   Thu,  3 Oct 2019 14:50:30 -0600
Message-Id: <20191003205033.98381-1-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

For a little over a year, U-Boot on Tegra124 has configured the flow
controller to perform automatic RAM re-repair on off->on power transitions
of the CPU rail1]. This is mandatory for correct operation of Tegra124.
However, RAM re-repair relies on certain clocks, which the kernel must
enable and leave running. The fuse clock is one of those clocks. Mark this
clock as critical so that LP1 power mode (system suspend) operates
correctly.

[1] 3cc7942a4ae5 ARM: tegra: implement RAM repair

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v3: Added comment to the clock table entry indicating why the clock is
    critical.
v2: Set CRITICAL flag on the clock, rather than enabling it in
    tegra124_init_table[].
---
 drivers/clk/tegra/clk-tegra-periph.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 1ed85f120a1b..49b9f2f85bad 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -785,7 +785,11 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
 	GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
 	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
-	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
+	/*
+	 * Critical for RAM re-repair operation, which must occur on resume
+	 * from LP1 system suspend and as part of CCPLEX cluster switching.
+	 */
+	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
 	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
 	GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
 	GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
-- 
2.23.0


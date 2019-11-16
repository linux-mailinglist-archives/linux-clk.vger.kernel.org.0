Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0630EFF0D7
	for <lists+linux-clk@lfdr.de>; Sat, 16 Nov 2019 17:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbfKPQIC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 16 Nov 2019 11:08:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:58288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730470AbfKPPuS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 16 Nov 2019 10:50:18 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADEDB21739;
        Sat, 16 Nov 2019 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573919418;
        bh=L9YHeN7DCGEZ+iGnvQLvZwPgOC6kkntnCWZ1Zw5ZInw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cR1jL8vNBJCL/RNzGqQrXt+qD9zgV81ESUicAmg8cjM3ArbIqsZq5Dahq24c1tnL1
         gMCGig9xL8bFq8MBnCgEzRIJLLFSLUI1qnIkOsUvbT8gE7VxVy6EkR99mMG0VVOSgt
         UBJkPddkVtQoZ6EoF8s0UiRltZAjGy1iD5HW+UE4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 117/150] clk: sunxi-ng: enable so-said LDOs for A64 SoC's pll-mipi clock
Date:   Sat, 16 Nov 2019 10:46:55 -0500
Message-Id: <20191116154729.9573-117-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154729.9573-1-sashal@kernel.org>
References: <20191116154729.9573-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

[ Upstream commit 859783d1390035e29ba850963bded2b4ffdf43b5 ]

In the user manual of A64 SoC, the bit 22 and 23 of pll-mipi control
register is called "LDO{1,2}_EN", and according to the BSP source code
from Allwinner , the LDOs are enabled during the clock's enabling
process.

The clock failed to generate output if the two LDOs are not enabled.

Add the two bits to the clock's gate bits, so that the LDOs are enabled
when the PLL is enabled.

Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 2bb4cabf802f0..36a30a3cfad71 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -158,7 +158,12 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_gpu_clk, "pll-gpu",
 #define SUN50I_A64_PLL_MIPI_REG		0x040
 
 static struct ccu_nkm pll_mipi_clk = {
-	.enable		= BIT(31),
+	/*
+	 * The bit 23 and 22 are called "LDO{1,2}_EN" on the SoC's
+	 * user manual, and by experiments the PLL doesn't work without
+	 * these bits toggled.
+	 */
+	.enable		= BIT(31) | BIT(23) | BIT(22),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT(8, 4),
 	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
-- 
2.20.1


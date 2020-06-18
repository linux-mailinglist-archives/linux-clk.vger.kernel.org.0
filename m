Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E881FFAA6
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jun 2020 19:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgFRR4g (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Jun 2020 13:56:36 -0400
Received: from foss.arm.com ([217.140.110.172]:56600 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729125AbgFRR4f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Jun 2020 13:56:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD981101E;
        Thu, 18 Jun 2020 10:56:34 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4C763F73C;
        Thu, 18 Jun 2020 10:56:33 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     heiko@sntech.de, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [RESEND PATCH] Revert "clk: rockchip: fix wrong mmc sample phase shift for rk3328"
Date:   Thu, 18 Jun 2020 18:56:29 +0100
Message-Id: <c80eb52e34c03f817586b6b7912fbd4e31be9079.1589475794.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This reverts commit 82f4b67f018c88a7cc9337f0067ed3d6ec352648.

According to a subsequent revert in the vendor kernel, the original
change was based on unclear documentation and was in fact incorrect.

Emprically, my board's HS200 eMMC at 200MHZ apparently gets lucky with a
phase where this had no impact, but limiting max-frequency to 150MHz to
match the nominal capability of the I/O pins made it virtually unusable,
constantly throwing errors and retuning. With this revert, it starts
behaving perfectly at 150MHz too.

Fixes: 82f4b67f018c ("clk: rockchip: fix wrong mmc sample phase shift for rk3328")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Resending with the edited commit log I actually meant, rather than the
earlier draft I managed to generate the previuous patch from, since that
one seems to have slipped through the cracks anyway.

ybetter commit message
 drivers/clk/rockchip/clk-rk3328.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index c186a1985bf4..2429b7c2a8b3 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -808,22 +808,22 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "clk_sdmmc",
 	    RK3328_SDMMC_CON0, 1),
 	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "clk_sdmmc",
-	    RK3328_SDMMC_CON1, 0),
+	    RK3328_SDMMC_CON1, 1),
 
 	MMC(SCLK_SDIO_DRV, "sdio_drv", "clk_sdio",
 	    RK3328_SDIO_CON0, 1),
 	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "clk_sdio",
-	    RK3328_SDIO_CON1, 0),
+	    RK3328_SDIO_CON1, 1),
 
 	MMC(SCLK_EMMC_DRV, "emmc_drv", "clk_emmc",
 	    RK3328_EMMC_CON0, 1),
 	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "clk_emmc",
-	    RK3328_EMMC_CON1, 0),
+	    RK3328_EMMC_CON1, 1),
 
 	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "clk_sdmmc_ext",
 	    RK3328_SDMMC_EXT_CON0, 1),
 	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "clk_sdmmc_ext",
-	    RK3328_SDMMC_EXT_CON1, 0),
+	    RK3328_SDMMC_EXT_CON1, 1),
 };
 
 static const char *const rk3328_critical_clocks[] __initconst = {
-- 
2.23.0.dirty


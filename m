Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA20F1FBFF3
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jun 2020 22:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731352AbgFPUYX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jun 2020 16:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgFPUYX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jun 2020 16:24:23 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A8462098B;
        Tue, 16 Jun 2020 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592339062;
        bh=rxSgWs8m8zTECLJO0qoOOytZOjZTG5r08M3Vu0rbJtc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ihniAd5FFq3TB5eefSkcKHrmVdR1n4hbjEho3prhnk4rMFRNMCi0HR7FFJqAVYekQ
         +24ysdwskr7Q4ejIGRM26rRqmlem7ISmdZsZl/zZhjAV3f5yMnIgzTm4UDGDMmibcl
         r3a9qoy4/W1DRnIiKSh4UjBfJ5yhztTjc5vzr1oE=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Subject: [PATCH 2/3] clk: socfpga: agilex: add nand_x_clk and nand_ecc_clk
Date:   Tue, 16 Jun 2020 15:24:16 -0500
Message-Id: <20200616202417.14376-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616202417.14376-1-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

And the nand_x_clk and nand_ecc_clk. Make the nand_x_clk be the main
clock that is feeding the NAND IP and correct it's parent to be the
l4_mp_clk.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-agilex.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 699527f7e764..1b2e0ad01b24 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -294,8 +294,12 @@ static const struct stratix10_gate_clock agilex_gate_clks[] = {
 	  8, 0, 0, 0, 0, 0, 0},
 	{ AGILEX_SPI_M_CLK, "spi_m_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
 	  9, 0, 0, 0, 0, 0, 0},
-	{ AGILEX_NAND_CLK, "nand_clk", "l4_main_clk", NULL, 1, 0, 0x7C,
+	{ AGILEX_NAND_X_CLK, "nand_x_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
 	  10, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_NAND_CLK, "nand_clk", "nand_x_clk", NULL, 1, 0, 0x7C,
+	  10, 0, 0, 0, 0, 0, 4},
+	{ AGILEX_NAND_ECC_CLK, "nand_ecc_clk", "nand_x_clk", NULL, 1, 0, 0x7C,
+	  10, 0, 0, 0, 0, 0, 4},
 };
 
 static int agilex_clk_register_c_perip(const struct stratix10_perip_c_clock *clks,
-- 
2.17.1


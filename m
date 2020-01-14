Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC313AE64
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2020 17:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgANQHd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Jan 2020 11:07:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgANQHd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Jan 2020 11:07:33 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5470B222C4;
        Tue, 14 Jan 2020 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579018052;
        bh=Bs5EKgm01n2AuerH8TbOCa5VjEOSsMjfOYHfLgjy/+I=;
        h=From:To:Cc:Subject:Date:From;
        b=PyeqqLfDM3ej7kY+r5ClByMTBDarzPCjRpWtg6PAMxembBuot2NMETeclG28c71Sa
         QzNK4szyiWD0NHbBmg6zcNiTT9Qu0jSVegEluf2P4SRSr+vVPEhkcIqFbczsT6NV31
         0Z7y9rcC+yvqaUDKNIEXrmoMrQ8KBhafSh+cp194=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     sboyd@kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: stratix10: use do_div() for 64-bit calculation
Date:   Tue, 14 Jan 2020 10:07:25 -0600
Message-Id: <20200114160726.19771-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

do_div() macro to perform u64 division and guards against overflow if
the result is too large for the unsigned long return type.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-pll-s10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index 4705eb544f01..8d7b1d0c4664 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -39,7 +39,9 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 	/* read VCO1 reg for numerator and denominator */
 	reg = readl(socfpgaclk->hw.reg);
 	refdiv = (reg & SOCFPGA_PLL_REFDIV_MASK) >> SOCFPGA_PLL_REFDIV_SHIFT;
-	vco_freq = (unsigned long long)parent_rate / refdiv;
+
+	vco_freq = parent_rate;
+	do_div(vco_freq, refdiv);
 
 	/* Read mdiv and fdiv from the fdbck register */
 	reg = readl(socfpgaclk->hw.reg + 0x4);
-- 
2.17.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9B61FBFF6
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jun 2020 22:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731463AbgFPUYY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jun 2020 16:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:34430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgFPUYY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jun 2020 16:24:24 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 286572100A;
        Tue, 16 Jun 2020 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592339063;
        bh=vq9MaBiMA1KgziPPPzEu+yXtjdr11f5SG3UPygJi278=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K6DLblw9BkOecaY/lF8ud4dHTdV1SdH4fTy6X5uN7UcZ6JaQKnXAlZl6XqTgARh4I
         BqiyHh8eHrU+q3NaVM6dEG311LDdKC+QSgI6NY4VuJZObDi+wh3WUcxES3IPmufQhA
         VxH+TmCPl3RuW98FDXg/VHGAHLG+wnG6h0PUYnTU=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Subject: [PATCH 3/3] clk: socfpga: agilex: mpu_l2ram_clk should be mpu_ccu_clk
Date:   Tue, 16 Jun 2020 15:24:17 -0500
Message-Id: <20200616202417.14376-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616202417.14376-1-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Preliminary documentation documented the mpu_l2ram_clk, but since then,
the mpu_l2ram_clk is no longer documented. It's now referred to as
mpu_ccu_clk.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-agilex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 1b2e0ad01b24..8fb12cbe0208 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -252,7 +252,7 @@ static const struct stratix10_gate_clock agilex_gate_clks[] = {
 	  0, 0, 0, 0, 0x30, 0, 0},
 	{ AGILEX_MPU_PERIPH_CLK, "mpu_periph_clk", "mpu_clk", NULL, 1, 0, 0x24,
 	  0, 0, 0, 0, 0, 0, 4},
-	{ AGILEX_MPU_L2RAM_CLK, "mpu_l2ram_clk", "mpu_clk", NULL, 1, 0, 0x24,
+	{ AGILEX_MPU_CCU_CLK, "mpu_ccu_clk", "mpu_clk", NULL, 1, 0, 0x24,
 	  0, 0, 0, 0, 0, 0, 2},
 	{ AGILEX_L4_MAIN_CLK, "l4_main_clk", "noc_clk", NULL, 1, 0, 0x24,
 	  1, 0x44, 0, 2, 0, 0, 0},
-- 
2.17.1


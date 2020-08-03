Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC723A146
	for <lists+linux-clk@lfdr.de>; Mon,  3 Aug 2020 10:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgHCIst (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Aug 2020 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgHCIst (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Aug 2020 04:48:49 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AFFC06174A
        for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2020 01:48:48 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id Awol2300E4C55Sk01wolnW; Mon, 03 Aug 2020 10:48:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k2W9F-0006e5-C3; Mon, 03 Aug 2020 10:48:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k2W9F-0006L6-A8; Mon, 03 Aug 2020 10:48:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Gow <davidgow@google.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: hsdk: Fix bad dependency on IOMEM
Date:   Mon,  3 Aug 2020 10:48:35 +0200
Message-Id: <20200803084835.21838-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CONFIG_IOMEM does not exist.  The correct symbol to depend on is
CONFIG_HAS_IOMEM.

Fixes: 1e7468bd9d30a21e ("clk: Specify IOMEM dependency for HSDK pll driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 326f91b2dda9fdc4..5f952e111ab5a6f8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -50,7 +50,7 @@ source "drivers/clk/versatile/Kconfig"
 config CLK_HSDK
 	bool "PLL Driver for HSDK platform"
 	depends on OF || COMPILE_TEST
-	depends on IOMEM
+	depends on HAS_IOMEM
 	help
 	  This driver supports the HSDK core, system, ddr, tunnel and hdmi PLLs
 	  control.
-- 
2.17.1


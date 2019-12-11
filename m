Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAAE11A87C
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2019 11:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfLKKCY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Dec 2019 05:02:24 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:50506 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbfLKKCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Dec 2019 05:02:23 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id ca2M2100K5USYZQ06a2MpW; Wed, 11 Dec 2019 11:02:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyp3-0007NN-Bi; Wed, 11 Dec 2019 11:02:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyp3-0001nJ-9k; Wed, 11 Dec 2019 11:02:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Remove use of ARCH_R8A7796
Date:   Wed, 11 Dec 2019 11:02:20 +0100
Message-Id: <20191211100220.6854-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CONFIG_ARCH_R8A7796 was renamed to CONFIG_ARCH_R8A77960 in commit
39e57e14d7eaf818 ("soc: renesas: Add ARCH_R8A77960 for existing R-Car
M3-W"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.6.

 drivers/clk/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 4cd846bc98cc2ec0..94ef2bac289fb45a 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -21,7 +21,7 @@ config CLK_RENESAS
 	select CLK_R8A7792 if ARCH_R8A7792
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
-	select CLK_R8A77960 if ARCH_R8A77960 || ARCH_R8A7796
+	select CLK_R8A77960 if ARCH_R8A77960
 	select CLK_R8A77961 if ARCH_R8A77961
 	select CLK_R8A77965 if ARCH_R8A77965
 	select CLK_R8A77970 if ARCH_R8A77970
-- 
2.17.1


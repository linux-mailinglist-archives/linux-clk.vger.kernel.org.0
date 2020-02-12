Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2772F15A626
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2020 11:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBLKTv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 05:19:51 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:40106 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLKTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Feb 2020 05:19:50 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 1mKo2200S5USYZQ01mKo0j; Wed, 12 Feb 2020 11:19:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p7U-0001Ny-H1; Wed, 12 Feb 2020 11:19:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p7U-0002UV-FQ; Wed, 12 Feb 2020 11:19:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] xtensa: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 11:19:47 +0100
Message-Id: <20200212101947.9534-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Xtensa time code is not a clock provider, and just needs to call
of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/xtensa/kernel/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/time.c b/arch/xtensa/kernel/time.c
index 69db8c93c1f992d2..80bcc65d25f413b3 100644
--- a/arch/xtensa/kernel/time.c
+++ b/arch/xtensa/kernel/time.c
@@ -13,7 +13,7 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
+#include <linux/of_clk.h>
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/time.h>
-- 
2.17.1


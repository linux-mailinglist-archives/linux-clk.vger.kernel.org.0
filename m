Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C95D15A5F6
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2020 11:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgBLKPv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 05:15:51 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:59548 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgBLKPu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Feb 2020 05:15:50 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 1mFn2200G5USYZQ01mFnGV; Wed, 12 Feb 2020 11:15:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p3b-0001NG-F8; Wed, 12 Feb 2020 11:15:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p3b-0002Ix-Dd; Wed, 12 Feb 2020 11:15:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 11:15:43 +0100
Message-Id: <20200212101544.8793-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212101544.8793-1-geert+renesas@glider.be>
References: <20200212101544.8793-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Pistachio platform code is not a clock provider, and just needs to
call of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/pistachio/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pistachio/time.c b/arch/mips/pistachio/time.c
index 3c9235c7710a608f..de64751dec401990 100644
--- a/arch/mips/pistachio/time.c
+++ b/arch/mips/pistachio/time.c
@@ -6,10 +6,10 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_clk.h>
 
 #include <asm/mips-cps.h>
 #include <asm/time.h>
-- 
2.17.1


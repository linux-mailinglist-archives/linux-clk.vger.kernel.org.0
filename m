Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCCC115109
	for <lists+linux-clk@lfdr.de>; Fri,  6 Dec 2019 14:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfLFNeS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Dec 2019 08:34:18 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:44270 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLFNeS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Dec 2019 08:34:18 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id adaF2100B5USYZQ01daFzq; Fri, 06 Dec 2019 14:34:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDkN-0006Ik-BG; Fri, 06 Dec 2019 14:34:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDkN-0006Ee-8j; Fri, 06 Dec 2019 14:34:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Fix continuation of of_clk_detect_critical()
Date:   Fri,  6 Dec 2019 14:34:14 +0100
Message-Id: <20191206133414.23925-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The second line of the of_clk_detect_critical() function signature is
not indented according to coding style.

Fixes: d56f8994b6fb928f ("clk: Provide OF helper to mark clocks as CRITICAL")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9c5b9419e585f845..06ea776830473c2a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4799,8 +4799,8 @@ static int parent_ready(struct device_node *np)
  *
  * Return: error code or zero on success
  */
-int of_clk_detect_critical(struct device_node *np,
-					  int index, unsigned long *flags)
+int of_clk_detect_critical(struct device_node *np, int index,
+			   unsigned long *flags)
 {
 	struct property *prop;
 	const __be32 *cur;
-- 
2.17.1


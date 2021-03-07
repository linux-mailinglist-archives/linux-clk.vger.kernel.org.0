Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFE53301D8
	for <lists+linux-clk@lfdr.de>; Sun,  7 Mar 2021 15:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhCGOGu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 7 Mar 2021 09:06:50 -0500
Received: from aposti.net ([89.234.176.197]:50206 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230486AbhCGOGg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Mar 2021 09:06:36 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Russell King <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] clk: Fix doc of clk_get_parent
Date:   Sun,  7 Mar 2021 14:06:26 +0000
Message-Id: <20210307140626.22699-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On error, or when the passed parameter is NULL, the return value is NULL
and not a PTR_ERR()-encoded value.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/linux/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..96031b5f6933 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -745,7 +745,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * @clk: clock source
  *
  * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * NULL on error.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.30.1


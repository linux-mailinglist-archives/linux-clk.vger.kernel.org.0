Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9883F98A9
	for <lists+linux-clk@lfdr.de>; Fri, 27 Aug 2021 14:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245011AbhH0MDW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Aug 2021 08:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245057AbhH0MDV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Aug 2021 08:03:21 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CFB6C0613CF;
        Fri, 27 Aug 2021 05:02:32 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc979a.dip0.t-ipconnect.de [87.188.151.154])
        by mail.bugwerft.de (Postfix) with ESMTPSA id C8F67327D0C;
        Fri, 27 Aug 2021 11:54:28 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 8/9] clk: cs2000-cp: freeze config during register fiddling
Date:   Fri, 27 Aug 2021 13:54:19 +0200
Message-Id: <20210827115420.3052019-9-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827115420.3052019-1-daniel@zonque.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure to freeze the configuration of the chip during the programming
of 32-bit registers. This avoids the processing of invalid intermediate
states.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 2c555a0e72b1..3aae3540e29e 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -52,6 +52,7 @@
 #define FRACNSRC_DYNAMIC	(1 << 0)
 
 /* GLOBAL_CFG */
+#define FREEZE		(1 << 7)
 #define ENDEV2		(0x1)
 
 /* FUNC_CFG1 */
@@ -337,6 +338,10 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 {
 	int ret;
 
+	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, FREEZE);
+	if (ret < 0)
+		return ret;
+
 	ret = cs2000_select_ratio_mode(priv, rate, parent_rate);
 	if (ret < 0)
 		return ret;
@@ -349,6 +354,10 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 	if (ret < 0)
 		return ret;
 
+	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, 0);
+	if (ret < 0)
+		return ret;
+
 	priv->saved_rate	= rate;
 	priv->saved_parent_rate	= parent_rate;
 
-- 
2.31.1


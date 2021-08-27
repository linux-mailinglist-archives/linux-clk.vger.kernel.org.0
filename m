Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19873F98A3
	for <lists+linux-clk@lfdr.de>; Fri, 27 Aug 2021 14:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhH0MDV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Aug 2021 08:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245056AbhH0MDV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Aug 2021 08:03:21 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CE4AC061757;
        Fri, 27 Aug 2021 05:02:32 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc979a.dip0.t-ipconnect.de [87.188.151.154])
        by mail.bugwerft.de (Postfix) with ESMTPSA id B2757327D09;
        Fri, 27 Aug 2021 11:54:27 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 5/9] clk: cs2000-cp: Make aux output function controllable
Date:   Fri, 27 Aug 2021 13:54:16 +0200
Message-Id: <20210827115420.3052019-6-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827115420.3052019-1-daniel@zonque.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The aux output pin can be configured to output either of the two clock
inputs, the generated clock or the pll lock status. Allow access to
this feature through a new optional device-tree property.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 92bc4aca0f95..db7290621cef 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -39,6 +39,8 @@
 /* DEVICE_CFG1 */
 #define RSEL(x)		(((x) & 0x3) << 3)
 #define RSEL_MASK	RSEL(0x3)
+#define AUXOUTSRC(x)	(((x) & 0x3) << 1)
+#define AUXOUTSRC_MASK	AUXOUTSRC(0x3)
 #define ENDEV1		(0x1)
 
 /* DEVICE_CFG2 */
@@ -421,12 +423,19 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	struct clk_init_data init;
 	const char *name = np->name;
 	static const char *parent_names[CLK_MAX];
+	u32 aux_out = 0;
 	int ch = 0; /* it uses ch0 only at this point */
 	int rate;
 	int ret;
 
 	of_property_read_string(np, "clock-output-names", &name);
 
+	of_property_read_u32(np, "cirrus,aux-output-source", &aux_out);
+	ret = cs2000_bset(priv, DEVICE_CFG1,
+			  AUXOUTSRC_MASK, AUXOUTSRC(aux_out));
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * set default rate as 1/1.
 	 * otherwise .set_rate which setup ratio
-- 
2.31.1


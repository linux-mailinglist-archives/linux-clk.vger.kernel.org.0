Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA24787F53
	for <lists+linux-clk@lfdr.de>; Fri, 25 Aug 2023 07:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbjHYFh3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Aug 2023 01:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbjHYFhU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 01:37:20 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF19E1BC2;
        Thu, 24 Aug 2023 22:37:16 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RX7xh5rQxz9sqj;
        Fri, 25 Aug 2023 07:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
        s=MBO0001; t=1692941832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPHLL1UUhYZsTXyQb6T77PLKveGd3jXYY4KZZGm0dps=;
        b=omHr2p3euwtV+CzskMan98nKSCb+sYCGIsojFn/e3ytPgoo5vTOID4v7XHO0ePAKOHxA3O
        Ea5EicbcEXukAPTNaPC6Fxpmem5gJsmwmoDD3lCiWsww2LQ3MLdR2QPk+pcWe13wkc1FwL
        qhUky9LrDLiTOWnxKpctc/VQK6XS+b0ArRcdPN4N+DtZkB/JGQcznnQiRXRmOq79XkfCOY
        UTQyfY0r002hNjw9nPSWfmisLFpHEhgYEFL0Q+/qCmcs6DJaptAGJQu8YT2DiQf++A+2ux
        oqwPG3kc4bbyHnYt+ItEPJMETX81aQvQN1at9eDDaSqxFZFHb8iYHoLZrdWKjg==
From:   Frank Oltmanns <frank@oltmanns.dev>
Date:   Fri, 25 Aug 2023 07:36:37 +0200
Subject: [PATCH 1/3] clk: keep clock rate when parent rate changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-pll-mipi_keep_rate-v1-1-35bc43570730@oltmanns.dev>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
In-Reply-To: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Ondrej Jirman <x@xnux.eu>,
        Icenowy Zheng <uwu@icenowy.me>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3502; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=80xP2Zwrfz9jaekYXLfx5hxdKlG+OoXLq1zx4Dy6QHI=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk6D3/0TGvDCocHkkmhaW/tOVVXzq99FoYRjzrU
 D/LC1jBMwGJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZOg9/wAKCRCaaaIIlErT
 xwyUC/0Z++DjhBG0lMGjHJrVGh5w2hr4a1L8Drw1Aq+jGicU2jrthCldTL3ZtcCaOg1XFrqTRBm
 tXVmNaI+I/ru98HF9GvTh05Gx94Hx9AesXYToGHGB1hpNQkzzhPWVKJrWZaSZG9dS7fRdin8r0Q
 XcJExe4D66B7A93UNqypB+jclL0dvAJFmRHVCsD+aJe79/R1fazHvE0s3xCV5oVX8rjLX/AFSXD
 Y3knkRABJcivDX69FJ/Gu6DgPKCNHDKJwrSGhW2jNefcqFNo2V0B7maKRQxQIcbf5XKAl9LU+B5
 G1Bz2QvJoF7pIvtmVc/Bdtfva+j+WkPM7DX9yOz6LNooL6t0attnGLfpWlrjRbyQDrW4Tsx3aPR
 29kBwkDPn3XNeWADoHsRDeUquxzSFtX8mzVSqdUKvFObK6193oiWPOgv2wlUUDsYH63s9CTTDA9
 H4WBtIdkum+unXp3VdGMohIG9UYQ+zjAfmMy3mACUjRkUCdh1i67V1IUaLGE4BbVB0cTI=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RX7xh5rQxz9sqj
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow clocks to keep their rate when parent (or grandparent) rate
changes.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/clk.c            | 48 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/clk-provider.h |  2 ++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c249f9791ae8..a382876c18da 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2245,6 +2245,9 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	    best_parent_rate != parent->rate)
 		top = clk_calc_new_rates(parent, best_parent_rate);
 
+	if ((core->flags & CLK_KEEP_RATE))
+		core->req_rate = new_rate;
+
 out:
 	clk_calc_subtree(core, new_rate, parent, p_index);
 
@@ -2343,9 +2346,51 @@ static void clk_change_rate(struct clk_core *core)
 		clk_core_prepare_enable(parent);
 
 	trace_clk_set_rate(core, core->new_rate);
+	if (!skip_set_rate && core->ops->set_rate) {
+		if (core->flags & CLK_KEEP_RATE && clk_core_can_round(core)) {
+			struct clk_rate_request req;
+			unsigned long flags;
+			int ret;
+
+			clk_core_init_rate_req(core, &req, core->req_rate);
 
-	if (!skip_set_rate && core->ops->set_rate)
+			/*
+			 * Re-determine the new rate for the clock based on the requested rate.
+			 *
+			 * In this stage, the clock must not set a new parent rate or try a
+			 * different parent, so temporarily prevent that from happening.
+			 */
+			flags = core->flags;
+			core->flags &= ~(CLK_SET_RATE_PARENT);
+			core->flags |= CLK_SET_RATE_NO_REPARENT;
+			ret = clk_core_determine_round_nolock(core, &req);
+			core->flags = flags;
+
+			/*
+			 * If necessary, store the new rate and propagate to the subtree.
+			 *
+			 * The previously calculated rates (new_rate) of this core's subtree are no
+			 * longer correct, because this clock will be set to a rate that differs
+			 * from the rate that was used to calculate the subtree.
+			 *
+			 * FIXME: This means that the rate also differs from the new_rate that was
+			 *        announced in the PRE_RATE_CHANGE notification. Be careful when
+			 *        applying this flag, that the subtree does not depend on the
+			 *        correct new rate being propagated.
+			 */
+			if (ret >= 0 && req.rate != core->new_rate) {
+				core->new_rate = req.rate;
+				pr_debug("%s: clk %s: keeping rate %lu as %lu\n",
+				       __func__, core->name, core->req_rate, core->new_rate);
+
+				hlist_for_each_entry(child, &core->children, child_node) {
+					child->new_rate = clk_recalc(child, core->new_rate);
+					clk_calc_subtree(child, child->new_rate, NULL, 0);
+				}
+			}
+		}
 		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
+	}
 
 	trace_clk_set_rate_complete(core, core->new_rate);
 
@@ -3388,6 +3433,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_KEEP_RATE),
 #undef ENTRY
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index ec32ec58c59f..fba78a99ac56 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* try to keep rate, if parent rate changes */
+#define CLK_KEEP_RATE		BIT(14)
 
 struct clk;
 struct clk_hw;

-- 
2.41.0


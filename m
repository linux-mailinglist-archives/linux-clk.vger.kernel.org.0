Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43B6602F57
	for <lists+linux-clk@lfdr.de>; Tue, 18 Oct 2022 17:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiJRPOg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Oct 2022 11:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiJRPOd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 11:14:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEB215FE8;
        Tue, 18 Oct 2022 08:14:28 -0700 (PDT)
Received: from jupiter.universe (dyndsl-095-033-155-016.ewe-ip-backbone.de [95.33.155.16])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 551526602390;
        Tue, 18 Oct 2022 16:14:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666106061;
        bh=E0lA1anDpNPgwkfIDaWtwKvqqj0itcI4FjtpSqERX/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PCA5UB5YPHBSOn01QPFUi+xJOSCbsnrSeTwvBEvIZxrswvmTDeQrEXGozw75Tceb6
         xNHHwxM2D0iiv12X3L1hb+iwP6yrxr+fm+pB6o/sgFmWeu75McG3uRjWunbcstFV6e
         qlGpmYrV2d3ULJ9IJ2QOWqX0QWNLYQonyuUejJmOXssKFjLL2CuxOpLoN8pvLjyipV
         VHBIXdWyUqFjhsPr+t66erStHQnkjgvIUmwhpPTgKnuVG/FUOlteIermOn7OfH2wnG
         TY1y82eaQCDR1GULnZ7ARfRVpX5Yk5w7ioPvDAbJ0C6lMQ5Ev2qcZ3VSz5/xb51sYv
         7JImzYrkHM/iw==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 2E7494801C1; Tue, 18 Oct 2022 17:14:16 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv3 7/9] clk: rockchip: simplify rockchip_clk_add_lookup
Date:   Tue, 18 Oct 2022 17:14:05 +0200
Message-Id: <20221018151407.63395-8-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

rockchip_clk_add_lookup is only called from within the file,
so it can be made static. The additional checks are removed
with the following reasoning:

1. The data structure is initialized by rockchip_clk_init(),
   which is called by all rockchip platforms before the clocks
   are registered. Not doing so would result in an incomplete
   clock tree at the moment, which is a fatal error. In other
   parts of the kernel these kind of checks are usually
   omitted, so this was done here. The alternative is adding
   a pr_err to inform the kernel programmer adding a new platform
   about his incorrect code. Apart from that we are also not
   checking if the clock id is within the array boundings.

2. While not used so far by any rockchip platform, 0 is a valid
   clock identifier. To align rockchip closer to other ARM
   platforms we will start using it with rk3588.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 14 ++++++--------
 drivers/clk/rockchip/clk.h |  2 --
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index e63d4f20b479..1aed6f254ccd 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -198,6 +198,12 @@ static void rockchip_fractional_approximation(struct clk_hw *hw,
 	clk_fractional_divider_general_approximation(hw, rate, parent_rate, m, n);
 }
 
+static void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
+				    struct clk *clk, unsigned int id)
+{
+	ctx->clk_data.clks[id] = clk;
+}
+
 static struct clk *rockchip_clk_register_frac_branch(
 		struct rockchip_clk_provider *ctx, const char *name,
 		const char *const *parent_names, u8 num_parents,
@@ -401,14 +407,6 @@ void rockchip_clk_of_add_provider(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_of_add_provider);
 
-void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
-			     struct clk *clk, unsigned int id)
-{
-	if (ctx->clk_data.clks && id)
-		ctx->clk_data.clks[id] = clk;
-}
-EXPORT_SYMBOL_GPL(rockchip_clk_add_lookup);
-
 void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 				struct rockchip_pll_clock *list,
 				unsigned int nr_pll, int grf_lock_offset)
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 24d3e56d3f71..6e84ab85b372 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -928,8 +928,6 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 void rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx);
-void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
-			     struct clk *clk, unsigned int id);
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk);
-- 
2.35.1


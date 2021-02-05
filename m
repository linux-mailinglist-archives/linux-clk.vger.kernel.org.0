Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0DD3116CF
	for <lists+linux-clk@lfdr.de>; Sat,  6 Feb 2021 00:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBEXOT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Feb 2021 18:14:19 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42280 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhBELFv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Feb 2021 06:05:51 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l7yvC-0001Ja-11; Fri, 05 Feb 2021 12:05:06 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     heiko@sntech.de
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 4/5] clk: rockchip: use clock id for SCLK_VIP_OUT on rk3368
Date:   Fri,  5 Feb 2021 12:05:01 +0100
Message-Id: <20210205110502.1850669-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205110502.1850669-1-heiko@sntech.de>
References: <20210205110502.1850669-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Export the vip-out clock via the newly added clock-id.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 76fb04120089..61413be48d1a 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -474,7 +474,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	COMPOSITE_NODIV(0, "vip_src", mux_pll_src_cpll_gpll_p, 0,
 			RK3368_CLKSEL_CON(21), 15, 1, MFLAGS,
 			RK3368_CLKGATE_CON(4), 5, GFLAGS),
-	COMPOSITE_NOGATE(0, "sclk_vip_out", mux_vip_out_p, 0,
+	COMPOSITE_NOGATE(SCLK_VIP_OUT, "sclk_vip_out", mux_vip_out_p, 0,
 			RK3368_CLKSEL_CON(21), 14, 1, MFLAGS, 8, 5, DFLAGS),
 
 	COMPOSITE_NODIV(SCLK_EDP_24M, "sclk_edp_24m", mux_edp_24m_p, 0,
-- 
2.29.2


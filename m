Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CB9406301
	for <lists+linux-clk@lfdr.de>; Fri, 10 Sep 2021 02:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241362AbhIJAqp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Sep 2021 20:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:45886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233216AbhIJATh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Sep 2021 20:19:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59194610E9;
        Fri, 10 Sep 2021 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233107;
        bh=oa4wwDdzBYZNqvMFtcmTxt5aqRk6L4HRjI4WQ6iUDVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i+7RvikcYR3U9VJGnBTMoa+KffFM6WM9bI2HntaHmJwGwhM7UtNXyDP6cdoUq7ZIz
         GX5D5gEh9ypnkoQnl1mjijRTfv5p++riUFTQbGoZmdZVBvw7C7v3Kk4G53ejlf1w1u
         /FJoWo8ZZhqoBM51FOkiZLSGXXGSm5TOKCo4ENai9e2a6EE0KvIi5HlFkEkEfl5rrg
         tQpW0W8SszBG99KA3RL7va4rWs6Fj/eoxeq42PIuG2ZoHw5GnZkZhG2QoLmdJCuSSX
         O7/18tzklAUFpVqHNc75ghkFUCgwcAe6C5uud2ahgTVqfZexMRfQ4bNV1x0abjavgG
         f+ZK8adVeudiQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jon Lin <jon.lin@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 04/88] clk: rockchip: rk3036: fix up the sclk_sfc parent error
Date:   Thu,  9 Sep 2021 20:16:56 -0400
Message-Id: <20210910001820.174272-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001820.174272-1-sashal@kernel.org>
References: <20210910001820.174272-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jon Lin <jon.lin@rock-chips.com>

[ Upstream commit 0be3df186f870cbde56b223c1ad7892109c9c440 ]

Choose the correct pll

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/r/20210713094456.23288-5-jon.lin@rock-chips.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/rockchip/clk-rk3036.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 91d56ad45817..1986856d94b2 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -121,6 +121,7 @@ PNAME(mux_pll_src_3plls_p)	= { "apll", "dpll", "gpll" };
 PNAME(mux_timer_p)		= { "xin24m", "pclk_peri_src" };
 
 PNAME(mux_pll_src_apll_dpll_gpll_usb480m_p)	= { "apll", "dpll", "gpll", "usb480m" };
+PNAME(mux_pll_src_dmyapll_dpll_gpll_xin24_p)   = { "dummy_apll", "dpll", "gpll", "xin24m" };
 
 PNAME(mux_mmc_src_p)	= { "apll", "dpll", "gpll", "xin24m" };
 PNAME(mux_i2s_pre_p)	= { "i2s_src", "i2s_frac", "ext_i2s", "xin12m" };
@@ -340,7 +341,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(16), 8, 2, MFLAGS, 10, 5, DFLAGS,
 			RK2928_CLKGATE_CON(10), 4, GFLAGS),
 
-	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
+	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_dmyapll_dpll_gpll_xin24_p, 0,
 			RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, DFLAGS,
 			RK2928_CLKGATE_CON(10), 5, GFLAGS),
 
-- 
2.30.2


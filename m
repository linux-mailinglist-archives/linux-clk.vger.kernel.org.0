Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4B126CCD
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2019 21:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733168AbfEVTaK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 May 2019 15:30:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733159AbfEVTaK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 May 2019 15:30:10 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05F7C20879;
        Wed, 22 May 2019 19:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558553408;
        bh=oV5MnESwSqTdxHd32Kvszv6+H5fgv7apnZmsWkGPLuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iIqXrDstkkFYnErM2HP/KLBSdjYm5/keR0vftV6u/VFGmxmOYEM80/U6byEzrEWLW
         eD+OYQ3WhoSvEdlzjpPVE1eot8KudqYMjE5HB/GW6+pXZ/PX1Tv9jkOH1fzM4nFqHs
         HAOE2rV+nh+SUJUkSi5nnI7515Gy9untYNxUDHRE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 057/167] clk: rockchip: undo several noc and special clocks as critical on rk3288
Date:   Wed, 22 May 2019 15:26:52 -0400
Message-Id: <20190522192842.25858-57-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192842.25858-1-sashal@kernel.org>
References: <20190522192842.25858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit f4033db5b84ebe4b32c25ba2ed65ab20b628996a ]

This is mostly a revert of commit 55bb6a633c33 ("clk: rockchip: mark
noc and some special clk as critical on rk3288") except that we're
keeping "pmu_hclk_otg0" as critical still.

NOTE: turning these clocks off doesn't seem to do a whole lot in terms
of power savings (checking the power on the logic rail).  It appears
to save maybe 1-2mW.  ...but still it seems like we should turn the
clocks off if they aren't needed.

About "pmu_hclk_otg0" (the one clock from the original commit we're
still keeping critical) from an email thread:

> pmu ahb clock
>
> Function: Clock to pmu module when hibernation and/or ADP is
> enabled. Must be greater than or equal to 30 MHz.
>
> If the SOC design does not support hibernation/ADP function, only have
> hclk_otg, this clk can be switched according to the usage of otg.
> If the SOC design support hibernation/ADP, has two clocks, hclk_otg and
> pmu_hclk_otg0.
> Hclk_otg belongs to the closed part of otg logic, which can be switched
> according to the use of otg.
>
> pmu_hclk_otg0 belongs to the always on part.
>
> As for whether pmu_hclk_otg0 can be turned off when otg is not in use,
> we have not tested. IC suggest make pmu_hclk_otg0 always on.

For the rest of the clocks:

atclk: No documentation about this clock other than that it goes to
the CPU.  CPU functions fine without it on.  Maybe needed for JTAG?

jtag: Presumably this clock is only needed if you're debugging with
JTAG.  It doesn't seem like it makes sense to waste power for every
rk3288 user.  In any case to do JTAG you'd need private patches to
adjust the pinctrl the mux the JTAG out anyway.

pclk_dbg, pclk_core_niu: On veyron Chromebooks we turn these two
clocks on only during kernel panics in order to access some coresight
registers.  Since nothing in the upstream kernel does this we should
be able to leave them off safely.  Maybe also needed for JTAG?

hsicphy12m_xin12m: There is no indication of why this clock would need
to be turned on for boards that don't use HSIC.

pclk_ddrupctl[0-1], pclk_publ0[0-1]: On veyron Chromebooks we turn
these 4 clocks on only when doing DDR transitions and they are off
otherwise.  I see no reason why they'd need to be on in the upstream
kernel which doesn't support DDRFreq.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/rockchip/clk-rk3288.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 450de24a1b422..45cd2897e586b 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -292,13 +292,13 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "aclk_core_mp", "armclk", CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(0), 4, 4, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 6, GFLAGS),
-	COMPOSITE_NOMUX(0, "atclk", "armclk", CLK_IGNORE_UNUSED,
+	COMPOSITE_NOMUX(0, "atclk", "armclk", 0,
 			RK3288_CLKSEL_CON(37), 4, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 7, GFLAGS),
 	COMPOSITE_NOMUX(0, "pclk_dbg_pre", "armclk", CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(37), 9, 5, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3288_CLKGATE_CON(12), 8, GFLAGS),
-	GATE(0, "pclk_dbg", "pclk_dbg_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_dbg", "pclk_dbg_pre", 0,
 			RK3288_CLKGATE_CON(12), 9, GFLAGS),
 	GATE(0, "cs_dbg", "pclk_dbg_pre", CLK_IGNORE_UNUSED,
 			RK3288_CLKGATE_CON(12), 10, GFLAGS),
@@ -626,7 +626,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	INVERTER(SCLK_HSADC, "sclk_hsadc", "sclk_hsadc_out",
 			RK3288_CLKSEL_CON(22), 7, IFLAGS),
 
-	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,
+	GATE(0, "jtag", "ext_jtag", 0,
 			RK3288_CLKGATE_CON(4), 14, GFLAGS),
 
 	COMPOSITE_NODIV(SCLK_USBPHY480M_SRC, "usbphy480m_src", mux_usbphy480m_p, 0,
@@ -635,7 +635,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE_NODIV(SCLK_HSICPHY480M, "sclk_hsicphy480m", mux_hsicphy480m_p, 0,
 			RK3288_CLKSEL_CON(29), 0, 2, MFLAGS,
 			RK3288_CLKGATE_CON(3), 6, GFLAGS),
-	GATE(0, "hsicphy12m_xin12m", "xin12m", CLK_IGNORE_UNUSED,
+	GATE(0, "hsicphy12m_xin12m", "xin12m", 0,
 			RK3288_CLKGATE_CON(13), 9, GFLAGS),
 	DIV(0, "hsicphy12m_usbphy", "sclk_hsicphy480m", 0,
 			RK3288_CLKSEL_CON(11), 8, 6, DFLAGS),
@@ -816,11 +816,6 @@ static const char *const rk3288_critical_clocks[] __initconst = {
 	"pclk_alive_niu",
 	"pclk_pd_pmu",
 	"pclk_pmu_niu",
-	"pclk_core_niu",
-	"pclk_ddrupctl0",
-	"pclk_publ0",
-	"pclk_ddrupctl1",
-	"pclk_publ1",
 	"pmu_hclk_otg0",
 };
 
-- 
2.20.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8992213B87
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jul 2020 16:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCOL4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Fri, 3 Jul 2020 10:11:56 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40308 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCOLz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Jul 2020 10:11:55 -0400
Received: from p5b127e6f.dip0.t-ipconnect.de ([91.18.126.111] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jrMPr-0001Ch-St; Fri, 03 Jul 2020 16:11:47 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     =?ISO-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        kernel@collabora.com, linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/2] clk: rockchip: rk3288: Handle clock tree for rk3288w
Date:   Fri, 03 Jul 2020 16:11:46 +0200
Message-ID: <1793210.9Kb5SQUFvz@phil>
In-Reply-To: <CAMty3ZDx-_-VHEwjbV05GBb-hQbPpo21aZbCrQ+GTaoT_gxAMg@mail.gmail.com>
References: <20200602080644.11333-1-mylene.josserand@collabora.com> <20200602080644.11333-2-mylene.josserand@collabora.com> <CAMty3ZDx-_-VHEwjbV05GBb-hQbPpo21aZbCrQ+GTaoT_gxAMg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jagan,

Am Montag, 29. Juni 2020, 21:11:03 CEST schrieb Jagan Teki:
> On Tue, Jun 2, 2020 at 1:37 PM Myl�ne Josserand
> <mylene.josserand@collabora.com> wrote:
> >
> > The revision rk3288w has a different clock tree about "hclk_vio"
> > clock, according to the BSP kernel code.
> >
> > This patch handles this difference by detecting which device-tree
> > we are using. If it is a "rockchip,rk3288-cru", let's register
> > the clock tree as it was before. If the device-tree node is
> > "rockchip,rk3288w-cru", we will apply the difference with this
> > version of this SoC.
> >
> > Noticed that this new device-tree compatible must be handled in
> > bootloader such as u-boot.
> >
> > Signed-off-by: Myl�ne Josserand <mylene.josserand@collabora.com>
> > ---
> >  drivers/clk/rockchip/clk-rk3288.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
> > index cc2a177bbdbf..204976e2d0cb 100644
> > --- a/drivers/clk/rockchip/clk-rk3288.c
> > +++ b/drivers/clk/rockchip/clk-rk3288.c
> > @@ -425,8 +425,6 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
> >         COMPOSITE(0, "aclk_vio0", mux_pll_src_cpll_gpll_usb480m_p, CLK_IGNORE_UNUSED,
> >                         RK3288_CLKSEL_CON(31), 6, 2, MFLAGS, 0, 5, DFLAGS,
> >                         RK3288_CLKGATE_CON(3), 0, GFLAGS),
> > -       DIV(0, "hclk_vio", "aclk_vio0", 0,
> > -                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> >         COMPOSITE(0, "aclk_vio1", mux_pll_src_cpll_gpll_usb480m_p, CLK_IGNORE_UNUSED,
> >                         RK3288_CLKSEL_CON(31), 14, 2, MFLAGS, 8, 5, DFLAGS,
> >                         RK3288_CLKGATE_CON(3), 2, GFLAGS),
> > @@ -819,6 +817,16 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
> >         INVERTER(0, "pclk_isp", "pclk_isp_in", RK3288_CLKSEL_CON(29), 3, IFLAGS),
> >  };
> >
> > +static struct rockchip_clk_branch rk3288w_hclkvio_branch[] __initdata = {
> > +       DIV(0, "hclk_vio", "aclk_vio1", 0,
> > +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> > +};
> > +
> > +static struct rockchip_clk_branch rk3288_hclkvio_branch[] __initdata = {
> > +       DIV(0, "hclk_vio", "aclk_vio0", 0,
> > +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> > +};
> > +
> >  static const char *const rk3288_critical_clocks[] __initconst = {
> >         "aclk_cpu",
> >         "aclk_peri",
> > @@ -936,6 +944,14 @@ static void __init rk3288_clk_init(struct device_node *np)
> >                                    RK3288_GRF_SOC_STATUS1);
> >         rockchip_clk_register_branches(ctx, rk3288_clk_branches,
> >                                   ARRAY_SIZE(rk3288_clk_branches));
> > +
> > +       if (of_device_is_compatible(np, "rockchip,rk3288w-cru"))
> > +               rockchip_clk_register_branches(ctx, rk3288w_hclkvio_branch,
> > +                                              ARRAY_SIZE(rk3288w_hclkvio_branch));
> > +       else
> > +               rockchip_clk_register_branches(ctx, rk3288_hclkvio_branch,
> > +                                              ARRAY_SIZE(rk3288_hclkvio_branch));
> > +
> 
> Sorry for the late query on this. I am a bit unclear about this
> compatible change, does Linux expect to replace rockchip,rk3288-cru
> with rockchip,rk3288w-cru in bootloader if the chip is RK3288w? or
> append the existing cru compatible node with rockchip,rk3288w-cru?
> because replace new cru node make clock never probe since the
> CLK_OF_DECLARE checking rockchip,rk3288-cru

I guess right now we'd expect "rockchip,rk3288w-cru", "rockchip,rk3288-cru",

Thinking again about this, I'm wondering if we should switch to having
only one per variant ... like on the two rk3188 variants,
so declaring separate rk3288-cru and rk3288w-cru of-clks with shared
common code.




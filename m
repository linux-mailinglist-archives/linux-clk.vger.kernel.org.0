Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC7B213BC0
	for <lists+linux-clk@lfdr.de>; Fri,  3 Jul 2020 16:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgGCOXl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 Jul 2020 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgGCOXl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jul 2020 10:23:41 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80783C08C5DE
        for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2020 07:23:40 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id f12so8211865eja.9
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2020 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UQ7G0hA0SMWmSwYjrwUJnEz8j6/Z76OeJEAbHNNj2Ss=;
        b=daddqPR6uTcarHI9HjdPmJ13SV+FKzfQjj05FE/EqRiqx4zNUESoIPIaOket7Ruh5O
         nwYk2nso5xDxsGRYmxDfnLqUkvFfPz8XOyAK5TGWzcs58TR73xhqv2LtNj4+pk0RlZ6k
         vEu50GKqUo+LIPVCdoVFyWsOpceiOx8U6LdkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UQ7G0hA0SMWmSwYjrwUJnEz8j6/Z76OeJEAbHNNj2Ss=;
        b=hPee64GvOwaHU7T3f9xSt+ZxwfJSH5spSz541IAJCQ+ndpm7kj1MGKQEugnnhWDttX
         dVC9sEyARjMAG0UTkjpTvMmgPTIiVONtO7VuVmRl6aj5Ib+vw3ngzx5SATFJ1sWhItSb
         Ope4SrR/XP5KYicR3J1oss4EV7cUF988YV6juVx8lN8A27ecZ+LiPir0QnKyff51pr3L
         yyFfZY9BXmqU9HNf0u49ammh91rHPR20o546aq7Ecu8ZCtzFrTHY3Rvvfzc+qcjx5/Y8
         aEJdtXIW31DAKCJpZ3N+dw1k4FERw01aWbeFRi0jjB6nDaustZF19sBVvm9vLpiylyaC
         QCnA==
X-Gm-Message-State: AOAM532jWC3qOiwzewy3gVnye9JEagGw3dNt8ZH6y3rAc8h2hBv3faQF
        9TJPOFRFMQsNmm9w41zfMZr64c0D/FwL2fTTjs406w==
X-Google-Smtp-Source: ABdhPJwhtCuFZ+xg2dYXyaJW0mF1XhBGQePYnM3MQRQc/8w61ymzMBkDADSR2zuvH7jNLrL8djJ5mTnWs4yzeoe2g4k=
X-Received: by 2002:a17:906:6dda:: with SMTP id j26mr33430732ejt.336.1593786219131;
 Fri, 03 Jul 2020 07:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200602080644.11333-1-mylene.josserand@collabora.com>
 <20200602080644.11333-2-mylene.josserand@collabora.com> <CAMty3ZDx-_-VHEwjbV05GBb-hQbPpo21aZbCrQ+GTaoT_gxAMg@mail.gmail.com>
 <1793210.9Kb5SQUFvz@phil>
In-Reply-To: <1793210.9Kb5SQUFvz@phil>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 3 Jul 2020 19:53:27 +0530
Message-ID: <CAMty3ZB1n5uXmH=U4iXfgpyU-JZff74Rm2Mj+SS2LLtkM2fARQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: rockchip: rk3288: Handle clock tree for rk3288w
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        kernel@collabora.com, linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 3, 2020 at 7:41 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Jagan,
>
> Am Montag, 29. Juni 2020, 21:11:03 CEST schrieb Jagan Teki:
> > On Tue, Jun 2, 2020 at 1:37 PM Myl=C3=A8ne Josserand
> > <mylene.josserand@collabora.com> wrote:
> > >
> > > The revision rk3288w has a different clock tree about "hclk_vio"
> > > clock, according to the BSP kernel code.
> > >
> > > This patch handles this difference by detecting which device-tree
> > > we are using. If it is a "rockchip,rk3288-cru", let's register
> > > the clock tree as it was before. If the device-tree node is
> > > "rockchip,rk3288w-cru", we will apply the difference with this
> > > version of this SoC.
> > >
> > > Noticed that this new device-tree compatible must be handled in
> > > bootloader such as u-boot.
> > >
> > > Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@collabora.com>
> > > ---
> > >  drivers/clk/rockchip/clk-rk3288.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip=
/clk-rk3288.c
> > > index cc2a177bbdbf..204976e2d0cb 100644
> > > --- a/drivers/clk/rockchip/clk-rk3288.c
> > > +++ b/drivers/clk/rockchip/clk-rk3288.c
> > > @@ -425,8 +425,6 @@ static struct rockchip_clk_branch rk3288_clk_bran=
ches[] __initdata =3D {
> > >         COMPOSITE(0, "aclk_vio0", mux_pll_src_cpll_gpll_usb480m_p, CL=
K_IGNORE_UNUSED,
> > >                         RK3288_CLKSEL_CON(31), 6, 2, MFLAGS, 0, 5, DF=
LAGS,
> > >                         RK3288_CLKGATE_CON(3), 0, GFLAGS),
> > > -       DIV(0, "hclk_vio", "aclk_vio0", 0,
> > > -                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> > >         COMPOSITE(0, "aclk_vio1", mux_pll_src_cpll_gpll_usb480m_p, CL=
K_IGNORE_UNUSED,
> > >                         RK3288_CLKSEL_CON(31), 14, 2, MFLAGS, 8, 5, D=
FLAGS,
> > >                         RK3288_CLKGATE_CON(3), 2, GFLAGS),
> > > @@ -819,6 +817,16 @@ static struct rockchip_clk_branch rk3288_clk_bra=
nches[] __initdata =3D {
> > >         INVERTER(0, "pclk_isp", "pclk_isp_in", RK3288_CLKSEL_CON(29),=
 3, IFLAGS),
> > >  };
> > >
> > > +static struct rockchip_clk_branch rk3288w_hclkvio_branch[] __initdat=
a =3D {
> > > +       DIV(0, "hclk_vio", "aclk_vio1", 0,
> > > +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> > > +};
> > > +
> > > +static struct rockchip_clk_branch rk3288_hclkvio_branch[] __initdata=
 =3D {
> > > +       DIV(0, "hclk_vio", "aclk_vio0", 0,
> > > +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> > > +};
> > > +
> > >  static const char *const rk3288_critical_clocks[] __initconst =3D {
> > >         "aclk_cpu",
> > >         "aclk_peri",
> > > @@ -936,6 +944,14 @@ static void __init rk3288_clk_init(struct device=
_node *np)
> > >                                    RK3288_GRF_SOC_STATUS1);
> > >         rockchip_clk_register_branches(ctx, rk3288_clk_branches,
> > >                                   ARRAY_SIZE(rk3288_clk_branches));
> > > +
> > > +       if (of_device_is_compatible(np, "rockchip,rk3288w-cru"))
> > > +               rockchip_clk_register_branches(ctx, rk3288w_hclkvio_b=
ranch,
> > > +                                              ARRAY_SIZE(rk3288w_hcl=
kvio_branch));
> > > +       else
> > > +               rockchip_clk_register_branches(ctx, rk3288_hclkvio_br=
anch,
> > > +                                              ARRAY_SIZE(rk3288_hclk=
vio_branch));
> > > +
> >
> > Sorry for the late query on this. I am a bit unclear about this
> > compatible change, does Linux expect to replace rockchip,rk3288-cru
> > with rockchip,rk3288w-cru in bootloader if the chip is RK3288w? or
> > append the existing cru compatible node with rockchip,rk3288w-cru?
> > because replace new cru node make clock never probe since the
> > CLK_OF_DECLARE checking rockchip,rk3288-cru
>
> I guess right now we'd expect "rockchip,rk3288w-cru", "rockchip,rk3288-cr=
u",
>
> Thinking again about this, I'm wondering if we should switch to having
> only one per variant ... like on the two rk3188 variants,
> so declaring separate rk3288-cru and rk3288w-cru of-clks with shared
> common code.

What if can check the root compatible instead cru compatible for revision W=
 like

-  if (of_device_is_compatible(np, "rockchip,rk3288w-cru"))
+ if (of_device_is_compatible(np, "rockchip,rk3288w"))

This way we can have a single compatible update at bootloader that
makes Linux adjust revision W chips code.

Doesn't it make sense?

Jagan.

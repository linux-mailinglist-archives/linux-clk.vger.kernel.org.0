Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B932635729
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2019 08:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfFEGto (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Jun 2019 02:49:44 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47939 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfFEGtn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 02:49:43 -0400
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id CB24B100008;
        Wed,  5 Jun 2019 06:49:33 +0000 (UTC)
Date:   Wed, 5 Jun 2019 08:49:33 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for
 PLL_MIPI
Message-ID: <20190605064933.6bmskkxzzgn35xz7@flea>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-12-jagan@amarulasolutions.com>
 <20190125212433.ni2jg3wvpyjazlxf@flea>
 <CAMty3ZAsH2iZ+JEqTE3D58aXfGuhMSg9YoO56ZhhOeE4c4yQHQ@mail.gmail.com>
 <20190129151348.mh27btttsqcmeban@flea>
 <CAMty3ZAjAoti8Zu80c=OyCA+u-jtQnkidsKSNz_c2OaRswqc3w@mail.gmail.com>
 <20190201143102.rcvrxstc365mezvx@flea>
 <CAMty3ZC3_+z1upH4Y08R1z=Uq1C=OpWETNrBO8nGRoHhuNrHSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zppxshyy34mh4cra"
Content-Disposition: inline
In-Reply-To: <CAMty3ZC3_+z1upH4Y08R1z=Uq1C=OpWETNrBO8nGRoHhuNrHSA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--zppxshyy34mh4cra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've reordered the mail a bit to work on chunks

On Fri, May 24, 2019 at 03:37:42PM +0530, Jagan Teki wrote:
> > I wish it was in your commit log in the first place, instead of having
> > to exchange multiple mails over this.
> >
> > However, I don't think that's quite true, and it might be a bug in
> > Allwinner's implementation (or rather something quite confusing).
> >
> > You're right that the lcd_rate and pll_rate seem to be generated from
> > the pixel clock, and it indeed looks like the ratio between the pixel
> > clock and the TCON dotclock is defined through the number of bits per
> > lanes.
> >
> > However, in this case, dsi_rate is actually the same than lcd_rate,
> > since pll_rate is going to be divided by dsi_div:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L791
> >
> > Since lcd_div is 1, it also means that in this case, dsi_rate ==
> > dclk_rate.
> >
> > The DSI module clock however, is always set to 148.5 MHz. Indeed, if
> > we look at:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L804
> >
> > We can see that the rate in clk_info is used if it's different than
> > 0. This is filled by disp_al_lcd_get_clk_info, which, in the case of a
> > DSI panel, will hardcode it to 148.5 MHz:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L164
>
> Let me explain, something more.
>
> According to bsp there are clk_info.tcon_div which I will explain below.
> clk_info.dsi_div which is dynamic and it depends on bpp/lanes, so it
> is 6 for 24bpp and 4 lanes devices.
>
> PLL rate here depends on dsi_div (not tcon_div)
>
> Code here
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L784
>
> is computing the actual set rate, which depends on dsi_rate.
>
> lcd_rate = dclk_rate * clk_info.dsi_div;
> dsi_rate = pll_rate / clk_info.dsi_div;
>
> Say if the dclk_rate 148MHz then the dsi_rate is 888MHz which set rate
> for above link you mentioned.
>
> Here are the evidence with some prints.
>
> https://gist.github.com/openedev/9bae2d87d2fcc06b999fe48c998b7043
> https://gist.github.com/openedev/700de2e3701b2bf3ad1aa0f0fa862c9a

Ok, so we agree up to this point, and the prints confirm that the
analysis above is the right one.

> > So, the DSI clock is set to this here:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L805

Your patch doesn't address that, so let's leave that one alone.

> > The TCON *module* clock (the one in the clock controller) has been set
> > to lcd_rate (so the pixel clock times the number of bits per lane) here:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L800
> >
> > And the PLL has been set to the same rate here:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L794
> >
> > Let's take a step back now: that function we were looking at,
> > lcd_clk_config, is called by lcd_clk_enable, which is in turn called
> > by disp_lcd_enable here:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L1328
> >
> > The next function being called is disp_al_lcd_cfg, and that function
> > will hardcode the TCON dotclock divider to 4, here:
> > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L240
>
> tcon_div from BSP point-of-view of there are two variants
> 00) clk_info.tcon_div which is 4 and same is set the divider position
> in SUN4I_TCON0_DCLK_REG (like above link refer)
> 01) tcon_div which is 4 and used for edge timings computation
> https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L12
>
> The real reason for 01) is again 4 is they set the divider to 4 in 00)
> which is technically wrong because the dividers which used during
> dotclock in above (dsi_div) should be used here as well. Since there
> is no dynamic way of doing this BSP hard-coding these values.
>
> Patches 5,6,7 on this series doing this
> https://patchwork.freedesktop.org/series/60847/
>
> Hope this explanation helps?

It doesn't.

The clock tree is this one:

PLL(s) -> TCON module clock -> TCON dotclock.

The links I mentioned above show that the clock set to lcd_rate is the
TCON module clocks (and it should be the one taking the bpp and lanes
into account), while the TCON dotclock uses a fixed divider of 4.

In your patches, you're using the bpp / lanes divider on the TCON
dotclock, ie, the wrong clock.

Again, I'm not saying that my analysis of the source code is correct
here. But you haven't said anything to prove it's wrong either.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zppxshyy34mh4cra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPdl/QAKCRDj7w1vZxhR
xVRiAQCGwYHPpjGwI8PBAolQDDh8EMQ4OwKHtPaRxqSpTh6aNgD/Uv1nSGajLUak
r4VOaR3S8IynrXXXSDDBAo+8aG1nZgE=
=eDpG
-----END PGP SIGNATURE-----

--zppxshyy34mh4cra--

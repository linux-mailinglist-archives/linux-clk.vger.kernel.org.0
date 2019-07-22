Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796216FDAB
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2019 12:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfGVKVR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jul 2019 06:21:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33625 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729101AbfGVKVR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 06:21:17 -0400
Received: by mail-io1-f68.google.com with SMTP id z3so72762079iog.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2019 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvUQ4MT20tKEnT2pMZ7Qie/6Rn5UWcYUzvG9+P0UE/8=;
        b=dYaKDwKpIZsV5pduCcPqszK2xafHORORi23hMrluYgXxvXwZ6dZdVL7FOzeTDVydXl
         1lvWYU8fD2tG8tIKqdZ+U3AsXVUw4FkNt9pJpT73MzVSEhP+LLbyzGIA59mvQS18tOzx
         2Ib0UEcbutKUUKnU5bMNa8VwuD2MwQEk3XouU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvUQ4MT20tKEnT2pMZ7Qie/6Rn5UWcYUzvG9+P0UE/8=;
        b=mhXmXTGoL51evhw/Il2RUIIt6z5usOeKV9BXCcjixi905Q6GgPwbIBblV1ajLkxHv2
         hG1NZe/tjGHniyH38Zh2bK1ij+ftGowLD1dBn+pMJsMqV88RLbQgvF+w+OJzrX5CZ1im
         PzX4eHSHtxyhXpHc5p4WAGcBybXGQp7x/HZ1ayqjqXDNOUygStziHoVj9fL1UsEPShGx
         C1hXkdj1tl2q6aIumP/RwL4phP7rEXFcjJv6s0G+KLemSCWPDC5+mYSkiAZtTNTw++C9
         fQ/HTqqWjbzguPrHWqctVN5xVzzJGnqPwvsccerKnGHFkKRB4tF3CCk0vBlLfRknlXSl
         JnGw==
X-Gm-Message-State: APjAAAVdPJPt8SueAzg6PZF9+zqQw2mssHSuanmdBY7laljHrhqO6aZ1
        sANCpZkfcSZryMD+IW2RO8EMwq/f9CZFzIcqfaTwTg==
X-Google-Smtp-Source: APXvYqxcr8plycM4DHVSxsErfHeMyso29cxM4pZdp0Z267Iey9Jpyn2lpinXpTcfPjzlrWA66Rb2H/nzei83a0NrITY=
X-Received: by 2002:a5d:83cd:: with SMTP id u13mr61250280ior.297.1563790876111;
 Mon, 22 Jul 2019 03:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190614142406.ybdiqfppo5mc5bgq@flea> <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea> <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea> <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
 <20190711100100.cty3s6rs3w27low6@flea> <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
 <20190720065830.zn3txpyduakywcva@flea> <CAMty3ZDE1xiNgHVLihH378dY5szzkr14V-fwLZdvPs12tY+G1A@mail.gmail.com>
 <20190720093202.6fn6xmhvsgawscnu@flea>
In-Reply-To: <20190720093202.6fn6xmhvsgawscnu@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 22 Jul 2019 15:51:04 +0530
Message-ID: <CAMty3ZDpOA1mD77t3RB6hEG7o3+ws8y64m1DU8=3HdZ4zy4AUw@mail.gmail.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On Sat, Jul 20, 2019 at 3:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Sat, Jul 20, 2019 at 12:46:27PM +0530, Jagan Teki wrote:
> > On Sat, Jul 20, 2019 at 12:28 PM Maxime Ripard
> > <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trimarchi wrote:
> > > > > > tcon-pixel clock is the rate that you want to achive on display side
> > > > > > and if you have 4 lanes 32bit or lanes and different bit number that
> > > > > > you need to have a clock that is able to put outside bits and speed
> > > > > > equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> > > > > > 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> > > > > > 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> > > > > > the display.
> > > > >
> > > > > So this is what the issue is then?
> > > > >
> > > > > This one does make sense, and you should just change the rate in the
> > > > > call to clk_set_rate in sun4i_tcon0_mode_set_cpu.
> > > > >
> > > > > I'm still wondering why that hasn't been brought up in either the
> > > > > discussion or the commit log before though.
> > > > >
> > > > Something like this?
> > > >
> > > > drivers/gpu/drm/sun4i/sun4i_tcon.c     | 20 +++++++++++---------
> > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 --
> > > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > index 64c43ee6bd92..42560d5c327c 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct
> > > > drm_display_mode *mode,
> > > >  }
> > > >
> > > >  static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> > > > -                                       const struct drm_display_mode *mode)
> > > > +                                       const struct drm_display_mode *mode,
> > > > +                                       u32 tcon_mul)
> > > >  {
> > > >         /* Configure the dot clock */
> > > > -       clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> > > > +       clk_set_rate(tcon->dclk, mode->crtc_clock * tcon_mul * 1000);
> > > >
> > > >         /* Set the resolution */
> > > >         regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> > > > @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > > sun4i_tcon *tcon,
> > > >         u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> > > >         u8 lanes = device->lanes;
> > > >         u32 block_space, start_delay;
> > > > -       u32 tcon_div;
> > > > +       u32 tcon_div, tcon_mul;
> > > >
> > > > -       tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
> > > > -       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> > > > +       tcon->dclk_min_div = 4;
> > > > +       tcon->dclk_max_div = 127;
> > > >
> > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > +       tcon_mul = bpp / lanes;
> > > > +       sun4i_tcon0_mode_set_common(tcon, mode, tcon_mul);
> > > >
> > > >         /* Set dithering if needed */
> > > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > > @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > > sun4i_tcon *tcon,
> > > >          */
> > > >         regmap_read(tcon->regs, SUN4I_TCON0_DCLK_REG, &tcon_div);
> > > >         tcon_div &= GENMASK(6, 0);
> > > > -       block_space = mode->htotal * bpp / (tcon_div * lanes);
> > > > +       block_space = mode->htotal * tcon_div * tcon_mul;
> > > >         block_space -= mode->hdisplay + 40;
> > > >
> > > >         regmap_write(tcon->regs, SUN4I_TCON0_CPU_TRI0_REG,
> > > > @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct
> > > > sun4i_tcon *tcon,
> > > >
> > > >         tcon->dclk_min_div = 7;
> > > >         tcon->dclk_max_div = 7;
> > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > > >
> > > >         /* Set dithering if needed */
> > > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > > @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct
> > > > sun4i_tcon *tcon,
> > > >
> > > >         tcon->dclk_min_div = 6;
> > > >         tcon->dclk_max_div = 127;
> > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > > >
> > > >         /* Set dithering if needed */
> > > >         sun4i_tcon0_mode_set_dithering(tcon, connector);
> > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > index 5c3ad5be0690..a07090579f84 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > @@ -13,8 +13,6 @@
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_mipi_dsi.h>
> > > >
> > > > -#define SUN6I_DSI_TCON_DIV     4
> > > > -
> > > >  struct sun6i_dsi {
> > > >         struct drm_connector    connector;
> > > >         struct drm_encoder      encoder;
> > >
> > > I had more something like this in mind:
> > > http://code.bulix.org/nlp5a4-803511
> >
> > Worth to look at it. was it working on your panel? meanwhile I will check it.
>
> I haven't tested it.
>
> > We have updated with below change [1], seems working on but is
> > actually checking the each divider as before start with 4... till 127.
> >
> > This new approach, is start looking the best divider from 4.. based on
> > the idea vs rounded it will ended up best divider like [2]
>
> But why?
>
> I mean, it's not like it's the first time I'm asking this...
>
> If the issue is what Micheal described, then the divider has nothing
> to do with it. We've had that discussion over and over again.

This is what Michael is mentioned in above mail
"tcon-pixel clock is the rate that you want to achive on display side and
if you have 4 lanes 32bit or lanes and different bit number that you need
to have a clock that is able to put outside bits and speed equal to
pixel-clock * bits / lanes. so If you want a pixel-clock of 40 mhz
and you have 32bits and 4 lanes you need to have a clock of
40 * 32 / 4 in no-burst mode. "

He is trying to manage the bpp/lanes into dclk_mul (in last mail) and
it can multiply with pixel clock which is rate argument in
sun4i_dclk_round_rate.

The solution I have mentioned in dclk_min, max is bpp/lanes also
multiple rate in dotclock sun4i_dclk_round_rate.

In both cases the overall pll_rate depends on dividers, the one that I
have on this patch is based on BSP and the Michael one is more generic
way so-that it can not to touch other functionalities and looping
dividers to find the best one.

If dclk_min/max is bpp/lanes then dotclock directly using divider 6
(assuming 24-bit and 4 lanes) and return the pll_rate and divider 6
associated.

if dclk_mul is bpp/lanes, on Michael new change, the dividers start
with 4 and end with 127 but the constant ideal rate which rate *
bpp/lanes but the loop from sun4i_dclk_round_rate computed the divider
as 6 only, ie what I'm mentioned on the above mail.

Jagan.

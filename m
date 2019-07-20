Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00CF6EE3B
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jul 2019 09:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfGTHfL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 20 Jul 2019 03:35:11 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45494 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfGTHfL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 20 Jul 2019 03:35:11 -0400
Received: by mail-io1-f66.google.com with SMTP id g20so63194293ioc.12
        for <linux-clk@vger.kernel.org>; Sat, 20 Jul 2019 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yo7l/PRy7h/Gb824LBKVuDwtwGequhTqIvXIp3adEwg=;
        b=Hwc59WKWLtxrzArZ6J5z8eyuv9j8HpcYCexDbS5qTNlmj/dENQM/OZfD0JZOHjrBcd
         e3gfY6b3SpgN3x87zCd7LrNgTX7gBvdwrDg8cO7a67MqaBUG2pv/cVmZWv8p2hGjXUAY
         nXNf8gCxrjgsJRjgJNlbjQ0pOIa+0zdgPAPuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yo7l/PRy7h/Gb824LBKVuDwtwGequhTqIvXIp3adEwg=;
        b=X/q5+q880fTLnGPL8OEKR7PHCbHNjk+JCaicJ7OV084zpjH4Hyxd0T0iG9nJoc7Ai8
         0IG5gXadiudr9f8fwb1j+kyijsCb2/ygwnpRND/gnr9Vxfn+xc4yzOAM1pVxayVN7Gzr
         /Nkq5af6YL0FEAY/wp+5zWvNd3LUk5oq2KIs9tK6UWK4+MXyfmYqew5l/0abpMps7xiD
         B4JMxA+uGbYcd1YuNzYVVup4Cwe7q6dYCUI3uDpqYwx2LPWWgMzu9zx8StwwWGQ4rIbf
         1vqz5mrcQgiZ8E9PpK59R4zLWnL13EqvK5cqXlXft2u8EENVZ4bFWMBrJnS6QEJhfSV6
         iHsw==
X-Gm-Message-State: APjAAAUc4hBBJdHyjozo+Gib8V4bCZioao8qL/weEHLU72p0ICi2YYh9
        pAnaUXsgtpueQDf15NGF5pT8XNLbAl7Z+RY9T2xuFQ==
X-Google-Smtp-Source: APXvYqwDavOgrhT4MQJkkvC8k6ZNFapMZUSf4ZAK47DcNazni4xVviIrlaRZatDMKMuGJBCB0akuEaXjv2s8zidOQVM=
X-Received: by 2002:a02:bb08:: with SMTP id y8mr15097818jan.51.1563608109608;
 Sat, 20 Jul 2019 00:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190605064933.6bmskkxzzgn35xz7@flea> <CAMty3ZCCP=oCqm5=49BsjwoxdDETgBfU_5g8fQ=bz=iWApV0tw@mail.gmail.com>
 <20190614142406.ybdiqfppo5mc5bgq@flea> <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea> <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea> <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
 <20190711100100.cty3s6rs3w27low6@flea> <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
 <20190720065830.zn3txpyduakywcva@flea> <CAMty3ZDE1xiNgHVLihH378dY5szzkr14V-fwLZdvPs12tY+G1A@mail.gmail.com>
In-Reply-To: <CAMty3ZDE1xiNgHVLihH378dY5szzkr14V-fwLZdvPs12tY+G1A@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 20 Jul 2019 13:04:58 +0530
Message-ID: <CAMty3ZA0H_rbe2tJVeOmi=1v4dWXY1=0zK-+DoNawzQaHd=4ug@mail.gmail.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jul 20, 2019 at 12:46 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Sat, Jul 20, 2019 at 12:28 PM Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> >
> > On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trimarchi wrote:
> > > > > tcon-pixel clock is the rate that you want to achive on display side
> > > > > and if you have 4 lanes 32bit or lanes and different bit number that
> > > > > you need to have a clock that is able to put outside bits and speed
> > > > > equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> > > > > 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> > > > > 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> > > > > the display.
> > > >
> > > > So this is what the issue is then?
> > > >
> > > > This one does make sense, and you should just change the rate in the
> > > > call to clk_set_rate in sun4i_tcon0_mode_set_cpu.
> > > >
> > > > I'm still wondering why that hasn't been brought up in either the
> > > > discussion or the commit log before though.
> > > >
> > > Something like this?
> > >
> > > drivers/gpu/drm/sun4i/sun4i_tcon.c     | 20 +++++++++++---------
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 --
> > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > index 64c43ee6bd92..42560d5c327c 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct
> > > drm_display_mode *mode,
> > >  }
> > >
> > >  static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> > > -                                       const struct drm_display_mode *mode)
> > > +                                       const struct drm_display_mode *mode,
> > > +                                       u32 tcon_mul)
> > >  {
> > >         /* Configure the dot clock */
> > > -       clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> > > +       clk_set_rate(tcon->dclk, mode->crtc_clock * tcon_mul * 1000);
> > >
> > >         /* Set the resolution */
> > >         regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> > > @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > sun4i_tcon *tcon,
> > >         u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> > >         u8 lanes = device->lanes;
> > >         u32 block_space, start_delay;
> > > -       u32 tcon_div;
> > > +       u32 tcon_div, tcon_mul;
> > >
> > > -       tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
> > > -       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> > > +       tcon->dclk_min_div = 4;
> > > +       tcon->dclk_max_div = 127;
> > >
> > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > +       tcon_mul = bpp / lanes;
> > > +       sun4i_tcon0_mode_set_common(tcon, mode, tcon_mul);
> > >
> > >         /* Set dithering if needed */
> > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > sun4i_tcon *tcon,
> > >          */
> > >         regmap_read(tcon->regs, SUN4I_TCON0_DCLK_REG, &tcon_div);
> > >         tcon_div &= GENMASK(6, 0);
> > > -       block_space = mode->htotal * bpp / (tcon_div * lanes);
> > > +       block_space = mode->htotal * tcon_div * tcon_mul;
> > >         block_space -= mode->hdisplay + 40;
> > >
> > >         regmap_write(tcon->regs, SUN4I_TCON0_CPU_TRI0_REG,
> > > @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct
> > > sun4i_tcon *tcon,
> > >
> > >         tcon->dclk_min_div = 7;
> > >         tcon->dclk_max_div = 7;
> > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > >
> > >         /* Set dithering if needed */
> > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct
> > > sun4i_tcon *tcon,
> > >
> > >         tcon->dclk_min_div = 6;
> > >         tcon->dclk_max_div = 127;
> > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > >
> > >         /* Set dithering if needed */
> > >         sun4i_tcon0_mode_set_dithering(tcon, connector);
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > index 5c3ad5be0690..a07090579f84 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > @@ -13,8 +13,6 @@
> > >  #include <drm/drm_encoder.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > >
> > > -#define SUN6I_DSI_TCON_DIV     4
> > > -
> > >  struct sun6i_dsi {
> > >         struct drm_connector    connector;
> > >         struct drm_encoder      encoder;
> >
> > I had more something like this in mind:
> > http://code.bulix.org/nlp5a4-803511
>
> Worth to look at it. was it working on your panel? meanwhile I will check it.
>
> We have updated with below change [1], seems working on but is
> actually checking the each divider as before start with 4... till 127.
>
> This new approach, is start looking the best divider from 4.. based on
> the idea vs rounded it will ended up best divider like [2]
>
> https://gist.github.com/openedev/7e2c33248b372d29be9979e06d483673
> https://gist.github.com/openedev/c72dfffc0ca59e7ec1edcd7ad360cdd1

I made quick check on two possibilities.

1) with Maxime change
https://gist.github.com/openedev/3b0b3d35ced6d89f5be0831f1cc9d840
https://gist.github.com/openedev/dd6a9e528cde80ef0508cb54723f505d

2) with Maxime change along with min 4, max 127 divider values.
The outcome similar like 1)

This look it will depends on divider, need to check further on this page.

Jagan.

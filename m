Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F8C32B40A
	for <lists+linux-clk@lfdr.de>; Wed,  3 Mar 2021 05:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352797AbhCCEP0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Mar 2021 23:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835366AbhCBTEC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Mar 2021 14:04:02 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584C1C06178B;
        Tue,  2 Mar 2021 11:03:19 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id dm26so3050705edb.12;
        Tue, 02 Mar 2021 11:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QaCEMyw673l1y1m9Q75tzdHJjzrSk1MCLu8X7K/518o=;
        b=i4waSZ6K5fXMDjYLs7N5BQkGWBazJJNo/GSLM/Tx8R8sXRdsd9B8ptXEdtEDdLKaGP
         TcY18NDxhinSTZqvRGs0K7TTX4tQSsZSDBD/PnfrEkkZBzebHyTXkKT8nhludrYBYha7
         QSwDKpueYRrMfCGZeUFgpAyKzCrh/msgt+5jO3KVHz0W/cAd6i8BhaSZHlDZZPR14kVD
         T38TnH+oGxxhinqEMiCG/GBbTOGdeD08A/oMsQKrU6Gh44i2mcrYrZ0C068rHHpuwJOT
         W2isdVXaY23ecV7GbECDTv27+P1Rk+aQq9TFWbNlbyGPXx/VRzu9c2bJQ7MWsbJFVLNR
         K0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QaCEMyw673l1y1m9Q75tzdHJjzrSk1MCLu8X7K/518o=;
        b=PeAsHBFMHaXAV/ALGdosYCJO26EklWw1SMOtdKj0lMV3I1oHvvWJSodY9fdVehtHAb
         cUam/A7KTTtHztvWs1mPCKuLOs/c6HLs4OVkEoSuU5/DxI3zzRFFDRYsys12vNskNTXV
         3m+Tq2CZ14WqEw/vQ6nfY29iGa1XuM5qkYrlxxNYOE4YEwQ3Qgf/nr7kDuT/iSoOnemN
         Zs73RVclfHgTc9CX/vOD/m1+bNlKwjPDNbOIArCqVu2xWGA5OoaaEFqjGiDgT94qyyjP
         5Wg7+zLugW9QznE/MxXYO2GCWKODQ9pOV/HFrSkGBdBv1DUX4UZT6k0OeMQYvyWFFIIJ
         k0mQ==
X-Gm-Message-State: AOAM532GO8BVaU+M5okFqJgktezZcBIhEgAJ3ZaX6ReByUkX//+y+7TC
        qjZFHxV8733bkojP+QI3tGdhDxKnizNVG47W0RE=
X-Google-Smtp-Source: ABdhPJy32iCy6XBozpoT9fuebNVSm/nAnAmObrf6L1/8ic+Q2Gqd26pkP2y55Wj7jrTCvejqoLnFYdeR1BLyRbWDiTM=
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr2326007edb.378.1614711797814;
 Tue, 02 Mar 2021 11:03:17 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7x+CXUuPN7upiv3D+REOU4d_=i30no+SkRzUjWY58o=uUQ@mail.gmail.com>
 <20210120144454.f6b72lnasw4q3bde@fsr-ub1664-175> <20210120151305.GC19063@pengutronix.de>
 <20210120152813.x2pbs5vprevkly23@fsr-ub1664-175> <20210120155001.GD19063@pengutronix.de>
 <20210120161421.h3yng57m3fetwwih@fsr-ub1664-175> <20210121095617.GI19063@pengutronix.de>
 <20210121102450.lisl3mzqczdsmzda@fsr-ub1664-175> <CAHCN7x+eMHncRya3KWm5g=stzVf0fzNojS5mFxwvGW-sVoLsYQ@mail.gmail.com>
 <CAHCN7xLc6dnkA5Fw4cC1_nDG3KrrR4AffUzy-8gG4UKLn-rhzQ@mail.gmail.com> <20210215130620.3la4bexamozzcvjx@fsr-ub1664-175>
In-Reply-To: <20210215130620.3la4bexamozzcvjx@fsr-ub1664-175>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 2 Mar 2021 13:03:04 -0600
Message-ID: <CAHCN7xK1rWkDK6JE6MvN1UoV0b3Z5dQjeWZDNgnZHRwD1XkuZQ@mail.gmail.com>
Subject: Re: [PATCH V3] clk: imx: Fix reparenting of UARTs not associated with sdout
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 15, 2021 at 7:06 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 21-02-13 08:44:28, Adam Ford wrote:
> > On Wed, Feb 3, 2021 at 3:22 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Thu, Jan 21, 2021 at 4:24 AM Abel Vesa <abel.vesa@nxp.com> wrote:
> > > >
> > > > On 21-01-21 10:56:17, Sascha Hauer wrote:
> > > > > On Wed, Jan 20, 2021 at 06:14:21PM +0200, Abel Vesa wrote:
> > > > > > On 21-01-20 16:50:01, Sascha Hauer wrote:
> > > > > > > On Wed, Jan 20, 2021 at 05:28:13PM +0200, Abel Vesa wrote:
> > > > > > > > On 21-01-20 16:13:05, Sascha Hauer wrote:
> > > > > > > > > Hi Abel,
> > > > > > > > >
> > > > > > > > > On Wed, Jan 20, 2021 at 04:44:54PM +0200, Abel Vesa wrote=
:
> > > > > > > > > > On 21-01-18 08:00:43, Adam Ford wrote:
> > > > > > > > > > > On Mon, Jan 18, 2021 at 6:52 AM Abel Vesa <abel.vesa@=
nxp.com> wrote:
> > > > > > > >
> > > > > > > > ...
> > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > TBH, I'm against the idea of having to call consume=
r API from a clock provider driver.
> > > > > > > > > > > > I'm still investigating a way of moving the uart cl=
ock control calls in drivers/serial/imx,
> > > > > > > > > > > > where they belong.
> > > > > > > > > > >
> > > > > > > > > > > That makes sense.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Just a thought. The uart clock used for console remains=
 on from u-boot,
> > > > > > > > > > so maybe it's enough to just add the CLK_IGNORE_UNUSED =
flag to all the
> > > > > > > > > > uart root clocks and remove the prepare/enable calls fo=
r uart clocks
> > > > > > > > > > for good. I don't really have a way to test it right no=
w, but maybe
> > > > > > > > > > you could give it a try.
> > > > > > > > >
> > > > > > > > > That would mean that UART clocks will never be disabled, =
regardless of
> > > > > > > > > whether they are used for console or not. That doesn't so=
und very
> > > > > > > > > appealing.
> > > > > > > >
> > > > > > > > AFAIK, the only uart clock that is enabled by u-boot is the=
 one used for
> > > > > > > > the console. Later on, when the serial driver probes, it wi=
ll enable it itself.
> > > > > > > >
> > > > > > > > Unless I'm missing something, this is exactly what we need.
> > > > > > >
> > > > > > > It might enable it, but with CLK_IGNORE_UNUSED the clock won'=
t be
> > > > > > > disabled again when a port is closed after usage
> > > > > >
> > > > > > OK, tell me what I'm getting wrong in the following scenario:
> > > > > >
> > > > > > U-boot leaves the console uart clock enabled. All the other one=
s are disabled.
> > > > > >
> > > > > > Kernel i.MX clk driver registers the uart clocks with flag CLK_=
IGNORE_UNUSED.
> > > > >
> > > > > I was wrong at that point. I originally thought the kernel will n=
ever
> > > > > disable these clocks, but in fact it only leaves them enabled dur=
ing the
> > > > > clk_disable_unused call.
> > > > >
> > > > > However, when CLK_IGNORE_UNUSED becomes relevant it's too late al=
ready.
> > > > > I just chatted with Lucas and he told me what the original proble=
m was
> > > > > that his patch solved.
> > > > >
> > > > > The problem comes when an unrelated device and the earlycon UART =
have
> > > > > the same parent clocks. The parent clock is enabled, but it's ref=
erence
> > > > > count is zero. Now when the unrelated device probes and toggles i=
ts
> > > > > clocks then the shared parent clock will be disabled due to the
> > > > > reference count being zero. Next time earlycon prints a character=
 the
> > > > > system hangs because the UART gates are still enabled, but their =
parent
> > > > > clocks no longer are.
> > > > >
> > > >
> > > > Hmm, that is indeed a problem. That's why I think there should be s=
ome
> > > > kind of NOCACHE flag for almost all the types of clocks. For exampl=
e,
> > > > in this case, it makes sense for the core to check the bit in the r=
egister
> > > > and then disable the parent based on that instead of relying on the=
 refcount.
> > > > Anyway, that's something that needs to be added in the CCF.
> > > >
> > > > > Overall I think Lucas' patches are still valid and relevant and w=
ith
> > > > > Adams patches we even no longer have to enable all UART clocks, b=
ut
> > > > > only the ones which are actually needed.
> > > >
> > > > Yeah, for now, I think we can go with Adam's patches. But longterm,=
 I would
> > > > like to remove the special case of the uart clocks we have right no=
w in all
> > > > the i.MX clock drivers.
> >
> > I looked around at other serial drivers, and I found nothing like this
> > function for enabling all UART clocks.  There are generic functions
> > for registering consoles, earlycon etc, and the serial driver fetches
> > the per and igp clocks from the device tree, so I attempted to simply
> > remove imx_register_uart_clocks().  I booted an i.MX8M Nano from a
> > fully-powered off state, and my serial console came up just fine.
>
> Just because it works, doesn't mean it is safe. To put it simply, the
> risk of some  driver disabling a clock that is parent of the uart clock
> would render the earlycon broken.
>
> >
> > I checked the clk_summary, and the clock parents are set correctly and
> > the respective clock rates appear to be correct (ie, the console is
> > working at the desired baud rate, and Bluetooth is happy)
> >
> > Since I don't fully understand the serial driver and the clock
> > dependencies, I don't want to just simply remove the function without
> > discussing it, because I don't know the ramifications.  However, when
> > testing on the i.MX8M Nano, things look OK.
> > I also tested suspend-resume and the console UART appears to return
> > and the Bluetooth UART set to 4Mbps works just fine too.
> >
> > I'd like to post a V4 which just removes imx_register_uart_clocks and
> > the corresponding calls to it.  I don't know enough about the older
> > 32-bit i.MX SoC's, but I have build-tested it, and I can generate a
> > patch. Are there any objections and/or concerns?
> >
>
> Please don't remove the imx_register_uart_clocks for now. As much as I
> would like it gone, the way the earlycon could end up broken is
> so ugly that it would make it a real pain to debug it later on.

I won't do a V4, but where do we go from here?  I have a V3 that was
waiting for reviews, but there were some concerns.  We currently
cannot re-parent the UART's on iMX8MM or iMX8MN.  Should I resend V3,
or are there fixes/changes requested to V3?

adam
>
> > adam
> > > >
> > >
> > > Is the patch I submitted good enough for someone's acked-by or
> > > reviewed-by, or are there changes I need to implement?
> > >
> > > adam
> > >
> > > > >
> > > > > Sascha
> > > > >
> > > > >
> > > > > --
> > > > > Pengutronix e.K.                           |                     =
        |
> > > > > Steuerwalder Str. 21                       | https://eur01.safeli=
nks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pengutronix.de%2F&amp;da=
ta=3D04%7C01%7Cabel.vesa%40nxp.com%7C12862aeac2934a4a94f108d8d02de573%7C686=
ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637488242849833051%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DfKDvWYJIU7hBROH6yDM9FYUCHJDK9wMjTeJDMxRff8o%3D&amp;reser=
ved=3D0  |
> > > > > 31137 Hildesheim, Germany                  | Phone: +49-5121-2069=
17-0    |
> > > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-2069=
17-5555 |

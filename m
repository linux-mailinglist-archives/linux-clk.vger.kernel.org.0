Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9266C7D1B
	for <lists+linux-clk@lfdr.de>; Fri, 24 Mar 2023 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjCXLUL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Mar 2023 07:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjCXLUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Mar 2023 07:20:10 -0400
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9218225972;
        Fri, 24 Mar 2023 04:20:08 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 02E8758211D;
        Fri, 24 Mar 2023 07:20:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 24 Mar 2023 07:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1679656805; x=1679664005; bh=jn
        hC/DvfTlyZcOnZuUe9LuHIarcRp2uTbbPObwOvLtk=; b=RINbDJrDavr91qApxS
        4BIapnsTSMpJsQcMuiekOJ4buZfgO1V5bxZUX92x96X+70RG5pM597H6X6A8ze2Q
        J3K3HTIk9bh/ZbHNJcL4cY9CXoNlp9BFd+TTAQzaGhbL4Q/xS5FNx1TElQW6xvG7
        0pWgXxxHWJn2xo8oKO6WZBtJ8/apSTxWaFgzT4XANpTX/yFywGqPfreFSFA+SxYy
        DVWfFOmgiUFFAwcBCuUS5l1GOHRlbwP6IKA226oMHwgNZfpxX+vE/kqqplzGKxN6
        3CA6w8YfKEc956VkNbvyMcVk4fjXMyE6jZ/K83ddG+CzpHvsr07jRCCCdY737Omz
        uzeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679656805; x=1679664005; bh=jnhC/DvfTlyZc
        OnZuUe9LuHIarcRp2uTbbPObwOvLtk=; b=G4KWdAq5u3yOdbhwSK/77/yGH7IQB
        2xysJ+4DHASMDHD4DpUNSh0qiUQ7PoZ0HeB31FPCqa3ypIcHnjDyiqx4+OASl4vt
        YII+0RiTBeUGCTuHiRp/2zrlkY7JsRYyob4hyT9jfvFspEvX+TWDxi6HeqVtkkkI
        EIEz+43mJMF3TccMFqhY9/s2d2q0Bnzb5506eHVsiiRibRjc0JM/OyGd5+joNcoL
        b2y+9ja4sW5wabUkTzlsQiAxcTUWRGjZRPmuIIWmJFWEdsTq0+X56oaR8GkrkVqB
        dX4i5J533jmuMxkiG1iqzEHijtLWz0ghQXTKvlKaafFgHLlEw3jiDRZ4g==
X-ME-Sender: <xms:YocdZJLt50SkjajEyhHxYSSrkPY2nLRG7oaF9-PbUsC11O7ePH7evw>
    <xme:YocdZFJvv5yKSgbbCu2PjUCjA3iwB3zBFKv-CakFAJTI01X8NjMVPj3knfOKgALZS
    iMcO2SYsLNKDxAxjx0>
X-ME-Received: <xmr:YocdZBtqfm5ufo2nxuPX_n4UUydUMdQkmyrCYSBkP5S6uLxOjnGe7GgKlZv5k0gAuEdnyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegiedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YocdZKbb7h5XVzEGX4iPtxOkH5TmcsjFZOlhmJTWiCjxSzGBF3gLdQ>
    <xmx:YocdZAZuVnKbOWnxm7JK_ixmWayh3DAJUGZTPl_6A4AyOaeCS8MgPA>
    <xmx:YocdZODYFHhXEhG6sanelWXub-LDcHvfMUzvrDzXEPo_cfiaikGjCA>
    <xmx:ZYcdZJnXIuUKCYqWP9MzEN0pWHGV9cxtt8SL0wrI9YqOxIudpLjjYg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 07:20:01 -0400 (EDT)
Date:   Fri, 24 Mar 2023 12:19:59 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        David Airlie <airlied@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner <david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <20230324111959.frjf4neopbs67ugd@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ygvujwxxgbycerm7"
Content-Disposition: inline
In-Reply-To: <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ygvujwxxgbycerm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 23, 2023 at 03:35:30PM +0000, Aidan MacDonald wrote:
>=20
> Stephen Boyd <sboyd@kernel.org> writes:
>=20
> > Quoting Maxime Ripard (2022-11-09 03:00:45)
> >> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
> >> >
> >> > Maxime Ripard <maxime@cerno.tech> writes:
> >> >
> >> > > Hi,
> >> > >
> >> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
> >> >
> >> > Assigning the parent clock in the DT works once, at boot, but going =
off
> >> > what you wrote in the commit message, if the clock driver has a
> >> > .determine_rate() implementation that *can* reparent clocks then it
> >> > probably *will* reparent them, and the DT assignment will be lost.
> >>
> >> Yes, indeed, but assigned-clock-parents never provided any sort of
> >> guarantee on whether or not the clock was allowed to reparent or not.
> >> It's just a one-off thing, right before probe, and a clk_set_parent()
> >> call at probe will override that just fine.
> >>
> >> Just like assigned-clock-rates isn't permanent.
> >>
> >> > What I'm suggesting is a runtime constraint that the clock subsystem
> >> > would enforce, and actively prevent drivers from changing the parent.
> >> > Either explicitly with clk_set_parent() or due to .determine_rate().
> >> >
> >> > That way you could write a .determine_rate() implementation that *ca=
n*
> >> > select a better parent, but if the DT applies a constraint to fix the
> >> > clock to a particular parent, the clock subsystem will force that pa=
rent
> >> > to be used so you can be sure the clock is never reparented by accid=
ent.
> >>
> >> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
> >> too far off from this, it's just ignored by clk_set_parent() for now. I
> >> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
> >> clk_set_parent handle it, and set that flag whenever
> >> assigned-clock-parents is set on a clock.
> >>
> >> It's out of scope for this series though, and I certainly don't want to
> >> deal with all the regressions it might create :)
> >>
> >
> > This sounds like a new dt binding that says the assigned parent should
> > never change. It sounds sort of like gpio hogs. A clock-hogs binding?
>=20
> Ideally we want the clock driver to be able to reparent clocks freely
> to get the best rate. But we also need some control over that to stop
> consumers from being reparented in undesired ways. Eg. you might want
> to make sure the GPU gets its own PLL so it can be reclocked easily,
> and putting another device on the GPU's PLL could prevent that.
>=20
> The only way to achieve this today is (1) never do any reparenting in
> the clock driver; and (2) use assigned-clock-parents in the DT to set
> up the entire clock tree manually.
>=20
> Maxime said that (2) is basically wrong -- if assigned-clock-parents
> provides no guarantee on what the OS does "after boot" then the OS is
> pretty much free to ignore it.

I didn't really say it's wrong, just that it never provided the
guarantee you expect it to provide. I can't really say whether it's an
issue or not on your platform.

It's mostly unrelated to this series though, none of these patches
affect that behavior in one way or the other.

> My suggestion: add a per-clock bitmap to keep track of which parents
> are allowed. Any operation that would select a parent clock not on the
> whitelist should fail. Automatic reparenting should only select from
> clocks on the whitelist. And we need new DT bindings for controlling
> the whitelist, for example:
>=20
>     clock-parents-0 =3D <&clk1>, <&pll_c>;
>     clock-parents-1 =3D <&clk2>, <&pll_a>, <&pll_b>;
>=20
> This means that clk1 can only have pll_c as a parent, while clk2 can
> have pll_a or pll_b as parents. By default every clock will be able
> to use any parent, so a list is only needed if the machine needs a
> more restrictive policy.
>=20
> assigned-clock-parents should disable automatic reparenting, but allow
> explicit clk_set_parent(). This will allow clock drivers to start doing
> reparenting without breaking old DTs.

I'm generally not a fan of putting all these policies in the device
tree. Do you have an example where it wouldn't be possible to do exactly
this from the driver itself?

Maxime

--ygvujwxxgbycerm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZB2HXwAKCRDj7w1vZxhR
xSbnAQCJvmVlpJgunPtELVTvf4BU6vbdciJ5jecqJV2UslBqNAEA3GtvUaTD5e0p
e0nSvm2EbCQGLtQFj+xVrIWIaKTMYAc=
=GgBk
-----END PGP SIGNATURE-----

--ygvujwxxgbycerm7--

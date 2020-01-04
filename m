Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60A13015C
	for <lists+linux-clk@lfdr.de>; Sat,  4 Jan 2020 09:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgADISE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 4 Jan 2020 03:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:58010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgADISE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 4 Jan 2020 03:18:04 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C03C6215A4;
        Sat,  4 Jan 2020 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578125883;
        bh=3v1uQmK5HG72Gf2Ti7z8J9WdSlBnHXdgemY9IhzLgbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pdXAJ86sEhD8Z61nftIVnbw9hKy+4afQxtvj/ToyFNhpKg4/Dus/HqUirv9lYVi9v
         pewNARcB+f18V2ScXvqO5NAlTb21TWASQH6aZ5QLCFWUDgyiEx7Y7mI3TzFxLIUqWf
         0whRyjh70IeddRUGJc0a63btGKrzye+xcdRM1Gg4=
Date:   Sat, 4 Jan 2020 09:18:00 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Vasily Khoruzhick <vasilykh@arista.com>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU
 clock
Message-ID: <20200104081800.fxgtfsabue4kpmla@gilmour.lan>
References: <20200104063505.219030-1-anarsoul@gmail.com>
 <20200104063505.219030-2-anarsoul@gmail.com>
 <CA+E=qVcS+bWNx6Sneg-JG4-NHQZ8e-ztszsPu8N2d8HawyDYqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5jczm743ulhu5rm2"
Content-Disposition: inline
In-Reply-To: <CA+E=qVcS+bWNx6Sneg-JG4-NHQZ8e-ztszsPu8N2d8HawyDYqg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--5jczm743ulhu5rm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 03, 2020 at 10:42:35PM -0800, Vasily Khoruzhick wrote:
> On Fri, Jan 3, 2020 at 10:35 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> >
> > From: Icenowy Zheng <icenowy@aosc.io>
> >
> > The A64 PLL_CPU clock has the same instability if some factor changed
> > without the PLL gated like other SoCs with sun6i-style CCU, e.g. A33,
> > H3.
> >
> > Add the mux and pll notifiers for A64 CPU clock to workaround the
> > problem.
> >
> > Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>
>
> Ugh, didn't notice that email is wrong here, this patch is not related
> to my daytime job. Maxime, if patchset is OK please fix it up to be
> "Vasily Khoruzhick <anarsoul@gmail.com>", otherwise I'll resend v2
> with correct sign off.

Applied with your mail fixed, thanks!
Maxime

--5jczm743ulhu5rm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhBKOAAKCRDj7w1vZxhR
xS1RAP9GhsTqDno3/XcGN9WvkXqmWkis4l6lPHyEMVp48+B2HwD/ax89DckQzx3i
GMiJDEgE+teEa5Iv11Jo/k52rR3kKQg=
=FJWf
-----END PGP SIGNATURE-----

--5jczm743ulhu5rm2--

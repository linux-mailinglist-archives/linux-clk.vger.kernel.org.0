Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58298145421
	for <lists+linux-clk@lfdr.de>; Wed, 22 Jan 2020 12:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgAVL6h (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Jan 2020 06:58:37 -0500
Received: from foss.arm.com ([217.140.110.172]:55580 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgAVL6h (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Jan 2020 06:58:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1098328;
        Wed, 22 Jan 2020 03:58:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60A133F52E;
        Wed, 22 Jan 2020 03:58:36 -0800 (PST)
Date:   Wed, 22 Jan 2020 11:58:34 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200122115834.GA3833@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <20200121083658.GH15507@dell>
 <20200121161512.GC4656@sirena.org.uk>
 <4d79e93ab4bd92d5a25a961350efe8ad821a11e9.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <4d79e93ab4bd92d5a25a961350efe8ad821a11e9.camel@fi.rohmeurope.com>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 06:28:35AM +0000, Vaittinen, Matti wrote:

> And now when I am talking about this - I still need Mark's ack for the
> DT binding conversion patch (the BD718x7 PMIC bindings, not this
> series=20
> https://lore.kernel.org/lkml/20200115062921.GA9944@localhost.localdomain/
> ) - which I resent last week just for attention - but I guess patch
> naming is failing there too.

There's probably a bit of that as well but I think what happened the
last time you sent stuff was that it was sent at the same time as this
series and unless you're reading the subject lines carefully it looked
like fragments of old versions of that series or something.

> Mark, do you have any email hook for Cc: tag in patches? Should I use
> it for patches which I hope you to check? (I just learned the Cc: tag
> recently). Maybe that could help?

No, I don't have that and people just CC me on random stuff so I'm not
sure it'd help.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4oOOcACgkQJNaLcl1U
h9Dj9wf9GnNpPHC3KtvF28plS0yJlR9gD6Yp7+bN+gO44g+VsTL9DHL/4mCEQ8Pc
yVT3tEUzgkpULU+ZE8VKaXaP4jHQGcNNlQbG8OKmY317061b1Sd48gdCSHn/Xu9A
PS9pXZVjmaGk6kQCIhKIWKGC65F74XLUsLUXKu2gzEdL5GroizsDDKD2N4a2iY+s
NPCspiLu4RmVvULNCj5qjBt9uJue90oiHRHMWr/vllRV1MkqGwD63/lqL+pWKj6m
DIA8Ux0SQMT8pVUUGkcETLwH6tQW4BCeJKF4g1xXYyKxtF7QKR3n7WXAwk6CeY69
ZXOpmZwN9bFbqDklFh0IrdNXsLT1xQ==
=cNqW
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

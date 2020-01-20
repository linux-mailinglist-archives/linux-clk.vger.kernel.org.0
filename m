Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51EF4142C97
	for <lists+linux-clk@lfdr.de>; Mon, 20 Jan 2020 14:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgATNyt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Jan 2020 08:54:49 -0500
Received: from foss.arm.com ([217.140.110.172]:60660 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbgATNyt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Jan 2020 08:54:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5E6830E;
        Mon, 20 Jan 2020 05:54:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 536CF3F52E;
        Mon, 20 Jan 2020 05:54:48 -0800 (PST)
Date:   Mon, 20 Jan 2020 13:54:46 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200120135446.GD6852@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline
In-Reply-To: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 03:40:20PM +0200, Matti Vaittinen wrote:
> Patch series introducing support for ROHM BD71828 PMIC
>=20
> ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
> regulators can be controlled individually via I2C. Bucks 1,2,6 and
> 7 can also be assigned to a "regulator group" controlled by run-levels.

This is the *third* version of this you've sent today alone.  Please
stop sending me this series until the MFD has been merged, perhaps just
drop the subsystem patches while you resolve whatever the problems are
that remain with the MFD?  I'm pretty much just deleting these patches
without even looking at them at this point, it's a large series, it's
getting huge numbers of resends and I don't think any version I've had a
chance to look at before it got resent had a change in the one regulator
patch that'd cause me to have to re-review it.

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4lsSYACgkQJNaLcl1U
h9C+wgf+LciAE6WpRZc1g3Rk1ALznqY3sYHk5BtOyI/iVU/oEBaxagbeVcHBA1AS
W462fEnLD1UVT+y4M72Cj5d/WJJ09kRTs8elSkeMuRlcmozxDCrxWckGfVhqXKTc
EoMht/jk0W/ZjOwYBJpcIGdvOiDJg6WM28CiUnLA6vx+MFY+jJSmckeBa1KC4tLi
FTVeOPpRzwR8q7lX/h/nXYJ1ZoZ8Kj/0t8yhX4VEnpf879PnJHPmYR/R0UgQ7coE
VghymzBTnW3g1OsDzkMO2X4l2i+Mc8TC4bDctJACw9npjC+a1yLmBkr3ov74/iSD
kexzod9M2psfDi06xSSBa9asJ/3+cQ==
=we5V
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--

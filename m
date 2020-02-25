Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9CB316EB2E
	for <lists+linux-clk@lfdr.de>; Tue, 25 Feb 2020 17:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgBYQTt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Feb 2020 11:19:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:49834 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729817AbgBYQTt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Feb 2020 11:19:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2B9B3ABD7;
        Tue, 25 Feb 2020 16:19:47 +0000 (UTC)
Message-ID: <18ff8ba02028d6b299e450eed6a9a374fa4adda8.camel@suse.de>
Subject: Re: [PATCH 14/89] clk: bcm: rpi: Make sure the clkdev lookup is
 removed
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Cc:     Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org
Date:   Tue, 25 Feb 2020 17:19:45 +0100
In-Reply-To: <1779dd1489125be571fb3c2ee3e04c32f9875420.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
         <1779dd1489125be571fb3c2ee3e04c32f9875420.1582533919.git-series.maxime@cerno.tech>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-hMIQmfGcVIyBQCc/oHBm"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--=-hMIQmfGcVIyBQCc/oHBm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> The clkdev lookup created for the cpufreq device is never removed if
> there's an issue later in probe or at module removal time.
>=20
> Let's convert to the managed variant of the clk_hw_register_clkdev functi=
on
> to make sure it happens.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-hMIQmfGcVIyBQCc/oHBm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5VSSEACgkQlfZmHno8
x/7VmQgAmYGPf8jpPjktSqZ2UXKC/Wen7oa7/UnmKQxF8fVy94130kl/8DXSL3uE
FuQjC4vVQjHJG6wLR5mRiZRb340mXcTY37UI41QZoOIdHucCaCE3B1/pKPCpvlah
m/ql1Cfi+E57jyUVIWcjZxIqn1vomGlOD9X3Brjs4ikCOy0qVx/qoVaBWGFtV9/h
STUgXbIwX8vgp6TzB97vABc6ZtsYbwRX+BA+mAS5CrZv4/TC+DD2QkYG9p2t+pjQ
6r/mWIUTyOVya/v6h5q0VgjEMp3Kux8hZsJCL+Tfwx2nTcgJfKRAMZgHXV8n8eFn
Z+nLK/AgUGgaisN18b7dPeb1g5P6Dw==
=ZqkQ
-----END PGP SIGNATURE-----

--=-hMIQmfGcVIyBQCc/oHBm--


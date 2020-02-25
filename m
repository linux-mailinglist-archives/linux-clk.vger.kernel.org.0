Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D308F16EB0B
	for <lists+linux-clk@lfdr.de>; Tue, 25 Feb 2020 17:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgBYQNh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Feb 2020 11:13:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:47326 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbgBYQNg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Feb 2020 11:13:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AB537ACB8;
        Tue, 25 Feb 2020 16:13:34 +0000 (UTC)
Message-ID: <52aebb76952df530f93e9de539124ddf1b825876.camel@suse.de>
Subject: Re: [PATCH 10/89] clk: bcm: rpi: Remove global pllb_arm clock
 pointer
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
Date:   Tue, 25 Feb 2020 17:13:33 +0100
In-Reply-To: <3876f732b3fec2059270678d464d27b7d3a0414b.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
         <3876f732b3fec2059270678d464d27b7d3a0414b.1582533919.git-series.maxime@cerno.tech>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+DV8XHxS6Q5E2RTbz1B1"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--=-+DV8XHxS6Q5E2RTbz1B1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> The pllb_arm clk_hw pointer in the raspberry_clk structure isn't used
> anywhere but in the raspberrypi_register_pllb_arm.
>=20
> Let's remove it, this will make our lives easier in future patches.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-+DV8XHxS6Q5E2RTbz1B1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5VR60ACgkQlfZmHno8
x/6e7wf/XVgbwEEX5ppOPnSG2E91lbuIzKYvYGPjiktH7Nah1qc0u+QdwzPf6KDT
yc3+x2Qc8SJMYKsA67LRGpfmpt4x/BTMobJ9cz5v5wSi3bdRy/BI1ocszZ39NJPW
5gSbcUp9qRpTHFav65qYTmKeB/lq0D9legwP/2BzurnevyEnmCvmRpO2/rHytbqI
xb0zgMky5eME5T45VseWgkO0MsvjYNavumgrMC7fXP6aqsFyugX0mGmgM7Qy0I8z
/b7sC6q/c/52SuxzZv0089XNRCz67N27Kqnxm0qY2JX14QggoxHDpFnHuBUUceK4
qzePwlSt7NB700qR2B7M4kkoiBlWbg==
=wHRd
-----END PGP SIGNATURE-----

--=-+DV8XHxS6Q5E2RTbz1B1--


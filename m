Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7338772A0B
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jul 2019 10:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfGXI0n (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 24 Jul 2019 04:26:43 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49289 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbfGXI0n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Jul 2019 04:26:43 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1F660FF818;
        Wed, 24 Jul 2019 08:26:41 +0000 (UTC)
Date:   Wed, 24 Jul 2019 10:26:40 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: allwinner,sun4i-a10-ccu: Correct path
 in $id
Message-ID: <20190724082640.kbatvyod7fomtjjb@flea>
References: <20190723230843.19922-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k6js6jw2qocctjxy"
Content-Disposition: inline
In-Reply-To: <20190723230843.19922-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--k6js6jw2qocctjxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 05:08:43PM -0600, Rob Herring wrote:
> The path in the schema '$id' value is wrong. Fix it.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I can take this via the DT tree.

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--k6js6jw2qocctjxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTgWQAAKCRDj7w1vZxhR
xU0HAPwM3SDx3ldBvoCozBAZ1NumH/ldcZOZQoJtTthE2ZQvmAEAqfa1zInByXpy
SnIuXS+wwroOPUQduzdYTLxHczD18gE=
=PFP8
-----END PGP SIGNATURE-----

--k6js6jw2qocctjxy--

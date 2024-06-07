Return-Path: <linux-clk+bounces-7879-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFB90065F
	for <lists+linux-clk@lfdr.de>; Fri,  7 Jun 2024 16:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73AA01C22A28
	for <lists+linux-clk@lfdr.de>; Fri,  7 Jun 2024 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AD9197A9D;
	Fri,  7 Jun 2024 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQHpk2ye"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6A1940B5;
	Fri,  7 Jun 2024 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717770211; cv=none; b=fFrOSPlYxmzNTVd2Y+dc6yTZrmJ+5Ttg/y/pw3+HQ6H/GdMJO8EeyLw/dNSnEoDv8XoG2JK+w+XjcPHU6ht0q2mk0jAW3Q3A5RwDWT4lHidR9b/R/AdJMUS0UDWQ9tlzGAbxVLJW1bmkjrzu+Ex31LoSOnR3dgd8NhIVR7AcYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717770211; c=relaxed/simple;
	bh=ISZhaErqzXGSDPIQLgclkeDjexf3+x7GOhhQxdcSvZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibFdtYwvZyKnMvqvrPJBiuJ6yP/OE9mG0zPVnO1OwAdtKcSCiGC6z5jrUI3EJKZ9Rj8jjrMofKX/tsQ5r4NxXlZnEZgELkgHx/L5Hha029gtOsVI1pnruicFe6qAP49+dYjBkpWbHad+eceSeW7UvJ0U6Zqtf3Z0BZkEO1NgNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQHpk2ye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B01EC4AF07;
	Fri,  7 Jun 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717770211;
	bh=ISZhaErqzXGSDPIQLgclkeDjexf3+x7GOhhQxdcSvZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQHpk2yenbmSJVf+xC5mxgAibeTuocZmLaqi+6teZQSCOr7uEs1N0HDXbc3daQWYm
	 Vo3e0nftuS17WPYWNxtY1goc9Ap4lqIQ8ngIUlma/43FV/n+e89s5+xdyZzzu8JSnx
	 obKV/VNZXi3gWOOuT79Bm9RG9irlZ0SsaExzsiI6ZIUAhlFoiXv0xQHWc8WLARiEbH
	 AsFrTpwciW9PYaeTRTIiJ1UdennYmJXZ9j7jPde4GU46lHcOzpsx87ONUaQJCqT4Kl
	 Cyg3rBOZVpCBLZMJOwB0WdZpOYpz3g0eYX0FE3B66mDDjSXXDMGIHUFduzLsnTAM3T
	 rXuNfOmA6Zjzg==
Date: Fri, 7 Jun 2024 15:23:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33
 bindings
Message-ID: <20240607-gag-radiantly-37bc3ac76907@spud>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hvIN4zzpl43t4aeA"
Content-Disposition: inline
In-Reply-To: <20240607110227.49848-2-ryan@testtoast.com>


--hvIN4zzpl43t4aeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 10:59:57PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>=20
> Add display engine bus, clock and mixer bindings for the DE33.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml        | 1 +
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..65f4522e79879 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-de2
>        - items:
>            - const: allwinner,sun50i-h6-de3
> +          - const: allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2

This does not do what you think it does!
It needs to be
items:
  - enum:
      - h6
      - h616
  - const: a64

> =20
>    reg:
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t=
-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83=
t-de2-clk.yaml
> index 70369bd633e40..7fcd55d468d49 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
> +      - const: allwinner,sun50i-h616-de33-clk

I think this is not right, as a corresponding driver change is missing.
Either you're missing a clock driver patch or you didn't test your dts.
Given the bus binding, I suspect that latter.

>        - items:
>            - const: allwinner,sun8i-r40-de2-clk
>            - const: allwinner,sun8i-h3-de2-clk
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a8=
3t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun=
8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0

Your commit message should mention why a fallback is not suitable here.

Thanks,
Conor.

--hvIN4zzpl43t4aeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmMX3QAKCRB4tDGHoIJi
0jvaAQCS4w+ejgohzk9HZfC+mevGnd9ZrQLeHGv0X+xpA4ajowD/c4hDLZx9DGwS
aNy6loBF77ZiI11DguS/w5aI1g56ig4=
=xUMf
-----END PGP SIGNATURE-----

--hvIN4zzpl43t4aeA--


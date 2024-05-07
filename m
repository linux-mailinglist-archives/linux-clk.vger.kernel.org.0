Return-Path: <linux-clk+bounces-6793-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871938BEA1C
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 19:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47E6FB3021A
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 16:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9165200A9;
	Tue,  7 May 2024 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO7XZgIz"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1917BA1;
	Tue,  7 May 2024 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715100749; cv=none; b=e24ROZ/8HJA1UbfuJ7oeiUy4Q/tcCGl0zssQ7TiPfVjxhugfRDYGVKwuKnrxl4o4KTjIe81Vyk16Z6y7C0re5F5pM1PN4xwfvkmCcgDY98EjNVVXJPm7jepb9B/Uh9wfbmZNcJHdIgIoeLGSuuAiux5E+kitrXB5L81gdirvVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715100749; c=relaxed/simple;
	bh=EBegyrKIs9IsYSSriyOSaPz8FbhxduoJLnhVxNryoTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCiGtFutRZnSAqjINyQaGwrvfj1CzSIb75g4+cnQ7AjTLwsDk65cALCClFODD70ghQ/Rfzy1dRvOii5OdLhXaVdvXPxN+Y7OegKQBfFIIvixkygXSqBs7vsk/wplT6MXgxwUfqPaeQ8z7oNpp1+cOvcocuzWhLV3hsOwoxq0XqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO7XZgIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EF0C2BBFC;
	Tue,  7 May 2024 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715100749;
	bh=EBegyrKIs9IsYSSriyOSaPz8FbhxduoJLnhVxNryoTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XO7XZgIzvemyxCi2RURGMKL6uGpqeJtc/aJvHHs2u9K20CkJcikHjNrg/ok2fO8Le
	 8aVtSyMBrnRfjPxx7X3xsZr+EITGhnVcZbF+xUmpnRfGOEEcNvE/ucs2WDEElZ7VSL
	 2k8XXthmphV5XhVO/hY9P9GGrwU/sT/Os0219QiCGySo7Dmn8nt17SKNRyvedI8ilt
	 0I+r/gXx8mDSfO0u0DnLdXlluPJHmGQh/5M82UaiPX0Og6fneW3kz2ZqUBYAeQwYGE
	 Cpbvu+H9cjjlv4sSOwZhYJEBvBOGQgsiik/YSOHYGD65Sl7HUfi/UoRDp4u6gPyyL7
	 mF9IpH/v2OE/g==
Date: Tue, 7 May 2024 17:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: rockchip,dw-mipi-dsi: Document
 RK3128 DSI
Message-ID: <20240507-buddhism-revivable-3cb51e6dbe96@spud>
References: <20240506194343.282119-1-knaerzche@gmail.com>
 <20240506194343.282119-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ggiKIBO6YyUKyAXI"
Content-Disposition: inline
In-Reply-To: <20240506194343.282119-2-knaerzche@gmail.com>


--ggiKIBO6YyUKyAXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 09:43:36PM +0200, Alex Bee wrote:
> Document the MIPI DSI controller for Rockchip RK3128. The integration is
> similar to PX30 so it's bindings-constraints can be re-used.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--ggiKIBO6YyUKyAXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpcRwAKCRB4tDGHoIJi
0lM7AQCvbplIJz/h1RX6+gLccUZy7DZiRifU7S/pEFYX0WnQqwD7BNLAxWiT95Tt
FkeFbO2gnRBBmZX4oS2RXJeiz1OEtgo=
=r4ma
-----END PGP SIGNATURE-----

--ggiKIBO6YyUKyAXI--


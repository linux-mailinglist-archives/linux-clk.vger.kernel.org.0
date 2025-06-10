Return-Path: <linux-clk+bounces-22764-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7BAD3D4F
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 17:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63A31BA333C
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AA243369;
	Tue, 10 Jun 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpJYthXt"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BCA23A9AE;
	Tue, 10 Jun 2025 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569084; cv=none; b=lYTyYawFOecvxSP19wPTA81ZxLpniB2UI7AtyeURo6xjkKut1qQ+L4HMCzhHGNM4R027FTfJISlSPUyYSqwCd0YrPDnl83qoMKbBFahcfbs0rcibL5NU5kPxrS3bvoFmSo/g+lVIVcPcmxz42+wGIDOPuU5BWjdpUAXATuW2Lkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569084; c=relaxed/simple;
	bh=LTaUdWa9/Ws1bfWS3f2J0x9VpEljc2bZmkr9lvYn3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0y3PkqAGdBJcY/IUarBvOSE/1hlOpyvVNk9KhFPSM58q9STKmwEdTsRglxvL9R8cvWkIo3aGtU1qVvBryvGltvjmraqGc8VMNL7FcuWVddb+odm2zxrBSf0mebpnrrDU5DJ0/jiQ73how2APeG/b0+QttSR9qll6onT3GgQEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpJYthXt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311B0C4CEED;
	Tue, 10 Jun 2025 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569082;
	bh=LTaUdWa9/Ws1bfWS3f2J0x9VpEljc2bZmkr9lvYn3qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpJYthXtVG9kvBG5B9lObJbk+ddZzH4DDhKTM1YLN5DfbzpWPJ7t1Cbj6HRnhBuqA
	 b+JD4y3kpb/cB3+g+AdJeQV59d5osCNBI47a0sgtCdqib16JsrF844E0+/Szd6K0Vj
	 mFt7aHSVdrP+C/xDOixe6qydqpFGMYaRtStS+WN51HQlrkHg9Uz10pduObBgOZk6mf
	 tQldXviqXpuXk9Eb54GPL+pgbAbyohYs8XPAslhmcl1HffggDiPViXXc9F8WvYZYOU
	 JhpTH2f+6Yq+7wiPGIigy1rv65jXESftV8PidqfDuhcyUPhcwBWfBSLCyaKjLRUnyC
	 WNhA5NkEVMDgg==
Date: Tue, 10 Jun 2025 16:24:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: Add Renesas RZ/N2H (R9A09G087) SoC
Message-ID: <20250610-eats-degrading-06101283cb8a@spud>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kp+zzp+3OSyUTruj"
Content-Disposition: inline
In-Reply-To: <20250609203656.333138-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--Kp+zzp+3OSyUTruj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 09:36:49PM +0100, Prabhakar wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>=20
> Add RZ/N2H (R9A09G087), its variants, and the rzn2h-evk evaluation board
> in documentation.
>=20
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Kp+zzp+3OSyUTruj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhONQAKCRB4tDGHoIJi
0njgAPsG9DbL5Qbyz7w0b9PxKX6dJpbdBOp6idHVjwk+cZzM0gD/cDyhMd7JO1hq
gmYBzeXcxhSD4nOWCatEpk+++S3jJA0=
=NqWq
-----END PGP SIGNATURE-----

--Kp+zzp+3OSyUTruj--


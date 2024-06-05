Return-Path: <linux-clk+bounces-7769-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887E8FD48E
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 19:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 152641F226EC
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 17:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9C6194AFE;
	Wed,  5 Jun 2024 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbrbNbvV"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB913A3E2;
	Wed,  5 Jun 2024 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610322; cv=none; b=X4UbcOMPuuTxO/8JvN/4Q0mkK6Iwfya51KmGZZcf2bEo89itURz29oE6abHk+J5KtQZ/QMQsrKVQ6+ctf0OE4k7YpuVwq82iPebKm4cpwJGlQa89S7CSPFCsaHzVq594/YnLqzVsaDFpQLyHrh8MsyYdqFIDHjJ9snSul3Hr/cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610322; c=relaxed/simple;
	bh=keC2lawUTxN8qMiU8ZtJ51LD9NWntFOVEDK230C1enw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tejaiYU7+Z2QRyJAurlzLBXgKcHE0Hxo9QWP4+ts8hZt1KwzKlD4xzq6+K0jJfCS6xNFJVbBG5mlz1ekfNlZIWUi9usd4mhKd1scVuLJjncAcCODg7F3CdNpKpYHPHXwVtV8aKtq/2u6ZwmLV53i7ddKXmLtgMNKD0D56mxh6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbrbNbvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC1AC3277B;
	Wed,  5 Jun 2024 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610321;
	bh=keC2lawUTxN8qMiU8ZtJ51LD9NWntFOVEDK230C1enw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbrbNbvVXXHECGmADFNhod5fCtSnM3hZbObZkGlAUAMme9xOr+GVYecofVQbYoNpD
	 yVulcscXlrwMMzDU7nZ3GxYLccMV8a1mBDWxIKUn5LrM473WLjZKsKIqjLCicclKSp
	 WDTSs/lMxJ2geKR2jypoFPmcpzOTeESq7vhNk67XwZN6nh/DO+bmBASEJ+FjelxHXe
	 tV/m/HlaGFyRBA759uuceU+IvGbtEE7FUz5L7o7kiRuveNer3cNRp3eIy4AAhmHk9X
	 j0DHTL3unoKePbHwEcWnKjysQAOzs5Q/QA12yd1ibEOY5HBjwdgJKOtKCLkfSksA5E
	 +rgJZ/l49U4Gw==
Date: Wed, 5 Jun 2024 18:58:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: rk3128: Add HCLK_SFC
Message-ID: <20240605-crummy-racoon-fadc5a6f5d25@spud>
References: <20240605172154.193047-1-knaerzche@gmail.com>
 <20240605172154.193047-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jhcpyezfc1K/YZWx"
Content-Disposition: inline
In-Reply-To: <20240605172154.193047-2-knaerzche@gmail.com>


--Jhcpyezfc1K/YZWx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 07:21:52PM +0200, Alex Bee wrote:
> Add a clock id for SFC's AHB clock.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
> NB: I've added the new id at the top of existing HCLK's, since adding it =
at
> the bottom would change CLK_NR_CLKS and therefore the ABI and there is
> plenty of "free" ids between PCLK_MIPIPHY and HCLK_SPDIF.

We've removed a bunch of things like "CLK_NR_CLKS" from bindings before
and advocate against adding them. Patches like this being the reason
why..

--Jhcpyezfc1K/YZWx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCnTQAKCRB4tDGHoIJi
0iXBAQDAyWnbRnsZhrLj+spS8XzSH/DX4oU5zCvnbqJwnIpxsQEAqgE20hAT8Y/L
N1uBiZLsRadqYKCRLFSYPPIccMzAzgE=
=EBT7
-----END PGP SIGNATURE-----

--Jhcpyezfc1K/YZWx--


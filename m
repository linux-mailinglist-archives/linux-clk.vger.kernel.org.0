Return-Path: <linux-clk+bounces-6589-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24578B8ECF
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 19:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9D92814FF
	for <lists+linux-clk@lfdr.de>; Wed,  1 May 2024 17:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982BC18042;
	Wed,  1 May 2024 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdFxNzny"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AE17C9E;
	Wed,  1 May 2024 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714583463; cv=none; b=KmG0Puw/kWj+8wAtbteL8UCcH+5gM7OTs9hzBPtEeOSwiJi6ksJJnIlcmDst3cVi1bWax9fK+mHgWUeIWu+2+x0bNTE+lrmmKE9M60CBIxz1XuC3C6Jix2VCgrMhgf6JE2vGSqY3MqW9U6UtyGPjkNUjlApT5pXDAbEGGpK2H/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714583463; c=relaxed/simple;
	bh=CvimenrnvSpvu9T+qIIZURnkOSrzShtnui5KbQDvcN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYccke+MIS8Gtf1wxvqaboFdoImDyQbqhPlP6snHIyhk+TWljC6eiZl98yeZeRn1KaBKupaPvdgmasxf2Q3uM3YarWnUP75ckxgzUrs5gNcYQHQM1v4hKPTViIq0mGIhf/KkI5/XhX7ROvjc+y4VuZUzu2OMPGa7AuvW7SiKM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdFxNzny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C767C072AA;
	Wed,  1 May 2024 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714583463;
	bh=CvimenrnvSpvu9T+qIIZURnkOSrzShtnui5KbQDvcN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdFxNznyN1YXGbVqu5gY4BCEflNp9o4L0Vk3ITFqp/WQT4PuHet/m/pks6xRLZEq2
	 Bm/hJBGv775FSXzEfTUoDovufAQwV+XTAuQ0Vp98ztE+VsRDXiggfGUZFpY/yLerTy
	 RokQrKIjDvz5OAozU1ymdSXoRyvEWgnZsxzCGOrXgeroKG6vOW/MJM46dFTpKE6N2Y
	 22rwZI5fKHYvbUq33koOuWAH1zHdkBzJYqunqeoQ1myHSvmWfvYW5+TGH29napJK1M
	 t95BS5W4HKkN0FRnDNx2kAKW6RhBAp/PO31z1JCK4Ah//LUOdJc3tvDWdpcySmMKVk
	 pa0wejeFXc29w==
Date: Wed, 1 May 2024 18:10:59 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: fixed: Define a preferred node
 name
Message-ID: <20240501-chug-patronage-b5122063b8df@spud>
References: <20240430180415.657067-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U2+tXBPqARrp5IaL"
Content-Disposition: inline
In-Reply-To: <20240430180415.657067-1-robh@kernel.org>


--U2+tXBPqARrp5IaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> Define "clock-<freq>" as the preferred node name for fixed-clock and
> fixed-factor-clock where <freq> is the output frequency of the clock.
> There isn't much of an existing pattern for names of these nodes. The
> most frequent patterns are a prefix or suffix of "clk", but there's a
> bunch that don't follow any sort of pattern. We could use
> "clock-controller-.*", but these nodes aren't really a controller in any
> way. So let's at least align with part of that and use 'clock-'.
>=20
> For now this only serves as documentation as the schema still allows
> anything to avoid lots of additional warnings for something low priority
> to fix. Once a "no deprecated" mode is added to the tools, warnings can
> be enabled selectively.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--U2+tXBPqARrp5IaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjJ3owAKCRB4tDGHoIJi
0p9TAQDgyb5yg4qV+pkQZ0Sc7IX/CryZGstKB8vF/WQ5JyQCjQEA/IAOPdegxbz1
SgYJ+rbhILiikt+AvHkSD4XzjcP5Sw0=
=jFhx
-----END PGP SIGNATURE-----

--U2+tXBPqARrp5IaL--


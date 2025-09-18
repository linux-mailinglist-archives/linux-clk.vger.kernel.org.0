Return-Path: <linux-clk+bounces-26353-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70329B2C67B
	for <lists+linux-clk@lfdr.de>; Tue, 19 Aug 2025 16:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA651BA70D6
	for <lists+linux-clk@lfdr.de>; Tue, 19 Aug 2025 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959AC1A2547;
	Tue, 19 Aug 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NS8zusma"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C910154BE2;
	Tue, 19 Aug 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612033; cv=none; b=u5M+aECL5b2VCCQsaFY9QSEgn0lFcM4vFinizk1HjH8KW3l4nNfksGiLsiBr84zMn7/86PQGBijWy+sTR1FW6nGBxfsiJnJA25xcrO/rOfpGH5MJnND4jjIKU1QvEQxEmSCxmH7uw7gOrGinL6K68i95+8DuXNhaG8mMfJNNuHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612033; c=relaxed/simple;
	bh=ZMTlEVIlOoJCADD4AmnS/MMMiFgjo+AQaxivAFX55Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XK2cVroRLKJ1jJrUkim8rnSLLr3QmUrUv74Z2OXk6hFAgvYTBMyMeVMp+4FlMH9UoHHBxfN0mRDpJAD5wsuMv2+9ychY6yYdKyPU31dPVz2xs+prmIMZyHrrKFXaORkJ/D8I/zjdtQVtPgKZ4ByddQBokOwWAM9esB/Qi9Eb874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NS8zusma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643FFC113CF;
	Tue, 19 Aug 2025 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755612032;
	bh=ZMTlEVIlOoJCADD4AmnS/MMMiFgjo+AQaxivAFX55Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NS8zusmak1/Elfy0IE5ys6wYeu46SjomHyanHJUmZUmWXqP6th9z9kMfK8D6mbxls
	 /6lKvCItrTfrcZEUzogCH9vtfXlUDRVCpz4W86ComeP/taiOyyQzr/u1hDc+0yQwNm
	 0WB2u0xnQARoFMP3L7veyPyYtu5eHrq1ryQZWQma20mhXYcZwNZAvn7n0mrmn1kbdF
	 ug3octs89H+EJqdSll+XVZiQRa2bW9tMeCkiw1gGRKNYhy+AKHf4CYsIveru09j/2g
	 POrB9u+WeHl/01D6aAg1eMYyXGYz7skXTB+fhfwaGCgAIFZxtl2a2IAq8PWPjTEEuj
	 zLpEmwAHqzFiQ==
Date: Tue, 19 Aug 2025 16:00:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] clk: test: introduce clk_dummy_rate_mhz()
Message-ID: <f62aql76feibrznlau4xfppxci3atmxhfl5tyrattogt5ly23p@7f2gm6wykogx>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
 <20250812-clk-tests-docs-v3-2-054aed58dcd3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2vs3of32h3mhs7ud"
Content-Disposition: inline
In-Reply-To: <20250812-clk-tests-docs-v3-2-054aed58dcd3@redhat.com>


--2vs3of32h3mhs7ud
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/9] clk: test: introduce clk_dummy_rate_mhz()
MIME-Version: 1.0

On Tue, Aug 12, 2025 at 10:40:32AM -0400, Brian Masney wrote:
> Some of the mock tests care about the relationship between two
> different rates to ensure that functionality in the clk core is
> exercised when the parent rate is negotiated by using specific
> rates. Introduce clk_dummy_rate_mhz() to improve readability.
> Change the DUMMY_CLOCK_* rate constants over to use this.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb28ec1f029f828c31107f8e130556..fafa736ca32144a2feae75a8d=
641abca3162d42d 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -21,9 +21,10 @@
> =20
>  static const struct clk_ops empty_clk_ops =3D { };
> =20
> -#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
> -#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
> -#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
> +#define clk_dummy_rate_mhz(rate)	((rate) * 1000 * 1000)

Macros are typically defined with uppercase names. Also, you can use
HZ_PER_MHZ.

Maxime

--2vs3of32h3mhs7ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKSDfQAKCRAnX84Zoj2+
djlpAYCgdJeLnsSwzLbso3TS1UjExhFm/KIE9c05ve/udc/krxfTNwp7pdrPzjGd
Z8HiUDEBf0Sb+vitIOfaanrEtSrg/187G/XkYLfrVGpNW0s3/AKn9vvOXDc5Kg5y
NLGF4YNrKQ==
=rVQm
-----END PGP SIGNATURE-----

--2vs3of32h3mhs7ud--


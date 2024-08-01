Return-Path: <linux-clk+bounces-10293-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFC94515F
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 19:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D626287A5C
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 17:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884541B4C25;
	Thu,  1 Aug 2024 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="16oJAglR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94A1EB4B1
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722532692; cv=none; b=Je4vGG1oXr9aewBkfRQIOQROp2s5UIm8YXrarkU/7jMAXF26K1CRlCYXVPxWuyqwNthGYEAlw2yGKzh3h3sjXoOftNlawK8vUgberxnb2rtjFyIq6PbAIjBxG0OdkNv/E7ZiQY18s/W6IgOm38SbkcSWFoj5UvTmL33wQ2bf4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722532692; c=relaxed/simple;
	bh=D1l8fJ9IOVEp5bp3M5j/xHgBRyhU68qfJLkpQlB4M2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jipWHzAHmRVeRdjhvKmTHMfQnADb16G3WaQ2wdaDNDDhXTYBuS2BdqxQo2BRRphxIk+1dVC+/R9RAiZRJaQq0PQMSAD//PKjhHO4vOOlXZVX4uLhi4dLaml8N1H4uJIYDJBqI0DbrqINyrJZhKpfQWbCYHIwTUZGFMoutBLcJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=16oJAglR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so924440466b.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722532687; x=1723137487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ACC4xtbalx3W9rURwHmsxKvcHM8GOzus11mFMGYdOPw=;
        b=16oJAglRUMxTramndWgm1VuhFlhrwiJPYickoLuvEHWel5FFnTznLAmKOhNTuTGgvt
         HEbbPsSiH5Pr76uXah8i4PDG42M3DvOVSbTZPbm+cuIA0AGwh2PjoIWh69tOhlWKKmvg
         ltG/oxuwQrKirFhoByAttJ6CsGK481TqfS+ZDu+FFjBAyOjItmIwohcCVPnl/IDVWA6D
         wm2BhT4tPaGD6Vg7f8vm6P/QZ9TCzo75cfBUVEFHOUrT+lB98sh/fYjFB7GkGP9ddTbo
         JdyWkuCLNe5ZJ1ncT73mvxa6WrHr/sUVKnYpK6t3iK7DMCgEKnCh3ZjA6Gnzph3Q3a+j
         QeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722532687; x=1723137487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACC4xtbalx3W9rURwHmsxKvcHM8GOzus11mFMGYdOPw=;
        b=RH2JsUeKK2VLrRZDPQ6sRSFS8tQqk9SX8ypsm8l8BztgO8DQP7ltVdsrJgyVxuburr
         YaedMtZuixBSmjMNh6zCWGum0y66I9C0LCmy5yowQyOOC1zT5QwzF+M26aErmtbpWXKp
         P2BojamwB8DIAspTcpfjQaQlA4HZk+KLJodrlcWusKBf17Rl1rg0VvnlsjHd0PXz0a8U
         dUSc2vIw6VU6iuB6GzihLpDn42ew5TjnYeqP3iAtpMWo6v6XOrSGS/xiebHcxyqgwJcY
         FsASFSH4CNtnvDhyma2LLcgKTkdls+tNSouHA779uUg11bFY9+5l/TtKyCZRu6Wx0toF
         Go8g==
X-Forwarded-Encrypted: i=1; AJvYcCWH3orJQeRo4wooy0i2+a0BHuQH5eBZO14TwMqXkAowrV3Pes9sppBGJ3M3zKhCnJ2cffs95IDKNBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwkOR8KBg2tl1/ujJD3Tl05eG2mUykUBSRojgDup0mHuFRIxc
	D+TL7PJt0yxgfDLl/jCZDczvYjmi56aHN0ub32l2KXr9MFLM2O6abHzsxU0zKP4=
X-Google-Smtp-Source: AGHT+IHPKrrCLi1scWRo4nF31r+dCA7OhuJHW3QejJLrMZGNWRmU29yH/LPM81ati1AALihdZLT14Q==
X-Received: by 2002:a17:907:9620:b0:a7d:a25b:31be with SMTP id a640c23a62f3a-a7dc4ffb31dmr83501966b.39.1722532687070;
        Thu, 01 Aug 2024 10:18:07 -0700 (PDT)
Received: from localhost ([193.196.194.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0c526sm3429666b.69.2024.08.01.10.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:18:06 -0700 (PDT)
Date: Thu, 1 Aug 2024 19:18:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, erick.archer@gmx.com, 
	gustavoars@kernel.org, christophe.jaillet@wanadoo.fr, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: hisilicon: Remove unnecessary local variable
Message-ID: <bod2xxpj6xdutfiqq6zykcaxt3xyqor5qxiyi23g7oek3ndgpm@njl5h5ax5y2a>
References: <20240801103616.20430-1-thorsten.blum@toblux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmlcqgozszpb6sg6"
Content-Disposition: inline
In-Reply-To: <20240801103616.20430-1-thorsten.blum@toblux.com>


--mmlcqgozszpb6sg6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Aug 01, 2024 at 12:36:16PM +0200, Thorsten Blum wrote:
> The local u64 variable refdiv_val has the same value as the local u32
> variable val and can be removed. Remove it and use val directly as the
> divisor to also remove the following Coccinelle/coccicheck warning
> reported by do_div.cocci:
>=20
>   WARNING: do_div() does a 64-by-32 division, please consider using div64=
_u64 instead
>=20
> Use the preferred div_u64() function instead of the do_div() macro.
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
> Changes in v2:
> - Use div_u64() instead of do_div() as suggested by Stephen Boyd
> - Link to v1: https://lore.kernel.org/linux-kernel/20240710201844.710365-=
2-thorsten.blum@toblux.com/
> ---
>  drivers/clk/hisilicon/clk-hi3559a.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/=
clk-hi3559a.c
> index c79a94f6d9d2..8646e9d352ed 100644
> --- a/drivers/clk/hisilicon/clk-hi3559a.c
> +++ b/drivers/clk/hisilicon/clk-hi3559a.c
> @@ -407,7 +407,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_h=
w *hw,
>  		unsigned long parent_rate)
>  {
>  	struct hi3559av100_clk_pll *clk =3D to_pll_clk(hw);
> -	u64 frac_val, fbdiv_val, refdiv_val;
> +	u64 frac_val, fbdiv_val;
>  	u32 postdiv1_val, postdiv2_val;
>  	u32 val;
>  	u64 tmp, rate;
> @@ -435,14 +435,13 @@ static unsigned long clk_pll_recalc_rate(struct clk=
_hw *hw,
>  	val =3D readl_relaxed(clk->ctrl_reg2);
>  	val =3D val >> clk->refdiv_shift;
>  	val &=3D ((1 << clk->refdiv_width) - 1);
> -	refdiv_val =3D val;
> =20
>  	/* rate =3D 24000000 * (fbdiv + frac / (1<<24) ) / refdiv  */
>  	rate =3D 0;
>  	tmp =3D 24000000 * fbdiv_val + (24000000 * frac_val) / (1 << 24);
>  	rate +=3D tmp;
> -	do_div(rate, refdiv_val);
> -	do_div(rate, postdiv1_val * postdiv2_val);
> +	rate =3D div_u64(rate, val);
> +	rate =3D div_u64(rate, postdiv1_val * postdiv2_val);

Without looking at the bigger context: Can postdiv1_val * postdiv2_val
overflow? (If this is a problem, fixing it justifies another patch, so
this concern shouldn't stop this patch from being accepted.)

Otherwise looks fine,
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--mmlcqgozszpb6sg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmarw0kACgkQj4D7WH0S
/k7hggf+IaA83JkApvu4vpkYBHZyRNIf+Yv+Wy3lQ94z/Gs0F9BZADcw65BC3iuF
Y3PZ460+MPnCYB6RSb1/H9RxnH1BjZctC1KEhUcaXIWKMuHwLXjJDZpbMnHHgoG2
qUg8oKf3K7cMyePbhehMAhpvtXzZcvZOjKwVj7Lvrf+uu3mqggzvqq3mrssEvtsE
nbWnk8mYFfPa+UPz6kErGt3Rkboi9sDXzdojr5ZN1USPtsu87jbcH0yq56+B5f9G
REGHKDnn6c+H1xQ7mQtL4nQwyePYAZyol1EHkO6VnKW0f1CNrl7gAYmTkFhsGpcq
KpsbmnAtyXyEShNwEf8QB9Fm0qwKAw==
=OnPO
-----END PGP SIGNATURE-----

--mmlcqgozszpb6sg6--


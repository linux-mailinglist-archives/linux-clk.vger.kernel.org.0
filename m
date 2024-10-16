Return-Path: <linux-clk+bounces-13207-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4419A0BED
	for <lists+linux-clk@lfdr.de>; Wed, 16 Oct 2024 15:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3689B1C21B2B
	for <lists+linux-clk@lfdr.de>; Wed, 16 Oct 2024 13:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F341E20C001;
	Wed, 16 Oct 2024 13:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0EIQuVk1"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E1208D6C
	for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086752; cv=none; b=bBt5H2FT+mKcvepjjTfhQtVzy964FumHDYWo7WOWoZ18GHg2Bp6w7kyDiGcXCx2wRudDUtWosDFFJfcT3DoKiFY2mfry/eGgNbEpM28+BNxqObmLI1Z42UjfBrSA51kR8kQ6migZY3yElN4CY4vGQbIJkbUFrjLovqoKxZR7v2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086752; c=relaxed/simple;
	bh=VVX/YrughqBZ9ns5PdhCeSOcP7HVYly5xSyjLWSoCXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2fdjhCgqb+BY53/Z1WlWD5AiyQhkgd4P9gLrapjHs59wZ2H7cFHILNcge/LH+gUqVmXbZ7yVVQio6QaYTuV8o8Px3kt5CgvaGY6GBkm1IRSkuaP9oKzUXJqPxlB5A582fAQc2TIy2cNkZu3j90pJf5uE4XwcAnNFyTuetWRFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0EIQuVk1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so4780601a12.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729086749; x=1729691549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4K5n0bY/MNJApsUthAN1NPIj08Soy9GOdy9ssrn3mY=;
        b=0EIQuVk1RYpfv2q6yHbVisFomkrz76v+bd54R0k+TujCLMa4HAWrrugOLo35eq+k7i
         gl3zBhDzNrMu0SyrG+Ved2jIJU8iI0Snon54x6JmGnamzEca4cfsGLXmUKek8ySBMJm/
         ub7/vDTKV2RSs27RZoSzFCpEIWYkEbhtBIyRuFUIF6KbLhKfQqSFLgmKhY4vcQc4BnOX
         0iMZUf5+Vbp5r9dPo4GZMrJYBc7dYBBA5sBoJpFe++QP+GCL9bmqlRE6FpK1p/yd7FIN
         R3RmRVHJtpS51AqROAWD13J7IAhbVby9Z8sJBIsQGdUtCYh9qmsNMlLhGWBgRml5rAWm
         YtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086749; x=1729691549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4K5n0bY/MNJApsUthAN1NPIj08Soy9GOdy9ssrn3mY=;
        b=cp9LQj8mniJXBT8VSla6JjxtemqBMzfqKSzYZj0tWMT2ge8mlvfHDP1H4tA7LZo0RJ
         fxC4i7I4USvoFZGh8ijXxIBR46hjJp8LHIgCdbmTKUXqJGeAZtFvmA65X5CmsqrizMpJ
         hRuzETce4fflUAjTjTYTqeSmBQGzSgj9Zb/hWX6sZopNIogdqFUZeAFCpTTwC/DxSr5e
         Zlv20E0rnG/t199ZFNOTKCPcfbESprEdTM0AJpOsS8Ce5nkOTGNhAJonLPJwGpD+HUqM
         qeBvT5pz5w8u8uii/D1opyUWrP1TSWE3deK0LKA4M8M2sUNbQg+pFO3mS2Jo1vQBwQux
         hKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxzQyLvWQPMphmIQv2f+4kVdKzedfVfrs6EpZkhNVKT1fyevb6NaeXaUYvHKObYd+CvIQ6KhFWWXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWsNhfxHmodSaXzqllgiiu3A63+AAobcJMz91REmRvC5Bdj7Z
	DUQDSUnkSFkjfw+6blggkmA3ai6nmGMPPk3hpdynkg8nQa3WR9O5GGZW6f4dKBA=
X-Google-Smtp-Source: AGHT+IGoNQzV+Bg1qNjVUvhK/C+rlK7lfaTe4z86a7lUttjr0E2+hamRKC5LOMtljrg6bMBomFnMuA==
X-Received: by 2002:a05:6402:42c6:b0:5c9:8d36:e2e7 with SMTP id 4fb4d7f45d1cf-5c98d36e3b1mr5159175a12.33.1729086748713;
        Wed, 16 Oct 2024 06:52:28 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:e416:44e3:8348:4e6f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d7b4a63sm1754723a12.79.2024.10.16.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:52:28 -0700 (PDT)
Date: Wed, 16 Oct 2024 15:52:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
Message-ID: <2ceewj7y4ybqyv4xxnms63zsi3bbw5t6opvjf3z4rorsxlwfq6@jlwzyy4umyif>
References: <20241010132659.81606-1-y.oudjana@protonmail.com>
 <20241010132659.81606-3-y.oudjana@protonmail.com>
 <vn466kmo2uqrf6ap54oat2bipj4lsfri7asnsrptrlthva6j5m@dop6xit2pzjk>
 <ad000fdb-4474-49c4-9357-f23491231b07@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nn67jih5s63rwj76"
Content-Disposition: inline
In-Reply-To: <ad000fdb-4474-49c4-9357-f23491231b07@collabora.com>


--nn67jih5s63rwj76
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
MIME-Version: 1.0

Hello,

On Wed, Oct 16, 2024 at 11:57:12AM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/24 11:28, Uwe Kleine-K=F6nig ha scritto:
> > On Thu, Oct 10, 2024 at 04:26:57PM +0300, Yassine Oudjana wrote:
> > > +static struct platform_driver clk_mt6735_apmixedsys =3D {
> > > +	.probe =3D clk_mt6735_apmixed_probe,
> > > +	.remove_new =3D clk_mt6735_apmixed_remove,
> > > +	.driver =3D {
> > > +		.name =3D "clk-mt6735-apmixedsys",
> > > +		.of_match_table =3D of_match_mt6735_apmixedsys,
> > > +	},
> > > +};
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers. Please just drop "_new".
>=20
> Oh wow, I didn't notice that during my review. Sorry about that.

No problem, I blame noone. You cannot be aware of every change in the
tree.

Best regards
Uwe

--nn67jih5s63rwj76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPxQ8ACgkQj4D7WH0S
/k5qMAgAp6xUYRchPuw1po6lUEMN+JvpwOJDGGuzkdLZRYtB3pAzVFj+6l9LFhDG
ABrboGHLYWfrdSXu1A6GG/6JkqhqPARGgDcggUaN7v5V7c9uQi7xh07FnEObuj08
B/UINBv6DDchFLGMFoyla0einCWSwOS9wYejj2w8OtVKl3C934Eyx2FCHmmyS64a
KNzoeRj8YgFzvOtwyrIshytiX6CwCwDOTNqgVi2KWT60znHiFY2AW4ymZ0Lb/Spv
jIgDU4PMBuATWRqfcqveSiYi68xVmC92QY1ygM7dHGzFMHy3DlYTeSqzYA0JdM3g
5Q2yDUlNkA4pfm5E3QiIgZPPfjbC2g==
=a556
-----END PGP SIGNATURE-----

--nn67jih5s63rwj76--


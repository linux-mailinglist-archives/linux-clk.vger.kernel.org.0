Return-Path: <linux-clk+bounces-6176-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452C8AB5CA
	for <lists+linux-clk@lfdr.de>; Fri, 19 Apr 2024 22:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C592281EF0
	for <lists+linux-clk@lfdr.de>; Fri, 19 Apr 2024 20:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FABB13C3F2;
	Fri, 19 Apr 2024 20:00:37 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263B64F
	for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2024 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713556837; cv=none; b=mw9YfMkli/+RaYkRWoLpjvUCV9pt2L7J5o5N3PsatSpulsArkoXgnhz5goaTMrVvTu3D77G/q3z2exvM2aXB0KKGTXA9pnVv1nUV0NwS6I5XGroPe1Teknp9KzYBzp5Z8u1lSHAlSWjhpvhAbmz69BOS+HgAfb68HTbOCU/1KdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713556837; c=relaxed/simple;
	bh=WARJLbLS+b0RckjFb5ncqqF0QnnCov/ywo2QpuhC1wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzQ1u8a4atGDZaAKzT+ksHx9vCmy2tWSQq8ZLNfWdzBNuW2G7CYWd3AQUhu3/bXulwZRxnqlYWe8mqQdw7nKsqfUfRFL3GXaaeVIBhkKBOQu9+KDKIqJSJEinHIeKBCP8RsRoPITNzNJB1E4NIXpQf8yyARECN1oxxXg8VLdh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxuPE-0006xs-Nr; Fri, 19 Apr 2024 22:00:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxuPD-00DCw7-N9; Fri, 19 Apr 2024 22:00:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxuPD-004N20-21;
	Fri, 19 Apr 2024 22:00:19 +0200
Date: Fri, 19 Apr 2024 22:00:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	kernel@pengutronix.de
Subject: Re: [PATCH] clk: Provide !COMMON_CLK dummy for
 devm_clk_rate_exclusive_get()
Message-ID: <y7i7vwl7h2xop2ifh72vj5brtq7vd7tf72tst7k7r74plguhgn@cqs5fzplfk5i>
References: <202403270305.ydvX9xq1-lkp@intel.com>
 <20240327073310.520950-2-u.kleine-koenig@pengutronix.de>
 <d95554f623f023a2f5499fa2f6f76567.sboyd@kernel.org>
 <xfaf22rf6gnrxpinkciybsyk4dx2bfqgozv6udwymegtcgd26i@jq5be7fm5lhi>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="teeq72q7xrfgagpx"
Content-Disposition: inline
In-Reply-To: <xfaf22rf6gnrxpinkciybsyk4dx2bfqgozv6udwymegtcgd26i@jq5be7fm5lhi>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--teeq72q7xrfgagpx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Fri, Apr 12, 2024 at 10:49:35PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Mar 28, 2024 at 03:35:57PM -0700, Stephen Boyd wrote:
> > Quoting Uwe Kleine-K=F6nig (2024-03-27 00:33:10)
> > > To be able to compile drivers using devm_clk_rate_exclusive_get() also
> > > on platforms without the common clk framework, add a dummy
> > > implementation that does the same as clk_rate_exclusive_get() in that
> > > case (i.e. nothing).
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202403270305.ydvX9xq1-l=
kp@intel.com/
> > > Fixes: b0cde62e4c54 ("clk: Add a devm variant of clk_rate_exclusive_g=
et()")
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> >=20
> > Applied to clk-fixes
>=20
> I assume that means it will be sent to Linus before 6.9? That would be
> great because I want to make use of this function in some drivers and
> the build bots nag about my for-next branch that in some configurations
> this function is missing.

Gentle ping. I'd like to get the patches I intend to send to Linus for
v6.10-rc1 into shape. To have these unmodified in my for-next branch for
some time it would be great to know your plans for the clk-fixes branch.=20
Alternatively: Can I expect the commit not to be changed any more and
pull it into my pwm tree?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--teeq72q7xrfgagpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYizVIACgkQj4D7WH0S
/k6SMwgAqHTm3+DCvXNfaGEaCzF14/5MgijejoWEJ/t2RGjvSkfA6etr71sI/ACJ
Kv8TQ3zgf2DVrE/dyyqCoKU9OrJjADD6TV4S9rQ7gtJ1WJ8kYOEoRSlhzuVcDZQ/
p96q1wUJQuNNnzyzFdCIlcoNAB3JM5KZDZvZFs39FrAOeYJyrqUIheT6OXQzKWJZ
SODUmTfCWU7UkSHkTxNltRCJSG+LNXT0/KAJBA6PRHHjl/yIs1akB+IGbh/1aXgm
wh8W5KbBjwwgkxm3+D2YVScpi+trFTuTvbwhUDVXYat/E9eqOkXaz1Qxf87KaC+Z
B/F8TWsho0WjrDzcgnhNiFav/c2jaw==
=Qor4
-----END PGP SIGNATURE-----

--teeq72q7xrfgagpx--


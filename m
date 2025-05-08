Return-Path: <linux-clk+bounces-21564-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F37AAF664
	for <lists+linux-clk@lfdr.de>; Thu,  8 May 2025 11:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73E246346A
	for <lists+linux-clk@lfdr.de>; Thu,  8 May 2025 09:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB572254861;
	Thu,  8 May 2025 09:11:52 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F90175D53
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695512; cv=none; b=Jp9dvdFaQ5P21Y5Sw77rj6n7OHaN5oWN0phJHwzxGZNi9dfS2ZSCCcI+lvY6Y1ARZE+3CEKfa0ozFkWGrZdkGH/Q7rXXjQ1fkAC2MpriaxF/PxXRgc7QTUTEVamzEC2gTyTum9DoBvNC7QPg3tyRbZVW+sdY537wCjXaloZweI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695512; c=relaxed/simple;
	bh=kSWdw8IVCVEdiiVxcwOCCea5RImdBd+3SVN/TuOIsmo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a3emnxYyp/HYMupjjN5q7OJmHKPhXE9vJM4XCFkyR1nzm0SZSAo4DllUF2FYd3P9VQzvElTHxgro2GX/sUlGhtJX36R6xiIN2ir3A9Yf6eZK+X0Wt/tAM/+4b7pSP8NcoOMLxBNuv0cVS0ztItykmfjRV6JawunfTwnGRpqSEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0001pr-Kw; Thu, 08 May 2025 11:11:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-001hZ8-0z;
	Thu, 08 May 2025 11:11:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0003qM-0i;
	Thu, 08 May 2025 11:11:35 +0200
Message-ID: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:11:35 +0200
In-Reply-To: <20250506210638.2800228-6-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
	 <20250506210638.2800228-6-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> Define these resets so they can be used.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>  drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>  include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
>=20
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index 6b1845e899e5f..bddc83aff23cd 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_da=
ta =3D {
>  	.num		=3D ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
> =20
> +static const struct spacemit_ccu_data k1_ccu_rcpu_data =3D {

The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
the reset driver.

I wonder though, if these units have no clocks, why are they called
CCUs? It doesn't make much sense to me to add their compatibles to the
ccu-k1 driver only to load the reset aux driver. Why not just add a
platform driver next to the aux driver in reset-spacemit.ko for these
three?

> +	.reset_name	=3D "rcpu-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data =3D {
> +	.reset_name	=3D "rcpu2-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_apbc2_data =3D {
> +	.reset_name	=3D "apbc2-reset",
> +};
> +
>  static int spacemit_ccu_register(struct device *dev,
>  				 struct regmap *regmap,
>  				 struct regmap *lock_regmap,
> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[]=
 =3D {
>  		.compatible	=3D "spacemit,k1-syscon-apmu",
>  		.data		=3D &k1_ccu_apmu_data,
>  	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-rcpu",
> +		.data		=3D &k1_ccu_rcpu_data,
> +	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-rcpu2",
> +		.data		=3D &k1_ccu_rcpu2_data,
> +	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-apbc2",
> +		.data		=3D &k1_ccu_apbc2_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
> index 19a34f151b214..27434a1928261 100644
> --- a/drivers/reset/spacemit/k1.c
> +++ b/drivers/reset/spacemit/k1.c
> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apm=
u_reset_data =3D {
>  	.count		=3D ARRAY_SIZE(apmu_resets),
>  };
> =20
> +static const struct ccu_reset_data rcpu_resets[] =3D {
> +	[RESET_RCPU_SSP0]	=3D RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	=3D RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	=3D RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		=3D RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	=3D RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	=3D RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	=3D RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_rcpu_reset_data =3D {
> +	/* No clocks in the RCPU CCU */

This information is not useful in the reset driver.

regards
Philipp


Return-Path: <linux-clk+bounces-15920-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525B9F4B4B
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 13:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601D018873EF
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815CB1F37D7;
	Tue, 17 Dec 2024 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FmfQ0vJl"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231B1F03DE
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734440055; cv=none; b=AWfAFWO5pbVIlK7TUeXKqSNMOahOZ5P2BslWDrgr7ukAdgYkdMrVbw0J3jHLjc/NYH3U4s4I50IiK/y2M/9XqwYr2l9E0yaMkG8s6LieIVzOmJWqTHJU8PeIySskXtg20yXorOe6Exl4AdnHwRKYVOfgtkd9SM1LN/7MW7RiVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734440055; c=relaxed/simple;
	bh=7iMZ6aNwsw79QYn7QgLJveNLyG3HIzWwNMZstEsZBwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSaDWf0hL7ZvRiWQpBm8mS4//YGz/hj4MeflFFliRUK97yKHT/PHkwmBAFdOPFMVY3MhfnZVaqPOL2xo31uG7e+zgIAHEOIFTdaPNrAVLKsfPheX0ObAcY5DFd4+IWMaFdEDVuk5w6IsJazLDGZo6eHAc6EyCF2EOQxhtzZyPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FmfQ0vJl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734440051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qt0hgYUkhdSw9YGOXZDiovx6cGPH476ifAhBNbJmSmk=;
	b=FmfQ0vJlJx8w1Vh3rNAuBUHJ5TmSGyylfZR8oa6SlZoMTQVzZ7B7M/XmWDUeoMH0ee8ut/
	TztGl2DwJIMHBt7mpe0nVz4G+zo/q4r5BpMER/SHz852645sWhiV5ZSl25LP4gitpoIzmd
	S5V09fnowZpnGNb8KzsZrScntdXf44s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-KcsK9e2ONrOfwWrV0V_2vA-1; Tue, 17 Dec 2024 07:54:09 -0500
X-MC-Unique: KcsK9e2ONrOfwWrV0V_2vA-1
X-Mimecast-MFC-AGG-ID: KcsK9e2ONrOfwWrV0V_2vA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436289a570eso42203625e9.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 04:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440048; x=1735044848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt0hgYUkhdSw9YGOXZDiovx6cGPH476ifAhBNbJmSmk=;
        b=VFj6OmESMbrFO2S6h8HPqP9Pkuez7rZsPRoMOvbVGynw6KiQ4gxD3e9sqBzmj1QAt6
         ycZ/+VeoDkIT/Mic4RzxVuWlHu9j43CPPn++xxDfDr9ZjOppWaZz1DoS5So196SHBE7j
         1Y1O1h8P/F9iquzVIG3HAwDcoJMX1tiwJTi3qLFAvQUTqUJItsrcb1+i5egYok15XnaN
         Nz5gukXtQHnuKEFjlM690WNANUcsTNck1lnqexeOmTqQZ3kXJhuq8C5SR0EdPys/Apfb
         f0OiUIoYV85kUCcUjKZugas72K0v5agJa/gTby5XSi5icNHqQx4jksFbgOgR9C1LMsb4
         OtlA==
X-Forwarded-Encrypted: i=1; AJvYcCXG2MtWD7GrY6igBXlmth1R8QAaJF0VnUWI/ikuiTsPx+6VM+Ps6x1eYDJPBxEaBtI1Mr+UBmbTAEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Bv5NvEVu6R5BlAgWs9j34IeLLDKGOmUNNSJ17pbKi2v8y/CA
	VAQF2P7c54j113ERjBcGclcH0Ft5u51EfRmVfi/t2CSlAkQ9Xg62SLN0e7rLHppaMh7UXCFr3h4
	jMA3C1tkhowl34RdMtcrLRFN13s55hmmBFQqDCpB+4ZzglShDFA6z7A0XaQ==
X-Gm-Gg: ASbGnctZrCs2WtY5Fk0kYOCPFUTtZGVUuFvHERwuGE8I7lNdGlrPhWddyozA39rnPsh
	z1BYiyOzeOG19myXjVu74ganal2BYDkB8VtzYE0MEhr9vZcOKFNEsFv6C/6KQaqSHM2L4kACOli
	4XHfd5S9rn0EUX1w2+LDS1O1MQyUHwXDaWRmsxHTazDB9IWnmB+TYovT/4rEdtk+VToJ9wuI5Lv
	04GZqeKHz0IsqD+TTAmImVzZ2eWD3TF
X-Received: by 2002:a05:600c:4fc8:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4362aa509ccmr170719825e9.18.1734440048516;
        Tue, 17 Dec 2024 04:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6/mV7a7l9PdPVcBSF+Q5Iql4bcDZqcKo3PolwhKQi6lByJruRUxTbVUJ9oenuwDgbps3/kQ==
X-Received: by 2002:a05:600c:4fc8:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4362aa509ccmr170719175e9.18.1734440047995;
        Tue, 17 Dec 2024 04:54:07 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706cb9sm175071475e9.27.2024.12.17.04.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:54:07 -0800 (PST)
Date: Tue, 17 Dec 2024 13:54:07 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Ian Ray <ian.ray@ge.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
Message-ID: <20241217-didactic-hedgehog-from-heaven-004c37@houat>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com>
 <87zflrpp8w.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cprkny6syjc7plb7"
Content-Disposition: inline
In-Reply-To: <87zflrpp8w.fsf@bootlin.com>


--cprkny6syjc7plb7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 10:54:55AM +0100, Miquel Raynal wrote:
> Hello Liu,
>=20
> Thanks for the feedback!
>=20
> On 22/11/2024 at 14:01:49 +08, Liu Ying <victor.liu@nxp.com> wrote:
>=20
> > Hi Miquel,
> >
> > On 11/22/2024, Miquel Raynal wrote:
> >> Recent changes in the clock tree have set CLK_SET_RATE_PARENT to the t=
wo
> >> LCDIF pixel clocks. The idea is, instead of using assigned-clock
> >> properties to set upstream PLL rates to high frequencies and hoping th=
at
> >> a single divisor (namely media_disp[12]_pix) will be close enough in
> >> most cases, we should tell the clock core to use the PLL to properly
> >> derive an accurate pixel clock rate in the first place. Here is the
> >> situation.
> >>=20
> >> [Before ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel cl=
ock reconfigure parent rate")]
> >>=20
> >> Before setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, t=
he sequence of events was:
> >> - PLL is assigned to a high rate,
> >> - media_disp[12]_pix is set to approximately freq A by using a single =
divisor,
> >> - media_ldb is set to approximately freq 7*A by using another single d=
ivisor.
> >> =3D> The display was working, but the pixel clock was inaccurate.
> >>=20
> >> [After ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clo=
ck reconfigure parent rate")]
> >>=20
> >> After setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the
> >> sequence of events became:
> >> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
> >>   setting video_pll1 to freq A.
> >> - media_ldb is trying to compute its divisor to set freq 7*A, but the
> >>   upstream PLL is to low, it does not recompute it, so it ends up
> >>   setting a divisor of 1 and being at freq A instead of 7*A.
> >> =3D> The display is sadly no longer working
> >>=20
> >> [After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer cloc=
k reconfigure parent rate"]
> >>=20
> >> This is a commit from Marek, which is, I believe going in the right
> >> direction, so I am including it. Just with this change, the situation =
is
> >> slightly different, but the result is the same:
> >> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
> >>   setting video_pll1 to freq A.
> >> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pl=
l1
> >>   to freq 7*A.
> >>   /!\ This as the side effect of changing media_disp[12]_pix from freq=
 A
> >>   to freq 7*A.
> >
> > Although I'm not of a fan of setting CLK_SET_RATE_PARENT flag to the
> > LDB clock and pixel clocks,
>=20
> I haven't commented much on this. For me, inaccurate pixel clocks mostly
> work fine (if not too inaccurate), but it is true that having very
> powerful PLL like the PLL1443, it is a pity not to use them at their
> highest capabilities. However, I consider "not breaking users" more
> important than having "perfect clock rates".

Whether an inaccurate clock "works" depends on the context. A .5%
deviation will be out of spec for HDMI for example. An inaccurate VBLANK
frequency might also break some use cases.

So that your display still works is not enough to prove it works.

> This series has one unique goal: accepting more accurate frequencies
> *and* not breaking users in the most simplest cases.
>=20
> > would it work if the pixel clock rate is
> > set after the LDB clock rate is set in fsl_ldb_atomic_enable()?
>=20
> The situation would be:
> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>   to freq 7*A.
> - media_disp[12]_pix is set to freq A by using a divisor of 7.
>=20
> So yes, and the explanation of why is there:
> https://elixir.bootlin.com/linux/v6.11.8/source/drivers/clk/clk-divider.c=
#L322
>=20
> > The
> > pixel clock can be got from LDB's remote input LCDIF DT node by
> > calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
> > does. Similar to setting pixel clock rate, I think a chance is that
> > pixel clock enablement can be moved from LCDIF driver to
> > fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.
>=20
> TBH, this sounds like a hack and is no longer required with this series.
>=20
> You are just trying to circumvent the fact that until now, applying a
> rate in an upper clock would unconfigure the downstream rates, and I
> think this is our first real problem.
>=20
> > https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.334=
1908-6-victor.liu@nxp.com/
> >
> > Actually, one sibling patch of the above patch reverts ff06ea04e4cf
> > because I thought "fixed PLL rate" is the only solution, though I'm
> > discussing any alternative solution of "dynamically changeable PLL
> > rate" with Marek in the thread of the sibling patch.
>=20
> I don't think we want fixed PLL rates. Especially if you start using
> external (hot-pluggable) displays with different needs: it just does not
> fly. There is one situation that cannot yet be handled and needs
> manual reparenting: using 3 displays with a non-divisible pixel
> frequency.

Funnily, external interfaces (ie, HDMI, DP) tend to be easier to work
with than panels. HDMI for example works with roughly three frequencies:
148.5MHz, 297MHz and 594MHz. If you set the PLL to 594MHz and the
downstream clock has a basic divider, it works just fine.

> FYI we managed this specific "advanced" case with assigned-clock-parents
> using an audio PLL as hinted by Marek. It mostly works, event though the
> PLL1416 are less precise and offer less accurate pixel clocks.

Note that assigned-clock-parents doesn't provide any guarantee on
whether the parent will change in the future or not. It's strictly
equivalent to calling clk_set_parent in the driver's probe.

> > BTW, as you know the LDB clock rate is 3.5x faster than the pixel
> > clock rate in dual-link LVDS use cases, the lowest PLL rate needs to
> > be explicitly set to 7x faster than the pixel clock rate *before*
> > LDB clock rate is set.  This way, the pixel clock would be derived
> > from the PLL with integer division ratio =3D 7, not the unsupported
> > 3.5.
> >
> > pixel    LDB         PLL
> > A        3.5*A       7*A      --> OK
> > A        3.5*A       3.5*A    --> not OK
>=20
> This series was mostly solving the simpler case, with one display, but I
> agree we should probably also consider the dual case.
>=20
> The situation here is that you require the LDB to be aware of some
> clocks constraints, like the fact that the downstream pixel clocks only
> feature simple dividors which cannot achieve a 3.5 rate. That is all.
>=20
> It is clearly the LDB driver duty to make this feasible. I cannot test
> the dual case so I didn't brought any solution to it in this series, but
> I already had a solution in mind. Please find a patch below, it is very
> simple, and should, in conjunction with this series, fix the dual case
> as well.
>=20
> FYI here is the final clock tree with this trick "manually" enabled. You
> can see video_pll1 is now twice media_ldb, and media ldb is still 7
> times media_disp[12]_pix (video_pll1 is assigned in DT to 1039500000, so
> it has effectively been reconfigured).
>=20
>        video_pll1                            1   1   0   1006600000
>           video_pll1_bypass                  1   1   0   1006600000
>              video_pll1_out                  2   2   0   1006600000
>                 media_ldb                    1   1   0    503300000
>                    media_ldb_root_clk        1   1   0    503300000
>                 media_disp2_pix              1   1   0     71900000
>                    media_disp2_pix_root_clk  1   1   0     71900000
>                 media_disp1_pix              0   0   0     71900000
>                    media_disp1_pix_root_clk  0   0   0     71900000
>=20
> ---8<---
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>=20
>     drm: bridge: ldb: Make sure the upper PLL is compatible with dual out=
put
>    =20
>     The i.MX8 display pipeline has a number of clock constraints, among w=
hich:
>     - The bridge clock must be 7 times faster than the pixel clock in sin=
gle mode
>     - The bridge clock must be 3.5 times faster than the pixel clocks in =
dual mode
>     While a ratio of 7 is easy to build with simple divisors, 3.5 is not
>     achievable. In order to make sure we keep these clock ratios correct =
is
>     to configure the upper clock (usually video_pll1, but that does not
>     matter really) to twice it's usual value. This way, the bridge clock =
is
>     configured to divide the upstream rate by 2, and the pixel clocks are
>     configured to divide the upstream rate by 7, achieving a final 3.5 ra=
tio
>     between the two.
>    =20
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 81ff4e5f52fa..069c960ee56b 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -177,6 +177,17 @@ static void fsl_ldb_atomic_enable(struct drm_bridge =
*bridge,
>         mode =3D &crtc_state->adjusted_mode;
> =20
>         requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clo=
ck);
> +       /*
> +        * Dual cases require a 3.5 rate division on the pixel clocks, wh=
ich
> +        * cannot be achieved with regular single divisors. Instead, doub=
le the
> +        * parent PLL rate in the first place. In order to do that, we fi=
rst
> +        * require twice the target clock rate, which will program the up=
per
> +        * PLL. Then, we ask for the actual targeted rate, which can be a=
chieved
> +        * by dividing by 2 the already configured upper PLL rate, without
> +        * making further changes to it.
> +        */
> +       if (fsl_ldb_is_dual(fsl_ldb))
> +               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);
>         clk_set_rate(fsl_ldb->clk, requested_link_freq);

This has nothing to do in a DRM driver. The clock driver logic needs to han=
dle it.

Maxime

--cprkny6syjc7plb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2F0bgAKCRAnX84Zoj2+
doOhAX99AJVEUh7gaK+uQrKP/Rmo6Mnh5hH5+hjn0gGdK2IqUkD0TwG6+RVjKBoZ
aV81dYQBfjS+MEK+/lit/77rUaexBhW1LYDc0G+Oa3UFbahuJHfv1Qg2vEJcyQAd
y401dukV0Q==
=pd5A
-----END PGP SIGNATURE-----

--cprkny6syjc7plb7--



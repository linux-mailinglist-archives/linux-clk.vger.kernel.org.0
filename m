Return-Path: <linux-clk+bounces-3076-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A718D8413A5
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 20:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48B00B21332
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jan 2024 19:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E308657A8;
	Mon, 29 Jan 2024 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtpYXJ1/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F84CB3D
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706557172; cv=none; b=Gf5NFuFsMV1KKYXr3r6tzlcTidjiB9NZppL98MbCVnh1lbQ617OKe3Z59+3M2pnzC2ewveMNrkZxRaATtrde97MnZpEgOb+3kgxGtqZXhh2IAeR3BwqIoLRFgUPLz2MwFx4U4YrHscYUVZTf6IZ253rAuUcsROHYYT+h6NTa9KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706557172; c=relaxed/simple;
	bh=DdjBawn+WSbP73IbOFM9d1u/5ppo1GsvtgaQyIJe3kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUWknla8y5JwrtxWbJ+mRoAUejAoe57PityjDF9kFqL61fMDFKJOsHXGaXuUY2ltv3mTmuyRz6I36E8zIyzGN8woJCTuF8w4+N32ODOPDEQIf0+CHI4EDaF+lJrFFgBe6wa27S9mbnjW+iGrdIMp3weDvb6voVzjoA0OFGbjrS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtpYXJ1/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-290617c6200so1450029a91.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 11:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706557170; x=1707161970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgJSsvdPN9rhZ08JgxNFLNGNMYP1B2o2EInR2eAPHu4=;
        b=VtpYXJ1/ZRt/yp49dW4z6pUVLe3ZWJKWNLNL0/cMzEf6n/TAU93Url4568BdQGsqf7
         TlIiXAbeXpC6zoeOHdJ+YF3KLlwQ74mldGsv+T6JACo8V4YebiWbCtbP00cOsI2fq2gm
         42qOYFbhqsbPem5S8OU6SAiWdoGe/afuHtXaSbcU42qIDj+rj3aKO9iP3pYTNV4L2Wc9
         qS+7eEdJ1YeT1WmRTwQNjdkgOLNtQgzLO3f5f3bI8zZ5Ba/4i9c64FjHCv3Bv+kfEcGz
         EJioCr3w2i6oT1gF4DLK0i7DRV5VQHi2xwAxYNzmtWakYiHT3npeIsPXHc+0+12QKGV2
         bbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706557170; x=1707161970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgJSsvdPN9rhZ08JgxNFLNGNMYP1B2o2EInR2eAPHu4=;
        b=hQF+i0lp1WcCV/tKlz0FAi0LF5j1PYhNunBQKQxFS8pUfq+Be3Rp632A/gaGLtIPhO
         y3trNsX1mMqlSvJIiRAI03MP/tLzEQI6ZrtSLV0i+NO9JYBsedFX4hvu0GnWpXTRQHmj
         21L1npn3w/TedO5qkdl1IbL0tug8LG5gwi4Wi8jbG6aE9YmV3a+u4fg3wmLZvx6kB5vh
         feAQ3rbTI19JUblhaQtghLsl5qJ82BtTo2Jin7KQi9BAgF5T7ze3SJ2ehSi/dVYsCshq
         r4EgQ/jb0OuN8mKW4yJwp8AL2I36XRsi7nI3JVyHZtFFkdCV79B4071tMWeRY0PX+5Cr
         0giQ==
X-Gm-Message-State: AOJu0Yyn6/ntpkIflt8V8GGZ6da5bWG08yLLVZOUJnzGE7hrKKlZAwBz
	dgNQ02oT1pugBhpAqe90QAqGSCFX+JATT/qKiOTSS4gcFBOof07WhsomNFRDv3GfUu7jWM85e62
	9yHFqYo9p8wXTf2KZIuLOjso17i84gMmPSgpJkQ==
X-Google-Smtp-Source: AGHT+IEgdu86+Co4qB4dzLyczwio5jTXVoOkQOgXXDxxwDGsQ2JRtKicpNB4tv/xIxP28PzmDJpfogixr7XAVMD0CiM=
X-Received: by 2002:a17:90a:cc04:b0:28f:fa54:eb30 with SMTP id
 b4-20020a17090acc0400b0028ffa54eb30mr2782484pju.37.1706557169830; Mon, 29 Jan
 2024 11:39:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-4-semen.protsenko@linaro.org> <1b27fa0d-5dc8-497f-ab17-76d82c2aaf40@linaro.org>
In-Reply-To: <1b27fa0d-5dc8-497f-ab17-76d82c2aaf40@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 13:39:18 -0600
Message-ID: <CAPLW+4ntySsQVA5u4TNWuc0KCbhQY61XcsBqC=O8GRoXmS_NYA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
>
>
> On 1/25/24 01:38, Sam Protsenko wrote:
> > diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boo=
t/dts/exynos/exynos850.dtsi
> > index 618bc674896e..ca257da74b50 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> > @@ -738,6 +738,24 @@ usi_spi_0: usi@139400c0 {
> >                                <&cmu_peri CLK_GOUT_SPI0_IPCLK>;
> >                       clock-names =3D "pclk", "ipclk";
> >                       status =3D "disabled";
> > +
> > +                     spi_0: spi@13940000 {
> > +                             compatible =3D "samsung,exynos850-spi";
> > +                             reg =3D <0x13940000 0x30>;
> > +                             interrupts =3D <GIC_SPI 221 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             pinctrl-0 =3D <&spi0_pins>;
> > +                             pinctrl-names =3D "default";
> > +                             clocks =3D <&cmu_peri CLK_GOUT_SPI0_IPCLK=
>,
> > +                                      <&cmu_peri CLK_GOUT_SPI0_PCLK>;
> > +                             clock-names =3D "spi_busclk0", "spi";
> > +                             samsung,spi-src-clk =3D <0>;
>
> this optional property
>

The reason this property is provided here despite being optional, is
to avoid corresponding dev_warn() message from spi-s3c64xx.c driver:

        if (of_property_read_u32(dev->of_node, "samsung,spi-src-clk", &temp=
)) {
            dev_warn(dev, "spi bus clock parent not specified, using
clock at index 0 as parent\n");

The same usage (samsung,spi-src-clk =3D <0>) can be encountered in
multiple other Exynos dts in arch/arm/ and arch/arm64/, and it's also
used in bindings example. Probably for the same reason explained
above. Even if dev_warn() is removed in the driver, I guess the older
kernels will still print it if spi-src-clk is omitted. So I'd like to
keep it here.

> > +                             dmas =3D <&pdma0 5>, <&pdma0 4>;
> > +                             dma-names =3D "tx", "rx";
> > +                             num-cs =3D <1>;
>
> and this one, are already defaults in the driver. Shall you remove them?
>

For exactly the same reasoning as stated above, I'd like to keep this
here to keep dmesg clean and tidy. Otherwise it prints this warning:

        if (of_property_read_u32(dev->of_node, "num-cs", &temp)) {
            dev_warn(dev, "number of chip select lines not specified,
assuming 1 chip select line\n");

And even if the warning is removed in the driver, older kernels will
still print it.

> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +                             status =3D "disabled";
> > +                     };
> >               };


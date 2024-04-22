Return-Path: <linux-clk+bounces-6246-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB38ACFFB
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 16:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47A11F21C11
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 14:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2375F152507;
	Mon, 22 Apr 2024 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4HjiUXU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93E1E49F
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713797769; cv=none; b=j0TYoTrEVxOTMbMib2n7iesiShPKSuzbB0sm5BBOX2Nk+6nQ/iu4QoskjGKuzeNsOI4hZpac9VKHy5/ftp36/9/RhOzFyKhNEgNxP0sZ9taUshuINK6CYdpgVya49lcp/yfx4BwvLcje7mBkrQ7/37oErwL3bGv9lNbSvwqFHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713797769; c=relaxed/simple;
	bh=imsekkblo55XmgjAaWRpZaTVc+ZBiFNXzC9IucNVpbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV1Mze1Dh+61BnIsppXI8hYXo3BjvdlbIvEDgAnFWEq9wPwUTlYLU/ScW6H6ycRcR5B0nXCDxCdeNzYoCUTvEtvIdZl9/jPxHeNnajJRgqCX8irRhRvVO4klScOjTZFafm3+jMD55oiOiJOlAszt6yRGYL9ZY2AuN00qvZ44KCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4HjiUXU; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-23489b56559so2493102fac.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713797765; x=1714402565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTOg8DkAW/3dkpxikcsk436y8h1eZe1SfUF5lmW3ku0=;
        b=U4HjiUXUk7RxfDBJM02w61BKjrevJJkbVQ4n308mTss7ZrXCgsfziCIwLKxShfByoo
         hWFUPwgoHrnn3+txvd+/dIRdrUyblWZBxXoIwQ7UOUEt5AXEp3fu6NW1YR9Euv3EQx5h
         I1rveApyv3uw4B8KPrC6Jknj+jJkMsDnxzmLngWhjRpXz52q9hKfhn6LfI2E+KADBrKI
         r+uDdkRm9scQAFyNYr+06lPE2DWOuUWWkQvldJVTr7zvmAQ4ictOwHFJ3K+eaL8sVheP
         2p/ckccpkJIi/sQewygszj8wg3710ivlA+IL92IGQ0r+8UQMLXtriqxQHG6s6r8iYUjm
         58zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713797765; x=1714402565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTOg8DkAW/3dkpxikcsk436y8h1eZe1SfUF5lmW3ku0=;
        b=PjyjPhFcR5ZfMMU+TLHv8Y3rk/w1sf9wDAdRvqrsSVmkSTS8HA34+CLefEDBqQ4gtI
         4Mbv3s4DKJTT5pvsNcVLeaGrFKeOKrTn/7PApdYgFmGoYitDzqDSlV4pWZUdN8nTVDr7
         CHoLKH77X1c7q6ba9AMQP/z5ipkpy+CyHW5rSIOgARqmi1POeAbHxOcJpPVNqRm4+gEa
         Auj8rC/qPtE5GeVIYzUQ5JIDPATcJOPljGAZ500mPNxwy7DOmr0+v6CWHCwAEIakm5Bs
         uJdARpCq6DaRrOxYxtvbUvlibEhCDEcLck7dNVfo0VMD6mNUZevWADLXs+OtE16qsGl/
         B7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN6qJXFGk4FAGXKM2wWUIV3XMT5OwHM4bnyEIq6f97WSMeqUHBJVffgWYiXC5ofrkgESffhXuWvrvz+PY7z5l7yVM00x4Lb7Gh
X-Gm-Message-State: AOJu0Yz+wa/7i3kiZXzjedC0T71vz5DNa1/OMXj9MFvctWNBLlGGNimd
	78qXUaZZ0kHgJOyIuw4usMtdde/lkQC+YxMV78ipqMFBRIE44MwQJtCBBkeh0IVLh0cPQAN4P1s
	+uS1PTtuFirCeW9khHylZh8ekEhC6BRoBeysXKQ==
X-Google-Smtp-Source: AGHT+IHTzGHT1v9LeibIhpXISDP5Up0NDJE//bpDlntvJJiW0sMwcyQm0rL5VdwsrhLb5OjnZBVN3sPtCblaMnzwbwM=
X-Received: by 2002:a05:6870:1318:b0:21f:aba0:772d with SMTP id
 24-20020a056870131800b0021faba0772dmr10853360oab.39.1713797765495; Mon, 22
 Apr 2024 07:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-9-peter.griffin@linaro.org> <61f427ab3793def23d80d94457ff1568cae5ee11.camel@linaro.org>
In-Reply-To: <61f427ab3793def23d80d94457ff1568cae5ee11.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Apr 2024 15:55:54 +0100
Message-ID: <CADrjBPqAyWzuw9TmdE1XRQ2BkYojR8r7nnH7JcRWc9_xOpUgHg@mail.gmail.com>
Subject: Re: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Thu, 4 Apr 2024 at 14:24, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
>
> Thanks for this!
>
> I haven't reviewed this, but one immediate comment...
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > [...]
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > index d065e343a85d..b9f84c7d5c22 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -22,6 +22,7 @@
> >  #define CLKS_NR_MISC (CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> > +#define CLKS_NR_HSI2 (CLK_GOUT_HSI2_XIU_P_HSI2_ACLK + 1)
>
> Can you please keep the #defines alphabetical (hsi before misc).

Will fix

>
> >
> >  /* ---- CMU_TOP ------------------------------------------------------=
------- */
> >
> > @@ -3409,6 +3410,560 @@ static const struct samsung_cmu_info peric1_cmu=
_info __initconst =3D {
> >       .clk_name               =3D "bus",
> >  };
> >
> > +/* ---- CMU_HSI2 -----------------------------------------------------=
----- */
>
> and this code block should be earlier in the file

Will fix
>
> > [..]
>
> >  static int __init gs101_cmu_probe(struct platform_device *pdev)
> > @@ -3432,6 +3987,9 @@ static const struct of_device_id gs101_cmu_of_mat=
ch[] =3D {
> >       }, {
> >               .compatible =3D "google,gs101-cmu-peric1",
> >               .data =3D &peric1_cmu_info,
> > +     }, {
> > +             .compatible =3D "google,gs101-cmu-hsi2",
> > +             .data =3D &hsi2_cmu_info,
> >       }, {
>
> and this block should move up

Will fix
>
> >       },
> >  };
> > diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bind=
ings/clock/google,gs101.h
> > index 3dac3577788a..ac239ce6821b 100644
> > --- a/include/dt-bindings/clock/google,gs101.h
> > +++ b/include/dt-bindings/clock/google,gs101.h
> > @@ -518,4 +518,67 @@
> >  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK              45
> >  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK           46
> >
> > +/* CMU_HSI2 */
>
> and all these defines, too.

Will fix.

regards,

Peter


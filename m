Return-Path: <linux-clk+bounces-4282-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721186D5D7
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 22:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD68F28767F
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D5114372D;
	Thu, 29 Feb 2024 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9cM4npi"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F2143722
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240572; cv=none; b=t9GHb/1rWiPi+Bw9jkiFdghJUETtpWcr8npk/hfKxXa6lASy2bBNcrjiaOSM0eSc/hC7EI5OUTcfwUWsN46WpKHdfVH/ei+EJR5thRgRtGpWMOPA/xSePzIKMqSjXspDVNYLE8q018CEK4A1qc8vVlSk+BpPYqtgnkPlZa866JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240572; c=relaxed/simple;
	bh=w8Goakld9blZJd9/ya/yCd3Qk4/5VBb72qWNnFBC0g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU+Z4s9vOKSTCL+OQhdZ6p3VXfuNOn2Qwi9l+hoEdxrqRqK6QQgYpKzyca/Jw4Xl8f0l6zT2aEAjRW1ypDT5wSOYDQe2emhYCiB/PVY2qRONrjHUv68i/GfOPawELzvXOM4ip4LX+h62zZQ5VG71ReGhHZ/y5nFXlGW2r+luER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9cM4npi; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so1120545276.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240570; x=1709845370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzH42Le6JLqPTnrmstPPgkRIyy1vLFZ8cAEfYjhK5wU=;
        b=R9cM4npi1EypKIfskw8+XO7V1LVb9YUy7YPLmnpf7/jfA8v4sfFWsDOdI6pfXnF92H
         xzq+FkNLU8QNPe0pw761/O2RWjgQXvEjFjBN3i9+kNIpJWqSEO9ZCQJjPFOymOQyYrvH
         U1Yxi6GUanaiyzYHZ3oGhTW7a8CwrtWnJ7KhPQiohYXmbTISW6uabaJsMNJ1JFvHze6r
         6y0ZD18SY3N4r0omVczT+vlOVKQ5FmGPEWjK2F6cyVHnb9/8be+dphiiOEqZTlZrdzw4
         s5NBmmAd6ih+Kd2kmugOQJpcN9UKlkwboL0ZTOtFscUokSzPWXkagZAA74qCsLoPJicl
         F6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240570; x=1709845370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzH42Le6JLqPTnrmstPPgkRIyy1vLFZ8cAEfYjhK5wU=;
        b=PxZzR98JsMXS+e7LGcPc8Zukj3ov1YoeTrYh85+DaVjwZmJ6wftLuOoj2lg8lGIPCC
         ZWAlP5IqJWUZNe7om0PUEOHTBLVBSw0Fl5lLqBeZpZs+jtwXJXsqgVK0aKLHB47qKLzK
         9vHW8zP0/H2qbKxB7SCO25vnIDQgQcVYEh74mimsdksDJRyVYl45a49aOibvGPHul2UI
         zTsyqbFtwzoHnVPxTur35QwYB4Mv/zyYd0jTttIT+blyiSDsOSReyaTvv27wjeqOSVpM
         7V0jHl2tuem6twKDlfId++/foh9JQu3IVH/uIzj8Hm3kY9+tPGEGmfk3EGeLeF6QqgIF
         X8bw==
X-Forwarded-Encrypted: i=1; AJvYcCX5JJaClB8dYXGKwWXCuOlWocoo6arPEv7Aj82cx/DRUODQuudd75kB6Av9FSxGlccyGfYxxA23zBq+PiEY1UTZPBApfN+5w+UR
X-Gm-Message-State: AOJu0YwSNyNn1Bb/tYxf/hLyePmql2caSVwwDjmYAHV8HsycMn70eS4q
	VP1F/5KlOY567e4Fwlw3SCECDFZWwGJi7p5SMvetynecLwv41LZ96J7HIPttg0ynObZ//77uRpo
	Ad3Dx9CGPLj0IkluqxLbLMhQ1iuG+3tftPm0PKQ==
X-Google-Smtp-Source: AGHT+IGrqHZZfmk+QgMoq6cpaifJe9cFgRnyEqezfeLGnwvG4l4U6/5Wq4g1VkIDnrBaM3IK6DsIiSkau/poL+aahCE=
X-Received: by 2002:a25:d696:0:b0:dcc:2671:7819 with SMTP id
 n144-20020a25d696000000b00dcc26717819mr2486052ybg.25.1709240569561; Thu, 29
 Feb 2024 13:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com>
 <20240227-mbly-clk-v8-5-c57fbda7664a@bootlin.com> <Zd4moVd_-bY6Z_kL@smile.fi.intel.com>
 <CZGX0TSYLOH4.DZHG351R9KFZ@bootlin.com> <ZeBsAbPRr5IPkVZj@smile.fi.intel.com>
 <CZHNS29NK9RR.13G019Y9ZY6IO@bootlin.com> <ZeCjk9QgtCWb8Ecy@smile.fi.intel.com>
In-Reply-To: <ZeCjk9QgtCWb8Ecy@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:02:37 +0100
Message-ID: <CACRpkda-6jZUH5jDwPhyGgO-h8upRbj1z_4nT_gUisSQO9X8cg@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pinctrl: eyeq5: add platform driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

lots of discussion here, lazy Reviewed-by from me, but Andy often (thank Go=
d!)
catches things I just miss.

On Thu, Feb 29, 2024 at 4:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> > > The rule of thumb is to make modules if, otherwise, it's not so criti=
cal for
> > > the boot process (and even for some cases we still may have it done a=
s a module
> > > with help of deferred probe mechanism).
> >
> > I'd call SoC pin control a critical resource for the boot process.
> >
> > I also like the simplicity of builtin better for such a resource.
> >  - If we tristate pinctrl-eyeq5 and there is a bug, there is a bug (in =
a
> >    context that we have no reason to support).
> >  - If we do not allow it and there is a bug, there is no bug.
> >    Plus, it makes one less choice for people configuring the kernel.
>
> The problem is that you reduce the flexibility. Nobody prevents you from =
having
> it built-in while tristate. But completely different situation when it's =
bool.
>
> So my argument still stays. I think new code shouldn't be boolean by defa=
ult.
> The only exceptional cases can do that (like PMIC driver or critical cloc=
k one).

I think bool is helpful for users if:

- The system cannot boot without the pin control driver

- The system cannot mount root from a storage medium without the pin contro=
l
  driver. Initramfs doesn't count for embedded systems, many of these use t=
hings
  like OpenWrt that does not use initramfs the way Debian or Fedora etc doe=
s.

This SoC is obviously for the deeply embedded usecase. If this SoC has root
on flash or eMMC and cannot access either without pin control, it is helpfu=
l
for users to have this as bool so they don't shoot themselves in the foot w=
ith
Kconfig.

> > > > > > +     if (WARN_ON(offset > 31))
> > > > > > +             return false;

I think I asked for this code in my review, because I felt unsafe about off=
set.

Maybe it's not such a big problem, but, this twoliner is also not a big dea=
l.

Yours,
Linus Walleij


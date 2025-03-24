Return-Path: <linux-clk+bounces-19778-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F60A6E0BF
	for <lists+linux-clk@lfdr.de>; Mon, 24 Mar 2025 18:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AB5169E04
	for <lists+linux-clk@lfdr.de>; Mon, 24 Mar 2025 17:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2612641F2;
	Mon, 24 Mar 2025 17:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+VDPyKA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA992638A6
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836988; cv=none; b=OqoeJwMulxDuICCBNb8PV38IL6QkVh8LGXEYkjpKbD2WAWRUgWJOuUqECagMeMyb9VF3QXGNP9D8t24HNuq7pwtLHsgW6qdZ4qVOP23ypKX3v2dED6ElDtuAHG5g9/K/6KNTW0obasat1Xa/jvae1lHeDoeWDlCBsUgyxL8cc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836988; c=relaxed/simple;
	bh=WzeJaaOIY3qOgasgq2SbP7NzsZnSi26UTmzBlBZdbZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jGqNXpaMKvrnpj97wc3F90X8Y+x1X2CKTA4M2RtWfJDJ7kP+uFdyJIz1M8KnjVMtcClfC6bcBE+NM4bl6T5lGFHjf10TKhQJODHHQT5HRAo2k7RsYripIV9I3MPJ46zHJHohaYckGinh5kJvER0H2Fn4Bl32uJt1VGFQErRSQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+VDPyKA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso31733585e9.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742836984; x=1743441784; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzeJaaOIY3qOgasgq2SbP7NzsZnSi26UTmzBlBZdbZQ=;
        b=U+VDPyKAxA/0uYzrU73vVChQ2bgZFoGLlSC3ukE7xR+054kYpMfJuiNnw6LzqrhHP5
         lo2DvoQ32J94Wb6dqXInz0eXuIOWhFHt2bMPS525/imujMmOTW2DgwZswdjNSew98NvG
         G51LxM86maSbXZdDqM46uezP9NhyRVH8y/iDfjUzxu8jqCHqFqJCyKaAFHWvU7D6cU1o
         g0iir9uXWVaF2egHeAzRsGLkIZ4DyIMEWFw/dXv+UVXizRQi+uZGO405YHMIZVc6oo0T
         MHvNOnvD7KyOU6BbTNx3pXIk7/NaF8dT8aUnD6JwhH1pXYwl380L4Kb8O8r9Y+D9w1kh
         vy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742836984; x=1743441784;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzeJaaOIY3qOgasgq2SbP7NzsZnSi26UTmzBlBZdbZQ=;
        b=V/sPr9wwWRCLlDjKeFXfhm1JvWNuH2upjLIVX8bhMZXscP5glxceueEbZ4o64ua2q7
         GZtCb2Dpw7D5PkOdCvmaub3NZBsgN2AVycIZ5901o3XizKY4IfDniN4KG2WpDycwrBf0
         xdIcAQqTxq8T+TQ5of/KJATBd/69SDpCI5Jdcqn8rK+wl9appCrvYUUbJynqIeU5Ncwt
         IIJY8D0pkZaHWVKPwgRu83mvaAbllVBjFvFZq6cTgaUcZPjLcT35EFHJ67UesiqUY4+l
         ciz9b9xaj1b48bBB8b2sSOIQM994J9kFTriC914b2e49XR4t+AMQa/f5TuiT2J6llf+A
         zE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8fNgLcZ/j9q0R1Ec/Dn5JUz864Uo15rlRVeqqwuSI+8XZoeVHrM1T4r+prh+ob8eI4NsVBBCE8bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8eUlh09rJydU/EQ4NwmWNW0rAmplAWWJwfuC88NgDGwRO1n8w
	sPW/Np0Q7ZoDhOmpQx/8YtPPz8qdE+xJ6hFd340QVLuLG4Fm2OrUMYM9eemSK/s=
X-Gm-Gg: ASbGncuEy/JbdRWelAGjjXQxXCdgFGsTxfKJS9YWmupeeQvvg03Pg7sI886wzbaE8ty
	a2eagxL77taeRGcpcabmCPuhugHVtTc9VXkyxljtPU0KqwwN9dvm6PmnMuXXHb+MI3j2VlXrt6S
	uEDmDuDQXZ2QLHDxHrDJcKjt3ZfqnwuUeh/WaS9O3qM8WkLZbL7Wb0uUlxqshhBLDKYSEjsTGSW
	mwnH1GhKuPxO1E0+ZiolNQtQc2ZGNLT9VfDmh6HRu9tSi0SUSHzRzKogtfL2rHMkyLxi151vdyS
	AXpNAs+i7y0WoRCiIjSisapEUYA2iADcdKNEs1kxmC0RmtE=
X-Google-Smtp-Source: AGHT+IHfEsqVrCp9uQuTAuS3ap1nR417rILjVAh7N1JNOE8t++oFUPwfBJvs4SjxnMYZNeDOSpPNtQ==
X-Received: by 2002:a05:6000:18a2:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3997f95956cmr12682045f8f.45.1742836983616;
        Mon, 24 Mar 2025 10:23:03 -0700 (PDT)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f556a4sm177445795e9.22.2025.03.24.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:23:03 -0700 (PDT)
Message-ID: <26037d49069309915d6ac3dc4d0aff90175754de.camel@linaro.org>
Subject: Re: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 24 Mar 2025 17:23:01 +0000
In-Reply-To: <20250324165533.GA521455-robh@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
	 <20250324165533.GA521455-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

Thanks for your review!

On Mon, 2025-03-24 at 11:55 -0500, Rob Herring wrote:
> On Sun, Mar 23, 2025 at 10:39:17PM +0000, Andr=C3=A9 Draszik wrote:
> > The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
> > this binding.
> >=20
> > It is a Power Management IC for mobile applications with buck
> > converters, various LDOs, power meters, RTC, clock outputs, and
> > additional GPIOs interfaces.
> >=20
> > Unlike other Samsung PMICs, communication is not via I2C, but via the
> > Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
> > handle to the ACPM firmware node instead.
>=20
> Can it be a child node of the ACPM node instead?

That should work, I'll do that instead so.

> >=20
> > S2MPG10 can also act as a system power controller allowing
> > implementation of a true cold-reset of the system.
> >=20
> > Support for the other components will be added in subsequent future
> > patches.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../devicetree/bindings/mfd/samsung,s2mps11.yaml=C2=A0=C2=A0 | 34=
 ++++++++++++++++++++--
> > =C2=A01 file changed, 32 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml=
 b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> > index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5=
718ad8fddf0a5df34 100644
> > --- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> > @@ -20,6 +20,7 @@ description: |
> > =C2=A0properties:
> > =C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - samsung,s2mpg10-pmic
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - samsung,s2mps11-pmic
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - samsung,s2mps13-pmic
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - samsung,s2mps14-pmic
> > @@ -43,6 +44,12 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 description:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 List of child nodes that specify t=
he regulators.
> > =C2=A0
> > +=C2=A0 exynos,acpm-ipc:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description: |
>=20
> Don't need '|' if no formatting to preserve.

Oops, yes, sorry.

Cheers,
Andre'

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to the ACPM node for when ACPM =
is used to communicate with the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PMIC, rather than I2C.
> > +
> > =C2=A0=C2=A0 samsung,s2mps11-acokb-ground:
> > =C2=A0=C2=A0=C2=A0=C2=A0 description: |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Indicates that ACOKB pin of S2MPS1=
1 PMIC is connected to the ground so
> > @@ -58,16 +65,39 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset (setting buck voltages to de=
fault values).
> > =C2=A0=C2=A0=C2=A0=C2=A0 type: boolean
> > =C2=A0
> > +=C2=A0 system-power-controller: true
> > +
> > =C2=A0=C2=A0 wakeup-source: true
> > =C2=A0
> > =C2=A0required:
> > =C2=A0=C2=A0 - compatible
> > -=C2=A0 - reg
> > -=C2=A0 - regulators
> > =C2=A0
> > =C2=A0additionalProperties: false
> > =C2=A0
> > =C2=A0allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulators: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-acokb-groun=
d: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-wrstbi-grou=
nd: false
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - exynos,acpm-ipc
> > +
> > +=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exynos,acpm-ipc: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 system-power-controller: fa=
lse
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - regulators
> > +
> > =C2=A0=C2=A0 - if:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> >=20
> > --=20
> > 2.49.0.395.g12beb8f557-goog
> >=20


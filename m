Return-Path: <linux-clk+bounces-15563-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325089E86AF
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 17:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3FA1884EA4
	for <lists+linux-clk@lfdr.de>; Sun,  8 Dec 2024 16:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6011865E0;
	Sun,  8 Dec 2024 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GQkTOWTX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7D20323
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733676461; cv=none; b=OPsLaUej922UJFYRROcAbf6v2JS7194YSYD+R3HO6UEldIsIh/yxUYRCdGjzV83E/sSIDLDzBUwSlvoSpjYIjCE5Uy+7mJyN/1ezanu/kQfnWID5H3+MzVKqefOtkcqp4+elYkYCjz3hFoCsHoaT+D/VKs8mvNO64jOax4jWnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733676461; c=relaxed/simple;
	bh=KXohNUn1sgfZ0nJn3W3B9ixngyCUFopa/KgR6a70T7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYXhRhBz35Ul7Jojlwm34lGhP9tCYoO/Sh2Ec+gxhGAGVsHj4yuDjOMYfPTTJ61/ThaREfAKlwh7sQJ3MdTGXJs8QJ49+NBG8ELhYSL1gocvK/boPcaHO++ihhUv2Z5Xuir896TcisAyDRgws11y8bIRXFdFkRemAEMYaqqaZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GQkTOWTX; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3a26de697fso731799276.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733676457; x=1734281257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVkFTMeEWzKzl3eTyT6uuEMADLGUM2vIlykoDjxe32M=;
        b=GQkTOWTXBXhdUVJ4c6An0AW+FO8ZuxvYd/mfGNEEoHDdIGg0S/2qiWdt/QmYQ4cfrf
         bL8qNn3fVAUeQOMxyTR6BdT2iwhBQDQz/dy/HShrQs1sabpCM9xT9r26UvaTGT5jV2kd
         WAmjnjlR2/P8QWVrOegN/ms+FCpADyWegoSeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733676457; x=1734281257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVkFTMeEWzKzl3eTyT6uuEMADLGUM2vIlykoDjxe32M=;
        b=tRapghmv/a9dBtgOUw+vGXqmJv+8quVX2pQnp84a5ctQc3bS4b6j9e6qufFu0JYd2m
         Kd1/RgD1Rt1Udt7yRiCIqnlIzRaaSsHUV5Kn9ZTI9dVRjhHLpEbbT+3hZBZMf500RAC+
         hQLq2UG3yN7KOTCO2yjPMZ8lfey+J7FoXaOodcfX/THlsG3R657M/vVjpliqvoRkdwNp
         RGzoXuWLLpPpv1OGUd1DTqOQ7/jHgacgyyInuMD9tHymH3kP25Kl4KNhDENzrM36KWJp
         znrcj/C5uqiTT2YisvYbfzjG6CuwxcRxIjbbnzqybfrfBpK1+TF36BF2n0PLh0fUjmxi
         R2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL1zgQ2tK66Hx2rLA2kEiF0Zv1UgvIaiOe5M+A0h+apQn5JXSd4mkMKMIv3lcR+m38CtxfwucTyWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vh5Waunauh8WLuq/SA04jOhg9DLkITVF1OubBs9Qvktxsi9m
	OJtqLARrDDi1OrU/8K/ArzHhxSarOWT2PAD7mYe+9iFk5s1YJrSbegjzVeU/SicdZWZrY/hSPm+
	8oRJoKdYdJqHVQVw9DMFZ75s5Qbw3WQqisuFOzw==
X-Gm-Gg: ASbGncsowH+Cofng5r548AAeLNePBg6F2Qb6gZ8GEHdeXK3dN8pMraA1ZmV/OvrBhGx
	BrqRjI3GmJrpOg66gB2p+dUpldeBJ
X-Google-Smtp-Source: AGHT+IHKC4Dc3IJ0AlV+3nSKSyKc3lmzh1gUjiXPcN3vPccSLKXkcjoWpKPkQOx2bu7H1wu2vu7YerTOebNWs3uV2XQ=
X-Received: by 2002:a05:6902:218b:b0:e38:9b5f:58a6 with SMTP id
 3f1490d57ef6-e3a0b4c89b2mr7285740276.46.1733676457470; Sun, 08 Dec 2024
 08:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com> <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
In-Reply-To: <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 8 Dec 2024 17:47:26 +0100
Message-ID: <CABGWkvoQzAhpVJ+QRfVZeps-Jn8REGF+21SPN=f24Tdf1d5DDQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Dec 05, 2024 at 12:17:50PM +0100, Dario Binacchi wrote:
> > The patch adds the DT bindings for enabling and tuning spread spectrum
> > clocking generation.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v4)
> >
> > Changes in v4:
> > - Drop "fsl,ssc-clocks" property. The other added properties now refer
> >   to the clock list.
> > - Updated minItems and maxItems of
> >   - clocks
> >   - clock-names
> >   - fsl,ssc-modfreq-hz
> >   - fsl,ssc-modrate-percent
> >   - fsl,ssc-modmethod
> > - Updated the dts examples
> >
> > Changes in v3:
> > - Added in v3
> > - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
> >   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
> >   indeed more or less a syscon, so it represents a memory area
> >   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> >
> > Changes in v2:
> > - Add "allOf:" and place it after "required:" block, like in the
> >   example schema.
> > - Move the properties definition to the top-level.
> > - Drop unit types as requested by the "make dt_binding_check" command.
> >
> >  .../bindings/clock/imx8m-clock.yaml           | 77 +++++++++++++++++--
> >  1 file changed, 71 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b=
/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > index c643d4a81478..83036f6d2274 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > @@ -29,12 +29,12 @@ properties:
> >      maxItems: 2
> >
> >    clocks:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
> > +    maxItems: 10
>
> ABI break without mentioning, without any explanation in the commit msg.
>
> >
> >    clock-names:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
> > +    maxItems: 10
> >
> >    '#clock-cells':
> >      const: 1
> > @@ -43,6 +43,34 @@ properties:
> >        ID in its "clocks" phandle cell. See include/dt-bindings/clock/i=
mx8m-clock.h
> >        for the full list of i.MX8M clock IDs.
> >
> > +  fsl,ssc-modfreq-hz:
> > +    description:
> > +      The values of modulation frequency (Hz unit) for each clock
> > +      supporting spread spectrum.
> > +    minItems: 7
> > +    maxItems: 10
>
> Why all cloks receive now spread spectrum? I had impression - and all
> your previous versions were doing this - that you have only three or
> four clocks with SSC.

Exactly. Indeed, the first six values are not valid as SSC properties but a=
re
only used to reach the point where the first PLL with SSC (i.e., audio_pll1=
)
can be indexed, which is in position 7 in the clocks list.
This was the rationale I followed.
And it is explicitly outlined in the example section.
The "" for the fsl,ssc-method property is precisely aimed at specifying a
"no SSC" method, which also fixes the warning:

fsl,ssc-method:0: '' is not one of ['down-spread', 'up-spread', 'center-spr=
ead']

raised by
make dt_binding_check DT_SCHEMA_FILES=3Dimx8m-clock.yaml

Or would it be acceptable to specify a list of SSC values that applies only=
 to
the last 4 PLLs in the clocks list?

I feel like I might be missing something.

Could you kindly suggest what to do or provide a DTS example to show me
what you expect?

Thanks and regards,
Dario

>
> Do existing clocks 1-6 support SSC?
>
> > +
> > +  fsl,ssc-modrate-percent:
> > +    description:
> > +      The percentage values of modulation rate for each clock
> > +      supporting spread spectrum.
> > +    minItems: 7
> > +    maxItems: 10
> > +
> > +  fsl,ssc-modmethod:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      The modulation techniques for each clock supporting spread
> > +      spectrum.
> > +    minItems: 7
> > +    maxItems: 10
> > +    items:
> > +      enum:
> > +        - ""
>
> Drop "", not sure why do you need it.
>
> > +        - down-spread
> > +        - up-spread
> > +        - center-spread
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -76,6 +104,10 @@ allOf:
> >              - const: clk_ext2
> >              - const: clk_ext3
> >              - const: clk_ext4
> > +        fsl,ssc-modfreq-hz: false
> > +        fsl,ssc-modrate-percent: false
> > +        fsl,ssc-modmethod: false
> > +
> >      else:
> >        properties:
> >          clocks:
> > @@ -86,6 +118,10 @@ allOf:
> >              - description: ext2 clock input
> >              - description: ext3 clock input
> >              - description: ext4 clock input
> > +            - description: audio1 PLL input
> > +            - description: audio2 PLL input
> > +            - description: dram PLL input
> > +            - description: video PLL input
>
> Also ABI break....
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com


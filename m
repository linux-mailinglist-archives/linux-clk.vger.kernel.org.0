Return-Path: <linux-clk+bounces-11160-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47A95EC90
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 10:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB06D280C7C
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 08:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADBA13E033;
	Mon, 26 Aug 2024 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAZsMFyC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7F13D630
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662767; cv=none; b=AiTH/gYDrbeV4CGIC1NpicqokjENuAZjJdwmXPQTW2d7aE8RgdenNEhV173lqruO+mhgQZrIwViI4fXQiDgtPMLbeUu7BnP7iMEp5cjbjJAJeDsdkffA9cLSJI4kiw94qkNnZ7B8dRXwDSQTMYCNqWcJD2AxOeTYMIeOvTs4qrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662767; c=relaxed/simple;
	bh=pGUaHSOJJkMQt5BZYoMf0dGNN2Fjcxw7k0FILJR0kAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6CpCqvIaeYuQ4/d3VjOncQec89jMCbVK4CmoTmtQ2UrSaHAdDSuhkNaWBvCxCKFaPqTQslBdQUzEhlT+R00YwGP/FYRtWIkE/E3yI6hUXIqhaC268GqwTt17a0oZS9NVcob0/uJNaIRTBPeDPh4eml5ZtErgcPHavdHyyQIAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAZsMFyC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-533462b9428so6863015e87.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724662763; x=1725267563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd9B44Nl7+g1cM9bkfkjJX8JzbY1PgI3kG+ulDiEMdQ=;
        b=WAZsMFyCcWnUtEY1WTevuZMkQvO289Xp6hho0yFIuZvq22aBTGlJ0cXibBS2i9/puF
         aWcQO4atlofDUbpKsOAJ17jlWk/ukeQee2TpJuVb2b5cNJ2aLeL9Rf2KGd/gajVIbetJ
         1C+qOxiaKX0/93kmgLd+T9tyzE3MQVnQm+T2H5Fs4bjrUL6BGuIyddPsSfwTAK+m6iI6
         iCvTtRqabi0AkM4bjGQYHa0MhTmY3HBY/IEUAU5qwzrZsbIen7wsRTc8I2uTOTLW6gAS
         A3mGHILVyHmxJlcwJohm61gaC0FSMcs+waTa1BNendWXcy5Hx8Jw+C8fC7C5h4tD3Svx
         uS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724662763; x=1725267563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd9B44Nl7+g1cM9bkfkjJX8JzbY1PgI3kG+ulDiEMdQ=;
        b=b0Ix+0VHKLmP/UzTpdwbITfJnL2SwX4I5aiQNHyA4TTNuge/RCSce3DpoWKIc1bof9
         QIyiiKOq7zFOr3LL6Q8Oc4sRabNCRHypn/0k35Nv/sR+xf8ahqej1wQZAImQPH7g80y+
         3NB62gfOSCusnmudUqa29dIi14dPPuCkHx8ArqcxMJ+/hfDUW8TeeyWYSbXzLPMzuJSo
         cdwHTBV1Z0+sFaWQyH27hixdxkNen/iCeIxEjOtzUx5tohv0vbKwiLqR7m4ewZJlNxOO
         RZ2meBVj0Zg3Bo3jP2DOMOFtSjbKUq91l6mdI+MdgVi0pUtOijdHUvw7ieOT9jLujTmV
         EuNw==
X-Forwarded-Encrypted: i=1; AJvYcCWETVXpSKnx9jB4nAI8jrRQmL2+H68UlNsqtO6KjQCKI4vWlVjmeuWBtvbfX1jllif95k+7SU1fQ/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86rwuWrtZKl/+YHLeYunTd0Hu9LOfyQ53e/XNkfBB6BQYfEoC
	H0x1H+ZkqB71jOE/uGF5ljkS6+e6VVJG0Ilu3AXv6QcOn0pCkSWPTfHfMy6+qAdhS6bAzCWD+dG
	OED07DKyFn/HidKvvBntt6HOTZjTrVXuOp+ST0A==
X-Google-Smtp-Source: AGHT+IGEft27gKfF8OCWFoAOuMh4QtyEh1Yp7uSkPeDiRCrZ0WKZup/kL/7F8F5+yru68H0HLntVGNBq/OYlJBg9wOw=
X-Received: by 2002:ac2:4e07:0:b0:530:dfab:9315 with SMTP id
 2adb3069b0e04-5343883d65emr7564335e87.10.1724662763017; Mon, 26 Aug 2024
 01:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724159867.git.andrea.porta@suse.com> <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
In-Reply-To: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:59:12 +0200
Message-ID: <CACRpkdbdXNeL6B43uV-2evCfr6iv8fUsSVtAND+2U0H5mSL2rw@mail.gmail.com>
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arch@vger.kernel.org, Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

thanks for your patch!

On Tue, Aug 20, 2024 at 4:36=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> Add minimum support for the gpio only portion. The driver is in
> pinctrl folder since upcoming patches will add the pinmux/pinctrl
> support where the gpio part can be seen as an addition.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
(...)

> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
(...)

> +static void rp1_pad_update(struct rp1_pin_info *pin, u32 clr, u32 set)
> +{
> +       u32 padctrl =3D readl(pin->pad);
> +
> +       padctrl &=3D ~clr;
> +       padctrl |=3D set;
> +
> +       writel(padctrl, pin->pad);
> +}

Looks a bit like a reimplementation of regmap-mmio? If you want to do
this why not use regmap-mmio?

> +static void rp1_set_dir(struct rp1_pin_info *pin, bool is_input)
> +{
> +       int offset =3D is_input ? RP1_CLR_OFFSET : RP1_SET_OFFSET;
> +
> +       writel(1 << pin->offset, pin->rio + RP1_RIO_OE + offset);

If you include bitops.h what about:

writel(BIT(pin->offset), pin->rio + RP1_RIO_OE + offset);

> +static int rp1_get_value(struct rp1_pin_info *pin)
> +{
> +       return !!(readl(pin->rio + RP1_RIO_IN) & (1 << pin->offset));
> +}

Also here

> +
> +static void rp1_set_value(struct rp1_pin_info *pin, int value)
> +{
> +       /* Assume the pin is already an output */
> +       writel(1 << pin->offset,
> +              pin->rio + RP1_RIO_OUT + (value ? RP1_SET_OFFSET : RP1_CLR=
_OFFSET));
> +}

And here

> +static int rp1_gpio_set_config(struct gpio_chip *chip, unsigned int offs=
et,
> +                              unsigned long config)
> +{
> +       struct rp1_pin_info *pin =3D rp1_get_pin(chip, offset);
> +       unsigned long configs[] =3D { config };
> +
> +       return rp1_pinconf_set(pin, offset, configs,
> +                              ARRAY_SIZE(configs));
> +}

Nice that you implement this!

> +static void rp1_gpio_irq_config(struct rp1_pin_info *pin, bool enable)
> +{
> +       writel(1 << pin->offset,
> +              pin->inte + (enable ? RP1_SET_OFFSET : RP1_CLR_OFFSET));

BIT()

Yours,
Linus Walleij


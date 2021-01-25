Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD604303521
	for <lists+linux-clk@lfdr.de>; Tue, 26 Jan 2021 06:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbhAZFgR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Jan 2021 00:36:17 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:45546 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbhAYOt2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 09:49:28 -0500
Received: by mail-lf1-f46.google.com with SMTP id q12so18086575lfo.12;
        Mon, 25 Jan 2021 06:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=oPSrp6GTXszof/dNN0q+//X3RVS3y6bDNp6+3lvklGQ=;
        b=jtTS7e/3x1/mpInMILVwubXIwLgaHHcMUvtktA4EA2yowmYpz/NaoGI0xcO9r2/hJG
         2LKW9FFMaPZfUre9lYxHU/e3UWm12/YuBzRGMLW4G/nOSylNzf93Wq/oAhKS3LbpBwWC
         EQniVSuP59cWS0mV3r+iMQXS7eqeroHk2kznI3na7PALPp/M6Yne70YleLRiwdpwULZj
         2ir41JYX9uEmZsF2pl6qJ977AjHLXW1FNUH/9XU2UE8Emz/huGR+q7AK5kaHr/Bghofi
         NpehEplSbsnPkRPbHJNHjtHAEGqikQHXub9HpHQsEILjIpoXHzYkRAIZPq+diddj1Kmz
         lb5w==
X-Gm-Message-State: AOAM5336oVRs/R4oreF0gYCIfMt0sTe6pE1F3TGYe6HaEWUPazevvZgo
        Lw+ovWz7EjJ0VfycND6WD9I=
X-Google-Smtp-Source: ABdhPJxOjRvLElV4WAr8IXb2gJhiSVLKwvCwYVqcrseNfOeAj1QsN/9i/cFCsdPeje6SLk7QEAbtoA==
X-Received: by 2002:a19:3f87:: with SMTP id m129mr424730lfa.560.1611586123211;
        Mon, 25 Jan 2021 06:48:43 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id b11sm1958382lfi.174.2021.01.25.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:48:42 -0800 (PST)
Message-ID: <7a3d897d6af9f4310e5cc98ca74123192da49e27.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v2 09/17] mfd: Support for ROHM BD71815 PMIC core
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20210125141044.GZ4903@dell>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <14480ca837005aecd7053202c2347e36ad29faee.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <20210125141044.GZ4903@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 25 Jan 2021 16:48:36 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Lee,

Thanks again for the review!

On Mon, 2021-01-25 at 14:10 +0000, Lee Jones wrote:
> On Tue, 19 Jan 2021, Matti Vaittinen wrote:
> 
> > Add core support for ROHM BD71815 Power Management IC.
> > 
> > The IC integrates regulators, a battery charger with a coulomb
> > counter,
> > a real-time clock (RTC), clock gate and general-purpose outputs
> > (GPO).
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > Changes since v1:
> >   - Used BIT() for better readability
> >   - removed some unused definitions
> > 
> >  drivers/mfd/Kconfig              |  15 +-
> >  drivers/mfd/rohm-bd71828.c       | 416 +++++++++++++++++++++--
> >  include/linux/mfd/rohm-bd71815.h | 561
> > +++++++++++++++++++++++++++++++
> >  include/linux/mfd/rohm-bd71828.h |   3 +
> >  4 files changed, 952 insertions(+), 43 deletions(-)
> >  create mode 100644 include/linux/mfd/rohm-bd71815.h
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index bdfce7b15621..59bfacb91898 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1984,19 +1984,20 @@ config MFD_ROHM_BD70528
> >  	  charger.
> >  
> >  config MFD_ROHM_BD71828
> > -	tristate "ROHM BD71828 Power Management IC"
> > +	tristate "ROHM BD71828 and BD71815 Power Management IC"
> >  	depends on I2C=y
> >  	depends on OF
> >  	select REGMAP_I2C
> >  	select REGMAP_IRQ
> >  	select MFD_CORE
> >  	help
> > -	  Select this option to get support for the ROHM BD71828 Power
> > -	  Management IC. BD71828GW is a single-chip power management IC
> > for
> > -	  battery-powered portable devices. The IC integrates 7 buck
> > -	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
> > -	  Also included is a Coulomb counter, a real-time clock (RTC),
> > and
> > -	  a 32.768 kHz clock gate.
> > +	  Select this option to get support for the ROHM BD71828 and
> > BD71815
> > +	  Power Management ICs. BD71828GW and BD71815AGW are single-
> > chip power
> > +	  management ICs mainly for battery-powered portable devices.
> > +	  The BD71828 integrates 7 buck converters and 7 LDOs. The
> > BD71815
> > +	  has 5 bucks, 7 LDOs, and a boost for driving LEDs. Both ICs
> > provide
> > +	  also a single-cell linear charger, a Coulomb counter, a real-
> > time
> > +	  clock (RTC), GPIOs and a 32.768 kHz clock gate.
> >  
> >  config MFD_STM32_LPTIMER
> >  	tristate "Support for STM32 Low-Power Timer"
> > diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-
> > bd71828.c
> > index 210261d026f2..28b82477ce4c 100644
> > --- a/drivers/mfd/rohm-bd71828.c
> > +++ b/drivers/mfd/rohm-bd71828.c
> > @@ -2,7 +2,7 @@
> >  //
> >  // Copyright (C) 2019 ROHM Semiconductors
> >  //
> > -// ROHM BD71828 PMIC driver
> > +// ROHM BD71828/BD71815 PMIC driver
> >  
> >  #include <linux/gpio_keys.h>
> >  #include <linux/i2c.h>
> > @@ -11,7 +11,9 @@
> >  #include <linux/ioport.h>
> >  #include <linux/irq.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mfd/rohm-bd71815.h>
> >  #include <linux/mfd/rohm-bd71828.h>
> > +#include <linux/mfd/rohm-generic.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> >  #include <linux/regmap.h>
> > @@ -29,12 +31,102 @@ static struct gpio_keys_platform_data
> > bd71828_powerkey_data = {
> >  	.name = "bd71828-pwrkey",
> >  };
> >  
> > -static const struct resource rtc_irqs[] = {
> > +static const struct resource bd71815_rtc_irqs[] = {
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
> > +};
> > +
> > +static const struct resource bd71828_rtc_irqs[] = {
> >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
> >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
> >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
> >  };
> >  
> > +static struct resource bd71815_power_irqs[] = {
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-clps-out"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_IN, "bd71815-clps-in"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_RES, "bd71815-dcin-
> > ovp-res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_DET, "bd71815-dcin-
> > ovp-det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_RES, "bd71815-dcin-
> > mon-res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_DET, "bd71815-dcin-
> > mon-det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_RES, "bd71815-vsys-uv-
> > res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_DET, "bd71815-vsys-uv-
> > det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_RES, "bd71815-vsys-
> > low-res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_DET, "bd71815-vsys-
> > low-det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-
> > mon-res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-
> > mon-det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TEMP, "bd71815-chg-
> > wdg-temp"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TIME, "bd71815-chg-
> > wdg"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_RES, "bd71815-
> > rechg-res"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_DET, "bd71815-
> > rechg-det"),
> > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RANGED_TEMP_TRANSITION,
> > +			     "bd71815-ranged-temp-transit"),
> 
> The new line limit is 100.  Feel free to run these out.

I learn new things every day it seems. This change is more than
welcome!

> > +	if (!strncmp(mode, "open-drain", 10)) {
> > +		dev_dbg(dev, "configuring clk32kout as open-drain");
> 
> Do you *really* need these?

No. development leftover. Thanks for pointing that.

> > 
> > +		button_irq = 0;
> > +		dev_info(&i2c->dev, "BD71815 found\n");
> 
> Again, are these *really* useful to you and/or your users?
> 
> Besides, this device not *found* i.e. scanned/read and instantiated,
> it has simply been matched from the local DTB.  It can still be
> wrong.  You can probably omit them.

You're right. One can check the DT contents from /proc if he wants to
check what IC compatible was used. Thanks.
> 
> [...]
> 
> > diff --git a/include/linux/mfd/rohm-bd71815.h
> > b/include/linux/mfd/rohm-bd71815.h
> > new file mode 100644
> > index 000000000000..8ee5874a5b73
> > --- /dev/null
> > +++ b/include/linux/mfd/rohm-bd71815.h
> > @@ -0,0 +1,561 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright 2014 Embest Technology Co. Ltd. Inc.
> 
> Jeeze!  Is this for the Amiga?

Nah. Long live NXP SOCs! ;) I think BD71815 was _originally_ developed
for i.MX6.

> 
> > + * Author: yanglsh@embest-tech.com
> > + *
> > + * 2020, 2021 Heavily modified by:
> 
> You should probably add a proper copyright.
Ok. I guess I can do so. Thanks!

> > + *	 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > + */
> > +
> > +#ifndef _MFD_BD71815_H
> > +#define _MFD_BD71815_H
> > +
> > +#include <linux/regmap.h>

Best Regards
-- Matti Vaittinen


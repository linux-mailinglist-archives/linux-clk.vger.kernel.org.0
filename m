Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C675E432300
	for <lists+linux-clk@lfdr.de>; Mon, 18 Oct 2021 17:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhJRPiD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 Oct 2021 11:38:03 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:37534 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbhJRPiC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 11:38:02 -0400
Received: by mail-pg1-f171.google.com with SMTP id s136so13398834pgs.4;
        Mon, 18 Oct 2021 08:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ix+PjeVUr9M9hmSH2oYIe5g/udBeDCxp0YK/hSiGdg0=;
        b=xuc6/JQ4yRQF1qlZJB4Ewi3SHbpk5cVeBgQOs192JHYyX0ObnNdwf4cmNq4GKxj2re
         QIO9Qa4Vn3KJsHvmxHOsIMN/CBluoDuq65REtIdN97tY7ih0FtvDKIXbYJtsaf6RqmMj
         SqyIRk8fYvKmJjki2dxYtJxLaVZOryT9BL4Jypm6sYHGZm94TbObYjW4wI8bz508Pnf4
         g08DG8rflvBaLDqBvMwWuX6UrnbZFpaSO8EjS7KEQO15wgl8ck5sS/do2dDW4mx+s8RD
         nguLj7qe7v43czMAyqM8mLlCtheOgvEOUDb2zDiNMR60LlNGPv21wJY4hl5p9QYI8+BF
         wXrA==
X-Gm-Message-State: AOAM53198fWfZddOjt43iH0K5MaHCiPYNy7u+hroO4g6TbShgBLgbu4g
        PL3oV4GWxB94qlPbQbZlEua9jMBrk56twz4gt9k=
X-Google-Smtp-Source: ABdhPJzT4LgxUt7FciDLvvzmuxi7pknt0BTuurCI8z6mbkWTQg7776/M/gliut0S1FkbMnG28TD6bZziajZQ25qMB8I=
X-Received: by 2002:a62:31c5:0:b0:447:cd37:61f8 with SMTP id
 x188-20020a6231c5000000b00447cd3761f8mr29553098pfx.29.1634571350615; Mon, 18
 Oct 2021 08:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
In-Reply-To: <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 18 Oct 2021 17:35:39 +0200
Message-ID: <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > Add a combined pinctrl and gpio driver for the StarFive JH7100 SoC.
> >
> > For each "GPIO" there are two registers for configuring the output and
> > output enable signals which may come from other peripherals. Among these
> > are two special signals that are constant 0 and constant 1 respectively.
> > Controlling the GPIOs from software is done by choosing one of these
> > signals. In other words the same registers are used for both pinmuxing
> > and controlling the GPIOs, which makes it easier to combine the pinctrl
> > and gpio driver in one.
> >
> > I wrote the pinconf and pinmux parts, but the gpio part of the code is
> > based on the gpio driver in the vendor tree written by Huan Feng with
> > cleanups and fixes by Drew and me.
>
> s/gpio/GPIO/g
>
> ...
>
> > +config PINCTRL_STARFIVE
>
> > +       bool "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
>
> Why not module?
>
> > +       depends on SOC_STARFIVE || COMPILE_TEST
>
> > +       depends on OF
>
> Do you really need this taking into account...
>
> > +       default SOC_STARFIVE
> > +       select GENERIC_PINCTRL_GROUPS
> > +       select GENERIC_PINMUX_FUNCTIONS
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIOLIB_IRQCHIP
>
> > +       select OF_GPIO
>
> ...this one?
>
> ...
>
> bits.h ?
>
> > +#include <linux/clk.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
>
>
> mod_devicetable.h ?
>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
>
> Can you move these as a group after generic linux/* ones?
>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include <linux/spinlock.h>
>
> ...
>
> > +/*
> > + * refer to Section 12. GPIO Registers in JH7100 datasheet:
>
> Be consistent in your style, here for example missed capitalization.
>
> > + * https://github.com/starfive-tech/StarLight_Docs
>
> Is it possible to have the datasheet to be provided as Datasheet: tag
> in the commit message?
>
> > + */
>
> ...
>
> > +/*
> > + * Global enable for GPIO interrupts, offset: 0x0, field: GPIOEN
> > + * set to 1 if GPIO interrupts are enabled, set to 0 to disable
> > + */
> > +#define IRQ_GLOBAL_EN          0x0
>
> s/0x0/0x00/g
>
> ...
>
> > +/*
> > + * Interrupt Type for GPIO[31:0], offset: 0x10, field: GPIOS_0
> > + * set to 1 if edge-triggered, set to 0 for level-triggered
> > + */
> > +#define IRQ_TYPE_LOW           0x10
> > +
> > +/*
> > + * Interrupt Type for GPIO[63:32], offset: 0x14, field: GPIOS_1
> > + */
> > +#define IRQ_TYPE_HIGH          0x14
>
> As I reviewed below, the IRQ is represented by a few registers in a
> row, no need to define low and high separately. Ditto for the rest
> register pairs.
>
> ...
>
> > +/*
> > + * Interrupt Status after Masking GPIO[31:0], offset: 0x40, field: GPIOMIS_0
> > + * status of edge-triggered or level-triggered after masking
> > + * value of 1 means edge or level was detected, value of 0 menas not detected
>
> menas?!
>
> > + */
>
> ...
>
> > +/*
> > + * Data Value of GPIO for GPIO[31:0], offest: 0x48, field: GPIODIN_0
>
> offest?!
>
> > + * dynamically reflects value on the GPIO pin
> > + */
>
> Please, run a spellchecker.
>
> ...
>
> > +#define IO_PADSHARE_SEL                0x1a0
>
> Okay, make all registers to be fixed width, i.e. 0x000 for IRQ global
> enabling and so on.
>
> ...
>
> > +#define PAD_SLEW_RATE_MASK             0xe00U
>
> GENMASK()
>
> > +#define PAD_BIAS_STRONG_PULL_UP                0x100U
> > +#define PAD_INPUT_ENABLE               0x080U
> > +#define PAD_INPUT_SCHMITT_ENABLE       0x040U
> > +#define PAD_BIAS_DISABLE               0x020U
> > +#define PAD_BIAS_PULL_DOWN             0x010U
>
> All above seems like BIT(_something_).
>
> > +#define PAD_BIAS_MASK                  0x130U
> > +#define PAD_DRIVE_STRENGTH_MASK                0x007U
>
> GENMASK()
>
> ...
>
> > +#ifdef CONFIG_DEBUG_FS
>
> __maybe_unused ?
>
> > +#else
> > +#define starfive_pin_dbg_show NULL
> > +#endif
>
> ...
>
> > +       dout = readl_relaxed(reg);
>
> readl_relaxed(reg + 0x00)
>
> > +       reg += 4;
>
> > +       doen = readl_relaxed(reg);
>
> readl_relaxed(reg + 0x04);
>
> ...
>
> > +       seq_printf(s, "dout=%u%s doen=%u%s",
> > +                  dout & 0xffU, (dout & 0x80000000U) ? "r" : "",
> > +                  doen & 0xffU, (doen & 0x80000000U) ? "r" : "");
>
> GENMASK()
> BIT()
>
> ...
>
> > +       for_each_child_of_node(np, child) {
> > +               const __be32 *pinmux_list;
> > +               const __be32 *pins_list;
> > +               int pinmux_size;
> > +               int pins_size;
> > +
> > +               pinmux_list = of_get_property(child, "pinmux", &pinmux_size);
> > +               pins_list   = of_get_property(child, "pins",   &pins_size);
> > +               if (pinmux_list && pins_list) {
> > +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> > +                               np, child, "both pinmux and pins set");
> > +                       of_node_put(child);
> > +                       return -EINVAL;
> > +               }
> > +
> > +               if (pinmux_list && pinmux_size > 0) {
> > +                       nmaps += 2;
> > +               } else if (pins_list && pins_size > 0) {
> > +                       nmaps += 1;
> > +               } else {
> > +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> > +                               np, child, "neither pinmux nor pins set");
> > +                       of_node_put(child);
> > +                       return -EINVAL;
> > +               }
> > +               ngroups += 1;
> > +       }
>
> This entire loop seems like
> 1) it should be based on something from pin control core;
> 2) it's using some low level APIs instead of better ones like
> of_property_read_uXX();
> 3) smells like unoptimized NIH.
>
> ...
>
> > +               if ((list = of_get_property(child, "pinmux", &npins))) {
>
> Why not of_property_read_...() ?
>
> ...
>
> > +                               u32 v = be32_to_cpu(*list++);
>
> My gosh!
>
> ...
>
> > +                       for (i = 0; i < npins; i++)
> > +                               pins[i] = be32_to_cpu(*list++);
>
> Ditto.
> Even for this we have something in byteorder headers.
>
> Summary, make sure you use much better _existing_ APIs instead of the
> above crap.
>
> ...
>
> > +free_pinmux:
> > +       devm_kfree(dev, pinmux);
> > +free_pins:
> > +       devm_kfree(dev, pins);
> > +free_grpname:
> > +       devm_kfree(dev, grpname);
>
> What the heck?!
>
> > +free_pgnames:
> > +       devm_kfree(dev, pgnames);
>
> Ditto.
>
> ...
>
> > +out:
>
> Useless label.
>
> > +       return ret;
>
> ...
>
> > +       for (i = 0; i < group->num_pins; i++) {
> > +               unsigned int gpio = starfive_pin_to_gpio(sfp, group->pins[i]);
> > +               void __iomem *reg_dout;
> > +               void __iomem *reg_doen;
> > +               void __iomem *reg_din;
> > +               u32 v, dout, doen, din;
> > +               unsigned long flags;
>
> > +               if (dev_WARN_ONCE(dev, gpio >= MAX_GPIO,
>
> What?!
>
> > +                                 "%s: invalid gpiomux pin", group->name))
> > +                       continue;
> > +
> > +               v = pinmux[i];
> > +               dout = ((v & BIT(7)) << (31 - 7)) | ((v >> 24) & 0xffU);
> > +               doen = ((v & BIT(6)) << (31 - 6)) | ((v >> 16) & 0xffU);
> > +               din  = (v >> 8) & 0xffU;
>
> What is this voodoo for?
>
> > +               if (din != 0xff)
> > +                       reg_din = sfp->base + GPIO_IN_OFFSET + 4 * din;
> > +               else
> > +                       reg_din = NULL;
>
> This looks like you maybe use gpio-regmap instead?
>
> ...
>
> > +       void __iomem *reg = sfp->padctl + 4 * (pin / 2);
> > +       u32 value = readl_relaxed(reg);
> > +
> > +       if (pin & 1U)
> > +               value >>= 16;
> > +       return value;
>
> u8 shift = 16 * (pin % 2);
>
> return readl_relaxed() >> shift;
>
> ?
>
> Something similar for below code.
>
> ...
>
> > +#ifdef CONFIG_DEBUG_FS
> > +static const struct pin_config_item
> > +starfive_pinconf_custom_conf_items[ARRAY_SIZE(starfive_pinconf_custom_params)] = {
>
> Instead of using ARAY_SIZE() here, use static_assert().
>
> __maybe_unused?
>
> > +       PCONFDUMP(PIN_CONFIG_STARFIVE_STRONG_PULL_UP, "input bias strong pull-up", NULL, false),
> > +};
> > +#else
> > +#define starfive_pinconf_custom_conf_items NULL
> > +#endif
>
> ...
>
> > +static const unsigned char starfive_drive_strength[] = {
> > +       14, 21, 28, 35, 42, 49, 56, 63,
>
> Why table? Can you simply use the formula?!
>
> > +};
>
> ...
>
> > +       if (unlikely(!group))
>
> Why unlikely() Must be justified here and everywhere where you are using it.
>
> > +               return -EINVAL;
> > +
> > +       return starfive_pinconf_get(pctldev, group->pins[0], config);
> > +}
>
> ...
>
> > +               case PIN_CONFIG_BIAS_DISABLE:
>
> > +                       mask |= PAD_BIAS_MASK;
>
> Use it...
>
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
>
> ...here. Ditto for the similar cases in this function and elsewhere.

I don't follow. How do you want me to use mask? If I did value =
(value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
configuration. Eg. suppose the first config is the drive strength and
second disables bias. Then on the 2nd loop mask =
PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
would be wiped.

> After done this, you will see how you can simplify and deduplicate the
> switch-cases.
>
> ...
>
> > +#ifdef CONFIG_DEBUG_FS
>
> __maybe_unused ?
>
> > +#else
> > +#define starfive_pinconf_dbg_show NULL
> > +#endif
>
> ...
>
> > +       if (gpio < 32) {
> > +               value = readl_relaxed(sfp->base + GPIO_DIN_LOW);
>
> > +               value = (value >> gpio) & 1U;
>
> Drop
>
> > +       } else {
> > +               value = readl_relaxed(sfp->base + GPIO_DIN_HIGH);
>
> > +               value = (value >> (gpio - 32)) & 1U;
>
> Drop
>
> > +       }
>
> > +       return value;
>
> return !!(value & BIT(gpio % 32));
>
> ...
>
> > +               if (arg == 0)
>
> > +                       return -ENOTSUPP;
>
> Shouldn't we return something else and pin control core will change it
> to something else if needed?
>
> > +               if (arg == 0)
> > +                       return -ENOTSUPP;
>
> Ditto.
>
> > +       default:
> > +               return -ENOTSUPP;
>
> ...
>
> > +       if (gpio < 0 || gpio >= MAX_GPIO)
> > +               return;
> > +
> > +       if (gpio < 32) {
> > +               ie = sfp->base + IRQ_ENABLE_LOW;
> > +               mask = BIT(gpio);
> > +       } else {
> > +               ie = sfp->base + IRQ_ENABLE_HIGH;
> > +               mask = BIT(gpio - 32);
> > +       }
>
> See below. And update all occurrences of these lines accordingly and
> everywhere. Also for IRQ may use helper functions if needed (but I
> don't believe the high and low register have stride more than 4).
>
> ...
>
> > +       if (gpio < 0 || gpio >= MAX_GPIO)
> > +               return -EINVAL;
>
> How is it possible to be ever triggered?
>
> ...
>
> > +       if (gpio < 32) {
> > +               base = sfp->base;
> > +               mask = BIT(gpio);
> > +       } else {
> > +               base = sfp->base + 4;
> > +               mask = BIT(gpio - 32);
> > +       }
>
> base = sfp_base + 4 * (gpio / 32);
> mask = BIT(gpio % 32);
>
> ...
>
> > +               irq_set_handler_locked(d, handle_edge_irq);
>
> > +               irq_set_handler_locked(d, handle_edge_irq);
>
> Dup.
>
> ...
>
> > +               irq_set_handler_locked(d, handle_edge_irq);
>
> > +               irq_set_handler_locked(d, handle_level_irq);
>
> > +               irq_set_handler_locked(d, handle_level_irq);
>
> Ditto.
>
> ...
>
> > +               irq_set_handler_locked(d, handle_bad_irq);
>
> Why is this here? Move it to ->probe().
>
> ...
>
> > +       clk = devm_clk_get(dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               ret = PTR_ERR(clk);
>
> > +               dev_err(dev, "could not get clock: %d\n", ret);
>
> Thank you for spamming logs with this noise.
>
> > +               return ret;
>
> Hint: return dev_err_probe(). Ditto for the rest in this function.
>
> > +       }
>
> ...
>
> > +       ret = clk_prepare_enable(clk);
> > +       if (ret) {
>
> > +               reset_control_deassert(rst);
>
> Use devm_add_action_or_reset().

I don't see how that is better. Then I'd first need to call that and
check for errors, but just on the line below enabling the clock the
reset line is deasserted anyway, so then the action isn't needed any
longer. So that 3 lines of code for devm_add_action_or_reset +
lingering unneeded action or code to remove it again vs. just the line
above.

> > +               dev_err(dev, "could not enable clock: %d\n", ret);
> > +               return ret;
> > +       }
>
> ...
>
> > +       if (!of_property_read_u32(dev->of_node, "starfive,signal-group", &value)) {
>
> Can be refactored without conditional. Also, why not to use
> device_property_read_u32()?
>
> > +               if (value <= 6)
> > +                       writel(value, sfp->padctl + IO_PADSHARE_SEL);
> > +               else
>
> > +                       dev_err(dev, "invalid signal group %u\n", value);
>
> Why _err if you not bail out here?
>
> > +       }
>
> ...
>
> > +       value = readl(sfp->padctl + IO_PADSHARE_SEL);
> > +       switch (value) {
> > +       case 0:
> > +               sfp->gpios.pin_base = 0x10000;
>
> Magic number!
>
> > +               goto done;
> > +       case 1:
> > +               sfp->gpios.pin_base = PAD_GPIO(0);
> > +               break;
> > +       case 2:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(72);
> > +               break;
> > +       case 3:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(70);
> > +               break;
> > +       case 4: case 5: case 6:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(0);
> > +               break;
> > +       default:
> > +               dev_err(dev, "invalid signal group %u\n", value);
> > +               return -EINVAL;
> > +       }
>
> ...
>
> > +       sfp->gc.of_node = dev->of_node;
>
> Isn't GPIO library do this for you?

If it does I can't find it.

>
> ...
>
> > +       starfive_irq_chip.parent_device = dev;
>
> Ditto?
>
> ...
>
> > +       sfp->gc.irq.parents =
> > +               devm_kcalloc(dev, 1, sizeof(*sfp->gc.irq.parents), GFP_KERNEL);
>
> 1 -> sfp->gc.irq.num_parents
> And hence move below line up.
>
> > +       if (!sfp->gc.irq.parents)
> > +               return -ENOMEM;
>
> > +       sfp->gc.irq.num_parents = 1;
>
> ...
>
> > +       dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", sfp->gc.ngpio);
>
> Redundant noise.
>
> ...
>
> > +static const struct of_device_id starfive_of_match[] = {
> > +       { .compatible = "starfive,jh7100-pinctrl" },
>
> > +       { /* sentinel */ },
>
> No comma needed for terminator entry.
>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko

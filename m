Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC231103D0
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2019 18:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfLCRqq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Dec 2019 12:46:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:58582 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbfLCRqp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 3 Dec 2019 12:46:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7912AB221D;
        Tue,  3 Dec 2019 17:46:42 +0000 (UTC)
Subject: Re: [PATCH 4/6] clk: realtek: add reset controller support for
 Realtek SoCs
To:     James Tai <james.tai@realtek.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org,
        cylee12 <cylee12@realtek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20191203074513.9416-1-james.tai@realtek.com>
 <20191203074513.9416-5-james.tai@realtek.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <304f5a33-e809-c65a-9872-2176c985e3d3@suse.de>
Date:   Tue, 3 Dec 2019 18:46:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203074513.9416-5-james.tai@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi James,

[dropping Palmer, adding Philipp]

$subject: I prefer to have the subject start with uppercase letter, to
clearly distinguish it from the lowercase prefixes (and because that's
how a book or newspaper headline would start, too). Applies also to
other patches in this series, e.g., "reset: Add ..." (cf. below).

Am 03.12.19 um 08:45 schrieb James Tai:
> From: cylee12 <cylee12@realtek.com>

--author.

> 
> This patch add reset control support for Realtek SoCs.

Please don't write "This patch" in a Git commit message. You can
elegantly avoid the patch vs. commit topic by using "This adds" (and
note the grammar for third-person presence vs. imperative in subject).

All SoCs since the beginning of time or just RTD1619 and later?
As you know, we're already using reset-simple driver for RTD1295.

> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: James Tai <james.tai@realtek.com>
> ---
>  drivers/clk/realtek/Kconfig  |   1 +
>  drivers/clk/realtek/Makefile |   1 +
>  drivers/clk/realtek/reset.c  | 107 +++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/reset.h  |  37 ++++++++++++

Why in the world under clk? I just introduced syscon nodes to cleanly
allow accessing CRT and Iso registers from multiple independent drivers,
and I have patches doing exactly that for RTD1295 and RTD1195. Please
move it into drivers/reset/, also to make sure that for v2 the reset
maintainers actually get CC'ed for review.

>  4 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/realtek/reset.c
>  create mode 100644 drivers/clk/realtek/reset.h
> 
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index 5bca757dddfa..8e7e7edf64dd 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config COMMON_CLK_REALTEK
>  	bool "Clock driver for realtek"
> +	select RESET_CONTROLLER

No!

BTW if you would make this Kconfig option "depends on ARCH_REALTEK" then
it would be selected already. However, ARCH_REALTEK || COMPILE_TEST
would be preferable for noticing errors early. It doesn't make sense to
allow selecting this driver for non-Realtek systems unless COMPILE_TEST
asks for it.

>  	select MFD_SYSCON
>  
>  config CLK_PLL_PSAUD
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 050d450db067..43f8bd71c0c8 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -7,3 +7,4 @@ clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-$(CONFIG_CLK_PLL_PSAUD) += clk-pll-psaud.o
>  clk-rtk-$(CONFIG_CLK_PLL_DIF) += clk-pll-dif.o
> +clk-rtk-y += reset.o
> diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
> new file mode 100644
> index 000000000000..3f4d1a723b2a
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Is GPL-2.0-or-later possible?

> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/of.h>
> +#include <linux/device.h>

Sort order.

> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>

White line please ...

> +#include "reset.h"

... or better try to avoid this #include by driver design.

> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,

rtd1619_?

> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);

_controller vs. _data looks weird.

> +	struct rtk_reset_bank *bank = &data->banks[idx >> 8];
> +	uint32_t id   = idx & 0xff;
> +	uint32_t mask = bank->write_en ? (0x3 << id) : BIT(id);
> +	uint32_t val  = bank->write_en ? (0x2 << id) : 0;

Peeking into patch 5/6, write_en seems always 1 for CRT and 0 for a
single ISO bank.

Wouldn't it be easier to just keep two different drivers, one for
RTD1619-and-later with the new semantics, and one for the older simpler
semantics? I was really just waiting for you to post a trivial patch
that with an ack from Rob Philipp and I could apply right away. This
here is huge and I don't think you realize yet how convoluted this is
for trying to merge this into mainline within one merge window...

> +
> +	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank = &data->banks[idx >> 8];
> +	uint32_t id   = idx & 0xff;
> +	uint32_t mask = bank->write_en ? (0x3 << id) : BIT(id);
> +	uint32_t val  = mask;
> +
> +	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
> +}

The way I first read this code, there's one bit BIT(1) for writing the
new status and one bit BIT(0) for checking current status? Shouldn't
enable/disable then poll for the change to go into effect before
returning? Otherwise the caller may make wrong assumptions.

Or is this like the write_data bit for the irq mux ISR but in bit 1?
Then I am having trouble following this code and wonder why you use
regmap_update_bits() in the first place, if only some bits get written
anyway - use plain regmap_write() then. If I am puzzled, having seen the
other code, then consider it badly maintainable for the community...

You need to make the code self-documenting by using symbolic constants
instead of magic numbers, or add an inline helper. Maybe add comments.

> +
> +static int rtk_reset_reset(struct reset_controller_dev *rcdev,
> +			   unsigned long idx)
> +{
> +	int ret;
> +
> +	ret = rtk_reset_assert(rcdev, idx);
> +	if (ret)
> +		return ret;
> +
> +	return rtk_reset_deassert(rcdev, idx);
> +}

Does the reset core not do this for us? (If not, shouldn't we fix that?)

> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_bank *bank = &data->banks[idx >> 8];
> +	uint32_t id = idx & 0xff;
> +	uint32_t val;
> +
> +	regmap_read(data->regmap, bank->ofs, &val);
> +	return !((val >> id) & 1);

	return !(val & BIT(id)); seems much more readable to me?

Without seeing bit 0 read here, the above enable/disable code would be
even more confusing.

Please share what the register bits are actually called, then we can
discuss what the best way of calling and using them will be.

> +}
> +
> +static struct reset_control_ops rtk_reset_ops = {
> +	.assert   = rtk_reset_assert,
> +	.deassert = rtk_reset_deassert,
> +	.reset    = rtk_reset_reset,
> +	.status   = rtk_reset_status,
> +};
> +
> +static int rtk_of_reset_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
> +	int val;
> +
> +	val = reset_spec->args[0];
> +	if (val >= rcdev->nr_resets)
> +		return -EINVAL;
> +
> +	if (data->id_xlate)
> +		return data->id_xlate(val);

This does not appear to be used in this series - how do you envision it
to be used? That would need to be covered in the dt-binding then.

> +	return val;
> +}
> +
> +
> +int rtk_reset_controller_add(struct device *dev, struct regmap *regmap,
> +			     struct rtk_reset_initdata *initdata)

Just get that initdata via DT compatible within this reset driver, like
I did for irqchip.

> +{
> +	struct rtk_reset_data *data;
> +	struct device_node *np = dev->of_node;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->regmap    = regmap;
> +	data->num_banks = initdata->num_banks;
> +	data->banks     = initdata->banks;
> +	data->id_xlate  = initdata->id_xlate;
> +
> +	data->rcdev.owner     = THIS_MODULE;
> +	data->rcdev.ops       = &rtk_reset_ops;
> +	data->rcdev.of_node   = np;
> +	data->rcdev.nr_resets = initdata->num_banks * 0x100;

This design doesn't make much sense to me? At most a bank is going to
get you 32 resets, 16 in case of the new ones, all much smaller than 256.

The theoretical-here case of mixed sizes you could just handle by
exposing them as individual DT nodes, like we do today, which as a bonus
would make the syscon DT node nicely self-documenting. I.e.,
"realtek,rtd1619-reset" vs. "realtek,rtd1195-reset".

> +	data->rcdev.of_xlate  = rtk_of_reset_xlate;
> +	data->rcdev.of_reset_n_cells = 1;
> +
> +	return reset_controller_register(&data->rcdev);
> +}
> +

Trailing white line.

I would expect a platform_driver here, turning above _add into _probe.

> diff --git a/drivers/clk/realtek/reset.h b/drivers/clk/realtek/reset.h
> new file mode 100644
> index 000000000000..f0cc7b1045ee
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_RESET_H
> +#define __CLK_REALTEK_RESET_H
> +
> +#include <linux/reset-controller.h>
> +
> +struct rtk_reset_bank {
> +	uint32_t ofs;
> +	uint32_t write_en;

If we needed this, it might as well be bool with true/false.

> +};
> +
> +struct rtk_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct rtk_reset_bank *banks;

const?

> +	uint32_t num_banks;
> +	struct regmap *regmap;
> +	unsigned long (*id_xlate)(unsigned long id);

Drop until used?

> +};
> +
> +#define to_rtk_reset_controller(r) \
> +	container_of(r, struct rtk_reset_data, rcdev)
> +
> +struct rtk_reset_initdata {
> +	struct rtk_reset_bank *banks;

const?

> +	uint32_t num_banks;
> +	unsigned long (*id_xlate)(unsigned long id);

Drop until used?

> +};
> +
> +int rtk_reset_controller_add(struct device *dev, struct regmap *regmap,
> +			     struct rtk_reset_initdata *initdata);
> +
> +#endif /* __CLK_REALTEK_RESET_H */

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)

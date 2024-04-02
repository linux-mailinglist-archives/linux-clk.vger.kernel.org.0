Return-Path: <linux-clk+bounces-5292-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95297894F3A
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 11:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4912D2822DC
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ACC59162;
	Tue,  2 Apr 2024 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bR5DuJwZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F159155
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051763; cv=none; b=XxbvVaBThJcPqvbDPcRnmVDOttlvzI5r1vomDXv/3OO+DVxo9cEnsteUDgRFPc2CL6TYKXrz45+0acIRWSXhBJcROBo9bkDzMNp0ewlwGkbvQhvkMFG3USwBwGCu8Qyn3mQW7dS2DIH21s2SaeDfpkA9VyfGOKrXp1UYu7ht8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051763; c=relaxed/simple;
	bh=Zg/Nb5z09BCSjx6bM5WAlBfOZLieZhq5ePODfH3K2IA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=cB7akgw5uZA5uHknxJ7rmxR2awqPALgL/9KJik6Ae58TuFISNoFzMn552n9hlaoCqc4aFzJ+r39DvbgcPkoygPBKX4cUHNmaJTzlR3OEaaVpiHNclPIQ1FyvgnTGgGPSaq1gXI8Dl2/K3zMXKXyYN8dcIkkpyYbHJ3iRAWmgFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bR5DuJwZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d476d7972aso71457661fa.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712051758; x=1712656558; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=teUovhhU7jYUUy+FMKkZRNnju8wwgimsa3+RBtigHlI=;
        b=bR5DuJwZG4ztgrT8CtlDO9GUA8kTP9S4mDcXW4NaHOFqDKqy6svU+TmJcjYKFFppIq
         YD8z8OSQ7xh4w7XS+3BSffBtWS7DUTZO8fhiX8stlzueQ3oEOnLiVR09dspzB1TDKXaE
         +cJyBoUkgcu7fTHzReQJydnq8OHbYrbcEoMhHx6qk3moJX0j+i3gbVVgGxNEfzKZEmvK
         yU3m9ShWP7BA97CdT1n8ZycMgr4RxLz8Bl7Oc8EscYu1A3J69c0ksp27clf9x2SgUOzr
         lLKTtYP3qlm6YA0zQQ/GK4V+WhSSUwHeNkG9/PLvwq6/sBYAju9awtlCf7EV0KqP8QYu
         b+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051758; x=1712656558;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teUovhhU7jYUUy+FMKkZRNnju8wwgimsa3+RBtigHlI=;
        b=uoTutmHBTdmKE/bJLXTyUYoBd6XPP2uJA6dyrN6iQ2dIYGwcLggPgustWd8SLQ+JEf
         awg/tbWsAC/z7DIurpdQYjf7iumk8cHf6A6q3FkDAtqOV9R01DlX38RdxOv36oYBIaJm
         9tUMW11srsR1z2jV+o9rPTisSa8hYoJVbhVYU+NY2lsWP3DB53VLJBsYUocwCGjw9iDt
         LXlLRRf0zvD7ojsgjrL+U68/V/9cHhmJUTScIfo/hQ2r5jX6tyE4ispB6XSnyO9JTduB
         +O96BY4abnyxxSy1cter4ANM/yh/k27MP53mg06EQpxPzsJjwdOuVkwZIVU31d1vhhJi
         eHHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLkj3gu9IJCbxYIcAcO9eboHhIDvKhVCUxY7p0TQtv3GwGB9Loz33LVKxblGBbmi9uGJ4PayMRxZkPzFehwtQhmJLVTT6D/wRm
X-Gm-Message-State: AOJu0YwilAoF0slwnUHWtBlnHRo5j0b69koInp811g+5iJgFlzaweG+Z
	0kbLzUfDPt8Oj88aYCSmTj/qgicuuPux6LDJZZEdrOkSkmeKDDiyPiN1/2ytHYA=
X-Google-Smtp-Source: AGHT+IFQ5H9jjQaRDQfxnu5M7E3EpzbSkR0hU/BZVBKm4eVRViJzbyBhUMfkzGcNYsqZCD+4X62LGA==
X-Received: by 2002:a05:651c:ca:b0:2d8:8e5:58a4 with SMTP id 10-20020a05651c00ca00b002d808e558a4mr5816497ljr.49.1712051758290;
        Tue, 02 Apr 2024 02:55:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db22:d5c9:a527:a4cf])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b0041547cdfbc7sm9044730wmj.0.2024.04.02.02.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:55:57 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-7-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
Date: Tue, 02 Apr 2024 11:35:49 +0200
In-reply-to: <20240329205904.25002-7-ddrokosov@salutedevices.com>
Message-ID: <1jv850hyvm.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 29 Mar 2024 at 23:58, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The CPU clock controller plays a general role in the Amlogic A1 SoC
> family by generating CPU clocks. As an APB slave module, it offers the
> capability to inherit the CPU clock from two sources: the internal fixed
> clock known as 'cpu fixed clock' and the external input provided by the
> A1 PLL clock controller, referred to as 'syspll'.
>
> It is important for the driver to handle cpu_clk rate switching
> effectively by transitioning to the CPU fixed clock to avoid any
> potential execution freezes.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/Kconfig  |  10 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/a1-cpu.c | 324 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-cpu.h |  16 ++
>  4 files changed, 351 insertions(+)
>  create mode 100644 drivers/clk/meson/a1-cpu.c
>  create mode 100644 drivers/clk/meson/a1-cpu.h
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 80c4a18c83d2..148d4495eee3 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -111,6 +111,16 @@ config COMMON_CLK_AXG_AUDIO
>  	  Support for the audio clock controller on AmLogic A113D devices,
>  	  aka axg, Say Y if you want audio subsystem to work.
>  
> +config COMMON_CLK_A1_CPU
> +	tristate "Amlogic A1 SoC CPU controller support"
> +	depends on ARM64
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	help
> +	  Support for the CPU clock controller on Amlogic A113L based
> +	  device, A1 SoC Family. Say Y if you want A1 CPU clock controller
> +	  to work.
> +
>  config COMMON_CLK_A1_PLL
>  	tristate "Amlogic A1 SoC PLL controller support"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 4968fc7ad555..2a06eb0303d6 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_AUDIO_RSTC) += meson-audio-rstc.o
>  
>  obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
> +obj-$(CONFIG_COMMON_CLK_A1_CPU) += a1-cpu.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_A1_AUDIO) += a1-audio.o
> diff --git a/drivers/clk/meson/a1-cpu.c b/drivers/clk/meson/a1-cpu.c
> new file mode 100644
> index 000000000000..5f5d8ae112e5
> --- /dev/null
> +++ b/drivers/clk/meson/a1-cpu.c
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Amlogic A1 SoC family CPU Clock Controller driver.
> + *
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include "a1-cpu.h"
> +#include "clk-regmap.h"
> +#include "meson-clkc-utils.h"
> +
> +#include <dt-bindings/clock/amlogic,a1-cpu-clkc.h>
> +
> +static u32 cpu_fsource_sel_table[] = { 0, 1, 2 };
> +static const struct clk_parent_data cpu_fsource_sel_parents[] = {
> +	{ .fw_name = "xtal" },
> +	{ .fw_name = "fclk_div2" },
> +	{ .fw_name = "fclk_div3" },
> +};
> +
> +static struct clk_regmap cpu_fsource_sel0 = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x3,
> +		.shift = 0,
> +		.table = cpu_fsource_sel_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsource_sel0",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = cpu_fsource_sel_parents,
> +		.num_parents = ARRAY_SIZE(cpu_fsource_sel_parents),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fsource_div0 = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.shift = 4,
> +		.width = 6,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsource_div0",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cpu_fsource_sel0.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fsel0 = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 2,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsel0",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cpu_fsource_sel0.hw,
> +			&cpu_fsource_div0.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fsource_sel1 = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x3,
> +		.shift = 16,
> +		.table = cpu_fsource_sel_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsource_sel1",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = cpu_fsource_sel_parents,
> +		.num_parents = ARRAY_SIZE(cpu_fsource_sel_parents),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fsource_div1 = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.shift = 20,
> +		.width = 6,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsource_div1",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cpu_fsource_sel1.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fsel1 = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 18,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fsel1",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cpu_fsource_sel1.hw,
> +			&cpu_fsource_div1.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_fclk = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 10,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_fclk",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cpu_fsel0.hw,
> +			&cpu_fsel1.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap cpu_clk = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CPUCTRL_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 11,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &cpu_fclk.hw },
> +			{ .fw_name = "sys_pll", },
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> +	},
> +};
> +
> +/* Array of all clocks registered by this provider */
> +static struct clk_hw *a1_cpu_hw_clks[] = {
> +	[CLKID_CPU_FSOURCE_SEL0]	= &cpu_fsource_sel0.hw,
> +	[CLKID_CPU_FSOURCE_DIV0]	= &cpu_fsource_div0.hw,
> +	[CLKID_CPU_FSEL0]		= &cpu_fsel0.hw,
> +	[CLKID_CPU_FSOURCE_SEL1]	= &cpu_fsource_sel1.hw,
> +	[CLKID_CPU_FSOURCE_DIV1]	= &cpu_fsource_div1.hw,
> +	[CLKID_CPU_FSEL1]		= &cpu_fsel1.hw,
> +	[CLKID_CPU_FCLK]		= &cpu_fclk.hw,
> +	[CLKID_CPU_CLK]			= &cpu_clk.hw,
> +};
> +
> +static struct clk_regmap *const a1_cpu_regmaps[] = {
> +	&cpu_fsource_sel0,
> +	&cpu_fsource_div0,
> +	&cpu_fsel0,
> +	&cpu_fsource_sel1,
> +	&cpu_fsource_div1,
> +	&cpu_fsel1,
> +	&cpu_fclk,
> +	&cpu_clk,
> +};
> +
> +static struct regmap_config a1_cpu_regmap_cfg = {
> +	.reg_bits   = 32,
> +	.val_bits   = 32,
> +	.reg_stride = 4,
> +	.max_register = CPUCTRL_CLK_CTRL1,
> +};
> +
> +static struct meson_clk_hw_data a1_cpu_clks = {
> +	.hws = a1_cpu_hw_clks,
> +	.num = ARRAY_SIZE(a1_cpu_hw_clks),
> +};
> +
> +struct a1_cpu_clk_nb_data {
> +	const struct clk_ops *mux_ops;

That's fishy ...

> +	struct clk_hw *cpu_clk;
> +	struct notifier_block nb;
> +	u8 parent;
> +};
> +
> +#define MESON_A1_CPU_CLK_GET_PARENT(nbd) \
> +	((nbd)->mux_ops->get_parent((nbd)->cpu_clk))
> +#define MESON_A1_CPU_CLK_SET_PARENT(nbd, index) \
> +	((nbd)->mux_ops->set_parent((nbd)->cpu_clk, index))

... Directly going for the mux ops ??!?? No way !

We have a framework to handle the clocks, the whole point is to use it,
not bypass it ! 

> +
> +static int meson_a1_cpu_clk_notifier_cb(struct notifier_block *nb,
> +					unsigned long event, void *data)
> +{
> +	struct a1_cpu_clk_nb_data *nbd;
> +	int ret = 0;
> +
> +	nbd = container_of(nb, struct a1_cpu_clk_nb_data, nb);
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		nbd->parent = MESON_A1_CPU_CLK_GET_PARENT(nbd);
> +		/* Fallback to the CPU fixed clock */
> +		ret = MESON_A1_CPU_CLK_SET_PARENT(nbd, 0);
> +		/* Wait for clock propagation */
> +		udelay(100);
> +		break;
> +
> +	case POST_RATE_CHANGE:
> +	case ABORT_RATE_CHANGE:
> +		/* Back to the original parent clock */
> +		ret = MESON_A1_CPU_CLK_SET_PARENT(nbd, nbd->parent);
> +		/* Wait for clock propagation */
> +		udelay(100);
> +		break;
> +
> +	default:
> +		pr_warn("Unknown event %lu for %s notifier block\n",
> +			event, clk_hw_get_name(nbd->cpu_clk));
> +		break;
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static struct a1_cpu_clk_nb_data a1_cpu_clk_nb_data = {
> +	.mux_ops = &clk_regmap_mux_ops,
> +	.cpu_clk = &cpu_clk.hw,
> +	.nb.notifier_call = meson_a1_cpu_clk_notifier_cb,
> +};
> +
> +static int meson_a1_dvfs_setup(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk *notifier_clk;
> +	int ret;
> +
> +	/* Setup clock notifier for cpu_clk */
> +	notifier_clk = devm_clk_hw_get_clk(dev, &cpu_clk.hw, "dvfs");
> +	if (IS_ERR(notifier_clk))
> +		return dev_err_probe(dev, PTR_ERR(notifier_clk),
> +				     "can't get cpu_clk as notifier clock\n");
> +
> +	ret = devm_clk_notifier_register(dev, notifier_clk,
> +					 &a1_cpu_clk_nb_data.nb);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "can't register cpu_clk notifier\n");
> +
> +	return ret;
> +}
> +
> +static int meson_a1_cpu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	struct regmap *map;
> +	int clkid, i, err;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "can't ioremap resource\n");
> +
> +	map = devm_regmap_init_mmio(dev, base, &a1_cpu_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
> +				     "can't init regmap mmio region\n");
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(a1_cpu_regmaps); i++)
> +		a1_cpu_regmaps[i]->map = map;
> +
> +	for (clkid = 0; clkid < a1_cpu_clks.num; clkid++) {
> +		err = devm_clk_hw_register(dev, a1_cpu_clks.hws[clkid]);
> +		if (err)
> +			return dev_err_probe(dev, err,
> +					     "clock[%d] registration failed\n",
> +					     clkid);
> +	}
> +
> +	err = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_cpu_clks);
> +	if (err)
> +		return dev_err_probe(dev, err, "can't add clk hw provider\n");

I wonder if there is a window of opportunity to poke the syspll without
your notifier here. That being said, the situation would be similar on g12.

> +
> +	return meson_a1_dvfs_setup(pdev);



> +}
> +
> +static const struct of_device_id a1_cpu_clkc_match_table[] = {
> +	{ .compatible = "amlogic,a1-cpu-clkc", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a1_cpu_clkc_match_table);
> +
> +static struct platform_driver a1_cpu_clkc_driver = {
> +	.probe = meson_a1_cpu_probe,
> +	.driver = {
> +		.name = "a1-cpu-clkc",
> +		.of_match_table = a1_cpu_clkc_match_table,
> +	},
> +};
> +
> +module_platform_driver(a1_cpu_clkc_driver);
> +MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@salutedevices.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/a1-cpu.h b/drivers/clk/meson/a1-cpu.h
> new file mode 100644
> index 000000000000..e9af4117e26f
> --- /dev/null
> +++ b/drivers/clk/meson/a1-cpu.h

There is not point putting the definition here in a header
These are clearly not going to be shared with another driver.

Please drop this file

> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Amlogic A1 CPU Clock Controller internals
> + *
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
> + */
> +
> +#ifndef __A1_CPU_H
> +#define __A1_CPU_H
> +
> +/* cpu clock controller register offset */
> +#define CPUCTRL_CLK_CTRL0	0x80
> +#define CPUCTRL_CLK_CTRL1	0x84

You are claiming the registers from 0x00 to 0x84 (included), but only
using these 2 registers ? What is the rest ? Are you sure there is only
clocks in there ?

> +
> +#endif /* __A1_CPU_H */


-- 
Jerome


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F386EE112
	for <lists+linux-clk@lfdr.de>; Tue, 25 Apr 2023 13:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbjDYLau (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Apr 2023 07:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbjDYLat (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2023 07:30:49 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FECA40FB;
        Tue, 25 Apr 2023 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682422247; x=1713958247;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FmYqY69EWPZQuRRhKhSBgTqfrn+AzXLLNT2Vyop3f9U=;
  b=iZRn81sxOnJjOjJ5iyLaUi41O6FEFNWkcBCUzXlsVueOPlUOqpGFZq7q
   t4U59yu19aNUzcuj77XpNrhDf75ixOgcgRoC7Ole872PsKvgSzCKgYlRY
   wP7iRHGcdJoKFXW9/1o9Tj82ojQa9A3DPkEnip+1PgcxaN+qrXD0/8PZh
   5OL15C/4wAbjvEExZZIcyPGQAo7XkeAGIu1/hLHA63J8dtQm4NQKaAMeo
   JcoEy7Gf+kiSK8ZNtdSP0K+pw7JOiqT41UUJTthxMJGLyhqY1AQUVx1CD
   yh2gXQ7jR5HBX/sWw2MuIoQrsIWwLP8flm6FThX5W077Wy6NfmYg21vob
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409684192"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409684192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867846685"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="867846685"
Received: from rolfneux-mobl.ger.corp.intel.com ([10.252.34.113])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:30:38 -0700
Date:   Tue, 25 Apr 2023 14:30:36 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Jacky Huang <ychuang570808@gmail.com>
cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        arnd@arndb.de, schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v8 08/11] clk: nuvoton: Add clock driver for ma35d1 clock
 controller
In-Reply-To: <20230425102418.185783-9-ychuang570808@gmail.com>
Message-ID: <4eef3e9e-ad13-a64c-69bd-fb37b63437a5@linux.intel.com>
References: <20230425102418.185783-1-ychuang570808@gmail.com> <20230425102418.185783-9-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 25 Apr 2023, Jacky Huang wrote:

> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> The clock controller generates clocks for the whole chip, including
> system clocks and all peripheral clocks. This driver support ma35d1
> clock gating, divider, and individual PLL configuration.
> 
> There are 6 PLLs in ma35d1 SoC:
>   - CA-PLL for the two Cortex-A35 CPU clock
>   - SYS-PLL for system bus, which comes from the companion MCU
>     and cannot be programmed by clock controller.
>   - DDR-PLL for DDR
>   - EPLL for GMAC and GFX, Display, and VDEC IPs.
>   - VPLL for video output pixel clock
>   - APLL for SDHC, I2S audio, and other IPs.
> CA-PLL has only one operation mode.
> DDR-PLL, EPLL, VPLL, and APLL are advanced PLLs which have 3
> operation modes: integer mode, fraction mode, and spread specturm mode.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/nuvoton/Kconfig              |  19 +
>  drivers/clk/nuvoton/Makefile             |   4 +
>  drivers/clk/nuvoton/clk-ma35d1-divider.c | 140 ++++
>  drivers/clk/nuvoton/clk-ma35d1-pll.c     | 364 +++++++++
>  drivers/clk/nuvoton/clk-ma35d1.c         | 947 +++++++++++++++++++++++
>  6 files changed, 1475 insertions(+)
>  create mode 100644 drivers/clk/nuvoton/Kconfig
>  create mode 100644 drivers/clk/nuvoton/Makefile
>  create mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c
>  create mode 100644 drivers/clk/nuvoton/clk-ma35d1-pll.c
>  create mode 100644 drivers/clk/nuvoton/clk-ma35d1.c
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index e3ca0d058a25..401f2d800e7f 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -103,6 +103,7 @@ endif
>  obj-y					+= mstar/
>  obj-y					+= mvebu/
>  obj-$(CONFIG_ARCH_MXS)			+= mxs/
> +obj-y					+= nuvoton/
>  obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
>  obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
> diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
> new file mode 100644
> index 000000000000..9bb811d20b1c
> --- /dev/null
> +++ b/drivers/clk/nuvoton/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# common clock support for Nuvoton SoC family.
> +
> +config COMMON_CLK_NUVOTON
> +	bool "Nuvoton clock controller common support"
> +	depends on ARCH_NUVOTON || COMPILE_TEST
> +	default y
> +	help
> +	  Say y here to enable common clock controller for Nuvoton platforms.
> +
> +if COMMON_CLK_NUVOTON
> +
> +config CLK_MA35D1
> +	bool "Nuvoton MA35D1 clock controller support"
> +	default y
> +	help
> +	  Build the clock controller driver for MA35D1 SoC.
> +
> +endif
> diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
> new file mode 100644
> index 000000000000..d2c092541b8d
> --- /dev/null
> +++ b/drivers/clk/nuvoton/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1.o
> +obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1-divider.o
> +obj-$(CONFIG_ARCH_NUVOTON) += clk-ma35d1-pll.o
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> new file mode 100644
> index 000000000000..0d4d8186a85c
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Nuvoton Technology Corp.
> + * Author: Chi-Fang Li <cfli0@nuvoton.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +struct ma35d1_adc_clk_div {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +	u8 shift;
> +	u8 width;
> +	u32 mask;
> +	const struct clk_div_table *table;
> +	/* protects concurrent access to clock divider registers */
> +	spinlock_t *lock;
> +};
> +
> +struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
> +				     struct clk_hw *parent_hw, spinlock_t *lock,
> +				     unsigned long flags, void __iomem *reg,
> +				     u8 shift, u8 width, u32 mask_bit);
> +
> +static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
> +{
> +	return container_of(_hw, struct ma35d1_adc_clk_div, hw);
> +}
> +
> +static inline unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	unsigned int val;
> +	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +
> +	val = readl_relaxed(dclk->reg) >> dclk->shift;
> +	val &= clk_div_mask(dclk->width);
> +	val += 1;
> +	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> +				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> +}
> +
> +static inline long ma35d1_clkdiv_round_rate(struct clk_hw *hw,
> +					    unsigned long rate,
> +					    unsigned long *prate)
> +{
> +	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +
> +	return divider_round_rate(hw, rate, prate, dclk->table,
> +				  dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
> +}
> +
> +static inline int ma35d1_clkdiv_set_rate(struct clk_hw *hw,
> +					 unsigned long rate,
> +					 unsigned long parent_rate)
> +{
> +	int value;
> +	unsigned long flags = 0;
> +	u32 data;
> +	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +
> +	value = divider_get_val(rate, parent_rate, dclk->table,
> +				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
> +
> +	spin_lock_irqsave(dclk->lock, flags);
> +
> +	data = readl_relaxed(dclk->reg);
> +	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
> +	data |= (value - 1) << dclk->shift;
> +	data |= dclk->mask;
> +	writel_relaxed(data, dclk->reg);
> +
> +	spin_unlock_irqrestore(dclk->lock, flags);
> +	return 0;
> +}
> +
> +static const struct clk_ops ma35d1_adc_clkdiv_ops = {
> +	.recalc_rate = ma35d1_clkdiv_recalc_rate,
> +	.round_rate = ma35d1_clkdiv_round_rate,
> +	.set_rate = ma35d1_clkdiv_set_rate,
> +};
> +
> +struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
> +				     struct clk_hw *parent_hw, spinlock_t *lock,
> +				     unsigned long flags, void __iomem *reg,
> +				     u8 shift, u8 width, u32 mask_bit)
> +{
> +	struct ma35d1_adc_clk_div *div;
> +	struct clk_init_data init;
> +	struct clk_div_table *table;
> +	struct clk_parent_data pdata = { .index = 0 };
> +	u32 max_div, min_div;
> +	struct clk_hw *hw;
> +	int ret;
> +	int i;
> +
> +	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
> +	if (!div)
> +		return ERR_PTR(-ENOMEM);
> +
> +	max_div = clk_div_mask(width) + 1;
> +	min_div = 1;
> +
> +	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
> +	if (!table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < max_div; i++) {
> +		table[i].val = min_div + i;
> +		table[i].div = 2 * table[i].val;
> +	}
> +	table[max_div].val = 0;
> +	table[max_div].div = 0;
> +
> +	memset(&init, 0, sizeof(init));
> +	init.name = name;
> +	init.ops = &ma35d1_adc_clkdiv_ops;
> +	init.flags |= flags;
> +	pdata.hw = parent_hw;
> +	init.parent_data = &pdata;
> +	init.num_parents = 1;
> +
> +	div->reg = reg;
> +	div->shift = shift;
> +	div->width = width;
> +	div->mask = mask_bit ? BIT(mask_bit) : 0;
> +	div->lock = lock;
> +	div->hw.init = &init;
> +	div->table = table;
> +
> +	hw = &div->hw;
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> new file mode 100644
> index 000000000000..8ffefe285603
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Nuvoton Technology Corp.
> + * Author: Chi-Fang Li <cfli0@nuvoton.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +/* PLL frequency limits */
> +#define PLL_FREF_MAX_FREQ	200000000UL
> +#define PLL_FREF_MIN_FREQ	1000000UL
> +#define PLL_FREF_M_MAX_FREQ	40000000UL
> +#define PLL_FREF_M_MIN_FREQ	10000000UL
> +#define PLL_FCLK_MAX_FREQ	2400000000UL
> +#define PLL_FCLK_MIN_FREQ	600000000UL
> +#define PLL_FCLKO_MAX_FREQ	2400000000UL
> +#define PLL_FCLKO_MIN_FREQ	85700000UL

If there are in Hz, there would be something in include/linux/units.h to 
reduce the number of zeros here.

> +#define PLL_SS_RATE		0x77
> +#define PLL_SLOPE		0x58CFA
> +
> +#define REG_PLL_CTL0_OFFSET	0x0
> +#define REG_PLL_CTL1_OFFSET	0x4
> +#define REG_PLL_CTL2_OFFSET	0x8
> +
> +/* bit fields for REG_CLK_PLL0CTL0, which is SMIC PLL design */
> +#define SPLL0_CTL0_FBDIV	GENMASK(7, 0)
> +#define SPLL0_CTL0_INDIV	GENMASK(11, 8)
> +#define SPLL0_CTL0_OUTDIV	GENMASK(13, 12)
> +#define SPLL0_CTL0_PD		BIT(16)
> +#define SPLL0_CTL0_BP		BIT(17)
> +
> +/* bit fields for REG_CLK_PLLxCTL0 ~ REG_CLK_PLLxCTL2, where x = 2 ~ 5 */
> +#define PLL_CTL0_FBDIV		GENMASK(10, 0)
> +#define PLL_CTL0_INDIV		GENMASK(17, 12)
> +#define PLL_CTL0_MODE		GENMASK(19, 18)
> +#define PLL_CTL0_SSRATE		GENMASK(30, 20)
> +#define PLL_CTL1_PD		BIT(0)
> +#define PLL_CTL1_BP		BIT(1)
> +#define PLL_CTL1_OUTDIV		GENMASK(6, 4)
> +#define PLL_CTL1_FRAC		GENMASK(31, 24)
> +#define PLL_CTL2_SLOPE		GENMASK(23, 0)
> +
> +#define INDIV_MIN		1
> +#define INDIV_MAX		63
> +#define FBDIV_MIN		16
> +#define FBDIV_MAX		2047
> +#define FBDIV_FRAC_MIN		1600
> +#define FBDIV_FRAC_MAX		204700
> +#define OUTDIV_MIN		1
> +#define OUTDIV_MAX		7
> +
> +#define PLL_MODE_INT            0
> +#define PLL_MODE_FRAC           1
> +#define PLL_MODE_SS             2
> +
> +struct ma35d1_clk_pll {
> +	struct clk_hw hw;
> +	u32 id;
> +	u8 mode;
> +	void __iomem *ctl0_base;
> +	void __iomem *ctl1_base;
> +	void __iomem *ctl2_base;
> +};
> +
> +struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
> +				  struct clk_hw *parent_hw, void __iomem *base);
> +
> +static inline struct ma35d1_clk_pll *to_ma35d1_clk_pll(struct clk_hw *_hw)
> +{
> +	return container_of(_hw, struct ma35d1_clk_pll, hw);
> +}
> +
> +static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
> +					       unsigned long parent_rate)
> +{
> +	u32 m, n, p, outdiv;
> +	u64 pll_freq;
> +	const u32 clk_div_table[] = { 1, 2, 4, 8 };
> +
> +	if (pll0_ctl0 & SPLL0_CTL0_BP)
> +		return parent_rate;
> +
> +	n = FIELD_GET(SPLL0_CTL0_FBDIV, pll0_ctl0);
> +	m = FIELD_GET(SPLL0_CTL0_INDIV, pll0_ctl0);
> +	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
> +	outdiv = clk_div_table[p];
> +	pll_freq = (u64)parent_rate * n;
> +	do_div(pll_freq, m * outdiv);
> +	return pll_freq;
> +}
> +
> +static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl,
> +					  unsigned long parent_rate)
> +{
> +	u32 m, n, p;
> +	u64 pll_freq, x;
> +
> +	if (reg_ctl[1] & PLL_CTL1_BP)
> +		return parent_rate;
> +
> +	n = FIELD_GET(PLL_CTL0_FBDIV, reg_ctl[0]);
> +	m = FIELD_GET(PLL_CTL0_INDIV, reg_ctl[0]);
> +	p = FIELD_GET(PLL_CTL1_OUTDIV, reg_ctl[1]);
> +
> +	if (mode == PLL_MODE_INT) {
> +		pll_freq = (u64)parent_rate * n;
> +		do_div(pll_freq, m * p);
> +	} else {
> +		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> +		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
> +		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> +		pll_freq = ((u64)parent_rate * n) / 100 / m / p;

Don't rely on compiler, you need to use correct fuction to do any 
64-bit divide. Also, you probably want to do just one divide.

> +	}
> +	return pll_freq;
> +}
> +
> +static int ma35d1_pll_find_closest(struct ma35d1_clk_pll *pll, unsigned long rate,
> +				   unsigned long parent_rate, u32 *reg_ctl,
> +				   unsigned long *freq)
> +{
> +	int p, m, n;
> +	int fbdiv_min, fbdiv_max;
> +	unsigned long diff = 0xffffffff;

I'm just noting that this is not the maximum value of unsigned long with 
64-bit longs. It is probably correct as is (32-bit limiter) but please 
double check it does what you intended.

> +
> +	*freq = 0;
> +	if (rate < PLL_FCLKO_MIN_FREQ || rate > PLL_FCLKO_MAX_FREQ)
> +		return -EINVAL;
> +
> +	if (pll->mode == PLL_MODE_INT) {
> +		fbdiv_min = FBDIV_MIN;
> +		fbdiv_max = FBDIV_MAX;
> +	} else {
> +		fbdiv_min = FBDIV_FRAC_MIN;
> +		fbdiv_max = FBDIV_FRAC_MAX;
> +	}
> +
> +	for (m = INDIV_MIN; m <= INDIV_MAX; m++) {
> +		for (n = fbdiv_min; n <= fbdiv_max; n++) {
> +			for (p = OUTDIV_MIN; p <= OUTDIV_MAX; p++) {
> +				unsigned long tmp, fout;
> +				u64 fclk;
> +
> +				tmp = parent_rate / m;

64-bit divide shouldn't be left to compiler, use a 64-bit helper function.

> +				if (tmp < PLL_FREF_M_MIN_FREQ ||
> +				    tmp > PLL_FREF_M_MAX_FREQ)
> +					continue; /* constrain */
> +
> +				fclk = (u64)parent_rate * n / m;

Ditto.

> +				/* for 2 decimal places */
> +				if (pll->mode != PLL_MODE_INT)
> +					fclk /= 100;

Ditto.

> +
> +				if (fclk < PLL_FCLK_MIN_FREQ ||
> +				    fclk > PLL_FCLK_MAX_FREQ)
> +					continue; /* constrain */
> +
> +				fout = (unsigned long)(fclk / p);
> +				if (fout < PLL_FCLKO_MIN_FREQ ||
> +				    fout > PLL_FCLKO_MAX_FREQ)
> +					continue; /* constrain */
> +
> +				if (abs(rate - fout) < diff) {

diff = abs(rate - fout);
if (diff < min_diff) {


> +					reg_ctl[0] = FIELD_PREP(PLL_CTL0_INDIV, m) |
> +						     FIELD_PREP(PLL_CTL0_FBDIV, n);
> +					reg_ctl[1] = FIELD_PREP(PLL_CTL1_OUTDIV, p);
> +					*freq = fout;
> +					diff = abs(rate - fout);
> +					if (diff == 0)

min_diff = diff;
if (min_diff == 0)

You need to add the min_diff variable. Perhaps move diff variable local to 
this block.

> +						break;
> +				}
> +			}
> +		}
> +	}
> +	if (*freq == 0)
> +		return -EINVAL; /* cannot find even one valid setting */
> +	return 0;
> +}
> +
> +static int ma35d1_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 reg_ctl[3] = { 0 };
> +	unsigned long pll_freq;
> +	int ret;
> +
> +	if (parent_rate < PLL_FREF_MIN_FREQ ||
> +	    parent_rate > PLL_FREF_MAX_FREQ)
> +		return -EINVAL;
> +
> +	ret = ma35d1_pll_find_closest(pll, rate, parent_rate, reg_ctl, &pll_freq);
> +	if (ret != 0)
> +		return ret;
> +
> +	switch (pll->mode) {
> +	case PLL_MODE_INT:
> +		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_INT);
> +		break;
> +	case PLL_MODE_FRAC:
> +		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_FRAC);
> +		break;
> +	case PLL_MODE_SS:
> +		reg_ctl[0] |= FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_SS) |
> +			      FIELD_PREP(PLL_CTL0_SSRATE, PLL_SS_RATE);
> +		reg_ctl[2] = FIELD_PREP(PLL_CTL2_SLOPE, PLL_SLOPE);
> +		break;
> +	}
> +	reg_ctl[1] |= PLL_CTL1_PD;
> +
> +	writel_relaxed(reg_ctl[0], pll->ctl0_base);
> +	writel_relaxed(reg_ctl[1], pll->ctl1_base);
> +	writel_relaxed(reg_ctl[2], pll->ctl2_base);
> +	return 0;
> +}
> +
> +static unsigned long ma35d1_clk_pll_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 reg_ctl[3];
> +	unsigned long pll_freq;
> +
> +	if (parent_rate < PLL_FREF_MIN_FREQ || parent_rate > PLL_FREF_MAX_FREQ)
> +		return 0;
> +
> +	switch (pll->id) {
> +	case CAPLL:
> +		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> +		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], parent_rate);
> +		return pll_freq;
> +	case DDRPLL:
> +	case APLL:
> +	case EPLL:
> +	case VPLL:
> +		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> +		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, parent_rate);
> +		return pll_freq;
> +	}
> +	return 0;
> +}
> +
> +static long ma35d1_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long *parent_rate)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 reg_ctl[3] = { 0 };
> +	unsigned long pll_freq;
> +	long ret;
> +
> +	if (*parent_rate < PLL_FREF_MIN_FREQ || *parent_rate > PLL_FREF_MAX_FREQ)
> +		return -EINVAL;
> +
> +	ret = ma35d1_pll_find_closest(pll, rate, *parent_rate, reg_ctl, &pll_freq);
> +	if (ret != 0)
> +		return ret;
> +
> +	switch (pll->id) {
> +	case CAPLL:
> +		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> +		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], *parent_rate);
> +		return pll_freq;
> +	case DDRPLL:
> +	case APLL:
> +	case EPLL:
> +	case VPLL:
> +		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> +		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, *parent_rate);
> +		return pll_freq;
> +	}
> +	return 0;
> +}
> +
> +static int ma35d1_clk_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 val = readl_relaxed(pll->ctl1_base);
> +
> +	return val & PLL_CTL1_PD ? 0 : 1;

return !(val & PLL_CTL1_PD);

> +}
> +
> +static int ma35d1_clk_pll_prepare(struct clk_hw *hw)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 val;
> +
> +	val = readl_relaxed(pll->ctl1_base);
> +	val &= ~PLL_CTL1_PD;
> +	writel_relaxed(val, pll->ctl1_base);
> +	return 0;
> +}
> +
> +static void ma35d1_clk_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct ma35d1_clk_pll *pll = to_ma35d1_clk_pll(hw);
> +	u32 val;
> +
> +	val = readl_relaxed(pll->ctl1_base);
> +	val |= PLL_CTL1_PD;
> +	writel_relaxed(val, pll->ctl1_base);
> +}
> +
> +static const struct clk_ops ma35d1_clk_pll_ops = {
> +	.is_prepared = ma35d1_clk_pll_is_prepared,
> +	.prepare = ma35d1_clk_pll_prepare,
> +	.unprepare = ma35d1_clk_pll_unprepare,
> +	.set_rate = ma35d1_clk_pll_set_rate,
> +	.recalc_rate = ma35d1_clk_pll_recalc_rate,
> +	.round_rate = ma35d1_clk_pll_round_rate,
> +};
> +
> +static const struct clk_ops ma35d1_clk_fixed_pll_ops = {
> +	.recalc_rate = ma35d1_clk_pll_recalc_rate,
> +	.round_rate = ma35d1_clk_pll_round_rate,
> +};
> +
> +struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
> +				  struct clk_hw *parent_hw, void __iomem *base)
> +{
> +	struct ma35d1_clk_pll *pll;
> +	struct clk_parent_data pdata = { .index = 0 };
> +	struct clk_hw *hw;
> +	struct clk_init_data init;
> +	int ret;
> +
> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pll->id = id;
> +	pll->mode = u8mode;
> +	pll->ctl0_base = base + REG_PLL_CTL0_OFFSET;
> +	pll->ctl1_base = base + REG_PLL_CTL1_OFFSET;
> +	pll->ctl2_base = base + REG_PLL_CTL2_OFFSET;
> +
> +	memset(&init, 0, sizeof(init));

Add = {} to the declaration instead to get it initialized.

> +	init.name = name;
> +	init.flags = 0;
> +	pdata.hw = parent_hw;
> +	init.parent_data = &pdata;
> +	init.num_parents = 1;
> +
> +	if (id == CAPLL || id == DDRPLL)
> +		init.ops = &ma35d1_clk_fixed_pll_ops;
> +	else
> +		init.ops = &ma35d1_clk_pll_ops;
> +
> +	pll->hw.init = &init;
> +	hw = &pll->hw;
> +
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(ma35d1_reg_clk_pll);

> +static int ma35d1_clocks_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *clk_node = pdev->dev.of_node;
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	void __iomem *clk_base;
> +	static struct clk_hw **hws;
> +	static struct clk_hw_onecell_data *ma35d1_hw_data;
> +	u32 pllmode[PLL_MAX_NUM];
> +	int ret;
> +
> +	ma35d1_hw_data = devm_kzalloc(dev, struct_size(ma35d1_hw_data,
> +				      hws, CLK_MAX_IDX), GFP_KERNEL);

Not a good split of lines here, struct_size() shouldn't be split like 
that wrt. alignment.

> +	if (WARN_ON(!ma35d1_hw_data))
> +		return -ENOMEM;
> +
> +	ma35d1_hw_data->num = CLK_MAX_IDX;
> +	hws = ma35d1_hw_data->hws;
> +
> +	clk_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(clk_base))
> +		return PTR_ERR(clk_base);
> +
> +	ret = ma35d1_get_pll_setting(clk_node, pllmode);
> +	if (ret < 0) {
> +		dev_err(dev, "Invalid PLL setting!\n");
> +		return -EINVAL;
> +	}
> +

[...snip...]

Somewhere in the middle, I realized this patch must have been the 
unreadable mess one I reviewed earlier. ...It sure has come long way from 
that, it's so much easier to read now. Great work so far.

-- 
 i.


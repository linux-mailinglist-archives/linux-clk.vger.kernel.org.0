Return-Path: <linux-clk+bounces-444-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E27F44FC
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 12:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6957FB20FF3
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876955647B;
	Wed, 22 Nov 2023 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8HJ7lII"
X-Original-To: linux-clk@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37940197;
	Wed, 22 Nov 2023 03:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700653178; x=1732189178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDaQD3L3io4DrQxy2+jPfRXmkTm3EMCQZir6j3W5qHE=;
  b=G8HJ7lIIZ97INMfKBAnuvSSz7+ScSqNT42CoKpE17MuWBfqriQRz4x3m
   yjW6MmVB/bbuLAnGYanEWCzp+4zhezftzInwJEmwd/3IEryHqhKw2p0me
   jtCRy58cYbACci/nKR2Bz0Ws9JtlDrBXI1j/e+TQZ8Ot+nD+2qOtBuun9
   hj1ZpGloWHaFB0llF+NTOYX/H8aEKbGtn+7i/T3PY7R2TIPLfDSmKlo+i
   ccNE2SUuYLOOM8BDFu+qg0kNljnM5Nqce73E5mU+CMFVi0q3Tdw+w4H/u
   DVGgBbqejeY3XIMZWRA6r/ZmzSlufNLCMdSdU51zXDKP0yfrSPPrLRb8M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458532916"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="458532916"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910763331"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910763331"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:39:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r5lZt-0000000G4qY-1DtY;
	Wed, 22 Nov 2023 13:39:33 +0200
Date: Wed, 22 Nov 2023 13:39:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5 03/39] clk: ep93xx: add DT support for Cirrus EP93xx
Message-ID: <ZV3odTS-rheJX0bR@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-3-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-3-d59a76d5df29@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 11:59:41AM +0300, Nikita Shubin wrote:
> Rewrite EP93xx clock driver located in arch/arm/mach-ep93xx/clock.c
> trying to do everything the device tree way:
> 
> - provide clock acces via of
> - drop clk_hw_register_clkdev
> - drop init code and use module_auxiliary_driver

...

> +static int ep93xx_clk_enable(struct clk_hw *hw)
> +{
> +	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
> +	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
> +	unsigned long flags;
> +	u32 val;

> +	spin_lock_irqsave(&priv->lock, flags);

Have you considered to use cleanup.h and hence guard()() operator here
(and elsewhere)? Why not?

> +	regmap_read(priv->map, clk->reg, &val);
> +	val |= BIT(clk->bit_idx);
> +
> +	ep93xx_clk_write(priv, clk->reg, val);
> +
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}

...

> +static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
> +{
> +	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
> +	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (index >= 3)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +
> +	regmap_read(priv->map, clk->reg, &val);
> +	val &= ~(EP93XX_SYSCON_CLKDIV_MASK);

> +	if (index) {
> +		val |= EP93XX_SYSCON_CLKDIV_ESEL;
> +		val |= (index - 1) ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
> +	}

Maybe

	val |= index > 0 ? EP93XX_SYSCON_CLKDIV_ESEL : 0;
	val |= index > 1 ? EP93XX_SYSCON_CLKDIV_PSEL : 0;

(at least to me it looks better to understand than the original code).

> +	ep93xx_clk_write(priv, clk->reg, val);
> +
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}

...

> +	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
> +		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
> +
> +		parent_rate = clk_hw_get_rate(parent);
> +		mclk_rate = parent_rate * 2;
> +
> +		/* Try each predivider value */
> +		for (pdiv = 4; pdiv <= 6; pdiv++) {
> +			div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);

> +			if (div < 1 || div > 127)

in_range() ?

> +				continue;
> +
> +			actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
> +			if (is_best(rate, actual_rate, best_rate)) {
> +				best_rate = actual_rate;
> +				parent_rate_best = parent_rate;
> +				parent_best = parent;
> +			}
> +		}
> +	}

...

> +	regmap_read(priv->map, clk->reg, &val);
> +	pdiv = ((val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & 0x03);

Too many parentheses. Why not GENMASK(1, 0) ?

> +	div = val & GENMASK(6, 0);
> +	if (!div)
> +		return 0;

...

> +	for (pdiv = 4; pdiv <= 6; pdiv++) {
> +		div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
> +		if (div < 1 || div > 127)

in_range() ?

> +			continue;
> +
> +		actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
> +		if (abs(actual_rate - rate) < rate_err) {
> +			npdiv = pdiv - 3;
> +			ndiv = div;
> +			rate_err = abs(actual_rate - rate);
> +		}
> +	}

...

> +	/* Clear old dividers */

Not sure if additional comment is needed to explain what is magical about
bit 7...

> +	val &= ~(GENMASK(9, 0) & ~BIT(7));

...

> +	regmap_read(priv->map, clk->reg, &val);
> +	val &= ~clk->mask;
> +	for (i = 0; i < clk->num_div; i++)
> +		if (rate == DIV_ROUND_CLOSEST(parent_rate, clk->div[i])) {

> +			val |= i << clk->shift;

This is an invariant to the loop...

> +			break;
> +		}
> +
> +	if (i == clk->num_div)
> +		return -EINVAL;

...can be moved here, right?

> +	ep93xx_clk_write(priv, clk->reg, val);

...

> +	priv->fixed[EP93XX_CLK_UART] = clk_hw_register_fixed_factor(NULL, "uart", "xtali",
> +								    0, 1, clk_uart_div);

I would format like

	priv->fixed[EP93XX_CLK_UART] =
		clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1, clk_uart_div);

...

> +	struct clk_parent_data xtali = { .index = 0 };

	struct clk_parent_data xtali = { };

will suffice.

...

> +	struct clk_parent_data pdata = {};

Please, keep the style consistent, either all with or without the inner space.

...

> +	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "hclk", pll1,
> +							 0, 1, clk_h_div);

Seems you have already long lines, why not on one line here?

> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	priv->fixed[EP93XX_CLK_HCLK] = hw;

> +	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "pclk", hw,
> +							 0, 1, clk_p_div);

And here?

> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);

...

> +	clk_usb_div = (((value >> 28) & GENMASK(3, 0)) + 1);

Too many parentheses.

...

> +	 * So i set both dividers to minimum.

s/i/we/ ?

...

> +	/* ENA - Enable CLK divider. */
> +	/* PDIV - 00 - Disable clock */
> +	/* VDIV - at least 2 */
> +	/* Check and enable video clk registers */

Hmm... Why it can't be unified under a single multi-line comment?

-- 
With Best Regards,
Andy Shevchenko




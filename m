Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BFC223846
	for <lists+linux-clk@lfdr.de>; Fri, 17 Jul 2020 11:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgGQJZg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Jul 2020 05:25:36 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50945 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGQJZg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jul 2020 05:25:36 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 930011BF235;
        Fri, 17 Jul 2020 09:23:54 +0000 (UTC)
Date:   Fri, 17 Jul 2020 11:23:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/19] clk: at91: sam9x60-pll: check fcore against ranges
Message-ID: <20200717092354.GO3428@piout.net>
References: <1594812267-6697-1-git-send-email-claudiu.beznea@microchip.com>
 <1594812267-6697-7-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594812267-6697-7-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/07/2020 14:24:14+0300, Claudiu Beznea wrote:
> According to datasheet the range of 600-1200MHz is for the the

the is repeated here

> frequency generated by the fractional part of the PLL (namely
> Fcorepllck according to datasheet). With this in mind the output
> range of the PLL itself (fractional + div), taking into account
> that the diverder is 8 bits wide, is 600/256-1200Hz=2.3-1200MHz.
> 

divider

> Fixes: a436c2a447e59 ("clk: at91: add sam9x60 PLL driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 12 +++++++++++-
>  drivers/clk/at91/sam9x60.c         |  2 +-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index dfb91c190bd1..00f2afd6e9b6 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -21,6 +21,9 @@
>  #define UPLL_DIV		2
>  #define PLL_MUL_MAX		(FIELD_GET(PMC_PLL_CTRL1_MUL_MSK, UINT_MAX) + 1)
>  
> +#define FCORE_MIN		(600000000)
> +#define FCORE_MAX		(1200000000)
> +
>  #define PLL_MAX_ID		1
>  
>  struct sam9x60_pll {
> @@ -169,6 +172,7 @@ static long sam9x60_pll_get_best_div_mul(struct sam9x60_pll *pll,
>  	unsigned long bestdiv = 0;
>  	unsigned long bestmul = 0;
>  	unsigned long bestfrac = 0;
> +	unsigned long long fcore = 0;

maybe it would be best to go for u64 here as this is what you cast into
later.

>  
>  	if (rate < characteristics->output[0].min ||
>  	    rate > characteristics->output[0].max)
> @@ -213,6 +217,11 @@ static long sam9x60_pll_get_best_div_mul(struct sam9x60_pll *pll,
>  				remainder = rate - tmprate;
>  		}
>  
> +		fcore = parent_rate * (tmpmul + 1) +
> +			((u64)parent_rate * tmpfrac >> 22);
> +		if (fcore < FCORE_MIN || fcore > FCORE_MAX)
> +			continue;
> +
>  		/*
>  		 * Compare the remainder with the best remainder found until
>  		 * now and elect a new best multiplier/divider pair if the
> @@ -232,7 +241,8 @@ static long sam9x60_pll_get_best_div_mul(struct sam9x60_pll *pll,
>  	}
>  
>  	/* Check if bestrate is a valid output rate  */
> -	if (bestrate < characteristics->output[0].min ||
> +	if (fcore < FCORE_MIN || fcore > FCORE_MAX ||
> +	    bestrate < characteristics->output[0].min ||
>  	    bestrate > characteristics->output[0].max)
>  		return -ERANGE;
>  
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index 3e20aa68259f..633891b98d43 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -22,7 +22,7 @@ static const struct clk_master_layout sam9x60_master_layout = {
>  };
>  
>  static const struct clk_range plla_outputs[] = {
> -	{ .min = 300000000, .max = 600000000 },
> +	{ .min = 2343750, .max = 1200000000 },
>  };
>  
>  static const struct clk_pll_characteristics plla_characteristics = {
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A36F12E5DA
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2020 12:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgABLw6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Thu, 2 Jan 2020 06:52:58 -0500
Received: from mail.athenamail.net ([185.45.49.110]:36302 "EHLO
        mail.athenamail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgABLw6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jan 2020 06:52:58 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Jan 2020 06:52:56 EST
Received: from ATHSHREX13CAS01.ATHENAMAIL.NET (192.168.1.13) by
 ATHSHREX13CAS01.ATHENAMAIL.NET (192.168.1.13) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 12:37:53 +0100
Received: from ATHSHREX13CAS01.ATHENAMAIL.NET ([fe80::117b:6631:8abb:95b0]) by
 ATHSHREX13CAS01.ATHENAMAIL.NET ([fe80::117b:6631:8abb:95b0%13]) with mapi id
 15.00.1395.000; Thu, 2 Jan 2020 12:37:53 +0100
From:   =?iso-8859-1?Q?Karl_Rudb=E6k_Olsen?= <karl@micro-technic.com>
To:     "Alexandre Belloni <alexandre.belloni@bootlin.com>" 
        <alexandre.belloni@bootlin.com>
CC:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?iso-8859-1?Q?Karl_Rudb=E6k_Olsen?= <karl@micro-technic.com>
Subject: Re: [PATCH] clk: at91: add sama5d3 pmc driver
Thread-Topic: Re: [PATCH] clk: at91: add sama5d3 pmc driver
Thread-Index: AdXBXQO2cgxJOTGmS6OJcIa5CAybyA==
Date:   Thu, 2 Jan 2020 11:37:53 +0000
Message-ID: <a223a3f5c8b64b80afac96a5cc2206ec@ATHSHREX13CAS01.ATHENAMAIL.NET>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [89.239.201.8]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2019-12-29 21:29, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> Add a driver for the PMC clocks of the sama5d3.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

The datasheet lists the maximum peripheral clock frequencies in terms of
MCK dividers, and for those of us using MCK = 134 MHz instead of 133 MHz,
the .max values will make the peripherals run at half the possible clock.
Could we use .max values based on 134 MHz instead? Or based on 166 MHz
which is the maximum allowed MCK?

See also comments inline.

Thanks,
Karl Olsen

> ---
>  drivers/clk/at91/Makefile  |   1 +
>  drivers/clk/at91/sama5d3.c | 236 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 237 insertions(+)
>  create mode 100644 drivers/clk/at91/sama5d3.c
> 
> diff --git a/drivers/clk/at91/Makefile b/drivers/clk/at91/Makefile
> index 3732241352ce..e3be7f40f79e 100644
> --- a/drivers/clk/at91/Makefile
> +++ b/drivers/clk/at91/Makefile
> @@ -17,5 +17,6 @@ obj-$(CONFIG_HAVE_AT91_I2S_MUX_CLK)	+= clk-i2s-mux.o
>  obj-$(CONFIG_HAVE_AT91_SAM9X60_PLL)	+= clk-sam9x60-pll.o
>  obj-$(CONFIG_SOC_AT91SAM9) += at91sam9260.o at91sam9rl.o at91sam9x5.o
>  obj-$(CONFIG_SOC_SAM9X60) += sam9x60.o
> +obj-$(CONFIG_SOC_SAMA5D3) += sama5d3.o
>  obj-$(CONFIG_SOC_SAMA5D4) += sama5d4.o
>  obj-$(CONFIG_SOC_SAMA5D2) += sama5d2.o
> diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
> new file mode 100644
> index 000000000000..0b73c174ab56
> --- /dev/null
> +++ b/drivers/clk/at91/sama5d3.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/at91.h>
> +
> +#include "pmc.h"
> +
> +static const struct clk_master_characteristics mck_characteristics = {
> +	.output = { .min = 0, .max = 166000000 },
> +	.divisors = { 1, 2, 4, 3 },
> +};
> +
> +static u8 plla_out[] = { 0 };
> +
> +static u16 plla_icpll[] = { 0 };
> +
> +static const struct clk_range plla_outputs[] = {
> +	{ .min = 400000000, .max = 1000000000 },
> +};
> +
> +static const struct clk_pll_characteristics plla_characteristics = {
> +	.input = { .min = 8000000, .max = 50000000 },
> +	.num_output = ARRAY_SIZE(plla_outputs),
> +	.output = plla_outputs,
> +	.icpll = plla_icpll,
> +	.out = plla_out,
> +};
> +
> +static const struct clk_pcr_layout sama5d3_pcr_layout = {
> +	.offset = 0x10c,
> +	.cmd = BIT(12),
> +	.pid_mask = GENMASK(6, 0),
> +	.div_mask = GENMASK(17, 16),
> +};
> +
> +static const struct {
> +	char *n;
> +	char *p;
> +	u8 id;
> +} sama5d3_systemck[] = {
> +	{ .n = "ddrck", .p = "masterck", .id = 2 },
> +	{ .n = "lcdck", .p = "masterck", .id = 3 },
> +	{ .n = "smdck", .p = "smdclk",   .id = 4 },
> +	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> +	{ .n = "udpck", .p = "usbck",    .id = 7 },
> +	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> +	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> +	{ .n = "pck2",  .p = "prog2",    .id = 10 },
> +};
> +
> +static const struct {
> +	char *n;
> +	u8 id;
> +	struct clk_range r;
> +} sama5d3_periphck[] = {
> +	{ .n = "dbgu_clk", .id = 2, },
> +	{ .n = "hsmc_clk", .id = 5, },
> +	{ .n = "pioA_clk", .id = 6, },
> +	{ .n = "pioB_clk", .id = 7, },
> +	{ .n = "pioC_clk", .id = 8, },
> +	{ .n = "pioD_clk", .id = 9, },
> +	{ .n = "pioE_clk", .id = 10, },
> +	{ .n = "usart0_clk", .id = 12, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "usart1_clk", .id = 13, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "usart2_clk", .id = 14, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "usart3_clk", .id = 15, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "uart0_clk", .id = 16, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "uart1_clk", .id = 17, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "twi0_clk", .id = 18, .r = { .min = 0, .max = 16625000 }, },
> +	{ .n = "twi1_clk", .id = 19, .r = { .min = 0, .max = 16625000 }, },
> +	{ .n = "twi2_clk", .id = 20, .r = { .min = 0, .max = 16625000 }, },

The datasheet says max freq for TWI is MCK/4, not MCK/8.

> +	{ .n = "mci0_clk", .id = 21, },
> +	{ .n = "mci1_clk", .id = 22, },
> +	{ .n = "mci2_clk", .id = 23, },
> +	{ .n = "spi0_clk", .id = 24, .r = { .min = 0, .max = 133000000 }, },
> +	{ .n = "spi1_clk", .id = 25, .r = { .min = 0, .max = 133000000 }, },
> +	{ .n = "tcb0_clk", .id = 26, .r = { .min = 0, .max = 133000000 }, },
> +	{ .n = "tcb1_clk", .id = 27, },

tcb1_clk should also have .min and .max?

> +	{ .n = "pwm_clk", .id = 28, },
> +	{ .n = "adc_clk", .id = 29, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "dma0_clk", .id = 30, },
> +	{ .n = "dma1_clk", .id = 31, },
> +	{ .n = "uhphs_clk", .id = 32, },
> +	{ .n = "udphs_clk", .id = 33, },
> +	{ .n = "macb0_clk", .id = 34, },
> +	{ .n = "macb1_clk", .id = 35, },
> +	{ .n = "lcdc_clk", .id = 36, },
> +	{ .n = "isi_clk", .id = 37, },
> +	{ .n = "ssc0_clk", .id = 38, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "ssc1_clk", .id = 39, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "can0_clk", .id = 40, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "can1_clk", .id = 41, .r = { .min = 0, .max = 66000000 }, },
> +	{ .n = "sha_clk", .id = 42, },
> +	{ .n = "aes_clk", .id = 43, },
> +	{ .n = "tdes_clk", .id = 44, },
> +	{ .n = "trng_clk", .id = 45, },
> +	{ .n = "fuse_clk", .id = 48, },
> +	{ .n = "mpddr_clk", .id = 49, },
> +};
> +
> +static void __init sama5d3_pmc_setup(struct device_node *np)
> +{
> +	const char *slck_name, *mainxtal_name;
> +	struct pmc_data *sama5d3_pmc;
> +	const char *parent_names[5];
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	int i;
> +	bool bypass;
> +
> +	i = of_property_match_string(np, "clock-names", "slow_clk");
> +	if (i < 0)
> +		return;
> +
> +	slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
> +	if (i < 0)
> +		return;
> +	mainxtal_name = of_clk_get_parent_name(np, i);
> +
> +	regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(regmap))
> +		return;
> +
> +	sama5d3_pmc = pmc_data_allocate(PMC_MAIN + 1,
> +					nck(sama5d3_systemck),
> +					nck(sama5d3_periphck), 0);
> +	if (!sama5d3_pmc)
> +		return;
> +
> +	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +					   50000000);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	bypass = of_property_read_bool(np, "atmel,osc-bypass");
> +
> +	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name,
> +					bypass);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	parent_names[0] = "main_rc_osc";
> +	parent_names[1] = "main_osc";
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, 2);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
> +				   &sama5d3_pll_layout, &plla_characteristics);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck");
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	sama5d3_pmc->chws[PMC_UTMI] = hw;
> +
> +	parent_names[0] = slck_name;
> +	parent_names[1] = "mainck";
> +	parent_names[2] = "plladivck";
> +	parent_names[3] = "utmick";
> +	hw = at91_clk_register_master(regmap, "masterck", 4, parent_names,
> +				      &at91sam9x5_master_layout,
> +				      &mck_characteristics);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	sama5d3_pmc->chws[PMC_MCK] = hw;
> +
> +	parent_names[0] = "plladivck";
> +	parent_names[1] = "utmick";
> +	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	parent_names[0] = slck_name;
> +	parent_names[1] = "mainck";
> +	parent_names[2] = "plladivck";
> +	parent_names[3] = "utmick";
> +	parent_names[4] = "masterck";
> +	for (i = 0; i < 3; i++) {
> +		char name[6];
> +
> +		snprintf(name, sizeof(name), "prog%d", i);
> +
> +		hw = at91_clk_register_programmable(regmap, name,
> +						    parent_names, 5, i,
> +						    &at91sam9x5_programmable_layout);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(sama5d3_systemck); i++) {
> +		hw = at91_clk_register_system(regmap, sama5d3_systemck[i].n,
> +					      sama5d3_systemck[i].p,
> +					      sama5d3_systemck[i].id);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama5d3_pmc->shws[sama5d3_systemck[i].id] = hw;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(sama5d3_periphck); i++) {
> +		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
> +							 &sama5d3_pcr_layout,
> +							 sama5d3_periphck[i].n,
> +							 "masterck",
> +							 sama5d3_periphck[i].id,
> +							 &sama5d3_periphck[i].r);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama5d3_pmc->phws[sama5d3_periphck[i].id] = hw;
> +	}
> +
> +	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d3_pmc);
> +
> +	return;
> +
> +err_free:
> +	pmc_data_free(sama5d3_pmc);
> +}
> +CLK_OF_DECLARE_DRIVER(sama5d3_pmc, "atmel,sama5d3-pmc", sama5d3_pmc_setup);
> --
> 2.23.0

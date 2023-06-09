Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5968729ADB
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jun 2023 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbjFIM5m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jun 2023 08:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239410AbjFIM5h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 08:57:37 -0400
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B923A3C38;
        Fri,  9 Jun 2023 05:57:22 -0700 (PDT)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 3E7655FD25;
        Fri,  9 Jun 2023 15:57:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1686315440;
        bh=TnB5u6f/uM6MvWUYW/RGWtPuYmF/gHDyP+9UKpAc72g=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Q4omIM8RcQumx0z3D79cnmpb6unnnqT8wsrvS4BIbAzZFhV1F1S3tj91Ixsw4chfe
         sd70EbA/Qm/0sdu/3gKDYYy/pNWhkydCw188H7CcNQ66RYgywTL0b+V2eofPAVmghj
         f84ai88ghC3nHr0cO3zDyFba0CHuldJvI7vBD7Qvi9Gfga1wcfFujQKe8xtnoqiZCa
         12WVm1GpZI+uJqfHM5hXIAVvWC3eukmhQNZBQuJt7VYwjh+EJ7O2EjO6KAospQ/0S0
         mIMZFz2jJy15p4jIz3YWCmuqsZnsxISUuMPuPqdm3mlZAvVJE1NpPujZwJ59yFWwwG
         GtfrVwBJ5do6Q==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Fri,  9 Jun 2023 15:57:19 +0300 (MSK)
Date:   Fri, 9 Jun 2023 15:57:19 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     Neil Armstrong <neil.armstrong@linaro.org>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 03/18] clk: meson: migrate a1 clock drivers out of
 hw_onecell_data to drop NR_CLKS
Message-ID: <20230609125719.ji2vvcvwslrzu2oc@CAB-WSD-L081021>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-3-9676afa6b22c@linaro.org>
 <1jlegu9l5d.fsf@starbuckisacylon.baylibre.com>
 <638206ba-e2da-bb8e-a2e4-138af84648b4@linaro.org>
 <20230609114847.x24by2foebojbchq@CAB-WSD-L081021>
 <04791890-56f3-e620-1660-e8ed80eb5752@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <04791890-56f3-e620-1660-e8ed80eb5752@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/09 10:36:00 #21466178
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 09, 2023 at 02:47:04PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 09/06/2023 13:48, Dmitry Rokosov wrote:
> > Hello Neil,
> > 
> > On Thu, Jun 08, 2023 at 02:53:50PM +0200, Neil Armstrong wrote:
> > > On 08/06/2023 14:45, Jerome Brunet wrote:
> > > > > +struct meson_a1_pll_clks {
> > > > > +	struct clk_hw **hw_clks;
> > > > > +	unsigned int hw_clk_num;
> > > > > +};
> > > > > +
> > > > > +static struct meson_a1_pll_clks a1_pll_clks = {
> > > > > +	.hw_clks = a1_pll_hw_clks,
> > > > > +	.hw_clk_num = ARRAY_SIZE(a1_pll_hw_clks),
> > > > > +};
> > > > > +
> > > > > +static struct clk_hw *meson_a1_pll_hw_get(struct of_phandle_args *clkspec, void *clk_data)
> > > > > +{
> > > > > +	const struct meson_a1_pll_clks *data = clk_data;
> > > > > +	unsigned int idx = clkspec->args[0];
> > > > > +
> > > > > +	if (idx >= data->hw_clk_num) {
> > > > > +		pr_err("%s: invalid index %u\n", __func__, idx);
> > > > > +		return ERR_PTR(-EINVAL);
> > > > > +	}
> > > > > +
> > > > > +	return data->hw_clks[idx];
> > > > > +}
> > > > 
> > > > I'd prefer to have a single struct type and and single custom
> > > > callback for the different SoC please.
> > > 
> > > Sure, I've written a common code for that, but I have a hard time finding
> > > a proper naming for it... so I choosed meson-clkc since it could have
> > > more common helper code for duplicated code over the clk driver:
> > > 
> > > ===================================><============================================================================
> > > diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> > > index 8ce846fdbe43..9070dcfd9e71 100644
> > > --- a/drivers/clk/meson/Kconfig
> > > +++ b/drivers/clk/meson/Kconfig
> > > @@ -30,6 +30,9 @@ config COMMON_CLK_MESON_VID_PLL_DIV
> > >   	tristate
> > >   	select COMMON_CLK_MESON_REGMAP
> > > 
> > > +config COMMON_CLK_MESON_CLKC
> > > +	tristate
> > > +
> > >   config COMMON_CLK_MESON_AO_CLKC
> > >   	tristate
> > >   	select COMMON_CLK_MESON_REGMAP
> > > diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> > > index d5288662881d..13c6db466986 100644
> > > --- a/drivers/clk/meson/Makefile
> > > +++ b/drivers/clk/meson/Makefile
> > > @@ -1,6 +1,7 @@
> > >   # SPDX-License-Identifier: GPL-2.0-only
> > >   # Amlogic clock drivers
> > > 
> > > +obj-$(CONFIG_COMMON_CLK_MESON_CLKC) += meson-clkc.o
> > >   obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
> > >   obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
> > >   obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
> > > diff --git a/drivers/clk/meson/meson-clkc.c b/drivers/clk/meson/meson-clkc.c
> > > new file mode 100644
> > > index 000000000000..fa98b9d09011
> > > --- /dev/null
> > > +++ b/drivers/clk/meson/meson-clkc.c
> > > @@ -0,0 +1,25 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> > > + */
> > > +
> > > +#include <linux/of_device.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/module.h>
> > > +#include "meson-clkc.h"
> > > +
> > > +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
> > > +{
> > > +	const struct meson_clk_hw_data *data = clk_hw_data;
> > > +	unsigned int idx = clkspec->args[0];
> > > +
> > > +	if (idx >= data->num) {
> > > +		pr_err("%s: invalid index %u\n", __func__, idx);
> > > +		return ERR_PTR(-EINVAL);
> > > +	}
> > > +
> > > +	return data->hws[idx];
> > > +}
> > > +EXPORT_SYMBOL_GPL(meson_clk_hw_get);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/clk/meson/meson-clkc.h b/drivers/clk/meson/meson-clkc.h
> > > new file mode 100644
> > > index 000000000000..e3bad2aa17eb
> > > --- /dev/null
> > > +++ b/drivers/clk/meson/meson-clkc.h
> > > @@ -0,0 +1,19 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> > > +/*
> > > + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> > > + */
> > > +
> > > +#ifndef __MESON_HW_CLKC_H__
> > > +#define __MESON_HW_CLKC_H__
> > > +
> > > +#include <linux/of_device.h>
> > > +#include <linux/clk-provider.h>
> > > +
> > > +struct meson_clk_hw_data {
> > > +	struct clk_hw	**hws;
> > > +	unsigned int	num;
> > > +};
> > > +
> > > +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
> > > +
> > > +#endif
> > > ===================================><============================================================================
> > > 
> > > If it's ok I'll send a v2 using this.
> > > 
> > > Thanks,
> > > Neil
> > 
> > In addition, I propose consolidating the probe() routine of the a1
> > clocks into a common part, which can be utilized for s4 and other
> > similar clocks. This solution was presented in the early a1 review
> > stages of this patch set.
> > 
> > https://lore.kernel.org/linux-amlogic/20221201225703.6507-7-ddrokosov@sberdevices.ru/
> > 
> > Maybe, it can be generalized for the all meson clock controller drivers.
> > 
> 
> Sure, the goal of that is to get rid of NR_CLKS & private IDS only,
> then yes afterwards any common clkc function will be welcome !
> 
> Neil
> 

Understood, I fully endorse and support this approach!

-- 
Thank you,
Dmitry

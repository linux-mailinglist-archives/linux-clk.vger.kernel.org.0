Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753896F02BD
	for <lists+linux-clk@lfdr.de>; Thu, 27 Apr 2023 10:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242131AbjD0InC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Apr 2023 04:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242999AbjD0InA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Apr 2023 04:43:00 -0400
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D63A4C39;
        Thu, 27 Apr 2023 01:42:56 -0700 (PDT)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 22D015FD07;
        Thu, 27 Apr 2023 11:42:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1682584973;
        bh=p0nB6ehLxKbMTql7Tdal353yorBz0/HMp9iFTOlwkb4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=EEtHzldoZCAUafBeYOHAyOlEDUC/YmqqmblPpZkg+RSInztCbZx9YYQrYzU5A9mGj
         sLCtkhONHGdqQgfQMfwAdHfyJq+I6eaGigmVnfEc/70BKdn+gJk/+Jzzh0D6wzP9+U
         qwPxJFzufnUzh5ewRSOptzxPOtHY16eZPClX83xztpR/DxR9ml9Lu7H0EoZefe6xJV
         CQB/armYXGOyhHfYQEEoY1TUZgsPWxY7J/Xk0iJgmsquh3Y4DKVaBO3RPBEodmHM4b
         R0xvYa8HPcjepFEnOWXwggIcYYXIq5y+iUZThmMJd4VotxpyTEtPKH8RvLoRVKrHWQ
         2iisPGHcYZckg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Thu, 27 Apr 2023 11:42:52 +0300 (MSK)
Date:   Thu, 27 Apr 2023 11:42:52 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     Yu Tu <yu.tu@amlogic.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>
Subject: Re: [PATCH V7 4/4] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Message-ID: <20230427084252.yroo3lcu3aapid6v@CAB-WSD-L081021>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
 <20230417065005.24967-5-yu.tu@amlogic.com>
 <20230426110538.y2d4qhv2qffc62vj@CAB-WSD-L081021>
 <6cc4c3f2-4df5-6456-fe65-71aa4a13c866@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6cc4c3f2-4df5-6456-fe65-71aa4a13c866@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/27 05:34:00 #21173123
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 27, 2023 at 04:15:28PM +0800, Yu Tu wrote:
> 
> 
> On 2023/4/26 19:05, Dmitry Rokosov wrote:
> > [Some people who received this message don't often get email from ddrokosov@sberdevices.ru. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > [ EXTERNAL EMAIL ]
> > 
> > On Mon, Apr 17, 2023 at 02:50:05PM +0800, Yu Tu wrote:
> > > Add the peripherals clock controller driver in the s4 SoC family.
> > > 
> > > Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> > > ---
> > >   drivers/clk/meson/Kconfig          |   12 +
> > >   drivers/clk/meson/Makefile         |    1 +
> > >   drivers/clk/meson/s4-peripherals.c | 3814 ++++++++++++++++++++++++++++
> > >   drivers/clk/meson/s4-peripherals.h |  217 ++
> > >   4 files changed, 4044 insertions(+)
> > >   create mode 100644 drivers/clk/meson/s4-peripherals.c
> > >   create mode 100644 drivers/clk/meson/s4-peripherals.h
> > > 
> > > diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> > > index a663c90a3f3b..a6eb9fa15c74 100644
> > > --- a/drivers/clk/meson/Kconfig
> > > +++ b/drivers/clk/meson/Kconfig
> > > @@ -128,4 +128,16 @@ config COMMON_CLK_S4_PLL
> > >          aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
> > >          Say Y if you want the board to work, because plls are the parent of most
> > >          peripherals.
> > > +
> > > +config COMMON_CLK_S4
> > > +     tristate "S4 SoC Peripherals clock controllers support"
> > > +     depends on ARM64
> > > +     default y
> > > +     select COMMON_CLK_MESON_REGMAP
> > > +     select COMMON_CLK_MESON_DUALDIV
> > > +     select COMMON_CLK_MESON_VID_PLL_DIV
> > > +     help
> > > +       Support for the Peripherals clock controller on Amlogic S805X2 and S905Y4
> > > +       devices, aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
> > > +       Say Y if you want peripherals to work.
> > >   endmenu
> > > diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> > > index 376f49cc13f1..c9130afccb48 100644
> > > --- a/drivers/clk/meson/Makefile
> > > +++ b/drivers/clk/meson/Makefile
> > > @@ -20,3 +20,4 @@ obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> > >   obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
> > >   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
> > >   obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
> > > +obj-$(CONFIG_COMMON_CLK_S4) += s4-peripherals.o
> > 
> > [...]
> 
> ?
> 

I am using the above-mentioned symbols to indicate that I have removed
a portion of the previous email that is not relevant to my response.

> > 
> > > +static struct clk_regmap s4_ceca_32k_clkin = {
> > > +     .data = &(struct clk_regmap_gate_data){
> > > +             .offset = CLKCTRL_CECA_CTRL0,
> > > +             .bit_idx = 31,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data) {
> > > +             .name = "ceca_32k_clkin",
> > > +             .ops = &clk_regmap_gate_ops,
> > > +             .parent_data = (const struct clk_parent_data []) {
> > > +                     { .fw_name = "xtal", }
> > > +             },
> > > +             .num_parents = 1,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap s4_ceca_32k_div = {
> > > +     .data = &(struct meson_clk_dualdiv_data){
> > > +             .n1 = {
> > > +                     .reg_off = CLKCTRL_CECA_CTRL0,
> > > +                     .shift   = 0,
> > > +                     .width   = 12,
> > > +             },
> > > +             .n2 = {
> > > +                     .reg_off = CLKCTRL_CECA_CTRL0,
> > > +                     .shift   = 12,
> > > +                     .width   = 12,
> > > +             },
> > > +             .m1 = {
> > > +                     .reg_off = CLKCTRL_CECA_CTRL1,
> > > +                     .shift   = 0,
> > > +                     .width   = 12,
> > > +             },
> > > +             .m2 = {
> > > +                     .reg_off = CLKCTRL_CECA_CTRL1,
> > > +                     .shift   = 12,
> > > +                     .width   = 12,
> > > +             },
> > > +             .dual = {
> > > +                     .reg_off = CLKCTRL_CECA_CTRL0,
> > > +                     .shift   = 28,
> > > +                     .width   = 1,
> > > +             },
> > > +             .table = s4_32k_div_table,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "ceca_32k_div",
> > > +             .ops = &meson_clk_dualdiv_ops,
> > > +             .parent_hws = (const struct clk_hw *[]) {
> > > +                     &s4_ceca_32k_clkin.hw
> > > +             },
> > > +             .num_parents = 1,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap s4_ceca_32k_sel_pre = {
> > > +     .data = &(struct clk_regmap_mux_data) {
> > > +             .offset = CLKCTRL_CECA_CTRL1,
> > > +             .mask = 0x1,
> > > +             .shift = 24,
> > > +             .flags = CLK_MUX_ROUND_CLOSEST,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "ceca_32k_sel_pre",
> > > +             .ops = &clk_regmap_mux_ops,
> > > +             .parent_hws = (const struct clk_hw *[]) {
> > > +                     &s4_ceca_32k_div.hw,
> > > +                     &s4_ceca_32k_clkin.hw
> > > +             },
> > > +             .num_parents = 2,
> > > +             .flags = CLK_SET_RATE_PARENT,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap s4_ceca_32k_sel = {
> > > +     .data = &(struct clk_regmap_mux_data) {
> > > +             .offset = CLKCTRL_CECA_CTRL1,
> > > +             .mask = 0x1,
> > > +             .shift = 31,
> > > +             .flags = CLK_MUX_ROUND_CLOSEST,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "ceca_32k_sel",
> > > +             .ops = &clk_regmap_mux_ops,
> > > +             .parent_hws = (const struct clk_hw *[]) {
> > > +                     &s4_ceca_32k_sel_pre.hw,
> > > +                     &s4_rtc_clk.hw
> > > +             },
> > > +             .num_parents = 2,
> > > +             .flags = CLK_SET_RATE_PARENT,
> > 
> > In my opinion, all clocks that can inherit from a more accurate RTC clock
> > should be marked with the CLK_SET_RATE_NO_REPARENT flag.
> > This is necessary because in certain situations, it may be required to
> > freeze their parent. The setup of these clocks' parent should be located
> > on the device tree's side.
> 
> We don't need to freeze parent,in a real project.
> 

In my opinion, an RTC clock is more accurate and its rate can be
adjusted to a specific value. If I choose the RTC clock as the parent,
I don't want to run the rate auto-propagation for the child clock.
Otherwise, the parent can be changed to fit a specific frequency.

> > 
> > [...]
> > 
> > > +
> > > +/*
> > > + * gen clk is designed for debug/monitor some internal clock quality. Some of the
> > > + * corresponding clock sources are not described in the clock tree and internal clock
> > > + * for debug, so they are skipped.
> > > + */
> > > +static u32 s4_gen_clk_mux_table[] = { 0, 4, 5, 7, 19, 21, 22,
> > > +                                   23, 24, 25, 26, 27, 28 };
> > > +static const struct clk_parent_data s4_gen_clk_parent_data[] = {
> > > +     { .fw_name = "xtal", },
> > > +     { .hw = &s4_vid_pll.hw },
> > > +     { .fw_name = "gp0_pll", },
> > > +     { .fw_name = "hifi_pll", },
> > > +     { .fw_name = "fclk_div2", },
> > > +     { .fw_name = "fclk_div3", },
> > > +     { .fw_name = "fclk_div4", },
> > > +     { .fw_name = "fclk_div5", },
> > > +     { .fw_name = "fclk_div7", },
> > > +     { .fw_name = "mpll0", },
> > > +     { .fw_name = "mpll1", },
> > > +     { .fw_name = "mpll2", },
> > > +     { .fw_name = "mpll3", },
> > > +};
> > > +
> > > +static struct clk_regmap s4_gen_clk_sel = {
> > > +     .data = &(struct clk_regmap_mux_data){
> > > +             .offset = CLKCTRL_GEN_CLK_CTRL,
> > > +             .mask = 0x1f,
> > > +             .shift = 12,
> > > +             .table = s4_gen_clk_mux_table,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "gen_clk_sel",
> > > +             .ops = &clk_regmap_mux_ops,
> > > +             .parent_data = s4_gen_clk_parent_data,
> > > +             .num_parents = ARRAY_SIZE(s4_gen_clk_parent_data),
> > 
> > I think, the gen_clk selector should be marked with the
> > CLK_SET_RATE_NO_REPARENT flag. This is because the GEN clock can be
> > connected to an external pad and may be set up directly from the
> > device tree.
> 
> This is used by the debug table clock and is not connected externally.
> 

Sorry, I do not currently have the Y4 datasheet available.
Previously, the GEN_CLK was muxed to the GPIO on specific boards,
depending on the board layout, and I referred to this situation as
'connect to external pad'.
Therefore, I believe it would be more efficient to have the ability to
freeze the GEN_CLK parent and rate.

> > 
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap s4_gen_clk_div = {
> > > +     .data = &(struct clk_regmap_div_data){
> > > +             .offset = CLKCTRL_GEN_CLK_CTRL,
> > > +             .shift = 0,
> > > +             .width = 11,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data){
> > > +             .name = "gen_clk_div",
> > > +             .ops = &clk_regmap_divider_ops,
> > > +             .parent_hws = (const struct clk_hw *[]) {
> > > +                     &s4_gen_clk_sel.hw
> > > +             },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT,
> > > +     },
> > > +};
> > > +
> > > +static struct clk_regmap s4_gen_clk = {
> > > +     .data = &(struct clk_regmap_gate_data){
> > > +             .offset = CLKCTRL_GEN_CLK_CTRL,
> > > +             .bit_idx = 11,
> > > +     },
> > > +     .hw.init = &(struct clk_init_data) {
> > > +             .name = "gen_clk",
> > > +             .ops = &clk_regmap_gate_ops,
> > > +             .parent_hws = (const struct clk_hw *[]) {
> > > +                     &s4_gen_clk_div.hw
> > > +             },
> > > +             .num_parents = 1,
> > > +             .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> > > +     },
> > > +};
> > > +
> > 
> > [...]
> > 
> > --
> > Thank you,
> > Dmitry

-- 
Thank you,
Dmitry

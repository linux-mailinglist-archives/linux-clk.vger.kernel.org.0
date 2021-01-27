Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC7D305806
	for <lists+linux-clk@lfdr.de>; Wed, 27 Jan 2021 11:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbhA0KPP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 Jan 2021 05:15:15 -0500
Received: from inva020.nxp.com ([92.121.34.13]:36266 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235611AbhA0KNI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Jan 2021 05:13:08 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0AF821A1745;
        Wed, 27 Jan 2021 11:12:21 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F21611A1743;
        Wed, 27 Jan 2021 11:12:20 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id DCE3D20364;
        Wed, 27 Jan 2021 11:12:20 +0100 (CET)
Date:   Wed, 27 Jan 2021 12:12:20 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC] clk: Mark HW enabled clocks as enabled in core
Message-ID: <20210127101220.wuzlodquo7ix4pga@fsr-ub1664-175>
References: <1611660096-12381-1-git-send-email-abel.vesa@nxp.com>
 <20210126115105.GD28722@pengutronix.de>
 <20210126131239.uyolpawk2jfat7z4@fsr-ub1664-175>
 <20210126143017.GF28722@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126143017.GF28722@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-26 15:30:17, Sascha Hauer wrote:
> On Tue, Jan 26, 2021 at 03:12:39PM +0200, Abel Vesa wrote:
> > On 21-01-26 12:51:05, Sascha Hauer wrote:
> > > On Tue, Jan 26, 2021 at 01:21:36PM +0200, Abel Vesa wrote:
> > > > Some clocks are already enabled in HW even before the kernel
> > > > starts to boot. So, in order to make sure that these clocks do not
> > > > get disabled when clk_disable_unused call is done or when
> > > > reparenting clocks, we enable them in core on clock registration.
> > > > Such a clock will have to be registered with CLK_IGNORE_UNUSED flag
> > > > and also needs to have the is_enabled ops implemented.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > ---
> > > >  drivers/clk/clk.c | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 3d751ae5bc70..26d55851cfa5 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -3416,6 +3416,7 @@ static int __clk_core_init(struct clk_core *core)
> > > >  	int ret;
> > > >  	struct clk_core *parent;
> > > >  	unsigned long rate;
> > > > +	bool is_hw_enabled = false;
> > > >  	int phase;
> > > >  
> > > >  	if (!core)
> > > > @@ -3558,12 +3559,20 @@ static int __clk_core_init(struct clk_core *core)
> > > >  		rate = 0;
> > > >  	core->rate = core->req_rate = rate;
> > > >  
> > > > +	/*
> > > > +	 * If the clock has the CLK_IGNORE_UNUSED flag set and it is already
> > > > +	 * enabled in HW, enable it in core too so it won't get accidentally
> > > > +	 * disabled when walking the orphan tree and reparenting clocks
> > > > +	 */
> > > > +	if (core->flags & CLK_IGNORE_UNUSED && core->ops->is_enabled)
> > > > +		is_hw_enabled = clk_core_is_enabled(core);
> > > > +
> > > >  	/*
> > > >  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> > > >  	 * don't get accidentally disabled when walking the orphan tree and
> > > >  	 * reparenting clocks
> > > >  	 */
> > > > -	if (core->flags & CLK_IS_CRITICAL) {
> > > > +	if (core->flags & CLK_IS_CRITICAL || is_hw_enabled) {
> > > >  		unsigned long flags;
> > > >  
> > > >  		ret = clk_core_prepare(core);
> > > 
> > > This means that a bootloader enabled clock with CLK_IGNORE_UNUSED flag
> > > can effectively never be disabled because the prepare/enable count is 1
> > > without any user. This is the behaviour we want to have with critical
> > > clocks, but I don't think this is desired for clocks with the
> > > CLK_IGNORE_UNUSED flag.
> > > 
> > 
> > Here is the way I see it. Critical clocks means the system can't work
> > without, so do not ever disable/unprepare. The "ignore unused" flag
> > tells the core to not do anything to this clock, even if it is unused.
> > For now, it just leaves the clock alone, but the flag could be used for
> > some other stuff in the future.
> > 
> > Now, the behavior is entirely different.
> > 
> > For the "critical" clock disable/unprepare, the core does nothing
> > (returns without calling the disable/unprepare ops).
> > 
> > As for the "ignore unused", the clock can be disabled later on,
> > which would decrement the prepare/enable counter.
> > The imx earlycon serial driver could implement a late initcall,
> > that takes the clocks from the devicetree uart node and disables
> > them. The user doesn't even count in this situation.
> > 
> > Plus, there is no other reason someone would use the CLK_IGNORE_UNUSED,
> > other than leaving a clock that is already enabled stay as is (at least,
> > not with the current implementation). So why not mark it as enabled in 
> > the core, if the HW says it is enabled ?
> 
> The CLK_IGNORE_UNUSED is there from the start of the clock framework, so
> there is no commit message that tells what it shall be used for. AFAIR
> the flag was thought for being used with clocks which should not be
> disabled, but had no driver initially that used them.
> Implementation of this flag was likely broken from the start as well,
> because in this situation:
> 
>       a
>      / \
>     b   c (CLK_IGNORE_UNUSED)
> 
> When clk b is enabled/disabled then the parent of clock c is disabled as
> well, so CLK_IGNORE_UNUSED doesn't help at all. In that sense your patch
> really improves things, because the above example would be fixed.
> 
> Anyway, CLK_IGNORE_UNUSED is excessively used in the kernel, we have
> over 1000 clocks that have this flag set. With your patch all of a
> sudden all these clocks won't be disabled anymore and all these clocks
> will require some fixup to finally disable them when desired. I don't
> think this is a good idea.
> 

OK, then, how about this ?

I can add a flag to the each imx gate clock type used for each of the
uart clocks in every platform driver, flag that would say something like this:
"Mark the clock as enabled in the core if the HW says it is already enabled."
This would happen right after registration of the clock and the flag will be
imx specific (not in the core).

There would be the following advantages:
- only the uart clock that was left enabled by the bootloader will be left
on after the clk_disable_unused call
- fixing the situation where a common parent of the uart clocks is reparenting
or disabled by some other child clock.
- the platform drivers will not use the clk consumer API anymore
- any future imx platform could be using that flag for uart clocks

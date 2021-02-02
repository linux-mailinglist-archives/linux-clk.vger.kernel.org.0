Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B6730BD46
	for <lists+linux-clk@lfdr.de>; Tue,  2 Feb 2021 12:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhBBLiw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Feb 2021 06:38:52 -0500
Received: from inva020.nxp.com ([92.121.34.13]:60276 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhBBLiu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Feb 2021 06:38:50 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B01C81A0475;
        Tue,  2 Feb 2021 12:37:59 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A1EB51A03D4;
        Tue,  2 Feb 2021 12:37:59 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C142203A1;
        Tue,  2 Feb 2021 12:37:59 +0100 (CET)
Date:   Tue, 2 Feb 2021 13:37:59 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC] clk: Mark HW enabled clocks as enabled in core
Message-ID: <20210202113759.hylcsujya6ztuier@fsr-ub1664-175>
References: <1611660096-12381-1-git-send-email-abel.vesa@nxp.com>
 <20210126115105.GD28722@pengutronix.de>
 <20210126131239.uyolpawk2jfat7z4@fsr-ub1664-175>
 <20210126143017.GF28722@pengutronix.de>
 <20210127101220.wuzlodquo7ix4pga@fsr-ub1664-175>
 <20210127104720.GH28722@pengutronix.de>
 <20210127111631.htiwaxvhqtm66ntn@fsr-ub1664-175>
 <20210129081948.GF19583@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129081948.GF19583@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-29 09:19:48, Sascha Hauer wrote:
> On Wed, Jan 27, 2021 at 01:16:31PM +0200, Abel Vesa wrote:
> > On 21-01-27 11:47:20, Sascha Hauer wrote:
> > > On Wed, Jan 27, 2021 at 12:12:20PM +0200, Abel Vesa wrote:
> > > > On 21-01-26 15:30:17, Sascha Hauer wrote:
> > > > > On Tue, Jan 26, 2021 at 03:12:39PM +0200, Abel Vesa wrote:
> > > > > > On 21-01-26 12:51:05, Sascha Hauer wrote:
> > > > > > > On Tue, Jan 26, 2021 at 01:21:36PM +0200, Abel Vesa wrote:
> > > > > > > > Some clocks are already enabled in HW even before the kernel
> > > > > > > > starts to boot. So, in order to make sure that these clocks do not
> > > > > > > > get disabled when clk_disable_unused call is done or when
> > > > > > > > reparenting clocks, we enable them in core on clock registration.
> > > > > > > > Such a clock will have to be registered with CLK_IGNORE_UNUSED flag
> > > > > > > > and also needs to have the is_enabled ops implemented.
> > > > > > > > 
> > > > > > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > > > > > ---
> > > > > > > >  drivers/clk/clk.c | 11 ++++++++++-
> > > > > > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > > > > index 3d751ae5bc70..26d55851cfa5 100644
> > > > > > > > --- a/drivers/clk/clk.c
> > > > > > > > +++ b/drivers/clk/clk.c
> > > > > > > > @@ -3416,6 +3416,7 @@ static int __clk_core_init(struct clk_core *core)
> > > > > > > >  	int ret;
> > > > > > > >  	struct clk_core *parent;
> > > > > > > >  	unsigned long rate;
> > > > > > > > +	bool is_hw_enabled = false;
> > > > > > > >  	int phase;
> > > > > > > >  
> > > > > > > >  	if (!core)
> > > > > > > > @@ -3558,12 +3559,20 @@ static int __clk_core_init(struct clk_core *core)
> > > > > > > >  		rate = 0;
> > > > > > > >  	core->rate = core->req_rate = rate;
> > > > > > > >  
> > > > > > > > +	/*
> > > > > > > > +	 * If the clock has the CLK_IGNORE_UNUSED flag set and it is already
> > > > > > > > +	 * enabled in HW, enable it in core too so it won't get accidentally
> > > > > > > > +	 * disabled when walking the orphan tree and reparenting clocks
> > > > > > > > +	 */
> > > > > > > > +	if (core->flags & CLK_IGNORE_UNUSED && core->ops->is_enabled)
> > > > > > > > +		is_hw_enabled = clk_core_is_enabled(core);
> > > > > > > > +
> > > > > > > >  	/*
> > > > > > > >  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> > > > > > > >  	 * don't get accidentally disabled when walking the orphan tree and
> > > > > > > >  	 * reparenting clocks
> > > > > > > >  	 */
> > > > > > > > -	if (core->flags & CLK_IS_CRITICAL) {
> > > > > > > > +	if (core->flags & CLK_IS_CRITICAL || is_hw_enabled) {
> > > > > > > >  		unsigned long flags;
> > > > > > > >  
> > > > > > > >  		ret = clk_core_prepare(core);
> > > > > > > 
> > > > > > > This means that a bootloader enabled clock with CLK_IGNORE_UNUSED flag
> > > > > > > can effectively never be disabled because the prepare/enable count is 1
> > > > > > > without any user. This is the behaviour we want to have with critical
> > > > > > > clocks, but I don't think this is desired for clocks with the
> > > > > > > CLK_IGNORE_UNUSED flag.
> > > > > > > 
> > > > > > 
> > > > > > Here is the way I see it. Critical clocks means the system can't work
> > > > > > without, so do not ever disable/unprepare. The "ignore unused" flag
> > > > > > tells the core to not do anything to this clock, even if it is unused.
> > > > > > For now, it just leaves the clock alone, but the flag could be used for
> > > > > > some other stuff in the future.
> > > > > > 
> > > > > > Now, the behavior is entirely different.
> > > > > > 
> > > > > > For the "critical" clock disable/unprepare, the core does nothing
> > > > > > (returns without calling the disable/unprepare ops).
> > > > > > 
> > > > > > As for the "ignore unused", the clock can be disabled later on,
> > > > > > which would decrement the prepare/enable counter.
> > > > > > The imx earlycon serial driver could implement a late initcall,
> > > > > > that takes the clocks from the devicetree uart node and disables
> > > > > > them. The user doesn't even count in this situation.
> > > > > > 
> > > > > > Plus, there is no other reason someone would use the CLK_IGNORE_UNUSED,
> > > > > > other than leaving a clock that is already enabled stay as is (at least,
> > > > > > not with the current implementation). So why not mark it as enabled in 
> > > > > > the core, if the HW says it is enabled ?
> > > > > 
> > > > > The CLK_IGNORE_UNUSED is there from the start of the clock framework, so
> > > > > there is no commit message that tells what it shall be used for. AFAIR
> > > > > the flag was thought for being used with clocks which should not be
> > > > > disabled, but had no driver initially that used them.
> > > > > Implementation of this flag was likely broken from the start as well,
> > > > > because in this situation:
> > > > > 
> > > > >       a
> > > > >      / \
> > > > >     b   c (CLK_IGNORE_UNUSED)
> > > > > 
> > > > > When clk b is enabled/disabled then the parent of clock c is disabled as
> > > > > well, so CLK_IGNORE_UNUSED doesn't help at all. In that sense your patch
> > > > > really improves things, because the above example would be fixed.
> > > > > 
> > > > > Anyway, CLK_IGNORE_UNUSED is excessively used in the kernel, we have
> > > > > over 1000 clocks that have this flag set. With your patch all of a
> > > > > sudden all these clocks won't be disabled anymore and all these clocks
> > > > > will require some fixup to finally disable them when desired. I don't
> > > > > think this is a good idea.
> > > > > 
> > > > 
> > > > OK, then, how about this ?
> > > > 
> > > > I can add a flag to the each imx gate clock type used for each of the
> > > > uart clocks in every platform driver, flag that would say something like this:
> > > > "Mark the clock as enabled in the core if the HW says it is already enabled."
> > > > This would happen right after registration of the clock and the flag will be
> > > > imx specific (not in the core).
> > > 
> > > How do you want to implement the "Mark the clock as enabled in the core"
> > > part without using the clk consumer API, which is the thing you want to
> > > avoid?
> > > 
> > 
> > Hmm, this is actually a problem, there are no clk_hw enable/prepare API.
> > You are right about this one.
> > 
> > > > 
> > > > There would be the following advantages:
> > > > - only the uart clock that was left enabled by the bootloader will be left
> > > > on after the clk_disable_unused call
> > > 
> > > Actually this would be a regression compared to current upstream. Right
> > > now the UART clock is kept on until the clk_disable_unused call and
> > > disabled in that call. This is what we want, because at that time the
> > > UART driver has taken over and takes care of the clocks itself.
> > > When after clk_disable_unused() there is still a reference on the UART
> > > clock we could never turn it off.
> > 
> > They could be turned off from the late initcall from imx serial.
> > 
> > > 
> > > > - fixing the situation where a common parent of the uart clocks is reparenting
> > > > or disabled by some other child clock.
> > > 
> > > That's not an issue currently.
> > 
> > Yes, as of now, it's not an issue because we're treating the uart clocks as a
> > special case by controlling them straight from the platform driver. But I would
> > like to get rid of this special case. Why ? Because, in the future, the clock
> > drivers would only use the API from clk-provider header. The clk.h should move
> > away for good from the clock drivers.
> > 
> > > 
> > > > - the platform drivers will not use the clk consumer API anymore
> > > 
> > > I'm not sure how you want to archieve this.
> > > 
> > 
> > Basically, all the clock drivers should move towards clk_hw APIi only.
> > 
> > > > - any future imx platform could be using that flag for uart clocks
> > > 
> > > No flags are necessary currently.
> > > 
> > > What's so wrong with the way it's currently implemented? Currently with
> > > the array of possible UART clocks it's really not nice, but with Adams
> > > patch which parses the clocks directly from the device node providing
> > > the stdout UART the arrays are gone and it looks ok to me.
> > 
> > Again, the ultimate goal here is to remove every clock consumer API from
> > all the imx clock drivers. The uart clocks are, at this point, that ugly
> > special case we can't seem to get rid of. The future platforms will use
> > the same approach if we don't deal with it. At this point, the imx6/7/8
> > platforms are not entirely clk_hw based API due to this uart clocks thing.
> > I intend to move the older imx to clk_hw API and that will leave us with
> > the uart clocks being the only exception from the rule, using clock consumer
> > API, in all the imx clock platform drivers.
> 
> Technically we could move the retrieving and enabling of the early UART
> clocks away from the clock driver to the UART driver. The only reason
> that the clock setup is called from the clock driver is that we can be
> sure that the just registered clocks are not yet manipulated from other
> code before the the UART clocks can be enabled.
> 

The exact same reason I suggested we have those clocks enabled right after
registration. But since this seems to be not such an easy task, lets just
go with Adam's patches for now.

> Sascha
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.pengutronix.de%2F&amp;data=04%7C01%7Cabel.vesa%40nxp.com%7Cbeff83cd6c7043e9ca1a08d8c42ea5bb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637475051920342165%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ROtcybkweyLYIRA%2BREexDawemtSeDUPFO6zDw8ZnqLQ%3D&amp;reserved=0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

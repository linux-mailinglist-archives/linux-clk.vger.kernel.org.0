Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B2E741812
	for <lists+linux-clk@lfdr.de>; Wed, 28 Jun 2023 20:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjF1Sdn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Wed, 28 Jun 2023 14:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjF1Sdj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jun 2023 14:33:39 -0400
X-Greylist: delayed 26739 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Jun 2023 11:33:37 PDT
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C1E1FCC;
        Wed, 28 Jun 2023 11:33:37 -0700 (PDT)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
        by unicorn.mansr.com (Postfix) with ESMTPS id 2509F15360;
        Wed, 28 Jun 2023 19:33:35 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
        id 17DD3219FD1; Wed, 28 Jun 2023 19:33:35 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] clk: sunxi-ng: Convert early providers to
 platform drivers
References: <20211119033338.25486-1-samuel@sholland.org>
        <20211119033338.25486-4-samuel@sholland.org>
        <yw1xedly2z3m.fsf@mansr.com>
        <maqh4yir66agto4lyulvrqrim7qnixwd246jusvvhsjlhhrmmw@gjbubqc2cv4o>
        <yw1xa5wj3kvn.fsf@mansr.com>
        <un3xm7ybsm54qf56ojhrtr6kehlmhdoavzcaqr2jfbcyg2kr6u@rdlq7nelycs2>
Date:   Wed, 28 Jun 2023 19:33:35 +0100
In-Reply-To: <un3xm7ybsm54qf56ojhrtr6kehlmhdoavzcaqr2jfbcyg2kr6u@rdlq7nelycs2>
        (Maxime Ripard's message of "Wed, 28 Jun 2023 13:41:30 +0200")
Message-ID: <yw1x352b308w.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Maxime Ripard <mripard@kernel.org> writes:

> On Wed, Jun 28, 2023 at 12:07:56PM +0100, M�ns Rullg�rd wrote:
>> Maxime Ripard <mripard@kernel.org> writes:
>> 
>> > On Mon, Jun 26, 2023 at 01:21:33PM +0100, M�ns Rullg�rd wrote:
>> >> Samuel Holland <samuel@sholland.org> writes:
>> >> 
>> >> > The PRCM CCU drivers depend on clocks provided by other CCU drivers. For
>> >> > example, the sun8i-r-ccu driver uses the "pll-periph" clock provided by
>> >> > the SoC's main CCU.
>> >> >
>> >> > However, sun8i-r-ccu is an early OF clock provider, and many of the
>> >> > main CCUs (e.g. sun50i-a64-ccu) use platform drivers. This means that
>> >> > the consumer clocks will be orphaned until the supplier driver is bound.
>> >> > This can be avoided by converting the remaining CCUs to use platform
>> >> > drivers. Then fw_devlink will ensure the drivers are bound in the
>> >> > optimal order.
>> >> >
>> >> > The sun5i CCU is the only one which actually needs to be an early clock
>> >> > provider, because it provides the clock for the system timer. That one
>> >> > is left alone.
>> >> >
>> >> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>> >> > ---
>> >> >
>> >> > (no changes since v1)
>> >> >
>> >> >  drivers/clk/sunxi-ng/Kconfig             | 20 ++++----
>> >> >  drivers/clk/sunxi-ng/ccu-sun4i-a10.c     | 58 +++++++++++++--------
>> >> >  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   | 56 ++++++++++++--------
>> >> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c   | 33 ++++++++----
>> >> >  drivers/clk/sunxi-ng/ccu-sun6i-a31.c     | 40 +++++++++++----
>> >> >  drivers/clk/sunxi-ng/ccu-sun8i-a23.c     | 35 +++++++++----
>> >> >  drivers/clk/sunxi-ng/ccu-sun8i-a33.c     | 40 +++++++++++----
>> >> >  drivers/clk/sunxi-ng/ccu-sun8i-h3.c      | 62 ++++++++++++++--------
>> >> >  drivers/clk/sunxi-ng/ccu-sun8i-r.c       | 65 ++++++++++++++----------
>> >> >  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     | 57 +++++++++++++--------
>> >> >  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c | 38 ++++++++++----
>> >> >  11 files changed, 332 insertions(+), 172 deletions(-)
>> >> 
>> >> This broke the hstimer clocksource on A20 since it requires a clock
>> >> provided by the sun4i ccu driver.
>> >
>> > The A10 is probably broken by this, but the A20 should be able to use
>> > the arch timers just like all the other Cortex-A7-based SoCs.
>> >
>> > Do you have a dmesg log that could help debug why it's not working?
>> 
>> The A20 works as such since, as you say, it has other clocksources.
>> However, the hstimer has become unusable.  If anyone was using, for
>> whatever reason, it won't be working for them now.
>> 
>> Before this change, the kernel log used include this line:
>> 
>> clocksource: hstimer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370868154 ns
>> 
>> Now there is only a cryptic "Can't get timer clock" in its place.
>> 
>> As it is now, the hstimer driver is nothing but a waste of space.
>> I figure it ought to be fixed one way or another.
>
> Yeah, definitely.
>
> IIRC, the situation is:
>
>  - A10 has just the "regular", old, timer
>  - A10s/A13/GR8 has the A10 timer + hstimer
>  - A20 has the A13 timers + arch timers
>
> We also default to the hstimer only for the A10s/A13 which aren't
> affected by this patch series afaics.
>
> We also enable the HS timer for the A31, but just like the A20 it
> doesn't use it by default, so it's probably been broken there too.
>
> I guess one way to fix it would be to switch the HS timer driver to a
> lower priority than the A10 timer, so we pick that up by default instead
> for the A10s/A13, and then convert the HS timer driver to a proper
> platform_device driver that will be able to get its clock.
>
> The downside is that the A13 will lose some precision over its default
> timer, but I don't think it's a big deal.

The options I see are converting the hstimer to a platform device or
reverting the change to the sun4i ccu driver.

I don't personally have much of an opinion on this since my systems
aren't affected.  The only reason I looked at it was that I noticed
a new error message in the kernel logs.

-- 
M�ns Rullg�rd

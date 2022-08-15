Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E845951B3
	for <lists+linux-clk@lfdr.de>; Tue, 16 Aug 2022 07:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbiHPFKo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Aug 2022 01:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbiHPFK3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 01:10:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFDEB7D;
        Mon, 15 Aug 2022 14:17:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BAA14A8;
        Mon, 15 Aug 2022 23:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660598250;
        bh=pCnWOyYQJD4j11XgJ0GlxYcAIBMe8A6Sxydodg9cSa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gVUsIzyMoGKbH0xo1BXLI6EWSr453RLeYo6MozOHT1TRxdqNZJRRo/yuIxkYBHlv0
         yE1Ild8p7WnalT/f7wtm1cFLxW/27Hu1BfW4LKKWM6mNPgqxh8mSjsEoG2P5mx/wwk
         ki+Blo00JXPbpgGVIk59LB8Z06WIGqOQolVaEsW0=
Date:   Tue, 16 Aug 2022 00:17:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        dri-devel@lists.freedesktop.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-amlogic@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Michael Turq uette <mturquette@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        linux-hwmon@vger.kernel.org, linux-clk@vger.kernel.org,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Robert Foss <robert.foss@linaro.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220815205857.308B1C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephan,

On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2022-08-15 11:52:36)
> > On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:
> > > On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:
> > > 
> > > > - With devres, you don't have full control over the order in which
> > > >   resources will be released, which means that you can't control the
> > > >   power off sequence, in particular if it needs to be sequenced with
> > > >   GPIOs and clocks. That's not a concern for all drivers, but this API
> > > >   will creep in in places where it shouldn't be used, driver authours
> > > >   should really pay attention to power management and not live with the
> > > >   false impression that everything will be handled automatically for
> > > >   them. In the worst cases, an incorrect power off sequence could lead
> > > >   to hardware damage.
> 
> I think the main issue is that platform drivers are being asked to do
> too much. We've put the burden on platform driver authors to intimately
> understand how their devices are integrated, and as we all know they're
> not very interested in these details because they already have a hard
> time to write a driver just to make their latest gizmo whir. Throw in
> power management and you get these wrappers that try to compartmentalize
> power management logic away from the main part of the driver that's
> plugging into the driver subsystem because the SoC integration logic is
> constantly changing but the device core isn't.
> 
> We need to enhance the platform bus layer to make it SoC aware when the
> platform device is inside an SoC, or "board" aware when the device lives
> outside of an SoC, i.e. it's a discrete IC. The bus layer should manage
> power state transitions for the platform devices, and the platform
> drivers should only be able to request runtime power/performance state
> changes through device PM APIs (dev_pm_*). If this can all be done
> through genpds then it sounds great. We may need to write some generic
> code for discrete ICs that enables regulators and then clks before
> muxing out pins or something like that. Obviously, I don't have all the
> details figured out.
> 
> The basic idea is that drivers should be focused on what they're
> driving, not navigating the (sometimes) complex integration that's
> taking place around them. When a device driver probe function is called
> the device should already be powered on.

No. ACPI does that in many cases, and that's a real bad idea. There are
devices that you do *not* want to power up on probe. I'm thinking, for
example, about camera sensors that have a privacy LED that will light up
when the sensor is powered up. You don't want it to flash on boot. There
are also other use cases related to fault tolerance where you want
drivers to initialize properly and only access the device later.

> When the driver is
> removed/unbound, the power should be removed after the driver's remove
> function is called. We're only going to be able to solve the power
> sequencing and ordering problem by taking away power control and
> sequencing from drivers.

For SoC devices we may be able to achieve this to some extent, at least
for simple devices that don't have exotic requirements (by exotic I mean
requiring more than one clock for instance, so it's not *that* exotic).
For on-board devices that's impossible by nature, the power up/down
constraints are specific to the device, it's the job of the driver to
handle them, the same way it has to handle everything else that is
device-specific.

The right way to handle this in my opinion is to push for RPM support in
drivers. The regulator, reset, clock & co. handling then happens in the
RPM suspend and resume handlers, they're self-contained, well ordered,
and much easier to review. The rest of the driver then only uses the RPM
API. It's easy(er) and clean (at least when you don't throw ACPI to the
mix, with its "peculiar" idea of calling probe with the device powered
on *BUT* in the RPM suspended state - due to historical reasons I
believe - but I think that should be fixable on the ACPI side, albeit
perhaps not without substantial effort), and you get simple review
rules: if the driver doesn't implement RPM, or handles resource
enable/disable outside of the RPM suspend/resume handlers, it's most
likely getting it wrong.

These devres helpers go in the exact opposite direction of what we
should be doing, by telling driver authors it's totally fine to not
implement power management. Why don't we just drop error handling and go
back to the big kernel lock in that case ? That was much easier to
program too.

> > > I basically agree with these concerns which is why I was only happy with
> > > this API when Matti suggested doing it in a way that meant that the
> > > callers are unable to access the regulator at runtime, this means that
> > > if anyone wants to do any kind of management of the power state outside
> > > of probe and remove they are forced to convert to the full fat APIs.
> > > The general ordering concern with devm is that the free happens too late
> > > but for the most part this isn't such a concern with regulators, they
> > > might have delayed power off anyway due to sharing - it's no worse than
> > > memory allocation AFAICT.  Given all the other APIs using devm it's
> > > probably going to end up fixing some bugs.
> > > 
> > > For sequencing I'm not convinced it's much worse than the bulk API is
> > > anyway, and practically speaking I expect most devices that have
> > > problems here will also need more control over power anyway - it's
> > > certainly the common case that hardware has pretty basic requirements
> > > and is fairly tolerant.
> > 
> > I'm not extremely concerned here at the moment, as power should be the
> > last thing to be turned off, after clocks and reset signals. As clocks
> > and GPIOs will still be controlled manually in the driver .remove()
> > function, it means that power will go last, which should be fine.
> > However, should a devm_clk_get_enable() or similar function be
> 
> This API is implemented now.

:-( We're really going straight into the wall.

> > implemented, we'll run into trouble. Supplying active high input signals
> > to a device that is not powered can lead to latch-up, which tends to
> > only manifest after a statistically significant number of occurrences of
> > the condition, and can slowly damage the hardware over time. This is a
> > real concern as it will typically not be caught during early
> > development. I think we would still be better off with requiring drivers
> > to manually handle powering off the device until we provide a mechanism
> > that can do so safely in an automated way.
> 
> Can you describe the error scenario further? I think it's driver author
> error that would lead to getting and enabling the regulator after
> getting and enabling a clk that drives out a clock signal on some pins
> that aren't powered yet. I'm not sure that's all that much easier to do
> with these sorts of devm APIs, but if it is then I'm concerned.

You will very quickly see drivers doing this (either directly or
indirectly):

probe()
{
	devm_clk_get_enabled();
	devm_regulator_get_enable();
}

Without a devres-based get+enable API drivers can get the resources they
need in any order, possibly moving some of those resource acquisition
operations to different functions, and then have a clear block of code
that enables the resources in the right order. These devres helpers give
a false sense of security to driver authors and they will end up
introducing problems, the same way that devm_kzalloc() makes it
outrageously easy to crash the kernel by disconnecting a device that is
in use.

> > > > - Powering regulators on at probe time and leaving them on is a very bad
> > > >   practice from a power management point of view, and should really be
> > > >   discouraged. Adding convenience helpers to make this easy is the wrong
> > > >   message, we should instead push driver authors to implement proper
> > > >   runtime PM.
> > > 
> > > The stick simply isn't working here as far as I can see.
> > 
> > Do you think there's no way we can get it to work, instead of giving up
> > and adding an API that goes in the wrong direction ? :-( I'll give a
> > talk about the dangers of devm_* at the kernel summit, this is something
> > I can mention to raise awareness of the issue among maintainers,
> > hopefully leading to improvements through better reviews.
> 
> I agree with Mark, the stick isn't working. We discussed these exact
> same issues for years with the devm clk get APIs. Search the archives.

And the conclusion was to just give up and do nothing ? :-(

-- 
Regards,

Laurent Pinchart

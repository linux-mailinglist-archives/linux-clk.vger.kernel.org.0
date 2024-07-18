Return-Path: <linux-clk+bounces-9799-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC58934D99
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 15:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAB1FB23569
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDF8C148;
	Thu, 18 Jul 2024 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="oGEkAKCV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCB34A15;
	Thu, 18 Jul 2024 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721307665; cv=none; b=KF+rFL75UBhGA784uJDZtNt/477MW2MgUCilS8ZV6ty95EU5GVNlmgxDZ9pIAZRyABTgwks3re2lktvuW8SQUVBDwzkDRM3vFw0vXWPbjzvZUHlse1aLsfAxy5OrnQxP7hbrzmNrvK2pgx61BUVVkOWuP7yuXW8rEDmHhWO6YBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721307665; c=relaxed/simple;
	bh=Tl231XVP0qVRWk7uBsuGzX+35xw6//qwCD3LdiK7608=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HV5XIhP5IVGD0BYMVvjm6mI4z0EiaBGmPb5ZjUKj2OgohaS5kMhLNjRdCDU+6UFR3aHgyn6p04l/GLZMt/fZJkp8REV09UPpPHoG6CzcxSstIVvhbVtEtpeLRusiXjxbv4qAi6zj+QPIj7YrSS+LfC++gFaLk5YRm3Vd6tAPSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=oGEkAKCV; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1721307658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cW5PVRqeYiGydWjz4edeNsvw9kXxsN+fOTJIlfMc88g=;
	b=oGEkAKCV8D38Ei1Csmp9R7UTvGJaRzqWUGlamiANthv7k09m05s+qUtsesu9wbo634Zz8i
	g1w9grxfCpCO8zKPRTJecmFtpviL+OcDiCTV1HH3S+ZmAaxq/JYuB5scqztGtw8McdXhnh
	6JqZcKS0hxAmRvcCmcaZRdzolILpVTKw/1aOLD5A/GZIszu66ZgnoZkGANljVM6a5fyOUL
	XipDELRSGXtoYs8CNKM/2KC0OK6pywzwX+C4PeQe8geDkTYAoMVMsdvcJiX8+aF/+eBP4c
	C0lG32L84lmnxj6Kh/+0fsOWgkcza18YGoe+7Z1nUn42p4wCplOGw2yPqMc+cQ==
Date: Thu, 18 Jul 2024 15:00:57 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clocks: add binding for
 voltage-controlled-oscillators
In-Reply-To: <30200583.43St1lv6Oq@diego>
References: <20240715110251.261844-1-heiko@sntech.de>
 <3178118.zE8UqtGg2D@diego> <c60c8c462c6df23c1f1625bce5516525@manjaro.org>
 <30200583.43St1lv6Oq@diego>
Message-ID: <1d0e65a0e7797727815ff1b735e881da@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Heiko,

On 2024-07-18 13:30, Heiko Stübner wrote:
> Am Donnerstag, 18. Juli 2024, 12:53:07 CEST schrieb Dragan Simic:
>> On 2024-07-18 11:25, Heiko Stübner wrote:
>> > Am Dienstag, 16. Juli 2024, 18:15:08 CEST schrieb Conor Dooley:
>> >> On Mon, Jul 15, 2024 at 01:02:49PM +0200, Heiko Stuebner wrote:
>> >> > In contrast to fixed clocks that are described as ungateable, boards
>> >> > sometimes use additional oscillators for things like PCIe reference
>> >> > clocks, that need actual supplies to get enabled and enable-gpios to be
>> >> > toggled for them to work.
>> >> >
>> >> > This adds a binding for such oscillators that are not configurable
>> >> > themself, but need to handle supplies for them to work.
>> >> >
>> >> > In schematics they often can be seen as
>> >> >
>> >> >          ----------------
>> >> > Enable - | 100MHz,3.3V, | - VDD
>> >> >          |    3225      |
>> >> >    GND - |              | - OUT
>> >> >          ----------------
>> >> >
>> >> > or similar. The enable pin might be separate but can also just be tied
>> >> > to the vdd supply, hence it is optional in the binding.
>> >> >
>> >> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> >> > ---
>> >> >  .../bindings/clock/voltage-oscillator.yaml    | 49 +++++++++++++++++++
>> >> >  1 file changed, 49 insertions(+)
>> >> >  create mode 100644 Documentation/devicetree/bindings/clock/voltage-oscillator.yaml
>> >> >
>> >> > diff --git a/Documentation/devicetree/bindings/clock/voltage-oscillator.yaml b/Documentation/devicetree/bindings/clock/voltage-oscillator.yaml
>> >> > new file mode 100644
>> >> > index 0000000000000..8bff6b0fd582e
>> >> > --- /dev/null
>> >> > +++ b/Documentation/devicetree/bindings/clock/voltage-oscillator.yaml
>> >> > @@ -0,0 +1,49 @@
>> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> >> > +%YAML 1.2
>> >> > +---
>> >> > +$id: http://devicetree.org/schemas/clock/voltage-oscillator.yaml#
>> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> > +
>> >> > +title: Voltage controlled oscillator
>> >>
>> >> Voltage controlled oscillator? Really? That sounds far too similar to
>> >> a
>> >> VCO to me, and the input voltage here (according to the description at
>> >> least) does not affect the frequency of oscillation.
>> >
>> > That naming was suggested by Stephen in v1 [0] .
>> >
>> > Of course the schematics for the board I have only describe it as
>> > "100MHz,3.3V,3225" , thumbing through some mouser parts matching that
>> > only mentions "supply voltage" in their datasheets but not a dependency
>> > between rate and voltage.
>> >
>> > [0]
>> > https://lore.kernel.org/linux-arm-kernel/b3c450a94bcb4ad0bc5b3c7ee8712cb8.sboyd@kernel.org/
>> >
>> >> Why the dedicated binding, rather than adding a supply and enable-gpio
>> >> to the existing "fixed-clock" binding? I suspect that a large portion
>> >> of
>> >> "fixed-clock"s actually require a supply that is (effectively)
>> >> always-on.
>> >
>> > I guess there are three aspects:
>> > - I do remember discussions in the past about not extending generic
>> >   bindings with device-specific stuff. I think generic power-sequences
>> >   were the topic back then, though that might have changed over time?
>> > - There are places that describe "fixed-clock" as
>> >   "basic fixed-rate clock that cannot gate" [1]
>> > - Stephen also suggested a separate binding [2]
>> >
>> > With the fixed-clock being sort of the root for everything else on most
>> > systems, I opted to leave it alone. I guess if the consenus really is
>> > that
>> > this should go there, I can move it, but discussion in v1
>> >
>> > Interestingly the fixed clock had a gpios property 10 years ago [3] :-)
>> > .
>> >
>> > [1]
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-fixed-rate.c#n18
>> > [2]
>> > https://lore.kernel.org/linux-arm-kernel/68f6dc44a8202fd83792e58aea137632.sboyd@kernel.org/
>> > [3]
>> > https://lore.kernel.org/linux-kernel//20140515064420.9521.47383@quantum/T/#t
>> 
>> After finally going through the v1 discussion [4] in detail,
>> here are my further thoughts:
>> 
>> - I agree with dropping the Diodes stuff, [5] because I see
>>    no need for that at this point;  though, am I missing
>>    something, where are they actually used?
> 
> On the Rock5 ITX that 100MHz clock comes the one single oscillator 
> thing.
> 
> The Diodes parts are not root sources for their clocks but instead sort
> PLLs or something, though their manual describes them as
> "clock generator supporting PCI Express and Ethernet requirements" [8]
> 
> So they generate the 100MHz (frequency actually is
> selected by input pins of the chip) from a separate 25MHz source clock.
> 
> One example are the Theobroma/Cherry embedded boards changed in v1 
> where
> they currently are described via existing generic things (no 
> schematics).
> 
> Another user is the rk3568-rock3b for example, where the diodes part
> is enabled by the same rail as the port itself, so in contrast to the
> Rock 5 ITX, it works "by accident" on the rock 3b [9]

Ah, I see now, thanks for the clarification.  The way Diodes PI6C557
is used on the ROCK 3B, together with its 25 MHz "passive" crystal,
is pretty much the same as the way Aurasemi AU5426 is used on the
ROCK 5 ITX, together with its 100 MHz "active" clock generator.  All
that from the software standpoint, of course.

To explain it further, the PI6C577 and the AU5426 are the components
that actually generate the clocks for the PCIe interfaces.  Thus,
technically we should describe two components per board in their DTs:

- ROCK 5 ITX:
     - 100 MHz clock generator (which goes to the AU5426),
       i.e. the "100MHz,3.3V,3225"
     - clock buffer that fans the 100 MHz clock out to the
       PCIe interfaces, i.e. the Aurasemi AU5426

- ROCK 3B:
     - 25 MHz "passive" crystal (which goes to the PI6C557)
     - clock generator that uses the 25 MHz crystal to generate
       100 MHz and fan it out to the PCIe interfaces, i.e. the
       Diodes PI6C557

(The "passive" 25 MHz crystal is very similar to the main 24 MHz
crystal used by the SoC, also known as xin24m.)

However, simplifying and abstracting the things out a bit should
be fine, to end up with the following:

- ROCK 5 ITX:
     - "black box" that generates fixed 100 MHz clocks for the
        PCIe interfaces, which can be gated

- ROCK 3B:
     - "black box" that generates fixed 100 MHz clocks for the
        PCIe interfaces, which can be gated

... and that's our, hopefully, gated-clock. :)

> The interesting part of the Diodes ICs is that they actually allow
> configuration of the generated frequency via their S0 + S1 pins,
> though they might be statically set in the board layout without
> being user configurable. (Rock3b does it this way for example)

The Aurasemi AU5426 also has a few tricks up its sleeve. :)  For
example, it can also use a "passive" crystal instead of using an
external clock generator, i.e. it can be configured to work in
the same "big picture" layout as the PI6C577.

>> - I agree that "enable-gpios" and "vdd-supply" should be
>>    required in the binding, [5] because that's the basis for
>>    something to be actually represented this way
> 
> I would only require the vdd supply though.
> 
> On the Rock 5 ITX, the chip does have an enable-gpio input, but that is
> tied directly to the voltage rail and is not user controllable.

Isn't that voltage rail (VCC3V3_PI6C_05, provided by the U90099 
regulator,
which is an RT9193) actually enabled by GPIO1_A4_d (see pages 14 and 35
in the ROCK 5 ITX schematic and follow PCIE30x_PWREN_H)?

Unless I'm missing something, that's the source of all troubles, because
we basically also need to enable PCIE30x_PWREN_H when only the other M.2
slot is in use, or when it's enumerated first.  Thus, we need 
enable-gpios
to be able to enable the VCC3V3_PI6C_05 independently.

>> - I agree that it should be better not to touch fixed-clock
>>    at this point, simply because it's used in very many places,
>>    and because in this case we need more than it requires (see
>>    the bullet point above)
>> 
>> - As I wrote already, [6] I highly disagree with this being
>>    called voltage-controlled oscillator (VCO), [7] simply
>>    because it isn't a VCO, but a clock that can be gated;
>>    though, looking forward to what the last bullet point
>>    asks to be clarified further
>> 
>> - I still think that gated-clock is the best choice for the
>>    name, because it uses "clock" that's used throughout the
>>    entire codebase, and uses "gated" to reflect the nature
>>    of the clock generator
> 
> "gated-oscillator" perhaps?

But what's the output of an oscillator, which we actually care about?
It's nothing more but a clock. :)

> This would make it more explicit that we're talking about a root
> for clock signals. "gated-clock" can be anything, in the middle
> of a clock tree. Having a very generic name, also invites misuse.

I can't escape wondering why doesn't "fixed-clock", which is also
a very generic name, invite abuse?

Speaking about the root of clock signals, the above-mentioned xin24m,
which is represented in DTs as a fixed-clock, is the root of pretty
much everything.  Also, it technically isn't a clock, it's a crystal.
That's another example of the above-mentioned abstraction, in which
we care about the way sotware sees it, which is a clock.

>> - Maybe we could actually use fixed-gated-clock as the name,
>>    which would make more sense from the stanpoint of possibly
>>    merging it into fixed-clock at some point, but I'd like
>>    to hear first what's actually going on with the Diodes
>>    stuff that was deleted in v2, which I already asked about
>>    in the first bullet point
>> 
>> [4]
>> https://lore.kernel.org/linux-rockchip/20240709123121.1452394-1-heiko@sntech.de/T/#u
>> [5]
>> https://lore.kernel.org/linux-rockchip/2e5852b9e94b9a8d0261ce7ad79f4329.sboyd@kernel.org/
>> [6]
>> https://lore.kernel.org/linux-rockchip/ec84dc37e2c421ee6d31294e08392d57@manjaro.org/
>> [7]
>> https://lore.kernel.org/linux-rockchip/b3c450a94bcb4ad0bc5b3c7ee8712cb8.sboyd@kernel.org/
> 
> [8] https://www.diodes.com/assets/Datasheets/PI6C557-03.pdf
> [9] https://dl.radxa.com/rock3/docs/hw/3b/Radxa_ROCK_3B_V1.51_SCH.pdf
>     page 31, bottom left of the page
> 
> 
>> >> > +
>> >> > +maintainers:
>> >> > +  - Heiko Stuebner <heiko@sntech.de>
>> >> > +
>> >> > +properties:
>> >> > +  compatible:
>> >> > +    const: voltage-oscillator
>> >> > +
>> >> > +  "#clock-cells":
>> >> > +    const: 0
>> >> > +
>> >> > +  clock-frequency: true
>> >> > +
>> >> > +  clock-output-names:
>> >> > +    maxItems: 1
>> >> > +
>> >> > +  enable-gpios:
>> >> > +    description:
>> >> > +      Contains a single GPIO specifier for the GPIO that enables and disables
>> >> > +      the oscillator.
>> >> > +    maxItems: 1
>> >> > +
>> >> > +  vdd-supply:
>> >> > +    description: handle of the regulator that provides the supply voltage
>> >> > +
>> >> > +required:
>> >> > +  - compatible
>> >> > +  - "#clock-cells"
>> >> > +  - clock-frequency
>> >> > +  - vdd-supply
>> >> > +
>> >> > +additionalProperties: false
>> >> > +
>> >> > +examples:
>> >> > +  - |
>> >> > +    voltage-oscillator {
>> >> > +      compatible = "voltage-oscillator";
>> >> > +      #clock-cells = <0>;
>> >> > +      clock-frequency = <1000000000>;
>> >> > +      vdd-supply = <&reg_vdd>;
>> >> > +    };
>> >> > +...


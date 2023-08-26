Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFF6789509
	for <lists+linux-clk@lfdr.de>; Sat, 26 Aug 2023 11:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjHZJMr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 26 Aug 2023 05:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbjHZJMi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Aug 2023 05:12:38 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D8A1BD2;
        Sat, 26 Aug 2023 02:12:33 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RXrgd1zMnz9ssD;
        Sat, 26 Aug 2023 11:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
        s=MBO0001; t=1693041149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qDVX91eJSqetV4AI7HaZ27+vMHk/EcMEhN+LW66E61U=;
        b=N1C7C8Vr1bF2I5w/dCj0qlrUk7A5AsZQgvgEVyRfmhKhjZAfrE/UxA7ojFPk39T7FzkOj5
        OoeLrx+KpMeXvTchQ6pjZbnhM3EFQ7l5eewlEoShR0RqnvEJKgXBKn0646aSNL1AsxLUs1
        ojwyeDeAyZSpDmfk/gXID1Ye0NXV7Lz8kGF3THxtr6ScWqrS+epvrDXrogcci+XFyJE/r6
        1M8Qr5luHg4Q+4HIQIYL6a3ZOtfdapGJ2KJO90hi13t1AFi5x30AWtyOhhj1WbpdpVKs86
        usdv3SMuSVSEllmWovO5Ec7N1aUzwGzq0OCO0otbthwshHAdbKGHHEmQwOh6Jw==
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
 <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
 <87ledzqhwx.fsf@oltmanns.dev>
From:   Frank Oltmanns <frank@oltmanns.dev>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Ondrej Jirman <x@xnux.eu>,
        Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
In-reply-to: <87ledzqhwx.fsf@oltmanns.dev>
Date:   Sat, 26 Aug 2023 11:12:16 +0200
Message-ID: <878r9yb21b.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 2023-08-25 at 17:07:58 +0200, Frank Oltmanns <frank@oltmanns.dev> wrote:
> Thank you for your feedback, Maxime!
>
> On 2023-08-25 at 10:13:53 +0200, Maxime Ripard <mripard@kernel.org> wrote:
>> [[PGP Signed Part:Undecided]]
>> Hi,
>>
>> On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
>>> I would like to make the Allwinner A64's pll-mipi to keep its rate when
>>> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
>>> required, to let the A64 drive both an LCD and HDMI display at the same
>>> time, because both have pll-video0 as an ancestor.
>>>
>>> PATCH 1 adds this functionality as a feature into the clk framework (new
>>> flag: CLK_KEEP_RATE).
>>>
>>> Cores that use this flag, store a rate as req_rate when it or one of its
>>> descendants requests a new rate.
>>>
>>> That rate is then restored in the clk_change_rate recursion, which walks
>>> through the tree. It will reach the flagged core (e.g. pll-mipi) after
>>> the parent's rate (e.g. pll-video0) has already been set to the new
>>> rate. It will then call determine_rate (which requests the parent's
>>> current, i.e. new, rate) to determine a rate that is close to the
>>> flagged core's previous rate. Afterward it will re-calculate the rates
>>> for the flagged core's subtree.
>>
>> I don't think it's the right way forward. It makes the core logic more
>> complicated, for something that is redundant with the notifiers
>> mechanism that has been the go-to for that kind of things so far.
>
> Yeah, that was my initial idea as well. But I couldn't get it to work.
> See details below.
>
> Do you have an example of a clock that restores its previous rate after
> the parent rate has changed? I've looked left and right, but to me it
> seems that notifiers are mainly used for setting clocks into some kind
> of "safe mode" prior to the rate change. Examples:
>
> sunxi-ng:
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_=
mux.c#L273
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_=
common.c#L60
>
> but also others:
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/at91/clk-mast=
er.c#L248
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/meson/meson8b=
.c#L3755
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/qcom/clk-cpu-=
8996.c#L546
>
>> It's not really obvious to me why the notifiers don't work there.
>>
>>> This work is inspired by an out-of-tree patchset [1] [2] [3].
>>> Unfortunately, the patchset uses clk_set_rate() in a notifier callback,
>>> which the following comment on clk_notifier_register() forbids: "The
>>> callbacks associated with the notifier must not re-enter into the clk
>>> framework by calling any top-level clk APIs." [4] Furthermore, that
>>> out-of-tree patchset no longer works with the current linux-next,
>>> because setting pll-mipi is now also resetting pll-video0 [5].
>>
>> Is it because of the "The callbacks associated with the notifier must
>> not re-enter into the clk framework by calling any top-level clk APIs."
>> comment?
>
> I don't think that's the reason. I'm fairly certain that the problem is,
> that pll-mipi tries to set the parent rate. Maybe it should check if the
> parent is locked, before determining a rate that requires the parent
> rate to change. =F0=9F=A4=94 Currently, it only calls clk_hw_can_set_rate=
_parent()
> which only checks the flag, but does not check if it is really possible
> to change the parent's rate.
>
> Regardless, please don't prematurely dismiss my proposal. It has the
> advantage that it is not specific for sunxi-ng, but could be used for
> other drivers as well. Maybe there other instances of exclusive locks
> today where the CLK_KEEP_RATE flag might work equally well. =F0=9F=A4=B7
>
>> If so, I think the thing we should emphasize is that it's about *any
>> top-level clk API*, as in clk_set_rate() or clk_set_parent().
>>
>> The issue is that any consumer-facing API is taking the clk_prepare lock
>> and thus we would have reentrancy. But we're a provider there, and none
>> of the clk_hw_* functions are taking that lock. Neither do our own funct=
ion.
>>
>> So we could call in that notifier our set_rate callback directly, or we
>> could create a clk_hw_set_rate() function.
>>
>> The first one will create cache issue between the actual rate that the
>> common clock framework is running and the one we actually enforced, but
>> we could create a function to flush the CCF cache.
>>
>> The second one is probably simpler.
>
> I'm probably missing something, because I don't think this would work.
> For reference, this is our tree:
>
>     pll-video0
>        hdmi-phy-clk
>        hdmi
>        tcon1
>        pll-mipi
>           tcon0
>              tcon-data-clock
>
> When pll-video0's rate is changed (e.g. because a HDMI monitor is
> plugged in), the rates of the complete subtree for pll-video0 are
> recalculated, including tcon0 and tcon-data-clock. The rate of tcon0 is
> based on the rate that was recalculated for pll-mipi, which - in turn -
> was of course recalculated based on the pll-video0's new rate. These
> values are stored by the clk framework in a private struct. They are
> calculated before actually performing any rate changes.
>
> So, if a notifier sets pll-mipi's rate to something else than was
> previously recalculated, the clk framework would still try to set tcon0
> to the value that it previously calculated.
>
> So, we would have to recalculate pll-mipi's subtree after changing its
> rate (that's what PATCH 1 is doing).

Sorry, I forgot that this actually was possible by flagging pll-mipi
with CLK_RECALC_NEW_RATES. But the real problem I was fighting with when
trying to use the notifiers is something else.

Initially, pll-video0 is set by the bootloader. In my case uboot sets it
to 294 MHz. pll-mipi is set to 588 MHz.

Afterward, there are actually two types of calls for setting pll-mipi in
my scenario:
 1. during boot when tcon-data-clock is set to drive the LCD panel
 2. when the HDMI cable is plugged in

In the first case, the rate for pll-mipi is based on the rate that
tcon-data-clock requests. In that case, we do not want to restore the
previous rate.

In the second case, pll-mipi should try to remain running at the
previous rate (the one that was requested by tcon-data-clock). That's
the reason for setting core->req_rate in PATCH 1.

Unfortunately, the notifier does not provide us with enough context to
distinguish the two cases.

Best regards,
  Frank

>> Another option could be that we turn clk_set_rate_exclusive into
>> something more subtle that allows to change a parent rate as long as the
>> clock rate doesn't.
>
> I don't think this would work either. Only in rare circumstances
> pll-mipi can be set to the exact previous rate, normally it will be set
> to a rate that is close to it's previous rate.
>
> Note there is another option, we could analyze: pll-video0's
> RRE_RATE_CHANGE notifier could be used to set pll-mipi into a mode that
> lets it recalculate a rate that is close to the previous rate. A
> POST_RATE_CHANGE notifier could be used to switch it back to "normal"
> recalc mode. I don't know if pll-video0's notifier works or if we also
> need to be notified after pll-mipi has finished setting it's rate.
> However, this seems a little hacky and I haven't tried if it works at
> all. I prefer the current proposal (i.e. the CLK_KEEP_RATE flag).
>
> Best regards,
>   Frank
>
>> It would ease the requirement that
>> clk_set_rate_exclusive() has on a clock subtree (which I think prevents
>> its usage to some extent), but I have no issue on how that would work in
>> practice.
>>
>> So yeah, I think adding a clk_hw_set_rate() that would be callable from
>> a notifier is the right way forward there.
>>
>> Maxime
>>
>> [[End of PGP Signed Part]]

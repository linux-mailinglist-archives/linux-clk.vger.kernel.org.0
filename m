Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157BD72DF02
	for <lists+linux-clk@lfdr.de>; Tue, 13 Jun 2023 12:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbjFMKRR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Jun 2023 06:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjFMKRQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 06:17:16 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B0113A;
        Tue, 13 Jun 2023 03:17:13 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QgPcP6mbPz9smQ;
        Tue, 13 Jun 2023 12:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
        s=MBO0001; t=1686651430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5D6d13SSgB3gZDYlPz85MymuEJxW8HJ9QSq8iWju5BE=;
        b=KCPcL1FHzZSrj/9kw/jSBjMUAb2llpwOG0EQzh0rpCGAFTlnJfgbevz5BX6dKEvcxvPW1u
        yMOUSzN2bZ5atVKYF0SvQ94OXQGJTVCeDC5wWhrHaylzNGs6bUlDJMrLWaN6tk9Twdl4Ff
        6/HyrqQf9dzSeWfQGeHFv2auXhvCPGIHTd2hfIczDheGtQxdYUdKuw8A0v1YHjWrrvlglv
        gC/iQHM6hwoc40hyVw4PHtPw2SWX+z721SCTIH8ZV/x9zqPTLZ/jzrnYS9oRquYSWFwqHl
        H0uhsJJiAPprycwAuaYBOswm10+tmFciyLFcbVbPPNO6A8H/eTZ5mcX6S0ikwQ==
References: <20230605190745.366882-1-frank@oltmanns.dev>
 <20230605190745.366882-2-frank@oltmanns.dev>
 <2bvcukogzhcdbfsrruylgw5fbezaqjpcojqaambfoiv5fc2upy@ffumn5sevbeb>
 <875y7y1f0d.fsf@oltmanns.dev>
 <sijbhopoxuw5wodyry3smg7tm4wzoc7k6xakt4qdvxqsok32mv@u7rh4dct5ya6>
 <87a5x41w5r.fsf@oltmanns.dev>
 <unoskbtcteluxj7g3xkwc7ngcmglvcbm5ah25m7huhqxwd4dj3@nmfxbedwyu54>
From:   Frank Oltmanns <frank@oltmanns.dev>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Roman Beranek <me@crly.cz>,
        Samuel Holland <samuel@sholland.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: sunxi-ng: nkm: consider alternative parent
 rates when finding rate
In-reply-to: <unoskbtcteluxj7g3xkwc7ngcmglvcbm5ah25m7huhqxwd4dj3@nmfxbedwyu54>
Date:   Tue, 13 Jun 2023 12:17:06 +0200
Message-ID: <87wn07zmxp.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I'll now only respond to one aspect of your mail, because it's the
foundation for the whole behaviour.

On 2023-06-13 at 11:10:08 +0200, Maxime Ripard <maxime@cerno.tech> wrote:
[...]
>> >> ccu_nkm_find_best is called in the following two situations:
>> >>  a. from ccu_nkm_set_rate when setting the rate
>> >>  b. from ccu_nkm_round_rate when determining the rate
>> >>
>> >> In situation a. we never want ccu_nkm_find_best to try different parent
>> >> rates because setting the parent rate is a done deal (at least that's my
>> >> understanding).
>> >>
>> >> In situation b. we only want ccu_nkm_find_best to try different parent
>> >> rates when, as you mentioned, the CLK_SET_RATE_PARENT flag is set.
>> >
>> > It doesn't really matter though. The output of that function must be
>> > stable and must return the same set of factors and parent rate for a
>> > given target rate.
>> >
>>
>> I'm not sure if we're talking about the same thing here. Of course the
>> set of factors and parent rate for a given target rate will be different
>> depending on the fact if we can or cannot adjust the parent rate,
>> agreed?
>
> Yes, but here you also have a different behaviour in clk_round_rate()
> and in clk_set_rate(), which isn't ok.
>
> Basically, clk_set_rate() + clk_get_rate() must be equal to
> clk_round_rate().
>
> If you change if you look for parents depending on whether you're being
> called in clk_round_rate() and clk_set_rate(), then you're breaking that
> expectation.
>
>> Let me compare my implementation to ccu_mp.
>>
>> ccu_mp_round_rate either calls the function ccu_mp_find_best or
>> ccu_mp_find_best_with_parent_adj, depending on CLK_SET_RATE_PARENT.
>
> Yes, and it's fine: the flag is per-clock, and the output is the same
> depending on whether we're being called by clk_round_rate() and
> clk_set_rate().
>

The output is really not the same.

ccu_mp_set_rate() always calls ccu_mp_find_best(). It never (!) considers
changing the parent, independent of any flags.

ccu_mp_round_rate() is calling ccu_mp_find_best() OR
ccu_mp_find_best_with_parent_adj() depending on the flag.

If I understand you correctly, you consider that a bug.

I'm doing the same and therefore that is also a bug. Did I get that right?

Best regards,
  Frank

>
>> I'm basically doing the same thing, but (!) ccu_nkm_find_best and
>> ccu_nkm_find_best_with_parent_adj would be almost identical. Therefore,
>> I opted to extend ccu_nkm_find_best to also support the parent
>> adjustment. If you look at V2 of this patch, you will see that the only
>> diffences are an if statement (if (parent_hw)) with two lines of code in
>> the if's body and the fact that we need to store the best parent rate.
>>
>> If you prefer, I can split this into two separate functions like in
>> ccu_mp. I think all the confusion is coming from the fact that I didn't.
>> So apparently it was not a good idea to keep it as one function.
>>
>> Should I introduce ccu_nkm_find_best_with_parent_adj instead of using
>> ccu_nkm_find_best for both cases?
>>
>> >
>> > So you can call it as many times as you want, it doesn't really matter.
>>
>> Of course! What did I write that made you think, I thought otherwise?
>>
>> >
>> >> So, what this patch does, it provides a NULL pointer as parent_hw when
>> >> we don't want ccu_nkm_find_best to try alternative parent rates.
>> >
>> > At best, the argument is misleading then. You're not passing a pointer
>> > to the parent, you're telling it whether it should look for other
>> > parents or not. And it's not a pointer, it's a boolean.
>>
>> No, I'm using parent_hw and as a pointer a few lines below when calling
>> clk_hw_round_rate. So I'd need a boolean AND a pointer. I always need
>> the pointer if the boolean is true. I never need the pointer when the
>> boolean is false. Therefore, I opted to choose to use the pointer for
>> first being a boolean (in the if) and then being a pointer (when calling
>> clk_hw_round_rate). This is the (hopefully easier to read) code from V2:
>>
>>         if (parent_hw) {
>>                 tmp_parent = optimal_parent_rate(rate, _n, _k, _m);
>>                 tmp_parent = clk_hw_round_rate(parent_hw, tmp_parent);
>>         }
>
> Again, that clock always has a parent. It's not the actual condition:
> what you want to test is whether you want to forward the rate request to
> the parent or not. So that condition is misleading.
>
>> >> Is it ok if I add a comment to ccu_nkm_find_best that explains the
>> >> function and explicitly also the parameters?
>> >
>> > Sure
>>
>> Done in V2.
>>
>> >
>> >> I also thought about using two different functions for the two
>> >> situations. I have no strong opinion which is better.
>> >>
>> >> However, I don't think we should hand over the flags to this function,
>> >> because we'd still only need to provide the parent_hw if we want to
>> >> find the optimal parent rate, so having two parametes for the same
>> >> purpose seems redundant. Unless, there is a rule to not use NULL
>> >> pointers.
>> >
>> > Again, the behaviour must be stable across all calling sites.
>>
>> No argument here.
>>
>> >
>> >> >
>> >> >> +					// We must round up the desired parent rate, because the
>> >> >> +					// rounding down happens when calculating tmp_rate. If we
>> >> >> +					// round down also here, we'd round down twice.
>> >> >> +					unsigned long optimal_parent =
>> >> >> +							(rate * _m + (_n * _k - 1)) / _n / _k;
>> >> >
>> >> > I assume the addition of n * k - 1 is to round up, but I'm not sure we
>> >> > should hack around like that.
>> >> >
>> >> > You should compute the ideal parent rate for a given set of timings, and
>> >> > then just call round_rate on it. If the parent wants to round it one way
>> >> > or another, that's the parent concern.
>> >>
>> >> I admit that the comment explaining this is not doing the complexity of
>> >> this issue any justice. Let me try to explain:
>> >>
>> >> Let's say for our panel the optimal rate for pll-mipi is 449064000. The
>> >> best closest we can get is 449035712 with a parent rate of 217714285
>> >> (n=11, k=3, m=16).
>> >>
>> >> Eventually, ccu_nkm_find_best is going to be called with 449035712 as
>> >> the rate. If we don't round up, like I proposend, but instead calculate:
>> >>   optimal_parent = rate * m / n / k
>> >> (which is, I think, what you you're proposing) leading to an optimal
>> >> parent of 217714284 (!). We can't get 217714284 from the parent (we
>> >> could get 217714285, but we're not asking for that) so the parent rounds
>> >> down.
>> >>
>> >> To make things worse, this story continues for the new "best rate" as
>> >> well.
>> >>
>> >> In the end, ccu_nkm_find_best claims:
>> >>  - the optimal rate for 449064000 is 449035712 (parent=217714285, n=11,
>> >>    k=3, m=16)
>> >>  - but ccu_nkm_find_best would claim that the optimal rate for 449035712
>> >>    is 449018181 (parent=235200000, n=7, k=3, m=11)
>> >>  - and finally, the optimal rate for 449018181 is 449018180
>> >>    (parent=213818181, n=7, k=3, m=10)
>> >>
>> >> This doesn't seem right to me.
>> >>
>> >> But you're also right, in that we can't just always round up. In a
>> >> hypothetical example that we request a parent rate of 450000000. With
>> >> rounding up, we'd get an optimal parent rate of 218181819 for n=11, k=3,
>> >> m=16. And let's now further claim that the parent could provide exactly
>> >> that rate, we'd end up with a rate of 450000001. So, we'd overshoot,
>> >> which (currently) is not acceptable.
>> >>
>> >> Hmm... I currently can't think of a clever way to solve this other than
>> >> this:
>> >>
>> >>     optimal_parent = (rate * _m + (_n * _k - 1)) / _n / _k;
>> >>     tmp_parent = clk_hw_round_rate(parent_hw, optimal_parent);
>> >>     tmp_rate = tmp_parent * _n * _k / _m;
>> >>     if (tmp_rate > rate) {
>> >>         optimal_parent = rate * m / n / k
>> >>         tmp_parent = clk_hw_round_rate(parent_hw, optimal_parent);
>> >>         tmp_rate = tmp_parent * _n * _k / _m;
>> >>     }
>> >>     if (tmp_parent > optimal_parent)
>> >>         continue;
>> >>
>> >> This seems ugly, but at least it should work in all cases. Any opinions?
>> >
>> > Again, you shouldn't work around the issue.
>> >
>> > It's very simple really: you already computed the optimal parent rate,
>>
>> No. I didn't. My assumption is: If ccu_nkm_find_best is asked for the
>> best rate for rate = 449035712, it should try to include 449035712 in
>> its candidates, agreed?
>>
>> Example 1:
>> ==========
>> rate=449035712, n=11, k=3, m=16:
>> We should as for a parent rate of 217714285, because:
>> 217714285 * 11 * 3 / 16 = 449035712
>>
>> How do we get from 449035712 to 217714285, you ask?
>>
>>       DIV_ROUND_UP(rate * m, n * k)
>
> Why are we rounding up? I don't think the hardware will round up there.
>
>> Do you agree that we should ask the parent for 217714285 in case we want
>> a rate of 449035712 and we're currently evaluating the case n=11, k=3,
>> m=16?
>>
>> We should not ask for a parent rate of 217714284, because:
>> 217714284 * 11 * 3 / 16 = 449035710
>>
>> Example 2:
>> ==========
>> rate=500000000, n=11, k=3, m=16:
>> Here we should not ask the parent for
>>       DIV_ROUND_UP(rate * m, n * k)
>> because that would be 242424243.
>>
>> 242424243 * 11 * 3 / 16 = 500000001
>>
>> We (the NKM clock, not the parent!) would overshoot (please see at the
>> end of this mail, why (for now) I don't want to support overshooting in
>> the NKM clock).
>>
>> Instead we should as for a parent rate of 242424242, because:
>> 242424242 * 11 * 3 / 16 = 499999999
>>
>> In conclusion, there are cases, where we (the NKM clock) have to ask the
>> parent for
>>       DIV_ROUND_UP(rate * m, n * k)
>> And there are also cases, where we have to ask the parent for
>>       rate * m / (n * k)
>
> I mean, I think you're overthinking this.
>
> If you never round up and mimic how the hardware behaves, and test all
> combination, then eventually you'll find the closest rate.
>
> If you don't because the parent doesn't look for the closest rate, then
> the parent should be changed too.
>
> It really is that simple.
>
>> This is what the code is trying to do. Maybe it's easier to look at V2
>> because I extracted the calcultion of the optimal parent rate into a
>> separate function hoping that this makes things clearer.
>>
>> Let me stress this: When calculating the optimal rate for the parent,
>> I'm not making any assumptions here about how the PARENT clock rounds.
>> In fact, I assume that the parent could be perfect and always provides
>> the rate it is asked for. I only take into account how the nkm clock
>> rounds.
>
> At the very least, you assume that the parent rounding can be "wrong"
> and try to work around that.
>
>> > you ask the parent to compute whatever is closest to that optimal parent
>> > rate.
>> >
>> > It's the parent responsibility now. It's the parent decision to figure
>> > out what "the closest" means, if it can change rate, if it has any range
>> > limitation, etc. You can't work around that.
>> >
>> > What you actually want there is the parent to actually provide the
>> > closest rate, even if it means overshooting.
>> >
>>
>> I want to ask the parent for a rate, that would actually result in the
>> rate that nkm_find_best was asked for. Are you asking me to instead ask
>> the parent for a rate that doesn't fit that criterion?
>
> No. I'm asking to call clk_hw_round_rate(parent_hw, rate * m / (n * k))
> and use whatever value it returned.
>
> If it requires changing the parent clock to improve its round_rate
> behaviour, then do that too.
>
>> > That's fine, we have a flag
>> > for that: CLK_(MUX|DIVIDER)_ROUND_CLOSEST. We just need to set it on the
>> > parent and be done with it.
>>
>> This is a totally different issue.
>
> Why?
>
>> If you carefully look at ccu_mp, you will see that it would ignore
>> cases when its parent had rounded up. ccu_nkm is no different.
>> Teaching all of sunxi-ng's clocks to respect ROUND_CLOSEST is a
>> totally different beast. For now, sunxi-ng always expects rounding
>> down.
>
> Then change that?
>
> It doesn't look that bad to be honest, it's basically change the rate
> comparison check by something like mux_is_better_rate() or
> _is_best_div(). As far as I'm concerned, you can even do that only for
> NKM and MP clocks if you don't want to change everything.
>
>> I do not like mixing the two into one patchset. I hope that's a fair
>> request? I tried to mix it and it was a nightmare! If you want, I can
>> try tackling ROUND_CLOSEST afterwards. But I don't think it would help
>> with this patchset, because we'd need to support both the ROUND_CLOSEST
>> and ~ROUND_CLOSEST case. Covering one case seems already hard enough. :)
>
> That's fair, but then remove the rate rounding handling entirely and
> only deal with forwarding the rate to the parent if SET_RATE_PARENT is
> set.
>
> Maxime
>
> [[End of PGP Signed Part]]

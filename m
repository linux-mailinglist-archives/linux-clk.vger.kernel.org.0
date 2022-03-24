Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9FFD4E694D
	for <lists+linux-clk@lfdr.de>; Thu, 24 Mar 2022 20:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352959AbiCXT1O (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 24 Mar 2022 15:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235832AbiCXT1E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2022 15:27:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2118A8ECC;
        Thu, 24 Mar 2022 12:25:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 0D08F1F425BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648149929;
        bh=nor4m0RlC/60B4qELu5qW++vljljG14lPfqQrwEpGds=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cFZM60tIEyn6j9Q0Y6CLqL0uqQXN9fDOWJneJJaog7dj4xQWANLwaFrJla2oVDles
         ku5PrOfuFku/gkTTPCfuivzv3Daep3VIK9WRd4hw2oQy4I8z0Id+rN7ccHTCPaMBZh
         RrhYvOKqtsEtbBLoGEqnYBg130iBFZ8CeQzNhnfstTthFUf2RHKju2SULvrUbb+QaB
         8Yk3Z+q5Yx/P3w8BwGROq/4KnSDYW9zii3znhstmin9Lf55RfTGQnUl46DdkiSHS7i
         /x/xawmQUvFnRubCrN0A7sd4751Ox/J5zp3bFiM/EJOrem3rhSUw+kodxGe8mwxZuc
         Fzh9yMZ6EWD6A==
Message-ID: <d7a5216a-5092-e051-0850-2e054e0b1275@collabora.com>
Date:   Thu, 24 Mar 2022 22:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-7-maxime@cerno.tech>
 <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com>
 <20220323085140.ifeclmttkrqo55ru@houat>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220323085140.ifeclmttkrqo55ru@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/23/22 11:51, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Mar 22, 2022 at 10:05:56PM +0300, Dmitry Osipenko wrote:
>> On 2/25/22 17:35, Maxime Ripard wrote:
>>> When we change a clock minimum or maximum using clk_set_rate_range(),
>>> clk_set_min_rate() or clk_set_max_rate(), the current code will only
>>> trigger a new rate change if the rate is outside of the new boundaries.
>>>
>>> However, a clock driver might want to always keep the clock rate to
>>> one of its boundary, for example the minimum to keep the power
>>> consumption as low as possible.
>>>
>>> Since they don't always get called though, clock providers don't have the
>>> opportunity to implement this behaviour.
>>>
>>> Let's trigger a clk_set_rate() on the previous requested rate every time
>>> clk_set_rate_range() is called. That way, providers that care about the
>>> new boundaries have a chance to adjust the rate, while providers that
>>> don't care about those new boundaries will return the same rate than
>>> before, which will be ignored by clk_set_rate() and won't result in a
>>> new rate change.
>>>
>>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>  drivers/clk/clk.c      | 45 ++++++++++++++++----------------
>>>  drivers/clk/clk_test.c | 58 +++++++++++++++++++-----------------------
>>>  2 files changed, 49 insertions(+), 54 deletions(-)
>>>
>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>> index c15ee5070f52..9bc8bf434b94 100644
>>> --- a/drivers/clk/clk.c
>>> +++ b/drivers/clk/clk.c
>>> @@ -2373,28 +2373,29 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>>>  		goto out;
>>>  	}
>>>  
>>> -	rate = clk_core_get_rate_nolock(clk->core);
>>> -	if (rate < min || rate > max) {
>>> -		/*
>>> -		 * FIXME:
>>> -		 * We are in bit of trouble here, current rate is outside the
>>> -		 * the requested range. We are going try to request appropriate
>>> -		 * range boundary but there is a catch. It may fail for the
>>> -		 * usual reason (clock broken, clock protected, etc) but also
>>> -		 * because:
>>> -		 * - round_rate() was not favorable and fell on the wrong
>>> -		 *   side of the boundary
>>> -		 * - the determine_rate() callback does not really check for
>>> -		 *   this corner case when determining the rate
>>> -		 */
>>> -
>>> -		rate = clamp(clk->core->req_rate, min, max);
>>> -		ret = clk_core_set_rate_nolock(clk->core, rate);
>>> -		if (ret) {
>>> -			/* rollback the changes */
>>> -			clk->min_rate = old_min;
>>> -			clk->max_rate = old_max;
>>> -		}
>>> +	/*
>>> +	 * Since the boundaries have been changed, let's give the
>>> +	 * opportunity to the provider to adjust the clock rate based on
>>> +	 * the new boundaries.
>>> +	 *
>>> +	 * We also need to handle the case where the clock is currently
>>> +	 * outside of the boundaries. Clamping the last requested rate
>>> +	 * to the current minimum and maximum will also handle this.
>>> +	 *
>>> +	 * FIXME:
>>> +	 * There is a catch. It may fail for the usual reason (clock
>>> +	 * broken, clock protected, etc) but also because:
>>> +	 * - round_rate() was not favorable and fell on the wrong
>>> +	 *   side of the boundary
>>> +	 * - the determine_rate() callback does not really check for
>>> +	 *   this corner case when determining the rate
>>> +	 */
>>> +	rate = clamp(clk->core->req_rate, min, max);
>>> +	ret = clk_core_set_rate_nolock(clk->core, rate);
>>> +	if (ret) {
>>> +		/* rollback the changes */
>>> +		clk->min_rate = old_min;
>>> +		clk->max_rate = old_max;
>>>  	}
>>>  
>>>  out:
>>
>> NVIDIA Tegra30 no longer boots with this change.
>>
>> You can't assume that rate was requested by clk_set_rate() before
>> clk_set_rate_range() is called, see what [1] does.
> 
> We don't, and it would be bad indeed.
> 
> We even have (multiple) tests to cover that case:
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/tree/drivers/clk/clk_test.c?h=clk-range&id=a9b269310ad9abb2f206fe814fd3afcadddce3aa#n242
> 
>> T30 memory rate now drops to min on boot when clk debug range is
>> inited innocuously and CPU no longer can make any progress because
>> display controller takes out whole memory bandwidth.
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/memory/tegra/tegra30-emc.c#n1437
>>
>> If clk_set_rate() wasn't ever invoked and req_rate=0, then you must not
>> change the clk rate if it's within the new range. Please revert this
>> patch, thanks.
> 
> The whole point of this patch is to give an opportunity to every driver
> to change the rate whenever the boundaries have changed, so we very much
> want to have the option to change it if clk_set_rate() has never been
> called.
> 
> However, I think the issue is why req_rate would be 0 in the first
> place?
> 
> req_rate is initialized to what recalc_rate returns:
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L3607
> 
> So the case where req_rate is 0 shouldn't occur unless you had an
> explicit clk_set_rate to 0, or if your clock was orphaned at some point.
> 
> Judging from the code, it seems like the latter is the most plausible.
> Indeed, __clk_core_init() will set req_rate to 0 if the clock is
> orphaned (just like rate and accuracy), and
> clk_core_reparent_orphans_nolock will be in charge of updating them when
> the clock is no longer an orphan.
> 
> However, clk_core_reparent_orphans_nolock() will update rate by calling
> __clk_recalc_rate and accuracy by calling __clk_recalc_accuracies, but
> it never sets req_rate.
> 
> I'm not sure if this is the right patch, Stephen will tell, but could
> you test:
> 
> ------------------------ >8 ------------------------
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9bc8bf434b94..c43340afedee 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3479,6 +3479,7 @@ static void clk_core_reparent_orphans_nolock(void)
>  			__clk_set_parent_after(orphan, parent, NULL);
>  			__clk_recalc_accuracies(orphan);
>  			__clk_recalc_rates(orphan, 0);
> +			orphan->req_rate = orphan->rate;
>  		}
>  	}
>  }
> 
> ------------------------ >8 ------------------------

It works, thank you!

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # T30 Nexus7

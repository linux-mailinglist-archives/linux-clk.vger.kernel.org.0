Return-Path: <linux-clk+bounces-22291-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1FAC4AE4
	for <lists+linux-clk@lfdr.de>; Tue, 27 May 2025 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE93B189E3F8
	for <lists+linux-clk@lfdr.de>; Tue, 27 May 2025 08:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9C024DD05;
	Tue, 27 May 2025 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hOO4YZWd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C5248F69
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336295; cv=none; b=O3/Jb7VL1kVP+yTZhK2tf0HxHtkM+Kn2oqJ8gvZNT5sy6yOSIXjIkN1ZM9z7g2Z+QEbm6eQGyBh0ZmlqvCmPTHlsuqrqhZxdO/zn3kZtHUVDELeenkKe091C6IqyUB6H26rzsgWo4dSSQVjpODxGEWE0tALuHukAVcQ7iE1lTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336295; c=relaxed/simple;
	bh=BbCeX5pkjZfZQo5FakfQwWGkCwEBuBTsFO0cycmFJCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zh36SlSw6HUw6W0Imw3FP0MHyEAZY2BPQiBlay920qLQ/hAPu6asUvsn03vPm1Y3fw0XLybO864j9GTCVPO7GvXk3bmhXcdEcw185veBZ2yxs304Z+ltlsanVq0Fs4ptHgxSMPL5B/9FIc+tKCodp6Is4qVjIc40htaSjhYVuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hOO4YZWd; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so2442957a12.0
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748336290; x=1748941090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3F6fFUzgjmweobMYRptuwiIYJHK9a0G19avT/yXS7c=;
        b=hOO4YZWdVEM4Q9eadZJGd7Op2+uqOq0pxPMskFS4lDxztIQejOsRGt943Rgckm932h
         lBAmEsS3Hl5WfGDFMi7WRIRi5xAGiPVJTvao5IOzwy7QMrDJ7aJYDADvfbNlaW1Zlk+g
         dR2Iz5F1IuBLeY5/6PaSjdWqDWc1EtFrxo2WXI+6CcTz27jaj0WPAeKbHFT77cngJrVH
         2IM45eXPC/WtsLLtQfACN2Xw1R/Xkmx7euzUzLIEBMlZLVuNcv3CQ1vrm2Lenj8fnY9J
         2p/JAkbMsn3QGYR7OemGYfN2JbIZ5xgzMAUfPfUEXhlzoTeGJWQ0fh8Kmzfbz5JyQtmX
         R7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336290; x=1748941090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3F6fFUzgjmweobMYRptuwiIYJHK9a0G19avT/yXS7c=;
        b=a3ytKgBaYQUUn+HyJlFj6mTfHSX4eQZRZGQ/J0RJkF09ZXgnmgKhvEshsxI62EXnEy
         olO4B3J9IPC0v7CKhoXEYtkEXOLZpKtEQZn/s7rDWotc0ToT4h3t5PKAbKCoLKB8rnsN
         otNJjGJtWjhodhV1Zyg4yM2Hajx3hWsMQseXUFX9JkgKlfn2EdiH/0lsaptoPCRdY3Ic
         ohkhfFPUhzNcg2fmFbT3b6pcU4BLIGdr3WL5IWFQciEW/hNTC/giDC1rmus5eaxZk9cE
         8/thWQ+iIy/0EKa4NYTcYcQECEQaa6Y3HkL4oNDMdSxi4a/z7cQ08dOS97SHZGmbAPAL
         5pXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsRbXDyl3YMFdx7+ZZ0DCVtjEdW1YdU4fmogc/zzqRpeKECM4uPBqnWyH7tG+05Mhylur+8L+u5bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFVdnhDEGpbTYYnA4rZw/QGHOniofZU5VjbErs6OhQ7tM8tyS5
	2/i+2lw6WbgKgigs+1oJA8QXf7177T0+KZubetyla4vbYUcEY1KpvS7imBjVgacxY1E=
X-Gm-Gg: ASbGncuUg0+z5KHQLIvgQvHGO6JoJMyGUmLKuEygJ/gaZUNCzRo6ejVen+Hq2880fCT
	bkgwBg0Nnxxl/4nr3r4EmoNTBKCVauSRGqUTSetWDw+PoQLm0xIk9J/5tUhmgEvQSr4dAZlLXpe
	mRzHFZXDDStsBi+e1cHSHf1wXaEoUGAeYkakTXMqZhff9XpDv2bj5pAikaCDn+8H/GOvpJpZ9Zx
	zcmiDXFBgnOPK+GvFiOJJzYCcT4zesngHh+2OcPqfGj8ZAU0U8EEicDN6iiPy7K5Ug2N1q/qDBu
	Ff6Nd0UU5WbQuKtgMfuZcje7beGsGGC0TR9ZAmJA7sJqS3K8w38csyqmqsM=
X-Google-Smtp-Source: AGHT+IEVmqO9eh9OgyCSc/rzXwE8cUdlhLs20FgsfYCnDsAzGYDjE3MubS5SYFbUJzbpin/ZBy5kzg==
X-Received: by 2002:a17:907:7254:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-ad8599eade9mr991411666b.21.1748336289874;
        Tue, 27 May 2025 01:58:09 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4420ccsm1793755466b.110.2025.05.27.01.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:58:09 -0700 (PDT)
Message-ID: <d318550c-25cb-4305-8a39-4e4ff51728d8@tuxon.dev>
Date: Tue, 27 May 2025 11:58:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
 <20250514090415.4098534-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWNrU=XOZr3dKKXQikzCzJ1oUPGQofWFdRX9x6rhYn3XA@mail.gmail.com>
 <b0d15a62-e164-4a8a-b4c7-77d9c3b2e7b2@tuxon.dev>
 <CAMuHMdUT57QfwfeoFfp-rL0yX_32QQNU3-c3MnPgdbSWi182Hw@mail.gmail.com>
 <87a923c1-c996-4769-86bd-b28b42574c3a@tuxon.dev>
 <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 26.05.2025 20:09, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 26 May 2025 at 17:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 26.05.2025 16:33, Geert Uytterhoeven wrote:
>>> On Fri, 23 May 2025 at 09:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 22.05.2025 17:46, Geert Uytterhoeven wrote:
>>>>> On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>>>>>> module has one or more MSTOP bits associated with it, and these bits need
>>>>>> to be configured along with the module clocks. Setting the MSTOP bits
>>>>>> switches the module between normal and standby states.
>>>>>>
>>>>>> Previously, MSTOP support was abstracted through power domains
>>>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>>>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>>>>>
>>>>>> Previous Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Clear module MSTOP bit
>>>>>> 2/ Set module CLKON bit
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Clear CLKON bit
>>>>>> 2/ Set MSTOP bit
>>>>>>
>>>>>> However, in some cases (when the clock is disabled through devres), the
>>>>>> order may have been (due to the issue described in link section):
>>>>>>
>>>>>> 1/ Set MSTOP bit
>>>>>> 2/ Clear CLKON bit
>>>>>>
>>>>>> Recently, the hardware team has suggested that the correct order to set
>>>>>> the MSTOP and CLKON bits is:
>>>>>>
>>>>>> Updated Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Set CLKON bit
>>>>>> 2/ Clear MSTOP bit
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Set MSTOP bit
>>>>>> 2/ Clear CLKON bit
>>>>>>
>>>>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
>>>>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
>>>>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
>>>>>> from the RZ/G3S HW manual, Rev1.10.
>>>>>>
>>>>>> Additionally, since multiple clocks of a single module may be mapped to a
>>>>>> single MSTOP bit, MSTOP setup is reference-counted.
>>>>>>
>>>>>> Furthermore, as all modules start in the normal state after reset, if the
>>>>>> module clocks are disabled, the module state is switched to standby. This
>>>>>> prevents keeping the module in an invalid state, as recommended by the
>>>>>> hardware team.
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - udpated patch description to avoid plural in the configuration
>>>>>>   sequence description b/w MSTOP and CLK_ON
>>>>>> - use atomic type to store the usage counter; s/refcnt/usecnt/g
>>>>>> - moved MSTOP_OFF(), MSTOP_MASK() macros to rzg2l-cpg.c
>>>>>> - dropped struct mstp_clock::critical and use clk_hw_get_flags()
>>>>>>   instead to get the clock flags
>>>>>> - used unsigned int iterators in for loops
>>>>>> - keep memory allocated for a single list for clocks sharing the
>>>>>>   same MSTOP by updating the rzg2l_mod_clock_add_shared_mstop_clk();
>>>>>> - s/rzg2l_cpg_mstop_show/rzg2l_mod_clock_mstop_show/g,
>>>>>>   s/rzg2l_cpg_mstop/rzg2l_mod_clock_mstop/g,
>>>>>>   s/rzg2l_cpg_update_shared_mstop_clocks/rzg2l_mod_clock_update_shared_mstop_clks/g
>>>>>>    to keep the same naming conventions for functions handling mod clock MSTOP
>>>>>> - use the newly added for_each_mstp_clk() macro all over the code
>>>>>
>>>>> Thanks for the update!
>>>>>
>>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>>>
>>>>>> @@ -1209,6 +1232,94 @@ struct mstp_clock {
>>>>>>                 else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
>>>>>>                          ((mstp_clk) = to_mod_clock(hw)))
>>>>>>
>>>>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
>>>>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
>>>>>> +                                            bool standby)
>>>>>> +{
>>>>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>>>>>> +       struct mstop *mstop = clock->mstop;
>>>>>> +       bool update = false;
>>>>>> +       u32 value;
>>>>>> +
>>>>>> +       if (!mstop)
>>>>>> +               return;
>>>>>> +
>>>>>> +       value = MSTOP_MASK(mstop->conf) << 16;
>>>>>> +
>>>>>> +       if (standby) {
>>>>>> +               unsigned int criticals = 0;
>>>>>> +
>>>>>> +               for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
>>>>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
>>>>>> +
>>>>>> +                       if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
>>>>>> +                               criticals++;
>>>>>> +               }
>>>>>> +
>>>>>> +               /*
>>>>>> +                * If this is a shared MSTOP and it is shared with critical clocks,
>>>>>> +                * and the system boots up with this clock enabled but no driver
>>>>>> +                * uses it the CCF will disable it (as it is unused). As we don't
>>>>>> +                * increment reference counter for it at registration (to avoid
>>>>>> +                * messing with clocks enabled at probe but later used by drivers)
>>>>>> +                * do not set the MSTOP here too if it is shared with critical
>>>>>> +                * clocks and ref counted only by those critical clocks.
>>>>>> +                */
>>>>>> +               if (criticals && criticals == atomic_read(&mstop->usecnt))
>>>>>> +                       return;
>>>>>> +
>>>>>> +               value |= MSTOP_MASK(mstop->conf);
>>>>>> +
>>>>>> +               /* Allow updates on probe when usecnt = 0. */
>>>>>> +               if (!atomic_read(&mstop->usecnt))
>>>>>> +                       update = true;
>>>>>> +               else
>>>>>> +                       update = atomic_dec_and_test(&mstop->usecnt);
>>>>>> +       } else {
>>>>>> +               atomic_inc(&mstop->usecnt);
>>>>>> +               update = true;
>>>>>
>>>>> Shouldn't the update be conditional, i.e.:
>>>>>
>>>>>     if (!atomic_read(&mstop->usecnt))
>>>>>             update = true;
>>>>>     atomic_inc(&mstop->usecnt);
>>>>>
>>>>> ?
>>>>
>>>> Indeed, it should be conditional as you suggested.
>>>>
>>>>>
>>>>>> +       }
>>>>>> +
>>>>>> +       if (update)
>>>>>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
>>>>>> +}
>>>>>
>>>>>> +static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
>>>>>> +                                                   struct mstp_clock *clock)
>>>>>> +{
>>>>>> +       struct mstp_clock *clk;
>>>>>> +       struct clk_hw *hw;
>>>>>> +
>>>>>> +       if (!clock->mstop)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       for_each_mstp_clk(clk, hw, priv) {
>>>>>> +               struct mstp_clock **new_clks;
>>>>>> +               int num_shared_mstop_clks;
>>>>>> +               bool found = false;
>>>>>> +
>>>>>> +               if (clk->mstop != clock->mstop)
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               num_shared_mstop_clks = clk->num_shared_mstop_clks;
>>>>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
>>>>>> +                       if (clk->shared_mstop_clks[i] == clock) {
>>>>>> +                               found = true;
>>>>>> +                               break;
>>>>>> +                       }
>>>>>> +               }
>>>>>> +               if (found)
>>>>>> +                       continue;
>>>>>
>>>>> Can this happen? With your current code, the answer is yes.
>>>>> But I think this loop and check can be removed...
>>>>>
>>>>>> +
>>>>>> +               if (!num_shared_mstop_clks)
>>>>>> +                       new_clks = devm_kmalloc_array(priv->dev, 2, sizeof(*new_clks), GFP_KERNEL);
>>>>>> +               else
>>>>>> +                       new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
>>>>>> +                                                (num_shared_mstop_clks + 1) * sizeof(*new_clks),
>>>>>> +                                                GFP_KERNEL);
>>>>>> +
>>>>>> +               if (!new_clks)
>>>>>> +                       return -ENOMEM;
>>>>>> +
>>>>>> +               if (!num_shared_mstop_clks)
>>>>>> +                       new_clks[num_shared_mstop_clks++] = clk;
>>>>>> +               if (clk != clock)
>>>>>
>>>>> This check is always true
>>>>
>>>> If I'm not wrong now, when adding the clock to it's own list, and the list
>>>> is empty (!num_shared_mstop_clks check above is true), if this condition is
>>>> missing the clock it will be added twice in its own list.
>>>
>>> Sorry, I missed that this function is called _after_ the clock is
>>> added to priv->clks[].  So one question and comment here:
>>>   1. Do you need a one-entry array (actual allocation is two entries)
>>>      for module clocks with an mstop entry that is not shared?
>>
>> That extra entry should not be needed. It should not happen to have an
>> mstop clock in the priv->clks[] array w/o at least a clock in its shared
>> list. I was wrong in both the initial code and the reply I sent to your
>> initial comment. Appologies for that.
> 
> So no single-entry arrays...

Oh, I missread it yesterday everning. Sorry for confusion. Let me try again:

> 
>>>      Perhaps for critical clocks? That could be handled in

The clock is added to its own shared_mstop_clk[] array to avoid extra
conditions when all the clocks sharing the same mstop need to be checked
for an action. One example is code at [A] (for critical clocks) that was
available in v1.


>>>      rzg2l_mod_clock_module_set_state(), by explicitly checking
>>>      the clock's own critical flag if num_shared_mstop_clks is zero.

The clock was added to its own shared_mstop_clk[] array as a result of this
comment I got from you on v1 (with regards to checking the clock's critical
flag):

"If clock->shared_mstop_clks[] would include the current clock, then
(a) this test would not be needed, and
(b) all clocks sharing the same mstop could share a single
    clock->shared_mstop_clks[] array."

If I understood correctly, in [1] it has been proposed to have something
like what is proposed here to avoid extra conditional check (like [A]), in
rzg2l_mod_clock_module_set_state():

for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
    unsigned int
    struct mstp_clock *clk = clock->shared_mstop_clks[i];

    if (clk->critical)
        criticals++;
}

/* Increment if clock is critical, too. */
if (clock->critical) // <<< [A]
    criticals++;

Please let me know if I misunderstood your initial request?

[1]
https://lore.kernel.org/all/CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com/


>>>
>>>   2. If rzg2l_mod_clock_update_shared_mstop_clks() would be called
>>>      _before_ the clock is added to priv->clks[], the clk != clock
>>>      check would not be needed.
>>
>> Yes, you're right. Running rzg2l_mod_clock_update_shard_mstop_clks() before
>> the priv->clks[] is updated simplifies the logic (see below).
>>
>>>
>>>>>> +                       new_clks[num_shared_mstop_clks++] = clock;
>>>>>> +
>>>>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
>>>>>> +                       new_clks[i]->shared_mstop_clks = new_clks;
>>>>>> +                       new_clks[i]->num_shared_mstop_clks = num_shared_mstop_clks;
>>>>>> +               }
>>>>>
>>>>> ... by adding a "break" here.  The loop above has already updated the
>>>>> shared_mstop_clks[] arrays for all clocks sharing the same mstop value.
>>>>
>>>> It may happen that the entries in the module clock array provided by the
>>>> SoC specific drivers to not be sorted by module clock ID. That's the case
>>>> with RZ/G2L IA55 clocks (from r9a07g044-cpg.c):
>>>>
>>>> static const struct {
>>>>         struct rzg2l_mod_clk common[79];
>>>> #ifdef CONFIG_CLK_R9A07G054
>>>>         struct rzg2l_mod_clk drp[5];
>>>> #endif
>>>> } mod_clks = {
>>>>   .common = {
>>>>     // ...
>>>>
>>>>     DEF_MOD("ia55_pclk", R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
>>>>                          0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
>>>>     DEF_MOD("ia55_clk", R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
>>>>                          0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
>>>>
>>>>     // ...
>>>> };
>>>>
>>>> Where IDs are defined as:
>>>>
>>>> #define R9A07G044_IA55_CLK     8
>>>> #define R9A07G044_IA55_PCLK    9
>>>>
>>>> These clocks share the same MSTOP bit.
>>>>
>>>> Because the ia55_pclk is the 1st clock registered (index 9) it will be
>>>> added to priv->clks[base + 9].
>>>>
>>>> Next registered clock will be for ia55_clk, with index 8, it will be added
>>>> to priv->clks[base + 8].
>>>>
>>>> for_each_mstp_clk() loops on clocks from priv->clks[] array. If a break
>>>> will be done at the end of the for_each_mstp_clk() loop, at the end of the
>>>> registration each of these clocks will have on it's shared_mstop_clks[]
>>>> only references to itself.
>>>
>>> If rzg2l_mod_clock_update_shared_mstop_clks() would be called _before_
>>> the clock is added to priv->clks[], this issue could not happen, right?
>>
>> That's true. With the above update this is not happen:
>>
>> static int
>> rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
>>                                          struct mstp_clock *clock)
>> {
>>     struct mstp_clock *clk;
>>     struct clk_hw *hw;
>>
>>     if (!clock->mstop)
>>         return 0;
>>
>>     for_each_mstp_clk(clk, hw, priv) {
>>         struct mstp_clock **new_clks;
>>         int num_shared_mstop_clks;
>>         bool found = false;
>>
>>         if (clk->mstop != clock->mstop)
>>             continue;
>>
>>         num_shared_mstop_clks = clk->num_shared_mstop_clks;
>>         new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
>>                                  (num_shared_mstop_clks + 1) *
>>                                   sizeof(*new_clks),
>>                                  GFP_KERNEL);
>>         if (!new_clks)
>>             return -ENOMEM;
>>
>>         new_clks[num_shared_mstop_clks++] = clock;
>>
>>         for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
>>             new_clks[i]->shared_mstop_clks = new_clks;
>>             new_clks[i]->num_shared_mstop_clks = num_shared_mstop_clks;
>>         }
>>         break;
>>     }
>>
>>     if (clock->num_shared_mstop_clks)
>>         return 0;
>>
>>     clock->shared_mstop_clks = devm_kzalloc(priv->dev,
>>                                        sizeof(*clock->shared_mstop_clks),
>>                                        GFP_KERNEL);
>>     if (!clock->shared_mstop_clks)
>>         return -ENOMEM;
>>
>>     clock->shared_mstop_clks[0] = clock;
>>     clock->num_shared_mstop_clks = 1;
> 
> ... but here you still create a single-entry array?\

For the above mentioned reason.

Thank you,
Claudiu


Return-Path: <linux-clk+bounces-4247-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEBD86C709
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 11:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933F81C211A3
	for <lists+linux-clk@lfdr.de>; Thu, 29 Feb 2024 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D24B79B77;
	Thu, 29 Feb 2024 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="s3MDGWeD"
X-Original-To: linux-clk@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E779DA4;
	Thu, 29 Feb 2024 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202999; cv=none; b=lu8Vgj54yiWWe50fWb4cytv+p3AGYHemIuGqP6bfJM+1OuF0ayS6kROEtdMhf980SANMbKI8x7q82rBXSc2zmXKHED+jVCaG2qSbYL1KTu1VaSgYJFJJdptqql7gf7FTumoT8Ee0+ijm1hufFFoyZvO7PpNxNqeK5qPkZjxj9Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202999; c=relaxed/simple;
	bh=3aSzZhGz+bpRWbINAdnEu5co1kMfKQnkYjethc3a530=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPCtKGIcBqlXDbHjAtEAKFR40W3haMZzrj40e9AbanIEsaOJl7iKJIvCwxOwBF69xBUCDqVZP8HRoiDXUk4SK/LVaYMDXKbsgsIgRqWmXeEx06QBlpy4b1SDwKwb4cTctzjIQBbs/M/+uuRGQQ3hJmGxhknC6n/JbiDvmXB0xf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=s3MDGWeD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709202996;
	bh=3aSzZhGz+bpRWbINAdnEu5co1kMfKQnkYjethc3a530=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s3MDGWeDkPkdarXIbAj9oa1fTy4TyYyv1ES/5Qccvw4OYaontwWZw5LVY3yNIfSHC
	 p2/GPav+EaFfbFglfPuhzt8m1XYa7kDXcugOyCdQx3FS8tVobd5Cp14+esygYMdbm+
	 UCpIX/2M+JlRGf6A1eDfAR59/l/qGxQTvbisXNBtrBsDJfaFeYTjaujsH33hbBrHlD
	 +tsgfwyW8V5xdXREtR4Ym4wcI/RCPPTcOBZuHPG35+f2H61Dpra3FYR6i/1WtjHJy2
	 +tQKbA+JWmqg5/lNLT9y+MkwSZ2fU1MDYgE+08zstDChJ0iqbvEMcAw5iQTErYUi5r
	 XmGrAsA9qEkWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB4913780029;
	Thu, 29 Feb 2024 10:36:35 +0000 (UTC)
Message-ID: <dfdc6a65-3ccf-463c-95df-093f3c2fefd3@collabora.com>
Date: Thu, 29 Feb 2024 11:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to
 mtk_clk_desc
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com>
 <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
 <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com>
 <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 29/02/24 11:34, Chen-Yu Tsai ha scritto:
> On Thu, Feb 29, 2024 at 5:45 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
>>> On Mon, Feb 26, 2024 at 7:16 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
>>>>> On Mon, Jan 8, 2024 at 4:18 PM Pin-yen Lin <treapking@chromium.org> wrote:
>>>>>>
>>>>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
>>>>>> this clock controller needs runtime PM for its operations.
>>>>>> Also do a runtime PM get on the clock controller during the
>>>>>> probing stage to workaround a possible deadlock.
>>>>>>
>>>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>>>>
>>>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>>
>>>>> The patch itself looks fine.
>>>>>
>>>>> Besides the MT8183 MFG clock issues, we do actually need this for the
>>>>> MT8192 ADSP clock. Its power domain is not enabled by default.
>>>>>
>>>>
>>>> ...but on MT8195 the ADSP clock works - because the ADSP node exists.
>>>
>>> That's an indirect dependency that should not be relied on. Say the clock
>>> driver probed but the ADSP hasn't, and you try to read out the current
>>> status. What would happen?
>>>
>>> - Read out works fine, because the power domain is default on, and hasn't
>>>     been turned off by late cleanup
>>> - Read out is bogus (but you can't tell)
>>> - Read out hangs.
>>>
>>> The third is what happens on MT8192. There's still some issues on that
>>> front, as even after I applied the ADSP power domain patches from MediaTek,
>>> the readout was still hanging.
>>>
>>
>> That MT8192 lockup story is getting crazy in my head... anyway, besides that,
>> I get the point - I was somehow ignoring the fact that kernel modules do exist.
>>
>> Eh, sorry about that :-)
>>
>>>> This poses a question: should we make clock controllers depend on power domains,
>>>> or should we keep everything powered off (hence clocks down - no power consumption)
>>>> *unless* the user exists?
>>>
>>> That's a policy discussion separate from actual hardware dependencies.
>>> *If* the clock controller needs the power domain to be active for the
>>> registers to be accessed, the clock controller *must* have a direct
>>> dependency on the power domain.
>>>
>>
>> I admit I should've worded that better.
>>
>> "should we make clock controllers depend on power domains" was actually implying
>> "IF those need one" :-)
>>
>> I really wonder if - at this point - it's simply a better idea to not restrict
>> the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_pm == true`.
>>
>> Do we really need to exclude that on other clock controllers that don't have
>> any power domain dependency? Any side effect?
>>
>> Saying this because if we can avoid yet another per-SoC flag I'm really happy,
>> as readability is also impacted and besides - if we ever find out that one of
>> those need a power domain in the future, we'll need just one commit and just
>> only in the devicetree, instead of enabling a flag in driver X as well as that,
>> avoiding some (potentially unnecessary) noise... I guess.
>>
>> P.S.: I just noticed that the return value for the devm_pm_runtime_enable() call
>>         is not being checked!
>>
>> .......
>>
>> In short....
>>
>> Chen-Yu, at this point, do you have any reason why we wouldn't be able and/or it
>> wouldn't be a good idea to just avoid adding the `need_runtime_pm` flag (meaning
>> that we perform pm_runtime calls for all clock drivers unconditionally)?
>>
>> If this is about longer boot time, I don't think that it's going to be more than
>> a millisecond or two, so that should be completely ignorable.
> 
> I think it's just more of a "don't enable features you don't need" thing.
> We already ran into a weird deadlock, which is why the devm_pm_runtime_enable()
> call has that comment.
> 
> I don't think anyone has actually looked at it. As you said it shouldn't be
> much, at least during boot time. It's one call per clock controller.
> 
>> Can you please do a test for that, or should I?
> 
> The earliest I can work on it would be some time next week. Does that work
> for you?
> 

The earliest I'd be able to work on this myself would be at the end of next
week if not later.. so yes, please take your time, no worries.

Thank you!

> ChenYu
> 
>> Cheers
>> Angelo
>>
>>>> For the second one, this means that the *device* gets the power domain (adsp), and
>>>> not the clock controller (which clocks are effectively useless if there's no user).
>>>
>>> No. See my previous paragraph.
>>>
>>> ChenYu
>>>
>>>> Angelo
>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Update the commit message and the comments before runtime PM call
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Fix the order of error handling
>>>>>> - Update the commit message and add a comment before the runtime PM call
>>>>>>
>>>>>>     drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>>>>>>     drivers/clk/mediatek/clk-mtk.h |  2 ++
>>>>>>     2 files changed, 21 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>>>>>> index 2e55368dc4d8..ba1d1c495bc2 100644
>>>>>> --- a/drivers/clk/mediatek/clk-mtk.c
>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
>>>>>> @@ -13,6 +13,7 @@
>>>>>>     #include <linux/of.h>
>>>>>>     #include <linux/of_address.h>
>>>>>>     #include <linux/platform_device.h>
>>>>>> +#include <linux/pm_runtime.h>
>>>>>>     #include <linux/slab.h>
>>>>>>
>>>>>>     #include "clk-mtk.h"
>>>>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>>>                            return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>>>>>>            }
>>>>>>
>>>>>> +
>>>>>> +       if (mcd->need_runtime_pm) {
>>>>>> +               devm_pm_runtime_enable(&pdev->dev);
>>>>>> +               /*
>>>>>> +                * Do a pm_runtime_resume_and_get() to workaround a possible
>>>>>> +                * deadlock between clk_register() and the genpd framework.
>>>>>> +                */
>>>>>> +               r = pm_runtime_resume_and_get(&pdev->dev);
>>>>>> +               if (r)
>>>>>> +                       return r;
>>>>>> +       }
>>>>>> +
>>>>>>            /* Calculate how many clk_hw_onecell_data entries to allocate */
>>>>>>            num_clks = mcd->num_clks + mcd->num_composite_clks;
>>>>>>            num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
>>>>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>>>                            goto unregister_clks;
>>>>>>            }
>>>>>>
>>>>>> +       if (mcd->need_runtime_pm)
>>>>>> +               pm_runtime_put(&pdev->dev);
>>>>>> +
>>>>>>            return r;
>>>>>>
>>>>>>     unregister_clks:
>>>>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
>>>>>>     free_base:
>>>>>>            if (mcd->shared_io && base)
>>>>>>                    iounmap(base);
>>>>>> +
>>>>>> +       if (mcd->need_runtime_pm)
>>>>>> +               pm_runtime_put(&pdev->dev);
>>>>>>            return r;
>>>>>>     }
>>>>>>
>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
>>>>>> index 22096501a60a..c17fe1c2d732 100644
>>>>>> --- a/drivers/clk/mediatek/clk-mtk.h
>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.h
>>>>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>>>>>>
>>>>>>            int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>>>>>>            unsigned int mfg_clk_idx;
>>>>>> +
>>>>>> +       bool need_runtime_pm;
>>>>>>     };
>>>>>>
>>>>>>     int mtk_clk_pdev_probe(struct platform_device *pdev);
>>>>>> --
>>>>>> 2.43.0.472.g3155946c3a-goog
>>>>>>
>>>>
>>>>
>>>>
>>
>>
>>



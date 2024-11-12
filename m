Return-Path: <linux-clk+bounces-14570-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BD9C50CE
	for <lists+linux-clk@lfdr.de>; Tue, 12 Nov 2024 09:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C1628188B
	for <lists+linux-clk@lfdr.de>; Tue, 12 Nov 2024 08:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B120BB49;
	Tue, 12 Nov 2024 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C36otA0o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230B20BB21
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400597; cv=none; b=Cs0u0bCd4rfdQ5R0FcZen/PIbj1bxHFNgcc8hTp90YFjAF1aJbRoILwbcqV8FhQ1LVuIxHUlqjCIXsvvzPTUI/MrmUR6ak24mrdZtUgUevq4Q7ppHFhXueIw8JCFlULGeiPnVGdzs8jjujee8g9WmW2hEKaXVcbLKkYXzzab9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400597; c=relaxed/simple;
	bh=YibmPKH9jsHGHFzmm33YvFzPr6+r9g9y7/8t4SPau5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DD2NbafnYoCibRarwus/Ym72XGxTxO9T7TS/eNMPOYSQ9kRQeWq7k4nN+yPvvg5NpVeGjJPb66JQGQZvCX8/Kwo4FvN5lq4eyZx4Gj74JmfpUh+G2o9mSbC8Il6vGZEYj2+JV+mfShqZ4F5Z40TB92aJQnYe4oFs+NSelCIyfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C36otA0o; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so5012904f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400594; x=1732005394; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MXKM1Sqb74I8ZQpKiaye137tCtqvkpww9vx9BtZ+wc=;
        b=C36otA0oSv2AiMs7cexQKShfYbaTYtO6KImopOATYSCP7UyKluCfRBVb+kBbEx7mOL
         U6jg/CbCo4HD9zy8ZqIqMr2gDOvEl1QfvzbI8kR2O9KPw0RMQhNEOjQCdJcFtWGmO5iu
         dpQy5sCrg9q9T0X1Wu9vD1Yrgx5u+uNMqQIFDEw4facRL0C035Ebs2p2HZjxq0/+ZuXR
         fWsVUiMSzEwmnAZZGRgbtjXG/DTqPqRagZKFNCw/7ALzMAYGD7ArikTjEBpN8doz4m2i
         kD+p4DpTXCsiBqmZe+SztuO4stNOsRZmBC7bSAhywv6qhyT7Ysn6hhGGHkJ0M2SIDHww
         Fx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400594; x=1732005394;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MXKM1Sqb74I8ZQpKiaye137tCtqvkpww9vx9BtZ+wc=;
        b=H8wvgcrUo4tiEkqXqgV46KBwJe5nc5sLSdoP2RacmKo1naXKTJc53BFq0hH1B6wPyq
         nMzwMFkFfNOInW2O/ZETlnk8njDueWyPm/YnaJbagbKkZxDFM4oQhUMI8GJpniuxuSMR
         gijLlP4MSAe0qX3eqn2AfefB90vNaIKWJlctX3Amwv1rr/PS+PU0by/WJXeiumFIrjJX
         nS66cfEANjQxrXaNwF46ceZZkltzBxuHAgRwlsiG2KyV3ZADWZFMN30LYV67KLQuWURS
         C93EdLhUfXeUO35FVWwwwTzrNswQsdA/LFYbm7UHcJpl0/VcHJ8LQWWO/qiqN0cXFUon
         RyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh5KLvZDuT3TNVCFc+4Ev46bLJK8fA59Ymy8qQw0Mle2h4cJPb/OX8rGLWYtcGJCUeI5eSnUjHvR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7FORejkvYqTM8cz8F/6Em29hzfGYW0Ed3+7cKscIZUWUgyTtx
	ClEnGk5m+wItPOK2leuKW4UBPMhx2Lvw2jwEhvXkVsK8/QN9oEnJMzF4HRFMMFo=
X-Google-Smtp-Source: AGHT+IH8yunZYqyZqpSqETzBCKEoRJ1QIodl+MOpYN4uXnicVv8QU+PV+QjD7NHinPY4E5kCPs85PQ==
X-Received: by 2002:a05:6000:1fa1:b0:37d:3e6d:6a00 with SMTP id ffacd0b85a97d-381f1884805mr15336017f8f.47.1731400593801;
        Tue, 12 Nov 2024 00:36:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed997320sm14968695f8f.47.2024.11.12.00.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:36:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
In-Reply-To: <5eb12197-330c-4f55-82f7-d13ea458ba43@amlogic.com> (Chuan Liu's
	message of "Fri, 8 Nov 2024 19:49:59 +0800")
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
	<20241004133953.494445-1-jbrunet@baylibre.com>
	<07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
	<1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
	<85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com>
	<1jcyj62gi7.fsf@starbuckisacylon.baylibre.com>
	<5eb12197-330c-4f55-82f7-d13ea458ba43@amlogic.com>
Date: Tue, 12 Nov 2024 09:36:32 +0100
Message-ID: <1j4j4c3l2n.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 08 Nov 2024 at 19:49, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 11/8/2024 5:59 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Fri 08 Nov 2024 at 17:23, Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>>>>>> -       if (core->flags & CLK_IGNORE_UNUSED)
>>>>>> +       /*
>>>>>> +        * If the parent is disabled but the gate is open, we should sanitize
>>>>>> +        * the situation. This will avoid an unexpected enable of the clock as
>>>>>> +        * soon as the parent is enabled, without control of CCF.
>>>>>> +        *
>>>>>> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
>>>>>> +        * forcefully enabling a whole part of the subtree.  Just let the
>>>>>> +        * situation resolve it self on the first enable of the clock
>>>>>> +        */
>>>>>> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>>> At first, I couldn't grasp the logic behind the 'return' here. Now it's
>>> clear. This approach is equivalent to completely giving up on
>>> handling clocks with CLK_OPS_PARENT_ENABLE feature in
>>> clk_disable_unused_subtree().
>>>
>> No. It's handled correctly as long as the tree is in coherent state.
>>
>> What is not done anymore is fixing up an inconsistent tree, by this I
>> mean: A clock with CLK_OPS_PARENT_ENABLE, which report enabled from its
>> own registers but has its parent disabled.
>>
>> In that particular case, clk_disable_unused_subtree() won't be turning on
>> everything to properly disable that one clock. That is the root cause of
>> the problem you reported initially. The clock is disabled anyway.
>>
>> Every other case are properly handled (at least I think).
>
> name              en_sts            flags
> clk_a                1          CLK_IGNORE_UNUSED
>     clk_b            0                0
>         clk_c        1         CLK_OPS_PARENT_ENABLE
>
> Based on the above case:
> 1. When 'clk_c' is configured with CLK_OPS_PARENT_ENABLE, disabling
> 'clk_c' requires enabling 'clk_b' first (disabling 'clk_c' before
> disabling 'clk_b'). How can to ensure that during the period of
> disabling 'clk_c', 'clk_b' remains enabled?

That's perfect example of incoherent state.
How can 'clk_c' be enabled if its parent is disable. That makes no
sense, so there is no point enabling a whole subtree for this IMO.

>
> 2. 'clk_c' is not configured with CLK_IGNORE_UNUSED, it should be
> disabled later. However, here it goes to a 'goto' statement and then
> return 'false', ultimately resulting in 'clk_c' not being disabled?

We've discussed that 2 times already. This discussion is going in
circles now.

>
>>>>>>                    goto unlock_out;
>>>>>>
>>>>>>            /*
>>>>>> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>>>>>
>>>>>>     unlock_out:
>>>>>>            clk_enable_unlock(flags);
>>>>>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>>>>>> -               clk_core_disable_unprepare(core->parent);
>>>>>> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>>>>>>     }
>>>>>>
>>>>>>     static bool clk_ignore_unused __initdata;
>>>>>> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>>>>>>            clk_prepare_lock();
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_root_list, child_node)
>>>>>> -               clk_disable_unused_subtree(core);
>>>>>> +               clk_disable_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>>>> -               clk_disable_unused_subtree(core);
>>>>>> +               clk_disable_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_root_list, child_node)
>>>>>> -               clk_unprepare_unused_subtree(core);
>>>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>>>> -               clk_unprepare_unused_subtree(core);
>>>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>>>
>>>>>>            clk_prepare_unlock();
>>>>>>
>>>>>> --
>>>>>> 2.45.2
>>>>>>
>>>> --
>>>> Jerome
>> --
>> Jerome

-- 
Jerome


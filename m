Return-Path: <linux-clk+bounces-3870-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3085D15F
	for <lists+linux-clk@lfdr.de>; Wed, 21 Feb 2024 08:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60790288A60
	for <lists+linux-clk@lfdr.de>; Wed, 21 Feb 2024 07:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268AA3A8F5;
	Wed, 21 Feb 2024 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ijj4DS7v"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C624B57
	for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500462; cv=none; b=mFz34IPqL7+D4PigGjUMPoS0hIvTuIqYpRSCWR4rlgyXjlrkf2tNzUWLvyzoIra0NYzku981Mx50Ko8UQkqmPCgefu9x3NR355ina8QYvJjg20FOiLIfEofY3mf6gZopuN8Xc7tz/uwSrchjsEF84IGcjxDJamGUlLW21+0biJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500462; c=relaxed/simple;
	bh=i/Z255Tf2x8i7s/H6pawdDSPBpzQEqOfG7zhdoGwFMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHIXqKHhghYsF9wgrl1LiaZZVmnSHzIoCUmbAJHEDQyiRg3BaFE7EE3ww63+OLxonlhE1M5ZXj0g2CQNJu/P7V8kpOmUPvQu7JoH3aS0AG7KhXkmlKc2z2kZO9qEcFhGCxxr3+liXFlnxl350N+CAMjruM9fF2V2CwR4EbUZo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ijj4DS7v; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3e550ef31cso22489666b.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 23:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708500458; x=1709105258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmVElpnqL+d6DT1A1PN7w2052IYFt/BLMTqk1R3bSYE=;
        b=Ijj4DS7vgxV8KcSxDvgCOVqWliccqNzFAIOVo51W/k/4wsPjfTkxy+M5TILNxsPxCk
         SiXM1W2rbtQmlw/ulp9xZntcfFhtXK2MwOFblEmJm5yfRt7imVE4REHLQ8KE2ab4vM0T
         sLXKOW/7H97mR1TsXmtMUghvmIH4b/Hu6XG8GJp/VzTzNadRgQLnWN1DAcwguzjMCfV9
         P8HFeP+4DFX/QJzxkDHfRewuaTDndax+FDCJfEROFJcLhp5o7mLUicEb+kVRjz3/BiWP
         P692AdlmZwKwA5MjMDA+tWnq80tqdJmuluKNISIU0jgSa312zl6rlcoFJ9x1qXTAB8vT
         IRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500458; x=1709105258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmVElpnqL+d6DT1A1PN7w2052IYFt/BLMTqk1R3bSYE=;
        b=RC6zTVllSoLnX/6qf7HuZRU898LYJDtMH0JBUgc7T56/VwQ+IWvjBfPBhUDafLI6Yf
         5ZpMqpzsqAkqghwk7WBW9Tbplq5ZV7XEgC8QX6AjjO4f2AmySXD0MNcLK7A13YS1n3BJ
         YMkJhIS2MrcAUT8qHqmVhZVh6VvXr7LmQF2do2uHqnDSLNWNknoBK72o6hx7CaBqYJTp
         t22dg3fqPoAAp8JuUzAq2DWVmZVP/0ZIWCNuFg2W7YkJwZzLoDBSIhvEZTdCPbYujCTn
         3gKJlTSh1E1qPcR7Bs/VEbjniZ+Rfir5KS6KxikPtkJ1AW9LjGGbVouR5DSWplIt1o//
         63mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/9sfa3Yu2/eBM4+fXjT+EUe8NpU7f0QHgweTgqKERCTpP6+en66WBI6re6sgdyIlTj7+Z6cqHp8bsx7D5v3ThlxwdXCkczBlz
X-Gm-Message-State: AOJu0YwyQJKE0bvxYpiBWv/XQFS03jDAdgl50ZXZJ5kIeIa8YgZvIuCM
	CwYVmdeZg5LzmUuR00UoFqACh/FizRrNHgQEC6dhCgY2/suZBy7siIREI5Z+d9Q=
X-Google-Smtp-Source: AGHT+IFkzmnEdTYzMCJUOIA3d/1xojV557WWMTF7vx7ECfLIDE8GAWAFdeUxqkFDzkS0ac3tOY+Vew==
X-Received: by 2002:a17:906:c28e:b0:a3f:33e:9ecb with SMTP id r14-20020a170906c28e00b00a3f033e9ecbmr2629145ejz.32.1708500458415;
        Tue, 20 Feb 2024 23:27:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vg8-20020a170907d30800b00a3d70dc4337sm4657844ejc.102.2024.02.20.23.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 23:27:37 -0800 (PST)
Message-ID: <9dc9306b-ff1b-48aa-ae03-3fabcccf480d@linaro.org>
Date: Wed, 21 Feb 2024 08:27:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: clock: histb-clock: Add missing
 common clock and Hi3798MV200 specific clock definition
Content-Language: en-US
To: Yang Xiwen <forbidden405@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217-clk-mv200-v2-0-b782e4eb66f7@outlook.com>
 <20240217-clk-mv200-v2-1-b782e4eb66f7@outlook.com>
 <875b706f-801a-4a4c-8806-411a67c5a5e7@linaro.org>
 <SEZPR06MB6959456E59D84C15F0C1B88396502@SEZPR06MB6959.apcprd06.prod.outlook.com>
 <90e0dc10-8514-4827-998f-15b4d45d874e@linaro.org>
 <SEZPR06MB69594CBF0625989A5C54DC9096502@SEZPR06MB6959.apcprd06.prod.outlook.com>
 <3b6ab055-360b-4f73-8d11-8f52b272b7a8@linaro.org>
 <SEZPR06MB695996DD12D23D13D3579A8996502@SEZPR06MB6959.apcprd06.prod.outlook.com>
 <d59ed810-f8d6-492e-aeb6-fd8ed13735a0@linaro.org>
 <SEZPR06MB6959F718988B9A12C2D69D4396502@SEZPR06MB6959.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SEZPR06MB6959F718988B9A12C2D69D4396502@SEZPR06MB6959.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 18:29, Yang Xiwen wrote:
> On 2/21/2024 1:06 AM, Krzysztof Kozlowski wrote:
>> On 20/02/2024 17:31, Yang Xiwen wrote:
>>> On 2/21/2024 12:25 AM, Krzysztof Kozlowski wrote:
>>>> On 20/02/2024 17:19, Yang Xiwen wrote:
>>>>> On 2/21/2024 12:13 AM, Krzysztof Kozlowski wrote:
>>>>>> On 20/02/2024 15:06, Yang Xiwen wrote:
>>>>>>> On 2/20/2024 6:10 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 17/02/2024 13:52, Yang Xiwen via B4 Relay wrote:
>>>>>>>>> From: Yang Xiwen <forbidden405@outlook.com>
>>>>>>>>>
>>>>>>>>> According to the datasheet, some clocks are missing, add their
>>>>>>>>> definitions first.
>>>>>>>>>
>>>>>>>>> Some aliases for hi3798mv200 are also introduced.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
>>>>>>>>> ---
>>>>>>>>>      include/dt-bindings/clock/histb-clock.h | 21 +++++++++++++++++++++
>>>>>>>>>      1 file changed, 21 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/include/dt-bindings/clock/histb-clock.h b/include/dt-bindings/clock/histb-clock.h
>>>>>>>>> index e64e5770ada6..68a53053586a 100644
>>>>>>>>> --- a/include/dt-bindings/clock/histb-clock.h
>>>>>>>>> +++ b/include/dt-bindings/clock/histb-clock.h
>>>>>>>>> @@ -58,6 +58,27 @@
>>>>>>>>>      #define HISTB_USB3_UTMI_CLK1		48
>>>>>>>>>      #define HISTB_USB3_PIPE_CLK1		49
>>>>>>>>>      #define HISTB_USB3_SUSPEND_CLK1		50
>>>>>>>>> +#define HISTB_SDIO1_BIU_CLK		51
>>>>>>>>> +#define HISTB_SDIO1_CIU_CLK		52
>>>>>>>>> +#define HISTB_SDIO1_DRV_CLK		53
>>>>>>>>> +#define HISTB_SDIO1_SAMPLE_CLK		54
>>>>>>>>> +#define HISTB_ETH0_PHY_CLK		55
>>>>>>>>> +#define HISTB_ETH1_PHY_CLK		56
>>>>>>>>> +#define HISTB_WDG0_CLK			57
>>>>>>>>> +#define HISTB_USB2_UTMI0_CLK		HISTB_USB2_UTMI_CLK
>>>>>>>> Why? It's anyway placed oddly, the entries are ordered by number/value.
>>>>>>> So this is somewhat broken at the beginning. It named after
>>>>>>> histb-clock.h but actually they are all clocks for Hi3798CV200 SoC. For
>>>>>>> Hi3798MV200(also a HiSTB SoC), there is one additional UTMI clock.
>>>>>>>
>>>>>>>
>>>>>>> What solution do you prefer? rename UTMI_CLK to UTMI0_CLK, add UTMI1_CLK
>>>>>>> after it and increment all the indexes after it? Then the diff would be
>>>>>>> very ugly.
>>>>>> I still don't understand what is the problem you are trying to solve
>>>>>> here. Your commit msg says add missing ID, but that ID -
>>>>>> HISTB_USB2_UTMI_CLK - is already there.
>>>>>>
>>>>>> I also do not get why there is a need to rename anything.
>>>>> Because there are two USB2_UTMI_CLKs in total, at least for Hi3798MV200.
>>>>> UTMI1 is missing here. For other HiSTB SoCs, there could be even more.
>>>> My comment was under UTMI0. We do not talk about UTMI1...
>>>>
>>>>> If we add USB2_UTMI1_CLK, it looks silly to keep USB2_UTMI_CLK without
>>>>> renaming it to UTMI0. Just like all the other clocks. E.g.
>>>>> I2Cn_CLK(n=0,1,2,3,4) etc.., so the same for USB2_UTMI_CLK.
>>>> Then place it next to old name and explain why it is deprecated with
>>>> comment.
>>>
>>> Do we need to keep the old name? I can fix all the users (only
>>> hi3798cv200.dtsi) in next version and drop this name directly. Is that
>> All users in all projects? That might be tricky. And even for Linux
>> kernel, how can you do it in a bisectable way? Just keep old name.
>>
>>
>>> okay? Should i insert UTMI1_CLK to the middle and re-index all the
>>> macros after it? Or simply add it to the tail?
>> Bindings and header constants are ABI, so you cannot change them.
> 
> 
> This file should be renamed to hi3798cv200-clock.h, it shouldn't be 
> called histb-clock.h from the beginning. Now I have to workaround this 
> in a dirty way. What if another HiSTB SoC has 3 or more UTMI_CLKs? Do we 
> need to add more definitions to the end of the file? The file is gonna 

That's not a big problem, but indeed shows poor design of the driver and
bindings.

> to be more and more unreadable with scattered clock definitions.
> 
> 
> Do you think it's acceptable to create a new header file instead? I 

This depends on the purpose of it. In general every SoC follows that
concept - binding headers are per given clock controller, not even per SoC.

> think we don't need a generic histb-clock.h. Each SoC should maintain 
> their own clock indexes header file. Maybe we can rename it to 
> hi3798cv200-clock.h and include it from a new histb-clock.h (also mark 
> this generic header file deprecated and only for hi3798cv200). Then I'll 
> create hi3798mv200-clock.h header file instead. So we don't have to 
> workaround this.


Best regards,
Krzysztof



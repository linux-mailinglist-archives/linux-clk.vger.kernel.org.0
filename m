Return-Path: <linux-clk+bounces-3854-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EF785C15E
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 17:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD3E0B25298
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58E279DB0;
	Tue, 20 Feb 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHldAhU6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2779922
	for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708446360; cv=none; b=tTiJHpVZmZahz4fm8inWGJ0FOZjxkOhHMSiFBMgSQrmMQJCnWth/nme5hQXelESCvAKDAVkuTXZe6BDWBK6xpqVFoHIAPdvlBNB/1OIE9QujAWsEndRdmSeWZUUnqMfKxUazYQAUXN7kgZweGW/exW6dYeFeF0bkJ+YpkSy/9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708446360; c=relaxed/simple;
	bh=MtNTYYK+6+28ekFQX5xbREmMjtYbjCbTHU3QVy5WdIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwySLrxUTR83qNlbjfqm6QOoi1tJkMw29ePHFHPUPl0LyMty2ekIG7tPSrpCPUAJO44pUzq7Mt7YVlJx2fxbOWno6febaG8u87/J0fp56XUjE0ZKLStJIeBNAS1I3MV/oKkLIn9NuGQdwmjNibPkd4V3eS9EUQT6i/qFsW30vjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHldAhU6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-561587ce966so11379071a12.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708446357; x=1709051157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZ8v8X2fbB2BWapJA2Df3qbqU4Mifn6M/QSqXXZqY7c=;
        b=UHldAhU6ftxK6UX4+A6zg4LTvsoATzfSmv3gob3hG+ZeTcuFzpo8I+wt8TP9qtP/bt
         bHqp+hurSNdz5tBp8nNC2rYnkGJ51/ef8uRNEdjZEMy7Pl+A5Vdb93Yz7uHpYOieawp9
         PSGHOhnA0f5qkNt+eyaPuBWvw6GQ5Dl5foRVguQ2NYRlx52n6Vs0SyIST/Fbi0r0KOLN
         FVQ7KbNumw4kdN3maIu0gkf3QLgC+Gwzrui77O8B8LfV4Lslv/r22Uo7b2iIo4l1enyX
         x9XAeKi6TME19CKMpxYgS9gLzq6AzaDh82nNn8vlxACLixXmN9T+62Ku1S4+AYC5aQir
         6d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708446357; x=1709051157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ8v8X2fbB2BWapJA2Df3qbqU4Mifn6M/QSqXXZqY7c=;
        b=uNEF2fiGQtB2WW4iHvtS3D3IpPSXbMaG2HydpuSwHbgqi+K7P4eHBkTA/ISRUnbBV3
         BblLtVirQsv4ewTerF58PSB4Qs7t8xA/y4hirWX2RJw5ayUWAUUsTAAOHq0XpBy6NxGu
         PNJFmdj8GSpaL9ik0NWTXSHnBNa/3O3lUXCDGPJec3Uc3jGwzc7LB7YIRdbULphoPABq
         NiC45D1hs0Ep//01Zu4fcr5mPKMr+JZMuuXDmDdChuRydM/uSKNY2MRYLF4H0i1ckudS
         lkrYjshHC/zeieVKtWUGBeY1U1lxbBygo/sJ36IVS9sXQ8BKCvrBQJVVmt6BuEPTmdzX
         ywZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQXMc9WB4akn8mozM1nS6HOBbajEO8L0W9lxWUH0HYY7d8B3dwuZxPWtaJpeELMFhcmOPq/ldH4HUFbb+qw8ZfS0X3nSFyJwjN
X-Gm-Message-State: AOJu0Yx0ug116MObFhITjr1A1bG5to1Zvr99UjTIZ1VsE3wDQFGaLiqV
	RsMBNTkSTpd6Gn9J4x28SWEQq3YZWfg5pM+msPMq3D4VqvJCwcCEOeS4k1rMn/U=
X-Google-Smtp-Source: AGHT+IFcYYJlEmNaqLGIavK/2e+eL7voViTM/Mm2lFBExB6izE82wDysrJtvZSWkNUc6UZ7uvH8OSg==
X-Received: by 2002:aa7:c908:0:b0:564:b94d:70df with SMTP id b8-20020aa7c908000000b00564b94d70dfmr3036075edt.17.1708446356733;
        Tue, 20 Feb 2024 08:25:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n11-20020a056402434b00b00560c07f986asm3759697edc.58.2024.02.20.08.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 08:25:56 -0800 (PST)
Message-ID: <3b6ab055-360b-4f73-8d11-8f52b272b7a8@linaro.org>
Date: Tue, 20 Feb 2024 17:25:54 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SEZPR06MB69594CBF0625989A5C54DC9096502@SEZPR06MB6959.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 17:19, Yang Xiwen wrote:
> On 2/21/2024 12:13 AM, Krzysztof Kozlowski wrote:
>> On 20/02/2024 15:06, Yang Xiwen wrote:
>>> On 2/20/2024 6:10 PM, Krzysztof Kozlowski wrote:
>>>> On 17/02/2024 13:52, Yang Xiwen via B4 Relay wrote:
>>>>> From: Yang Xiwen <forbidden405@outlook.com>
>>>>>
>>>>> According to the datasheet, some clocks are missing, add their
>>>>> definitions first.
>>>>>
>>>>> Some aliases for hi3798mv200 are also introduced.
>>>>>
>>>>> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
>>>>> ---
>>>>>    include/dt-bindings/clock/histb-clock.h | 21 +++++++++++++++++++++
>>>>>    1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/include/dt-bindings/clock/histb-clock.h b/include/dt-bindings/clock/histb-clock.h
>>>>> index e64e5770ada6..68a53053586a 100644
>>>>> --- a/include/dt-bindings/clock/histb-clock.h
>>>>> +++ b/include/dt-bindings/clock/histb-clock.h
>>>>> @@ -58,6 +58,27 @@
>>>>>    #define HISTB_USB3_UTMI_CLK1		48
>>>>>    #define HISTB_USB3_PIPE_CLK1		49
>>>>>    #define HISTB_USB3_SUSPEND_CLK1		50
>>>>> +#define HISTB_SDIO1_BIU_CLK		51
>>>>> +#define HISTB_SDIO1_CIU_CLK		52
>>>>> +#define HISTB_SDIO1_DRV_CLK		53
>>>>> +#define HISTB_SDIO1_SAMPLE_CLK		54
>>>>> +#define HISTB_ETH0_PHY_CLK		55
>>>>> +#define HISTB_ETH1_PHY_CLK		56
>>>>> +#define HISTB_WDG0_CLK			57
>>>>> +#define HISTB_USB2_UTMI0_CLK		HISTB_USB2_UTMI_CLK
>>>> Why? It's anyway placed oddly, the entries are ordered by number/value.
>>>
>>> So this is somewhat broken at the beginning. It named after
>>> histb-clock.h but actually they are all clocks for Hi3798CV200 SoC. For
>>> Hi3798MV200(also a HiSTB SoC), there is one additional UTMI clock.
>>>
>>>
>>> What solution do you prefer? rename UTMI_CLK to UTMI0_CLK, add UTMI1_CLK
>>> after it and increment all the indexes after it? Then the diff would be
>>> very ugly.
>> I still don't understand what is the problem you are trying to solve
>> here. Your commit msg says add missing ID, but that ID -
>> HISTB_USB2_UTMI_CLK - is already there.
>>
>> I also do not get why there is a need to rename anything.
> 
> 
> Because there are two USB2_UTMI_CLKs in total, at least for Hi3798MV200. 
> UTMI1 is missing here. For other HiSTB SoCs, there could be even more.

My comment was under UTMI0. We do not talk about UTMI1...

> 
> 
> If we add USB2_UTMI1_CLK, it looks silly to keep USB2_UTMI_CLK without 
> renaming it to UTMI0. Just like all the other clocks. E.g. 
> I2Cn_CLK(n=0,1,2,3,4) etc.., so the same for USB2_UTMI_CLK.

Then place it next to old name and explain why it is deprecated with
comment.

Best regards,
Krzysztof



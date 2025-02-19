Return-Path: <linux-clk+bounces-18297-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D304A3B62C
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 10:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADB617286C
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAD41DFE0C;
	Wed, 19 Feb 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hu3XFiON"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A71B6D0A
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955110; cv=none; b=noQ6HEhoN14eoiHf8PS+K3AI950g1ipHQIYjZX5WuLhZCH1jjk3s5qee2gSLq8kQpn1Xl4Na+N9VZKwXLlBfl++nrtBz5pEj+uqwGHuLz29x7Cg11apJdEHht9Um/iusQGFfIqhej1JYiIdLwxQQwW7Kreiii96iqFI4X091MHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955110; c=relaxed/simple;
	bh=4hEJCtsnqq4IxG0/jdpykXd8yIpqzDbGLFMkp9yeVds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tgC7t3+zZHD1xG2SfSvWT8CW7UNEzFLKcer1qfDaAb62WkRCnKmd5vpgEia16y5TVAgOhsfUPhyvFAPwVu1qdvaZn6+CdRHCLN9iqDS9ujCw2fAfhwZqIFH16mcn2spRriCh1XZTn8KAjNw5fuf73fJRnmu5K5H9wh9w/TEOqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hu3XFiON; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbc38adeb1so229600766b.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 00:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739955103; x=1740559903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2dopUOEbkWXudLU7sGnWO1wuCY7VI0h4RAqKInLyyw=;
        b=Hu3XFiONQpWzzuRi4ikpbNt8qydWJDT0R5Ca+gCgpyhAfkvYpeSMA9wY4il7MdmQ6M
         TmWdGmH2aCCs5QF05WSI07+TORMvgt0huv/n+cFNVJUdme88KWknGoBOZtFbYKeyoFjX
         Q7qMMmaNeG8tofiGPxNC2U9mMKWNAglh9bnBeGxB9ABOheMnKrTwg+aTFyqdQDx4REjP
         iVidBNJI9GQX0Nf65dDgSB5jQZXq5h0QVKFOgEgyNi9Jf8h+u0LW/hetagL4+1rhiEDM
         DVq4H1bycmr/asrrDgHtEx9J2Q2zZgWbVjpWhvOq8GsPp9ZLhvlxoS1wq+Ja35ezc3dZ
         3/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955103; x=1740559903;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2dopUOEbkWXudLU7sGnWO1wuCY7VI0h4RAqKInLyyw=;
        b=IzEbmV7NYgOGUUJGU5hf12gtt/BeVK91ejv4yYaSXugHHKtL+nUHV2fhKwqAt7EDmw
         ZoMr1hhrqJW7KbQpF0b3oDutPmTkkneEOlnsVSjS7gPEWrtI5LmR5Pr7S/Qd0CmHpNXV
         K6uh28/Df1GNz8hvSvA2LxnUQmqUxfneMk9xmOJW7X/fNP7ervXyXP+eRF7Bq0wkkPHq
         bTZV0OPhslzLSbBSJhpIDGy4uJWkqCDE4AqE2a/WgwyQO/dNLSy2YX+a/+64dWaa/rCI
         6nsvxqk7AW3L3CH24vkMwsKrWeG7LKw1jLeGMFZFFjweU9XFJBJAxu1nLnyun9Yu+3pj
         nQBg==
X-Forwarded-Encrypted: i=1; AJvYcCVm6HpPxdp2tTCcY5SvBdNcJ1Ecavqfhx8DdBQVHbY0PqKy2YRDlJgXie+iKQTl8o6HBrN+tje1pH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90XM0NetGoRl0zWDULZBevhjCuwuWc5pBWBlmsGiw2NpEcZl7
	7V9BCkwTPcbb0pVhJRXYAXSZ+eJAgkryJowIHDJTs/qN0EcqzpgWpakp5ulTWVA=
X-Gm-Gg: ASbGncvkznK6t8jo20PA+Vg5SY0Lbj0rYk/8RcNsi21LeFmuQJeqHX8U7cWf+vMAkzd
	KmaoMCcPiJatk2+C1lYRpxEoS7hG9o1OLPsM7nw4gCrfMA1QDPjtNJBk8JOoSZmuBg4ilheOzwd
	xWbkhA9eHBeP+KZuOtCE6wLeevvOJsrMm+CS1HkZ/J3csf8qjOhbGLNVdA3oT6D9XWlZQMrhoMB
	Y56sKSun/oy/p/iAWlGipo+rsf23Qh1rd8TXeqakwakigF3naK/1Ls9FuLEOjzSdyt5lnp4Tg6N
	h7Z3KP6kFH0nk0Xykg0t07g=
X-Google-Smtp-Source: AGHT+IFy5LMwjMHF+lyBsWbylZGlIxP2bWCWlwmQuf2NyzqyYPCLtQrAK5Xis2XKpiM0bordtD+JoA==
X-Received: by 2002:a17:907:96a1:b0:ab6:fd1d:ef6b with SMTP id a640c23a62f3a-abbccebec04mr281429866b.27.1739955102477;
        Wed, 19 Feb 2025 00:51:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm1246033266b.68.2025.02.19.00.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 00:51:41 -0800 (PST)
Message-ID: <a99ab8eb-274b-449c-8bb6-be9422c5b2a2@tuxon.dev>
Date: Wed, 19 Feb 2025 10:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
 <a1dff4af-d771-4424-869f-15d3b6bca013@tuxon.dev>
 <20250217-shortwave-scoreless-38cb49fe5548@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250217-shortwave-scoreless-38cb49fe5548@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 17.02.2025 11:47, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Mon, Feb 17, 2025 at 11:11:44AM +0200 schrieb Claudiu Beznea:
>> Hi, Alexander,
>>
>> On 10.02.2025 18:44, Alexander Dahl wrote:
>>> Before adding even more new indexes creating more holes in the
>>> clk at91 drivers pmc_data->chws arrays, split this up.
>>>
>>> This is a partial split up only for SoCs affected by upcoming changes
>>> and by that PMC_MAIN + x hack, others could follow by the same scheme.
>>>
>>> Binding splitup was proposed for several reasons:
>>>
>>> 1) keep the driver code simple, readable, and efficient
>>> 2) avoid accidental array index duplication
>>> 3) avoid memory waste by creating more and more unused array members.
>>>
>>> Old values are kept to not break dts, and to maintain dt ABI.
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     - new patch, not present in v1
>>>
>>>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
>>>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
>>>  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
>>>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
>>>  4 files changed, 100 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>>
>>
>> [ ...]
>>
>>> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> new file mode 100644
>>> index 0000000000000..ad69ccdf9dc78
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> @@ -0,0 +1,24 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +/*
>>> + * The constants defined in this header are being used in dts and in
>>> + * at91 sama7g5 clock driver.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
>>> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
>>> +
>>> +#include <dt-bindings/clock/at91.h>
>>> +
>>> +/* old from before bindings splitup */
>>> +#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
>>> +#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
>>> +#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
>>> +#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
>>> +#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
>>> +
>>> +#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
>>> +#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
>>> +
>>> +#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
>>> +
>>> +#endif
>>
>> I would have expected this to be something like:
>>
>> #ifndef __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
>> #define __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
>>
>> /* Core clocks. */
>> #define SAMA7G5_MCK0			1
>> #define SAMA7G5_UTMI			2
>> #define SAMA7G5_MAIN			3
>> #define SAMA7G5_CPUPLL			4
>> #define SAMA7G5_SYSPLL			5
>> #define SAMA7G5_DDRPLL			6
>> #define SAMA7G5_IMGPLL			7
>> #define SAMA7G5_BAUDPLL			8
> 
> Okay no reference to the old header, but numbers.  Got that.
> 
> I'm not sure where you got the 7 and 8 from here, according to my
> analysis, sama7g5 does not use those.

From include/dt-bindings/clock/at91.sh

#define PMC_IMGPLL              (PMC_MAIN + 4)

#define PMC_BAUDPLL             (PMC_MAIN + 5)


> 
>>
>> // ...
>>
>> #define SAMA7G5_MCK1			13
>>
>> #endif /* __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__ */
>>
>> Same for the other affected SoCs.
>>
>> The content of include/dt-bindings/clock/at91.h would be limited eventually
>> only to the PMC clock types.
> 
> What does this mean?  The clocks split out are no PMC clocks?  

Still PMC clocks. Keeping the types in separate header allows keeping the
code PMC code common for all SoCs. Then the newly added headers will be
used only in the SoC DTes and SoC clock driver (e.g. in your case
drivers/clk/at91/sam9x60.c)

> Then
> the old PMC_MAIN etc. definitions were named wrong?  All or only some
> of them?  Or is this different between older and newer SoC variants of
> the at91 family?
> 
> From a quick glance in the SAM9X60 datasheet for example the clock
> generator provides MD_SLCK, TD_SLCK, MAINCK, and PLL clocks, while the
> PMC provides MCK, USB clocks, GCLK, PCK, and the peripheral clocks.

drivers splits this into:
- core clocks
- peripheral clocks
- generic clocks
- system clocks
- programmable

It's how the code sees it, just a logical split.

Thank you,
Claudiu

> 
> The chws array in drivers/clk/at91/sam9x60.c however gets main_rc_osc
> (from clock generator), mainck (clock generator), pllack (clock
> generator), upllck (clock generator, UTMI), but also mck (from PMC).
> 
> This creates the impression things are mixed up here.  I find all this
> quite confusing to be honest.
> 
>> The other "#define PMC_*" defines will eventually go to SoC specific
>> bindings. "#define AT91_PMC_*" seems to not belong here anyway and these
>> would in the end removed, as well.
> 
> Okay, you seem to have an idea how this should look like in the long
> run.  Are there any plans at Microchip or at91 clock maintainer side
> to clean this up in the near future?
> 
> I would like to rather put my small changes for otpc on top of a clean
> tree, instead of trying to clean up clock drivers and bindings for a
> whole family of SoCs and boards, where I can test only one of them.
> O:-)
> 
> Greets
> Alex
> 



Return-Path: <linux-clk+bounces-8461-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D59127CB
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 16:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D029EB25A03
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844E32135A;
	Fri, 21 Jun 2024 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VSAi2ejo"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DA19BDC
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980248; cv=none; b=rxUeA3R+RyiBR6CEaZv++qqD17FyB628jn+YBnRTYoNDsHrCuGUsbgPtNhafVsm0h2CABlOpbmUo0yM36OxJxp/kNS8oPerJuTxiHHk776ZUXoAN0yPOSTNtfSdDj2q0+euUBDb4BW8UynoY50RIGBPr2xh6e2/ZOqcnfFRwq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980248; c=relaxed/simple;
	bh=l69RXR9caIpgpmBw3miphSwRK/aixhCck2cUWIdXDiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5IrQZ091HHx+g+yi5HzHMPfWYMxM+RgBov4AzOF3Ucf44ot6yvQ074qiv0XcjqLPWRJ5SRd1TU/0PNAvyxfmr7RQsZbrsHEqVOOX30LCUXJyBopr1yag6kzpfuoxdqZLcjN4lhy0kMcJc+Zn+M4eQHaNg7o+n9/WpAzNJuowIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VSAi2ejo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42108856c33so19328115e9.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718980244; x=1719585044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbPIdNuW/e6oq9A4pmtBGwDGU9mCfpj2mUttqFFt4AY=;
        b=VSAi2ejoXHcuQR5f+k/NP0CqysVCW40RzmvjhYijz/EFtNHMlpeB+gzxO5mXoJFwER
         YYN2TMu2ZjpQzWnTJ07ALNUFz4GuacB9sBEeiyswpDZiLsvmdFI0aJ21j9U+jYKttvXY
         ugCNgz8bUXyKODJs/3i7V7RRYjlQB4Al6+c0A+m8AyT7nLpvpFBAHHFmpDS2eVSbYQWm
         BvxBLbeYfRLfc40TvtzwKA/OOARJddeGZufnLRseIWLhQmx5WX01hHRmiHokf+tQVUiq
         flqkyEOVr91gCjnoXv7wRFVXqrTlq1WeCHq5/IXE6ntQcoZr9GiUjGyXUI8JjcnISWkZ
         9AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980244; x=1719585044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPIdNuW/e6oq9A4pmtBGwDGU9mCfpj2mUttqFFt4AY=;
        b=Nuwlc5NytivbHYLboSW84AKo1UvVJb2DMn1PFRph3Gr6tO1FmYdlURkzS8Y2OKWPVN
         lBBdqWVzlJo6HKs/KpoRnlMModIn0QF668Zo4WhlVKxD8NeXWwLTidJlPHDk8MzFab7q
         oXMCKXPe/bLDPpAD+dWdZrjFqQd7i2B5M1CpahBaibNVIO/34DWG4fxBNDmBbzi3T/hB
         XiVmr2P7J0MyN4qP0DuT8uLOnm3Pw3jAmhKcuuGxpdbjMoAvoEfKmrWElvUPDXRRZXDX
         NHhICW9MI9nIWivKDGnUEksJSlQ+z+xQUeAZiWqKAfR8RTESQycNxJthVbBgVVgdBjx5
         KVnA==
X-Forwarded-Encrypted: i=1; AJvYcCWCjRpJnFUOmFAJq0qP98JcAIZNFaikMYNWXHEa0YHwU2QB7Z1muCQBKS4fC9RaR7z01EUlEzAQDI4MHTk65PKJ3VMV0aZeba9D
X-Gm-Message-State: AOJu0YxrXAKBzIZY950r1ByZFsPI7II4Oo2E7qd2iTda++9ui/Z31jL7
	mNBnqd0jFUJH56saMjLyR5UCjxVev9WclVQxZu3W8diBLB2BUYudYGvBMm2MjI8=
X-Google-Smtp-Source: AGHT+IG+o3zct0KzcLvruWFnXBfY6OOJGzZfpCe1OsLKDS1OAKy6kHJWpWDX8qUcg59uhpPDcvP+ww==
X-Received: by 2002:a05:600c:17d5:b0:424:7689:7ac4 with SMTP id 5b1f17b1804b1-424862d7222mr149165e9.1.1718980243592;
        Fri, 21 Jun 2024 07:30:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191c65asm29641445e9.40.2024.06.21.07.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 07:30:43 -0700 (PDT)
Message-ID: <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
Date: Fri, 21 Jun 2024 17:30:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 17:06, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 2:30 PM
>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>>
>>
>>
>> On 21.06.2024 16:10, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 21, 2024 2:06 PM
>>>  Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>> the R9A08G045 support
>>>>
>>>>
>>>>
>>>> On 21.06.2024 15:56, Biju Das wrote:
>>>>>
>>>>> Hi claudiu,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Friday, June 21, 2024 1:55 PM
>>>>>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>>>> the R9A08G045 support
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 21.06.2024 15:34, Biju Das wrote:
>>>>>>> Hi Claudiu,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>>>> Sent: Friday, June 21, 2024 12:23 PM
>>>>>>>> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>>>>>> the
>>>>>>>> R9A08G045 support
>>>>>>>>
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is
>>>>>>>> compatible with the version available on Renesas RZ/V2H
>>>>>>>> (R9A09G075). Most of the IP variants that the RIIC driver is working with supports fast mode
>> plus.
>>>>>>>> However, it happens that on the same SoC to have IP instatiations
>>>>>>>> that support fast mode plus as well as IP instantiation that
>>>>>>>> doesn't support it. For this, introduced the renesas,riic-no-fast- mode-plus property.
>>>>>>>>
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8
>>>>>>>> ++++++++
>>>>>>>>  1 file changed, 8 insertions(+)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>> index 91ecf17b7a81..c0964edbca69 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>>>>                - renesas,riic-r9a07g054  # RZ/V2L
>>>>>>>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>>>>>>>
>>>>>>>> +      - items:
>>>>>>>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>>>>>>>> +          - const: renesas,riic-r9a09g057
>>>>>>>> +
>>>>>>>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>>>>>>>
>>>>>>>>    reg:
>>>>>>>> @@ -66,6 +70,10 @@ properties:
>>>>>>>>    resets:
>>>>>>>>      maxItems: 1
>>>>>>>>
>>>>>>>> +  renesas,riic-no-fast-mode-plus:
>>>>>>>> +    description: specifies if fast mode plus is not supported
>>>>>>>> +    type: Boolean
>>>>>>>
>>>>>>> Can't this info, as part of device data?? Based on frequency and
>>>>>>> device data is enough to derive this info??
>>>>>>
>>>>>> We can't rely completely on device data because on RZ/G3S we have 2
>>>>>> RIIC channels that support fast mode plus and 2 that doesn't support it.
>>>>>
>>>>> Can't array of bits for this channels won't help??
>>>>
>>>> Can you give an example? I'm not sure I understand how you would
>>>> prefer me to use the array of bits.
>>>
>>> struct riic_of_data {
>>> 	u8 regs[RIIC_REG_END];
>>> 	u16 fast_mode_info info; /* 1 means fast mode plus supported,
>>> starting with channel 0*/ };
>>>
>>> .info = 0x3, means channel 0 and 1 has fast mode plus supported .info
>>> = 0x0, none of the channel supported fast mode plus.
>>
>> If I understand the proposal correctly, a match b/w struct riic_of_data::info bit + frequency and
>> the nodes in device tree is still needed, right? As the RZ/G3S RIIC channels are using the same
>> compatible.
>> W/o a match how I cannot detect in the driver who is, e.g., channel 1 that supports FMP w/o
>> hardcoding some RIIC channel data in the driver (e.g. RIIC channel address)?
> 
> bit array gives the capability info on various channels.
> 
> If someone define fast_mode_plus frequency in DT node and channel is not fast_mode_plus(from the capability info)
> then you should return error.
> 
> Here you need to use SoC specific compatible as each SoC has different capabilities.

And I would add, as it is in this case: there are multiple instantiation of
the RIIC in RZ/G3S SoC. RIIC 0 and 1 supports FMP, RIIC 2 and 3 does not.

For all RIICs (0, 1, 2, 3) we use the same compatible (as all are part of
the same SoC). How to do the match b/w DT RIIC channel and driver with the
solution you propose w/o hardcoding some RIIC channel data in the driver?

> 
> Cheers,
> Biju
> 
> 
>>
>> Also, for future SoCs that will suffer the same symptom but for different channels (and channels
>> with different addresses) the driver will have to be adapted to match b/w the channel bit in struct
>> riic_of_data::info and channel node from DT.
>>
>>>
>>> Cheers,
>>> Biju


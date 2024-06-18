Return-Path: <linux-clk+bounces-8149-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3B90C6DA
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 12:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35E51F22CB1
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C2314A0A5;
	Tue, 18 Jun 2024 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XU3hsbcs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E411494A1
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718698296; cv=none; b=t2MMcrrT+5DmWAbnZH/5Zlh4ZtgsLscqLwyLRxDGZs+auHJw5+YqW07lmGqBqgfT98jmVxXi57N2Swt0XsPPFspF/0zftTcCs8OwQHWdyuBKj+KEXOgug8w9861V9d2u/r0qwbxQbYBNsieifEsje5pQnJatg4HWK3VwBV5UQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718698296; c=relaxed/simple;
	bh=2KNMmat5vMET2BDI7NUXUz9iV8jjghd0Qaf7pSQvWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmaLYO6Z07A8zME1K9vWvEbdzq2jJ5yKXTxBCL7VFraYsrngMKLk5PMyngCFLTiWy0UJ7bZQbnj6gP/0nfWEZiU3Bv9hm/baOAZTZ4RYZm0f9EUaAhGAVx6dCpeJr21vgq5KTkpf1QrarnhQ55jGEzfRe3vNWIVCF1C+x9D7gFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XU3hsbcs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42165f6645fso42213395e9.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718698293; x=1719303093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Db/Ttkm8Wt1DAojtG+l5i3VYAIO56vuiF9BvfZCWUE=;
        b=XU3hsbcs6oN4mExeSoAh7KhcLS6krsD89eVRRiZDBOHpP98+i0yBPiudWLfNIexlJC
         ouihp8C99os4Xses4INfKTAib8W/j4WOEWCw/Rv0Bo/32czrzhul0WlocnN2BWqNuCsA
         kvD5gii341WdbDhOgVDoodAuBe7vv1H5QzSgoNLL17py8xgORxnN7hjrT6LIxuVmsGwb
         BMTW00qy31qvRmR6Df/t7pwxiuUkniVtRL0px3It0GacLgjKCKiDppN3PHJ5S8wP0C6h
         d5d74zrnSm9jcksmwBVmPgrhbK1RtqIKOfBvpgo0SV4Mo5HwU7ZuLLBCKVRvCI1QGpRP
         BVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698293; x=1719303093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Db/Ttkm8Wt1DAojtG+l5i3VYAIO56vuiF9BvfZCWUE=;
        b=NgQ9HHIRHM/hTUUCrlIK+x+FoMGFeAjoUia1v/iuC3A+YlxPUAyJbDqs5+WC5gDsKY
         eGEuPNR0mIU5+qsGee+CQV59aHIClm8U5Bx/n+lNOQXFF5ip8G3GTF/VvXSr1v7pyZYc
         ClLsjjehqv03OD0eVDOguYAaomXVNLfzzF82pnpgVSPZS8t4fHkyXgHGZIr3GNDiL8V7
         SKpjPd8tD4VvUZx5WR8JiPVMOGxrW4i5iXHHvdoJy267++JkZ+710iOg858B7TThCBRF
         J7QfEvglCVco2+fCL35CplmMawIATVA/ZGJz1Z3hIKnKnrVBlPDnKO50F+9AO/Utnz5W
         8I9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVujrGqByMJzgjOLRybRm63k+CbvV6PTNL5UX0QxLahiFIjqypHKaBm2Nh9/Cgat6fa+oQbUGXF88K5vEyPkzP43IXyJNZZqcY1
X-Gm-Message-State: AOJu0Yzy7E8WCAg83Svol17zyO8fgv2l/s/F2xun1gjjNxYsY7rXY3A+
	jD2Us8h5w1FAqsmv2ION1ckK6c/Wm8leeeiqeF0ONUH5B3LG8h/Sn+YgRzvcM5k=
X-Google-Smtp-Source: AGHT+IEZ4zfien/Ap0pCf2tDyhM1mJ0USifoiBZp4jjoL6ZEetj9nRXUeKMXuBuNxOiTYrJSsTYSkA==
X-Received: by 2002:a05:600c:4fcc:b0:423:4c2:7a80 with SMTP id 5b1f17b1804b1-42304c27cabmr78141565e9.5.1718698292647;
        Tue, 18 Jun 2024 01:11:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f2f30925sm183177995e9.0.2024.06.18.01.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 01:11:32 -0700 (PDT)
Message-ID: <ee58a84c-d0a9-4caf-9b97-40a4eaebae3f@tuxon.dev>
Date: Tue, 18 Jun 2024 11:11:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lee@kernel.org, alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <20240615-angler-occupier-6188a3187655@spud>
 <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>
 <20240617-subsoil-creed-04bf5f13d081@spud>
 <0a4ba0e5-3fb1-4ffc-b2d8-a4eb418707eb@tuxon.dev>
 <CAMuHMdXOiuORjLo2nRAFxtXmn5rRm7U-CEHqfX2DoXHmQyfdRQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXOiuORjLo2nRAFxtXmn5rRm7U-CEHqfX2DoXHmQyfdRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 18.06.2024 10:56, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Jun 18, 2024 at 9:34 AM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 17.06.2024 18:19, Conor Dooley wrote:
>>> On Mon, Jun 17, 2024 at 10:02:47AM +0300, claudiu beznea wrote:
>>>> On 15.06.2024 15:17, Conor Dooley wrote:
>>>>> On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
>>>>>> the RTC and the tamper detector. Add documentation for the VBATTB clock
>>>>>> driver.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
>>>>>>  1 file changed, 90 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..ef52a0c0f874
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>>>> +  renesas,vbattb-osc-bypass:
>>>>>> +    description: set when external clock is connected to RTXOUT pin
> 
> FTR, this contradicts the explanation below, which states the external
> clock oscillator is connected to RTXIN.

I agree.

> 
>>>>>> +    type: boolean
>>>>>
>>>>> When you say "external clock", is that an input or an output?
>>>>
>>>> I took that statement from the HW manual. As of the HW manual [1], table
>>>> 42.2, that would be an input.
>>>
>>> Forgive me for not wanting to open the zip etc and find the information
>>> in the document, but why do you need an extra property? Is it not
>>> something you can determine from the clocks/clock-names properties?
>>
>> It can't be determined from clocks/clock-names as of my understanding. It
>> depends on the type of the input clock (crystal oscillator or external
>> hardware device generating the clock).
>>
>>> It sounds like an additional clock from your description, is it actually
>>> different way to provide the second clock you mention above?
>>
>> This is the block diagram (see [1], only picture this time) of the module
>> controlling the clock. Please open it, it helps in understanding what I'll
>> explain above.
>>
>> The VBATTB blocks controlling the VBATTBCLK are:
>> - 32KHz-clock oscillator
>> - the mux controlled by BKSCCR.SOSEL
>> - the gate who's input is the mux output and XOSCCR.OUTEN
>>
>> To the 32 KHz-clock oscillator block could be connected:
>> 1/ either a crystal oscillator in which case it will be connected to both
>> RTXIN and RTXOUT pins (the direction of RTXOUT is wrong in this picture for
>> this case)
>> 2/ or a device (like [2]) generating a clock which has a single output and,
>> from my understanding and experience with devices like this, only RTXIN is
>> needed, RTXOUT is connected to the ground; for this case the 32KHz-clock
>> oscillator block from [1] need to be bypassed in which case the newly
>> introduced property will be used; this will select the XBYP on the mux.
> 
> Sounds similar to the RAA215300 PMIC, which includes an ISL1208-derived
> RTC, where this was handled using two different clock names:
> https://elixir.bootlin.com/linux/v6.10-rc1/source/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml#L49
> https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/rtc/rtc-isl1208.c#L869

Yes, seem similar. I wasn't aware of this approach. I'll switch to it.

Thank  you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


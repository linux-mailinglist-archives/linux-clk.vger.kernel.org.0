Return-Path: <linux-clk+bounces-11601-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 219CB9682D8
	for <lists+linux-clk@lfdr.de>; Mon,  2 Sep 2024 11:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E811F221C0
	for <lists+linux-clk@lfdr.de>; Mon,  2 Sep 2024 09:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2B187340;
	Mon,  2 Sep 2024 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kErcGdlw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34C76035
	for <linux-clk@vger.kernel.org>; Mon,  2 Sep 2024 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268466; cv=none; b=jS9JteNCcKqE0TJNNB0+DoDHc9ZjL/Sf9ZVIUjK8yaXhOy6dnrQGWoreTrIjdTny3O22rMPtqVrqvd5zqm6DaPcQBR9yNvCLdOAAV+Jmwy/TYmeFnIRPLMowhXiN9SuodXigs0ifq+1LzLUS5QOKA5W4svdVQOmlKQxmdZqEJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268466; c=relaxed/simple;
	bh=CLwwzU4EIQlZ/s3tGaoRgNrXmfYqXFVD7MkN0Tco0bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFzIsa7S3FVOUOh5m2yxg1CSGEWlS6Yj/cbtOcoLldq4hqY4s/iVQBzx5wHyjvxgnk5p8ZuucGqqT5/5ckNdXxxcGNHGIMhScODIBPGYYZAEBB1tzgEm7SEwBCs9a7k7O4y+Hcwpll15h997iUqSI6b9K5FbV7Y9QDeKq4Z8I/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kErcGdlw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so24044095e9.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Sep 2024 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725268463; x=1725873263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxdkU1+pKbf+a+BRtbY5Z+XETmzZGfYnOH/WQtAWWcE=;
        b=kErcGdlwBXms3NDjleCTi3JtXdziwrf3MO0eeSXN3oySNxdfSNBs9ATZeLov0A0ZDe
         JJFPM4bARTxHqXbP/ybcRJUhkJm5gWeir7QMeZiJGQ7/VZUXIkM4HGWFH68oiHZXjjGq
         pgb5VQyLTg47HcSkh6UawlcC+nJ89ZuCZnxfIWR1m+C9QTWtJORYcckj9Mk1ANJUiWmr
         tZRIbXxVzeOrYb1vzAbjQQnKzyOb27bWcKMcaWLevq90usLJDN9iGZ5VCdujm9ZPpBOi
         vMwHDza4Ft+WBaumVHojJpe+CNpZ100+lOvX/CosL/iMZbhoZR2byjnnMxtoGeb3rIru
         J7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725268463; x=1725873263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxdkU1+pKbf+a+BRtbY5Z+XETmzZGfYnOH/WQtAWWcE=;
        b=NF4GAQEHA3IcJvO3ixKZTRzJLkDheoODSa2q2W4OSzXoYonaRhAzOwrtJC6bPz1xck
         2rGJTIBwVcUqxlZo84LZS/hpkGbDkcDSBfiCcWRqQY0VgL41Yjf9E2nPwFCeRgsdXFBQ
         EwZgIivcF7L/iu0QP8EIC4E8wYSlGmwNSu+hKak4kSciSjj6y0l+3ldgWukYS1q2vJ4w
         R8pt4yOsDvPZXy2tjp6wmLCcbJIbElrRdoOCqi0JMtYWFCV8Rq7n3GoaROuZ2/bPbcew
         2cKIrMSrecgizFdHsduZuuSb2EDIlTquNY7J55XbCaz/BxV9cDsJAhR4y+Htu2sLqLRg
         9Qrg==
X-Forwarded-Encrypted: i=1; AJvYcCVHw9dVo73HLsrrMPAdpgoUkXEeWmPlVbK1ZVnRwhVeT1lzwg5cXsIdlZwBYIxoXJdsMUQleiP9bUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6aUs4lS/mlQhMUn0TfaG59OFL7iHNJz++jfaqgOcOs8WVYot
	9B+Pvdi0qFGx+wJ4skeZlJoXwQEEEtj6B9ZOe85BdwTdF4GU6L06SFXRApOjrlw=
X-Google-Smtp-Source: AGHT+IE4d+OITY2JYSs2Z+/iUXJp9r4lxRIltWsPs5zH8YLw57OCbZp1adMKBrEY/Z1/VuppZIl79Q==
X-Received: by 2002:a05:600c:46c5:b0:429:c771:f32f with SMTP id 5b1f17b1804b1-42bb01fd939mr82161175e9.36.1725268462974;
        Mon, 02 Sep 2024 02:14:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639643esm167916045e9.1.2024.09.02.02.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:14:22 -0700 (PDT)
Message-ID: <590a4fb2-24b2-432b-92db-534c5a52ed0b@tuxon.dev>
Date: Mon, 2 Sep 2024 12:14:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
 "kishon@kernel.org" <kishon@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev>
 <TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113467275C519B729FCAB1ACB86922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5556d176-cca7-492c-ba21-48256d5d6338@tuxon.dev>
 <TY3PR01MB113464D53083F4C8A5DBBA36586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113464D53083F4C8A5DBBA36586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02.09.2024 11:53, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Monday, September 2, 2024 9:47 AM
>> Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
>>
>> Hi, Biju,
>>
>> On 02.09.2024 10:54, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Biju Das
>>>> Sent: Saturday, August 31, 2024 6:14 AM
>>>> Subject: RE: [PATCH 00/16] Add initial USB support for the Renesas
>>>> RZ/G3S SoC
>>>>
>>>> Hi Claudiu,
>>>>
>>>>> -----Original Message-----
>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>> Sent: Friday, August 30, 2024 9:23 AM
>>>>> Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas
>>>>> RZ/G3S SoC
>>>>>
>>>>> Hi, Ulf,
>>>>>
>>>>> On 29.08.2024 18:26, Ulf Hansson wrote:
>>>>>> On Thu, 22 Aug 2024 at 17:28, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>>>
>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Series adds initial USB support for the Renesas RZ/G3S SoC.
>>>>>>>
>>>>>>> Series is split as follows:
>>>>>>>
>>>>>>> - patch 01/16           - add clock reset and power domain support for USB
>>>>>>> - patch 02-04/16        - add reset control support for a USB signal
>>>>>>>                           that need to be controlled before/after
>>>>>>>                           the power to USB area is turned on/off.
>>>>>>>
>>>>>>>                           Philipp, Ulf, Geert, all,
>>>>>>>
>>>>>>>                           I detailed my approach for this in patch
>>>>>>>                           04/16, please have a look and let me know
>>>>>>>                           your input.
>>>>>>
>>>>>> I have looked briefly. Your suggested approach may work, but I have
>>>>>> a few thoughts, see below.
>>>>>>
>>>>>> If I understand correctly, it is the consumer driver for the device
>>>>>> that is attached to the USB power domain that becomes responsible
>>>>>> for asserting/de-asserting this new signal. Right?
>>>>>
>>>>> Right!
>>>>>
>>>>>>
>>>>>> In this regard, please note that the consumer driver doesn't really
>>>>>> know when the power domain really gets powered-on/off. Calling
>>>>>> pm_runtime_get|put*() is dealing with the reference counting. For
>>>>>> example, a call to pm_runtime_get*() just makes sure that the PM
>>>>>> domain gets-or-remains powered-on. Could this be a problem from the
>>>>>> reset-signal point of view?
>>>>>
>>>>> It should be safe. From the HW manual I understand the hardware
>>>>> block is something like the
>>>> following:
>>>>>
>>>>>
>>>>>                   USB area
>>>>>          +-------------------------+
>>>>>          |                         |
>>>>>          | PHY --->USB controller  |
>>>>> SYSC --> |  ^                      |
>>>>>          |  |                      |
>>>>>          | PHY reset               |
>>>>>          +-------------------------+
>>>>
>>>> How USB PWRRDY signal is connected to USB?
>>>>
>>>> USB block consists of PHY control, PHY, USB HOST and USB OTG Controller IPs.
>>>>
>>>> Is it connected to top level block or connected to each IP's for turning off the USB region power?
>>>>
>>>> ? Or Just PHY (HW manual mentions for AWO, the USB PWRRDY signal->USB PHY PWRRDY signal control)?
>>>
>>> As per the update from HW team,
>>>
>>> "SYS_USB_PWRRDY and SYS_PCIE_RST_RSM_B are used when transition from ALL_ON to AWO (or from AWO to
>> ALL_ON).
>>>
>>> Refer to step 8,9 in Table 41.10 Example Transition Flow Outline from ALL_ON Mode to AWO Mode.
>>> Refer to step 9,10 in Table 41.11 Example Transition Flow Outline from AWO Mode to ALL_ON Mode.
>>
>> All this is not new information.
>>
>> From experiments, we need to control these signals also when booting as intermediary booting
>> application may control and leave it in improper state. W/o having SYSC signals configured properly
>> there is no chance for USB to work (it should be the same for PCIe but I haven't explored it yet).
>>
>>>
>>> When turning off USB PHY and PCIe PHY, if they are not controlled, PHY may break."
>>
>> From experiments, I know this, as this is the reason the SYSC USB PWRRDY has been implemented in Linux
>> and proposed in this series.
> 
> You mean you call reset assert for USB PWRRDY signal for system transition (AWO Mode to ALL_ON Mode)??

reset assert on suspend, reset de-assert on resume.

And pm_runtime_put()/pm_runtime_resume_and_get() on the version where USB
PHYRDY is provided by SYSC as a PM domain. As I mentioned in the thread
with Ulf, this is something I explored locally.

All these are internal, not published in this version. This version just
adds initial bring-up support.

> 
> 
>  
>>>
>>> Do you have any plan to control this power transitions(ALL_ON to AWO and vice versa) in linux?
>>
>> As you know, the RZ/G3S USB PM code is already prepared. This is also configuring these signals when
>> going to suspend/exiting from resume. W/o configuring properly these signals the USB is not working
>> after a suspend/resume cycle.
> 
> One option is to handle SYSC USB PWRRDY signal in TF-A, if you plan to handle system transitions there??

As I mentioned, the settings in these registers may be changed by
intermediary booting applications. Depending on that, Linux need to control
it also on probe for USB to work (it should be the same with PCIe, these
signals seems similar from HW manual description).

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
> 
> 


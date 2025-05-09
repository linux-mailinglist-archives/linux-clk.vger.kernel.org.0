Return-Path: <linux-clk+bounces-21632-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66938AB10C4
	for <lists+linux-clk@lfdr.de>; Fri,  9 May 2025 12:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F0DB2604D
	for <lists+linux-clk@lfdr.de>; Fri,  9 May 2025 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E8828F51B;
	Fri,  9 May 2025 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pAWqfbGD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CD28ECFE
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786597; cv=none; b=OVnPMt+oXl0fwB4dgcwMT4ghTFT/vXRSgdvbgpLNVamq9nKAlipXcS2UI+S+CGxeQjj5cbNcWiEv+rjUJx0+9ha6JufUZSkZlD6KWlO4jVFhaqkVn0ywWNR4RpIGctrw30Osme38I/1f1Lh/IZfeAixxIk6iyIvIHIDrsRrp79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786597; c=relaxed/simple;
	bh=Bgh8+VpXWqodyRXBeHA1Dsg9667GzQ82hiWcMQGPrYY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e+OFRaaFrg/p8XseoILQz8dsuhUGL8D3Bz5yBK8G4lbDzG0c6UIATC9+gHHIzWAJCq/Qm3BK7IuqQIoVERqCVJ1Anjgut5oJeG7Z3uH4f3kfId6qP0+oBj/rpPqnvtSlnyrBjMxTuEqWdsFpdyb7oq6onvp3suq45FD0GIsFfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pAWqfbGD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso3561048a12.3
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746786594; x=1747391394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=pAWqfbGDBnDsKif5iRYoKd+rCqJVTeWTw5agl7ZUAmb0ll2DBHJftcpc85EOBft4At
         8D0GKs7rugetXjfHN+ZgNJC4F9GyA/aAsJeRBIEizbtesz5GCxl+/FeuaDHdDgjGYyt6
         BylJ7vQN4d9dIXw7sVxyne6ZlNDYONQb6kTSRwY4jLOIUGGfg4t+0/nRkvDf2LSdaAoN
         qb0XfEQiS/46bVmMHYXnPCUGXCt1L9cYR45nI7lAnem3hMc0kMH+WCLs78tZNDrhvNPo
         GL/51m7uefnDXNemfwbUY/EV5YPNR3kRUN/DfLkmA6GZNu4f0FkCh0+HA8ZFtOqBkUuo
         HtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786594; x=1747391394;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxDhZkSCewSzQX7ua1xIREYWkVFp8sJWfjRRBdflZuc=;
        b=LoxdhWR7p8iJx27pNmGQUuJBS7UjbYukfXkc3oYFlslRHx5VfJxYcbgCwLaol6EIX1
         kgOrO50PXwvCHUzM3yfpJB388/uTnUUO7YG3yhk/SKHX6qS265Y6gf8frmyYJ7Uq6cRw
         tRsIIExa4asoNwuLzXH9ldeqA/nBLRsKoH2tS59xS+hqArFKWBDrD41MZCo0sLhqNinz
         GXRF4v8mKLj81faokPk7ryHG3lAzNtt78KiiH0ZqH/sIop1ejozG2b3rn8qAIAUMiSjS
         SKijK1HWpRADd/cwtBhhpdCYBCJHIuyLKGyPMpSeDntuLOADuNuCHW+CCgBb815LpcCq
         QWkg==
X-Forwarded-Encrypted: i=1; AJvYcCVyeWR8bStLZAyrV0DjZv2TqSS5epdZltmRC/stfKkqaU44cVxqczjFfUICFrSqrotRPiTf5j48cTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+kU78WsP3m9VwQYXUs/ERFvXHAHb5kyl3d6zZB2Q5Mk/sByA
	THhhfoEAydsFY1xgNKNOQ5amW1HorMmamytxOiVuX/o8DuCcC3m/lVsovpBWPKB6l9uRyUbdifp
	9
X-Gm-Gg: ASbGncsrbKQTUTRqRvL1vn6giuREW8/XUHPxwoizz9uL/LefHh/ol0d+g/plMT+bIVi
	y8eP9YI7ghj6mBWeZQXQXq9oUXtsTjrG01CvgpEVpyEws7ytzAZ44HsMzVLXTZqaUVxb2vU9/8n
	WC4e2rzNnCJ2k4o8KnC7+3L/RaQ5R+wkG5x+z9du4jrehlWuPCNTvNceoQFRcXrFCn/rKT1Pmjn
	/aWokOnO3D3rjlqcJtY6vQNbafrSRCKgpEC9oq1cbNnxDWYSBlUHYpP/jlyXMj2KoVSII3cFJAU
	hjvkEj0dmkOPXD0VveJaOKr0qdcxrHMMx+NSRBLGHommBFIDJf3Js9/cg6I=
X-Google-Smtp-Source: AGHT+IEJa8UJZWqTw9Q0EAr9PxAZseg++6SUc4a2N49f6rYLuvjP7U+hvo7avLnkTy2C6pjkRuSQbA==
X-Received: by 2002:a17:906:c102:b0:acb:711d:36c8 with SMTP id a640c23a62f3a-ad219170decmr305473466b.38.1746786583223;
        Fri, 09 May 2025 03:29:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd3easm129122566b.147.2025.05.09.03.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:29:42 -0700 (PDT)
Message-ID: <869269a7-8267-45f3-9e4d-678de18c0888@tuxon.dev>
Date: Fri, 9 May 2025 13:29:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250501201211.GA768334@bhelgaas>
 <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Language: en-US
In-Reply-To: <26bdfbd6-7bf5-4688-b793-5d0f613d340b@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 05.05.2025 14:26, Claudiu Beznea wrote:
> Hi, Bjorn,
> 
> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>> only as a root complex, with a single-lane (x1) configuration. The
>>> controller includes Type 1 configuration registers, as well as IP
>>> specific registers (called AXI registers) required for various adjustments.
>>>
>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>> host driver can be reused for these variants with minimal adjustments.
>>
>> I guess this current driver only supports RZ/GS3 in Root Complex mode?
> 
> That's right.
> 
>> If so, I don't think this paragraph is necessary or really relevant.
> 
> OK, I'll drop it.
> 
>>
>>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>>> @@ -0,0 +1,1561 @@
>>
>> I can't figure out the line width you're using.  Generally code in
>> drivers/pci/ is formatted to fit in 80 columns.  Much of this file is
>> formatted for that, but there are many cases that seem to use 90 or
>> 100 columns.
> 
> I formated it at 100 columns where the lines were longer. I wasn't aware
> the PCI rule is to have line formated at 80 columns. I'll switch to it in
> the next version.
> 
>>
>> For single-line comments that are not a sentence or are a single
>> sentence, it's typical to omit the period at end.
> 
> I'll follow this rule, too.
> 
>>
>>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(base + offset);
>>> +	tmp &= ~mask;
>>> +	tmp |= val & mask;
>>> +	writel(tmp, base + offset);
>>> +}
>>
>> Nothing rzg3s-specific here.
>>
>> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
> 
> I wasn't aware of it. I'll use it in the next version. Thank for pointing it.

I look into changing to u32p_replace_bits() but this one needs a mask that
can be verified at build time. It cannot be used directly in this function.
Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:

tmp = readl();
u32p_replace_bits(&tmp, ...)
writel(tmp);

or is it OK for you to keep it as is?

Thank you,
Claudiu


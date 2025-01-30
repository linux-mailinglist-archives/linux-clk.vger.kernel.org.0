Return-Path: <linux-clk+bounces-17544-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E82A232EE
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2025 18:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DF3188693E
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2025 17:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0AF1EE7D8;
	Thu, 30 Jan 2025 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dDQX9FKQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69E1EE00F
	for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258359; cv=none; b=gdYFQw/H/72i7vGPbecqSnq7X/dxbWh8nvXcMGBvLhLkcIV7IyIZNR+HmktpwrsLi10lozikhK2kz/zGAby+x7kd86RiZJA0rSv7SBCzKb7DR0HcDJlGnYV9kMknoSnim0ZCBg30xEHFJztbBy7tJjdN+Se1H/So7VcT1oXVO2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258359; c=relaxed/simple;
	bh=hT7kPUT71Rn2wgaiKE56N2bGMy3aiQWOQ7ryplZAs4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tElRtDIR8TjsoWzLbDppbOwJZ+JneToQscTtRe4sBpXsYQRLQf9eLd7kwGec8Hk1E+TrYb2HJxn2AgCj+HULw6952ajqJt6qTU/DLTYl42GDPo+3ia/EPsa4u9fsOFjkm35eHfutNJiBnZfaeKDH4x7dqBHffPvpVLZDSuqN9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dDQX9FKQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so1024892f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738258355; x=1738863155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKM3RWBudOMOvAAaqh0C7cledBNgLwcsgWWCL/oBsw8=;
        b=dDQX9FKQw+x1gmzfvZHJPoXCQfkZicTBfIN8TEk6wDTi7faWREltQyd3H9SZZbQRYG
         5t5wlBaPLC8y3GZwffQjvdy78aa8QLnSQ1eirtd3BXU79NzbtPP9AHkPgBNjXCfDLOEv
         nCxsqBFYK3SPJSXHz3hZawHjNvDNfA96WedkGWrxv68En/gv32NUo3yU9x5hJVd9o8H+
         Uq+7ZzebllVzRXs7eOggrnPqphjbAD5CyEFyzlbHVjvlb4+uWjrLTHh1F8I3Yxj/dWuC
         NJ9Gn1M+8CNmMhgE51qWZ7olpqmxoRtL8XM7h55tny9JQaMt2BxpzRiPt9lj5Ngm0lmC
         9uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258355; x=1738863155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKM3RWBudOMOvAAaqh0C7cledBNgLwcsgWWCL/oBsw8=;
        b=sVgq5w61SN/B1qEAdOKUMbLAHIWEsFw40pRFTp7HA7ScmXl5Yk8Vn4PhQOFAzZAvf9
         QEmcks+tQLgVL69LGVVzGvIoGK7QKWIm6WC0VZFGSxOMOFduC8DTizVi6YxNdNQP69CO
         C74oBpiwElnx8t1RLx7ElL1N9CbRTumu5CE5Qv2Q2ZvWNPl1JzeFDdhjtLf08XuRVsas
         uPaG3uS/4UWf9IBthTtO47BYYjCgBihHkyhIaGXFoYx7sNgE8+B7m722WRyT4zWCCXOJ
         BVUqTlYOBn0WOhPakK4fGGPSkIX2iLZMOo61v9srq9a0CaCFuwgqyIiiWTYz7RXyYzA5
         p69Q==
X-Forwarded-Encrypted: i=1; AJvYcCXd80Z5vuyJbn1NiHso8qXn3C4mYxqmo7EnSPk0l9NRW/IrisfXuW4oqFo5Hz157solwLFK7IWC4PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqoW0d1VDl7GAWhRp4NixcejH89+zLsXDY5HB2NoB9MafqEg6I
	2jfCaKnK3imNw/fYTIz4m0unLmNSzDFtu0qcDDuRDoGcoxxpUbpq6f11qbVQoQk=
X-Gm-Gg: ASbGncuVlUXQivgrsLig4mBYhOVbfvH+ckbKTLQviLq0f9Woxwk5rsyuo/Hg1D8AafW
	buyIeCqw+3wTbQNlvB//JoDKTZOtHe0CyRI1FbEhy4FwWNCf6F1cOwm440H2GCdu6OQYktNG61m
	PnLRZ2MHotSt4yyREz54gFxVR7lo7x94ZWBJAIsidg6VbT7ycCAgPVDrldIpdN6kS1AO7TruwS9
	ZIvdMmN2OoKsalVkVcuf51RpE8Robfeq9HkoPMTmU1Wzkp94/5twycSXcq9HzX6/0sLJqhpcnuS
	B20T3FGquPi8IEtTay+m1I08
X-Google-Smtp-Source: AGHT+IG0JtM8ysE8yCX0gXJFKaojoUHoYmkNQfMIe/tVvsLydgMxPhUkmT/xfpvP3KXVGI9I0CFgmA==
X-Received: by 2002:a5d:6d09:0:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38c5209128bmr6322840f8f.42.1738258355362;
        Thu, 30 Jan 2025 09:32:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bdbsm2538261f8f.28.2025.01.30.09.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:32:34 -0800 (PST)
Message-ID: <2d5be56d-4334-4ad3-a98b-33d3a86f028a@tuxon.dev>
Date: Thu, 30 Jan 2025 19:32:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
 <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30.01.2025 19:24, Daniel Lezcano wrote:
> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>
>>
>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>> Hi, Daniel,
> 
> [ ... ]
> 
>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>> after the
>>>>> clock is enabled ?
>>>>
>>>> There is nothing about this mentioned about this in the HW manual of the
>>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>>> - wait at least 3us after each IIO channel read
>>>> - wait at least 30us after enabling the sensor
>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>
>>>> For this I chose to have it implemented as proposed.
>>>
>>> IMO, disabling/enabling the clock between two reads through the pm
>>> runtime may
>>> not be a good thing, especially if the system enters a thermal situation
>>> where
>>> it has to mitigate.
>>>
>>> Without any testing capturing the temperatures and compare between the
>>> always-on
>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>> that or
>>> not. If you think it is fine, then let's go with it.
>>
>> I tested it with and w/o the runtime PM and on/off support (so, everything
>> ON from the probe) and the reported temperature values were similar.
> 
> 
> Did you remove the roundup to 0.5°C ?

No, the roundup was present in both tested versions.

Thank you,
Claudiu

> 
> 



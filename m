Return-Path: <linux-clk+bounces-8599-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92746915DEC
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 07:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB71F22A5C
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2024 05:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0000D1442F2;
	Tue, 25 Jun 2024 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qrP3uHEz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A914388D
	for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719292028; cv=none; b=Bqio1WZ32a5uk75t52Ek6DpTpPPGaZ+CMoGULCLA5TvyslMJ8VHcgcSem2UZR6pesMYkTGyA8e0wHf3kcBchU2pbNsB98LqStk4My4oMzW6Mh/DLj+tGkevOLQN2QPnRo5TXIdf+r7k3xlJLpg+SnXDDIKYZcs2z71QbJXSY0xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719292028; c=relaxed/simple;
	bh=XFnA16kYW5gGBpSDrWeOV5VEpEAexRRRucWlNmOgnjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAZXv5jgoNrN1nnIhwvNWr+PtCmpFGSOFKMza06HukgiVHkiNaHcx7BjDRDan5trO7Zj2XDn2YZiIvd199QdYfH6REVTmenhHLU/oinpfZHTqnUhJYQbZEMCkVAm9924ztL6FzNb3FBROXQnswBVkUbcooeQGD4M8/jTEbl4QMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qrP3uHEz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5295e488248so5736411e87.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719292024; x=1719896824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMTfoPJSp/wlWQYq7ramEp8kDhcvFWSvsJvWkHGYsCg=;
        b=qrP3uHEzfNLNzM2yRBsn4IrZUYI+bNIFcB1A+Wn0rAhuZDg0ulZv2VOB58bK0QGkjW
         19LtbjxRhflLujofe+2Bu4+kflhzVXoOidNHWTcQWu1FF6o2A0xmSR20YGk/84lPEkb3
         X/IdGBbEuvbQULId5SojIBaw4ifrx6p2A5SXw3KJQMLcONfKB8aotKL1TK1/DjhIQl+i
         b7OeJrceaUb2fn825ntM+I6bZ9Lm22zfETIZrS5DN1ukIBHXYA4YQv84e4nKaveJPJAM
         cWxSMYwlb0CmG5YBLpi5KLgJ4KkSttGgClXktgbfq822xCHOoqDyiOg6hLNSuOHi1tre
         2/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719292024; x=1719896824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMTfoPJSp/wlWQYq7ramEp8kDhcvFWSvsJvWkHGYsCg=;
        b=DnWXGFym1SUAqTL3TQ++Agf22KNMkw7KnJUcGASkERBh6e2cztbPod3qguPlWMEMiJ
         zdR/g4izdtdKNJhluVg856nKji+u9J+S65n+oPUj1PyF28rf0+mqC2ps3DZUOsLvPpLJ
         08rRrae2PSkJNhg/bp7lwgFDCacBzyjojeaPYKxvzGectkSIMiM6uncGxZOfa31Ju/NC
         RJBYNfDnVtr5iZHQn/O6kg2YMQUsNfs0oiiHpl2GmPHsCLxs416fHqBv6KUHl1jP7Ode
         vE3mJAIYs3PrKjA9bkmLntnZtn4RI6ly2yn0V2zukT2pArYeYjQdglsBkHlC4wDrbD0C
         iBXA==
X-Forwarded-Encrypted: i=1; AJvYcCWH8n4bZdNESlhBGjyNltUtt4BpaePa26S5lIs+3fyerHwxMBBUVgXGILPZO1mlz7d/a9f5TTwkHtA5T/+/1c1k5C5FtIiRSAKB
X-Gm-Message-State: AOJu0Yw0b58sGJvqpkUHcwstYxbcNL1/BTIeib0x65QBcenchevjbZwZ
	mPx6oZuR4kQgLrRcPsWNX93yLDeEye3PUWAiFVSI7fVdk1dIlpdSETmE5C+haJs=
X-Google-Smtp-Source: AGHT+IG7HDx2+AdxqahzNH7iyEFC9rGrJpKDudbwOlrJIC/1s7QOXQZz7eUKgfpp4ZPXuAssY8mYtA==
X-Received: by 2002:a05:6512:2355:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-52ce1832bffmr3986238e87.14.1719292024114;
        Mon, 24 Jun 2024 22:07:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4249b4232f9sm6119065e9.0.2024.06.24.22.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 22:07:03 -0700 (PDT)
Message-ID: <908ff65d-e9f0-47c2-94ab-47cac3aa58ce@tuxon.dev>
Date: Tue, 25 Jun 2024 08:07:00 +0300
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 24.06.2024 18:40, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Jun 21, 2024 at 1:23 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
>> the version available on Renesas RZ/V2H (R9A09G075). Most of the IP
>> variants that the RIIC driver is working with supports fast mode plus.
>> However, it happens that on the same SoC to have IP instatiations that
>> support fast mode plus as well as IP instantiation that doesn't support
>> it. For this, introduced the renesas,riic-no-fast-mode-plus property.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> @@ -25,6 +25,10 @@ properties:
>>                - renesas,riic-r9a07g054  # RZ/V2L
>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>
>> +      - items:
>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>> +          - const: renesas,riic-r9a09g057
>> +
> 
> LGTM.
> 
>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>
>>    reg:
>> @@ -66,6 +70,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>
>> +  renesas,riic-no-fast-mode-plus:
>> +    description: specifies if fast mode plus is not supported
>> +    type: boolean
>> +
> 
> Do you really need this?
> The bus' clock-frequency property should take into account the combined
> capabilities of all of controller, target, and wiring.  It is up to the
> DTS writer to validate that all timing conditions are met.

On a second thought, I tend to agree with you on this.

I added it to comply with "chapter 47.5.15 I2C Bus Interface Access
Timing, note 7, Tfmin cannot meet the specification in fast-mode plus for
the RIIC ch2 and ch3" statement from hw manual.

Thank you,
Claudiu Beznea

> 
>>  required:
>>    - compatible
>>    - reg
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

